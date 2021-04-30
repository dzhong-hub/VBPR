function lic_status = LicenseGetStatus()
% 
% LicenseGetStatus() returns current license status
%

global app_dir;

lic_status.valid = 2;
lic_status.msg = 'No license file available.';
lic_status.filename = ' ';

% % check license status
% cur_dir = cd;
% cd(app_dir.root);
% lic_file = 'GravGEOID.lic';
% if exist(lic_file,'file')
%     PCID = getsid;
%     LicenseID = CreateLicenseID(PCID);
%     % CurDateNum = datenum(datetime('now'));
%     CurDateNum = now;
%     
%     fid = fopen(lic_file,'r');
%     lic = fread(fid,[1 2],'double');
%     fclose(fid);
% 
%     ValidLicenseID = lic(1);
%     ValidDateNum = lic(2);
% 
%     if LicenseID == ValidLicenseID && CurDateNum < ValidDateNum
%         lic_status.valid = 2;
%         lic_status.msg = ['Valid until ' datestr(ValidDateNum)];
%     else
%         lic_status.valid = 2;
%         lic_status.msg = ['Expired at ' datestr(ValidDateNum)];
%     end
%     lic_status.filename = lic_file;
% else
%     lic_status.valid = 2;
%     lic_status.msg = 'No license file available.';
%     lic_status.filename = ' ';
% end    
% cd(cur_dir);

return;

function LicenseID = CreateLicenseID(PCID)
% generated a license id according to the PCID
% ids = strsplit(PCID,'-');
ids = regexp(PCID, '-', 'split');
ids(1)=[];
id1 = [ids{3} ids{2} ids{1}];
id2 = num2str(fix(str2num(ids{6})/500024));
id3 = num2str(fix(str2num(ids{5})/400048));
id4 = num2str(fix(str2num(ids{4})/300072));
% LicenseID = [id1 '-' id2 '-' id3 '-' id4];
LicenseID = str2double([id1 id2 id3 id4]);




