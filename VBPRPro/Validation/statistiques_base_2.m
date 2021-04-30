function [STAT]=statistiques_base_2 (X,c1,c2,c4)

X=X(find(~isnan(X(:,c1))),:);
X=X(find(~isnan(X(:,c2))),:);

DIFF=abs(X(:,c1)-X(:,c2));
if c4>0, SEUIL=X(:,c4);
else SEUIL=X(:,c1)*0; end;
            
mdl = fitlm(X(:,c1),X(:,c2));

[STAT.R,STAT.R_p_value]=corr(X(:,c1),X(:,c2));
STAT.RMSE=rmse(X(:,c1),X(:,c2));
STAT.Bias=bias_f(X(:,c1),X(:,c2));

STAT.Slope=table2array(mdl.Coefficients(2,1));
STAT.Slope_p_value=table2array(mdl.Coefficients(2,4));
STAT.Offset=table2array(mdl.Coefficients(1,1));
STAT.Offset_p_value=table2array(mdl.Coefficients(1,4));
STAT.N = size(X(:,c1),1);
STAT.X_min=min(X(:,c1));
STAT.X_max=max(X(:,c1));
STAT.X_range=STAT.X_max-STAT.X_min;
STAT.Y_min=min(X(:,c2));
STAT.Y_max=max(X(:,c2));
STAT.Y_range=STAT.Y_max-STAT.Y_min; 
XXX=X(find(DIFF<=SEUIL),:);
STAT.Acc=size(XXX,1)/STAT.N;
end