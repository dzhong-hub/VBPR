function [rase_pb, av_rase, rase_tl, excp] = ComputeRASE(x,y)
%
% ComputeRASE computes the image RASE between two image pixels grids
% 
% Input:
%   x and y - two signal data series of the same dimension. 
%             They can be in a vector or matrix fotmat. 
%             Usually, y is a reference signal.
%
% Output:
%   rase_pb - the RASE per band
%   av_rase - the average RASE of all bands
%   rase_tl - the total RASE
%   excp - number of invalid pixels per band
%

% RMSE part
% Find the number of bands
sizi = size(x);
if max(size(size(x))) == 2
    bands = 1;
else
    bands = sizi(1,3);
end
nres = sizi(1,1)*sizi(1,2);

% Preallocation
rmses = zeros(bands,1); 
excp = zeros(bands,1); 
Ms   = zeros(bands,1);
for i = 1:bands             
    xt = double(x(:,:,i));  
    yt = double(y(:,:,i));
    % rmses(i) = sqrt((sum(sum((xt - yt).^2)))/nres);
    % Ms(i) = mean2(x(:,:,i));
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
    Ms(i) = mean(xt);
end
% End of RMSE part

% RASE part
rmsesquared = rmses.^2;
srmsesq     = sum(rmsesquared);
M           = mean(Ms); % mean(x(:));

% Total RASE
rase_tl     = (100/M)*(sqrt(srmsesq/bands));
% RASE per band
rase_pb     = (100./Ms).*sqrt(rmsesquared);
% Average RASE
av_rase     = mean(rase_pb);
% End of RASE part

end

