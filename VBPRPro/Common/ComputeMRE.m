function [mre, av_mre, excp] = ComputeMRE(x, y)
%
% ComputeMRE(x, y) calculate the mean absolute relative errors or 
% differences between two signals or images grids.
% 
% Input:
%   x and y - two signal data series of the same dimension. 
%             They can be in a vector or matrix fotmat. 
%             Usually, signal2 is a reference signal.
% Output:
%   mre - the MRE per band
%   av_mre - the average MRE of all bands
%   excp - number of invalid pixels per band
%
% Find the number of bands
sizi = size(x);
if max(size(size(x))) == 2
    bands = 1;
else
    bands = sizi(1,3);
end

mre = zeros(bands,1);
excp = zeros(bands,1);
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
    ard = abs(xt - yt);
    
    excp(i) = length(idx);
    mre(i) = sum(ard./yt)/length(ard);
end

av_mre = mean(mre);

end
