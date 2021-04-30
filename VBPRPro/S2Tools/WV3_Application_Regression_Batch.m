function varargout = WV3_Application_Regression_Batch(varargin)
% WV3_APPLICATION_REGRESSION_BATCH MATLAB code for WV3_Application_Regression_Batch.fig
%      WV3_APPLICATION_REGRESSION_BATCH, by itself, creates a new WV3_APPLICATION_REGRESSION_BATCH or raises the existing
%      singleton*.
%
%      H = WV3_APPLICATION_REGRESSION_BATCH returns the handle to a new WV3_APPLICATION_REGRESSION_BATCH or the handle to
%      the existing singleton*.
%
%      WV3_APPLICATION_REGRESSION_BATCH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WV3_APPLICATION_REGRESSION_BATCH.M with the given input arguments.
%
%      WV3_APPLICATION_REGRESSION_BATCH('Property','Value',...) creates a new WV3_APPLICATION_REGRESSION_BATCH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before WV3_Application_Regression_Batch_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to WV3_Application_Regression_Batch_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help WV3_Application_Regression_Batch

% Last Modified by GUIDE v2.5 09-Apr-2021 19:29:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @WV3_Application_Regression_Batch_OpeningFcn, ...
                   'gui_OutputFcn',  @WV3_Application_Regression_Batch_OutputFcn, ...
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


% --- Executes just before WV3_Application_Regression_Batch is made visible.
function WV3_Application_Regression_Batch_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to WV3_Application_Regression_Batch (see VARARGIN)

% Choose default command line output for WV3_Application_Regression_Batch
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes WV3_Application_Regression_Batch wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = WV3_Application_Regression_Batch_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtS2SL2PBioVariableDataFile_Callback(hObject, eventdata, ~)
% hObject    handle to txtS2SL2PBioVariableDataFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtS2SL2PBioVariableDataFile as text
%        str2double(get(hObject,'String')) returns contents of txtS2SL2PBioVariableDataFile as a double


% --- Executes during object creation, after setting all properties.
function txtS2SL2PBioVariableDataFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtS2SL2PBioVariableDataFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseS2SL2PBioVariableFile.
function pbBrowseS2SL2PBioVariableFile_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseS2SL2PBioVariableFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {  '*20m*.tif','Specify a S2 L2B Bio Variable Data File (*20m*.tif)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify a S2 L2B Bio Variable Data File');
 if  filename > 0  
    set(handles.txtS2SL2PBioVariableDataFile, 'String', [pathname filename]);
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

%% get trained MDL file data folder
mdl_file_dir = get(handles.txtWV3MdlFileFolder,'String');

%% Get the output folder
out_dir = get(handles.txtOutputFileFolder,'String');
if exist(out_dir,'dir') ~= 7
    %% Create output folders
    mkdir(out_dir);             
end

%% match WV3 2m samples to S2 10m resolution
%% get S2 reference image file
s2_ref_file = get(handles.txtS2RefImageFile,'String');

%% read in geolocation info of the reference image
[ref, xq, yq, info] = geoimread(s2_ref_file);
bbox = info.BoundingBox;
option.ModelPixelScaleTag = info.ModelPixelScaleTag; %info.PixelScale; %[10;10;0];
option.ModelTiepointTag = info.ModelTiepointTag; %[0;0;0;ulx;uly;0];
option.GTModelTypeGeoKey = 1;
option.GeoKeyDirectoryTag = info.GeoKeyDirectoryTag;

[rq,cq,bq]=size(ref);

if contains(s2_ref_file,'10m')
    res = 10;
elseif contains(s2_ref_file,'20m')
    res = 20;
else
    res = 2;
end

%% get wv3 input image file and read in the data
wv3_file = get(handles.txtWV3ImageInputFile,'String');
[img, x, y, geo] = geoimread(wv3_file);
img = double(img);
[r,c,b] = size(img);    

%% apply spatial filter
if res > 2
    h = fspecial('average',res/2);
    sf_img = imfilter(img, h, 'replicate', 'same');
    
    %% reset the original invalid pixels to value 0
    for i = 1:b
        band = sf_img(:,:,i);
        invalid = img(:,:,i) <= 0 | isnan(img(:,:,i));
        band(invalid) = 0;
        sf_img(:,:,i) = band;
    end  

    %% save the filtered image with the reference geolocation info
    sf_out_file = strrep(wv3_file,'.tif',['_' num2str(res) 'MPSF.tif']);
    wv3_bbox = geo.BoundingBox;
    geo.GTModelTypeGeoKey = 1;
    geotiffwrite(sf_out_file, wv3_bbox, sf_img, 32, geo);
    
    %% resample the filtered image data to S2 reference resolution
    % initialize the output image
    outimg = zeros(rq,cq,b);
    % interpolation by nearest naighbor grid points
    [X, Y] = meshgrid(x,y);
    [Xq, Yq] = meshgrid(xq,yq);
    for i=1:b        
        outimg(:,:,i) = interp2(X,Y,sf_img(:,:,i),Xq,Yq,'nearest',0);
    end
    wv3_sample_file = strrep(sf_out_file,'.tif',['_' num2str(res) 'MNNP.tif']);
    % save the result with the reference geolocation info
    geotiffwrite(wv3_sample_file, bbox, outimg, 32, option);
    % replace the input file with the resampled data file
    wv3_file = wv3_sample_file;
    clear outimg option;
end

%% read in the WV3 sample data
[img, xe, yn, info] = geoimread(wv3_file);
bbox = info.BoundingBox;
option.ModelPixelScaleTag = info.ModelPixelScaleTag; 
option.ModelTiepointTag = info.ModelTiepointTag; 
option.GTModelTypeGeoKey = 1;
option.GeoKeyDirectoryTag = info.GeoKeyDirectoryTag;

