function ret = MatchByPCI(ref_file, dep_file, out_file, ref_band, dep_band, wv3_bands)
%
% function call to PCI clip module to automatically coregister WV3 image to
% S2 image
%
% Input:
% ref_file:  S2 reference image file
% dep_file:  WV3 image file
% out_file:  output file of the coregistered WV3 image
% ref_band:  reference input band
% dep_band:  dependence input band
% wv3_bands: bands number of WV3 image
%
% Oiutput:
% ret:          return value to indicate a sucess or fail
%
% Detang Zhong, detang.zhong@canada.ca, 2021-02-08
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

%% Import Modified Module
pcimod = py.importlib.import_module('pci_geomatica');

%% Reload Module in Python Version 2.7
% py.reload(pcimod);

%% delete the old output file if exists
if exist(out_file,'file')
    delete(out_file);
end

%% prepare python variables 
ref_file   = py.str(ref_file);              % Specifies the reference input file
dep_file   = py.str(dep_file);              % Specifies the dependence input file
out_file   = py.str(out_file);              % Specifies the output file
ref_band   = py.list({py.int(ref_band)});   % Specifies the reference input channel
dep_band   = py.list({py.int(dep_band)});   % Specifies the dependence input channel

switch wv3_bands
    case 1
        dep_list = py.list({py.int(1)});
    case 3
        dep_list = py.list({py.int(1),py.int(2),py.int(3)});
    case 4
        dep_list = py.list({py.int(1),py.int(2),py.int(3),py.int(4)});
    case 5
        dep_list = py.list({py.int(1),py.int(2),py.int(3),py.int(4),py.int(5)});
    case 6
        dep_list = py.list({py.int(1),py.int(2),py.int(3),py.int(4),py.int(5),py.int(6)});
    case 8
        dep_list = py.list({py.int(1),py.int(2),py.int(3),py.int(4),py.int(5),py.int(6),py.int(7),py.int(8)});
    otherwise
        msgbox('WV3 input band channels is not supported yet!', 'Error','error');
        return;
end

py.pci_geomatica.call_inscoreg(ref_file, ref_band, dep_file, dep_band, dep_list, out_file);

cd(cur_dir);

end

