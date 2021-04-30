function varargout = MatchWV3SamplesByPCIClip(varargin)
% MATCHWV3SAMPLESBYPCICLIP MATLAB code for MatchWV3SamplesByPCIClip.fig
%      MATCHWV3SAMPLESBYPCICLIP, by itself, creates a new MATCHWV3SAMPLESBYPCICLIP or raises the existing
%      singleton*.
%
%      H = MATCHWV3SAMPLESBYPCICLIP returns the handle to a new MATCHWV3SAMPLESBYPCICLIP or the handle to
%      the existing singleton*.
%
%      MATCHWV3SAMPLESBYPCICLIP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MATCHWV3SAMPLESBYPCICLIP.M with the given input arguments.
%
%      MATCHWV3SAMPLESBYPCICLIP('Property','Value',...) creates a new MATCHWV3SAMPLESBYPCICLIP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MatchWV3SamplesByPCIClip_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MatchWV3SamplesByPCIClip_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MatchWV3SamplesByPCIClip

% Last Modified by GUIDE v2.5 01-Feb-2021 18:53:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MatchWV3SamplesByPCIClip_OpeningFcn, ...
                   'gui_OutputFcn',  @MatchWV3SamplesByPCIClip_OutputFcn, ...
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


% --- Executes just before MatchWV3SamplesByPCIClip is made visible.
function MatchWV3SamplesByPCIClip_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MatchWV3SamplesByPCIClip (see VARARGIN)

% Choose default command line output for MatchWV3SamplesByPCIClip
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MatchWV3SamplesByPCIClip wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MatchWV3SamplesByPCIClip_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtWV3MSIImageFile_Callback(hObject, eventdata, handles)
% hObject    handle to txtWV3MSIImageFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtWV3MSIImageFile as text
%        str2double(get(hObject,'String')) returns contents of txtWV3MSIImageFile as a double


% --- Executes during object creation, after setting all properties.
function txtWV3MSIImageFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtWV3MSIImageFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBroseWV3MSIImage.
function pbBroseWV3MSIImage_Callback(hObject, eventdata, handles)
% hObject    handle to pbBroseWV3MSIImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {'*.*','Specify a WorldView 3 MSI image file (*.*)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify a WorldView 3 MSI image file');
 if  filename > 0  
    set(handles.txtWV3MSIImageFile, 'String', [pathname filename]);
 end 
 cd(cur_dir);


function txtOutputFolder_Callback(hObject, eventdata, handles)
% hObject    handle to txtOutputFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtOutputFolder as text
%        str2double(get(hObject,'String')) returns contents of txtOutputFolder as a double


% --- Executes during object creation, after setting all properties.
function txtOutputFolder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtOutputFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBroseOutputFolder.
function pbBroseOutputFolder_Callback(hObject, eventdata, handles)
% hObject    handle to pbBroseOutputFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
out_dir = uigetdir;
if  out_dir > 0  
set(handles.txtOutputFolder, 'String', out_dir);
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

%% Start counting processing time
tic;

%% get WV3 image file
wv3_file = get(handles.txtWV3MSIImageFile, 'String');
if ~isempty(wv3_file)
    [img, x,y,info] = geoimread(wv3_file);
    xmin = min(info.BoundingBox(:,1)); xmax = max(info.BoundingBox(:,1));
    ymin = min(info.BoundingBox(:,2)); ymax = max(info.BoundingBox(:,2));
else
    xmin = str2double(get(handles.txtULEast, 'String'));  ymax = str2double(get(handles.txtULNorth, 'String'));
    xmax = str2double(get(handles.txtLREast, 'String'));  ymin = str2double(get(handles.LRNorth, 'String'));    
end
ulcoord = [num2str(xmin) ' ' num2str(ymax)];
lrcoord = [num2str(xmax) ' ' num2str(ymin)];
    
out_dir = get(handles.txtOutputFolder, 'String');
if isempty(out_dir)
    msgbox('Specify the output file folder first.');
    return;
end
if exist(out_dir,'dir') ~= 7
    %% Create output folders
    mkdir(out_dir);             
end

%% open a log file to record computation progresses
logfile = [out_dir '\matchwv3samples.log'];
if exist(logfile,'file')
    delete logfile;
end
flog = fopen(logfile,'wt');
logmsg(flog,handles,'Match WV3 samples by PCI CLIP module started.');

%% get all files to be clipped
file_list = get(handles.lstInputFiles, 'String');
if iscell(file_list)
    nf = length(file_list);
elseif ischar(file_list)
    nf = 1;
elseif isempty(file_list)
    msgbox('Add at least one image file to the list!', 'Error','error');
    return;    
end

