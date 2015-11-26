function Z = SVT(Z, lambda )
% Singular Value Thresholding
% Check if upper bound is lower than threshold first
% if not then proceed with SVT

if ( size(Z,1) > size(Z,2) )
    
    ZZ = Z' * Z;
    
else
    ZZ = Z * Z';
end

if (max( sum( abs( ZZ ), 1 ) ) < lambda^2)
    
    Z = Z * 0;
    
else
    
    [U,S,V] = svd( Z, 'econ' );
    
    Z = U * diag(SoftThresh( diag(S), lambda )) * V';
    
end
