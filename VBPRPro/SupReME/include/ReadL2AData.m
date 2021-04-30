function Yim = ReadL2AData(L2A_10m_imgdata_path, L2A_20m_imgdata_path, L2A_60m_imgdata_path, N)
% Read in all 10m band data of a Sentinel-2 L2A granule
% 
% Input:
%   L2A_10m_imgdata_path - the path to L2A 10m image data folder
%   L2A_20m_imgdata_path - the path to L2A 20m image data folder
%   L2A_60m_imgdata_path - the path to L2A 60m image data folder
%   N - dimention of the blocks
% Output:
%   Yim - a data cell includes different bands data
%            in the order [B1 B2 B3 B4 B5 B6 B7 B8 B8A B9 B11 B12] 
%

Yim = cell(12,N*N);

%% read all L2A 60m image data
fnames = dir([L2A_60m_imgdata_path '\SUB*60m.tif']);
fnames = {fnames(~[fnames.isdir]).name};
for i=1:length(fnames)
    [path, fn, ext] = fileparts(fnames{i});
    fnames{i} = [L2A_60m_imgdata_path '\' fnames{i}];
    if contains(fn,'B01') % read band B01 data
        img = double(imread(fnames{i}));
        Bimg = DivideToNBlocks(img,N);
        for j = 1:N*N
            Yim{1,j} = Bimg{1,j}; 
        end
    end
    if contains(fn,'B09') % read band B09 data
        img = double(imread(fnames{i}));
        Bimg = DivideToNBlocks(img,N);
        for j = 1:N*N
            Yim{10,j} = Bimg{1,j}; 
        end
    end
end
%% read all L2A 20m image data
fnames = dir([L2A_20m_imgdata_path '\SUB*20m.tif']);
fnames = {fnames(~[fnames.isdir]).name};
for i=1:length(fnames)
    [path, fn, ext] = fileparts(fnames{i});
    fnames{i} = [L2A_20m_imgdata_path '\' fnames{i}];
    if contains(fn,'B05') % read band B05 data
        img = double(imread(fnames{i}));
        Bimg = DivideToNBlocks(img,N);
        for j = 1:N*N
            Yim{5,j} = Bimg{1,j}; 
        end
    end 
    if contains(fn,'B06') % read band B06 data
        img = double(imread(fnames{i}));
        Bimg = DivideToNBlocks(img,N);
        for j = 1:N*N
            Yim{6,j} = Bimg{1,j}; 
        end
    end
    if contains(fn,'B07') % read band B07 data
        img = double(imread(fnames{i}));
        Bimg = DivideToNBlocks(img,N);
        for j = 1:N*N
            Yim{7,j} = Bimg{1,j}; 
        end
    end
    if contains(fn,'B8A') % read band B8A data
        img = double(imread(fnames{i}));
        Bimg = DivideToNBlocks(img,N);
        for j = 1:N*N
            Yim{9,j} = Bimg{1,j}; 
        end
    end
    if contains(fn,'B11') % read band B11 data
        img = double(imread(fnames{i}));
        Bimg = DivideToNBlocks(img,N);
        for j = 1:N*N
            Yim{11,j} = Bimg{1,j}; 
        end
    end
    if contains(fn,'B12') % read band B12 data
        img = double(imread(fnames{i}));
        Bimg = DivideToNBlocks(img,N);
        for j = 1:N*N
            Yim{12,j} = Bimg{1,j}; 
        end
    end 
end
%% read all L2A 10m image data
fnames = dir([L2A_10m_imgdata_path '\SUB*10m.tif']);
fnames = {fnames(~[fnames.isdir]).name};
for i=1:length(fnames)
    [path, fn, ext] = fileparts(fnames{i});
    fnames{i} = [L2A_10m_imgdata_path '\' fnames{i}];
    if contains(fn,'B02') % read band B02 data
        img = double(imread(fnames{i}));
        Bimg = DivideToNBlocks(img,N);
        for j = 1:N*N
            Yim{2,j} = Bimg{1,j}; 
        end
    end
    if contains(fn,'B03') % read band B03 data
        img = double(imread(fnames{i}));
        Bimg = DivideToNBlocks(img,N);
        for j = 1:N*N
            Yim{3,j} = Bimg{1,j}; 
        end
    end
    if contains(fn,'B04') % read band B04 data
        img = double(imread(fnames{i}));
        Bimg = DivideToNBlocks(img,N);
        for j = 1:N*N
            Yim{4,j} = Bimg{1,j}; 
        end
    end
    if contains(fn,'B08') % read band B03 data
        img = double(imread(fnames{i}));
        Bimg = DivideToNBlocks(img,N);
        for j = 1:N*N
            Yim{8,j} = Bimg{1,j}; 
        end
    end
end

end

