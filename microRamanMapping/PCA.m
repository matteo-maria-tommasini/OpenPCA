function [L, S, sigma, Sigma, chi] = PCA(X)
   
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
   
   % calcolo degli scores
   S = chi * L / sqrt(No - 1.0);
   
end
