function varargout = WV3_Calibration_Regression_Batch(varargin)
% WV3_CALIBRATION_REGRESSION_BATCH MATLAB code for WV3_Calibration_Regression_Batch.fig
%      WV3_CALIBRATION_REGRESSION_BATCH, by itself, creates a new WV3_CALIBRATION_REGRESSION_BATCH or raises the existing
%      singleton*.
%
%      H = WV3_CALIBRATION_REGRESSION_BATCH returns the handle to a new WV3_CALIBRATION_REGRESSION_BATCH or the handle to
%      the existing singleton*.
%
%      WV3_CALIBRATION_REGRESSION_BATCH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WV3_CALIBRATION_REGRESSION_BATCH.M with the given input arguments.
%
%      WV3_CALIBRATION_REGRESSION_BATCH('Property','Value',...) creates a new WV3_CALIBRATION_REGRESSION_BATCH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before WV3_Calibration_Regression_Batch_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to WV3_Calibration_Regression_Batch_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help WV3_Calibration_Regression_Batch

% Last Modified by GUIDE v2.5 08-Apr-2021 23:07:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @WV3_Calibration_Regression_Batch_OpeningFcn, ...
                   'gui_OutputFcn',  @WV3_Calibration_Regression_Batch_OutputFcn, ...
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


% --- Executes just before WV3_Calibration_Regression_Batch is made visible.
function WV3_Calibration_Regression_Batch_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to WV3_Calibration_Regression_Batch (see VARARGIN)

% Choose default command line output for WV3_Calibration_Regression_Batch
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes WV3_Calibration_Regression_Batch wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = WV3_Calibration_Regression_Batch_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtS2SL2PBioVariableDataFolder_Callback(hObject, eventdata, ~)
% hObject    handle to txtS2SL2PBioVariableDataFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtS2SL2PBioVariableDataFolder as text
%        str2double(get(hObject,'String')) returns contents of txtS2SL2PBioVariableDataFolder as a double


% --- Executes during object creation, after setting all properties.
function txtS2SL2PBioVariableDataFolder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtS2SL2PBioVariableDataFolder (see GCBO)
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
    {  '*20m*.tif','Specify SL2p Bio Variable Data Folder (*20m*.tif)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify SL2p Bio Variable Data Folder');
 if  filename > 0  
    set(handles.txtS2SL2PBioVariableDataFolder, 'String', pathname);
    % set(handles.txtS2SL2PBioVariableDataFolder, 'String', [pathname filename]);
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


% --- Executes on button press in pbBrowseOutputFileFolder.
function pbBrowseOutputFileFolder_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseOutputFileFolder (see GCBO)
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

global stop_processing;
stop_processing = 0;

set(0,'DefaultTextInterpreter','none');
set(gcf, 'InvertHardCopy', 'off');

tic

%% get S2 BIO data folders
s2_sl2p_dir = get(handles.txtS2SL2PBioVariableDataFolder,'String');

