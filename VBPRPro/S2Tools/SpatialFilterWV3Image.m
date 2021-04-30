function varargout = SpatialFilterWV3Image(varargin)
% SPATIALFILTERWV3IMAGE MATLAB code for SpatialFilterWV3Image.fig
%      SPATIALFILTERWV3IMAGE, by itself, creates a new SPATIALFILTERWV3IMAGE or raises the existing
%      singleton*.
%
%      H = SPATIALFILTERWV3IMAGE returns the handle to a new SPATIALFILTERWV3IMAGE or the handle to
%      the existing singleton*.
%
%      SPATIALFILTERWV3IMAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPATIALFILTERWV3IMAGE.M with the given input arguments.
%
%      SPATIALFILTERWV3IMAGE('Property','Value',...) creates a new SPATIALFILTERWV3IMAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SpatialFilterWV3Image_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SpatialFilterWV3Image_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SpatialFilterWV3Image

% Last Modified by GUIDE v2.5 02-Feb-2021 18:21:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SpatialFilterWV3Image_OpeningFcn, ...
                   'gui_OutputFcn',  @SpatialFilterWV3Image_OutputFcn, ...
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


% --- Executes just before SpatialFilterWV3Image is made visible.
function SpatialFilterWV3Image_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SpatialFilterWV3Image (see VARARGIN)

% Choose default command line output for SpatialFilterWV3Image
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SpatialFilterWV3Image wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SpatialFilterWV3Image_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtOriginalWV3ImageFile_Callback(hObject, eventdata, ~)
% hObject    handle to txtOriginalWV3ImageFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtOriginalWV3ImageFile as text
%        str2double(get(hObject,'String')) returns contents of txtOriginalWV3ImageFile as a double


% --- Executes during object creation, after setting all properties.
function txtOriginalWV3ImageFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtOriginalWV3ImageFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseOriginalWV3File.
function pbBrowseOriginalWV3File_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseOriginalWV3File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {  '*.tif','Specify a Subset Geotiff Image File for Georeference (*.tif)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify a Subset Geotiff Image File');
 if  filename > 0  
    set(handles.txtOriginalWV3ImageFile, 'String', [pathname filename]);
 end 
 cd(cur_dir);


function txtOutputFile_Callback(hObject, eventdata, handles)
% hObject    handle to txtOutputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtOutputFile as text
%        str2double(get(hObject,'String')) returns contents of txtOutputFile as a double


