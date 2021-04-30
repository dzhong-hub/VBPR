function [qs av_q cc av_cc] = ComputeQI(x,y)
%
% ComputeQI computes the bias between two image pixels grids
% 
% Input:
%   x and y - two image data series of the same dimension. 
%             They can be in a vector or matrix fotmat. 
%             Usually, y is a reference signal.
%
% Output:
%   bias - the bias per band
%   av_bias - the average bias of all bands
%

% Find number of bands
bands = size(x);
if length(bands) == 3
    bands = bands(1,3);
else
    bands = 1;
end

% Preallocation
meansx = zeros(bands,1);
meansy = zeros(bands,1);
sdsx   = zeros(bands,1);
sdsy   = zeros(bands,1);
cc     = zeros(bands,1);

for i = 1:bands;    
    xt = double(x(:,:,i));
    yt = double(y(:,:,i));
    % Statistics for each band
    meansx(i) = mean(xt(:));
    meansy(i) = mean(yt(:));
    sdsx(i)   = std2(xt);
    sdsy(i)   = std2(yt);
    % Correlation Coefficient for each band
    cc(i) = corr2(xt,yt);
end

% Quality for each band
qs = (  ( cc .* ( (2.*meansx.*meansy) ./ (meansx.^2 + meansy.^2)  ) ...
             .* ( (2.*sdsx  .*sdsy  ) ./ (sdsx.^2 + sdsy.^2) ) )  ) ;    

% Calculate mean quality and mean correlation coefficient
av_q  = mean(qs);
av_cc = mean(cc);

end
