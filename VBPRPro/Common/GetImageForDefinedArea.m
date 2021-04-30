function outtiffile = GetImageForDefinedArea(tiffile, xlimits, ylimits, overwrite)
% Write a subset of a GeoTIFF file to a new GeoTIFF file.
%
% Input:
%   tiffile - file path to a geotiff image file
%   xlimits - the X (East) coordinate range of the subset; 
%   ylimits - the Y (North) coordinate range of the subset;
%   overwrite - overwrite the input tiffile with the retreived subarea image
%
% Output:
%   outtiffile - file path to the retreived image file
%

%% Read the image and referencing information
%[A, R] = geotiffread(tiffile);
[A, R] = readgeoraster(tiffile);

%% Crop the image
[subA,subR] = mapcrop(A,R,xlimits,ylimits);

%% Write the cropped image to a GeoTIFF file. Use the GeoKeyDirectoryTag from the original GeoTIFF file.
info = geotiffinfo(tiffile);

if overwrite > 0
    outtiffile = tiffile;
else
    %% determine output file name
    [pathstr, fname, ext] = fileparts(tiffile);
    [r, c, b] = size(subA);
    outtiffile = [pathstr '\' fname '_SUBAREA_' num2str(r) 'x' num2str(c) ext];
end

%% save the tiff file for the retrived area
geotiffwrite(outtiffile,subA,subR, 'GeoKeyDirectoryTag', info.GeoTIFFTags.GeoKeyDirectoryTag);

end

