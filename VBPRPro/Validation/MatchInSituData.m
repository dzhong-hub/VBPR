function MatchInSituData(grnd_file, vbp_path, method, out_dir)
%
% Pair the estimated BIO variables with In-Situ data
%
% Input:
%   grnd_file - ground in-situ data file in mat format
%   vbp_path - path to the estimated VBP data
%   method - estimation method: SL2P or ALR_SL2P
%   out_dir - output folder
% Output:
%

%% read in is-situ data
GRND=importdata(grnd_file);
GRND_doy=char(fieldnames(GRND.LAI));
GRND_doy=str2num(GRND_doy(:,5:end));

%% get estimated VBP data files
if contains(method, 'ALR')
    lai_file = dir([vbp_path,'*SL2P*LAI_reg.tif']);
    fcover_file = dir([vbp_path,'*SL2P*FCOVER_reg.tif']);
    cwc_file = dir([vbp_path,'*SL2P*LAI_Cw_reg.tif']);  
    lai_file_flags = dir([vbp_path,'*SL2P*LAI_reg_flags.tif']);
    fcover_file_flags = dir([vbp_path,'*SL2P*FCOVER_reg_flags.tif']);
    cwc_file_flags = dir([vbp_path,'*SL2P*LAI_Cw_reg_flags.tif']);
else
    lai_file = dir([vbp_path,'*SL2P*LAI.tif']);
    fcover_file = dir([vbp_path,'*SL2P*FCOVER.tif']);
    cwc_file = dir([vbp_path,'*SL2P*LAI_Cw.tif']);
    lai_file_flags = dir([vbp_path,'*SL2P*LAI_Flags.tif']);
    fcover_file_flags = dir([vbp_path,'*SL2P*FCOVER_Flags.tif']);
    cwc_file_flags = dir([vbp_path,'*SL2P*LAI_Cw_Flags.tif']);
end    

%% assign an output file name 
s2_doy = lai_file.name(:,16:18);
s2_tid = lai_file.name(:,5:10);
out_file = [out_dir '\S2_MSI_BIO_SMAPVEX16_DOY_', s2_doy, '_', s2_tid, '.mat'];
 
%% get GRND data and positions of all in-situ measurement points
GRND_LAI = eval(['GRND.LAI.DOY_',s2_doy,'(:,[1:end])']);
GRND_FCOVER = eval(['GRND.FCOVER.DOY_',s2_doy,'(:,[1:end])']); 
%GRND_CWC = eval(['GRND.CWC.DOY_',s2_doy,'(:,[1:end])']);
%% get geo positions of the in-situ measurements
GRND_pos = eval(['GRND.LAI.DOY_',s2_doy,'(:,[4:5])']);

%% check the retreived positions 
GRND_pos2 = eval(['GRND.FCOVER.DOY_',s2_doy,'(:,[4:5])']);
dpos = GRND_pos - GRND_pos2;
if max(abs(dpos(:))) > 0.001
    msgbox('The coordinates from in-situ variable LAI and FCOVER are different. Program stopped.');
    return;
end    

%% initialize the output data structure
np = length(GRND_pos(:,1));
flags = ones(np,1);
NNT_OUT.LAI = [GRND_LAI,flags];  NNT_OUT.LAI(:,7) = NaN;
NNT_OUT.FCOVER = [GRND_FCOVER,flags];  NNT_OUT.FCOVER(:,7) = NaN;
NNT_OUT.LAI_Cw = [GRND_LAI,flags];  NNT_OUT.LAI_Cw(:,7) = NaN;

%% read in the estimated BIO variables
[s2_lai,x,y,info] = geoimread([vbp_path,lai_file.name]);
s2_fcover = geoimread([vbp_path,fcover_file.name]);
s2_cwc = geoimread([vbp_path,cwc_file.name]);
s2_lai_flags = geoimread([vbp_path,lai_file_flags.name]);
s2_fcover_flags = geoimread([vbp_path,fcover_file_flags.name]);
s2_cwc_flags = geoimread([vbp_path,cwc_file_flags.name]);

%% retreive the esitimated BIO variables at the in-situ measurement positions
for pp = 1:np
    xe = GRND_pos(pp,1); 
    yn = GRND_pos(pp,2);
    ii = [];
    for i=1:length(x)-1
        if xe >= x(i) && xe <= x(i+1)
            ii = i;
            break;
        end
    end
    jj = [];
    for j=1:length(y)-1
        if yn <= y(j) && yn >= y(j+1)
            jj = j;
            break;
        end
    end
    if ~isempty(ii) && ~isempty(jj)
        NNT_OUT.LAI(pp,7) = s2_lai(ii,jj);
        NNT_OUT.FCOVER(pp,7) = s2_fcover(ii,jj);
        NNT_OUT.LAI_Cw(pp,7) = s2_cwc(ii,jj);        
        NNT_OUT.LAI(pp,8) = s2_lai_flags(ii,jj);
        NNT_OUT.FCOVER(pp,8) = s2_fcover_flags(ii,jj);
        NNT_OUT.LAI_Cw(pp,8) = s2_cwc_flags(ii,jj);
    end
end    
NNT_OUT.txt = {'OBJECTID'    'Field'    'Site'    'X'    'Y'    'Crop_Type'    'Variable'};   

%% output the results
save(out_file,'NNT_OUT');

