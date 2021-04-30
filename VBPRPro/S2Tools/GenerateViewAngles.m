function varargout = GenerateViewAngles(varargin)
% GENERATEVIEWANGLES MATLAB code for GenerateViewAngles.fig
%      GENERATEVIEWANGLES, by itself, creates a new GENERATEVIEWANGLES or raises the existing
%      singleton*.
%
%      H = GENERATEVIEWANGLES returns the handle to a new GENERATEVIEWANGLES or the handle to
%      the existing singleton*.
%
%      GENERATEVIEWANGLES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GENERATEVIEWANGLES.M with the given input arguments.
%
%      GENERATEVIEWANGLES('Property','Value',...) creates a new GENERATEVIEWANGLES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GenerateViewAngles_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GenerateViewAngles_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GenerateViewAngles

% Last Modified by GUIDE v2.5 13-Dec-2020 09:32:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GenerateViewAngles_OpeningFcn, ...
                   'gui_OutputFcn',  @GenerateViewAngles_OutputFcn, ...
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


% --- Executes just before GenerateViewAngles is made visible.
function GenerateViewAngles_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GenerateViewAngles (see VARARGIN)

% Choose default command line output for GenerateViewAngles
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GenerateViewAngles wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GenerateViewAngles_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtGrabuleXMLFile_Callback(hObject, eventdata, handles)
% hObject    handle to txtGrabuleXMLFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtGrabuleXMLFile as text
%        str2double(get(hObject,'String')) returns contents of txtGrabuleXMLFile as a double


% --- Executes during object creation, after setting all properties.
function txtGrabuleXMLFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtGrabuleXMLFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseGranuleXMLFile.
function pbBrowseGranuleXMLFile_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseGranuleXMLFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {  '*.xml','Specify the L1C Granule XML file (*.*)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify the L1C Granule XML file');
 if  filename > 0  
    set(handles.txtGrabuleXMLFile, 'String', [pathname filename]);
    set(handles.txtOutputFileFolder, 'String', [pathname 'ANG_DATA']);
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

tic

%% get the input file path
granule_xml_file = get(handles.txtGrabuleXMLFile,'String');

%% get output resolution
switch get(handles.popSamplingResolution,'Value');
    case 1
        resolution = '10m';
    case 2
        resolution = '20m';
    case 3
        resolution = '60m';
end

%% generate the view angle files
ang_files = GenerateS2AngBands(granule_xml_file, resolution);

% % %% copy the view angles tif files to output folder for next SL2P application
% % % Get the output folder
% % out_dir = get(handles.txtOutputFileFolder,'String');
% % if exist(out_dir,'dir') ~= 7
% %     %% Create output folders
% %     mkdir(out_dir);             
% % end
% % % copy files to output folder
% % for i=1:length(ang_files)
% %     ang_file = strrep(ang_files(i),'/','\');
% %     [path, fname,ext] = fileparts(ang_file);
% %     if contains(fname,'sensor_azimuth_mean_resampled.tif')
% %         strrep(fname,'sensor_azimuth_mean_resampled.tif','sensor_azimuth_10m.tif')
% %         out_file = [out_dir '\' fname];
% %     end
% %     if contains(fname,'sensor_zenith_mean_resampled.tif')
% %         strrep(fname,'sensor_zenith_mean_resampled.tif','sensor_zenith_10m.tif')
% %         out_file = [out_dir '\' fname];
% %     end
% %     if contains(fname,'solar_azimuth_mean_resampled.tif')
% %         strrep(fname,'solar_azimuth_mean_resampled.tif','solar_azimuth_10m.tif')
% %         out_file = [out_dir '\' fname];
% %     end
% %     if contains(fname,'solar_zenith_mean_resampled.tif')
% %         strrep(fname,'solar_zenith_mean_resampled.tif','solar_zenith_10m.tif')
% %         out_file = [out_dir '\' fname];
% %     end
% %     out_file = [out_dir char(fname) char(ext)];
% %     copyfile(char(ang_file),out_file);
% % end

ttime = toc;
disp(' ')
disp(['>>> Elapsed time: ', num2str(ttime),' seconds. <<<'])
disp('>>> Completed generating view angles.<<<');

% --- Executes on button press in pbStop.
function pbStop_Callback(hObject, eventdata, handles)
% hObject    handle to pbStop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global stop_processing;
stop_processing = 1;

% --- Executes on selection change in popSamplingResolution.
function popSamplingResolution_Callback(hObject, eventdata, handles)
% hObject    handle to popSamplingResolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popSamplingResolution contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popSamplingResolution


% --- Executes during object creation, after setting all properties.
function popSamplingResolution_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popSamplingResolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
