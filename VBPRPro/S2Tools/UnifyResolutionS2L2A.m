function varargout = UnifyResolutionS2L2A(varargin)
% UNIFYRESOLUTIONS2L2A MATLAB code for UnifyResolutionS2L2A.fig
%      UNIFYRESOLUTIONS2L2A, by itself, creates a new UNIFYRESOLUTIONS2L2A or raises the existing
%      singleton*.
%
%      H = UNIFYRESOLUTIONS2L2A returns the handle to a new UNIFYRESOLUTIONS2L2A or the handle to
%      the existing singleton*.
%
%      UNIFYRESOLUTIONS2L2A('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNIFYRESOLUTIONS2L2A.M with the given input arguments.
%
%      UNIFYRESOLUTIONS2L2A('Property','Value',...) creates a new UNIFYRESOLUTIONS2L2A or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UnifyResolutionS2L2A_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UnifyResolutionS2L2A_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UnifyResolutionS2L2A

% Last Modified by GUIDE v2.5 01-Jan-2021 21:25:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UnifyResolutionS2L2A_OpeningFcn, ...
                   'gui_OutputFcn',  @UnifyResolutionS2L2A_OutputFcn, ...
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


% --- Executes just before UnifyResolutionS2L2A is made visible.
function UnifyResolutionS2L2A_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UnifyResolutionS2L2A (see VARARGIN)

% Choose default command line output for UnifyResolutionS2L2A
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UnifyResolutionS2L2A wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = UnifyResolutionS2L2A_OutputFcn(~, ~, handles) 
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
    {  '*.xml','Specify the L2A Granule XML file (*.*)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify the L2A Granule XML file');
 if  filename > 0  
    set(handles.txtGrabuleXMLFile, 'String', [pathname filename]);
    set(handles.txtOutputFileFolder, 'String', [pathname 'SR_IMG_DATA']);
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
[filename, pathname] = uigetfile( ...
    {  '*.*','Specify the output file folder by selecting a file in the folder (*.*)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify the output folder');
 if  filename > 0  
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
logfile1 = [out_dir '\S2Process.log'];
if exist(logfile1,'file')
    delete logfile1;
end
fid1 = fopen(logfile1,'wt');
logmsg(fid1,handles,'Up- or downsampling S2 images processing started.');

%% get the input and output folders
granule_xml_file = get(handles.txtGrabuleXMLFile,'String');
[L2A_path, L2A_name, ext] = fileparts(granule_xml_file);
logmsg(fid1,handles,['The input granule xml file: ' granule_xml_file]);

%% get the different band image files
L2A_imgdata_path = [L2A_path '\IMG_DATA'];
L2A_10m_imgdata_path = [L2A_path '\IMG_DATA\R10m'];
L2A_20m_imgdata_path = [L2A_path '\IMG_DATA\R20m'];
L2A_60m_imgdata_path = [L2A_path '\IMG_DATA\R60m'];

%% get georeference info for data output
geoinfo = getMetadata(granule_xml_file);

%% test data area
cropsubimg = get(handles.chkCropImageFromTileImage,'Value');
overwrite = get(handles.chkOverwriteTileOutputFile,'Value');
Sy = str2double(get(handles.txtEastMin,'String'));
Ny = str2double(get(handles.txtEastMax,'String'));
Ex = str2double(get(handles.txtNorthMin,'String'));
Wx = str2double(get(handles.txtNorthMax,'String'));
ylim = [min([Sy Ny]), max([Sy Ny])];
xlim = [min([Ex Wx]), max([Ex Wx])];

   
%% get scaling processing method
switch get(handles.popUpDownScalingMethod,'Value')
    case 1 % Retreive 10m resolution bands only
        method = 'R0-10';
        % create output data folder
        out_dir = createOutputFolder(out_dir,method);
        % copy the original 10m band data files to output data folder only
        % get all 10m band data files
        fnames = dir(L2A_10m_imgdata_path);
        fnames = {fnames(~[fnames.isdir]).name};
        for i=1:length(fnames)
            [path, fn, ext] = fileparts(fnames{i});
            fnames{i} = [L2A_10m_imgdata_path '\' fnames{i}];
            if contains(fn,'B02_10m') % copy band B02 data
                img = imread(fnames{i});
                out_fn = [out_dir '\' fn '.tif'];
                SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
            end
            if contains(fn,'B03_10m') % copy band B03 data
                img = imread(fnames{i});
                out_fn = [out_dir '\' fn '.tif'];
                SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
            end
            if contains(fn,'B04_10m') % copy band B04 data
                img = imread(fnames{i});
                out_fn = [out_dir '\' fn '.tif'];
                SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
            end
            if contains(fn,'B08_10m') % copy band B08 data
                img = imread(fnames{i});
                out_fn = [out_dir '\' fn '.tif'];
                SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
            end            
        end
    case 2 %Downsampling (10m->20m) using a block reducing algorithm
        method = 'R1-20';
        % create output data folder
        out_dir = createOutputFolder(out_dir,method);
        % copy the L2A 20m band data files to output data folder only
        % get all L2A 20m band data files
        fnames = dir(L2A_20m_imgdata_path);
        fnames = {fnames(~[fnames.isdir]).name};
        for i=1:length(fnames)
            [path, fn, ext] = fileparts(fnames{i});
            fnames{i} = [L2A_20m_imgdata_path '\' fnames{i}];
            if contains(fn,'_20m') % copy all 20m resolution images
                img = imread(fnames{i});
                out_fn = [out_dir '\' fn '.tif'];
                SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
            end
        end
    case 3 %Upsampling (20m->10m) using bicubic spline interpolation
        method = 'R2-10';
        % create output data folder
        out_dir = createOutputFolder(out_dir,method);
        % read in the original image data
        S2_10m = Read10mBandData(L2A_10m_imgdata_path);
        S2_20m = Read20mBandData(L2A_20m_imgdata_path);
        [path, fn, ext] = fileparts(granule_xml_file);
        % output original 10m band data
        img = S2_10m(:,:,1);
        out_fn = [out_dir '\' fn '_B02_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = S2_10m(:,:,2);
        out_fn = [out_dir '\' fn '_B03_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = S2_10m(:,:,3);
        out_fn = [out_dir '\' fn '_B04_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = S2_10m(:,:,4);
        out_fn = [out_dir '\' fn '_B08_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        % upsampling the 20m bands data to 10m
        img = imresize(S2_20m(:,:,1),2,'bicubic');
        out_fn = [out_dir '\' fn '_B05_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = imresize(S2_20m(:,:,2),2,'bicubic');
        out_fn = [out_dir '\' fn '_B06_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = imresize(S2_20m(:,:,3),2,'bicubic');
        out_fn = [out_dir '\' fn '_B07_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = imresize(S2_20m(:,:,4),2,'bicubic');
        out_fn = [out_dir '\' fn '_B8A_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = imresize(S2_20m(:,:,5),2,'bicubic');
        out_fn = [out_dir '\' fn '_B11_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = imresize(S2_20m(:,:,6),2,'bicubic');
        out_fn = [out_dir '\' fn '_B12_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim); 
        clear S2_10m S2_20m img; 
    case 4 %Upsampling (20m->10m) using ATPRK MS Sharpening algorithm
        method = 'D1-10';
        % create output data folder
        out_dir = createOutputFolder(out_dir,method);
        % prepare input data for the ATPRK MS method
        S2_10m = Read10mBandData(L2A_10m_imgdata_path);
        S2_20m = Read20mBandData(L2A_20m_imgdata_path);
        % upsampling the 20m bands data
        SR_10m = SR_ByATPRK_MSSharpen(S2_20m, S2_10m);
        % save the upsampled data to the output folder
        % data in order 10m bands: B02 B03 B04 B08  20m bands: B05 B06 B07 B8A B11 B12
        [path, fn, ext] = fileparts(granule_xml_file);
        % output original 10m band data
        img = S2_10m(:,:,1);
        out_fn = [out_dir '\' fn '_B02_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = S2_10m(:,:,2);
        out_fn = [out_dir '\' fn '_B03_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = S2_10m(:,:,3);
        out_fn = [out_dir '\' fn '_B04_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = S2_10m(:,:,4);
        out_fn = [out_dir '\' fn '_B08_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        % output super resolved 10m band data
        img = SR_10m(:,:,1);
        out_fn = [out_dir '\' fn '_B05_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,2);
        out_fn = [out_dir '\' fn '_B06_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,3);
        out_fn = [out_dir '\' fn '_B07_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,4);
        out_fn = [out_dir '\' fn '_B8A_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,5);
        out_fn = [out_dir '\' fn '_B11_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,6);
        out_fn = [out_dir '\' fn '_B12_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim); 
        clear S2_10m S2_20m SR_10m; 
    case 5 %Upsampling (20m->10m) using ATPRK PAN Sharpening algorithm
        method = 'D2-10'; 
        % create output data folder
        out_dir = createOutputFolder(out_dir,method);
        % prepare input data for the ATPRK PAN method
        S2_10m = Read10mBandData(L2A_10m_imgdata_path);
        S2_20m = Read20mBandData(L2A_20m_imgdata_path);
        % upsampling the 20m bands data
        SR_10m = SR_ByATPRK_PANSharpen(S2_20m, S2_10m);
        % save the upsampled data to the output folder
        % data in order 10m bands: B02 B03 B04 B08  20m bands: B05 B06 B07 B8A B11 B12
        [path, fn, ext] = fileparts(granule_xml_file);
        % output original 10m band data
        img = S2_10m(:,:,1);
        out_fn = [out_dir '\' fn '_B02_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = S2_10m(:,:,2);
        out_fn = [out_dir '\' fn '_B03_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = S2_10m(:,:,3);
        out_fn = [out_dir '\' fn '_B04_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = S2_10m(:,:,4);
        out_fn = [out_dir '\' fn '_B08_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        % output super resolved 10m band data
        img = SR_10m(:,:,1);
        out_fn = [out_dir '\' fn '_B05_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,2);
        out_fn = [out_dir '\' fn '_B06_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,3);
        out_fn = [out_dir '\' fn '_B07_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,4);
        out_fn = [out_dir '\' fn '_B8A_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,5);
        out_fn = [out_dir '\' fn '_B11_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,6);
        out_fn = [out_dir '\' fn '_B12_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);         
        clear S2_10m S2_20m SR_10m;        
    case 6 %Upsampling (20m->10m) using Sen2Res algorithm
        method = 'D3-10';
        % create output data folder
        out_dir = createOutputFolder(out_dir,method);
        % prepare input data for the Sen2Res method
        
    case 7 %Upsampling (20m->10m) using SupReME algorithm
        method = 'D4-10';
        % create output data folder
        out_dir = createOutputFolder(out_dir,method);
        % prepare input data for the SupReME method
        N = 3; % divide the tile into NxN blocks
        Yim = ReadL2AData(L2A_10m_imgdata_path,L2A_20m_imgdata_path,L2A_60m_imgdata_path, N);
        % upsampling the 20m bands data
        SR_10m = SR_BySupReME(Yim, N);
        % save the upsampled data to the output folder
        % data in order [B1 B2 B3 B4 B5 B6 B7 B8 B8A B9 B11 B12] 
        [path, fn, ext] = fileparts(granule_xml_file);
        % output original 10m band data
        img = SR_10m(:,:,2);
        out_fn = [out_dir '\' fn '_B02_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,3);
        out_fn = [out_dir '\' fn '_B03_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,4);
        out_fn = [out_dir '\' fn '_B04_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,5);
        out_fn = [out_dir '\' fn '_B05_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,6);
        out_fn = [out_dir '\' fn '_B06_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,7);
        out_fn = [out_dir '\' fn '_B07_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,8);
        out_fn = [out_dir '\' fn '_B08_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,9);
        out_fn = [out_dir '\' fn '_B8A_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,10);
        out_fn = [out_dir '\' fn '_B09_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,11);
        out_fn = [out_dir '\' fn '_B11_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,12);
        out_fn = [out_dir '\' fn '_B12_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);         
        clear Yim SR_10m;
    case 8 %Upsampling (20m->10m) using DSen2 algorithm
        method = 'D5-10';
        % create output data folder
        out_dir = createOutputFolder(out_dir,method);
        % prepare input data for the DSen2 method
        S2_10m = Read10mBandData(L2A_10m_imgdata_path);
        im20 = Read20mBandData(L2A_20m_imgdata_path);
        % change the band order from [B02 B03 B04 B08] to [(B4, B3, B2, B8]
        im10 = S2_10m;
        B2 = S2_10m(:,:,1); B4 = S2_10m(:,:,3);
        im10(:,:,1) = B4; im10(:,:,3) = B2;
        clear B2 B4;        
        % upsampling the 20m bands data
        SR_10m = SR_ByDSen2(im10, im20);
        % save the upsampled data to the output folder
        % data in order 10m bands: B02 B03 B04 B08  20m bands: [B05 B06 B07
        % B8A B11 B12]
        [path, fn, ext] = fileparts(granule_xml_file);
        % output original 10m band data
        img = S2_10m(:,:,1);
        out_fn = [out_dir '\' fn '_B02_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = S2_10m(:,:,2);
        out_fn = [out_dir '\' fn '_B03_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = S2_10m(:,:,3);
        out_fn = [out_dir '\' fn '_B04_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = S2_10m(:,:,4);
        out_fn = [out_dir '\' fn '_B08_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        % output super resolved 10m band data
        img = SR_10m(:,:,1);
        out_fn = [out_dir '\' fn '_B05_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,2);
        out_fn = [out_dir '\' fn '_B06_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,3);
        out_fn = [out_dir '\' fn '_B07_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,4);
        out_fn = [out_dir '\' fn '_B8A_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,5);
        out_fn = [out_dir '\' fn '_B11_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim);
        img = SR_10m(:,:,6);
        out_fn = [out_dir '\' fn '_B12_10m.tif'];
        SaveToGeotiffFile(img,out_fn,geoinfo,cropsubimg,overwrite,xlim,ylim); 
        clear S2_10m im10 im20 SR_10m;  
end

ttime = toc;
disp(['>>> Elapsed time: ', num2str(ttime),' seconds. <<<'])
disp(' ')

%% close the log file
%% Close the logfile
logmsg(fid1,handles,'Completed S2 MSI image processing.');
logmsg(fid1,handles,['>>> Elapsed time: ', num2str(ttime),' seconds. <<<']);
fclose(fid1);

disp('>>> Completed unifying S2 image band resolutions. <<<');

% --- Executes on button press in pbStop.
function pbStop_Callback(hObject, eventdata, handles)
% hObject    handle to pbStop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global stop_processing;
stop_processing = 1;

% --- Executes on selection change in popUpDownScalingMethod.
function popUpDownScalingMethod_Callback(hObject, eventdata, handles)
% hObject    handle to popUpDownScalingMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popUpDownScalingMethod contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popUpDownScalingMethod


% --- Executes during object creation, after setting all properties.
function popUpDownScalingMethod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popUpDownScalingMethod (see GCBO)
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
