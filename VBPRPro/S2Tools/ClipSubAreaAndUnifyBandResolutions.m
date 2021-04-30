function varargout = ClipSubAreaAndUnifyBandResolutions(varargin)
% CLIPSUBAREAANDUNIFYBANDRESOLUTIONS MATLAB code for ClipSubAreaAndUnifyBandResolutions.fig
%      CLIPSUBAREAANDUNIFYBANDRESOLUTIONS, by itself, creates a new CLIPSUBAREAANDUNIFYBANDRESOLUTIONS or raises the existing
%      singleton*.
%
%      H = CLIPSUBAREAANDUNIFYBANDRESOLUTIONS returns the handle to a new CLIPSUBAREAANDUNIFYBANDRESOLUTIONS or the handle to
%      the existing singleton*.
%
%      CLIPSUBAREAANDUNIFYBANDRESOLUTIONS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CLIPSUBAREAANDUNIFYBANDRESOLUTIONS.M with the given input arguments.
%
%      CLIPSUBAREAANDUNIFYBANDRESOLUTIONS('Property','Value',...) creates a new CLIPSUBAREAANDUNIFYBANDRESOLUTIONS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ClipSubAreaAndUnifyBandResolutions_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ClipSubAreaAndUnifyBandResolutions_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ClipSubAreaAndUnifyBandResolutions

% Last Modified by GUIDE v2.5 05-Apr-2021 21:04:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ClipSubAreaAndUnifyBandResolutions_OpeningFcn, ...
                   'gui_OutputFcn',  @ClipSubAreaAndUnifyBandResolutions_OutputFcn, ...
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


% --- Executes just before ClipSubAreaAndUnifyBandResolutions is made visible.
function ClipSubAreaAndUnifyBandResolutions_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ClipSubAreaAndUnifyBandResolutions (see VARARGIN)

% Choose default command line output for ClipSubAreaAndUnifyBandResolutions
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ClipSubAreaAndUnifyBandResolutions wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ClipSubAreaAndUnifyBandResolutions_OutputFcn(hObject, eventdata, handles) 
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
    ulx = min(info.BoundingBox(:,1)); lrx = max(info.BoundingBox(:,1))+10;
    uly = max(info.BoundingBox(:,2)); lry = min(info.BoundingBox(:,2))-10; 
else
    ulx = str2double(get(handles.txtULEast, 'String'));  uly = str2double(get(handles.txtULNorth, 'String'));
    lrx = str2double(get(handles.txtLREast, 'String'));  lry = str2double(get(handles.LRNorth, 'String'));    
end
    
out_dir = get(handles.txtOutputFolder, 'String');
if isempty(out_dir)
    msgbox('Specify the output file folder first.');
    return;
end

%% Create output folders
if exist(out_dir,'dir') ~= 7  
    mkdir(out_dir);
end
out_raw = [out_dir '\Raw'];
%% Create output folders
if exist(out_raw,'dir') ~= 7  
    mkdir(out_raw);
end
out_sub = [out_dir '\Sub'];
%% Create output folders
if exist(out_sub,'dir') ~= 7  
    mkdir(out_sub);
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

