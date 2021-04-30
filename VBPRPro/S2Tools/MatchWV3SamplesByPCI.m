function varargout = MatchWV3SamplesByPCI(varargin)
% MATCHWV3SAMPLESBYPCI MATLAB code for MatchWV3SamplesByPCI.fig
%      MATCHWV3SAMPLESBYPCI, by itself, creates a new MATCHWV3SAMPLESBYPCI or raises the existing
%      singleton*.
%
%      H = MATCHWV3SAMPLESBYPCI returns the handle to a new MATCHWV3SAMPLESBYPCI or the handle to
%      the existing singleton*.
%
%      MATCHWV3SAMPLESBYPCI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MATCHWV3SAMPLESBYPCI.M with the given input arguments.
%
%      MATCHWV3SAMPLESBYPCI('Property','Value',...) creates a new MATCHWV3SAMPLESBYPCI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MatchWV3SamplesByPCI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MatchWV3SamplesByPCI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MatchWV3SamplesByPCI

% Last Modified by GUIDE v2.5 05-Feb-2021 22:58:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MatchWV3SamplesByPCI_OpeningFcn, ...
                   'gui_OutputFcn',  @MatchWV3SamplesByPCI_OutputFcn, ...
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


% --- Executes just before MatchWV3SamplesByPCI is made visible.
function MatchWV3SamplesByPCI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MatchWV3SamplesByPCI (see VARARGIN)

% Choose default command line output for MatchWV3SamplesByPCI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MatchWV3SamplesByPCI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MatchWV3SamplesByPCI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtWV3InputFile_Callback(hObject, eventdata, handles)
% hObject    handle to txtWV3InputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtWV3InputFile as text
%        str2double(get(hObject,'String')) returns contents of txtWV3InputFile as a double


% --- Executes during object creation, after setting all properties.
function txtWV3InputFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtWV3InputFile (see GCBO)
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
    {  '*.tif','Specify the WV3 Input Image File (*.tif)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify the WV3 Input Image File');
 if  filename > 0  
    set(handles.txtWV3InputFile, 'String', [pathname filename]);
    s2_ref_file = get(handles.txtS2ReferenceFile, 'String');
    %if get(handles.popRefResolution,'Value') == 1
    if contains(s2_ref_file,'10m')
        out_file = strrep(filename, '.tif', '_10m_matched.tif');
    elseif contains(s2_ref_file,'20m')
        out_file = strrep(filename, '.tif', '_20m_matched.tif');
    else
        msgbox('Resolution issue with the reference file name');
        return;
    end
    set(handles.txtOutputFile, 'String', [pathname out_file]);
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


% --- Executes on button press in pbBroseOutputFile.
function pbBroseOutputFile_Callback(hObject, eventdata, handles)
% hObject    handle to pbBroseOutputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {  '*.*','Specify a Output File (*.*)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify a Output File');
 if  filename > 0  
    set(handles.txtOutputFile, 'String', [pathname filename]);
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
s2_ref_file = get(handles.txtS2ReferenceFile, 'String');
if contains(s2_ref_file,'10m')
    res = 10;
elseif contains(s2_ref_file,'20m')
    res = 20;
else
    msgbox('No resolution number found from the reference file name, stopped');
    return;
end

%% get the subarea reference image file
wv3_file = get(handles.txtWV3InputFile, 'String');

% read in geolocation info of the reference image
[ref, xq, yq, info] = geoimread(s2_ref_file);
[rq,cq,bq]=size(ref);

%% get the output folder
out_file = get(handles.txtOutputFile, 'String');
    
if get(handles.popMatchMethod, 'Value') == 1
    % by nearest naighbor grid points

    % read in geolocation info of the sample image
    [img, x, y, geo] = geoimread(wv3_file);
    img = double(img);
    [r,c,b] = size(img);
    % initialize the output image
    outimg = zeros(rq,cq,b);
    % interpolation by nearest naighbor grid points
    %x = x(1:end)+1; y = y(1:end)-1; 
    [X, Y] = meshgrid(x,y);
    %xq = xq(1:end)+0.5*res; yq = yq(1:end)-0.5*res;
    [Xq, Yq] = meshgrid(xq,yq);
    for i=1:b        
        outimg(:,:,i) = interp2(X,Y,img(:,:,i),Xq,Yq,'nearest',0);
    end
else
    % by moving window average filter
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
end

% save the result with the reference geolocation info
bbox = info.BoundingBox;
option.ModelPixelScaleTag = info.ModelPixelScaleTag; %info.PixelScale; %[10;10;0];
option.ModelTiepointTag = info.ModelTiepointTag; %[0;0;0;ulx;uly;0];
option.GTModelTypeGeoKey = 1;
option.GeoKeyDirectoryTag = info.GeoKeyDirectoryTag;
%geotiffwrite(out_file, bbox, outimg, 16, option); 
geotiffwrite(out_file, bbox, outimg, 32, option);
    
ttime = toc;
disp(['>>> Elapsed time: ', num2str(ttime),' seconds. <<<'])
disp('>>> Matching WV3 to S2 image is done. <<<');


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
