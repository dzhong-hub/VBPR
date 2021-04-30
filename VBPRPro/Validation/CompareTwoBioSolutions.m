function CompareTwoBioSolutions(grnd_file, vbp_path1, vbp_path2, method, out_dir)
%
% Validation VBP by In-Situ data
%
% Input:
%   grnd_file - ground in-situ data file in mat format
%   vbp_path1 - path to the first estimated VBP dataset
%   vbp_path2 - path to the second estimated VBP dataset
%   method - estimation method: SL2P or ALR_SL2P
%   out_dir - output folder
% Output:
%
% 
%% read in is-situ data
GRND=importdata(grnd_file);
GRND_doy=char(fieldnames(GRND.LAI));
GRND_doy=str2num(GRND_doy(:,5:end));

%% get estimated BIO data files
datalist1 = dir([vbp_path1,'*S2_MSI_BIO*.mat']);
s21=[];
for dd=1:length(datalist1)
    s21=[s21;datalist1(dd).name]; 
end
s21_doy=unique(str2num(s21(:,26:28)));

datalist2 = dir([vbp_path2,'*S2_MSI_BIO*.mat']);
s22=[];
for dd=1:length(datalist2)
    s22=[s22;datalist2(dd).name]; 
end
s22_doy=unique(str2num(s22(:,26:28)));

LAI=[]; FCOVER=[]; CWC=[];
for doy=GRND_doy'
    [c1 idx1]=min(abs(s21_doy-doy));
    [c2 idx2]=min(abs(s22_doy-doy));
    if abs(c1)< 1 && abs(c1)< 1 
       s1_1=importdata([vbp_path1,'S2_MSI_BIO_SMAPVEX16_DOY_',num2str(s21_doy(idx1)),'_T14UNA.mat']);
       s1_2=importdata([vbp_path1,'S2_MSI_BIO_SMAPVEX16_DOY_',num2str(s21_doy(idx1)),'_T14UNV.mat']);
       
       s2_1=importdata([vbp_path2,'S2_MSI_BIO_SMAPVEX16_DOY_',num2str(s22_doy(idx2)),'_T14UNA.mat']);
       s2_2=importdata([vbp_path2,'S2_MSI_BIO_SMAPVEX16_DOY_',num2str(s22_doy(idx2)),'_T14UNV.mat']);
       
%        s2_1.LAI(:,4)=doy;
%        s2_1.FCOVER(:,4)=doy;
%        s2_1.LAI_Cw(:,4)=doy;
% 
%        s2_1.LAI(:,5)=s22_doy(idx);
%        s2_1.FCOVER(:,5)=s22_doy(idx);
%        s2_1.LAI_Cw(:,5)=s22_doy(idx);

       LAI=     [LAI;      [s1_1.LAI(:,[1:7,end]),      s1_2.LAI(:,[7,end])         ,s2_1.LAI(:,[7,end]),    s2_2.LAI(:,[7,end])        ,eval(['GRND.LAI.DOY_',num2str(doy),'(:,[7])'])]];
       FCOVER=  [FCOVER;   [s1_1.FCOVER(:,[1:7,end]),   s1_2.FCOVER(:,[7,end])      ,s2_1.FCOVER(:,[7,end]), s2_2.FCOVER(:,[7,end])     ,eval(['GRND.FCOVER.DOY_',num2str(doy),'(:,[7])'])]];
       CWC=     [CWC;      [s1_1.LAI_Cw(:,[1:7,end]),   s1_2.LAI_Cw(:,[7,end])      ,s2_1.LAI_Cw(:,[7,end]), s2_2.LAI_Cw(:,[7,end])     ,eval(['GRND.CWC.DOY_',num2str(doy),'.LEAVES_STEMS_A(:,[7])'])]];
    end   
end

%% set values of flaged pixels to NaN 
LAI(find(LAI(:,8)>0),7)=NaN;
FCOVER(find(FCOVER(:,8)>0),7)=NaN; 
CWC(find(CWC(:,8)>0),7)=NaN;

LAI(find(LAI(:,10)>0),9)=NaN;
FCOVER(find(FCOVER(:,10)>0),9)=NaN;
CWC(find(CWC(:,10)>0),9)=NaN;

LAI(find(LAI(:,12)>0),11)=NaN;
FCOVER(find(FCOVER(:,12)>0),11)=NaN; 
CWC(find(CWC(:,12)>0),11)=NaN;

LAI(find(LAI(:,14)>0),13)=NaN;
FCOVER(find(FCOVER(:,13)>0),13)=NaN;
CWC(find(CWC(:,14)>0),13)=NaN;

%% remove data points without ground measurements
LAI(find(isnan(LAI(:,15))),:)=[];
FCOVER(find(isnan(FCOVER(:,15))),:)=[];
CWC(find(isnan(CWC(:,15))),:)=[];

%% save the results to a text file for comparison
writematrix(LAI,[out_dir '\LAI_12.xls']);
writematrix(FCOVER,[out_dir '\FCOVER_12.xls']);
writematrix(CWC,[out_dir '\CWC_12.xls']);

