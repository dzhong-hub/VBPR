%% Start counting processing time
tic;

% Directory of the selected files
in_dir = 'F:\SentinelTest\S2018\S2Tile43\SelectedTif';
% Directory for the reprojected image files
out_dir = 'F:\SentinelTest\S2018\S2Tile43\LccTif';

% Retrieve the names of the selected files
names = dir(in_dir);
names = {names(~[names.isdir]).name};

%% open a log file to record computation progresses
logfile = [out_dir '\reprojection.log'];
if exist(logfile,'file')
    delete logfile;
end
flog = fopen(logfile,'wt');
handles = 0;
logmsg(flog,handles,'Reprojection by PCI REPROJ module started.');

% Reproject the selected files by the PCI REPROJECT Module in a LOOP
for n = 1:numel(names)
    [path, name, ext] = fileparts(names{n});    
	in_file = [in_dir '\' name '.tif'];
    out_file = [out_dir '\LCC_' name '.tif'];
    
    % check if the file exists
    if exist(in_file, 'file')
        % Reproject the selected images by PCI REPROJECT module
        reprojByPCIReproj(in_file, out_file);
    else
        logmsg(flog,handles,[in_file 'is not found.']);
    end   
end

ttime = toc;
disp(['>>> Elapsed time: ', num2str(ttime),' seconds. <<<'])
disp(' ')

%% close the log file
logmsg(flog,handles,'Completed reprojections successfully');
logmsg(flog,handles,['>>> Elapsed time: ', num2str(ttime),' seconds. <<<']);
fclose(flog);

disp('>>> Reprojections is done. <<<');
