function varargout = UnzipSen2CorS2L1C(varargin)
% UNZIPSEN2CORS2L1C MATLAB code for UnzipSen2CorS2L1C.fig
%      UNZIPSEN2CORS2L1C, by itself, creates a new UNZIPSEN2CORS2L1C or raises the existing
%      singleton*.
%
%      H = UNZIPSEN2CORS2L1C returns the handle to a new UNZIPSEN2CORS2L1C or the handle to
%      the existing singleton*.
%
%      UNZIPSEN2CORS2L1C('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNZIPSEN2CORS2L1C.M with the given input arguments.
%
%      UNZIPSEN2CORS2L1C('Property','Value',...) creates a new UNZIPSEN2CORS2L1C or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UnzipSen2CorS2L1C_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UnzipSen2CorS2L1C_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UnzipSen2CorS2L1C

% Last Modified by GUIDE v2.5 08-May-2019 08:52:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UnzipSen2CorS2L1C_OpeningFcn, ...
                   'gui_OutputFcn',  @UnzipSen2CorS2L1C_OutputFcn, ...
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


% --- Executes just before UnzipSen2CorS2L1C is made visible.
function UnzipSen2CorS2L1C_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UnzipSen2CorS2L1C (see VARARGIN)

% Choose default command line output for UnzipSen2CorS2L1C
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UnzipSen2CorS2L1C wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = UnzipSen2CorS2L1C_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtInputFileFolder_Callback(hObject, eventdata, handles)
% hObject    handle to txtInputFileFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtInputFileFolder as text
%        str2double(get(hObject,'String')) returns contents of txtInputFileFolder as a double


% --- Executes during object creation, after setting all properties.
function txtInputFileFolder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtInputFileFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseInputFileFolder.
function pbBrowseInputFileFolder_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseInputFileFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
pathname = uigetdir;
 if  pathname > 0  
    set(handles.txtInputFileFolder, 'String', pathname);
    set(handles.txtOutputFileFolder, 'String', [pathname '\Raw']);
 end 
 cd(cur_dir);


function txtOutputFileFolder_Callback(hObject, eventdata, handles)
% hObject    handle to txtOutputFileFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtOutputFileFolder as text
%        str2double(get(hObject,'String')) returns contents of txtOutputFileFolder as a double


% --- Executes during object creation, after setting all properties.
function txtOutputFileFolder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtOutputFileFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseOutputFileFolder.
function pbBrowseOutputFileFolder_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseOutputFileFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
pathname = uigetdir;
 if  pathname > 0  
    set(handles.txtOutputFileFolder, 'String', pathname);
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
out_dir = get(handles.txtOutputFileFolder,'String');
if exist(out_dir,'dir') ~= 7
    %% Create output folders
    mkdir(out_dir);             
end

%% Open a log file to record computation progresses
logfile1 = [out_dir '\S2L2AProcess.log'];
if exist(logfile1,'file')
    delete logfile1;
end
fid1 = fopen(logfile1,'wt');
logmsg(fid1,handles,'Unzip Sentinel-2 L1C data and run L2A processing started.');

%% get the input and output folders
in_dir = get(handles.txtInputFileFolder,'String');
logmsg(fid1,handles,['The input data folder: ' in_dir]);

%% get path to L2A Processing files
L2A_Process = get(handles.txtPathToL2AProcess,'String');
logmsg(fid1,handles,['The L2A_Process.bat: ' L2A_Process]);
L2A_GIPP = get(handles.txtPathToL2AGIPP,'String');
logmsg(fid1,handles,['The L2A_GIPP: ' L2A_GIPP]);

%% get L2A processing output resolution
switch get(handles.popResolution,'Value')
    case 1
        outresolution = '10';
    case 2
        outresolution = '20';        
    case 3
        outresolution = '60';
    case 4
        outresolution = 'All';               
end

%% Retrieve all file names of the downloaded zip files
zipfnames = dir(in_dir);
zipfnames = {zipfnames(~[zipfnames.isdir]).name};
logmsg(fid1,handles,['The total number of the downloaded zip files is: ' num2str(length(zipfnames))]);

h = waitbar(0,'Running unzip and L2A processing...');
nf = length(zipfnames);
for i=1:nf
    %% Unzip downloaded files and perform sen2cor 
    logmsg(fid1,handles,'Unzip and run L2A processing started.');
    
    %% Retreive the tile id and sensing date info first
    [path, name, ext] = fileparts(zipfnames{i});
    
    %% Determine the zip file and unzip to folder
    in_file = [in_dir '\' name '.zip'];

    %% check if the processing was stopped mannually
    if stop_processing == 1
        logmsg(fid1,handles,'The processing was stopped manually.');
        fclose(fid1);
        return;
    end

    %% Unzip the zip file
    if exist(in_file, 'file')
        filenames = unzip(in_file,out_dir);
        logmsg(fid1,handles,['Unziped file:' in_file]);
    end

    %% Run L2A Processing by executing sen2cor
    [L1C_path, fname, ext] = fileparts(filenames{1});
    L2A_path = strrep(L1C_path,'L1C','L2A');
    L2A_tile_xmlfile = [L2A_path '\MTD_MSIL2A.xml'];

    if exist(L2A_tile_xmlfile,'file') == 0
        if strcmp(outresolution, 'All') 
             exe_str = [L2A_Process ' --GIP_L2A ' L2A_GIPP ' ' L1C_path];
        else
            exe_str = [L2A_Process ' --resolution=' outresolution ' --GIP_L2A ' L2A_GIPP ' ' L1C_path];     % for Sen2Cor version 2.5.5
            % exe_str = [L2A_Process ' --resolution ' outresolution ' --GIP_L2A ' L2A_GIPP ' ' L1C_path];   % for Sen2Cor version 2.8.0
        end
        
        %% run Sen2Cor processor
        dos(exe_str);
        logmsg(fid1,handles,['Completed L2A processing:' L1C_path]);
        
        %% calculate the view angle files
        granule_xml_file = [L1C_path '\GRANULE\' name '\MTD_TL.xml'];
        ang_10m_files = GenerateS2AngBands(granule_xml_file, '10m');
        ang_20m_files = GenerateS2AngBands(granule_xml_file, '20m');
    end
    
    waitbar(i/nf, h);
    
end
close(h);

ttime = toc;
disp(['>>> Elapsed time: ', num2str(ttime),' seconds. <<<'])
disp(' ')

%% close the log file
%% Close the logfile
logmsg(fid1,handles,'Completed unzip S2 L1C data files and run L2A processing.');
logmsg(fid1,handles,['>>> Elapsed time: ', num2str(ttime),' seconds. <<<']);
fclose(fid1);

disp('>>> Completed unzip S2 L1C data files and run L2A processing. <<<');

% --- Executes on button press in pbStop.
function pbStop_Callback(hObject, eventdata, handles)
% hObject    handle to pbStop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global stop_processing;
stop_processing = 1;

% --- Executes on button press in pbSave.
function pbSave_Callback(hObject, eventdata, handles)
% hObject    handle to pbSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pbLoad.
function pbLoad_Callback(hObject, eventdata, handles)
% hObject    handle to pbLoad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function txtPathToL2AProcess_Callback(hObject, eventdata, handles)
% hObject    handle to txtPathToL2AProcess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtPathToL2AProcess as text
%        str2double(get(hObject,'String')) returns contents of txtPathToL2AProcess as a double


% --- Executes during object creation, after setting all properties.
function txtPathToL2AProcess_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtPathToL2AProcess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseL2AProcess.
function pbBrowseL2AProcess_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseL2AProcess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {  'L2A_Process.bat','Specify file path to L2A_Process.bat (*.bat)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify file path to L2A_Process.bat');
 if  filename > 0  
    set(handles.txtPathToL2AProcess, 'String', [pathname filename]);
 end 
 cd(cur_dir);


function txtPathToL2AGIPP_Callback(hObject, eventdata, handles)
% hObject    handle to txtPathToL2AGIPP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtPathToL2AGIPP as text
%        str2double(get(hObject,'String')) returns contents of txtPathToL2AGIPP as a double


% --- Executes during object creation, after setting all properties.
function txtPathToL2AGIPP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtPathToL2AGIPP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseL2AGIPP.
function pbBrowseL2AGIPP_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseL2AGIPP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {  'L2A_GIPP.xml','Specify file path to L2A_GIPP.xml (*.xml)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify file path to L2A_GIPP.xml');
 if  filename > 0  
    set(handles.txtPathToL2AGIPP, 'String', [pathname filename]);
 end 
 cd(cur_dir);


% --- Executes on selection change in popResolution.
function popResolution_Callback(hObject, eventdata, handles)
% hObject    handle to popResolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popResolution contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popResolution


% --- Executes during object creation, after setting all properties.
function popResolution_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popResolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
