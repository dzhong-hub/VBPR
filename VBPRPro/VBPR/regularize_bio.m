function [database_0]=regularize_bio(database_0)
%% Data split
learn_data=database_0.learn;
[learn,valid]=resample_density_v2(learn_data(:,[4,7:end]),100);
clear learn_data;

In_Learn=learn(:,2:end)';
In_Valid=valid(:,2:end)';
Out_Learn=learn(:,1)';
Out_Valid = valid(:,1)';
%% Data normalisation
[pn,ps]=mapminmax(In_Learn);
[tn,ts]=mapminmax(Out_Learn);

Learn.P=pn;
Learn.T=tn;
Valid.P=mapminmax('apply',In_Valid,ps);
Valid.T=mapminmax('apply',Out_Valid,ts);
%% ANN architecture
NNT_Archi=importdata('ALR_SL2P_NNT_Archi.mat');
NNT_Archi.(upper(database_0.bvar)).Nb_Reseau=3;
NNT_Archi.(upper(database_0.bvar)).Nb_Neurons=[5,1];
%% ANN Training
Rmse_net=zeros(NNT_Archi.(upper(database_0.bvar)).Nb_Reseau,2).*NaN;
for ires=1:NNT_Archi.(upper(database_0.bvar)).Nb_Reseau
    NET = feedforwardnet(NNT_Archi.(upper(database_0.bvar)).Nb_Neurons);
    NET.trainParam.show = 50;
    NET.trainParam.epochs = 250;
    NET.trainParam.goal = 1e-3; 
    %% taraining NNT       
    NET=train(NET,Learn.P,Learn.T);                                                                                       
    nntraintool close
    
    Var_Learn  = mapminmax('reverse',sim(NET,Learn.P),ts);
    Var_Valid  = mapminmax('reverse',sim(NET,Valid.P),ts); 
    Rmse_net(ires,:)=[rmse(Out_Learn,Var_Learn) rmse(Out_Valid,Var_Valid)];
    if min(Rmse_net(:,1))==Rmse_net(ires,1)
       database_0.NET.NET=NET; % on garde le meilleur réseau
       database_0.NET.RMSE=Rmse_net(ires,:);
       database_0.NET.Var_Learn = Var_Learn(:,:)';
       database_0.NET.Var_Valid= Var_Valid(:);
       
       database_0.NET.In_Learn = In_Learn(:,:)';
       database_0.NET.In_Valid= In_Valid(:,:)';
    end
end 
clear In_Learn In_Valid Out_Learn Out_Valid
clear Learn Valid Var_Learn Var_Valid
clear NNT_Archi

%% Simulating
database_0.reg_1=database_0.reg;
sim_in_P=mapminmax('apply',database_0.reg(:,7:end)',ps); 
database_0.reg_1(:,4)=(mapminmax('reverse',sim(NET,sim_in_P),ts))'; 
clear NET;

%% creating flags maps
%% input_out_of_range
flags=products_QA_function (database_0);

%% output_thresholded_to_min outpout flag
bounding_box=importdata('ALR_BIO_VAR_bounding_box.mat');
eval(['bounding_box=bounding_box.',database_0.bvar,';']);

flags(find(database_0.reg_1(:,4)<bounding_box.Pmin & database_0.reg_1(:,4)>=bounding_box.Pmin-bounding_box.Tolerance),end+1)=1;
database_0.reg_1(find(flags(:,end)==1),4)=bounding_box.Pmin;
%% Creating output_thresholded_to_max outpout flag
flags(find(database_0.reg_1(:,4)>bounding_box.Pmax & database_0.reg_1(:,4)<=bounding_box.Pmax+bounding_box.Tolerance),end+1)=1;
database_0.reg_1(find(flags(:,end)==1),4)=bounding_box.Pmax;
%% Creating output too low/high flag
flags(find(database_0.reg_1(:,4)<bounding_box.Pmin-bounding_box.Tolerance),end+1)=1;
flags(find(database_0.reg_1(:,4)>bounding_box.Pmax+bounding_box.Tolerance),end+1)=1;
%%% total_flag
flags(:,10)=0;
for flg_id=5:9
    flags(:,10)=flags(:,10)+[flags(:,flg_id)*(2^(flg_id-5))]; 
end
%% the following sortrows function will cause out of memory issue, why sortrows??
database_0.reg_1(:,5)=flags(:,end);
database_0.all_1=sortrows([database_0.reg_1;database_0.learn;database_0.reg_CL],1); %% why sortrows???
end

