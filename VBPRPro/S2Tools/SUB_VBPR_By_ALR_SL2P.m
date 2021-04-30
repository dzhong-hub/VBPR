function varargout = SUB_VBPR_By_ALR_SL2P(varargin)
% SUB_VBPR_BY_ALR_SL2P MATLAB code for SUB_VBPR_By_ALR_SL2P.fig
%      SUB_VBPR_BY_ALR_SL2P, by itself, creates a new SUB_VBPR_BY_ALR_SL2P or raises the existing
%      singleton*.
%
%      H = SUB_VBPR_BY_ALR_SL2P returns the handle to a new SUB_VBPR_BY_ALR_SL2P or the handle to
%      the existing singleton*.
%
%      SUB_VBPR_BY_ALR_SL2P('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUB_VBPR_BY_ALR_SL2P.M with the given input arguments.
%
%      SUB_VBPR_BY_ALR_SL2P('Property','Value',...) creates a new SUB_VBPR_BY_ALR_SL2P or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SUB_VBPR_By_ALR_SL2P_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SUB_VBPR_By_ALR_SL2P_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SUB_VBPR_By_ALR_SL2P

% Last Modified by GUIDE v2.5 07-Jan-2021 18:31:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SUB_VBPR_By_ALR_SL2P_OpeningFcn, ...
                   'gui_OutputFcn',  @SUB_VBPR_By_ALR_SL2P_OutputFcn, ...
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


% --- Executes just before SUB_VBPR_By_ALR_SL2P is made visible.
function SUB_VBPR_By_ALR_SL2P_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SUB_VBPR_By_ALR_SL2P (see VARARGIN)

% Choose default command line output for SUB_VBPR_By_ALR_SL2P
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SUB_VBPR_By_ALR_SL2P wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SUB_VBPR_By_ALR_SL2P_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtS2L2AImageInputPath_Callback(hObject, eventdata, handles)
% hObject    handle to txtS2L2AImageInputPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtS2L2AImageInputPath as text
%        str2double(get(hObject,'String')) returns contents of txtS2L2AImageInputPath as a double


% --- Executes during object creation, after setting all properties.
function txtS2L2AImageInputPath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtS2L2AImageInputPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseS2L2AInputPath.
function pbBrowseS2L2AInputPath_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseS2L2AInputPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {  '*.*','Specify the input images files folder by selecting a file in the folder (*.*)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify the input files folder');
 if  filename > 0  
    set(handles.txtS2L2AImageInputPath, 'String', pathname);
    set(handles.txtS2L2BDataInputPath, 'String', [pathname, 'VBPR_SL2P\']);
    set(handles.txtOutputPath, 'String', [pathname, 'VBPR_ALR\']);
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
logfile1 = [out_dir '\SubALRSL2P_Process.log'];
if exist(logfile1,'file')
    delete logfile1;
end
fid1 = fopen(logfile1,'wt');
logmsg(fid1,handles,'VBPR by ALR SL2P processing started.');

%% get the input xml file name
xmlfile = get(handles.txtSubRefImgFile,'String');
logmsg(fid1,handles,['The input xml file: ' xmlfile]);

%% get the input SAFE data folder
img_path = get(handles.txtS2L2AImageInputPath,'String');
logmsg(fid1,handles,['The input data folder (SAFE Path): ' img_path]);

%% get the input path to SL2P process output file folder 
sl2p_path = get(handles.txtS2L2BDataInputPath,'String');
logmsg(fid1,handles,['The SL2P process output file folder: ' sl2p_path]);

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

%% call ALR SL2P to conduct VBPR
VBPR_ByALR_DZ(xmlfile, img_path, sl2p_path, vbp, out_dir); 

ttime = toc;
disp(['>>> Elapsed time: ', num2str(ttime),' seconds. <<<'])
disp(' ')

%% close the log file
%% Close the logfile
logmsg(fid1,handles,'Completed VBPR by ALR SL2P processing.');
logmsg(fid1,handles,['>>> Elapsed time: ', num2str(ttime),' seconds. <<<']);
fclose(fid1);

disp('>>> Completed VBPR by ALR SL2P processing. <<<');

% --- Executes on button press in pbStop.
function pbStop_Callback(hObject, eventdata, handles)
% hObject    handle to pbStop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global stop_processing;
stop_processing = 1;


function txtS2L2BDataInputPath_Callback(hObject, eventdata, handles)
% hObject    handle to txtS2L2BDataInputPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtS2L2BDataInputPath as text
%        str2double(get(hObject,'String')) returns contents of txtS2L2BDataInputPath as a double


% --- Executes during object creation, after setting all properties.
function txtS2L2BDataInputPath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtS2L2BDataInputPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseS2L2BInputPath.
function pbBrowseS2L2BInputPath_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseS2L2BInputPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {  '*.*','Specify file path to SL2P BIO files (*.*)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify file path to SL2P BIO files');
 if  filename > 0  
    set(handles.txtS2L2BDataInputPath, 'String', pathname);
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



function txtSubRefImgFile_Callback(hObject, eventdata, handles)
% hObject    handle to txtSubRefImgFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtSubRefImgFile as text
%        str2double(get(hObject,'String')) returns contents of txtSubRefImgFile as a double


% --- Executes during object creation, after setting all properties.
function txtSubRefImgFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSubRefImgFile (see GCBO)
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
    {  '*.tif','Specify a Subset Geotiff Image File for Georeference (*.tif)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify a Subset Geotiff Image File');
 if  filename > 0  
    set(handles.txtSubRefImgFile, 'String', [pathname filename]);
 end 
 cd(cur_dir);
