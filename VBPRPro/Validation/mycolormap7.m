function [cmap,MAR]=mycolormap7()
colormap lines;
cmap=colormap;
cmap=cmap(1:8,:);
cmap(1,:)=[1 0 1];
cmap(2,:)=[0.600000023841858 0.200000002980232 0];
cmap(3,:)=[0 0 1];
cmap(6,:)=[0 0.749019622802734 0.749019622802734];
cmap(7,:)=[0.929411768913269 0.694117665290833 0.125490203499794];
cmap(8,:)=[0 0 0];

MAR=["*","square","o","diamond","v","^","pentagram"];
end