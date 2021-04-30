function [qs, av_q, cc, av_cc, excp] = ComputeUIQI(x,y)
%
% ComputeUIQI computes the universal image quality index (UIQI) 
% 
% Input:
%   x and y - two image data series of the same dimension. 
%             They can be in a vector or matrix fotmat. 
%             Usually, y is a reference signal.
%
% Output:
%   qs - the quality index per band
%   av_q - the average QI of all bands
%   cc - the correlation coefficient per band
%   av_cc - the average correlation coefficients of all bands
%   excp - number of invalid pixels per band
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
qs     = zeros(bands,1);
cc     = zeros(bands,1);
excp   = zeros(bands,1);

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
    % Statistics for each band
    meansx(i) = mean(xt);
    meansy(i) = mean(yt);
    sdsx(i)   = std(xt);
    sdsy(i)   = std(yt);
    % Correlation Coefficient for each band
    cc(i) = corr2(xt,yt);
    % qs(i) = 4*cc(i)*sdsx(i)*sdsy(i)*meansx(i)*meansy(i)/...
    %         ((sdsx(i)^2+sdsy(i)^2)*(meansx(i)^2+meansy(i)^2));
end

% Quality for each band
qs = (  ( cc .* ( (2.*meansx.*meansy) ./ (meansx.^2 + meansy.^2)  ) ...
             .* ( (2.*sdsx  .*sdsy  ) ./ (sdsx.^2 + sdsy.^2) ) )  ) ;    

% Calculate mean quality and mean correlation coefficient
av_q  = mean(qs);
av_cc = mean(cc);

end
