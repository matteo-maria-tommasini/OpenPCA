function plot_covariance(chi,wavenumber)
   figure()
   hold on;
   imagesc(wavenumber,wavenumber,cov(chi));
   %contour(wavenumber,wavenumber,cov(chi),25,'k-');
   xlabel('wavenumber (cm^{-1})');
   ylabel('wavenumber (cm^{-1})');
   colormap('parula');
   colorbar();
   xlim([min(wavenumber) max(wavenumber)]);
   ylim([min(wavenumber) max(wavenumber)]);
   hold off;
end
