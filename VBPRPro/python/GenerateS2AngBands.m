function ang_path = GenerateS2AngBands(source_file, resolution)
%
% function call to S2_angs.py to generate the view angles bands of S2 LIC images 
%
% Input:
% source_file:  the granule xml file of Sentinel-2 LIC data (could be a .zip, a .SAFE or the MTD_TL.xml file)
% resolution:   the output resolution: 10m, 20m, 60m
%
% Oiutput:
% ang_path:     the path to following view angle bands files
% Solor_zenith_23 - the solor zenith angle band in its original 23x23 resolution 
% Solor_zenith_resampled - the solor zenith angle band in resampled resolution 
% Solor_azimuth_23 - the solor azimuth angle band in its original 23x23 resolution 
% Solor_azimuth_resampled - the solor azimuth angle band in resampled resolution
% View_zenith_23 - the solor zenith angle band in its original 23x23 resolution 
% View_zenith_resampled - the solor zenith angle band in resampled resolution 
% View_azimuth_23 - the solor azimuth angle band in its original 23x23 resolution 
% View_azimuth_resampled - the solor azimuth angle band in resampled resolution  
%
% Detang Zhong, detang.zhong@canada.ca, 2020-01-21
%

global app_dir;

% call python script for extraction
cur_dir = cd;
cd(app_dir.python);
                            
%% unload modules
% clear classes;

%% add the current folder to the Python search path.
if count(py.sys.path,'') == 0
    insert(py.sys.path,int32(0),'');
end

%% Import s2_angs Module
s2_angs = py.importlib.import_module('s2_angs');

%% prepare python variables
% Specifies the input path 
path = py.str(source_file);
resol = py.str(resolution);
          
% call the module to generate the view angle bands
% ang_path = py.s2_angs.gen_s2_ang(path);
ang_path = py.s2_angs.gen_s2_ang_from_xml(path,resol); % limited to LiC xml file

%% convert back to matlab variables
ang_path = string(cell(ang_path));

cd(cur_dir);

end

