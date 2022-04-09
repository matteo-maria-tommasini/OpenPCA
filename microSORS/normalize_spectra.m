function X = normalize_spectra(spectra)

   % normalizzazione tra 0 e 1 di ciascuna riga della 
   % matrice degli spettri
   for i=1:size(spectra,1)
      w = spectra(i,:);
      X(i,:) = (w - min(w)) ./ (max(w) - min(w)); 
   end

return


