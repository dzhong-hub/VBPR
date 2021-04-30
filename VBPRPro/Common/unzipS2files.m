%% Start counting processing time
tic;

% Directory of the selected zip files
in_dir = 'F:\SentinelTest\S2018\S2Tile43\SelectedZip';
% Directory for the reprojected image files
out_dir = 'F:\SentinelTest\S2018\S2Tile43\Unziped';

% Retrieve the names of the selected files
names = dir(in_dir);
names = {names(~[names.isdir]).name};

% %% open a log file to record computation progresses
% logfile = [out_dir '\unzipfiles.log'];
% if exist(logfile,'file')
%     delete logfile;
% end
% flog = fopen(logfile,'wt');
% handles = 0;
% logmsg(flog,handles,'Unzip Sentinel 2 L1C files started.');

% Unzip all files in a LOOP
for n = 1:numel(names)
    [path, name, ext] = fileparts(names{n});    
	in_file = [in_dir '\' name '.zip'];
    out_folder = [out_dir '\' name];
    
    % check if the file exists
    if exist(in_file, 'file')
        % unzip to the output folder
        unzip(in_file,out_folder);
    else
        % logmsg(flog,handles,[in_file 'is not found.']);
    end   
end

ttime = toc;
disp(['>>> Elapsed time: ', num2str(ttime),' seconds. <<<'])
disp(' ')

% %% close the log file
% logmsg(flog,handles,'Completed unzip successfully');
% logmsg(flog,handles,['>>> Elapsed time: ', num2str(ttime),' seconds. <<<']);
% fclose(flog);

disp('>>> Unzip files done. <<<');
