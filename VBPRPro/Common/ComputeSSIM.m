function [ssi, av_ssi,excp] = ComputeSSIM(x, y)
%
% ComputeSSIM(x, y) calculate the SSIM between two signals or images grids.
% 
% Input:
%   x and y - two signal data series of the same dimension. 
%             They can be in a vector or matrix fotmat. 
%             Usually, signal2 is a reference signal.
% Output:
%   ssi - the SSIM per band
%   av_ssi - the average SSIM of all bands
%   excp - number of invalid pixels per band
%

% Find the number of bands
sizi = size(x);
if max(size(size(x))) == 2
    bands = 1;
else
    bands = sizi(1,3);
end

ssi = zeros(bands,1);
excp = zeros(bands,1);

for i = 1:bands             
    xt = double(x(:,:,i));  
    yt = double(y(:,:,i));  
    ssi(i) = ssim(xt, yt);
    idx = union(find(xt<=0|xt>1.0),find(yt<=0|yt>1.0));
    excp(i) = length(idx);
    yt(idx) = [];
    xt(idx) = [];
    ssi(i) = ssim(xt, yt);
end

av_ssi = mean(ssi);

end

