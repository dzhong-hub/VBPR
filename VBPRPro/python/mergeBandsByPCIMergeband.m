function merged_file = mergeBandsByPCIMergeband(in_file_list, output_file)
%
% function call to PCI MOSAIC modules to mosaic tiles
%
% Input:
% in_file_list: a list file of input image files to be merged
% output_file: merged output file
%
% Output:
% merged_file: the output file
%
% Detang Zhong, detang.zhong@canada.ca, 2019-06-21
%

global app_dir;

%% change current folder to python script folder
cur_dir = cd;
cd(app_dir.python);

%% add the current folder to the Python search path.
if count(py.sys.path,'') == 0
    insert(py.sys.path,int32(0),'');
end

%% Import Modified Module
pcimod = py.importlib.import_module('pci_geomatica');

%% run mosprep to prepare a mosaic project
in_list_file = py.str(in_file_list);
out_file = py.str(output_file);

%% run mosprep to prepare a mosaic project
py.pci_geomatica.call_mergeband(in_list_file,out_file);

%% return the output file path
merged_file = out_file;

cd(cur_dir);

end

