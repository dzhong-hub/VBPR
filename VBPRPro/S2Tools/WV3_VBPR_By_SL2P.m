function varargout = WV3_VBPR_By_SL2P(varargin)
% WV3_VBPR_BY_SL2P MATLAB code for WV3_VBPR_By_SL2P.fig
%      WV3_VBPR_BY_SL2P, by itself, creates a new WV3_VBPR_BY_SL2P or raises the existing
%      singleton*.
%
%      H = WV3_VBPR_BY_SL2P returns the handle to a new WV3_VBPR_BY_SL2P or the handle to
%      the existing singleton*.
%
%      WV3_VBPR_BY_SL2P('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WV3_VBPR_BY_SL2P.M with the given input arguments.
%
%      WV3_VBPR_BY_SL2P('Property','Value',...) creates a new WV3_VBPR_BY_SL2P or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before WV3_VBPR_By_SL2P_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to WV3_VBPR_By_SL2P_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help WV3_VBPR_By_SL2P

% Last Modified by GUIDE v2.5 29-Jan-2021 14:54:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @WV3_VBPR_By_SL2P_OpeningFcn, ...
                   'gui_OutputFcn',  @WV3_VBPR_By_SL2P_OutputFcn, ...
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


% --- Executes just before WV3_VBPR_By_SL2P is made visible.
function WV3_VBPR_By_SL2P_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to WV3_VBPR_By_SL2P (see VARARGIN)

% Choose default command line output for WV3_VBPR_By_SL2P
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes WV3_VBPR_By_SL2P wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = WV3_VBPR_By_SL2P_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtRefImgFile_Callback(hObject, eventdata, handles)
% hObject    handle to txtRefImgFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtRefImgFile as text
%        str2double(get(hObject,'String')) returns contents of txtRefImgFile as a double


% --- Executes during object creation, after setting all properties.
function txtRefImgFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtRefImgFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseReferenceFile.
function pbBrowseReferenceFile_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseReferenceFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {  '*.tif','Specify a Geotiff Image File for Georeference (*.tif)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify a Geotiff Image File');
 if  filename > 0  
    set(handles.txtRefImgFile, 'String', [pathname filename]);
 end 
 cd(cur_dir);


function txtOutputPath_Callback(hObject, eventdata, handles)
% hObject    handle to txtOutputPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtOutputPath as text
%        str2double(get(hObject,'String')) returns contents of txtOutputPath as a double


% --- Executes during object creation, after setting all properties.
function txtOutputPath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtOutputPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseOutputPath.
function pbBrowseOutputPath_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseOutputPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
outdir = uigetdir;
if  outdir > 0  
    set(handles.txtOutputPath, 'String', outdir);
end 
 cd(cur_dir);

% --- Executes on button press in pbClose.
function pbClose_Callback(hObject, eventdata, handles)
% hObject    handle to pbClose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close;


% --- Executes on button press in pbOK.
function pbOK_Callback(hObject, eventdata, handles)
% hObject    handle to pbOK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global stop_processing;
stop_processing = 0;

tic

%% Get the output folder
out_dir = get(handles.txtOutputPath,'String');
if exist(out_dir,'dir') ~= 7
    %% Create output folders
    mkdir(out_dir);             
end

%% Open a log file to record computation progresses
logfile1 = [out_dir '\WV3SL2PProcess.log'];
if exist(logfile1,'file')
    delete logfile1;
end
fid1 = fopen(logfile1,'wt');
logmsg(fid1,handles,'VBPR by SL2P processing started.');

%% get the input xml file name
ref_file = get(handles.txtRefImgFile,'String');
logmsg(fid1,handles,['The input georeference file: ' ref_file]);

%% get path to image data files
img_dir = get(handles.txtImgDataFilePath,'String');
logmsg(fid1,handles,['The image data path: ' img_dir]);

%% get path to view angle data files
ang_dir = get(handles.txtViewAngleDataPath,'String');
logmsg(fid1,handles,['The view angle data path: ' ang_dir]);

%% get L2A processing output resolution
switch get(handles.popBiophysicalVariable,'Value')
    case 1
        vbp = 'LAI';
    case 2
        vbp = 'FCOVER';       
    case 3
        vbp = 'FAPAR';  
    case 4
        vbp = 'LAI_Cab';
    case 5
        vbp = 'LAI_Cw';  
    case 6
        vbp = 'ALL';
end

%% call SL2P to conduct VBPR
VBPR_BySL2P_WV3(img_dir, ang_dir, ref_file, out_dir, vbp); 

ttime = toc;
disp(['>>> Elapsed time: ', num2str(ttime),' seconds. <<<'])
disp(' ')

%% close the log file
%% Close the logfile
logmsg(fid1,handles,'Completed VBPR by SL2P processing.');
logmsg(fid1,handles,['>>> Elapsed time: ', num2str(ttime),' seconds. <<<']);
fclose(fid1);

disp('>>> Completed VBPR by SL2P processing. <<<');

% --- Executes on button press in pbStop.
function pbStop_Callback(hObject, eventdata, handles)
% hObject    handle to pbStop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global stop_processing;
stop_processing = 1;


function txtImgDataFilePath_Callback(hObject, eventdata, handles)
% hObject    handle to txtImgDataFilePath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtImgDataFilePath as text
%        str2double(get(hObject,'String')) returns contents of txtImgDataFilePath as a double


% --- Executes during object creation, after setting all properties.
function txtImgDataFilePath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtImgDataFilePath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseImgDataFilePath.
function pbBrowseImgDataFilePath_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseImgDataFilePath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {  '*.*','Specify file path to input image files (*.*)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify file path to input image files');
 if  filename > 0  
    set(handles.txtImgDataFilePath, 'String', pathname);
    set(handles.txtViewAngleDataPath, 'String', pathname);
    set(handles.txtOutputPath, 'String', [pathname 'VBPR_SL2P\']);
 end 
 cd(cur_dir);

% --- Executes on selection change in popBiophysicalVariable.
function popBiophysicalVariable_Callback(hObject, eventdata, handles)
% hObject    handle to popBiophysicalVariable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popBiophysicalVariable contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popBiophysicalVariable


% --- Executes during object creation, after setting all properties.
function popBiophysicalVariable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popBiophysicalVariable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtViewAngleDataPath_Callback(hObject, eventdata, handles)
% hObject    handle to txtViewAngleDataPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtViewAngleDataPath as text
%        str2double(get(hObject,'String')) returns contents of txtViewAngleDataPath as a double


% --- Executes during object creation, after setting all properties.
function txtViewAngleDataPath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtViewAngleDataPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseViewAnglePath.
function pbBrowseViewAnglePath_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseViewAnglePath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {  '*.*','Specify file path to WV3 view angle files (*.*)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify file path to WV3 view angle files');
 if  filename > 0  
    set(handles.txtViewAngleDataPath, 'String', pathname);
 end 
 cd(cur_dir);
