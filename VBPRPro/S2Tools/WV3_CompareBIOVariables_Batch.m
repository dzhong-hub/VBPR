function varargout = WV3_CompareBIOVariables_Batch(varargin)
% WV3_COMPAREBIOVARIABLES_BATCH MATLAB code for WV3_CompareBIOVariables_Batch.fig
%      WV3_COMPAREBIOVARIABLES_BATCH, by itself, creates a new WV3_COMPAREBIOVARIABLES_BATCH or raises the existing
%      singleton*.
%
%      H = WV3_COMPAREBIOVARIABLES_BATCH returns the handle to a new WV3_COMPAREBIOVARIABLES_BATCH or the handle to
%      the existing singleton*.
%
%      WV3_COMPAREBIOVARIABLES_BATCH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WV3_COMPAREBIOVARIABLES_BATCH.M with the given input arguments.
%
%      WV3_COMPAREBIOVARIABLES_BATCH('Property','Value',...) creates a new WV3_COMPAREBIOVARIABLES_BATCH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before WV3_CompareBIOVariables_Batch_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to WV3_CompareBIOVariables_Batch_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help WV3_CompareBIOVariables_Batch

% Last Modified by GUIDE v2.5 26-Apr-2021 20:12:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @WV3_CompareBIOVariables_Batch_OpeningFcn, ...
                   'gui_OutputFcn',  @WV3_CompareBIOVariables_Batch_OutputFcn, ...
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


% --- Executes just before WV3_CompareBIOVariables_Batch is made visible.
function WV3_CompareBIOVariables_Batch_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to WV3_CompareBIOVariables_Batch (see VARARGIN)

% Choose default command line output for WV3_CompareBIOVariables_Batch
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes WV3_CompareBIOVariables_Batch wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = WV3_CompareBIOVariables_Batch_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtS2BioRootFolder_Callback(hObject, eventdata, ~)
% hObject    handle to txtS2BioRootFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtS2BioRootFolder as text
%        str2double(get(hObject,'String')) returns contents of txtS2BioRootFolder as a double


% --- Executes during object creation, after setting all properties.
function txtS2BioRootFolder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtS2BioRootFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseS2BioRootFolder.
function pbBrowseS2BioRootFolder_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseS2BioRootFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
pathname = uigetdir();
 if  pathname > 0  
    set(handles.txtS2BioRootFolder, 'String', pathname);
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

tic

plotscatter = get(handles.chkPlotScatterplots,'Value');
copyfiles = get(handles.chkCopyFiles,'Value');

site_root_dir = get(handles.txtTestSiteRootFolder,'String');

if isempty(site_root_dir)
    %% get S2 reference image file
    s2_ref_file = get(handles.txtS2RefImageFile,'String');

    %% get S2 BIO data root folder
    s2_bio_root = get(handles.txtS2BioRootFolder,'String');

    %% get wv3 BIO reference file folder
    wv3_bio_dir = get(handles.txtWV3BioFileFolder, 'String');

    %% Get the output folder
    out_dir = get(handles.txtOutputFolder,'String');
