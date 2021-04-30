function varargout = AssessByInSituData(varargin)
% ASSESSBYINSITUDATA MATLAB code for AssessByInSituData.fig
%      ASSESSBYINSITUDATA, by itself, creates a new ASSESSBYINSITUDATA or raises the existing
%      singleton*.
%
%      H = ASSESSBYINSITUDATA returns the handle to a new ASSESSBYINSITUDATA or the handle to
%      the existing singleton*.
%
%      ASSESSBYINSITUDATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSESSBYINSITUDATA.M with the given input arguments.
%
%      ASSESSBYINSITUDATA('Property','Value',...) creates a new ASSESSBYINSITUDATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AssessByInSituData_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AssessByInSituData_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AssessByInSituData

% Last Modified by GUIDE v2.5 23-Feb-2021 21:37:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AssessByInSituData_OpeningFcn, ...
                   'gui_OutputFcn',  @AssessByInSituData_OutputFcn, ...
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


% --- Executes just before AssessByInSituData is made visible.
function AssessByInSituData_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AssessByInSituData (see VARARGIN)

% Choose default command line output for AssessByInSituData
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AssessByInSituData wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AssessByInSituData_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtVBPDataPath_Callback(hObject, eventdata, handles)
% hObject    handle to txtVBPDataPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtVBPDataPath as text
%        str2double(get(hObject,'String')) returns contents of txtVBPDataPath as a double


