function varargout = UnifyResolutionSubarea(varargin)
% UNIFYRESOLUTIONSUBAREA MATLAB code for UnifyResolutionSubarea.fig
%      UNIFYRESOLUTIONSUBAREA, by itself, creates a new UNIFYRESOLUTIONSUBAREA or raises the existing
%      singleton*.
%
%      H = UNIFYRESOLUTIONSUBAREA returns the handle to a new UNIFYRESOLUTIONSUBAREA or the handle to
%      the existing singleton*.
%
%      UNIFYRESOLUTIONSUBAREA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNIFYRESOLUTIONSUBAREA.M with the given input arguments.
%
%      UNIFYRESOLUTIONSUBAREA('Property','Value',...) creates a new UNIFYRESOLUTIONSUBAREA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UnifyResolutionSubarea_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UnifyResolutionSubarea_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UnifyResolutionSubarea

% Last Modified by GUIDE v2.5 02-Jan-2021 14:09:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UnifyResolutionSubarea_OpeningFcn, ...
                   'gui_OutputFcn',  @UnifyResolutionSubarea_OutputFcn, ...
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


% --- Executes just before UnifyResolutionSubarea is made visible.
function UnifyResolutionSubarea_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UnifyResolutionSubarea (see VARARGIN)

% Choose default command line output for UnifyResolutionSubarea
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UnifyResolutionSubarea wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = UnifyResolutionSubarea_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtSubareaGeoreferenceImageFile_Callback(hObject, eventdata, ~)
% hObject    handle to txtSubareaGeoreferenceImageFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtSubareaGeoreferenceImageFile as text
%        str2double(get(hObject,'String')) returns contents of txtSubareaGeoreferenceImageFile as a double


% --- Executes during object creation, after setting all properties.
function txtSubareaGeoreferenceImageFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSubareaGeoreferenceImageFile (see GCBO)
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
    {  '*.tif','Specify a Subset Geotiff Image File for Georeference (*.tif)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify a Subset Geotiff Image File');
 if  filename > 0  
    set(handles.txtSubareaGeoreferenceImageFile, 'String', [pathname filename]);
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
logfile1 = [out_dir '\SubSuperResolutionProcess.log'];
if exist(logfile1,'file')
    delete logfile1;
end
fid1 = fopen(logfile1,'wt');
logmsg(fid1,handles,'Up- or downsampling S2 subarea images process started.');

%% get the input and output folders
sub_ref_file = get(handles.txtSubareaGeoreferenceImageFile,'String');
logmsg(fid1,handles,['The input subarea georeference image file: ' sub_ref_file]);

%% get the input image data folder
in_path = get(handles.txtInputImgFolder,'String');

%% get georeference info for data output
if license('test','MAP_Toolbox') == 1
    info = geotiffinfo(sub_ref_file); %% need mapping toolbox
    bbox = info.BoundingBox;
    option.ModelPixelScaleTag = info.GeoTIFFTags.ModelPixelScaleTag; %info.PixelScale; %[10;10;0];
    option.ModelTiepointTag = info.GeoTIFFTags.ModelTiepointTag; %[0;0;0;ulx;uly;0];
    option.GTModelTypeGeoKey = 1;
    option.ProjectedCSTypeGeoKey = info.GeoTIFFCodes.PCS;
    save info.mat info;
else
    [img,x,y,info] = geoimread(sub_ref_file);
    bbox = info.BoundingBox;
    option.ModelPixelScaleTag = info.ModelPixelScaleTag; %info.PixelScale; %[10;10;0];
    option.ModelTiepointTag = info.ModelTiepointTag; %[0;0;0;ulx;uly;0];
    option.GTModelTypeGeoKey = 1;
    option.GeoKeyDirectoryTag = info.GeoKeyDirectoryTag;
    clear img x y;
end
% save option.mat bbox option;
% load option.mat bbox option;
  
