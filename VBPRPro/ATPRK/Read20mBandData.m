function S2_20m = Read20mBandData(L2A_20m_imgdata_path)
% Read in all 10m band data of a Sentinel-2 L2A granule
% 
% Input:
%   L2A_20m_imgdata_path - the path to L2A 20m image data folder
% Output:
%   S2_20m - a data cube includes 4 bands of 20m image data
%
%% read all L2A 10m image data
fnames = dir([L2A_20m_imgdata_path '\SUB*20m.tif']);
fnames = {fnames(~[fnames.isdir]).name};
for i=1:length(fnames)
    [path, fn, ext] = fileparts(fnames{i});
    fnames{i} = [L2A_20m_imgdata_path '\' fnames{i}];
    if contains(fn,'B05_20m') % read band B05 data
        B05 = imread(fnames{i});
    end
    if contains(fn,'B06_20m') % read band B06 data
        B06 = imread(fnames{i});
    end
    if contains(fn,'B07_20m') % read band B07 data
        B07 = imread(fnames{i});
    end
    if contains(fn,'B8A_20m') % read band B8A data
        B8A = imread(fnames{i});
    end
    if contains(fn,'B11_20m') % read band B11 data
        B11 = imread(fnames{i});
    end
    if contains(fn,'B12_20m') % read band B12 data
        B12 = imread(fnames{i});
    end  
end
%% put the 20m band data into a data cube
    [row, col] = size(B05);
    S2_20m = zeros(row, col,6);
    S2_20m(:,:,1) = B05;
    S2_20m(:,:,2) = B06; 
    S2_20m(:,:,3) = B07;
    S2_20m(:,:,4) = B8A;
    S2_20m(:,:,5) = B11;
    S2_20m(:,:,6) = B12;
    clear B05 B06 B07 B8A B11 B12;
end

