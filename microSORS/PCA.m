function [L, S, sigma, Sigma, chi] = PCA(X,wavenumber,xa1,xb1,xa2,xb2)
   
   % dataset centering
   chi = X - mean(X); 
   
   % dataset size 
   % No --> number of observations (e.g., spectra)
   % Nv --> number of variables (e.g. wavenumber channels)
   [No Nv] = size(chi);
   
   % variance-covariance matrix
   Sigma = chi' * chi / (No - 1.0);
   
   % solve the PCA eigenvalue problem
   %           L --> loadings
   % diag(sigma) --> principal variances
   [L sigma] = eig(Sigma);
   
   % sort the eigevalues (sigma) and the eigenvectors (loadings, L) 
   [sigma, idx] = sort(diag(sigma), 'descend');
   L = L(:,idx);
   
   % the following input variables (defined elsewhere) are 
   % required to ensure that the (arbitrary) phase of the 
   % loadings of PC1 is such that:
   % Loading_1(whe,1) > Loading_1(calcite,2)

   % band at 1087 cm**-1 (calcite)
   %       xa2 = 1087 - 15;
   %       xb2 = 1087 + 15;
       
   % band at 1462 cm**-1 (whewellite)
   %       xa1 = 1462 - 15;
   %       xb1 = 1462 + 15;
   L = fix_PCA_reference(L, wavenumber, xa1,xb1, xa2,xb2);
   
   % scores
   S = chi * L / sqrt(No - 1.0);
   
end
