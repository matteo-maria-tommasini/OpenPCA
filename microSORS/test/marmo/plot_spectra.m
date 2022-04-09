function plot_spectra(wavenumber,spectra,pdf_filename)

   figure();
   hold on;
   % plot the single spectra
   for i=1:size(spectra,1)
      plot(wavenumber, spectra(i,:), 'Color', [ 0.5 0.2 0.8 0.15], 'LineWidth', 2);
   end
   
   % plot the average
   plot(wavenumber, mean(spectra),                 'Color', [ 0.0 0.0 0.0 0.25], 'LineWidth', 2);
   plot(wavenumber, mean(spectra) + std(spectra), 'Color', [ 1.0 0.0 0.0 0.25], 'LineWidth', 2);
   plot(wavenumber, mean(spectra) - std(spectra), 'Color', [ 1.0 0.0 0.0 0.25], 'LineWidth', 2);
   plot(wavenumber, quantile(spectra,0.25), 'Color', [ 0.0 0.0 1.0 0.25], 'LineWidth', 2);
   plot(wavenumber, quantile(spectra,0.50), 'Color', [ 0.0 1.0 0.0 0.25], 'LineWidth', 2);
   plot(wavenumber, quantile(spectra,0.75), 'Color', [ 0.0 0.0 1.0 0.25], 'LineWidth', 2);
   
   xlabel('wavenumber/cm^{-1}');
   hold off;
   
   savepdf(pdf_filename);
end
