function S2_10m = Read10mBandData(L2A_10m_imgdata_path)
% Read in all 10m band data of a Sentinel-2 L2A granule
% 
% Input:
%   L2A_10m_imgdata_path - the path to L2A 10m image data folder
% Output:
%   S2_10m - a data cube includes 4 bands of 10m image data
%
%% read all L2A 10m image data
fnames = dir([L2A_10m_imgdata_path '\SUB*10m.tif']);
fnames = {fnames(~[fnames.isdir]).name};
for i=1:length(fnames)
    [path, fn, ext] = fileparts(fnames{i});
    fnames{i} = [L2A_10m_imgdata_path '\' fnames{i}];
    if contains(fn,'B02_10m') % read band B02 data
        B02 = imread(fnames{i});
    end
    if contains(fn,'B03_10m') % read band B03 data
        B03 = imread(fnames{i});
    end
    if contains(fn,'B04_10m') % read band B04 data
        B04 = imread(fnames{i});
    end
    if contains(fn,'B08_10m') % read band B08 data
        B08 = imread(fnames{i});
    end      
end
%% put the 10m band data into a data cube
    [row, col] = size(B02);
    S2_10m = zeros(row, col,4);
    S2_10m(:,:,1) = B02;
    S2_10m(:,:,2) = B03; 
    S2_10m(:,:,3) = B04;
    S2_10m(:,:,4) = B08;
    clear B02 B03 B04 B08;
end

