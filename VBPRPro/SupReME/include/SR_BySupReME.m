function Mimg = SR_BySupReME(Bimg, N)
%% Super resolve S2-MSI images by SupReME
%
% Input: 
% Bimg - blocked S2 image data in sequence of bands
% [B1 B2 B3 B4 B5 B6 B7 B8 B8A B9 B11 B12]
%
% Output:
% Mimg - super resolved S2 image data in the same sequence of bands as
% input data
%

%% Specify model parameters
% dimension of the subspace
p = 7;      %7 just the number of bands with resolution 10

% regularization parameter
lambda = 0.005; reg_type = 'l2_reg';

% number of MS bands
nb = 12;

% Sequence of bands
% [B1 B2 B3 B4 B5 B6 B7 B8 B8A B9 B11 B12]

% subsampling factors (in pixels)
d = [6 1 1 1 2 2 2 1 2 6 2 2]';

% convolution  operators (Gaussian convolution filters), taken from ref [5]
mtf = [ .32 .26 .28 .24 .38 .34 .34 .26 .33 .26 .22 .23];
sdf = d.*sqrt(-2*log(mtf)/pi^2)';

% Do not sharpen high-res bands
sdf(d==1) = 0;

% remove border for computing the subspace and the result (because of
% circular assumption
limsub = 2;

% kernel filter support
dx = 12;
dy = 12;

%% --- BEGIN  -------------------------------------------------------
[rb, cb] = size(Bimg);
Simg = cell(1,cb);
for b = 1:cb
    Yim = cell(nb,1);
    for k = 1:nb
        Yim{k} = Bimg{k,b};
    end
    
    %% dimensions of the inputs
    [nl,nc] = size(Yim{2});
    n = nl*nc;

    %% normalise
    [Yim2, av] = normaliseData(Yim);
    clear Yim;

    %% Define blurring operators
    FBM = createConvKernel(sdf,d,nl,nc,nb,dx,dy);
    % IMPORTANT!!!
    % Note that the blur kernels are shifted to accomodate the co-registration
    % of real images with different resolutions.

    % The same for computing the subspace
    FBM2 = createConvKernelSubspace(sdf,nl,nc,nb,dx,dy);

    %% Generate LR MS image FOR SUBSPACE
    % Upsample image via interpolation
    Yinterp = zeros(nl,nc,nb);
    for i=1:nb
        % Yinterp(:,:,i) = ima_interp_spline(Yim{i},d(i));
        % DZ: the line code below requires a good size match between
        % different resolution images
        Yinterp(:,:,i) = imresize(Yim2{i},d(i));  
        clear tmp;
    end
    % Y1 is interpolated no additional blurring
    Y1 = conv2mat(Yinterp,nl,nc,nb);
    clear Yinterp

    % Y2 interpolated images blurred to the same ammount (for subspace)
    Y2 = ConvCM(Y1,FBM2,nl,nc,nb);
    Y2im = conv2im(Y2,nl,nc,nb);
    Y2n = conv2mat(Y2im(limsub+1:end-limsub,limsub+1:end-limsub,:));

    %% SVD analysis
    % Y2n is the image for subspace with the removed border
    [U,~] = svd(Y2n*Y2n'/n);
    U=U(:,1:p);
    clear Y2 Y2im Y2n;

    %% subsampling (insert zeros)
    [M, Y] = createSubsampling(Yim2,d,nl,nc,nb);
    clear M Yim2;

    %% SOLVER
    Xhat_im = solverSupReME(Y,FBM,U,d,lambda,nl,nc,nb,reg_type);
    %% reduce image based on the subspace borders
    %Xhat_im = Xhat_im(limsub+1:end-limsub,limsub+1:end-limsub,:);

    %% unnormalise
    Xhat_im = unnormaliseData(Xhat_im,av);
    Simg{:,b} = Xhat_im;
end 

%% merg the image blocks
blocks = reshape(Simg,N,N);
[rb,cb,nb] = size(blocks{1,1});
Mimg = zeros(rb*N,cb*N,nb);
for i=1:N
  for j=1:N 
    Mimg((rb*(i-1)+1:rb*(i-1)+rb),(cb*(j-1)+1:cb*(j-1)+cb),:) = blocks{i,j};      
  end
end

%% --- END  -------------------------------------------------------



