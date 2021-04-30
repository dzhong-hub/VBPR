function varargout = MatchWV3BioToS2BioResolution(varargin)
% MATCHWV3BIOTOS2BIORESOLUTION MATLAB code for MatchWV3BioToS2BioResolution.fig
%      MATCHWV3BIOTOS2BIORESOLUTION, by itself, creates a new MATCHWV3BIOTOS2BIORESOLUTION or raises the existing
%      singleton*.
%
%      H = MATCHWV3BIOTOS2BIORESOLUTION returns the handle to a new MATCHWV3BIOTOS2BIORESOLUTION or the handle to
%      the existing singleton*.
%
%      MATCHWV3BIOTOS2BIORESOLUTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MATCHWV3BIOTOS2BIORESOLUTION.M with the given input arguments.
%
%      MATCHWV3BIOTOS2BIORESOLUTION('Property','Value',...) creates a new MATCHWV3BIOTOS2BIORESOLUTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MatchWV3BioToS2BioResolution_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MatchWV3BioToS2BioResolution_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MatchWV3BioToS2BioResolution

% Last Modified by GUIDE v2.5 17-Mar-2021 09:12:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MatchWV3BioToS2BioResolution_OpeningFcn, ...
                   'gui_OutputFcn',  @MatchWV3BioToS2BioResolution_OutputFcn, ...
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


% --- Executes just before MatchWV3BioToS2BioResolution is made visible.
function MatchWV3BioToS2BioResolution_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MatchWV3BioToS2BioResolution (see VARARGIN)

% Choose default command line output for MatchWV3BioToS2BioResolution
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MatchWV3BioToS2BioResolution wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MatchWV3BioToS2BioResolution_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtWV3InputFileFolder_Callback(hObject, eventdata, handles)
% hObject    handle to txtWV3InputFileFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtWV3InputFileFolder as text
%        str2double(get(hObject,'String')) returns contents of txtWV3InputFileFolder as a double


% --- Executes during object creation, after setting all properties.
function txtWV3InputFileFolder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtWV3InputFileFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBroseWV3InputFile.
function pbBroseWV3InputFile_Callback(hObject, eventdata, handles)
% hObject    handle to pbBroseWV3InputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {  '*.tif','Specify the WV3 Input Image File Folder (*.tif)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Select a WV3 Input Image File');
 if  filename > 0  
    set(handles.txtWV3InputFileFolder, 'String', pathname);
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


% --- Executes on button press in pbBroseOutputFileFolder.
function pbBroseOutputFileFolder_Callback(hObject, eventdata, handles)
% hObject    handle to pbBroseOutputFileFolder (see GCBO)
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

%% Start counting processing time
tic;

%% get the S2 reference or Granule XML image
s2_ref_file = get(handles.txtS2ReferenceFile, 'String');
[ref, xq, yq, info] = geoimread(s2_ref_file);
bbox = info.BoundingBox;
option.ModelPixelScaleTag = info.ModelPixelScaleTag; %info.PixelScale; %[10;10;0];
option.ModelTiepointTag = info.ModelTiepointTag; %[0;0;0;ulx;uly;0];
option.GTModelTypeGeoKey = 1;
option.GeoKeyDirectoryTag = info.GeoKeyDirectoryTag;

[rq,cq,bq]=size(ref);

if contains(s2_ref_file,'20m')
    out_res = 20;
elseif contains(s2_ref_file,'10m')
    out_res = 10;
else
    msgbox('The reference file looks no resolution number.');
    return;
end

%% get the wv3 input file folder
wv3_file_dir = get(handles.txtWV3InputFileFolder, 'String');

%% get the output folder
out_dir = get(handles.txtOutputFileFolder, 'String');
if exist(out_dir,'dir') ~= 7
    %% Create output folders
    mkdir(out_dir);             
end

