function [data_in]=output_out_of_range(data_in,bounding_box)
%% Creating output_thresholded_to_min/max_outpout flag

    f_idx=find(data_in(:,1)<bounding_box.Pmin & data_in(:,1)>=bounding_box.Pmin-bounding_box.Tolerance);
    data_in(f_idx,end+1)=1;
    data_in(f_idx,1)=bounding_box.Pmin;

    f_idx=find(data_in(:,1)>bounding_box.Pmax & data_in(:,1)<=bounding_box.Pmax+bounding_box.Tolerance);
    data_in(f_idx,end+1)=1;
    data_in(f_idx,1)=bounding_box.Pmax;  
    %% Creating output too low/high flag
    f_idx=find(data_in(:,1)<bounding_box.Pmin-bounding_box.Tolerance);
    data_in(f_idx,end+1)=1;

    f_idx=find(data_in(:,1)>bounding_box.Pmax+bounding_box.Tolerance);
    data_in(f_idx,end+1)=1;
    %% *********
   % data_in(:,end+1)=sum([data_in(:,2:end).*(2.^[0:size(data_in,2)-2])]')';  
end