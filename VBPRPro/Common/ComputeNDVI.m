function [idx] = ComputeNDVI(img, bnir, bred, scale)
%
% ComputeNDVI computes the Normalized Difference Vegitation Index
% 
% Input:
%   img -     image data with band NIR and Red
%   bnir -    NIR band number in the data
%   nred -    Red band numver in the data
%   scale -   Scale of the pixel values
%
% Output:
%   idx - the NDVI
%

[m, n, b] =size(img);

% Find the NIR and Red band data
nir = img(:,:,bnir)/scale;
red = img(:,:,bred)/scale;

% Preallocation
idx = zeros(m,n);

% NDVI calculation
for i = 1:m
    for j=1:n
        if nir(i,j)< 0 || nir(i,j)> 1 || red(i,j)< 0 || red(i,j)> 1 || (nir(i,j)+red(i,j))== 0
            idx(i,j) = NaN;
        else
            idx(i,j) = (nir(i,j)-red(i,j))/(nir(i,j)+red(i,j));
        end
    end
end

end
