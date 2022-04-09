function plot_spectra(data)

   figure();
   hold on;
   % plot the single spectra
   for i=1:size(data.spectra,1)
      plot(data.wavenumber, data.spectra(i,:), 'Color', [ 0.5 0.2 0.8 0.15], 'LineWidth', 2);
   end
   
   % plot the average and information about data scatter
   %plot(data.wavenumber, mean(data.spectra),                     'Color', [ 0.0 0.0 0.0 0.25], 'LineWidth', 2);
   %plot(data.wavenumber, mean(data.spectra) + std(data.spectra), 'Color', [ 1.0 0.0 0.0 0.25], 'LineWidth', 2);
   %plot(data.wavenumber, mean(data.spectra) - std(data.spectra), 'Color', [ 1.0 0.0 0.0 0.25], 'LineWidth', 2);
   %plot(data.wavenumber, quantile(data.spectra,0.25), 'Color', [ 0.0 0.0 1.0 0.25], 'LineWidth', 2);
   %plot(data.wavenumber, quantile(data.spectra,0.50), 'Color', [ 0.0 1.0 0.0 0.25], 'LineWidth', 2);
   %plot(data.wavenumber, quantile(data.spectra,0.75), 'Color', [ 0.0 0.0 1.0 0.25], 'LineWidth', 2);
   
   xlabel('wavenumber/cm^{-1}');
   hold off;
end
