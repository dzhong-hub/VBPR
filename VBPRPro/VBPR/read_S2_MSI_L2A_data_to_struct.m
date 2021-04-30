function [data]=read_S2_MSIL2A_data_to_struct(xmlfile,S2L2A_path)
% read S2 MSIL2A image data to a struct
%
% Input:
%   xmlfile - the XML file of the granuale
%   S2L2A_path - the path to the image data files
%
% Output:
%   data - a data struct contains image data including view angles
%

%% retreive all image file names
img_fnames = dir([S2L2A_path '*2A*.tif']);
img_fnames = {img_fnames(~[img_fnames.isdir]).name};

%% define resulution
if contains(img_fnames{3},'10m')
    RES=10;
    Resolution_id=1;
elseif comtains(img_fnames{3},'20m')
    RES=20;
    Resolution_id=2;
end

%% read in geocoding data from S2 XML file
meta = xml2struct(xmlfile);
im_size=meta.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Geocoding.Size{Resolution_id};
im_geop=meta.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Geocoding.Geoposition{Resolution_id};

ULX=str2num(im_geop.ULX.Text);
ULY=str2num(im_geop.ULY.Text);
XDIM=str2num(im_geop.XDIM.Text);
YDIM=str2num(im_geop.YDIM.Text);
NROWS=str2num(im_size.NROWS.Text);
NCOLS=str2num(im_size.NCOLS.Text);

Ib.GeoAsciiParamsTag=meta.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Geocoding.HORIZONTAL_CS_NAME;
Ib.BoundingBox=[sort([ULX;ULX+XDIM*(NCOLS-1)]),sort([ULY;ULY+YDIM*(NROWS-1)])];
Ib.utmzone = [Ib.GeoAsciiParamsTag.Text(end-2:end-1) ' ' Ib.GeoAsciiParamsTag.Text(end)];

[lat,lon] = utm2deg(Ib.BoundingBox(:,1),Ib.BoundingBox(:,2),[Ib.utmzone;Ib.utmzone]);

%% initialize output data struct
data=[];
data.Ib=Ib;
data.NROWS=NROWS;
data.NCOLS=NCOLS;
data.xb=Ib.BoundingBox(1,1):XDIM:Ib.BoundingBox(2,1);
data.yb=Ib.BoundingBox(2,2):YDIM:Ib.BoundingBox(1,2);
data.lat = lat;
data.lon = lon;
data.RES = RES;

%% read in image data
for dd=1:length(img_fnames)
    ffname=char(img_fnames(dd));
    band=double(geoimread([S2L2A_path,ffname]));
    ffname=strsplit(ffname,'_');
    eval(['data.',ffname{end-1},'=band;'])
end

%% read in the sense classification data
[path,fname,ext] = fileparts(xmlfile);
scl_path=[path,'\IMG_DATA\'];
sclfname=dir([scl_path,'*SCL*20m.jp2']);
scl = double(imread([scl_path,sclfname(1).name]));
if RES==10 % resample to 10m resolution
    data.SCL=imresize(scl,2,'nearest');
else
    data.SCL=scl;
end

%% retreive geomatric_information from meta data
ROW_STEP_An=str2num(meta.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Angles.Sun_Angles_Grid.Zenith.ROW_STEP.Text);
COL_STEP_An=str2num(meta.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Angles.Sun_Angles_Grid.Zenith.COL_STEP.Text);
SIZE_ANG=length(meta.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Angles.Sun_Angles_Grid.Zenith.Values_List.VALUES);

sun_zenith=[];
for dd=1:length(meta.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Angles.Sun_Angles_Grid.Zenith.Values_List.VALUES)
 sun_zenith=[sun_zenith;str2double(strsplit(meta.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Angles.Sun_Angles_Grid.Zenith.Values_List.VALUES{dd}.Text,' '))];
end

sun_azimuth=[];
for dd=1:length(meta.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Angles.Sun_Angles_Grid.Azimuth.Values_List.VALUES)
 sun_azimuth=[sun_azimuth;str2double(strsplit(meta.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Angles.Sun_Angles_Grid.Zenith.Values_List.VALUES{dd}.Text,' '))];
end

view_zenith=[];
view_azimuth=[];
for dd=1:length(meta.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Angles.Viewing_Incidence_Angles_Grids)
    data_z=meta.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Angles.Viewing_Incidence_Angles_Grids{dd}.Zenith.Values_List.VALUES;
    data_a=meta.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Angles.Viewing_Incidence_Angles_Grids{dd}.Azimuth.Values_List.VALUES;
    view_zenith_0=[];
    view_azimuth_0=[];
    
    for vv=1:length(data_z)
        view_zenith_0=[view_zenith_0;str2double(strsplit(data_z{vv}.Text,' '))];
    end
    for vv=1:length(data_a)
        view_azimuth_0=[view_azimuth_0;str2double(strsplit(data_a{vv}.Text,' '))];
    end
    view_zenith(:,:,dd)=view_zenith_0;
    view_azimuth(:,:,dd)=view_azimuth_0;
end
view_zenith=nanmean(view_zenith,3);
view_azimuth=nanmean(view_azimuth,3);

%% resampling the view angles
sun_zenith_0=NaN(NROWS,NCOLS);
sun_azimuth_0=NaN(NROWS,NCOLS);
view_zenith_0=NaN(NROWS,NCOLS);
view_azimuth_0=NaN(NROWS,NCOLS);

II=(1:ROW_STEP_An/RES:SIZE_ANG*ROW_STEP_An/RES);
JJ=(1:COL_STEP_An/RES:SIZE_ANG*COL_STEP_An/RES);
for ii=1:length(II)-1
    for jj=1:length(JJ)-1
        sun_zenith_0(II(ii):II(ii+1),JJ(jj):JJ(jj+1))=sun_zenith(ii,jj);
        sun_azimuth_0(II(ii):II(ii+1),JJ(jj):JJ(jj+1))=sun_azimuth(ii,jj);
        view_zenith_0(II(ii):II(ii+1),JJ(jj):JJ(jj+1))=view_zenith(ii,jj);
        view_azimuth_0(II(ii):II(ii+1),JJ(jj):JJ(jj+1))=view_azimuth(ii,jj);
    end
end

%% assign the angle data to the output data struct
data.view_zenith=view_zenith_0(1:NROWS,1:NCOLS);
data.sun_zenith=sun_zenith_0(1:NROWS,1:NCOLS);
data.view_azimuth=view_azimuth_0(1:NROWS,1:NCOLS);
data.sun_azimuth=sun_azimuth_0(1:NROWS,1:NCOLS);

clear ULX ULY XDIM YDIM NROWS NCOLS lat lon 
clear ROW_STEP_An COL_STEP_An SIZE_ANG
clear sun_zenith sun_azimuth view_zenith view_azimuth
clear sun_zenith_0 sun_azimuth_0 view_zenith_0 view_azimuth_0

end


