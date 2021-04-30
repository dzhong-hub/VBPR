function [data01,data02]=resample_density_v2(data00,bs)
[d100,d200]=size(data00);
pn=[];
pn=round((bs-1)*(data00-min(data00))./(max(data00)-min(data00)));
pn(:,end+1)=[sum([pn.*(ones(d100,1)*(bs.^[0:d200-1]))]')]';

pn(:,d200+2)=[1:d100]';
pn=sortrows(pn,d200+1);

pn(2:d100,d200+3)=pn(2:d100,d200+1)-pn(1:d100-1,d200+1);
pn(1,d200+3)=1;
pn1=pn(find(pn(:,end)~=0),:);
pn2=pn(find(pn(:,end)==0),:);

data01=data00(pn1(:,end-1),:);
data02=data00(pn2(:,end-1),:);
end
