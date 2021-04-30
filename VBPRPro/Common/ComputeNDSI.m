function [idx] = ComputeNDSI(img, bgreen, bswir, scale)
%
% ComputeNDVI computes the Normalized Difference Vegitation Index
% 
% Input:
%   img -     image data with band NIR and Red
%   bgreen -  Green band number in the data
%   bswir -   SWIR band numver in the data
%   scale -   Scale of the pixel values
%
% Output:
%   idx - the NDVI
%

[m, n, b] =size(img);

% Find the NIR and Red band data
green = img(:,:,bgreen)/scale;
swir = img(:,:,bswir)/scale;

% Preallocation
idx = zeros(m,n);

% NDVI calculation
for i = 1:m
    for j=1:n
        if green(i,j)< 0 || green(i,j)> 1 || swir(i,j)< 0 || swir(i,j)> 1 || (green(i,j)+swir(i,j))== 0
            idx(i,j) = NaN;
        else
            idx(i,j) = (green(i,j)-swir(i,j))/(green(i,j)+swir(i,j));
        end
    end
end

end
