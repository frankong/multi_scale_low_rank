function Z = blockSVT( Z, block_size, lambda )
% Block-wise singular value thresholding with specified block size
% 
% Inputs:
% Z          -    input matrix
% block_size -    1 x 2 block size
% lambda     -    threshold
%
% (c) Frank Ong 2015
%

blockSVT_fun = @ (X) SVT( X, lambda );

Z = blkproc( Z, block_size, blockSVT_fun);
% blkproc not recommended in Matlab, but way faster than blockproc...
