function Z = SR_ByATPRK_PANSharpen(S2_20m, S2_10m)
%% Super resolve S2-MSI images by ATPRK
%% Selected band scheme selects a 10m band with the largest CC for each 20m band
%
% Input:
% S2_20m - 20m bands in a image cube (6 bands)
% S2_10m - 10m bands in a image cube (4 bands)
% 
% Output:
% Z - super resolved 10m bands of the 20m bands in a image cube (6 bands)
%

%% initialize and pass the data
I_MS = S2_20m; clear S2_20m;
I_PAN = S2_10m; clear S2_10m;
[row,col,b] = size(I_PAN);
Z = zeros(row,col,6);

%% set up model parameters
s=2;
w=1;
sigma=s/2;
PSFh=PSF_template(s,w,sigma);%%%Gaussian PSF
%PSFh=zeros((2*w+1)*s,(2*w+1)*s);PSFh(w*s+1:w*s+s,w*s+1:w*s+s)=1/s^2;%%%Ideal square wave PSF

Sill_min=1;
Range_min=0.5;
L_sill=20;
L_range=20;
rate=0.1;
H=20;

%% correlation analysis
I_PAN_upscaled=dowmsample_cube(I_PAN,s,w,PSFh);
for i=1:6
    for j=1:4
        [RMSE0,CC0]=evaluate_relation(I_MS(:,:,i),I_PAN_upscaled(:,:,j));
        CC_matrix(i,j)=CC0;
    end
end
[II,JJ]=max(CC_matrix,[],2);

%% sharpen the coarse images
for i=1:6
    [xrc1,RB0,Z0]=ATPRK_PANsharpen(I_MS(:,:,i),I_PAN(:,:,JJ(i)),Sill_min,Range_min,L_sill,L_range,rate,H,w,PSFh);
    Z(:,:,i)=Z0;
end

%% put all 10m bands into a image cube


%% plot the sharpened images
% FalseColorf=Z(:,:,[3,2,1]);
% xf=imadjust(FalseColorf/1000,stretchlim(FalseColorf/1000),[]);
% figure,imshow(xf);
