function Z = blockSVT3( Z, block_size, lambda )
% Block-wise 3D singular value thresholding with specified block size
% Always reshapes the first two dimensions into column and third dimension
% as row
%
% Inputs:
% Z          -    input matrix
% block_size -    1 x 3 block size
% lambda     -    threshold
%
% (c) Frank Ong 2015
%

% Assumes the third dimension is not decimated use blockproc interface
if (block_size(3) == size(Z, 3))
    blockSVT_fun = @ (X) reshape( SVT( ...
        reshape(X.data, size(X.data,1)*size(X.data,2),size(X.data,3)), lambda ), size(X.data) );
    
    Z = blockproc( Z, block_size(1:2) , blockSVT_fun);
    
else
    for k = 1:block_size(3):size(Z,3)
        for j = 1:block_size(2):size(Z,2)
            for i = 1:block_size(1):size(Z,1)
                iend = min( i + block_size(1)-1, size(Z,1) );
                jend = min( j + block_size(2)-1, size(Z,2) );
                kend = min( k + block_size(3)-1, size(Z,3) );
                
                b1 = iend - i + 1;
                b2 = jend - j + 1;
                b3 = kend - k + 1;
                
                Z( i:iend, j:jend, k:kend ) = reshape( SVT( reshape( Z( i:iend, j:jend, k:kend ), ...
                    b1*b2, b3), lambda), b1,b2,b3 );
                
            end
        end
    end
    
end