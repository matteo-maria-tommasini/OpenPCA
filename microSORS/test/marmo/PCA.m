% standardizzare la fase della prima componente principale
% in modo che Loading_1(whe,1) > Loading_1(calcite,2)

% banda a 1087 calc
%       xa2 = 1087 - 15;
%       xb2 = 1087 + 15;
       
% banda a 1462 whe 
%       xa1 = 1462 - 15;
%       xb1 = 1462 + 15;
           
function [L, S, sigma, Sigma, chi] = PCA(X,wavenumber,xa1,xb1,xa2,xb2)
   
   % definizione del dataset centrato
   chi = X - mean(X); 
   
   % dimensioni del dataset 
   % (numero di osservazioni, numero di variabili)
   [No Nv] = size(chi);
   
   % matrice di covarianza tra le variabili
   Sigma = chi' * chi / (No - 1.0);
   
   % soluzione del problema agli autovalori
   %           L --> loadings
   % diag(sigma) --> varianze delle componenti principali
   [L sigma] = eig(Sigma);
   
   % ordina gli autovalori (sigma) e gli autovettori (loadings, L) 
   [sigma, idx] = sort(diag(sigma), 'descend');
   L = L(:,idx);
   
   L = fix_PCA_reference(L, wavenumber, xa1,xb1, xa2,xb2);
   
   % calcolo degli scores
   S = chi * L / sqrt(No - 1.0);
   
end