%% compute NDVI for vegetation detection
img = double(img);
ndvi = ComputeNDVI(img, 8, 5, 10000);

%% reorganize the input data
[r, c, b] = size(img);
Xo = zeros(r*c,b);
for i=1:b
    band = img(:,:,i);
    Xo(:,i) = band(:);
end
clear img xe yn;

%% initialize the BIO vector to zeros
y = zeros(r*c,1);

%% apply regression prediction
h = waitbar(0,'Applying regression ...');
ip = 0;
for bb={'LAI','FCOVER','FAPAR','LAI_Cab','LAI_Cw'}
    ip = ip+1;
    % read the trained data
    fnames = dir([mdl_file_dir '\' char(bb) '_RTree.mat']);
    mdl_file = fnames(~[fnames.isdir]).name;
    load([mdl_file_dir '\' mdl_file]);
    % read the mask data
    fnames = dir([mdl_file_dir '\' char(bb) '_Mask_RTree.mat']);
    mask_file = fnames(~[fnames.isdir]).name;
    load([mdl_file_dir '\' mask_file]);
    % expand 20m resolution mask to match 10m resolution
    if res == 10
        flags = ones(r,c);
        [rm,cm]=size(mask);
        for i=1:rm
            for j=1:cm
                flags((2*i-1):2*i, (2*j-1):2*j)=mask(i,j);
            end
        end
    elseif res == 20
        flags = mask;
    else
        flags = zeros(r,c); % no masked pixels for 2m original image
    end
    % QC to exclude non-vegetation and invalid pixels
    new_flags = ndvi(:)<=0 | flags(:) > 0;  % non-veg pixels
    valid_idx = find(new_flags==0);
    X = Xo(valid_idx,:);

    new_flags = reshape(new_flags, r,c);

    if strcmp(mdl.method, 'RTree')
        yp = predict(mdl.RTree,X);
    else
        msgbox('The trained mdl data is not from the regression tree!', 'error');
        return;
    end
    outstr = ['_' char(bb) '_by_RTree.tif']; 
    flagstr = ['_' char(bb) '_by_RTree_Flags.tif'];

    %% save the predicted result
    y(valid_idx) = yp;
    img = reshape(y, r, c);
    [~, fn, ext] = fileparts(wv3_file);
    out_file = [out_dir '\' fn outstr];
    flag_file = [out_dir '\' fn flagstr];
    bit_depth = 32;
    geotiffwrite(out_file, bbox, img, bit_depth, option);
    bit_depth = 8;
    geotiffwrite(flag_file, bbox, new_flags, bit_depth, option);
    
    waitbar(ip/5)
    
    %% check if the processing was stopped mannually
    if stop_processing == 1
        logmsg(fid1,handles,'The processing was stopped manually.');
        close(h);
        return;
    end

end
close(h);

ttime = toc;
disp(' ')
disp(['>>> Elapsed time: ', num2str(ttime),' seconds. <<<'])
disp('>>> Completed regression predictions. <<<');

% --- Executes on button press in pbStop.
function pbStop_Callback(hObject, eventdata, handles)
% hObject    handle to pbStop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global stop_processing;
stop_processing = 1;

% --- Executes on selection change in popRegressionMethod.
function popRegressionMethod_Callback(hObject, eventdata, handles)
% hObject    handle to popRegressionMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popRegressionMethod contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popRegressionMethod


% --- Executes during object creation, after setting all properties.
function popRegressionMethod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popRegressionMethod (see GCBO)
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



function txtWV3MdlFileFolder_Callback(~, eventdata, handles)
% hObject    handle to txtWV3MdlFileFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtWV3MdlFileFolder as text
%        str2double(get(hObject,'String')) returns contents of txtWV3MdlFileFolder as a double


% --- Executes during object creation, after setting all properties.
function txtWV3MdlFileFolder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtWV3MdlFileFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseMDLFileFolder.
function pbBrowseMDLFileFolder_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseMDLFileFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {  '*.mat','Specify a calibration regression output file (*.mat)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify a calibration regression output file');
 if  filename > 0  
    set(handles.txtWV3MdlFileFolder, 'String', pathname);
    %set(handles.txtWV3MdlFileFolder, 'String', [pathname filename]);
 end 
 cd(cur_dir);



function txtWV3ImageInputFile_Callback(hObject, eventdata, handles)
% hObject    handle to txtWV3ImageInputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtWV3ImageInputFile as text
%        str2double(get(hObject,'String')) returns contents of txtWV3ImageInputFile as a double


% --- Executes during object creation, after setting all properties.
function txtWV3ImageInputFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtWV3ImageInputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseWV3ImageInputFile.
function pbBrowseWV3ImageInputFile_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseWV3ImageInputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {  '*.tif','Specify a WV3 image input file (*.tif)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify a WV3 image input file');
 if  filename > 0  
    set(handles.txtWV3ImageInputFile, 'String', [pathname filename]);
 end 
 cd(cur_dir);  


% --- Executes during object creation, after setting all properties.
function pbOK_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pbOK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function txtS2RefImageFile_Callback(hObject, eventdata, handles)
% hObject    handle to txtS2RefImageFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtS2RefImageFile as text
%        str2double(get(hObject,'String')) returns contents of txtS2RefImageFile as a double


% --- Executes during object creation, after setting all properties.
function txtS2RefImageFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtS2RefImageFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseS2RefImgFile.
function pbBrowseS2RefImgFile_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseS2RefImgFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {  'SUB_REF*.tif','Specify a S2 reference image file (*.tif)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify a S2 reference image file');
 if  filename > 0  
    set(handles.txtS2RefImageFile, 'String', [pathname filename]);
 end 
 cd(cur_dir);  
