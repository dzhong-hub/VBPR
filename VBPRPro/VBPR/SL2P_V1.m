function sl2p_v_01(varargin)

%% 1. Initialization
if ~ismember(nargin,[2,3]), disp({'!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!ERROR!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';'--usage : Matlab SL2P [input_path\] [S2 tiff data folder] [output_path\ (optional)]'});return; end;

addpath(genpath('.\tools'));


bio_vars={'LAI','FCOVER','FAPAR','LAI_Cab','LAI_Cw'};
BIO_VAR_bounding_box=importdata('aux_data\BIO_VAR_bounding_box.mat');

file_name=dir([varargin{1},varargin{2},'\S2*B3.tif']);
file_name=file_name(1).name(1:end-6);

if nargin==3,   out_path=[varargin{3},strrep(varargin{2},'L2A','L2B'),'\'];
    else,out_path=[varargin{1},strrep(varargin{2},'L2A','L2B'),'\'];
end;
if ~isfolder(out_path), mkdir (out_path); end;   
%% 2.1 Loading data........................................................
disp({'===============',file_name,'==============='});
disp({'--Loading data--------------------------------------'});
Input_NNT=[]; 
h = waitbar(0,'Loading data...');
for bb={'B3','B4','B5','B6','B7','B8A','B11','B12','view_zenith_mean','sun_zenith','view_azimuth_mean','sun_azimuth'}
    waitbar(size(Input_NNT,2)/11)
    file_name_band=[file_name,char(bb),'.tif'];
    [band,xb,yb,Ib] = geoimread([varargin{1},varargin{2},'\',file_name_band]);
    [r,c]=size(band);
    Input_NNT= [Input_NNT,double(reshape(band,r*c,1))]; 
end;
%% 2.2 Adding image cordinates
Input_NNT=[reshape((1:r)'*ones(1,c),r*c,1),reshape(ones(1,r)'*(1:c),r*c,1),Input_NNT];
%% 2.3 Organizing input data for NNET (NNET_IN)
Input_NNT(:,end-1)=abs(Input_NNT(:,end-1)-Input_NNT(:,end));Input_NNT(:,end)=[];
Input_NNT(:,3:end-3)=Input_NNT(:,3:end-3)/10000;
Input_NNT(:,end-2:end)=cos(deg2rad(Input_NNT(:,end-2:end))); 
NNT_IN=Input_NNT(:,3:end)';

close(h)
%% 2.4 Computing input_flags 
input_out_of_range=input_out_of_range_flag_function(Input_NNT(:,3:end-3),r,c);
%% 2.5 Creating no_bare_soil_or_vegetated_area flag
file_name_band=[file_name,'quality_scene_classification.tif'];
[band,xb,yb,Ib] = geoimread([varargin{1},varargin{2},'\',file_name_band]);
band(~ismember(band,[4,5]))=1;
band(ismember(band,[4,5]))=0;
no_bare_soil_or_vegetated_area=band;
%% 3. Loading NET
disp({'--Loading NNET--------------------------------------'});
NET_estim=importdata('aux_data\SL2P_NETs.mat');
NET_estim=importdata('aux_data\SL2PMasterNet.mat');
NET_uncer=importdata('aux_data\SL2P_uncert_NETs.mat');
NET_uncer=importdata('aux_data\SL2PMasterNetIncertitudes.mat');

%% 5. Simulating biophysical parameters (SL2P).....................................
disp({'--Simulating vegetation biophysical variables ------'});
NNT_OUT=[];
for ivar=1:length(bio_vars),
    waitbar(ivar/length(bio_vars))
    bio=bio_vars{ivar};
    bio_sim= [Input_NNT(:,1:2),NaN+Input_NNT(:,1)];

    eval(['NET_ivar= NET_estim.',bio,'.NET;']);    
    %bio_sim (:,3)= sim(NET_ivar, NNT_IN)';
    bio_sim (:,3)= NET_ivar(NNT_IN)';  
    
    eval(['NET_unc= NET_uncer.',bio,'.NET;']);
    %eval(['ps= NET_uncer.',bio,'.Norm_Input;']);
    %eval(['ts= NET_uncer.',bio,'.Norm_Output;']);

    %NNT_IN_P=mapminmax('apply',NNT_IN,ps);
    %bio_sim (:,4)= mapminmax('reverse',sim(NET_unc, NNT_IN_P),ts)';
    bio_sim(:,4)= NET_unc(NNT_IN)';  
    %% Creating output_thresholded_to_min/max_outpout flag
    eval(['bounding_box=BIO_VAR_bounding_box.',bio,';']);
    output_thresholded_to_min_outpout=0*bio_sim(:,3);
    output_thresholded_to_min_outpout(find(bio_sim(:,3)<bounding_box.Pmin & bio_sim(:,3)>=bounding_box.Pmin-bounding_box.Tolerance),:)=1;
    output_thresholded_to_min_outpout= reshape(output_thresholded_to_min_outpout,r,c);
    bio_sim(find(bio_sim(:,3)<bounding_box.Pmin & bio_sim(:,3)>=bounding_box.Pmin-bounding_box.Tolerance),3)=bounding_box.Pmin;
    
    output_thresholded_to_max_outpout=0*bio_sim(:,3);
    output_thresholded_to_max_outpout(find(bio_sim(:,3)>bounding_box.Pmax & bio_sim(:,3)<=bounding_box.Pmax+bounding_box.Tolerance),:)=1;
    output_thresholded_to_max_outpout= reshape(output_thresholded_to_max_outpout,r,c);
    bio_sim(find(bio_sim(:,3)>bounding_box.Pmax & bio_sim(:,3)<=bounding_box.Pmax+bounding_box.Tolerance),3)=bounding_box.Pmax;
     
    %% Creating output too low/high flag
    output_too_low=0*bio_sim(:,3);
    output_too_low(find(bio_sim(:,3)<bounding_box.Pmin-bounding_box.Tolerance),:)=1;
    output_too_low= reshape(output_too_low,r,c);

    output_too_high=0*bio_sim(:,3);
    output_too_high(find(bio_sim(:,3)>bounding_box.Pmax+bounding_box.Tolerance),:)=1;
    output_too_high= reshape(output_too_high,r,c);
    %% *********
    flags=(2^0)*input_out_of_range+(2^1)*output_thresholded_to_min_outpout+(2^2)*output_thresholded_to_max_outpout+...
        (2^3)*output_too_low+(2^4)*output_too_high;

    eval(['NNT_OUT.',lower(bio),'=reshape(bio_sim(:,3),r,c);']);
    eval(['NNT_OUT.',lower(bio),'_Uncertainties=reshape(bio_sim(:,4),r,c);']);
    eval(['NNT_OUT.',lower(bio),'_flags=flags;']);
    
    eval(['NNT_OUT.',lower(bio),'_input_out_of_range= input_out_of_range;']);
    eval(['NNT_OUT.',lower(bio),'_output_thresholded_to_min_outpout= output_thresholded_to_min_outpout;']);
    eval(['NNT_OUT.',lower(bio),'_output_thresholded_to_max_outpout= output_thresholded_to_max_outpout;']);
    eval(['NNT_OUT.',lower(bio),'_output_too_low= output_too_low;']);
    eval(['NNT_OUT.',lower(bio),'_output_too_high= output_too_high;']);
    eval(['NNT_OUT.no_bare_soil_or_vegetated_area= no_bare_soil_or_vegetated_area;']);

    %% exporting tif files
    bbox=Ib.BoundingBox;
    utmzone=strsplit(Ib.GeoAsciiParamsTag,' ');
    utmzone=utmzone{6};utmzone=[utmzone(1:2),' ',utmzone(3)];
    [bbox(:,2),bbox(:,1)] = utm2deg(bbox(:,1),bbox(:,2),[utmzone;utmzone]);
    bit_depth=32;
    geotiffwrite([out_path,strrep(file_name,'L2A','L2B'),lower(bio),'.tif'], bbox, eval(['NNT_OUT.',lower(bio)]), bit_depth, Ib);
    geotiffwrite([out_path,strrep(file_name,'L2A','L2B'),lower(bio),'_uncertainties.tif'], bbox, eval(['NNT_OUT.',lower(bio),'_Uncertainties']), bit_depth, Ib);
    geotiffwrite([out_path,strrep(file_name,'L2A','L2B'),lower(bio),'_flags.tif'], bbox, eval(['NNT_OUT.',lower(bio),'_flags']), bit_depth, Ib);       
end;
save([out_path,strrep(file_name(1:end-1),'L2A','L2B'),'.mat'],'NNT_OUT','-v7.3');
close(h)
end