% --- Executes during object creation, after setting all properties.
function txtOutputFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtOutputFile (see GCBO)
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
[filename, pathname] = uigetfile( ...
    {  '*.*','Specify a output file name(*.*)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify a output file name');
 if  filename > 0  
    set(handles.txtOutputFile, 'String', pathname);
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
out_file = get(handles.txtOutputFile,'String');
if exist(out_file,'file')
    delete(out_file);             
end

%% get the input and output folders
wv3_file = get(handles.txtOriginalWV3ImageFile,'String');

%% get the output resolution
if get(handles.popOutputResolution, 'Value') == 1
    out_res = 10;
elseif get(handles.popOutputResolution, 'Value') == 2
    out_res = 20;
elseif get(handles.popOutputResolution, 'Value') == 3
    out_res = 60;
else
    out_res = 0;
end

%% read in the original WV3 image
[img0,x,y,info] = geoimread(wv3_file);

if out_res > 0
    %% determine original resolution
    in_res = 2; % assume that input image resolution is 2m

    %% determine block size
    br = out_res/in_res;
    bc = out_res/in_res;

    %% downsample the image using blockproc
    % fun = @(block_struct) mean2(block_struct.data);
    % blockproc(wv3_file,[br bc],fun,'Destination',out_file);

    %% downsample the image using block mean
    img = blockmean(img, br, bc);

    %% update the geolocation info
    bbox = info.BoundingBox;
    if out_res == 10
        option.ModelPixelScaleTag = [10;10;0]; %info.ModelPixelScaleTag; %info.PixelScale;
    elseif out_res == 20
        option.ModelPixelScaleTag = [20;20;0];
    else
        option.ModelPixelScaleTag = [60;60;0];
    end
    option.ModelTiepointTag = info.ModelTiepointTag; %[0;0;0;ulx;uly;0];
    option.GTModelTypeGeoKey = 1;
    option.GeoKeyDirectoryTag = info.GeoKeyDirectoryTag;

    %% output the downsampled image
    geotiffwrite(out_file, bbox, img, -16, option);
else
    %% match the image size for resolutions 10m, 20m and 60m required for S2 downscaling
    [r, c, b] = size(img0);
    r60 = floor(r/30); c60 = floor(c/30);
    if r60*6 > floor(r/5) || r60*3 > floor(r/10)
        r60 = r60-1; 
    end
    if c60*6 > floor(c/5) || c60*3 > floor(c/10)
        c60 = c60 -1;
    end
    r20 = r60*3; c20 = c60*3;
    r10 = r60*6; c10 = c60*6;

    h = waitbar(0,'Downsampling data...');
    for bb={'10m','20m','60m'}
        tmpstr = ['_matched_' char(bb) '.tif'];
        maskstr = ['_matched_' char(bb) '_mask.tif'];
        out_file = strrep(wv3_file,'.tif',tmpstr);
        mask_file = strrep(wv3_file,'.tif',maskstr);
        % downsampling
        if strcmp(char(bb),'10m')
            [img, mask] = blockmean(img0, r10, c10, 5, 5);
            option.ModelPixelScaleTag = [10;10;0]; %info.ModelPixelScaleTag; %info.PixelScale;
            waitbar(1/3)
        elseif strcmp(char(bb),'20m')
            [img, mask] = blockmean(img0, r20, c20, 10, 10);
            option.ModelPixelScaleTag = [20;20;0];
            waitbar(2/3)
        else
            [img, mask] = blockmean(img0, r60, c60, 30, 30);
            option.ModelPixelScaleTag = [60;60;0];
            waitbar(3/3)
        end
        bbox = info.BoundingBox;
        option.ModelTiepointTag = info.ModelTiepointTag; %[0;0;0;ulx;uly;0];
        option.GTModelTypeGeoKey = 1;
        option.GeoKeyDirectoryTag = info.GeoKeyDirectoryTag;
        % output the downsampled image
        geotiffwrite(out_file, bbox, img, -16, option);
        geotiffwrite(mask_file, bbox, mask, -16, option);
        clear img mask;
    end
    close(h);
end

ttime = toc;

disp(' ')
disp(['>>> Elapsed time: ', num2str(ttime),' seconds. <<<'])
disp('>>> Completed downsampling WV3 image. <<<');

% --- Executes on button press in pbStop.
function pbStop_Callback(hObject, eventdata, handles)
% hObject    handle to pbStop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global stop_processing;
stop_processing = 1;

% --- Executes on selection change in popOutputResolution.
function popOutputResolution_Callback(hObject, eventdata, handles)
% hObject    handle to popOutputResolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popOutputResolution contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popOutputResolution

%% get the input and output folders
wv3_file = get(handles.txtOriginalWV3ImageFile,'String');

%% set the output file
if get(handles.popOutputResolution, 'Value') == 1
    out_file = strrep(wv3_file,'.tif','_10m.tif');
elseif get(handles.popOutputResolution, 'Value') == 2
    out_file = strrep(wv3_file,'.tif','_20m.tif');
elseif get(handles.popOutputResolution, 'Value') == 3
    out_file = strrep(wv3_file,'.tif','_60m.tif');
else
    out_file = '';
end
set(handles.txtOutputFile, 'String', out_file);

% --- Executes during object creation, after setting all properties.
function popOutputResolution_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popOutputResolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtEastMin_Callback(hObject, eventdata, handles)
% hObject    handle to txtEastMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtEastMin as text
%        str2double(get(hObject,'String')) returns contents of txtEastMin as a double


% --- Executes during object creation, after setting all properties.
function txtEastMin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtEastMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtNorthMin_Callback(hObject, eventdata, handles)
% hObject    handle to txtNorthMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtNorthMin as text
%        str2double(get(hObject,'String')) returns contents of txtNorthMin as a double


% --- Executes during object creation, after setting all properties.
function txtNorthMin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtNorthMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtEastMax_Callback(hObject, eventdata, handles)
% hObject    handle to txtEastMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtEastMax as text
%        str2double(get(hObject,'String')) returns contents of txtEastMax as a double


% --- Executes during object creation, after setting all properties.
function txtEastMax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtEastMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtNorthMax_Callback(hObject, eventdata, handles)
% hObject    handle to txtNorthMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtNorthMax as text
%        str2double(get(hObject,'String')) returns contents of txtNorthMax as a double


% --- Executes during object creation, after setting all properties.
function txtNorthMax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtNorthMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in chkOverwriteTileOutputFile.
function chkOverwriteTileOutputFile_Callback(hObject, eventdata, handles)
% hObject    handle to chkOverwriteTileOutputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkOverwriteTileOutputFile


% --- Executes on button press in chkCropImageFromTileImage.
function chkCropImageFromTileImage_Callback(hObject, eventdata, handles)
% hObject    handle to chkCropImageFromTileImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkCropImageFromTileImage



function txtInputImgFolder_Callback(~, eventdata, handles)
% hObject    handle to txtInputImgFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtInputImgFolder as text
%        str2double(get(hObject,'String')) returns contents of txtInputImgFolder as a double


% --- Executes during object creation, after setting all properties.
function txtInputImgFolder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtInputImgFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseInputImgFolder.
function pbBrowseInputImgFolder_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseInputImgFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {  '*.*','Specify the input image files folder by selecting a file in the folder (*.*)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify the input image files folder');
 if  filename > 0  
    set(handles.txtInputImgFolder, 'String', pathname);
    set(handles.txtOutputFile, 'String', pathname);
 end 
 cd(cur_dir);
