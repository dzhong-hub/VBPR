function varargout = LicenseGenerator(varargin)
% LICENSEGENERATOR MATLAB code for LicenseGenerator.fig
%      LICENSEGENERATOR, by itself, creates a new LICENSEGENERATOR or raises the existing
%      singleton*.
%
%      H = LICENSEGENERATOR returns the handle to a new LICENSEGENERATOR or the handle to
%      the existing singleton*.
%
%      LICENSEGENERATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LICENSEGENERATOR.M with the given input arguments.
%
%      LICENSEGENERATOR('Property','Value',...) creates a new LICENSEGENERATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LicenseGenerator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LicenseGenerator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LicenseGenerator

% Last Modified by GUIDE v2.5 23-Apr-2015 08:24:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LicenseGenerator_OpeningFcn, ...
                   'gui_OutputFcn',  @LicenseGenerator_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before LicenseGenerator is made visible.
function LicenseGenerator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LicenseGenerator (see VARARGIN)

% Choose default command line output for LicenseGenerator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LicenseGenerator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LicenseGenerator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtPCName_Callback(hObject, eventdata, handles)
% hObject    handle to txtPCName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtPCName as text
%        str2double(get(hObject,'String')) returns contents of txtPCName as a double


% --- Executes during object creation, after setting all properties.
function txtPCName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtPCName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtUserName_Callback(hObject, eventdata, handles)
% hObject    handle to txtUserName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtUserName as text
%        str2double(get(hObject,'String')) returns contents of txtUserName as a double


% --- Executes during object creation, after setting all properties.
function txtUserName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtUserName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtPCID_Callback(hObject, eventdata, handles)
% hObject    handle to txtPCID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtPCID as text
%        str2double(get(hObject,'String')) returns contents of txtPCID as a double


% --- Executes during object creation, after setting all properties.
function txtPCID_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtPCID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbEmail.
function pbEmail_Callback(hObject, eventdata, handles)
% hObject    handle to pbEmail (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

recipients = get(handles.txtEmailAddress,'String');
subject = 'SRSIBPro licence file'; 
message = 'Copy the attached license file SRSIBPro.lic to your SRSIBPro installation folder to activate your license!  - Detang';
attachements = cellstr(strtrim(get(handles.txtLicenseFile,'String')));

sendolmail(recipients,subject,message,attachements);

msgbox(['The license file has been emailed to ' recipients]);

return;



function txtLicenseFile_Callback(hObject, eventdata, handles)
% hObject    handle to txtLicenseFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtLicenseFile as text
%        str2double(get(hObject,'String')) returns contents of txtLicenseFile as a double


% --- Executes during object creation, after setting all properties.
function txtLicenseFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtLicenseFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowse.
function pbBrowse_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, pathname] = uigetfile( ...
    {  'SRSIBPro.lic','SRSIBPro License File (SRSIBPro.lic)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Select SRSIBPro License File');
 if  filename > 0    
    set(handles.txtLicenseFile, 'String', [pathname filename]);
 else
     return;
 end
 

% --- Executes on button press in pbCreate.
function pbCreate_Callback(hObject, eventdata, handles)
% hObject    handle to pbCreate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

lic_file = get(handles.txtLicenseFile, 'String');
lic_file = strtrim(lic_file);
PCName = get(handles.txtPCName, 'String');
UserName = get(handles.txtUserName, 'String');
PCID = get(handles.txtPCID, 'String');
Duration = str2num(get(handles.txtDuration,'String'));

LicenseID = CreateLicenseID(PCID);
% t = datenum(datetime('now'));
t = now;
ValidDateNum = addtodate(t, Duration, 'day');

% lic = struct('PCName',PCName,...
%              'userName', UserName,...
%              'PCID', PCID,...
%              'LicenseID', LicenseID,...
%              'ValidDateNum', ValidDateNum);
         
lic = [LicenseID,ValidDateNum]; 
fid = fopen(lic_file,'w');
fwrite(fid,lic,'double');
fclose(fid);

msgbox('License file has been created.');

return;


% --- Executes on button press in pbClose.
function pbClose_Callback(hObject, eventdata, handles)
% hObject    handle to pbClose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close;


function txtEmailAddress_Callback(hObject, eventdata, handles)
% hObject    handle to txtEmailAddress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtEmailAddress as text
%        str2double(get(hObject,'String')) returns contents of txtEmailAddress as a double


% --- Executes during object creation, after setting all properties.
function txtEmailAddress_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtEmailAddress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtDuration_Callback(hObject, eventdata, handles)
% hObject    handle to txtDuration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtDuration as text
%        str2double(get(hObject,'String')) returns contents of txtDuration as a double


% --- Executes during object creation, after setting all properties.
function txtDuration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtDuration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

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
    
function LicenseInfo = GetLicenseStatus(licfile)
% generated a license id according to the PCID


% --- Executes on button press in pbVerifyLicense.
function pbVerifyLicense_Callback(hObject, eventdata, handles)
% hObject    handle to pbVerifyLicense (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

lic_file = get(handles.txtLicenseFile, 'String');
lic_file = strtrim(lic_file);
PCName = get(handles.txtPCName, 'String');
UserName = get(handles.txtUserName, 'String');
PCID = get(handles.txtPCID, 'String');
Duration = str2num(get(handles.txtDuration,'String'));

LicenseID = CreateLicenseID(PCID);
% CurDateNum = datenum(datetime('now'));
CurDateNum = now;

fid = fopen(lic_file,'r');
lic1 = fread(fid,[1 2],'double');
fclose(fid);

ValidLicenseID = lic1(1);
ValidDateNum = lic1(2);

if LicenseID == ValidLicenseID && CurDateNum < ValidDateNum
    msgbox('License verification ok!');
else
    msgbox('License verification failed!');
end
