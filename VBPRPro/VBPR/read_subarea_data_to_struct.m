function [data]=read_subarea_data_to_struct(imgreffile,img_path)
% read subarea image data to a struct
%
% Input:
%   imgreffile - the subarea reference image file for georeference info
%   img_path - the path to the image data files including the view angle
%   files
%
% Output:
%   data - a data struct contains image data including view angles
%

%% retreive all image file names
img_fnames = dir([img_path 'SUB*2A*.tif']);
img_fnames = {img_fnames(~[img_fnames.isdir]).name};

%% define resulution
if contains(img_fnames{3},'10m')
    resstr = '10m';
    RES=10;
elseif contains(img_fnames{3},'20m')
    resstr = '20m';
    RES=20;
end

%% initialize output data struct
data=[];

%% read in geocoding data from subarea reference image file
if license('test','MAP_Toolbox') == 1
    info = geotiffinfo(imgreffile); %% need mapping toolbox
    Ib.BoundingBox=info.BoundingBox;
    Ib.ModelPixelScaleTag = info.GeoTIFFTags.ModelPixelScaleTag; %info.PixelScale; %[10;10;0];
    Ib.ModelTiepointTag = info.GeoTIFFTags.ModelTiepointTag; %[0;0;0;ulx;uly;0];
    Ib.GTModelTypeGeoKey = 1;
    Ib.ProjectedCSTypeGeoKey = info.GeoTIFFCodes.PCS;
else
    [img,x,y,info] = geoimread(imgreffile);
    Ib.BoundingBox=info.BoundingBox;
    Ib.ModelPixelScaleTag = info.ModelPixelScaleTag; %info.PixelScale; %[10;10;0];
    Ib.ModelTiepointTag = info.ModelTiepointTag; %[0;0;0;ulx;uly;0];
    Ib.GTModelTypeGeoKey = 1;
    Ib.GeoKeyDirectoryTag = info.GeoKeyDirectoryTag;
    clear img x y;
end
%load info.mat info;

data.Ib=Ib;
data.NROWS=info.Height;
data.NCOLS=info.Width;
data.xb=Ib.BoundingBox(1,1):RES:Ib.BoundingBox(2,1);
data.yb=Ib.BoundingBox(2,2):-RES:Ib.BoundingBox(1,2);
data.RES = RES;
   
%% read in the image band data
file_name=dir([img_path,'*B03_' resstr '.tif']);
file_name=file_name(1).name;
for bb={'B03','B04','B05','B06','B07','B8A','B11','B12'}
    file_name_band=strrep(file_name,'B03',char(bb));
    band = double(geoimread([img_path,'\',file_name_band]));
    eval(['data.',char(bb),'=band;'])
end

%% read in the view angle data
file_name=dir([img_path,'\*sensor_azimuth_' resstr '.tif']);
file_name=file_name(1).name;
for bb={'sensor_zenith','solar_zenith','sensor_azimuth','solar_azimuth'}
    file_name_band=strrep(file_name,'sensor_azimuth',char(bb));
    band = double(geoimread([img_path,'\',file_name_band]));
    eval(['data.',char(bb),'=band;'])
end

%% read in the sense classification data
file_name=dir([img_path,'\*SCL*' resstr '.tif']);
file_name=file_name(1).name;
band = double(geoimread([img_path,'\',file_name]));
data.SCL=band;

clear band;

end