%% match WV3 2m samples to S2 20m resolution
%% get one of the s2 BIO variable files as reference image for geoinformation
fnames = dir([s2_sl2p_dir '\SUB*LAI.tif']);
s2_ref_file = [s2_sl2p_dir '\' fnames(~[fnames.isdir]).name];
%% read in geolocation info of the reference image
[ref, xq, yq, info] = geoimread(s2_ref_file);
bbox = info.BoundingBox;
option.ModelPixelScaleTag = info.ModelPixelScaleTag; %info.PixelScale; %[10;10;0];
option.ModelTiepointTag = info.ModelTiepointTag; %[0;0;0;ulx;uly;0];
option.GTModelTypeGeoKey = 1;
option.GeoKeyDirectoryTag = info.GeoKeyDirectoryTag;

[rq,cq,bq]=size(ref);

if contains(s2_ref_file,'10m')
    out_res = 10;
elseif contains(s2_ref_file,'20m')
    out_res = 20;
else
    msgbox('No resolution number found from the reference file name, stopped');
    return;
end

%% get wv3 input image file and read in the data
wv3_file = get(handles.txtWV3InputFile, 'String');
[img, x, y, geo] = geoimread(wv3_file);
img = double(img);
[r,c,b] = size(img);    

%% apply 20m spatial filter
h = fspecial('average',10);
sf_img = imfilter(img, h, 'replicate', 'same');
    
%% reset the original invalid pixels to value 0
for i = 1:b
    band = sf_img(:,:,i);
    invalid = img(:,:,i) <= 0 | isnan(img(:,:,i));
    band(invalid) = 0;
    sf_img(:,:,i) = band;
end  

%% save the filtered image with the reference geolocation info
sf_out_file = strrep(wv3_file,'.tif',['_' num2str(out_res) 'MPSF.tif']);
wv3_bbox = geo.BoundingBox;
geo.GTModelTypeGeoKey = 1;
geotiffwrite(sf_out_file, wv3_bbox, sf_img, 32, geo);
    
%% resample the filtered image data to 20m resolution
% initialize the output image
outimg = zeros(rq,cq,b);
% interpolation by nearest naighbor grid points
[X, Y] = meshgrid(x,y);
[Xq, Yq] = meshgrid(xq,yq);
for i=1:b        
    outimg(:,:,i) = interp2(X,Y,sf_img(:,:,i),Xq,Yq,'nearest',0);
end
wv3_calib_sample_file = strrep(sf_out_file,'.tif',['_' num2str(out_res) 'MNNP.tif']);
% save the result with the reference geolocation info
geotiffwrite(wv3_calib_sample_file, bbox, outimg, 32, option);

%% perform calibration regression
% Get the output folder
out_dir = get(handles.txtOutputFolder,'String');
if exist(out_dir,'dir') ~= 7
    % Create output folders
    mkdir(out_dir);             
end
% read in the sample data
img = geoimread(wv3_calib_sample_file);
% detect non-vegetated pixels using NDVI
img = double(img);
ndvi = ComputeNDVI(img, 8, 5, 10000); % NIR band 8, Red band 5
non_veg = ndvi <= 0;
% detect invalid and cloudy pixels (assume that cloudy pixels were already set to value 0)
invalid = isnan(img(:,:,3)) | img(:,:,3) <= 0;
% combine the non_veg and invalid pixels
non_veg = (non_veg + invalid)>0;

% format input bada for regression and set non-veg and cloudy pixels to value 0
[r, c, b] = size(img);
Xo = zeros(r*c,b);
for i=1:b
    band = img(:,:,i);
    % set non-veg pixels to value 0
    band(non_veg) = 0;
    Xo(:,i) = band(:);
end

%% conduct regression in a loop to calibrate individual variable
h = waitbar(0,'Calibrating regression ...');
ip = 0;
plot2comp = 1;
for bb={'LAI','FCOVER','FAPAR','LAI_Cab','LAI_Cw'}
    ip = ip+1;
    fnames = dir([s2_sl2p_dir '\SUB*' char(bb) '.tif']);
    s2_sl2p_file = fnames(~[fnames.isdir]).name;
    %% read in the response data
    var = geoimread([s2_sl2p_dir s2_sl2p_file]);
    y = var(:);
    
    %% QC to exclude invalid and flgged pixels
    fnames = dir([s2_sl2p_dir '\SUB*' char(bb) '_Flags.tif']);
    flag_file = fnames(~[fnames.isdir]).name;
    
    %% read in the flags and flag out the invalid pixels
    % invalid pixels in S2 BIO variables 
    flags = geoimread([s2_sl2p_dir flag_file]);
    idy = y<=0 | flags(:)>0;
    % invalid pixels in WV3 samples  
    idx = Xo(:,3)<=0; % use the third band data of WV3 to identify invalid pixels 
    % invalid pixels in both S2 BIO and WV3 samples 
    inval = (idx + idy)>0;
    % valid pixels idices
    valid_idx = find(inval == 0);
    % remove the invalid pixels from the sample data
    y(inval) = [];
    X = Xo; X(inval,:) = [];
    
    %% Apply Regression Tree
    mdl.method = 'RTree';
    % Train a regression tree using the default values for tree-depth control. 
    % Cross-validate the model using 10-fold cross-validation.
    % mdl.RTree = fitrtree(X,y,'CrossVal','on'); % don't not work 

    mdl.RTree = fitrtree(X,y);
    % mdl.RTree= crossval(mdl.RTree); % don't work because of memory issue
    yhat = predict(mdl.RTree, X);            
    %% perform one time outlier detection and removal
    [r2, rmse] = rsquare(double(y),double(yhat));
    d = y - yhat;
    outlier = abs(d)>2.5*rmse;
    if ~isempty(outlier)
        y(outlier) = [];
        X(outlier,:) = [];
        outlier_idx = valid_idx(outlier); % determine the indices of the outliers in the orignal input WV3 data
        inval(outlier_idx) = 1; % merge the outlier idices with the original invalid pixels  
    end
    mdl.RTree = fitrtree(X,y);
    yhat = predict(mdl.RTree, X);     

    %% reshape the invalid pixels as a mask for output
    mask = reshape(inval, r, c);

    out_file = [out_dir '\' char(bb) '_RTree.mat'];
    mask_file = [out_dir '\' char(bb) '_Mask_RTree.mat'];
    fig_file = [out_dir '\' char(bb) '_Calibration_RTree.fig'];
    png_file = strrep(fig_file, '.fig', '.png');            

    %% Compare the predicted values to the actual responses using a reference line.
    if plot2comp > 0
        [r2, rmse] = rsquare(double(y),double(yhat));
        h1 = figure;
        set(h1,'Position',[100 100 1800 500]);
        subplot(1,3,1);
        ax_min = double(min(min(y),min(yhat)));
        ax_max = double(max(max(y), max(yhat)));
        dscatter(y,yhat);
        hold on;
        x1 = [ax_min ax_max];
        y1 = [ax_min ax_max];
        line(x1,y1,'Color','r','LineWidth',1);
        x2 = [ax_min ax_max];
        y2 = [ax_max ax_max];
        line(x2,y2,'Color','k');%,'LineWidth',1);
        x3 = [ax_max ax_max];
        y3 = [ax_min ax_max];
        line(x3,y3,'Color','k');%,'LineWidth',1);

        xlim([ax_min ax_max]);
        ylim([ax_min ax_max]); 

        xlabel(['Actual ' char(bb)]);
        ylabel(['Predicted ' char(bb)]);

        TXT_1=['RMSE  = ';'R2    = '];
        TXT_2=strjust(num2str([rmse;r2],'%.3f'),'right');
        str = [TXT_1,TXT_2];
        %text(0.05*(ax_max-ax_min),0.925*(ax_max-ax_min),str,'FontName', 'Courier','FontSize',12,'FontWeight','bold','EdgeColor',[1 1 1],'BackgroundColor',[1 1 1],'Color',[0 0 0]);
        text(0.3*(ax_max-ax_min),0.8*(ax_max-ax_min),str,'FontName', 'Courier','FontSize',12,'FontWeight','bold','EdgeColor',[1 1 1],'BackgroundColor',[1 1 1],'Color',[0 0 0]);
       
        %% plot residues
        subplot(1,3,[2,3]);
        d = y-yhat;  mae = mean(abs(d)); %maxd = max(d); mind = min(d);
        plot(d)
        xlabel('Pixel Numbers');
        ylabel([char(bb) ' Residuals']);

        TXT_1=['RMSE  = ';'MAE   = '];
        TXT_2=strjust(num2str([rmse;mae],'%.4f'),'right');   
        text(0,0,[TXT_1,TXT_2],'FontName', 'Courier','FontSize',12,'FontWeight','bold','EdgeColor',[1 1 1],'BackgroundColor',[1 1 1],'Color',[0 0 0]);

        savefig(fig_file);
        saveas(gcf,png_file)

    end
            
    %% save the trained model result and the mask 
    save(out_file,'mdl');
    save(mask_file,'mask');
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
disp(['>>> Elapsed time: ', num2str(ttime),' seconds. <<<'])
disp('>>> Completed calibration regression. <<<');

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



function txtWV3CalibrationImageFile_Callback(~, eventdata, handles)
% hObject    handle to txtWV3CalibrationImageFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtWV3CalibrationImageFile as text
%        str2double(get(hObject,'String')) returns contents of txtWV3CalibrationImageFile as a double


% --- Executes during object creation, after setting all properties.
function txtWV3CalibrationImageFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtWV3CalibrationImageFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseWv3CalibrationImageFile.
function pbBrowseWv3CalibrationImageFile_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseWv3CalibrationImageFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
[filename, pathname] = uigetfile( ...
    {  '*20m*.tif','Specify the WV3 calibration sample image file (*.tif)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Specify the WV3 calibration sample image file');
 if  filename > 0  
    set(handles.txtWV3CalibrationImageFile, 'String', [pathname filename]);
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
 end 
 cd(cur_dir);


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
