function [div, av_div, excp] = ComputeDIV(x,y)
%
% ComputeDIV computes the Difference In Variance (DIV)
% between two image pixels grids
% 
% Input:
%   x and y - two image data series of the same dimension. 
%             They can be in a vector or matrix fotmat. 
%             Usually, y is a reference signal.
%
% Output:
%   div - the DIV per band
%   av_div - the average DIV of all bands
%   excp - number of invalid pixels per band
%

% Find the number of bands
bands = size(x);
if length(bands) == 3
    bands = bands(1,3);
else
    bands = 1;
end
% Preallocation
sdx = zeros(bands,1);
sdy = zeros(bands,1);
excp = zeros(bands,1);
% Standard deviations
for i = 1:bands
    xt = double(x(:,:,i));
    yt = double(y(:,:,i));
    xt = xt(:);
    yt = yt(:);
    % exclude the invalid pixels
    % idx = find(yt<=0|yt>1.0);
    idx = union(find(xt<=0|xt>1.0),find(yt<=0|yt>1.0));
    yt(idx) = [];
    xt(idx) = [];   
    excp(i) = length(idx);    
    sdx(i) = std(xt);
    sdy(i) = std(yt);
end

% Variance = (Standard deviation)^2
varx = sdx.^2;
vary = sdy.^2;
% Calculate DIV
div = 1 - (vary./varx);
% Average DIV
av_div = mean(div);

end