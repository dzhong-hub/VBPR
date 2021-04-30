function [bm, mask] = blockmean(img, br, bc, rb, cb)

%% function used to calculate image block mean values of each band
%
% Input:
% img: the image pixel input data in r*c*b matrix
% br: row number of the image after blockmean
% bc: col number of the image after blockmean
% rb: row number of the block size
% cb: col number of the block size
%
% Output:
% bm: the calculated block mean 
% mask: the mask for invalid pixels (e.g. if there are negative pixel values in the block)

[r, c, bd] = size(img);
bm = zeros(br,bc,bd);
mask = zeros(br,bc,bd);

for b=1:bd % loop for bands
    for i=1:br
        for j=1:bc
            % get the block data 
            brr = r-rb*(i-1); bcc = c-cb*(j-1);
            if brr > rb; brr = rb; end
            if bcc > cb; bcc = cb; end
            dd = img((rb*(i-1)+1:rb*(i-1)+brr),(cb*(j-1)+1:cb*(j-1)+bcc),b);
            % detect invalid pixels
            idx1 = find(dd<=0); idx2 = find(dd>=10000);
            if ~isempty(idx1) || ~isempty(idx2) % if find negative or invalid pixels, mask it and keep it as 0
                mask(i,j,b) = 1;
            else
                bm(i,j,b) = sum(dd(:),'double') / numel(dd); 
            end
        end
    end
end

end

