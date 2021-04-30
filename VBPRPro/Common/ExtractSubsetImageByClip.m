%% Start counting processing time
tic;

% The source file to be clipped
% source_file = 'F:\SentinelTest\S2018\SelectedFinal\LandsatTile43.pix';
source_file = 'F:\SentinelTest\S2018\S2Tile43\MergedTif\LandsatTile43.tif';
info = geotiffinfo(source_file);
xmin = min(info.BoundingBox(:,1)); xmax = max(info.BoundingBox(:,1));
ymin = min(info.BoundingBox(:,2)); ymax = max(info.BoundingBox(:,2));

% Directory of the selected files
in_dir = 'F:\SentinelTest\S2018\S2Tile43\LccTif';

% Retrieve the names of the selected files
names = dir(in_dir);
names = {names(~[names.isdir]).name};

% Directory for the clipped subset image files
out_dir = 'F:\SentinelTest\S2018\S2Tile43\RefTif';

%% open a log file to record computation progresses
logfile = [out_dir '\extraction.log'];
if exist(logfile,'file')
    delete logfile;
end
flog = fopen(logfile,'wt');
handles = 0;
logmsg(flog,handles,'Extraction by PCI CLIP module started.');


% Clip the selected files by the PCI CLIP Module in a LOOP
for n = 1:numel(names)
    [path, name, ext] = fileparts(names{n});    
	in_file = [in_dir '\' name '.tif'];
    out_file = [out_dir '\REF_' name '.tif'];
    
    % check if the file exists
    if exist(in_file, 'file')
        % check if the input file is within the image to be clipped
        info = geotiffinfo(in_file);
        x1 = min(info.BoundingBox(:,1)); x2 = max(info.BoundingBox(:,1));
        y1 = min(info.BoundingBox(:,2)); y2 = max(info.BoundingBox(:,2));
        if (x1 >= xmax || x2 <= xmin || y1 >= ymax || y2 <= ymin)
            logmsg(flog,handles,[in_file 'is out of the tile range.']);
        else
            % Extract subset image by PCI CLIP module
            extractByPCIclip(source_file, in_file, out_file);
        end
    else
        logmsg(flog,handles,[in_file 'is not found.']);
    end   
end

ttime = toc;
disp(['>>> Elapsed time: ', num2str(ttime),' seconds. <<<'])
disp(' ')

%% close the log file
logmsg(flog,handles,'Completed extraction successfully');
logmsg(flog,handles,['>>> Elapsed time: ', num2str(ttime),' seconds. <<<']);
fclose(flog);

disp('>>> Extract subset images for the selected files is done. <<<');
