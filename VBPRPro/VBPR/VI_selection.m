function [database_0,VI]=VI_selection(inputs,database_0)
h = waitbar(0,'VIs selection...');
database_0.bvar=inputs{3};
 
L2A_data=inputs{1};
L2A_data_name=strsplit(L2A_data,'_');

if sum(ismember(L2A_data_name,{'PRD'}))==1
   SR=read_S2_MSIL2A_safe_PRD_struct(L2A_data(1,1:end-1));
else
   SR=read_S2_MSIL2A_safe_struct(L2A_data(1,1:end-1));
end

waitbar(1/5)%*************************************************************************************************************************
[r,c]=size(SR.SCL);
database_0.image_dim=[r,c];
database_0.Ib=SR.Ib;
database_0.xb=SR.xb;
database_0.yb=SR.yb;

VI=[];
VI.ndvi=reshape((SR.B8A-SR.B04)./(SR.B8A+SR.B04),r*c,1);
VI.ndwi=reshape((SR.B8A-SR.B11)./(SR.B8A+SR.B11),r*c,1);
VI.redge=reshape((SR.B8A-SR.B05)./(SR.B8A+SR.B05),r*c,1);
VI.MSRWI=reshape(((SR.B8A./SR.B11)-1)   ./sqrt((SR.B8A./SR.B11)+1),r*c,1);
VI.MSR= reshape(((SR.B8A./SR.B04)-1)    ./sqrt((SR.B8A./SR.B04)+1),r*c,1);
VI.GVI=reshape((SR.B8A./SR.B03)-1,r*c,1);
waitbar(2/5)%*************************************************************************************************************************

%% data filtering
VAR=[];
file_name=dir([inputs{2},['*',inputs{3},'.tif']]);
VAR.bio = double(reshape(geoimread([inputs{2},file_name(1).name]),r*c,1));
VAR.flag =  double(reshape(geoimread([inputs{2},strrep(file_name(1).name,'.tif','_flags.tif')]),r*c,1));
VAR.SCL=reshape(SR.SCL,r*c,1);
database_0.N.all=r*c;
database_0.N.veg_bare_soil=sum(ismember(VAR.SCL,[4,5]));

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

database_0.N.no_flags=size(data,1);
CORD=[[1:1:r*c]',reshape([1:r]'*ones(1,c),r*c,1),reshape(ones(r,1).*[1:c],r*c,1)];
database_0.all=[CORD,VAR.bio,VAR.flag,VAR.SCL];

waitbar(3/5)%*************************************************************************************************************************
%% Slecting best VIs (Lasso)
data=resample_density_v2(data,20);%define in database.DEF
database_0.N.Nsamp_LASSO=size(data,1);
[database_0.Lasso.B, database_0.Lasso.FitInfo] = lasso(data(:,1:end-1),data(:,end),'CV',10,'PredictorNames',fnames);
%%
waitbar(4/5)%*************************************************************************************************************************
idxLambda1SE = database_0.Lasso.FitInfo.Index1SE;
B_1SE=database_0.Lasso.B(:,idxLambda1SE);
B_1SE=[mapminmax(abs(B_1SE'),0,1)]';
B_1SE(B_1SE<0.01)=0;% filter low coefficients

database_0.Lasso.B(:,idxLambda1SE)=B_1SE;
database_0.Lasso.idx=[sum(~ismember(database_0.Lasso.B(:,idxLambda1SE),[0]));database_0.Lasso.FitInfo.MSE(idxLambda1SE);idxLambda1SE];

waitbar(5/5)
close (h)
end