%% match all files by the PCI Clip Module in a LOOP
h = waitbar(0, 'Match WV3 samples...');
for n = 1:nf
    if ischar(file_list)
        in_file = file_list; 
    else
        in_file = file_list{n}; 
    end
    [path, name, ext] = fileparts(in_file);
    out_file = [out_dir '\WV3_MATCHED_' name '.tif'];
    
    % check if the file exists
    if exist(in_file, 'file')
        % check if the input file is within the image to be matched
        [img,x,y,info] = geoimread(in_file);
        x1 = min(info.BoundingBox(:,1)); x2 = max(info.BoundingBox(:,1));
        y1 = min(info.BoundingBox(:,2)); y2 = max(info.BoundingBox(:,2));
        if (x1 >= xmax || x2 <= xmin || y1 >= ymax || y2 <= ymin)
            logmsg(flog,handles,[in_file 'is out of the WV3 image area.']);
        else
            % Extract matched image by PCI CLIP module
            % if ~empty(wv3_file)
                 extractByPCIclip(in_file, wv3_file, out_file);
            % else
            %    extractByPCIclip2(in_file, out_file, ulcoord, lrcoord);
            % end
        end
    else
        logmsg(flog,handles,[in_file 'is not found.']);
    end
    
    waitbar(n/nf);
end
close(h)

ttime = toc;
disp(['>>> Elapsed time: ', num2str(ttime),' seconds. <<<'])
disp(' ')

%% close the log file
logmsg(flog,handles,'Matched WV3 samples successfully!');
logmsg(flog,handles,['>>> Elapsed time: ', num2str(ttime),' seconds. <<<']);
fclose(flog);

disp('>>> Matching WV3 samples is done. <<<');


% --- Executes on button press in pbAddFiles.
function pbAddFiles_Callback(hObject, eventdata, handles)
% hObject    handle to pbAddFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;

%% get the files already in the list
listed_files = get(handles.lstInputFiles,'String');

%% get the new files
[filenames, folder] = uigetfile( ...
    {  '*.*','SL2P L2B image files in GeoTiff format (*.*)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Multiselect','on',...
    'Select Sentinel-2 SL2P L2B image files to be matched');
%% add the new files to the list
if ~isempty(filenames)
     filenames = fullfile(folder, filenames);
     if  isempty(listed_files) 
         listed_files = filenames;
     else
         % listed_files = {listed_files; str2cell(filenames)};
         if ischar(filenames)
             listed_files{end+1} = str2cell(filenames);
         else
             n = length(filenames);
             for i = 1:n
                listed_files{end+1} = str2cell(filenames{i});
             end
         end
     end
     set(handles.lstInputFiles,'String',listed_files,'Value',1); 
end 
cd(cur_dir);

% --- Executes on selection change in lstInputFiles.
function lstInputFiles_Callback(hObject, eventdata, handles)
% hObject    handle to lstInputFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lstInputFiles contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lstInputFiles


% --- Executes during object creation, after setting all properties.
function lstInputFiles_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lstInputFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbRemoveFiles.
function pbRemoveFiles_Callback(hObject, eventdata, handles)
% hObject    handle to pbRemoveFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

index_selected = get(handles.lstInputFiles,'Value');
file_list = get(handles.lstInputFiles,'String');
if iscell(file_list)
    file_list(index_selected)=[];
else
    file_list = [];
end
set(handles.lstInputFiles,'String',file_list,'Value',1);



function txtGranuleXMLFile_Callback(hObject, eventdata, handles)
% hObject    handle to txtGranuleXMLFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtGranuleXMLFile as text
%        str2double(get(hObject,'String')) returns contents of txtGranuleXMLFile as a double


% --- Executes during object creation, after setting all properties.
function txtGranuleXMLFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtGranuleXMLFile (see GCBO)
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
    {  '*.xml','Specify the L2A Granule XML file (*.*)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify the L2A Granule XML file');
 if  filename > 0  
    set(handles.txtGranuleXMLFile, 'String', [pathname filename]);
    set(handles.txtOutputFolder, 'String', [pathname 'SUBSET']);
 end 
 cd(cur_dir);



function txtULEast_Callback(hObject, eventdata, handles)
% hObject    handle to txtULEast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtULEast as text
%        str2double(get(hObject,'String')) returns contents of txtULEast as a double


% --- Executes during object creation, after setting all properties.
function txtULEast_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtULEast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtLREast_Callback(hObject, eventdata, handles)
% hObject    handle to txtLREast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtLREast as text
%        str2double(get(hObject,'String')) returns contents of txtLREast as a double


% --- Executes during object creation, after setting all properties.
function txtLREast_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtLREast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtULNorth_Callback(hObject, eventdata, handles)
% hObject    handle to txtULNorth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtULNorth as text
%        str2double(get(hObject,'String')) returns contents of txtULNorth as a double


% --- Executes during object creation, after setting all properties.
function txtULNorth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtULNorth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LRNorth_Callback(hObject, eventdata, handles)
% hObject    handle to LRNorth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LRNorth as text
%        str2double(get(hObject,'String')) returns contents of LRNorth as a double


% --- Executes during object creation, after setting all properties.
function LRNorth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LRNorth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
