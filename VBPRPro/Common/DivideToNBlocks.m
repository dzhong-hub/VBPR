function Yim = DivideToNBlocks(img,N)
% Divide the image to N blocks
%   
% Input: 
%   img - image data
%   N - block number
% Output:
%   Yim - a cell array (1:NxN) of the blocked images
%

[r, c]=size(img);
rb = r/N; cb = c/N;
blocks = cell(N,N);

for i=1:N
  for j=1:N    
    blocks{i,j} = img((rb*(i-1)+1:rb*(i-1)+rb),(cb*(j-1)+1:cb*(j-1)+cb));      
  end
end
Yim = reshape(blocks,1,N*N);

end


