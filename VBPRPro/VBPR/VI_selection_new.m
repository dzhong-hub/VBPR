function [database_0,VI]=VI_selection_new(S2L2B_path,SR,vbp,database_0)

h = waitbar(0,'VIs selection...');
database_0.bvar = vbp;

waitbar(1/5)%**************************************************************
[r,c]=size(SR.SCL);
database_0.image_dim=[r,c];
database_0.Ib=SR.Ib;
database_0.xb=SR.xb;
database_0.yb=SR.yb;
%database_0.RES=SR.RES;

%% calculate VI
VI=[];
VI.ndvi=reshape((SR.B8A-SR.B04)./(SR.B8A+SR.B04),r*c,1);
VI.ndwi=reshape((SR.B8A-SR.B11)./(SR.B8A+SR.B11),r*c,1);
VI.redge=reshape((SR.B8A-SR.B05)./(SR.B8A+SR.B05),r*c,1);
VI.MSRWI=reshape(((SR.B8A./SR.B11)-1)./sqrt((SR.B8A./SR.B11)+1),r*c,1);
VI.MSR= reshape(((SR.B8A./SR.B04)-1)./sqrt((SR.B8A./SR.B04)+1),r*c,1);
VI.GVI=reshape((SR.B8A./SR.B03)-1,r*c,1);
waitbar(2/5)%**************************************************************

%% data filtering
VAR=[];
file_name=dir([S2L2B_path,['*',vbp,'.tif']]);
VAR.bio = double(reshape(geoimread([S2L2B_path,file_name(1).name]),r*c,1));
VAR.flag =  double(reshape(geoimread([S2L2B_path,strrep(file_name(1).name,'.tif','_flags.tif')]),r*c,1));
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
waitbar(3/5)%**************************************************************

%% slecting best VIs (Lasso)
% data=resample_density_v2(data,20);%define in database.DEF !!!! Is the number 20 the resolution????
data=resample_density_v2(data,SR.RES);
database_0.N.Nsamp_LASSO=size(data,1);
[database_0.Lasso.B, database_0.Lasso.FitInfo] = lasso(data(:,1:end-1),data(:,end),'CV',10,'PredictorNames',fnames);
waitbar(4/5)%**************************************************************

idxLambda1SE = database_0.Lasso.FitInfo.Index1SE;
B_1SE=database_0.Lasso.B(:,idxLambda1SE);
B_1SE=[mapminmax(abs(B_1SE'),0,1)]';
B_1SE(B_1SE<0.01)=0;% filter low coefficients

database_0.Lasso.B(:,idxLambda1SE)=B_1SE;
database_0.Lasso.idx=[sum(~ismember(database_0.Lasso.B(:,idxLambda1SE),[0]));database_0.Lasso.FitInfo.MSE(idxLambda1SE);idxLambda1SE];
waitbar(5/5)%**************************************************************
close (h)
end




