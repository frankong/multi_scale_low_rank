%% Multi-scale Low Rank Matrix Decomposition on Hanning Matrices
%
% (c) Frank Ong 2015
%
clc
clear
close all
setPath

%% Set Parameters
N = 64; % Matrix length
L = log2(N);  % Number of levels
FOV = [N,N]; % Matrix Size

nIter = 50; % Number of iterations

rho = 10; % ADMM parameter


%% Generate Multiscale block Sizes
max_L = L;

% Generate block sizes
block_sizes = [2.^(0:2:max_L)', 2.^(0:2:max_L)'];
disp('Block sizes:');
disp(block_sizes)

levels = size(block_sizes,1);

ms = block_sizes(:,1);

ns = block_sizes(:,2);

bs = prod( repmat(FOV, [levels,1]) ./ block_sizes, 2 );

% Penalties
lambdas = sqrt(ms) + sqrt(ns) + sqrt( log2( bs .* min( ms, ns ) ) );


%% Generate Hanning Blocks

rng(5)
nblocks = [10, 6, 4, 1];

[X, X_decom] = gen_hanning( FOV, block_sizes, nblocks );


figure,imshowf(abs(X),[])
titlef('Input');

figure,imshow3(abs(X_decom),[],[1,levels]),
titlef('Actual Decomposition');
drawnow


%% Initialize Operator

FOVl = [FOV,levels];
level_dim = length(FOV) + 1;


% Get summation operator
A = @(x) sum( x, level_dim ); % Summation Operator
AT = @(x) repmat( x, [ones(1,level_dim-1), levels] ); % Adjoint Operator


%% Iterations

X_it = zeros(FOVl);
Z_it = zeros(FOVl);
U_it = zeros(FOVl);


for it = 1:nIter
    
    % Data consistency
    X_it = 1 / levels * AT( X - A( Z_it - U_it ) ) + Z_it - U_it;
    
    % Level-wise block threshold
    for l = 1:levels
        Z_it(:,:,l) = blockSVT( X_it(:,:,l) + U_it(:,:,l), block_sizes(l,:), lambdas(l) / rho);     
    end
    
    % Update dual
    U_it = U_it - Z_it + X_it;
    
    % Plot
    figure(24),
    imshow3(abs(X_it),[],[1,levels]),
    title(sprintf('Iteration %d',it),'FontSize',14);
    drawnow
    
end

%% Show Result

figure,imshow3(abs(X_it),[],[1,levels]),title('Multi-scale Low Rank Decomposition','FontSize',14);


