%% Cross validation
close all;
clear
clc

cd C:\Users\ndjamai\Desktop\Validation_SL2P_SMAPVEX16\

GRND=importdata('SMAPVEX_SM_in_situ_data.mat');
GRND_doy=char(fieldnames(GRND.LAI));
GRND_doy=str2num(GRND_doy(:,5:end));

s2_path=['SL2P_sim\'];
datalist = dir([s2_path,'S2_MSI_BIO*.mat']);
s2=[];
for dd=1:length(datalist)
    s2=[s2;datalist(dd).name]; 
end;
s2_doy=unique(str2num(s2(:,26:28)));

LAI=[]; FCOVER=[]; CWC=[];
for doy=GRND_doy'
    [c idx]=min(abs(s2_doy-doy));
    if abs(c)<2,
       s2_1=importdata([s2_path,'/S2_MSI_BIO_SMAPVEX16_DOY_',num2str(s2_doy(idx)),'_T14UNA.mat']);
       s2_2=importdata([s2_path,'/S2_MSI_BIO_SMAPVEX16_DOY_',num2str(s2_doy(idx)),'_T14UNV.mat']);
       s2_1.LAI(:,4)=doy;
       s2_1.FCOVER(:,4)=doy;
       s2_1.LAI_Cw(:,4)=doy;

       s2_1.LAI(:,5)=s2_doy(idx);
       s2_1.FCOVER(:,5)=s2_doy(idx);
       s2_1.LAI_Cw(:,5)=s2_doy(idx);

       LAI=     [LAI;      [s2_1.LAI(:,[1:7,end]),      s2_2.LAI(:,[7,end])         ,eval(['GRND.LAI.DOY_',num2str(doy),'(:,[7])'])]];
       FCOVER=  [FCOVER;   [s2_1.FCOVER(:,[1:7,end]),   s2_2.FCOVER(:,[7,end])      ,eval(['GRND.FCOVER.DOY_',num2str(doy),'(:,[7])'])]];
       CWC=     [CWC;      [s2_1.LAI_Cw(:,[1:7,end]),   s2_2.LAI_Cw(:,[7,end])      ,eval(['GRND.CWC.DOY_',num2str(doy),'.LEAVES_STEMS_A(:,[7])'])]];
     end;   
end;

LAI(find(LAI(:,8)>0),7)=NaN;
FCOVER(find(FCOVER(:,8)>0),7)=NaN;
CWC(find(CWC(:,8)>0),7)=NaN;

LAI(find(LAI(:,10)>0),9)=NaN;
FCOVER(find(FCOVER(:,10)>0),9)=NaN;
CWC(find(CWC(:,10)>0),9)=NaN;

LAI=LAI(:,[1:7,9,11]);
FCOVER=FCOVER(:,[1:7,9,11]);
CWC=CWC(:,[1:7,9,11]);

LAI(find(LAI(:,7)<0),7)=NaN;        LAI(find(LAI(:,8)<0),8)=NaN;
FCOVER(find(FCOVER(:,7)<0),7)=NaN;  FCOVER(find(FCOVER(:,8)<0),8)=NaN;
CWC(find(CWC(:,7)<0),7)=NaN;        CWC(find(CWC(:,8)<0),8)=NaN;
    
LAI=[LAI(:,[1:6,9]),nanmean(LAI(:,7:8)')'];
FCOVER=[FCOVER(:,[1:6,9]),nanmean(FCOVER(:,7:8)')'];
CWC=[CWC(:,[1:6,9]),nanmean(CWC(:,7:8)')'];

idx_Low_LAI=find(LAI(:,7)<3);
LAI(idx_Low_LAI,end+1)=1;
FCOVER(idx_Low_LAI,end+1)=1;
CWC(idx_Low_LAI,end+1)=1;
%%
figure_0=figure('Color',[1 1 1],'position',[250,250,1400,900]); 
[cmap,MARKER]=mycolormap7;
colormap (cmap);
idx=0;
CRP=[5,2,4,1,3,6,7];
col_id=8;

N_crp=CRP';
for ivar=["LAI","FCOVER","CWC"]
    idx=idx+1;
    def=myparameters_3(idx);
    eval(['data=',char(ivar),'(:,[1:7,',num2str(col_id),',end]);']);

    TTL=' [ - ]';
    if idx==2,data(:,8)=100*data(:,8); TTL=' [ % ]';end;
    if idx==3,data(:,8)=10*data(:,8);  TTL=' [ kg/m^2 ]';end;
    
    data=data(find(data(:,7)>0),:); 
    data=data(find(data(:,8)>0),:);
    
    data(:,10)= max(def.PREC_ther,data(:,7)*def.PREC_perc);
    STAT= statistiques_base_2(data,7,8,10);
    
    subplot(2,3,idx);
    hold on;
    pgon=area_2(def.lim_sup_data(1),def.lim_sup_data(3),def.PREC_ther,def.PREC_perc);
    plot(pgon,'FaceColor',[0.5 0.5 0.5],'EdgeColor','none')
    plot([0,100],[0,100],'MarkerFaceColor',[0 0 0],'MarkerEdgeColor',[0 0 0],'LineStyle','--','Color',[0 0 0]);    
    plot([STAT.X_min STAT.X_max],STAT.Offset+([STAT.X_min STAT.X_max]*STAT.Slope),'MarkerFaceColor',[0 0 0],'MarkerEdgeColor',[0 0 0],'LineStyle','-','LineWidth',0.25,'Color',[0 0 0]);
    N_crp_0=[];
    for crp=CRP
        data_crp=data(find(data(:,6)==crp),:); 
        plot(data_crp(:,7),data_crp(:,8),'MarkerFaceColor',cmap(crp,:),'MarkerEdgeColor',cmap(crp,:),'MarkerSize',6,'Marker',char(MARKER(crp)),'LineStyle','none','Color',cmap(crp,:));
        N_crp_0=[N_crp_0;size(data_crp,1)];
    end; 
    N_crp=[N_crp,N_crp_0];
    % -----------------------
    TXT_1=['RMSE  : ';'Bias  : ';'Slope : ';'UAR%  : ' ;'N     : '];
    TXT_2=strjust(char([string(num2str([STAT.RMSE;STAT.Bias;STAT.Slope],'%.2f'));string(num2str([round(100*STAT.Acc);STAT.N],'%.d'))]),'right');          
    text(0.05*def.lim_sup_data(3),0.80*def.lim_sup_data(3),[TXT_1,TXT_2],'FontName', 'Courier','FontSize',12,'FontWeight','normal','EdgeColor',[1 1 1],'BackgroundColor',[1 1 1],'Color',[0 0 0]);
    % -----------------------
    ax1=gca; 
    set(ax1, 'FontName', 'arial', 'FontSize', 12);
    xlim([0 def.lim_sup_data(3)]); 
    ylim([0 def.lim_sup_data(3)]);
    set(ax1,'XTick',[0: def.lim_sup_data(2):def.lim_sup_data(3)]);      
    set(ax1,'YTick',[0: def.lim_sup_data(2):def.lim_sup_data(3)]); 
    
    xlabel('In-situ','FontSize',12);
    ylabel('SL2P','FontSize',12); 
    title ({[char(ivar),TTL],' '},'FontSize',12,'FontWeight', 'normal');
    
    box on
    if idx==1,
        l=legend('SEN4SCI uncertainty requirement','1:1 line','Overall linear regression function','SOYBEAN','WHEAT','CANOLA','OAT','CORN','BLACK BEAN','ALFALFA'); %%,'Orientation','horizontal'
        set(l,'FontName', 'arial','FontSize',10,'FontWeight', 'normal','EdgeColor',[1 1 1],'Orientation','horizontal','Position',[0.2 0.47 0.6 0.05]); 
    end;
    
    STAT_inf3= statistiques_base_2(data(find(data(:,end-1)==1),:),7,8,10);
    STAT_sup3= statistiques_base_2(data(find(data(:,end-1)==0),:),7,8,10);

    TXT_inf3=strjust(char([string(num2str([STAT_inf3.RMSE;STAT_inf3.Bias;STAT_inf3.Slope],'%.2f'));string(num2str([round(100*STAT_inf3.Acc);STAT_inf3.N],'%.d'))]),'right');
    TXT_sup3=strjust(char([string(num2str([STAT_sup3.RMSE;STAT_sup3.Bias;STAT_sup3.Slope],'%.2f'));string(num2str([round(100*STAT_sup3.Acc);STAT_sup3.N],'%.d'))]),'right');
    subplot(2,3,idx+3);
    plot([0:100,0:100],'.w');
    text(50,80,{['      LAI<3  LAI>=3'];[TXT_1,TXT_inf3,['     ']',TXT_sup3]},'FontName', 'Courier','FontSize',12,'FontWeight','normal','EdgeColor',[1 1 1],'BackgroundColor',[1 1 1],'Color',[0 0 0]);
    ax=gca;
    set(ax,'XColor',[1 1 1],'YColor',[1 1 1],'ZColor',[1 1 1]);
    title (char(ivar),'FontSize',12,'FontWeight', 'normal');
end;
  
savefig(['.\',s2_path,'_vs_SMAPVEX16.fig'])
saveas(figure_0,['.\',s2_path,'_vs_SMAPVEX16.png'])