calib_method = get(handles.popRegressionMethod, 'Value');
switch calib_method
    case 1 % Linear regression
        fnames = dir([wv3_file_dir '\*by_LinearR.tif']);
    case 2 % Lasso Regression
        fnames = dir([wv3_file_dir '\*by_LassoR.tif']);
    case 3 % Regression tree
        fnames = dir([wv3_file_dir '\*by_RTree.tif']);
end

match_method = get(handles.popMatchMethod, 'Value');

fnames = char(fnames(~[fnames.isdir]).name);

for k = 1:length(fnames(:,1))
    % read in geolocation info of the sample image
    fn = strtrim(fnames(k,:));
    [img, x, y, geo] = geoimread([wv3_file_dir fn]);
    img = double(img);
    [r,c,b] = size(img);   
    % initialize the output image
    outimg = zeros(rq,cq,b);
    
    switch match_method
        case 1  % by NNP
            % interpolation by nearest naighbor grid points 
            [X, Y] = meshgrid(x,y);
            [Xq, Yq] = meshgrid(xq,yq);   
            for i = 1:b        
                outimg(:,:,i) = interp2(X,Y,img(:,:,i),Xq,Yq,'nearest',0);
            end
            outstr = ['_' num2str(out_res) 'm_matched.tif'];
        case 2  % by block mean spatial filter
            in_res = 2; % assume that input image resolution is 2m
            % determine block size
            br = out_res/in_res;
            bc = out_res/in_res;
            % crop the same subset as S2 images
            %% important: WV3 image must cover entire S2 image area
            ic = x <= (max(bbox(:,1))+0.5*out_res) & x >= (min(bbox(:,1))-0.5*out_res);
            ir = y <= (max(bbox(:,2))+0.5*out_res) & y >= (min(bbox(:,2))-0.5*out_res);
            img = img(ir, ic, :);
            % downsample the image using block mean
            for i = 1:b        
                outimg(:,:,i) = blockmean(img(:,:,i), rq, cq, br, bc);
            end
            outstr = ['_' num2str(out_res) 'm_scaled.tif'];
    end
    % save the result with the reference geolocation info
    out_file = [out_dir '\' strrep(fn,'.tif',outstr)];
    geotiffwrite(out_file, bbox, outimg, 32, option);    
end

ttime = toc;
disp(['>>> Elapsed time: ', num2str(ttime),' seconds. <<<'])
disp('>>> Completed matching WV3 BIO to S2 BIO. <<<');


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



function txtS2ReferenceFile_Callback(hObject, eventdata, handles)
% hObject    handle to txtS2ReferenceFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtS2ReferenceFile as text
%        str2double(get(hObject,'String')) returns contents of txtS2ReferenceFile as a double


% --- Executes during object creation, after setting all properties.
function txtS2ReferenceFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtS2ReferenceFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseS2RefFile.
function pbBrowseS2RefFile_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseS2RefFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {  '*.tif','Specify a S2 image file as reference (*.tif)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify S2 reference file');
 if  filename > 0  
    set(handles.txtS2ReferenceFile, 'String', [pathname filename]);
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


% --- Executes on selection change in popRefBand.
function popRefBand_Callback(hObject, eventdata, handles)
% hObject    handle to popRefBand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popRefBand contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popRefBand


% --- Executes during object creation, after setting all properties.
function popRefBand_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popRefBand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popMatchBand.
function popMatchBand_Callback(hObject, eventdata, handles)
% hObject    handle to popMatchBand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popMatchBand contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popMatchBand


% --- Executes during object creation, after setting all properties.
function popMatchBand_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popMatchBand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popRefResolution.
function popRefResolution_Callback(hObject, eventdata, handles)
% hObject    handle to popRefResolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popRefResolution contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popRefResolution


% --- Executes during object creation, after setting all properties.
function popRefResolution_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popRefResolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popMatchMethod.
function popMatchMethod_Callback(hObject, eventdata, handles)
% hObject    handle to popMatchMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popMatchMethod contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popMatchMethod


% --- Executes during object creation, after setting all properties.
function popMatchMethod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popMatchMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
