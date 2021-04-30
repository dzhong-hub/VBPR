function VBPR_BySL2P_V1(in_path, ang_path, xmlfile, out_path, vbp)
%
% VBPR by SL2P
%
% Input:
%   in_path - input path to Sentinel-2 images
%   ang_path - input path to the view angle data
%   xmlfile - granule XML file
%   out_path - output data path
%   vbp - options for which BP to be calculated (default is All.
% Output:
%   VBPR results files in the output data folder
%

global stop_processing;
stop_processing = 0;

%% 1. Initialization
if strcmp(vbp,'ALL')
    bio_vars={'LAI','FCOVER','FAPAR','LAI_Cab','LAI_Cw'};
else
    bio_vars = {vbp};
end
BIO_VAR_bounding_box=importdata('aux_data\BIO_VAR_bounding_box.mat');

%% define resulution
img_fnames = dir([in_path '*2A*.tif']);
img_fnames = {img_fnames(~[img_fnames.isdir]).name};
if contains(img_fnames{3},'10m')
    res = '10m';
elseif contains(img_fnames{3},'20m')
    res = '20m';
end

%% determine the output file name
if exist(xmlfile,'file')
    [path,filename,ext] = fileparts(xmlfile);
else
    filename = xmlfile;
end

%% 2.1 Loading data........................................................
disp({'===============',filename,'==============='});
disp({'--Loading data--------------------------------------'});

h = waitbar(0,'Loading data...');

%% read in the image band data
Input_NNT=[];
file_name=dir([in_path,'\*B03_' res '.tif']);
file_name=file_name(1).name;
for bb={'B03','B04','B05','B06','B07','B8A','B11','B12'}
    file_name_band=strrep(file_name,'B03',char(bb));
    [band,xb,yb,Ib] = geoimread([in_path,'\',file_name_band]);
    [r,c]=size(band);
    Input_NNT= [Input_NNT,double(reshape(band,r*c,1))]; 
end
waitbar(1/3)
% read in the view angle data
file_name=dir([ang_path,'\*sensor_azimuth_' res '.tif']);
file_name=file_name(1).name;
for bb={'sensor_zenith','solar_zenith','sensor_azimuth','solar_azimuth'}
    file_name_band=strrep(file_name,'sensor_azimuth',char(bb));
    [band,xb,yb,Ib] = geoimread([ang_path,'\',file_name_band]);
    [r,c]=size(band);
    Input_NNT= [Input_NNT,double(reshape(band,r*c,1))]; 
end

%% 2.2 Adding image cordinates
Input_NNT=[reshape((1:r)'*ones(1,c),r*c,1),reshape(ones(1,r)'*(1:c),r*c,1),Input_NNT];

%% 2.3 Organizing input data for NNET (NNET_IN)
Input_NNT(:,end-1)=abs(Input_NNT(:,end-1)-Input_NNT(:,end));Input_NNT(:,end)=[];
Input_NNT(:,3:end-3)=Input_NNT(:,3:end-3)/10000;
Input_NNT(:,end-2:end)=cos(deg2rad(Input_NNT(:,end-2:end))); 
NNT_IN=Input_NNT(:,3:end)';
waitbar(3/3)
close(h)

%% 2.4 Computing input_flags 
input_out_of_range=input_out_of_range_flag_function(Input_NNT(:,3:end-3),r,c);

% %% 2.5 Creating no_bare_soil_or_vegetated_area flag
% % read in the quality scene classification data
% file_name=dir([in_path,'\*SCL*' res '.tif']);
% file_name=file_name(1).name;
% [band,xb,yb,Ib] = geoimread([in_path,'\',file_name]);
% band(~ismember(band,[4,5]))=1;
% band(ismember(band,[4,5]))=0;
% no_bare_soil_or_vegetated_area=band;

%% 3. Loading NET
disp({'--Loading NNET--------------------------------------'});
NET_estim=importdata('SL2P_NETs.mat');
NET_estim=importdata('SL2PMasterNet.mat');
NET_uncer=importdata('SL2P_uncert_NETs.mat');
NET_uncer=importdata('SL2PMasterNetIncertitudes.mat');


%% 5. Simulating biophysical parameters (SL2P).....................................
disp({'--Simulating vegetation biophysical variables ------'});
h = waitbar(0,'Simulating bio- variables...');
NNT_OUT=[];
for ivar=1:length(bio_vars)    
    %% check if the processing was stopped mannually
    if stop_processing == 1
        logmsg(fid1,handles,'The processing was stopped manually.');
        fclose(fid1);
        return;
    end
    
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
    %eval(['NNT_OUT.no_bare_soil_or_vegetated_area= no_bare_soil_or_vegetated_area;']);
    
    %% read in geocoding data from subarea reference image file
    % [band,xb,yb,Ib] = geoimread(xmlfile);
    if license('test','MAP_Toolbox') == 1
        info = geotiffinfo(xmlfile); %% need mapping toolbox
        Ib.BoundingBox=info.BoundingBox;
        Ib.ModelPixelScaleTag = info.GeoTIFFTags.ModelPixelScaleTag; %info.PixelScale; %[10;10;0];
        Ib.ModelTiepointTag = info.GeoTIFFTags.ModelTiepointTag; %[0;0;0;ulx;uly;0];
        Ib.GTModelTypeGeoKey = 1;
        Ib.ProjectedCSTypeGeoKey = info.GeoTIFFCodes.PCS;
    else
        [img,x,y,info] = geoimread(xmlfile);
        Ib.BoundingBox=info.BoundingBox;
        Ib.ModelPixelScaleTag = info.ModelPixelScaleTag; %info.PixelScale; %[10;10;0];
        Ib.ModelTiepointTag = info.ModelTiepointTag; %[0;0;0;ulx;uly;0];
        Ib.GTModelTypeGeoKey = 1;
        Ib.GeoKeyDirectoryTag = info.GeoKeyDirectoryTag;
        clear img x y;
    end

    %% exporting tif files
    bbox=Ib.BoundingBox;
%     utmzone=strsplit(Ib.GeoAsciiParamsTag,' ');
%     utmzone=utmzone{6};utmzone=[utmzone(1:2),' ',utmzone(3)];
%     [bbox(:,2),bbox(:,1)] = utm2deg(bbox(:,1),bbox(:,2),[utmzone;utmzone]);   
    bit_depth=32;
    geotiffwrite([out_path filename '_SL2P_' bio '.tif'], bbox, eval(['NNT_OUT.',lower(bio)]), bit_depth, Ib);
    geotiffwrite([out_path filename '_SL2P_' bio,'_Uncertainties.tif'], bbox, eval(['NNT_OUT.',lower(bio),'_Uncertainties']), bit_depth, Ib);
    geotiffwrite([out_path filename '_SL2P_' bio,'_Flags.tif'], bbox, eval(['NNT_OUT.',lower(bio),'_flags']), bit_depth, Ib);
    waitbar(ivar/length(bio_vars))
end
close(h)

end


