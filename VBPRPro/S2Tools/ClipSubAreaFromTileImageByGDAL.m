function varargout = ClipSubAreaFromTileImageByGDAL(varargin)
% CLIPSUBAREAFROMTILEIMAGEBYGDAL MATLAB code for ClipSubAreaFromTileImageByGDAL.fig
%      CLIPSUBAREAFROMTILEIMAGEBYGDAL, by itself, creates a new CLIPSUBAREAFROMTILEIMAGEBYGDAL or raises the existing
%      singleton*.
%
%      H = CLIPSUBAREAFROMTILEIMAGEBYGDAL returns the handle to a new CLIPSUBAREAFROMTILEIMAGEBYGDAL or the handle to
%      the existing singleton*.
%
%      CLIPSUBAREAFROMTILEIMAGEBYGDAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CLIPSUBAREAFROMTILEIMAGEBYGDAL.M with the given input arguments.
%
%      CLIPSUBAREAFROMTILEIMAGEBYGDAL('Property','Value',...) creates a new CLIPSUBAREAFROMTILEIMAGEBYGDAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ClipSubAreaFromTileImageByGDAL_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ClipSubAreaFromTileImageByGDAL_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ClipSubAreaFromTileImageByGDAL

% Last Modified by GUIDE v2.5 15-Jan-2021 18:32:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ClipSubAreaFromTileImageByGDAL_OpeningFcn, ...
                   'gui_OutputFcn',  @ClipSubAreaFromTileImageByGDAL_OutputFcn, ...
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


% --- Executes just before ClipSubAreaFromTileImageByGDAL is made visible.
function ClipSubAreaFromTileImageByGDAL_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ClipSubAreaFromTileImageByGDAL (see VARARGIN)

% Choose default command line output for ClipSubAreaFromTileImageByGDAL
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ClipSubAreaFromTileImageByGDAL wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ClipSubAreaFromTileImageByGDAL_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtSubareaReferenceImageFile_Callback(hObject, eventdata, handles)
% hObject    handle to txtSubareaReferenceImageFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtSubareaReferenceImageFile as text
%        str2double(get(hObject,'String')) returns contents of txtSubareaReferenceImageFile as a double


% --- Executes during object creation, after setting all properties.
function txtSubareaReferenceImageFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSubareaReferenceImageFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBroseInputFolder.
function pbBroseInputFolder_Callback(hObject, eventdata, handles)
% hObject    handle to pbBroseInputFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {'*.*','Specify a subset reference image file created by Geomatica (*.*)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify the a subset reference image file');
 if  filename > 0  
    set(handles.txtSubareaReferenceImageFile, 'String', [pathname filename]);
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
pathname = uigetdir;
 if  pathname > 0  
    set(handles.txtOutputFolder, 'String', pathname);
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

%% get the Granule XML image
granule_xml_file = get(handles.txtGranuleXMLFile, 'String');
% get georeference info for data output
geoinfo = getMetadata(granule_xml_file);

%% get path to gdal_translate.exe
GDAL_translate = get(handles.txtGdalTranslateExeFile,'String');

%% get the subarea reference image file
subarea_ref_file = get(handles.txtSubareaReferenceImageFile, 'String');
if ~isempty(subarea_ref_file)
    [img, x,y,info] = geoimread(subarea_ref_file);
    ulx = min(info.BoundingBox(:,1)); lrx = max(info.BoundingBox(:,1));
    uly = max(info.BoundingBox(:,2)); lry = min(info.BoundingBox(:,2)); 
else
    ulx = str2double(get(handles.txtULEast, 'String'));  uly = str2double(get(handles.txtULNorth, 'String'));
    lrx = str2double(get(handles.txtLREast, 'String'));  lry = str2double(get(handles.LRNorth, 'String'));    
end
    
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
logfile = [out_dir '\clipsubarea.log'];
if exist(logfile,'file')
    delete logfile;
end
flog = fopen(logfile,'wt');
logmsg(flog,handles,'Clip subset by PCI CLIP module started.');

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

%% Clip all files by the PCI Clip Module in a LOOP
h = waitbar(0, 'Croping S2 Tile images for a subset...');
for n = 1:nf
    if ischar(file_list)
        in_file = file_list; 
    else
        in_file = file_list{n}; 
    end
    [path, name, ext] = fileparts(in_file);
    out_file = [out_dir '\SUB_' name '.tif'];
    
    % check if the file exists
    if exist(in_file, 'file')
        % convert the jp2 file to geotiff file
        if strcmp(ext,'.jp2')
            img = imread(in_file);
            out_fn = [out_dir '\' name '.tif'];
            in_file = SaveImgToGeotiff(img,out_fn,geoinfo);
        end
        % check if the input file is within the image to be clipped
        [img, x,y,info] = geoimread(in_file);
        x1 = min(info.BoundingBox(:,1)); x2 = max(info.BoundingBox(:,1));
        y1 = min(info.BoundingBox(:,2)); y2 = max(info.BoundingBox(:,2));
        if (x1 >= lrx || x2 <= ulx || y1 >= uly || y2 <= lry)
            logmsg(flog,handles,[in_file 'is out of the reference image area.']);
        else
            % Subarea image by GDAL_translate module
            exe_str = [GDAL_translate ' -projwin ' num2str(ulx) ' ' num2str(uly) ' ' num2str(lrx)  ' ' num2str(lry) ' ' in_file ' ' out_file]; 
            % run GDAL_translate processor
            dos(exe_str);
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
logmsg(flog,handles,'Croped subset image by gdal_translate successfully!');
logmsg(flog,handles,['>>> Elapsed time: ', num2str(ttime),' seconds. <<<']);
fclose(flog);

disp('>>> Clipping subset by gdal_translate is done. <<<');


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
    {  '*.*','Sentinel-2 image files in GeoTiff format (*.*)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Multiselect','on',...
    'Select Sentinel-2 files to be croped');
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



function txtGdalTranslateExeFile_Callback(hObject, eventdata, handles)
% hObject    handle to txtGdalTranslateExeFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtGdalTranslateExeFile as text
%        str2double(get(hObject,'String')) returns contents of txtGdalTranslateExeFile as a double


% --- Executes during object creation, after setting all properties.
function txtGdalTranslateExeFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtGdalTranslateExeFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseGdalTranslateExe.
function pbBrowseGdalTranslateExe_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseGdalTranslateExe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {  '*.exe','Specify the path to GDAL_Translate.exe (*.exe)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify the path to GDAL_Translate.exe');
 if  filename > 0  
    set(handles.txtGdalTranslateExeFile, 'String', [pathname filename]);
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