%% get scaling processing method
switch get(handles.popUpDownScalingMethod,'Value')
    case 1 % Retreive 10m resolution bands only
        method = 'R0-10';
        % create output data folder
        out_dir = createOutputFolder(out_dir,method);
        % copy the original 10m band data files to output data folder only
        % get all 10m band data files
        fnames = dir([in_path 'SUB*2A*10m.tif']);
        fnames = {fnames(~[fnames.isdir]).name};
        for i=1:length(fnames)
            [path, fn, ext] = fileparts(fnames{i});
            fnames{i} = [in_path fnames{i}];
            out_fn = [out_dir '\' fn '.tif'];
            %copyfile(fnames{i},out_fn); % copy all 10m resolution files including view angle files
            % resave the data to make sure that all bands have the same format
            img_10m = imread(fnames{i});
            geotiffwrite(out_fn, bbox, img_10m, -16, option);
        end
        % upsampling 20m resolution SCL image to 10m by the nearest
        % interpolation
        fnames = dir([in_path 'SUB*SCL*20m.tif']);
        fnames = {fnames(~[fnames.isdir]).name};
        [path, fn, ext] = fileparts(fnames{1});
        sclfname = [in_path '\' fnames{1}];
        img_20m = imread(sclfname);
        img_10m = imresize(img_20m,2,'nearest');
        fn = strrep(fn,'20m','10m');
        out_fn = [out_dir '\' fn '.tif'];
        geotiffwrite(out_fn, bbox, img_10m, -16, option);
    case 2 %Downsampling (10m->20m) using a block reducing algorithm
        method = 'R1-20';
        % create output data folder
        out_dir = createOutputFolder(out_dir,method);
        % copy the L2A 20m band data files to output data folder only
        % get all L2A 20m band data files
        fnames = dir([in_path 'SUB*2A*20m.tif']);
        fnames = {fnames(~[fnames.isdir]).name};
        for i=1:length(fnames)
            [path, fn, ext] = fileparts(fnames{i});
            fnames{i} = [in_path '\' fnames{i}];
            out_fn = [out_dir '\' fn '.tif'];
            copyfile(fnames{i},out_fn); % copy all 20m resolution files including view angle files
            % resave the data to make sure that all bands have the same format
            % but be careful, the reference file will change the
            % geolocation info if it has a different resolution than 20m.
            % img_20m = imread(fnames{i});
            % geotiffwrite(out_fn, bbox, img_20m, -16, option);
        end
    case 3 %Upsampling (20m->10m) using bicubic spline interpolation
        method = 'R2-10';
        % create output data folder
        out_dir = createOutputFolder(out_dir,method);
        % copy the original 10m band data files to output data folder first
        % get all 10m band data files
        fnames = dir([in_path 'SUB*2A*10m.tif']);
        fnames = {fnames(~[fnames.isdir]).name};
        for i=1:length(fnames)
            [path, fn, ext] = fileparts(fnames{i});
            fnames{i} = [in_path '\' fnames{i}];
            out_fn = [out_dir '\' fn '.tif'];
            % copyfile(fnames{i},out_fn); % copy all 10m resolution files including view angle files
            % resave the data to make sure that all bands have the same format
            img_10m = imread(fnames{i});
            geotiffwrite(out_fn, bbox, img_10m, -16, option);
        end
        % upsampling 20m resolution SCL image to 10m by the nearest
        % interpolation
        fnames = dir([in_path 'SUB*SCL*20m.tif']);
        fnames = {fnames(~[fnames.isdir]).name};
        [path, fn, ext] = fileparts(fnames{1});
        sclfname = [in_path '\' fnames{1}];
        img_20m = imread(sclfname);
        img_10m = imresize(img_20m,2,'nearest');
        fn = strrep(fn,'20m','10m');
        out_fn = [out_dir '\' fn '.tif'];
        geotiffwrite(out_fn, bbox, img_10m, -16, option);
        % upsampling 20m resolution images to 10m
        % get all L2A 20m band data files
        fnames = dir([in_path 'SUB*2A*20m.tif']);
        fnames = {fnames(~[fnames.isdir]).name};
        for i=1:length(fnames)
            [path, fn, ext] = fileparts(fnames{i});
            if contains(fn,'_B05_20m')
                fnames{i} = [in_path '\' fnames{i}];
                img_20m = imread(fnames{i});
                img_10m = imresize(img_20m,2,'bicubic');
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, img_10m, -16, option);
            end
            if contains(fn,'_B06_20m')
                fnames{i} = [in_path '\' fnames{i}];
                img_20m = imread(fnames{i});
                img_10m = imresize(img_20m,2,'bicubic');
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, img_10m, -16, option);                
            end
            if contains(fn,'_B07_20m')
                fnames{i} = [in_path '\' fnames{i}];
                img_20m = imread(fnames{i});
                img_10m = imresize(img_20m,2,'bicubic');
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, img_10m, -16, option);                
            end
            if contains(fn,'_B8A_20m')
                fnames{i} = [in_path '\' fnames{i}];
                img_20m = imread(fnames{i});
                img_10m = imresize(img_20m,2,'bicubic');
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, img_10m, -16, option);                
            end
            if contains(fn,'_B11_20m')
                fnames{i} = [in_path '\' fnames{i}];
                img_20m = imread(fnames{i});
                img_10m = imresize(img_20m,2,'bicubic');
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, img_10m, -16, option);                
            end
            if contains(fn,'_B12_20m')
                fnames{i} = [in_path '\' fnames{i}];
                img_20m = imread(fnames{i});
                img_10m = imresize(img_20m,2,'bicubic');
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, img_10m, -16, option);                
            end
        end
        clear img_10m img_20m; 
    case 4 %Upsampling (20m->10m) using ATPRK MS Sharpening algorithm
        method = 'D1-10';
        % create output data folder
        out_dir = createOutputFolder(out_dir,method);
        % copy the original 10m band data files to output data folder first
        % get all 10m band data files
        fnames = dir([in_path 'SUB*2A*10m.tif']);
        fnames = {fnames(~[fnames.isdir]).name};
        for i=1:length(fnames)
            [path, fn, ext] = fileparts(fnames{i});
            fnames{i} = [in_path '\' fnames{i}];
            out_fn = [out_dir '\' fn '.tif'];
            % copyfile(fnames{i},out_fn); % copy all 10m resolution files including view angle files
            % resave the data to make sure that all bands have the same format
            img_10m = imread(fnames{i});
            geotiffwrite(out_fn, bbox, img_10m, -16, option);
        end
        
        % upsampling 20m resolution SCL image to 10m by the nearest
        % interpolation
        fnames = dir([in_path 'SUB*SCL*20m.tif']);
        fnames = {fnames(~[fnames.isdir]).name};
        [path, fn, ext] = fileparts(fnames{1});
        sclfname = [in_path '\' fnames{1}];
        img_20m = imread(sclfname);
        img_10m = imresize(img_20m,2,'nearest');
        fn = strrep(fn,'20m','10m');
        out_fn = [out_dir '\' fn '.tif'];
        geotiffwrite(out_fn, bbox, img_10m, -16, option);
        
        % upsampling the 20m bands data
        % prepare input data for the ATPRK MS method
        S2_10m = Read10mBandData(in_path);
        S2_20m = Read20mBandData(in_path);      
        SR_10m = SR_ByATPRK_MSSharpen(S2_20m, S2_10m);
        % save the upsampled data to the output folder
        % data in order 10m bands: B02 B03 B04 B08  20m bands: B05 B06 B07 B8A B11 B12
        % get all L2A 20m band data files
        fnames = dir([in_path 'SUB*2A*20m.tif']);
        fnames = {fnames(~[fnames.isdir]).name};
        for i=1:length(fnames)
            [path, fn, ext] = fileparts(fnames{i});
            if contains(fn,'_B05_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, SR_10m(:,:,1), -16, option);
            end
            if contains(fn,'_B06_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, SR_10m(:,:,2), -16, option);
            end
            if contains(fn,'_B07_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, SR_10m(:,:,3), -16, option);
            end
            if contains(fn,'_B8A_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, SR_10m(:,:,4), -16, option);
            end
            if contains(fn,'_B11_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, SR_10m(:,:,5), -16, option);
            end
            if contains(fn,'_B12_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif']; 
                geotiffwrite(out_fn, bbox, SR_10m(:,:,6), -16, option);
            end
        end
        clear S2_10m S2_20m SR_10m; 
    case 5 %Upsampling (20m->10m) using ATPRK PAN Sharpening algorithm
        method = 'D2-10'; 
        % create output data folder
        out_dir = createOutputFolder(out_dir,method);
        % copy the original 10m band data files to output data folder first
        % get all 10m band data files
        fnames = dir([in_path 'SUB*2A*10m.tif']);
        fnames = {fnames(~[fnames.isdir]).name};
        for i=1:length(fnames)
            [path, fn, ext] = fileparts(fnames{i});
            fnames{i} = [in_path '\' fnames{i}];
            out_fn = [out_dir '\' fn '.tif'];
            % copyfile(fnames{i},out_fn); % copy all 10m resolution files including view angle files
            % resave the data to make sure that all bands have the same format
            img_10m = imread(fnames{i});
            geotiffwrite(out_fn, bbox, img_10m, -16, option);
        end
        
        % upsampling 20m resolution SCL image to 10m by the nearest
        % interpolation
        fnames = dir([in_path 'SUB*SCL*20m.tif']);
        fnames = {fnames(~[fnames.isdir]).name};
        [path, fn, ext] = fileparts(fnames{1});
        sclfname = [in_path '\' fnames{1}];
        img_20m = imread(sclfname);
        img_10m = imresize(img_20m,2,'nearest');
        fn = strrep(fn,'20m','10m');
        out_fn = [out_dir '\' fn '.tif'];
        geotiffwrite(out_fn, bbox, img_10m, -16, option);
        
        % upsampling the 20m bands data
        % prepare input data for the ATPRK MS method
        S2_10m = Read10mBandData(in_path);
        S2_20m = Read20mBandData(in_path);      
        SR_10m = SR_ByATPRK_PANSharpen(S2_20m, S2_10m);
        % save the upsampled data to the output folder
        % data in order 10m bands: B02 B03 B04 B08  20m bands: B05 B06 B07 B8A B11 B12
        % get all L2A 20m band data files
        fnames = dir([in_path 'SUB*2A*20m.tif']);
        fnames = {fnames(~[fnames.isdir]).name};
        for i=1:length(fnames)
            [path, fn, ext] = fileparts(fnames{i});
            if contains(fn,'_B05_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif']; 
                geotiffwrite(out_fn, bbox, SR_10m(:,:,1), -16, option);
            end
            if contains(fn,'_B06_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif']; 
                geotiffwrite(out_fn, bbox, SR_10m(:,:,2), -16, option);
            end
            if contains(fn,'_B07_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, SR_10m(:,:,3), -16, option);
            end
            if contains(fn,'_B8A_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, SR_10m(:,:,4), -16, option);             
            end
            if contains(fn,'_B11_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, SR_10m(:,:,5), -16, option);            
            end
            if contains(fn,'_B12_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, SR_10m(:,:,6), -16, option);          
            end
        end
        clear S2_10m S2_20m SR_10m;    
        
    case 6 %Upsampling (20m->10m) using SupReME algorithm
        method = 'D3-10';
        % create output data folder
        out_dir = createOutputFolder(out_dir,method);
        % copy the original 10m band data files to output data folder first
        % get all 10m band data files
        fnames = dir([in_path 'SUB*2A*10m.tif']);
        fnames = {fnames(~[fnames.isdir]).name};
        for i=1:length(fnames)
            [path, fn, ext] = fileparts(fnames{i});
            fnames{i} = [in_path '\' fnames{i}];
            out_fn = [out_dir '\' fn '.tif'];
            % copyfile(fnames{i},out_fn); % copy all 10m resolution files including view angle files
            % resave the data to make sure that all bands have the same format
            img_10m = imread(fnames{i});
            geotiffwrite(out_fn, bbox, img_10m, -16, option);       
        end
        
        % upsampling 20m resolution SCL image to 10m by the nearest
        % interpolation
        fnames = dir([in_path 'SUB*SCL*20m.tif']);
        fnames = {fnames(~[fnames.isdir]).name};
        [path, fn, ext] = fileparts(fnames{1});
        sclfname = [in_path '\' fnames{1}];
        img_20m = imread(sclfname);
        img_10m = imresize(img_20m,2,'nearest');
        fn = strrep(fn,'20m','10m');
        out_fn = [out_dir '\' fn '.tif'];
        geotiffwrite(out_fn, bbox, img_10m, -16, option);
 
        % upsampling the 20m bands data
        % prepare input data for the SupReME method
        N = 1; % divide the tile into NxN blocks
        Yim = ReadL2AData(in_path,in_path,in_path, N);
        % upsampling the 20m bands data
        SR_10m = SR_BySupReME(Yim, N);
        % save the upsampled data to the output folder
        % data in order [B1 B2 B3 B4 B5 B6 B7 B8 B8A B9 B11 B12]
        % get all L2A 20m band data files
        fnames = dir([in_path 'SUB*2A*20m.tif']);
        fnames = {fnames(~[fnames.isdir]).name};
        for i=1:length(fnames)
            [path, fn, ext] = fileparts(fnames{i});
            if contains(fn,'_B05_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, SR_10m(:,:,5), -16, option);
            end
            if contains(fn,'_B06_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, SR_10m(:,:,6), -16, option);
            end
            if contains(fn,'_B07_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, SR_10m(:,:,7), -16, option);
            end
            if contains(fn,'_B8A_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, SR_10m(:,:,9), -16, option);
            end
            if contains(fn,'_B11_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, SR_10m(:,:,11), -16, option);
            end
            if contains(fn,'_B12_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, SR_10m(:,:,12), -16, option);
            end
        end  
        clear Yim SR_10m;
    case 7 %Upsampling (20m->10m) using DSen2 algorithm
        method = 'D4-10';
        % create output data folder
        out_dir = createOutputFolder(out_dir,method);
        % copy the original 10m band data files to output data folder first
        % get all 10m band data files
        fnames = dir([in_path 'SUB*2A*10m.tif']);
        fnames = {fnames(~[fnames.isdir]).name};
        for i=1:length(fnames)
            [path, fn, ext] = fileparts(fnames{i});
            fnames{i} = [in_path '\' fnames{i}];
            out_fn = [out_dir '\' fn '.tif'];
            % copyfile(fnames{i},out_fn); % copy all 10m resolution files including view angle files
            % resave the data to make sure that all bands have the same format
            img_10m = imread(fnames{i});
            geotiffwrite(out_fn, bbox, img_10m, -16, option);       
        end
        
        % upsampling 20m resolution SCL image to 10m by the nearest
        % interpolation
        fnames = dir([in_path 'SUB*SCL*20m.tif']);
        fnames = {fnames(~[fnames.isdir]).name};
        [path, fn, ext] = fileparts(fnames{1});
        sclfname = [in_path '\' fnames{1}];
        img_20m = imread(sclfname);
        img_10m = imresize(img_20m,2,'nearest');
        fn = strrep(fn,'20m','10m');
        out_fn = [out_dir '\' fn '.tif'];
        geotiffwrite(out_fn, bbox, img_10m, -16, option);
        
        % upsampling the 20m bands data        
        % prepare input data for the DSen2 method
        S2_10m = Read10mBandData(in_path);
        im20 = Read20mBandData(in_path);
        % change the band order from [B02 B03 B04 B08] to [(B4, B3, B2, B8]
        im10 = S2_10m;
        B2 = S2_10m(:,:,1); B4 = S2_10m(:,:,3);
        im10(:,:,1) = B4; im10(:,:,3) = B2;
        clear B2 B4 S2_10m;        
        % upsampling the 20m bands data
        SR_10m = SR_ByDSen2(im10, im20);
        % save the upsampled data to the output folder
        % data in order 10m bands: B02 B03 B04 B08  20m bands: [B05 B06 B07
        % B8A B11 B12]
        % get all L2A 20m band data files
        fnames = dir([in_path 'SUB*2A*20m.tif']);
        fnames = {fnames(~[fnames.isdir]).name};
        for i=1:length(fnames)
            [path, fn, ext] = fileparts(fnames{i});
            if contains(fn,'_B05_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, SR_10m(:,:,1), -16, option);
            end
            if contains(fn,'_B06_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, SR_10m(:,:,2), -16, option);                
            end
            if contains(fn,'_B07_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, SR_10m(:,:,3), -16, option);         
            end
            if contains(fn,'_B8A_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, SR_10m(:,:,4), -16, option);             
            end
            if contains(fn,'_B11_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, SR_10m(:,:,5), -16, option);            
            end
            if contains(fn,'_B12_20m')
                fn = strrep(fn,'20m','10m');
                out_fn = [out_dir '\' fn '.tif'];
                geotiffwrite(out_fn, bbox, SR_10m(:,:,6), -16, option);              
            end
        end          
        clear S2_10m im10 im20 SR_10m;  
end

%% Merge all single band image files into one multiple bands image file
[path, fn, ext] = fileparts(sub_ref_file);
out_img_file = [out_dir '\' fn '_ALL_BANDS.tif'];

merge_list_file = [out_dir '\Merge_List.txt'];
if contains(out_dir,'R1-20')
    imgfiles = dir([out_dir '\SUB*B*20m.tif']);
    out_img_file = strrep(out_img_file,'10m','20m');
else
    imgfiles = dir([out_dir '\SUB*B*10m.tif']);
end
% prepare the input image files list
fid_out=fopen(merge_list_file,'wt');
for j=1:length(imgfiles)
    in_image = [out_dir '\' imgfiles(j).name];
    if contains(in_image,'B02')
        fprintf(fid_out,'%s\n',['"' in_image '"']);
        f02 = in_image;
    end
    if contains(in_image,'B03')
        fprintf(fid_out,'%s\n',['"' in_image '"']);
        f03 = in_image;
    end 
    if contains(in_image,'B04')
        fprintf(fid_out,'%s\n',['"' in_image '"']);
        f04 = in_image;
    end
    if contains(in_image,'B05')
        fprintf(fid_out,'%s\n',['"' in_image '"']);
        f05 = in_image;
    end
    if contains(in_image,'B06')
        fprintf(fid_out,'%s\n',['"' in_image '"']);
        f06 = in_image;
    end 
    if contains(in_image,'B07')
        fprintf(fid_out,'%s\n',['"' in_image '"']);
        f07 = in_image;
    end
    if contains(in_image,'B08')
        fprintf(fid_out,'%s\n',['"' in_image '"']);
        f08 = in_image;
    end
    if contains(in_image,'B8A')
        fprintf(fid_out,'%s\n',['"' in_image '"']);
        f8A = in_image;
    end 
    if contains(in_image,'B11')
        fprintf(fid_out,'%s\n',['"' in_image '"']);
        f11 = in_image;
    end 
    if contains(in_image,'B12')
        fprintf(fid_out,'%s\n',['"' in_image '"']);
        f12 = in_image;
    end    
end
% %% to include the SCL band (actually no use)
% if contains(out_dir,'R1-20')
%     imgfiles = dir([out_dir '\SUB*SCL*20m.tif']);
% else
%     imgfiles = dir([out_dir '\SUB*SCL*10m.tif']);
% end
% in_image = [out_dir '\' imgfiles(1).name];
% if contains(in_image,'SCL')
%     fprintf(fid_out,'%s\n',['"' in_image '"']);
% end
fclose(fid_out); 

%% merge all super resolved bands to a file using PCI merge bands function 
% [path, fn, ext] = fileparts(sub_ref_file);
% out_img_file = [out_dir '\' fn '_ALL_BANDS.pix'];
% %% call PCI mergeband module to merge the single band data 
% mergeBandsByPCIMergeband(merge_list_file,out_img_file);            

%% merge all super resolved bands to a file using GDAL functions
%% stack individual bands
%exe_str = ['gdalbuildvrt -separate all_bands.vrt -input_file_list ' merge_list_file];
exe_str = ['gdalbuildvrt -separate all_bands.vrt ' f02 ' ' f03 ' ' f04 ' ' f05 ' ' f06 ' ' f07 ' ' f8A ' ' f11 ' ' f12]; 
dos(exe_str);
%% convert to tif file for output
exe_str = ['gdal_translate all_bands.vrt ' out_img_file];
dos(exe_str);

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
    set(handles.txtOutputFileFolder, 'String', pathname);
 end 
 cd(cur_dir);
