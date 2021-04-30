function varargout = LicenseActivation(varargin)
% LICENSEACTIVATION MATLAB code for LicenseActivation.fig
%      LICENSEACTIVATION, by itself, creates a new LICENSEACTIVATION or raises the existing
%      singleton*.
%
%      H = LICENSEACTIVATION returns the handle to a new LICENSEACTIVATION or the handle to
%      the existing singleton*.
%
%      LICENSEACTIVATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LICENSEACTIVATION.M with the given input arguments.
%
%      LICENSEACTIVATION('Property','Value',...) creates a new LICENSEACTIVATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LicenseActivation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LicenseActivation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LicenseActivation

% Last Modified by GUIDE v2.5 15-Apr-2015 11:06:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LicenseActivation_OpeningFcn, ...
                   'gui_OutputFcn',  @LicenseActivation_OutputFcn, ...
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


% --- Executes just before LicenseActivation is made visible.
function LicenseActivation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LicenseActivation (see VARARGIN)

% Choose default command line output for LicenseActivation
handles.output = hObject;

[~, PCName] = system('hostname');
PCName = strtrim(lower(PCName));
set(handles.txtPCName, 'String', PCName);
UserName = getenv('username');
set(handles.txtUserName, 'String', UserName);
PCID = getsid;
set(handles.txtPCID, 'String', PCID);
        
lic_status = LicenseGetStatus();
set(handles.txtStatus, 'String', lic_status.msg);
if lic_status.valid > 0
    set(handles.txtLicenseFile, 'String', lic_status.filename);
end

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LicenseActivation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LicenseActivation_OutputFcn(hObject, eventdata, handles) 
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

PCName = get(handles.txtPCName, 'String');
UserName = get(handles.txtUserName, 'String');
PCID = get(handles.txtPCID, 'String');
recipients = get(handles.txtEmailAddr, 'String');
if isempty(recipients)
    recipients = 'detang.zhong@canada.ca';
end
subject = 'Request Licence for CCRS SRSIBPro'; 
message = ['PC Name: ' PCName ...
           ' / User Name: ' UserName 10 ...
           ' / PC ID: ' PCID];
       
sendolmail(recipients,subject,message);

msgbox(['The email has been sent to ' recipients]);

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

global app_dir;
cur_dir = cd;
cd(app_dir.root);

[filename, pathname] = uigetfile( ...
    {  'SRSIBPro.lic','SRSIBPro License File (SRSIBPro.lic)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Select SRSIBPro License File');
 if  filename > 0    
    set(handles.txtLicenseFile, 'String', [pathname filename]);
 else
     return;
 end
 cd(cur_dir);

% --- Executes on button press in pbCopy.
function pbCopy_Callback(hObject, eventdata, handles)
% hObject    handle to pbCopy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global app_dir;

lic_file = get(handles.txtLicenseFile, 'String');
if isempty(lic_file)
    msgbox('Please specify the license file first!');
    return;
else
    [path, filename, ext]=fileparts(lic_file);
    root_lic_file = [app_dir.root '\' filename ext];
    copyfile(lic_file,root_lic_file);
    
    msgbox('The license file has been copied.');
    return;
end

% --- Executes on button press in pbClose.
function pbClose_Callback(hObject, eventdata, handles)
% hObject    handle to pbClose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close;


function txtStatus_Callback(hObject, eventdata, handles)
% hObject    handle to txtStatus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtStatus as text
%        str2double(get(hObject,'String')) returns contents of txtStatus as a double


% --- Executes during object creation, after setting all properties.
function txtStatus_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtStatus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtEmailAddr_Callback(hObject, eventdata, handles)
% hObject    handle to txtEmailAddr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtEmailAddr as text
%        str2double(get(hObject,'String')) returns contents of txtEmailAddr as a double


% --- Executes during object creation, after setting all properties.
function txtEmailAddr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtEmailAddr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
