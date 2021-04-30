function VBPR_ByALR(xmlfile, S2l2A_path, S2L2B_path, vbp, out_path)
%
% VBPR by ALR SL2P
%
% Input: 
%   varargin (xmlfile, S2l2A_path, S2L2B_path, vbp, out_path)
%   xmlfile - S2L2A XML file path and name
%   S2l2A_path - input path to S2L2A tiff images
%   S2L2B_path - input path to S2L2B tiff images
%   vbp - options for which BP to be calculated (default is All).
%   out_path - output data path
% Output:
%   VBPR results files in the output data folder
%

%% 1. Initialization
if strcmp(vbp,'ALL')
    bio_vars={'LAI','FCOVER','FAPAR','LAI_Cab','LAI_Cw'};
else
    bio_vars = {vbp};
end

database_1.DEF.percentile=2.5;
database_1.DEF.bio_clas_num=100;

%% read in S2L2A image data 
SR = read_S2_MSIL2A_data_to_struct(xmlfile,S2l2A_path);

%% initialize common data
[r,c]=size(SR.SCL);
database_1.image_dim=[r,c];
database_1.Ib=SR.Ib;
database_1.xb=SR.xb;
database_1.yb=SR.yb;

%% calculate VI
VI=[];
VI.ndvi=reshape((SR.B8A-SR.B04)./(SR.B8A+SR.B04),r*c,1);
VI.ndwi=reshape((SR.B8A-SR.B11)./(SR.B8A+SR.B11),r*c,1);
VI.redge=reshape((SR.B8A-SR.B05)./(SR.B8A+SR.B05),r*c,1);
VI.MSRWI=reshape(((SR.B8A./SR.B11)-1)./sqrt((SR.B8A./SR.B11)+1),r*c,1);
VI.MSR=reshape(((SR.B8A./SR.B04)-1)./sqrt((SR.B8A./SR.B04)+1),r*c,1);
VI.GVI=reshape((SR.B8A./SR.B03)-1,r*c,1);


for ivar=1:length(bio_vars)
    bio=bio_vars{ivar};

    %% 2. VI_selection
    % [database_1,VI]=VI_selection_new(S2L2B_path,SR,bio,database_1); % DZ: passing huge amount of data SR is not efficient for memory management
    
    h = waitbar(0,'VIs selection...');
    database_1.bvar = bio;

%     waitbar(1/5)%**************************************************************
%     [r,c]=size(SR.SCL);
%     database_1.image_dim=[r,c];
%     database_1.Ib=SR.Ib;
%     database_1.xb=SR.xb;
%     database_1.yb=SR.yb;

