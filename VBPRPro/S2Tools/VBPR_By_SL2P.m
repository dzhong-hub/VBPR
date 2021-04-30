function varargout = VBPR_By_SL2P(varargin)
% VBPR_BY_SL2P MATLAB code for VBPR_By_SL2P.fig
%      VBPR_BY_SL2P, by itself, creates a new VBPR_BY_SL2P or raises the existing
%      singleton*.
%
%      H = VBPR_BY_SL2P returns the handle to a new VBPR_BY_SL2P or the handle to
%      the existing singleton*.
%
%      VBPR_BY_SL2P('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VBPR_BY_SL2P.M with the given input arguments.
%
%      VBPR_BY_SL2P('Property','Value',...) creates a new VBPR_BY_SL2P or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before VBPR_By_SL2P_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to VBPR_By_SL2P_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help VBPR_By_SL2P

% Last Modified by GUIDE v2.5 24-Dec-2020 23:06:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @VBPR_By_SL2P_OpeningFcn, ...
                   'gui_OutputFcn',  @VBPR_By_SL2P_OutputFcn, ...
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


% --- Executes just before VBPR_By_SL2P is made visible.
function VBPR_By_SL2P_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to VBPR_By_SL2P (see VARARGIN)

% Choose default command line output for VBPR_By_SL2P
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes VBPR_By_SL2P wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = VBPR_By_SL2P_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtS2L2AImageInputXMLFile_Callback(hObject, eventdata, handles)
% hObject    handle to txtS2L2AImageInputXMLFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtS2L2AImageInputXMLFile as text
%        str2double(get(hObject,'String')) returns contents of txtS2L2AImageInputXMLFile as a double


% --- Executes during object creation, after setting all properties.
function txtS2L2AImageInputXMLFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtS2L2AImageInputXMLFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseS2L2AXMLFile.
function pbBrowseS2L2AXMLFile_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseS2L2AXMLFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {  '*.xml','Specify the Grannule XML file (*.xml)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify the Grannule XML file');
 if  filename > 0  
    set(handles.txtS2L2AImageInputXMLFile, 'String', [pathname filename]);
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
[filename, pathname] = uigetfile( ...
    {  '*.*','Specify the output file folder by selecting a file in the folder (*.*)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify the output folder');
 if  filename > 0  
    set(handles.txtOutputPath, 'String', pathname);
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
logfile1 = [out_dir '\SL2PProcess.log'];
if exist(logfile1,'file')
    delete logfile1;
end
fid1 = fopen(logfile1,'wt');
logmsg(fid1,handles,'VBPR by SL2P processing started.');

%% get the input xml file name
xmlfile = get(handles.txtS2L2AImageInputXMLFile,'String');
logmsg(fid1,handles,['The input xml file: ' xmlfile]);

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
VBPR_BySL2P_uniform(img_dir, ang_dir, xmlfile, out_dir, vbp); 
%VBPR_BySL2P(xmlfile, img_dir, out_dir, vbp); 

ttime = toc;
disp(['>>> Elapsed time: ', num2str(ttime),' seconds. <<<'])
disp(' ')

%% close the log file
%% Close the logfile
logmsg(fid1,handles,'Completed unzip S2 L1C data files and run L2A processing.');
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
    {  '*.*','Specify file path to S2 L2A image files by selecting a file in the folder (*.*)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify file path to S2 L2A image files');
 if  filename > 0  
    set(handles.txtImgDataFilePath, 'String', pathname);
    set(handles.txtViewAngleDataPath, 'String', pathname);
    outpath = [pathname, 'VBPR_SL2P'];
    set(handles.txtOutputPath, 'String', outpath);
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
    {  'L2A_Process.bat','Specify file path to L2A_Process.bat (*.bat)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify file path to L2A_Process.bat');
 if  filename > 0  
    set(handles.txtViewAngleDataPath, 'String', pathname);
 end 
 cd(cur_dir);
