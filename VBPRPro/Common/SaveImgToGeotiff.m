function tiffile = SaveImgToGeotiff(img,out_fn,info)
% save image data to a geotiff file 
%
% Input:
%   img - image data
%   out_fn - output file name
%   info - georeference information
% Output:
%   tiffile - saved geotiff file
%
% Note: to crop a subarea image, the Matlab 2020a or later version mapping toolbox is required

%% save the tile image to a geotiff file
% dtermine image resolution
[x,y] = size(img);
% create the R georeferencing matrix
if x == info.res_10.nrow  &&   y == info.res_10.ncol
    option.ModelPixelScaleTag = [10;10;0];
    option.ModelTiepointTag = [0;0;0;info.res_10.ulx;info.res_10.uly;0];
    bbox =  [  info.res_10.ulx,  info.res_10.uly - 10*info.res_10.nrow ; info.res_10.ulx + 10*info.res_10.ncol,  info.res_10.uly  ];
    %R = maprasterref(info.res_10.nrow,info.res_10.ncol, [info.res_10.uly - 10*info.res_10.nrow info.res_10.uly ], [info.res_10.ulx  info.res_10.ulx + 10*info.res_10.ncol ]);
end
if x == info.res_20.nrow  &&   y == info.res_20.ncol
    option.ModelPixelScaleTag = [20;20;0];
    option.ModelTiepointTag = [0;0;0;info.res_20.ulx;info.res_20.uly;0];
    bbox =  [  info.res_20.ulx,  info.res_20.uly - 20*info.res_20.nrow ; info.res_20.ulx + 20*info.res_20.ncol,  info.res_20.uly  ];
    %R = maprasterref(info.res_20.nrow,info.res_20.ncol, [info.res_20.uly - 20*info.res_20.nrow info.res_20.uly ], [info.res_20.ulx  info.res_20.ulx + 20*info.res_20.ncol ]);
end
if x == info.res_60.nrow  &&   y == info.res_60.ncol
    option.ModelPixelScaleTag = [60;60;0];
    option.ModelTiepointTag = [0;0;0;info.res_60.ulx;info.res_60.uly;0];
    bbox =  [  info.res_60.ulx,  info.res_60.uly - 60*info.res_60.nrow ; info.res_60.ulx + 60*info.res_60.ncol,  info.res_60.uly  ];
    %R = maprasterref(info.res_60.nrow,info.res_60.ncol, [info.res_60.uly - 60*info.res_60.nrow info.res_60.uly ], [info.res_60.ulx  info.res_60.ulx + 60*info.res_60.ncol ]);
end
option.GTModelTypeGeoKey = 1;
option.ProjectedCSTypeGeoKey = info.code;
geotiffwrite(out_fn, bbox, img, -16, option);

tiffile = out_fn;

end

