function varargout = UpOrDownscalingS2L2A(varargin)
% UPORDOWNSCALINGS2L2A MATLAB code for UpOrDownscalingS2L2A.fig
%      UPORDOWNSCALINGS2L2A, by itself, creates a new UPORDOWNSCALINGS2L2A or raises the existing
%      singleton*.
%
%      H = UPORDOWNSCALINGS2L2A returns the handle to a new UPORDOWNSCALINGS2L2A or the handle to
%      the existing singleton*.
%
%      UPORDOWNSCALINGS2L2A('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UPORDOWNSCALINGS2L2A.M with the given input arguments.
%
%      UPORDOWNSCALINGS2L2A('Property','Value',...) creates a new UPORDOWNSCALINGS2L2A or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UpOrDownscalingS2L2A_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UpOrDownscalingS2L2A_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UpOrDownscalingS2L2A

% Last Modified by GUIDE v2.5 12-Dec-2020 12:26:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UpOrDownscalingS2L2A_OpeningFcn, ...
                   'gui_OutputFcn',  @UpOrDownscalingS2L2A_OutputFcn, ...
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


% --- Executes just before UpOrDownscalingS2L2A is made visible.
function UpOrDownscalingS2L2A_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UpOrDownscalingS2L2A (see VARARGIN)

% Choose default command line output for UpOrDownscalingS2L2A
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UpOrDownscalingS2L2A wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = UpOrDownscalingS2L2A_OutputFcn(~, ~, handles) 
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
    set(handles.txtGrabuleXMLFile, 'String', pathname);
    set(handles.txtOutputFileFolder, 'String', [pathname 'OUTPUT']);
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

%% get scaling processing method
switch get(handles.popUpDownScalingMethod,'Value')
    case 1 % Retreive 10m resolution bands only
        method = 'R0-10';
        % create output data folder
        out_dir = createOutputFolder(out_dir,method);
        % copy the original 10m band data files to output data folder only
        % get all 10m band data files
        zipfnames = dir(L2A_10m_imgdata_path);
        zipfnames = {zipfnames(~[zipfnames.isdir]).name};
        for i=1:length(zipfnames)
            [path, fname, ext] = fileparts(zipfnames{i});
            if contains(fname,'B02_10m') % copy band B02 data
                out_fname = [out_dir '\' fname '.' ext];
                copyfile(zipfnames{i},out_fname);
            end
            if contains(fname,'B03_10m') % copy band B03 data
                out_fname = [out_dir '\' fname '.' ext];
                copyfile(zipfnames{i},out_fname);
            end
            if contains(fname,'B04_10m') % copy band B04 data
                out_fname = [out_dir '\' fname '.' ext];
                copyfile(zipfnames{i},out_fname);
            end
            if contains(fname,'B08_10m') % copy band B08 data
                out_fname = [out_dir '\' fname '.' ext];
                copyfile(zipfnames{i},out_fname);
            end            
        end
    case 2 %Downsampling (10m->20m) using a block reducing algorithm
        method = 'R1-20';
        % create output data folder
        out_dir = createOutputFolder(out_dir,method);
        % copy the L2A 20m band data files to output data folder only
        % get all L2A 20m band data files
        zipfnames = dir(L2A_20m_imgdata_path);
        zipfnames = {zipfnames(~[zipfnames.isdir]).name};
        for i=1:length(zipfnames)
            [path, fname, ext] = fileparts(zipfnames{i});
            %if contains(fname,'B02_10m') % copy band B02 data
                out_fname = [out_dir '\' fname '.' ext];
                copyfile(zipfnames{i},out_fname);
            %end
        end
    case 3 %Upsampling (20m->10m) using bicubic spline interpolation
        method = 'R2-10';
        % create output data folder
        out_dir = createOutputFolder(out_dir,method);
        % copy the L2A 20m band data files to output data folder only
    case 4 %Upsampling (20m->10m) using ATPRK MS Sharpening algorithm
        method = 'D1-10';
        % create output data folder
        out_dir = createOutputFolder(out_dir,method);
        % copy the L2A 20m band data files to output data folder only        
    case 5 %Upsampling (20m->10m) using ATPRK PAN Sharpening algorithm
        method = 'D2-10'; 
        % create output data folder
        out_dir = createOutputFolder(out_dir,method);
        % copy the L2A 20m band data files to output data folder only        
    case 6 %Upsampling (20m->10m) using Sen2Res algorithm
        method = 'D3-10';
        % create output data folder
        out_dir = createOutputFolder(out_dir,method);
        % copy the L2A 20m band data files to output data folder only        
    case 7 %Upsampling (20m->10m) using SupReME algorithm
        method = 'D4-10';
        % create output data folder
        out_dir = createOutputFolder(out_dir,method);
        % copy the L2A 20m band data files to output data folder only        
    case 8 %Upsampling (20m->10m) using DSen2 algorithm
        method = 'D5-10';
        % create output data folder
        out_dir = createOutputFolder(out_dir,method);
        % copy the L2A 20m band data files to output data folder only        
end




    
%     %% apply PCI merge bands function 
%     L2A_out_img_file = [out_img_path '\' L2A_name '.pix'];
%     merge_list_file = [out_img_path '\Merge_List.txt'];
%     if exist(L2A_out_img_file,'file') == 0
%         %% Merge 6 single band image files into one multiple bands image file
%         imgfiles = dir(L2A_granule_imgdata_path);
%         % prepare the input image list file
%         fid_out=fopen(merge_list_file,'wt');
%         for j=1:length(imgfiles)
%             in_image = [L2A_granule_imgdata_path '\' imgfiles(j).name];
%             if contains(in_image,'B02')
%                 fprintf(fid_out,'%s\n',['"' in_image '"']);
%             end
%             if contains(in_image,'B03')
%                 fprintf(fid_out,'%s\n',['"' in_image '"']);
%             end 
%             if contains(in_image,'B04')
%                 fprintf(fid_out,'%s\n',['"' in_image '"']);
%             end
%             if contains(in_image,'B8A')
%                 fprintf(fid_out,'%s\n',['"' in_image '"']);
%             end 
%             if contains(in_image,'B11')
%                 fprintf(fid_out,'%s\n',['"' in_image '"']);
%             end 
%             if contains(in_image,'B12')
%                 fprintf(fid_out,'%s\n',['"' in_image '"']);
%             end
%             if contains(in_image,'SCL')
%                 img_scl = in_image;
%             end     
%         end
%         fclose(fid_out); 
% 
%         %% call PCI mergeband module to merge the single band data 
%         mergeBandsByPCIMergeband(merge_list_file,L2A_out_img_file);            
%     end

% %     %% Export L2A processing results from SAFE format to a ENVI file
% %     L2A_out_img_file = [out_img_path '\' L2A_name '.dat'];
% %     L2A_out_img_scl_file = [out_img_path '\' L2A_name '_SCL.dat'];
% %     if exist(L2A_out_img_file,'file') == 0
% %         %% Read the meta data for output
% %         if exist(L2A_granule_xmlfile, 'file')
% %             granule = xml2struct(L2A_granule_xmlfile);
% %         end 
% %         resolution = str2double(outresolution);
% %         switch resolution
% %             case 10                          
% %                 rows = str2double(granule.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Geocoding.Size{1, 1}.NROWS.Text);
% %                 cols = str2double(granule.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Geocoding.Size{1, 1}.NCOLS.Text);
% %                 ulx = str2double(granule.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Geocoding.Geoposition{1, 1}.ULX.Text);
% %                 uly = str2double(granule.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Geocoding.Geoposition{1, 1}.ULY.Text);
% %             case 20                          
% %                 rows = str2double(granule.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Geocoding.Size{1, 2}.NROWS.Text);
% %                 cols = str2double(granule.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Geocoding.Size{1, 2}.NCOLS.Text);
% %                 ulx = str2double(granule.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Geocoding.Geoposition{1, 2}.ULX.Text);
% %                 uly = str2double(granule.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Geocoding.Geoposition{1, 2}.ULY.Text);
% %             case 60                          
% %                 rows = str2double(granule.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Geocoding.Size{1, 3}.NROWS.Text);
% %                 cols = str2double(granule.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Geocoding.Size{1, 3}.NCOLS.Text);
% %                 ulx = str2double(granule.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Geocoding.Geoposition{1, 3}.ULX.Text);
% %                 uly = str2double(granule.n1_colon_Level_dash_2A_Tile_ID.n1_colon_Geometric_Info.Tile_Geocoding.Geoposition{1, 3}.ULY.Text);
% %         end
% %         img_merged = zeros(rows, cols, 6);
% % 
% %         %% Merge 6 single band image files into one multiple bands image file
% %         imgfiles = dir(L2A_granule_imgdata_path);
% %         for j=1:length(imgfiles)
% %             in_image = [L2A_granule_imgdata_path '\' imgfiles(j).name];
% %             if contains(in_image,'B02')
% %                 img_merged(:,:,1) = imread(in_image);
% %             end
% %             if contains(in_image,'B03')
% %                 img_merged(:,:,2) = imread(in_image);
% %             end 
% %             if contains(in_image,'B04')
% %                 img_merged(:,:,3) = imread(in_image);
% %             end
% %             if contains(in_image,'B8A')
% %                 img_merged(:,:,4) = imread(in_image);
% %             end 
% %             if contains(in_image,'B11')
% %                 img_merged(:,:,5) = imread(in_image);
% %             end 
% %             if contains(in_image,'B12')
% %                 img_merged(:,:,6) = imread(in_image);
% %             end
% %             if contains(in_image,'SCL')
% %                 img_scl = imread(in_image);
% %                 % save the claster data
% %                 enviwrite(L2A_out_img_scl_file, img_scl, 'int8', [resolution, resolution], [ulx, uly],'bsq', utm_zone);
% %             end     
% %         end
% % 
% %         %% save the merged image data 
% %         enviwrite(L2A_out_img_file, img_merged, 'int16', [resolution, resolution], [ulx, uly],'bsq', utm_zone);
% %     end  

ttime = toc;
disp(['>>> Elapsed time: ', num2str(ttime),' seconds. <<<'])
disp(' ')

%% close the log file
%% Close the logfile
logmsg(fid1,handles,'Completed S2 MSI image processing.');
logmsg(fid1,handles,['>>> Elapsed time: ', num2str(ttime),' seconds. <<<']);
fclose(fid1);

disp('>>> Completed unzip S2 L1C data files and run L2A processing. <<<');

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
