function [cc, av_cc, excp] = ComputePCC(x,y)
%
% ComputePCC computes the Person Correlation Coefficients (PCC) 
% between two image pixels grids
% 
% Input:
%   x and y - two image data series of the same dimension. 
%             They can be in a vector or matrix fotmat. 
%             Usually, y is a reference signal.
%
% Output:
%   cc - the PCC per band
%   av_cc - the average PCC of all bands
%   excp - number of invalid pixels per band
%

% Find the number of bands
sizi = size(x);
if max(size(size(x))) == 2
    bands = 1;
else
    bands = sizi(1,3);
end

% Preallocation
cc = zeros(bands,1);
excp = zeros(bands,1);

% Correlation Coefficient calculation
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
    cc(i) = corr2(xt,yt);
end

% Average CC
av_cc = mean(cc);

end
