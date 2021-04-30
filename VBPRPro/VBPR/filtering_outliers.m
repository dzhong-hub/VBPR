function [database_0]=filtering_outliers (database_0)

data00=database_0.all(find(ismember(database_0.all(:,6),[4,5])),:);   % vegetated or bare soil
data00=data00(find(data00(:,5)==0),:); % flags

database_0.learn=data00;
if database_0.DEF.percentile>0,
    database_0.learn=[];
    data00(:,end+1)=1;
    data00=data00(find(~isnan(sum(data00(:,7:end)')).*~isinf(sum(data00(:,7:end)'))),1:end-1);
    min_bio=min(data00(:,4));
    max_bio=max(data00(:,4));
    pp=(max_bio-min_bio)/database_0.DEF.bio_clas_num;
    for bb=min_bio:pp:max_bio-pp/10
        data01=data00(find((data00(:,4)>=bb)&(data00(:,4)<bb+pp) ),:); 
        if size(data01,1)>3,
            lim_1=prctile(data01,database_0.DEF.percentile);
            lim_2=prctile(data01,100-database_0.DEF.percentile);

            index_01=zeros(size(data01,1),database_0.Lasso.idx(1));
            for bb01=7:7+database_0.Lasso.idx(1)-1,
                index_01(find(data01(:,bb01)>=lim_1(end,bb01)& data01(:,bb01)<=lim_2(end,bb01)),bb01-6)=1;
            end;

            if database_0.Lasso.idx(1)>1,
                database_0.learn=[database_0.learn;data01(find(sum(index_01')==max(sum(index_01'))),:)];
            else
                database_0.learn=[database_0.learn;data01(find(index_01'==max(index_01')),:)];
            end;

        else
            database_0.learn=[database_0.learn;data01];
        end;   
    end;
end;
    
idx_learn=unique(database_0.learn(:,1));
Reg_idx = setdiff(database_0.all(:,1),idx_learn);
data00=database_0.all(Reg_idx,:);
database_0.reg=data00(find(ismember(data00(:,6),[4,5])),:);
database_0.reg_CL=data00(find(~ismember(data00(:,6),[4,5])),:);

database_0.N.learn=size(database_0.learn,1);
database_0.N.reg=size(database_0.reg,1);
database_0.N.CL=size(database_0.reg_CL,1);
end