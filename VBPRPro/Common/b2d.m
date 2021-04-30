% function y = b2d(x)
% % Convert a binary array to a decimal number
% % 
% % Similar to bin2dec but works with arrays instead of strings and is found to be 
% % rather faster
% z = 2.^(length(x)-1:-1:0);
% y = sum(x.*z);

% to extend the b2d converter from decimal scalars to vectors, use this modification: 
function y = b2d(x) 
% Convert an integer binary array to a integer decimal column vector 
z = 2.^(size(x,2)-1:-1:0); 
y = sum(x.*repmat(z,[size(x,1) 1]),2); 
end