function flags=products_QA_function (database)
Tolerance=0.01; 
Step=10; 
Data=database.learn;
Data=Data(:,7:end);
%% Conception
Extreme=zeros(2,size(Data,2));
Extreme(1,:)=min(Data)-(Tolerance*(max(Data)-min(Data))); % on evite que le minimum étendu par la tolérance soit négatif
Extreme(2,:)=max(Data)+(Tolerance*(max(Data)-min(Data)));
Nb_Cas=length(Data);
var_range=Extreme(2,:)-Extreme(1,:);
var_range(var_range==0)=1;
CL=ceil((Data -repmat(Extreme(1,:),Nb_Cas,1))./repmat(var_range,Nb_Cas,1).*Step);

UCL=0;
for ii=1:size(CL,2)
    UCL=UCL+CL(:,ii)*(100^(ii-1));
end
UCL=unique(UCL);
convex_hull.data=UCL;
convex_hull.N_classes=Step;
convex_hull.Tolerance=Tolerance;
convex_hull.Extreme=Extreme;
convex_hull.var_range=var_range;
%% Applying
Data=database.reg;
Data=Data(:,7:end);
Nb_Cas=length(Data);
CL=ceil((Data-repmat(convex_hull.Extreme(1,:),Nb_Cas,1))./repmat(convex_hull.var_range,Nb_Cas,1).*convex_hull.N_classes);
CL(isnan(CL))=11;
CL(isinf(CL))=12;

UCL=0;
for ii=1:size(CL,2)
    UCL=UCL+CL(:,ii)*(100^(ii-1));
end

%% Exporting
flags=database.reg_1(:,1:4);
flags(:,5)=~ismember(UCL,convex_hull.data);

end



