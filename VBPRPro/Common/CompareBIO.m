function QI = CompareBIO(ref_bio_file, s2_bio_file, out_dir, dm, plotscatter)
% function for comparing WV3 and S2 BIOs
% 
% Input:
% ref_bio_file - WV3 BIO data file as reference
% s2_bio_file  - S2 BIO data to be compared against the reference
% out_dir      - output data folder
% dm           - a string for the downscaling method,e.g.'D1-10','D2-10'...
% plotscatter  - 0 for no scatter plots, 1 for plot scatter points
%
% Output:
% QI        - a structure for quality indicator
% QI.bias   - bias between two BIO datasets
% QI.rmse   - root mean squared error
% QI.mae    - mean adsolute error
% QI.ssi    - structural similarity (SSIM) index 
% QI.ssimval    - global structural similarity (SSIM) index 
% QI.ssimmap    - local structural similarity (SSIM) index map 
% QI.psnr   - peak signal-to-noise ratio (PSNR)
% QI.uqi    - universal quality index
% QI.r      - perason correlation coefficient
% QI.r2     - r square
% QI.valp   - total valid sample points used for the comparison
% QI.excp   - total invalid sample points excluded for the comparison
%
set(0,'DefaultTextInterpreter','none');
set(gcf, 'InvertHardCopy', 'off');

%% determine BIO variable type from the input file name
if contains(ref_bio_file,'FAPAR') && contains(s2_bio_file, 'FAPAR')
    var = 'FAPAR';
elseif contains(ref_bio_file,'FCOVER') && contains(s2_bio_file, 'FCOVER')
    var = 'FCOVER';
elseif contains(ref_bio_file,'LAI_Cab') && contains(s2_bio_file, 'LAI_Cab')
    var = 'LAI_Cab';
elseif contains(ref_bio_file,'LAI_Cw') && contains(s2_bio_file, 'LAI_Cw')
    var = 'LAI_Cw';
elseif contains(ref_bio_file,'LAI') && contains(s2_bio_file, 'LAI')
    var = 'LAI';
else
    msgbox('Variable names do not match.', 'Error');
    return;
end

%% read in image data
imgo = geoimread(ref_bio_file);
imgp = geoimread(s2_bio_file);

%% read in flags data and set the flagged pixels to value = 0
ref_flag_file = strrep(ref_bio_file, '.tif', '_Flags.tif'); 
if exist(ref_flag_file,'file')
    flags = geoimread(ref_flag_file);
    imgo(flags>0) = 0;
end

s2_flag_file = strrep(s2_bio_file, '.tif', '_Flags.tif'); 
if exist(s2_flag_file,'file')
    flags = geoimread(s2_flag_file);
    imgp(flags>0) = 0;
end

imgo = double(imgo);
imgp = double(imgp);

%% Calculate the global SSIM value for the image and local SSIM values for each pixel. 
[ssimval,ssimmap] = ssim(imgp,imgo);
peaksnr = psnr(imgp,imgo);

x = imgp(:);
y = imgo(:);
idx = find(x<=0 | isnan(x));
idy = find(y<=0 | isnan(y));
idxy = union(idx,idy);
y(idxy) = [];
x(idxy) = [];
if isempty(idxy)
    excp = 0;
else
    excp = length(idxy);
end

%% calculate quality indicators
[r2, rmse] = rsquare(x,y);
d = x-y; bias = mean(d); mae = mean(abs(d)); ns = length(d);

% universal quality index
meansx = mean(x); meansy = mean(y); sdsx   = std(x); sdsy   = std(y);
r = corr2(x,y);
uqi = 4*r*sdsx*sdsy*meansx*meansy/((sdsx^2+sdsy^2)*(meansx^2+meansy^2));

% % SSIM
% ssi = ssim(x, y);

%% put the quality indicators into a structre
QI.bias = bias;
QI.rmse = rmse;
QI.mae  = mae;
QI.ssim = ssimval;
QI.ssimmap = ssimmap;
QI.psnr = peaksnr;
QI.uqi  = uqi;
QI.r2   = r2;
QI.r    = r;
QI.valp   = ns;
QI.excp = excp;  

%% plot scatter points
if plotscatter == 1
    h1 = figure;
    set(h1,'Position',[100 100 1800 500]);
    subplot(1,3,1);

    ax_min = min(round(min(x)),round(min(y)));
    %ax_max = max(ceil(max(x)), ceil(max(y)));
    ax_max = max(max(x),max(y));

    %scatter(x,y,sz,'filled');
    dscatter(x,y);
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

    xlabel(['S2 ' var]);
    ylabel(['WV3 ' var]);
    %title(['S2 vs. WV3 ' var ' by ' method]);

    TXT_1=['BIAS  = ';'RMSE  = ';'R2    = ';'SSIM  = '];
    TXT_2=strjust(num2str([bias;rmse;r2;ssimval],'%.4f'),'right');   
    text(0.05*(ax_max-ax_min),0.85*(ax_max-ax_min),[TXT_1,TXT_2],'FontName', 'Courier','FontSize',12,'FontWeight','bold','EdgeColor',[1 1 1],'BackgroundColor',[1 1 1],'Color',[0 0 0]);

    %% plot differences
    subplot(1,3,[2,3]);
    % d = x-y; mae = mean(abs(d));
    plot(d)
    xlabel('Pixel Numbers ');
    ylabel([var ' Differences']);
    %title(['S2 vs. WV3 ' var ' by ' method]);

    TXT_1=['BIAS  = ';'RMSE  = ';'R2    = ';'SSIM  = '];
    TXT_2=strjust(num2str([bias;rmse;r2;ssimval],'%.4f'),'right');   
    text(10000,0,[TXT_1,TXT_2],'FontName', 'Courier','FontSize',12,'FontWeight','bold','EdgeColor',[1 1 1],'BackgroundColor',[1 1 1],'Color',[0 0 0]);

    fig_file = [out_dir '\' dm '_' var '_S2_vs_WV3.fig'];
    png_file = strrep(fig_file, '.fig', '.png');
    savefig(fig_file);
    saveas(gcf,png_file);
  
end

