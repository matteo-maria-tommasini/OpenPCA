function plot_PCA(wavelength,chi,sigma,L,S,spacing)

   [No Nv] = size(chi);

   % (1) grafico degli spettri IR del dataset centrato
   figure()
   hold on;
   for o=1:No
      plot(wavelength, chi(o,:), 'LineWidth', 2);
   end
   xlabel('wavenumber/cm^{-1}'); 
   ylabel('Raman intensity'); 
   savepdf('centered_Raman_spectra.pdf');

   % (2) grafico della matrice di covarianza
   figure()
   hold on;
   imagesc(wavelength,wavelength,cov(chi));
   contour(wavelength,wavelength,cov(chi),25,'k-');
   xlabel('wavenumber/cm^{-1}');
   ylabel('wavenumber/cm^{-1}');
   % la mappa colori di default di Matlab R2018b si chiama 'parula'
   % (altre valide alternative sono: 'copper', 'jet', 'cool')
   colormap('parula');
   colorbar();
   savepdf('covariance_matrix.pdf');
   
   % (3) screeplot
   %Ns = length(sigma);
   Ns = 10;
   figure();
   plot(1:Ns,log10(abs(sigma(1:Ns))),'bo-', 'LineWidth', 2);
   xlabel('PC index (s)'); 
   ylabel('variance'); 
   title('screeplot');
   savepdf('screeplot.pdf');

   % (4a) scatterplot
   figure();
   plot(S(:,1),S(:,2),'ro', 'LineWidth', 2);
   xlabel('PC1 score'); 
   ylabel('PC2 score'); 
   title('scatterplot');
   savepdf('scatterplor.pdf');
   
   % (4b) scatterplot normalizzato
   figure();
   Sprime = S * diag(1.0 ./ sqrt(sigma));
   plot(Sprime(:,1),Sprime(:,2),'ro', 'LineWidth', 2);
   xlabel('normalized PC1 score'); 
   ylabel('normalized PC2 score'); 
   title('normalized scatterplot');
   savepdf('normalized_scatterplot.pdf');
   
   % (5) rappresentazione delle prime componenti principali
   figure();
   hold on;
   plot(wavelength, L(:,1) + 0 * spacing, 'LineWidth', 2);
   plot(wavelength, L(:,2) + 1 * spacing, 'LineWidth', 2);
   plot(wavelength, L(:,3) + 2 * spacing, 'LineWidth', 2);
   plot(wavelength, L(:,4) + 3 * spacing, 'LineWidth', 2);
   xlabel('wavenumber/cm^{-1}'); 
   ylabel('loadings'); 
   title('Representation of the principal components');
   legend(["PC_1" "PC_2" "PC_3" "PC_4"]);
   savepdf('PC.pdf'); 
   
end