%% Clip all files by the GDAL Translate Module in a LOOP
h = waitbar(0, 'Croping S2 Tile images for a subset...');
for n = 1:nf
    if ischar(file_list)
        in_file = file_list; 
    else
        in_file = file_list{n}; 
    end
    [path, name, ext] = fileparts(in_file);
    out_file = [out_sub '\SUB_' name '.tif'];
    
    % check if the file exists
    if exist(in_file, 'file')
        % convert the jp2 file to geotiff file
        if strcmp(ext,'.jp2')
            img = imread(in_file);
            out_fn = [out_raw '\' name '.tif'];
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


%% scaling resolution processing
out_dir = [out_dir '\'];
out_root = out_dir;
in_path = out_sub;

if ~isempty(subarea_ref_file)
    [img, x,y,info] = geoimread(subarea_ref_file);
    bbox = info.BoundingBox;
    option.ModelPixelScaleTag = info.ModelPixelScaleTag; %info.PixelScale; %[10;10;0];
    option.ModelTiepointTag = info.ModelTiepointTag; %[0;0;0;ulx;uly;0];
    option.GTModelTypeGeoKey = 1;
    option.GeoKeyDirectoryTag = info.GeoKeyDirectoryTag;
    clear img x y;
else
    msgbox('A 10m reference image file is required for downscaling.');
    return;
end

h = waitbar(0, 'Scaling to unify resolutions...');
for mm =1:6
    switch mm %get(handles.popUpDownScalingMethod,'Value')
        case 1 %Downsampling (10m->20m) using a block reducing algorithm
            method = 'R1-20';
            % create output data folder
            out_dir = createOutputFolder(out_root, method);
            % copy the L2A 20m band data files to output data folder only
            % get all L2A 20m band data files
            fnames = dir([in_path '\SUB*20m.tif']);
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
        case 2 %Upsampling (20m->10m) using bicubic spline interpolation
            method = 'R2-10';
            % create output data folder
            out_dir = createOutputFolder(out_root,method);
            % copy the original 10m band data files to output data folder first
            % get all 10m band data files
            fnames = dir([in_path '\SUB*10m.tif']);
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
            % upsampling 20m resolution SCL image to 10m by the nearest interpolation
            fnames = dir([in_path '\SUB*SCL*20m.tif']);
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
            fnames = dir([in_path '\SUB*20m.tif']);
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
        case 3 %Upsampling (20m->10m) using ATPRK MS Sharpening algorithm
            method = 'D1-10';
            % create output data folder
            out_dir = createOutputFolder(out_root,method);
            % copy the original 10m band data files to output data folder first
            % get all 10m band data files
            fnames = dir([in_path '\SUB*10m.tif']);
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
            fnames = dir([in_path '\SUB*SCL*20m.tif']);
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
            fnames = dir([in_path '\SUB*20m.tif']);
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
        case 4 %Upsampling (20m->10m) using ATPRK PAN Sharpening algorithm
            method = 'D2-10'; 
            % create output data folder
            out_dir = createOutputFolder(out_root,method);
            % copy the original 10m band data files to output data folder first
            % get all 10m band data files
            fnames = dir([in_path '\SUB*10m.tif']);
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
            fnames = dir([in_path '\SUB*SCL*20m.tif']);
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
            fnames = dir([in_path '\SUB*20m.tif']);
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

        case 5 %Upsampling (20m->10m) using SupReME algorithm
            method = 'D3-10';
            % create output data folder
            out_dir = createOutputFolder(out_root,method);
            % copy the original 10m band data files to output data folder first
            % get all 10m band data files
            fnames = dir([in_path '\SUB*10m.tif']);
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
            fnames = dir([in_path '\SUB*SCL*20m.tif']);
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
            fnames = dir([in_path '\SUB*20m.tif']);
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
        case 6 %Upsampling (20m->10m) using DSen2 algorithm
            method = 'D4-10';
            % create output data folder
            out_dir = createOutputFolder(out_root,method);
            % copy the original 10m band data files to output data folder first
            % get all 10m band data files
            fnames = dir([in_path '\SUB*10m.tif']);
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
            fnames = dir([in_path '\SUB*SCL*20m.tif']);
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
            fnames = dir([in_path '\SUB*20m.tif']);
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
    out_img_file = [out_dir '\SUB_ALL_BANDS.tif'];

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
    fclose(fid_out); 

    %% merge all super resolved bands to a file using GDAL functions
    %% stack individual bands
    %exe_str = ['gdalbuildvrt -separate all_bands.vrt -input_file_list ' merge_list_file];
    exe_str = ['gdalbuildvrt -separate all_bands.vrt ' f02 ' ' f03 ' ' f04 ' ' f05 ' ' f06 ' ' f07 ' ' f8A ' ' f11 ' ' f12]; 
    dos(exe_str);
    %% convert to tif file for output
    exe_str = ['gdal_translate all_bands.vrt ' out_img_file];
    dos(exe_str);
    
    waitbar(mm/6);
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
    % set(handles.txtOutputFolder, 'String', [pathname 'SUBSET']);
 end 
 cd(cur_dir);


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