%% average the two values calculated  from two tiles
% colum 7:  the first BIO solution for the tile T14UNA
% colum 9:  the first BIO solution for the tile T14UNV
% colum 11: the second BIO solution for the tile T14UNA
% colum 13: the second BIO solution for the tile T14UNV
% colum 15: the gound in-situ measurements
LAI_out = [LAI(:,1:6), nanmean([LAI(:,7), LAI(:,9)],2) , nanmean([LAI(:,11), LAI(:,13)],2),LAI(:,15)];
FCOVER_out = [FCOVER(:,1:6), nanmean([FCOVER(:,7), FCOVER(:,9)],2) , nanmean([FCOVER(:,11), FCOVER(:,13)],2),FCOVER(:,15)];
CWC_out = [CWC(:,1:6), nanmean([CWC(:,7), CWC(:,9)],2) , nanmean([CWC(:,11), CWC(:,13)],2),CWC(:,15)];

%% save the average results to a text file for comparison
writematrix(LAI_out,[out_dir '\LAI_mean_12.xls']);
writematrix(FCOVER_out,[out_dir '\FCOVER_mean_12.xls']);
writematrix(CWC_out,[out_dir '\CWC_mean_12.xls']);

%% scatter plot
for ivar=["LAI","FCOVER","CWC"]

    ix = 7; iy = 8; iz = 9;
    if ivar=="LAI"
        x = LAI_out(:,ix); y = LAI_out(:,iy); z = LAI_out(:,iz);
    end
    if ivar=="FCOVER"
        x = FCOVER_out(:,ix); y = FCOVER_out(:,iy); z = FCOVER_out(:,iz);
    end
    if ivar=="CWC"
        x = CWC_out(:,ix); y = CWC_out(:,iy); z = CWC_out(:,iz);
    end
    
    idx = find(isnan(x));
    idy = find(isnan(y));
    idz = find(isnan(z));
    idxy = union(idx,idy);
    idxyz = union(idxy, idz);
    
    x(idxyz) = [];
    y(idxyz) = [];
    z(idxyz) = [];
       
    if ~isempty(x)      
        %% scatter plot x y
        %subplot(3,1,1);
        figure;
        [r2 rmse] = rsquare(double(x),double(y));           
        ax_min = double(min(min(x),min(y)));
        ax_max = double(max(max(x), max(y)));
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

        xlabel([char(ivar) ' 1']);
        ylabel([char(ivar) ' 2']);
        title(['Comparison of ' char(ivar)]);

        TXT_1=['RMSE  = ';'R2    = '];
        TXT_2=strjust(num2str([rmse;r2],'%.3f'),'right');
        str = [TXT_1,TXT_2];
        text(0.05*(ax_max-ax_min),0.9*(ax_max-ax_min),str,'FontName', 'Courier','FontSize',10,'FontWeight','bold','EdgeColor',[1 1 1],'BackgroundColor',[1 1 1],'Color',[0 0 0]);
        %text(0.8*ax_min,0.90*ax_max,str,'FontName', 'Courier','FontSize',10,'FontWeight','bold','EdgeColor',[1 1 1],'BackgroundColor',[1 1 1],'Color',[0 0 0]);

        %% scatter plot x z
        %subplot(3,1,2); 
        figure;
        [r2 rmse] = rsquare(double(x),double(z));           
        ax_min = double(min(min(x),min(z)));
        ax_max = double(max(max(x), max(z)));
        dscatter(z,x);
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

        xlabel([char(ivar) ' Ground']);
        ylabel([char(ivar) ' 1']);
        title(['Comparison of ' char(ivar)]);
        
        TXT_1=['RMSE  = ';'R2    = '];
        TXT_2=strjust(num2str([rmse;r2],'%.3f'),'right');
        str = [TXT_1,TXT_2];
        text(0.05*(ax_max-ax_min),0.9*(ax_max-ax_min),str,'FontName', 'Courier','FontSize',10,'FontWeight','bold','EdgeColor',[1 1 1],'BackgroundColor',[1 1 1],'Color',[0 0 0]);
        %text(0.8*ax_min,0.90*ax_max,str,'FontName', 'Courier','FontSize',10,'FontWeight','bold','EdgeColor',[1 1 1],'BackgroundColor',[1 1 1],'Color',[0 0 0]);

        %% scatter plot y z
        %subplot(3,1,3);
        figure;
        [r2 rmse] = rsquare(double(y),double(z));           
        ax_min = double(min(min(y),min(z)));
        ax_max = double(max(max(y), max(z)));
        dscatter(z,y);
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

        xlabel([char(ivar) ' Ground']);
        ylabel([char(ivar) ' 2']);
        title(['Comparison of ' char(ivar)]);
        
        TXT_1=['RMSE  = ';'R2    = '];
        TXT_2=strjust(num2str([rmse;r2],'%.3f'),'right');
        str = [TXT_1,TXT_2];
        text(0.05*(ax_max-ax_min),0.9*(ax_max-ax_min),str,'FontName', 'Courier','FontSize',10,'FontWeight','bold','EdgeColor',[1 1 1],'BackgroundColor',[1 1 1],'Color',[0 0 0]);
        %text(0.8*ax_min,0.90*ax_max,str,'FontName', 'Courier','FontSize',10,'FontWeight','bold','EdgeColor',[1 1 1],'BackgroundColor',[1 1 1],'Color',[0 0 0]);

    
    end
end


