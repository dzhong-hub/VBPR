% Directory of the selected files
d1 = 'F:\SentinelTest\S2018\SelectedFinal';
d2 = 'F:\SentinelTest\S2018\SelectedZip';

% Retrieve the names of the selected files
names = dir(d1);
names = {names(~[names.isdir]).name};

% Directory of the downloaded files
d3 = 'F:\SentinelTest\S2018';

% Copy selected files in a LOOP
% cd(d3);
for n = 1:numel(names)
    [path, name, ext] = fileparts(names{n});
	zipfile = [d3 '\' name '.zip'];
    tozipfile = [d2 '\' name '.zip'];
    if exist(zipfile, 'file')
        copyfile(zipfile, tozipfile,'f');
    else
        msgbox([zipfile 'is not found.']);
    end
end

msgbox('Copy selected files is done.');