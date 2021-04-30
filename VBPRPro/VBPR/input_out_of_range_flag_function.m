function [flag]=input_out_of_range_flag_function (data,r,c)

convex_hull=importdata('aux_data\S2_SL2P_convex_hull.mat');
Nb_Cas=length(data);
CL=ceil((data-repmat(convex_hull.Extreme(1,:),Nb_Cas,1))./repmat(convex_hull.Extreme(2,:)-convex_hull.Extreme(1,:),Nb_Cas,1).*convex_hull.N_classes);
CL(CL>99)=0;
CL(CL<0)=0;

UCL=0;
UCL=CL*(100.^[0:size(CL,2)-1])';

flag=reshape(~ismember(UCL,convex_hull.data),r,c);
end



