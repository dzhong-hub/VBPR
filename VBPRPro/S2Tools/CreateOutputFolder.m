function out_dir = CreateOutputFolder(out_dir,method)
% create an output data folder according to the selected downscaling method

out_dir = [out_dir '\' method];
if exist(out_dir,'dir') ~= 7
    mkdir(out_dir);             
end

end

