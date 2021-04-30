function ret = extractByPCIclip(source_file, ref_file, out_file)
%
% function call to PCI clip module to extracts the subset of a dataset 
% that intersects a specified spatial region
%
% Input:
% source_file:  the source file to be clipped
% ref_file:     input file used to define the subset area
% out_file:     output file of the clipped subset image
%
% Oiutput:
% ret:          return value to indicate a sucess or fail
%
% Detang Zhong, detang.zhong@canada.ca, 2018-11-21
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
s_fili   = py.str(source_file);           % Specifies the input file
o_filo   = py.str(out_file);              % Specifies the output file
o_ftype  = py.str('TIF');                 % Specifies a PCIDSK file type
i_clipfil = py.str(ref_file);             % Uses a input file to define the subset

py.pci_geomatica.call_clip(s_fili,o_filo,o_ftype,i_clipfil);

cd(cur_dir);

end

