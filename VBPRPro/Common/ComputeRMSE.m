function [rmses, av_rmse, excp] = ComputeRMSE(x,y)
%
% ComputeERGAS computes the root mean squared error (RMSE) 
% between two image pixels grids
% 
% Input:
%   x and y - two image data series of the same dimension. 
%             They can be in a vector or matrix fotmat. 
%             Usually, y is a reference signal.
%
% Output:
%   rmses - the RMSE per band
%   av_rmse - the average RMSE of all bands
%   excp - number of invalid pixels per band
%

sizi = size(x);
if max(size(size(x))) == 2
    bands = 1;
else
    bands = sizi(1,3);
end

% nres = sizi(1,1)*sizi(1,2);

rmses = zeros(bands,1);
excp = zeros(bands,1);
for i = 1:bands             
    xt = double(x(:,:,i));  
    yt = double(y(:,:,i));
    %rmses(i) = sqrt( (sum(sum((xt - yt).^2)))/nres );
    xt = xt(:);
    yt = yt(:);
    % exclude the invalid pixels
    % idx = find(yt<=0|yt>1.0);
    idx = union(find(xt<=0|xt>1.0),find(yt<=0|yt>1.0));
    yt(idx) = [];
    xt(idx) = [];   
    d = xt - yt;
    
    excp(i) = length(idx);
    rmses(i) = sqrt(sum(d.^2)/length(d));
    
end

av_rmse = mean(rmses);

end