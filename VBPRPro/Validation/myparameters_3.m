function param_def=myparameters(PP)

if PP==1,
   param_def.SIMUL_file_name='lai';           
   param_def.SIMUL_scale=1;
   param_def.GRND_scale=1;
   param_def.PREC_ther=1;
   param_def.PREC_perc=0.2;
   param_def.lim_sup_data=[0,2,8];
   param_def.x_labels_1="LAI (in-situ) [-]";
   param_def.y_labels_1="LAI (SL2P) [-]";
   param_def.y_labels_2="LAI (SL2P-reg) [-]";
end;
if PP==2,
   param_def.SIMUL_file_name='fcover';          
   param_def.SIMUL_scale=100;
   param_def.GRND_scale=1;
   param_def.PREC_REC=5;
   param_def.PREC_ther=15;
   param_def.PREC_perc=0;
   param_def.lim_sup_data=[0,25,100];
   param_def.x_labels_1="FCOVER (in-situ) [%]";
   param_def.y_labels_1="FCOVER (SL2P) [%]";
   param_def.y_labels_2="FCOVER (SL2P-reg) [%]";
end;
if PP==3,
   param_def.SIMUL_file_name='lai_cw';     
   param_def.SIMUL_scale=10;
   param_def.GRND_scale=1;
   param_def.PREC_REC=0.5;
   param_def.PREC_ther=0.2;
   param_def.PREC_perc=0.2;
   param_def.lim_sup_data=[0,1,3.5];
   param_def.x_labels_1="CWC (in-situ) [kg/m^2]";
   param_def.y_labels_1="CWC (SL2P) [kg/m^2]";
   param_def.y_labels_2="CWC (SL2P-reg) [kg/m^2]";

end




