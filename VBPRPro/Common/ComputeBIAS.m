function [bias, av_bias, excp] = ComputeBIAS(x,y)
%
% ComputeBIAS computes the bias between two image pixels grids
% 
% Input:
%   x and y - two image data series of the same dimension. 
%             They can be in a vector or matrix fotmat. 
%             Usually, y is a reference signal.
%
% Output:
%   bias - the bias per band
%   av_bias - the average bias of all bands
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
mx = zeros(1,bands);
my = zeros(1,bands);
excp = zeros(1,bands);
% Mean value calculation
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
    mx(i) = mean(xt);
    my(i) = mean(yt);
end
% Bias calculation
bias = 1 - (my./mx);
bias = bias';

av_bias = mean(bias);

end
