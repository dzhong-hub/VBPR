function st = ComputeMeanQ(Q)

% function used to calculate mean uncertainties
% Input:
%   Q -- Input variance matrix 
%
% Output:
%   st -- standard deviation 
% 
% Note:
%   NaN values will be excluded
%

[r,c,b] = size(Q);
st = zeros(b,3);
for i=1:b
    x = Q(:,:,i);
    x = x(:);
    x(isnan(x)) = [];
    x(x==0) = [];
    x = sqrt(x);
    st(i,1) = min(x);
    st(i,2) = max(x);
    st(i,3) = mean(x);
end
end

