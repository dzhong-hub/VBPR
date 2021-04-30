function varargout = WV3_Application_Regression(varargin)
% WV3_APPLICATION_REGRESSION MATLAB code for WV3_Application_Regression.fig
%      WV3_APPLICATION_REGRESSION, by itself, creates a new WV3_APPLICATION_REGRESSION or raises the existing
%      singleton*.
%
%      H = WV3_APPLICATION_REGRESSION returns the handle to a new WV3_APPLICATION_REGRESSION or the handle to
%      the existing singleton*.
%
%      WV3_APPLICATION_REGRESSION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WV3_APPLICATION_REGRESSION.M with the given input arguments.
%
%      WV3_APPLICATION_REGRESSION('Property','Value',...) creates a new WV3_APPLICATION_REGRESSION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before WV3_Application_Regression_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to WV3_Application_Regression_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help WV3_Application_Regression

% Last Modified by GUIDE v2.5 08-Feb-2021 20:23:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @WV3_Application_Regression_OpeningFcn, ...
                   'gui_OutputFcn',  @WV3_Application_Regression_OutputFcn, ...
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


% --- Executes just before WV3_Application_Regression is made visible.
function WV3_Application_Regression_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to WV3_Application_Regression (see VARARGIN)

% Choose default command line output for WV3_Application_Regression
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes WV3_Application_Regression wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = WV3_Application_Regression_OutputFcn(~, ~, handles) 
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

%% get wv3 input image file path
wv3_input_file = get(handles.txtWV3ImageInputFile,'String');
if contains(wv3_input_file,'10M')
    res = 10;
elseif contains(wv3_input_file,'20M')
    res = 20;
else
    res = 2;
end

%% Get the output folder
out_dir = get(handles.txtOutputFileFolder,'String');
if exist(out_dir,'dir') ~= 7
    %% Create output folders
    mkdir(out_dir);             
end

%% read in the predictor variables
[img, xe, yn, info] = geoimread(wv3_input_file);
bbox = info.BoundingBox;
option.ModelPixelScaleTag = info.ModelPixelScaleTag; %info.PixelScale; %[10;10;0];
option.ModelTiepointTag = info.ModelTiepointTag; %[0;0;0;ulx;uly;0];
option.GTModelTypeGeoKey = 1;
option.GeoKeyDirectoryTag = info.GeoKeyDirectoryTag;

%% compute NDVI for vegetation detection
img = double(img);
ndvi = ComputeNDVI(img, 8, 5, 10000);

%% reorganize the input variable data
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
method = get(handles.popRegressionMethod,'Value');
h = waitbar(0,'Applying regression ...');
ip = 0;
for bb={'LAI','FCOVER','FAPAR','LAI_Cab','LAI_Cw'}
    ip = ip+1;
    switch method
        case 1 % Linear Regression
            fnames = dir([mdl_file_dir '\' char(bb) '_LinearR.mat']);
            mdl_file = fnames(~[fnames.isdir]).name;
            load([mdl_file_dir '\' mdl_file]);
            if strcmp(mdl.method, 'LinearR')
                [yp, ci] = predict(mdl.LinearR,X);                
            else
                msgbox('The trained mdl data is not from the linear regression!', 'error');
                return;
            end
            outstr = ['_' char(bb) '_by_LinearR.tif'];
            flagstr = ['_' char(bb) '_by_LinearR_Flags.tif'];
        case 2 % Lasso Regression
            fnames = dir([mdl_file_dir '\' char(bb) '_LassoR.mat']);
            mdl_file = fnames(~[fnames.isdir]).name;
            load([mdl_file_dir '\' mdl_file]);
            if strcmp(mdl.method, 'LassoR')
                idxLambda1SE = mdl.FitInfo.Index1SE;
                coef = mdl.LassoR(:,idxLambda1SE);
                coef0 =  mdl.FitInfo.Intercept(idxLambda1SE);
                yp = X*coef + coef0;
            else
                msgbox('The trained mdl data is not from the lasso regression!', 'error');
                return;
            end
            outstr = ['_' char(bb) '_by_LassoR.tif'];
            flagstr = ['_' char(bb) '_by_LassoR_Flags.tif'];
        case 3 % Regression Tree
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
    end
    %% save the predicted result
    y(valid_idx) = yp;
    img = reshape(y, r, c);
    [~, fn, ext] = fileparts(wv3_input_file);
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
  


% --- Executes during object creation, after setting all properties.
function pbOK_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pbOK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
