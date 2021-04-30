function out_dir = createOutputFolder(out_dir,method)
% Create a new output data folder
%
% Input:
%   out_dir - output data folder
%   method - selected super resolution method
% Output:
%   out_dir - created output data folder
%
% out_dir = [out_dir '\' method];
out_dir = [out_dir method];
if exist(out_dir,'dir') ~= 7
    %% Create output folders
    mkdir(out_dir);             
end

end