%     %% 2.1 calculate VI
%     VI=[];
%     VI.ndvi=reshape((SR.B8A-SR.B04)./(SR.B8A+SR.B04),r*c,1);
%     VI.ndwi=reshape((SR.B8A-SR.B11)./(SR.B8A+SR.B11),r*c,1);
%     VI.redge=reshape((SR.B8A-SR.B05)./(SR.B8A+SR.B05),r*c,1);
%     VI.MSRWI=reshape(((SR.B8A./SR.B11)-1)./sqrt((SR.B8A./SR.B11)+1),r*c,1);
%     VI.MSR=reshape(((SR.B8A./SR.B04)-1)./sqrt((SR.B8A./SR.B04)+1),r*c,1);
%     VI.GVI=reshape((SR.B8A./SR.B03)-1,r*c,1);
%     waitbar(2/5)%**************************************************************

    %% 2.2 data filtering
    VAR=[];
    file_name=dir([S2L2B_path,['*',bio,'.tif']]);
    VAR.bio=double(reshape(geoimread([S2L2B_path,file_name(1).name]),r*c,1));
    VAR.flag=double(reshape(geoimread([S2L2B_path,strrep(file_name(1).name,'.tif','_flags.tif')]),r*c,1));
    VAR.SCL=reshape(SR.SCL,r*c,1);
    
    database_1.N.all=r*c;
    database_1.N.veg_bare_soil=sum(ismember(VAR.SCL,[4,5]));

    data=[];
    fnames=fieldnames(VI)';
    for vi=fnames
        eval(['data=[data,VI.',vi{1},'];'])
    end
    data=[data,VAR.bio,VAR.flag,VAR.SCL];
    data(:,end+1)=[sum(data')]';
    data=data(find(~isnan(data(:,end))),:);
    data=data(find(~isinf(data(:,end))),:);
    data=data(find(ismember(data(:,end-1),[4,5])),:);
    data=data(find(data(:,end-2)==0),1:end-3);

    database_1.N.no_flags=size(data,1);
    CORD=[[1:1:r*c]',reshape([1:r]'*ones(1,c),r*c,1),reshape(ones(r,1).*[1:c],r*c,1)];
    database_1.all=[CORD,VAR.bio,VAR.flag,VAR.SCL];    
    clear VAR; 
    waitbar(1/5)%**************************************************************

    %% 2.3 slecting best VIs (Lasso)
    data=resample_density_v2(data,20);%define in database.DEF %% DZ: what means the hard coded 20? the resolution??
    % data=resample_density_v2(data,SR.RES); %% DZ: assuming that it is the resolution
    database_1.N.Nsamp_LASSO=size(data,1);
    [database_1.Lasso.B, database_1.Lasso.FitInfo] = lasso(data(:,1:end-1),data(:,end),'CV',10,'PredictorNames',fnames);
    clear data;
    waitbar(2/5)%**************************************************************

    idxLambda1SE = database_1.Lasso.FitInfo.Index1SE;
    B_1SE=database_1.Lasso.B(:,idxLambda1SE);
    B_1SE=[mapminmax(abs(B_1SE'),0,1)]';
    B_1SE(B_1SE<0.01)=0;% filter low coefficients

    database_1.Lasso.B(:,idxLambda1SE)=B_1SE;
    database_1.Lasso.idx=[sum(~ismember(database_1.Lasso.B(:,idxLambda1SE),[0]));database_1.Lasso.FitInfo.MSE(idxLambda1SE);idxLambda1SE];
    waitbar(3/5)%**************************************************************
     
    %% 3. Regularizing........................................................
    database_1.Predictors = database_1.Lasso.FitInfo.PredictorNames(database_1.Lasso.B(:,database_1.Lasso.idx(3))~=0);
    database_1=create_training_database(database_1,VI);  
    database_1=regularize_bio(database_1);
    waitbar(4/5)%**************************************************************
    
    %% 4. Export data to xlsx file
%     filename = [out_path,bio,'.xlsx'];
%     xlswrite(filename,[{'Variable: '},database_1.bvar],'Start','A1');
%     xlswrite(filename,[{'VIs: '},database_1.Predictors],'Start','A2');
%     xlswrite(filename,[{'Theo. RMSE :'},{database_1.NET.RMSE(1)},{database_1.NET.RMSE(2)}],'Start','A3');
%     xlswrite(filename,[{'Image dim. :'},{size(database_1.all,1)}],'Start','A4');
%     xlswrite(filename,[{'N_calibration :'},{size(database_1.learn,1)}],'Start','A5');
%     xlswrite(filename,[{'N_regularizing :'},{size(database_1.reg,1)}],'Start','A6');
%     xlswrite(filename,[{'N_no_veg_bare :'},{size(database_1.reg_CL,1)}],'Start','A7');

    %% 5. Export data to geotiff file
    file_name=dir([S2L2B_path,['*',bio,'.tif']]);
    file_name=file_name(1).name(1:end-4);
    % export_reg_data(database_1, [out_path,file_name]);
    
    bbox=database.Ib.BoundingBox;
    %utmzone=strsplit(database.Ib.GeoAsciiParamsTag,' ');
    %utmzone=utmzone{6};
    %utmzone=[utmzone(1:2),' ',utmzone(3)];
    %[bbox(:,2),bbox(:,1)] = utm2deg(bbox(:,1),bbox(:,2),[utmzone;utmzone]);
    bit_depth=32;
    geotiffwrite([file_name,'_',bio,'_reg.tif'],       bbox, reshape(database.all_1(:,4),database.image_dim(1),database.image_dim(2)), bit_depth, database.Ib);
    geotiffwrite([file_name,'_',bio,'_reg_flags.tif'], bbox, reshape(database.all_1(:,5),database.image_dim(1),database.image_dim(2)), bit_depth, database.Ib);

    
    waitbar(5/5)%**************************************************************
    close (h)    

end
end