% --- Executes during object creation, after setting all properties.
function txtVBPDataPath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtVBPDataPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseVBPDataPath.
function pbBrowseVBPDataPath_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseVBPDataPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {  '*.*','Specify the estimated BIO data folder by selecting a file in the folder (*.*)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify the estimated BIO data folder');
 if  filename > 0  
    set(handles.txtVBPDataPath, 'String', pathname);
    %set(handles.txtOutputPath, 'String', [pathname, 'VALIDATION\']);
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
pathname = uigetdir;
 if  pathname > 0  
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
logfile1 = [out_dir '\VBPValidation.log'];
if exist(logfile1,'file')
    delete logfile1;
end
fid1 = fopen(logfile1,'wt');
logmsg(fid1,handles,'VBP validation by InSitu data processing started.');

%% get the input in-situ ground data file name
grnd_file = get(handles.txtInSituDataFile,'String');
logmsg(fid1,handles,['The ground In-Situ data file: ' grnd_file]);

%% get the input estimated bio variables data folder
vbp_path = get(handles.txtVBPDataPath,'String');
logmsg(fid1,handles,['The bio data folder: ' vbp_path]);

if get(handles.popEstimationMethod,'Value') == 1
    method = 'SL2P';
else
    method = 'ALR_SL2P';
end

%% call ALR SL2P to conduct VBPR
ValidationByInSituData(grnd_file, vbp_path, method, out_dir); 

ttime = toc;
disp(['>>> Elapsed time: ', num2str(ttime),' seconds. <<<'])
disp(' ')

%% close the log file
%% Close the logfile
logmsg(fid1,handles,'Completed VBP Validation by In-Situ Data.');
logmsg(fid1,handles,['>>> Elapsed time: ', num2str(ttime),' seconds. <<<']);
fclose(fid1);

disp('>>> Completed VBP Validation by In-Situ Data. <<<');

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
    {  '*.*','Specify file path to SL2P result files (*.*)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify file path to SL2P result files');
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



function txtInSituDataFile_Callback(hObject, eventdata, handles)
% hObject    handle to txtInSituDataFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtInSituDataFile as text
%        str2double(get(hObject,'String')) returns contents of txtInSituDataFile as a double


% --- Executes during object creation, after setting all properties.
function txtInSituDataFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtInSituDataFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowsetxtInSituDataFile.
function pbBrowsetxtInSituDataFile_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowsetxtInSituDataFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {  '*.mat','Specify In-Situ VBP Data File (*.mat)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify In-Situ VBP Data File');
 if  filename > 0  
    set(handles.txtInSituDataFile, 'String', [pathname filename]);
 end 
 cd(cur_dir);


% --- Executes on selection change in popEstimationMethod.
function popEstimationMethod_Callback(hObject, eventdata, handles)
% hObject    handle to popEstimationMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popEstimationMethod contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popEstimationMethod


% --- Executes during object creation, after setting all properties.
function popEstimationMethod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popEstimationMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtVBPDataPath2_Callback(hObject, eventdata, handles)
% hObject    handle to txtVBPDataPath2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtVBPDataPath2 as text
%        str2double(get(hObject,'String')) returns contents of txtVBPDataPath2 as a double


% --- Executes during object creation, after setting all properties.
function txtVBPDataPath2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtVBPDataPath2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseVBPDataPath2.
function pbBrowseVBPDataPath2_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseVBPDataPath2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {  '*.*','Specify the second estimated BIO data folder by selecting a file in the folder (*.*)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify the second estimated BIO data folder');
 if  filename > 0  
    set(handles.txtVBPDataPath2, 'String', pathname);
    %set(handles.txtOutputPath, 'String', [pathname, 'VALIDATION\']);
 end 
 cd(cur_dir);


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
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
logfile1 = [out_dir '\VBPValidation2.log'];
if exist(logfile1,'file')
    delete logfile1;
end
fid1 = fopen(logfile1,'wt');
logmsg(fid1,handles,'VBP validation by InSitu data processing started.');

%% get the input in-situ ground data file name
grnd_file = get(handles.txtInSituDataFile,'String');
logmsg(fid1,handles,['The ground In-Situ data file: ' grnd_file]);

%% get the input estimated bio variables data folder
vbp_path = get(handles.txtVBPDataPath2,'String');
logmsg(fid1,handles,['The bio data folder: ' vbp_path]);

if get(handles.popEstimationMethod,'Value') == 1
    method = 'SL2P';
else
    method = 'ALR_SL2P';
end

%% call ALR SL2P to conduct VBPR
ValidationByInSituData(grnd_file, vbp_path, method, out_dir); 

ttime = toc;
disp(['>>> Elapsed time: ', num2str(ttime),' seconds. <<<'])
disp(' ')

%% close the log file
%% Close the logfile
logmsg(fid1,handles,'Completed VBP Validation by In-Situ Data.');
logmsg(fid1,handles,['>>> Elapsed time: ', num2str(ttime),' seconds. <<<']);
fclose(fid1);

disp('>>> Completed VBP Validation by In-Situ Data. <<<');

% --- Executes on button press in pbCompare12.
function pbCompare12_Callback(hObject, eventdata, handles)
% hObject    handle to pbCompare12 (see GCBO)
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
logfile1 = [out_dir '\VBPValidation12.log'];
if exist(logfile1,'file')
    delete logfile1;
end
fid1 = fopen(logfile1,'wt');
logmsg(fid1,handles,'Compare BIO estimation 1 and 2 processing started.');

%% get the input in-situ ground data file name
grnd_file = get(handles.txtInSituDataFile,'String');

%% get the input estimated bio variables data folder
vbp_path1 = get(handles.txtVBPDataPath,'String');
logmsg(fid1,handles,['The first bio data folder: ' vbp_path1]);

vbp_path2 = get(handles.txtVBPDataPath2,'String');
logmsg(fid1,handles,['The bio data folder: ' vbp_path2]);

if get(handles.popEstimationMethod,'Value') == 1
    method = 'SL2P';
else
    method = 'ALR_SL2P';
end

%% call ALR SL2P to conduct VBPR
CompareTwoBioSolutions(grnd_file, vbp_path1, vbp_path2, method, out_dir); 

ttime = toc;
disp(['>>> Elapsed time: ', num2str(ttime),' seconds. <<<'])
disp(' ')

%% close the log file
%% Close the logfile
logmsg(fid1,handles,'Completed VBP Validation by In-Situ Data.');
logmsg(fid1,handles,['>>> Elapsed time: ', num2str(ttime),' seconds. <<<']);
fclose(fid1);

disp('>>> Completed VBP Validation by In-Situ Data. <<<');
