function sid = getsid
% getsid Retrieves a Windows-system's unique computer identifier (SID)
%
% Syntax:
%    sid = getsid
%
% Description:
%    GETSID scans the Windows registry for the SID data, and returns it
%    if found. This is useful in cases where you wish to limit or change
%    some functionality for specific computers, and need an identifying ID.
%
%    GETSID is equivalent to the Microsoft utility <a href="http://www.microsoft.com/technet/sysinternals/utilities/psgetsid.mspx">PsGetSid</a>
%
%    GETSID requires Microsoft Windows, and works on Matlab 6 and up.
%
% Bugs and suggestions:
%    Please send to Yair Altman (altmany at gmail dot com)
%
% Change log:
%    2007-07-27: First version posted on <a href="http://www.mathworks.com/matlabcentral/fileexchange/loadAuthor.do?objectType=author&mfx=1&objectId=1096533#">MathWorks File Exchange</a>
%
% See also:
%    license

% Programmed by Yair M. Altman: altmany(at)gmail.com
% $Revision: 1.0 $  $Date: 2007/07/27 01:39:24 $

  try
      sid = '';

      if ~ispc
          error('getsid only works on Microsoft Windows');
      end

      % Note: scanning HKEY_USERS node names is better, but Matlab's winqueryreg() can't do that...
      rootkey = 'HKEY_CURRENT_USER';
      subkey = 'Software\Microsoft\Windows\CurrentVersion\Group Policy\GroupMembership';
      count = winqueryreg(rootkey,subkey,'Count');
      for idx = 0 : double(count)-1   % Note: double() is needed for Matlab 6 compitability
          val = winqueryreg(rootkey,subkey,['Group' char('0'+idx)]);
          dashes = find(val=='-');
          if length(dashes) > 4,  sid = val(1:dashes(end)-1);  break;  end   % short ids are phoney
      end

  % Error handling
  catch
      v = version;
      if v(1)<='6'
          err.message = lasterr;  % no lasterror function...
      else
          err = lasterror;
      end
      try
          err.message = regexprep(err.message,'Error using ==> [^\n]+\n','');
      catch
          try
              % Another approach, used in Matlab 6 (where regexprep is unavailable)
              startIdx = findstr(err.message,'Error using ==> ');
              stopIdx = findstr(err.message,char(10));
              for idx = length(startIdx) : -1 : 1
                  idx2 = min(find(stopIdx > startIdx(idx)));  %#ok ML6
                  err.message(startIdx(idx):stopIdx(idx2)) = [];
              end
          catch
              % never mind...
          end
      end
      if isempty(findstr(mfilename,err.message))
          % Indicate error origin, if not already stated within the error message
          err.message = [mfilename ': ' err.message];
      end
      if v(1)<='6'
          while err.message(end)==char(10)
              err.message(end) = [];  % strip excessive Matlab 6 newlines
          end
          error(err.message);
      else
          rethrow(err);
      end
  end
