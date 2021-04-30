function varargout = SUB_VBPR_By_SL2P_BATCH(varargin)
% SUB_VBPR_BY_SL2P_BATCH MATLAB code for SUB_VBPR_By_SL2P_BATCH.fig
%      SUB_VBPR_BY_SL2P_BATCH, by itself, creates a new SUB_VBPR_BY_SL2P_BATCH or raises the existing
%      singleton*.
%
%      H = SUB_VBPR_BY_SL2P_BATCH returns the handle to a new SUB_VBPR_BY_SL2P_BATCH or the handle to
%      the existing singleton*.
%
%      SUB_VBPR_BY_SL2P_BATCH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUB_VBPR_BY_SL2P_BATCH.M with the given input arguments.
%
%      SUB_VBPR_BY_SL2P_BATCH('Property','Value',...) creates a new SUB_VBPR_BY_SL2P_BATCH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SUB_VBPR_By_SL2P_BATCH_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SUB_VBPR_By_SL2P_BATCH_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SUB_VBPR_By_SL2P_BATCH

% Last Modified by GUIDE v2.5 08-Apr-2021 11:06:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SUB_VBPR_By_SL2P_BATCH_OpeningFcn, ...
                   'gui_OutputFcn',  @SUB_VBPR_By_SL2P_BATCH_OutputFcn, ...
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


% --- Executes just before SUB_VBPR_By_SL2P_BATCH is made visible.
function SUB_VBPR_By_SL2P_BATCH_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SUB_VBPR_By_SL2P_BATCH (see VARARGIN)

% Choose default command line output for SUB_VBPR_By_SL2P_BATCH
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SUB_VBPR_By_SL2P_BATCH wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SUB_VBPR_By_SL2P_BATCH_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

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

%% get root path to input image data
root_dir = get(handles.txtImgDataFilePath,'String');

%% Open a log file to record computation progresses
logfile1 = [root_dir '\SubSL2PProcess.log'];
if exist(logfile1,'file')
    delete logfile1;
end
fid1 = fopen(logfile1,'wt');
logmsg(fid1,handles,'VBPR by SL2P processing started.');

%% estimate BIO from different donscaled datasets in a loop
for dm ={'R1-20','D1-10','D2-10','D3-10','D4-10','R2-10'}
    % determine input and output folder
    img_dir = [root_dir '\S2\' char(dm)];
    ang_dir = img_dir;
    out_dir = [img_dir '\VBPR_SL2P\'];
    if exist(out_dir,'dir') ~= 7
        % Create output folders
        mkdir(out_dir);             
    end
    logmsg(fid1,handles,['Processing data input path: ' img_dir]);
    logmsg(fid1,handles,['The view angle data path: ' ang_dir]);
    logmsg(fid1,handles,['The output path: ' out_dir]);
    
    % get the reference file name
    file_name=dir([root_dir,'\Green\SUB_REF*_10m.tif']);
    sub_ref_file = [root_dir '\Green\' file_name(1).name];
    logmsg(fid1,handles,['The sub reference file: ' sub_ref_file]);

    % estimate all 5 BIO variables
    vbp = 'ALL';
    VBPR_BySL2P_V1R(img_dir, ang_dir, sub_ref_file, out_dir, vbp);
    logmsg(fid1,handles,['Completed processing data from input path: ' img_dir]);
    
    if stop_processing > 0
        msgbox('Processing stopped manually.');
        return;
    end
end

ttime = toc;
disp(['>>> Elapsed time: ', num2str(ttime),' seconds. <<<'])
disp(' ')

%% close the log file
%% Close the logfile
logmsg(fid1,handles,'Completed batch VBPR by SL2P processing.');
logmsg(fid1,handles,['>>> Elapsed time: ', num2str(ttime),' seconds. <<<']);
fclose(fid1);

disp('>>> Completed VBPR by batch SL2P processing. <<<');

% --- Executes on button press in pbStop.
function pbStop_Callback(hObject, eventdata, handles)
% hObject    handle to pbStop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global stop_processing;
stop_processing = 1;


function txtImgDataFilePath_Callback(hObject, eventdata, handles)
% hObject    handle to txtImgDataFilePath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtImgDataFilePath as text
%        str2double(get(hObject,'String')) returns contents of txtImgDataFilePath as a double


% --- Executes during object creation, after setting all properties.
function txtImgDataFilePath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtImgDataFilePath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbBrowseImgDataFilePath.
function pbBrowseImgDataFilePath_Callback(hObject, eventdata, handles)
% hObject    handle to pbBrowseImgDataFilePath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cur_dir = cd;
pathname = uigetdir();
 if  pathname > 0  
    set(handles.txtImgDataFilePath, 'String', pathname);
 end 
 cd(cur_dir);
