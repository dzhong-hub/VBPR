function [mae, av_mae, excp] = ComputeMAE(x, y)
%
% ComputeMAE(x, y) calculate the mean absolute errors (MAE) or 
% differences between two signals or images grids.
% 
% Input:
%   x and y - two signal data series of the same dimension. 
%             They can be in a vector or matrix fotmat. 
%             Usually, signal2 is a reference signal.
% Output:
%   mae - the MAE per band
%   av_mae - the average MAE of all bands
%   excp - number of invalid pixels per band
%

% Find the number of bands
sizi = size(x);
if max(size(size(x))) == 2
    bands = 1;
else
    bands = sizi(1,3);
end

mae = zeros(bands,1);
excp = zeros(bands,1);
for i = 1:bands             
    xt = double(x(:,:,i));  
    yt = double(y(:,:,i));  
    xt = xt(:);
    yt = yt(:);
    % exclude the invalid pixels
    % idx = find(yt<=0|yt>1.0);
    idx = union(find(xt<=0|xt>1.0),find(yt<=0|yt>1.0));
    excp(i) = length(idx);
    yt(idx) = [];
    xt(idx) = [];
    ad = abs(xt - yt);
    mae(i) = sum(ad)/length(ad);
end

av_mae = mean(mae);

end

