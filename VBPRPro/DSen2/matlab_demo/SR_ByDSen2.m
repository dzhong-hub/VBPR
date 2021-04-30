function SR10 = RS_ByDSen2(im10, im20)
%% Super resolve S2-MSI images by DSen2
% ----------------------------------------------------------------------- %
% DSen2: Deep Sentinel-2
% 
% Super-resolution of Sentinel-2 images: Learning a globally applicable
% deep neural network
% 
% C. Lanaras, J. Bioucas-Dias, S. Galliani, E. Baltsavias, K. Schindler.
% ISPRS Journal of Photogrammetry and Remote Sensing
% Volume 146, Dec. 2018, Pages 305-319
% https://doi.org/10.1016/j.isprsjprs.2018.09.018 
% ----------------------------------------------------------------------- %

% Input:
%   im10 - data cube with 4 bands of 10m resolution image data in the order
%   (B4, B3, B2, B8)
%   im20 - data cube with 6 bands of 20m resolution image data in the order
%   (B5, B6, B7, B8a, B11, B12)
%Output:
%   SR10 - super resolved 6 bands of 10m resolution image data in the order
%   (B5, B6, B7, B8a, B11, B12)

SR10 = DSen2(im10, im20);

