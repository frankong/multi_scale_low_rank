function [X, X_decom] = gen_hanning( FOV, block_sizes, nblocks, sigma )
% function to generate matrix with multiple rank-1 blocks of hanning window
%
% FOV - size of matrix, eg [32,32]
% block_sizes - eg [1, 1; 4, 4; 32, 32]
% nblocks - number of blocks in each scale
% sigma - noise std
%
% (c) Frank Ong 2015



levels = size(block_sizes,1);

X_decom = zeros([FOV,levels]);

for l = 1:levels
    
    if (block_sizes(l,1) == prod(FOV))
        X_decom(:,:,l) = randn(FOV) * sigma;
    else
        
        for n = 1:nblocks(l)
            
            u = zeros(FOV(1),1);
            v = zeros(FOV(2),1);
            
            block_size1 = block_sizes(l,1);
            block_size2 = block_sizes(l,2);
            
            pos = [(randi(floor(FOV(1)/block_size1),1,2)-1)*block_size1,...
                (randi(floor(FOV(2)/block_size2),1,2)-1)*block_size2];
            
            
            u((1:block_size1) + pos(1)) = hanning(block_size1) ;
            v((1:block_size2) + pos(2)) = hanning(block_size2);
            
            X_decom(:,:,l) = X_decom(:,:,l) + u*v';
            
        end
    end
end

X = sum( X_decom, 3 ) / sqrt(levels) ;