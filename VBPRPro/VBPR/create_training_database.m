function [database_0]=create_training_database(database_0,VI_0)  
h = waitbar(0,'Create training database...');
for vi=database_0.Lasso.FitInfo.PredictorNames(database_0.Lasso.B(:,database_0.Lasso.idx(3))~=0)
    eval(['database_0.all=[database_0.all,VI_0.',char(vi),'];']);
end
waitbar(1/2)
%% Defining NNET_in databases
database_0=filtering_outliers (database_0);
waitbar(2/2)
close (h);

end