else
    %% get S2 reference image file
    fnames = dir([site_root_dir '\Green\SUB_REF*10m.tif']);
    s2_ref_file = [site_root_dir '\Green\' fnames(~[fnames.isdir]).name];

    %% get S2 BIO data root folder
    s2_bio_root = [site_root_dir '\S2'];

    %% get wv3 BIO reference file folder
    wv3_bio_dir = [site_root_dir '\BIO_10m'];

    %% Get the output folder
    out_dir = [site_root_dir '\BIO_Comp'];    
end

if exist(out_dir,'dir') ~= 7
    mkdir(out_dir);             
end

if copyfiles == 1
    lai_out_dir = [site_root_dir '\LAI_Comp'];
    fcover_out_dir = [site_root_dir '\FCOVER_Comp'];
    fapar_out_dir = [site_root_dir '\FAPAR_Comp'];
    if exist(lai_out_dir,'dir') ~= 7
        mkdir(lai_out_dir);             
    end
    if exist(fcover_out_dir,'dir') ~= 7
        mkdir(fcover_out_dir);             
    end
    if exist(fapar_out_dir,'dir') ~= 7
        mkdir(fapar_out_dir);             
    end
end

%% compare BIOs in a loop to calculate quality statistics
h = waitbar(0,'Comparing BIOs ...');
ip = 0; 
bias = zeros(6,5); rmse = zeros(6,5); mae = zeros(6,5); r2 = zeros(6,5); ns = zeros(6,5);
ssiv = zeros(6,5); psnr = zeros(6,5); uqi = zeros(6,5); r  = zeros(6,5);
for dm={'R1-20','R2-10','D1-10','D2-10','D3-10','D4-10'}
    ip = ip+1;
    input_dir = [s2_bio_root '\' char(dm) '\VBPR_SL2P'];
    iq = 0;
    for bb={'LAI','FCOVER','FAPAR','LAI_Cab','LAI_Cw'}
        iq = iq+1;
        % resample the 20m resolution bio to 10m resolution 
        if strcmp(char(dm), 'R1-20')
            % get S2 BIO data file
            fnames = dir([input_dir '\SUB*20m*' char(bb) '.tif']);
            s2_bio_file = [input_dir '\' fnames(~[fnames.isdir]).name];
            % get S2 BIO flags file
            s2_flag_file = strrep(s2_bio_file, '.tif', '_Flags.tif');
            % read in data
            img_20m = geoimread(s2_bio_file);
            flag_20m = geoimread(s2_flag_file);
            % resample data using imresize function
            img_10m = imresize(img_20m,2,'nearest');
            flag_10m = imresize(flag_20m,2,'nearest');
            % replace the file name
            s2_bio_file = strrep(s2_bio_file,'_20m', '_10m');
            s2_flag_file = strrep(s2_flag_file,'_20m', '_10m');
            % save the resampled data
            % read in geolocation info of the reference image
            [ref, x, y, info] = geoimread(s2_ref_file);
            bbox = info.BoundingBox;
            option.ModelPixelScaleTag = info.ModelPixelScaleTag; 
            option.ModelTiepointTag = info.ModelTiepointTag; 
            option.GTModelTypeGeoKey = 1;
            option.GeoKeyDirectoryTag = info.GeoKeyDirectoryTag;
            geotiffwrite(s2_bio_file, bbox, img_10m, 32, option);
            geotiffwrite(s2_flag_file, bbox, flag_10m, 8, option);
            clear ref x y info;
        else
            % get S2 BIO data file
            fnames = dir([input_dir '\SUB*' char(bb) '.tif']);
            s2_bio_file = [input_dir '\' fnames(~[fnames.isdir]).name];
        end
        
        % get WV3 BIO data file
        fnames = dir([wv3_bio_dir '\*' char(bb) '_by_RTree.tif']);
        wv3_bio_file = [wv3_bio_dir '\' fnames(~[fnames.isdir]).name];
        % calculate quality indicators
        QI = CompareBIO(wv3_bio_file, s2_bio_file, out_dir, char(dm), plotscatter);
        % put QI to array 
        bias(ip,iq) = QI.bias;
        rmse(ip,iq) = QI.rmse;
        mae(ip,iq)  = QI.mae;
        ssiv(ip,iq) = QI.ssim;
        psnr(ip,iq) = QI.psnr;
        uqi(ip,iq)  = QI.uqi;
        r2(ip,iq)   = QI.r2;
        r(ip,iq)    = QI.r;
        ns(ip,iq)   = QI.valp;
        % % save the SSIM map for spatial pattern comparison
        % s2_ssim_file = strrep(s2_bio_file,'.tif', '_vs_WV3_SSIM.tif');
        % imwrite(QI.ssimmap,s2_ssim_file);
        if copyfiles == 1
            [path, wv3_fname, ext] = fileparts(wv3_bio_file);
            [path, s2_fname, ext] = fileparts(s2_bio_file);
            wv3_flag_file = strrep(wv3_bio_file, '.tif', '_Flags.tif');
            s2_flag_file = strrep(s2_bio_file, '.tif', '_Flags.tif');
            if strcmp(char(dm), 'R1-20')
                method = 'R1-10';
            else
                method = char(dm);
            end
        end
        if strcmp(char(bb), 'LAI') && copyfiles == 1
            wv3_copy_file = [lai_out_dir '\' wv3_fname '.tif'];
            wv3_copy_flag_file = strrep(wv3_copy_file, '.tif', '_Flags.tif');
            s2_copy_file = [lai_out_dir '\' method '_' s2_fname '.tif']; 
            s2_copy_flag_file = strrep(s2_copy_file, '.tif', '_Flags.tif');          
        end
        if strcmp(char(bb), 'FCOVER') && copyfiles == 1            
            wv3_copy_file = [fcover_out_dir '\' wv3_fname '.tif'];
            wv3_copy_flag_file = strrep(wv3_copy_file, '.tif', '_Flags.tif');
            s2_copy_file = [fcover_out_dir '\' method '_' s2_fname '.tif']; 
            s2_copy_flag_file = strrep(s2_copy_file, '.tif', '_Flags.tif');           
        end
        if strcmp(char(bb), 'FAPAR') && copyfiles == 1            
            wv3_copy_file = [fapar_out_dir '\' wv3_fname '.tif'];
            wv3_copy_flag_file = strrep(wv3_copy_file, '.tif', '_Flags.tif');
            s2_copy_file = [fapar_out_dir '\' method '_' s2_fname '.tif']; 
            s2_copy_flag_file = strrep(s2_copy_file, '.tif', '_Flags.tif');           
        end
        if copyfiles == 1
            if ~exist(wv3_copy_file,'file')
                copyfile(wv3_bio_file,wv3_copy_file, 'f');
            end
            if ~exist(wv3_copy_flag_file,'file')
                copyfile(wv3_flag_file,wv3_copy_flag_file, 'f');
            end
            if ~exist(s2_copy_file,'file')
                copyfile(s2_bio_file,s2_copy_file, 'f');
            end
            if ~exist(s2_copy_flag_file,'file')
                copyfile(s2_flag_file,s2_copy_flag_file, 'f');
            end
        end
    end
    waitbar(ip/6)
end
%% add calibration statistic results for a comparison
ip = ip+1;
iq = 0;
input_dir = [s2_bio_root '\R1-20\VBPR_SL2P'];
wv3_bio_dir = strrep(wv3_bio_dir,'10m', '20m');
for bb={'LAI','FCOVER','FAPAR','LAI_Cab','LAI_Cw'}
    iq = iq+1;
    % get S2 BIO 20m data file    
    fnames = dir([input_dir '\SUB*20m*' char(bb) '.tif']);
    s2_bio_file = [input_dir '\' fnames(~[fnames.isdir]).name];
    % get WV3 BIO 20m data file    
    fnames = dir([wv3_bio_dir '\*' char(bb) '_by_RTree.tif']);
    wv3_bio_file = [wv3_bio_dir '\' fnames(~[fnames.isdir]).name];
    % calculate QI
    QI = CompareBIO(wv3_bio_file, s2_bio_file, out_dir, 'CALIB', plotscatter);
    % put QI to array
    bias(ip,iq) = QI.bias;
    rmse(ip,iq) = QI.rmse;
    mae(ip,iq)  = QI.mae;
    ssiv(ip,iq) = QI.ssim;
    psnr(ip,iq) = QI.psnr;
    uqi(ip,iq)  = QI.uqi;
    r2(ip,iq)   = QI.r2;
    r(ip,iq)    = QI.r;
    ns(ip,iq)   = QI.valp;
    % % save the SSIM map for spatial pattern comparison
    % s2_ssim_file = strrep(s2_bio_file,'.tif', '_vs_WV3_SSIM.tif');
    % imwrite(QI.ssimmap,s2_ssim_file);
    
    %% copy same type of BIO files to one folder for spatial pattern comparison
    if copyfiles == 1
        [path, wv3_fname, ext] = fileparts(wv3_bio_file);
        [path, s2_fname, ext] = fileparts(s2_bio_file);
        wv3_flag_file = strrep(wv3_bio_file, '.tif', '_Flags.tif');
        s2_flag_file = strrep(s2_bio_file, '.tif', '_Flags.tif');
    end
    if strcmp(char(bb), 'LAI') && copyfiles == 1
        wv3_copy_file = [lai_out_dir '\' wv3_fname '.tif'];
        wv3_copy_flag_file = strrep(wv3_copy_file, '.tif', '_Flags.tif');
        s2_copy_file = [lai_out_dir '\R1-20_' s2_fname '.tif']; 
        s2_copy_flag_file = strrep(s2_copy_file, '.tif', '_Flags.tif');          
    end
    if strcmp(char(bb), 'FCOVER') && copyfiles == 1            
        wv3_copy_file = [fcover_out_dir '\' wv3_fname '.tif'];
        wv3_copy_flag_file = strrep(wv3_copy_file, '.tif', '_Flags.tif');
        s2_copy_file = [fcover_out_dir '\R1-20_' s2_fname '.tif']; 
        s2_copy_flag_file = strrep(s2_copy_file, '.tif', '_Flags.tif');           
    end
    if strcmp(char(bb), 'FAPAR') && copyfiles == 1            
        wv3_copy_file = [fapar_out_dir '\' wv3_fname '.tif'];
        wv3_copy_flag_file = strrep(wv3_copy_file, '.tif', '_Flags.tif');
        s2_copy_file = [fapar_out_dir '\R1-20_' s2_fname '.tif']; 
        s2_copy_flag_file = strrep(s2_copy_file, '.tif', '_Flags.tif');           
    end
    if copyfiles == 1
        if ~exist(wv3_copy_file,'file')
            copyfile(wv3_bio_file,wv3_copy_file, 'f');
        end
        if ~exist(wv3_copy_flag_file,'file')
            copyfile(wv3_flag_file,wv3_copy_flag_file, 'f');
        end
        if ~exist(s2_copy_file,'file')
            copyfile(s2_bio_file,s2_copy_file, 'f');
        end
        if ~exist(s2_copy_flag_file,'file')
            copyfile(s2_flag_file,s2_copy_flag_file, 'f');
        end
    end
end
%% save the comparison statistic results
fid = fopen([out_dir '\CompareResult.txt'],'wt');
fprintf(fid,'%s\n', '                          LAI                                                                            FCOVER                                                                         FAPAR                                                                          LAI_Cab                                                                        LAI_Cw');
fprintf(fid,'%s\n', '   Method         N       BIAS      RMSE       MAE       R2        R        SSIM      PSNR      UQI      BIAS      RMSE       MAE       R2        r        SSIM      PSNR      UQI      BIAS      RMSE       MAE       R2        r        SSIM      PSNR      UQI      BIAS      RMSE       MAE       R2        r        SSIM      PSNR      UQI      BIAS      RMSE       MAE       R2        r        SSIM      PSNR      UQI');
ip = 0;
for dm={'R1-10','R2-10','D1-10','D2-10','D3-10','D4-10', 'CALIB'}
    ip = ip+1;
    fprintf(fid,'%9s %12d',char(dm),mean(ns(ip,:)));
    iq = 0;
    for bb={'LAI','FCOVER','FAPAR','LAI_Cab','LAI_Cw'}
        iq = iq+1;
        fprintf(fid,'%9.4f %9.4f %9.4f %9.4f %9.4f %9.4f %9.4f %9.4f',[bias(ip,iq), rmse(ip,iq), mae(ip,iq), r2(ip,iq), r(ip,iq), ssiv(ip,iq), psnr(ip,iq), uqi(ip,iq)]);
    end
    fprintf(fid,'\n');
end 

% %% output the average
% fprintf(fid,'%8s','Average');
% for iq = 1:5
%     fprintf(fid,'%8.2f %8.2f %8.2f',mean(rmse(:,iq)), mean(mae(:,iq)), mean(r2(:,iq)));
% end
% fprintf(fid,'\n');

fclose(fid);

close(h);

ttime = toc;
disp(['>>> Elapsed time: ', num2str(ttime),' seconds. <<<'])
disp('>>> BIO comparison is done. <<<');

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



function txtWV3BioFileFolder_Callback(hObject, ~, handles)
% hObject    handle to txtWV3BioFileFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtWV3BioFileFolder as text
%        str2double(get(hObject,'String')) returns contents of txtWV3BioFileFolder as a double


% --- Executes during object creation, after setting all properties.
function txtWV3BioFileFolder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtWV3BioFileFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBroseWV3BioFileFolder.
function pbBroseWV3BioFileFolder_Callback(hObject, eventdata, handles)
% hObject    handle to pbBroseWV3BioFileFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
pathname = uigetdir;
 if  pathname > 0  
    set(handles.txtWV3BioFileFolder, 'String', pathname);
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


% --- Executes on button press in chkPlotScatterplots.
function chkPlotScatterplots_Callback(hObject, eventdata, handles)
% hObject    handle to chkPlotScatterplots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkPlotScatterplots



function txtTestSiteRootFolder_Callback(hObject, eventdata, handles)
% hObject    handle to txtTestSiteRootFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtTestSiteRootFolder as text
%        str2double(get(hObject,'String')) returns contents of txtTestSiteRootFolder as a double


% --- Executes during object creation, after setting all properties.
function txtTestSiteRootFolder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtTestSiteRootFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBroeseTestSiteRootFolder.
function pbBroeseTestSiteRootFolder_Callback(hObject, eventdata, handles)
% hObject    handle to pbBroeseTestSiteRootFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


cur_dir = cd;
pathname = uigetdir;
 if  pathname > 0  
    set(handles.txtTestSiteRootFolder, 'String', pathname);
 end 
 cd(cur_dir);


% --- Executes on button press in chkCopyFiles.
function chkCopyFiles_Callback(hObject, eventdata, handles)
% hObject    handle to chkCopyFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkCopyFiles
