function PCA_scoremap(Sk, Lk, sigma_k, freq_axis, average, coordinates, plotname)

   tiledlayout(1,2);
   
   nexttile;
   %name = "PC " + num2str(k) + " scoremap & loadings";
   %title(name);
   
   x = coordinates(:,1);
   y = coordinates(:,2);
   
   pointsize = 250;
   colormap('copper');
   scatter(x, y, pointsize, Sk, 's', 'filled');
   xlabel('x-position (\mum)');
   ylabel('y-position (\mum)');
   colorbar;

   ax = gca;
   lato_x = max(x) - min(x);
   lato_y = max(y) - min(y);
   if (lato_y / lato_x < 1.0e-2) 
      lato_y = 0.75 * lato_x;
   end
   margin_x = lato_x / 15;
   margin_y = lato_y / 15;
   ax.XLim = [min(x) - margin_x, max(x) + margin_x];
   ax.YLim = [min(y) - margin_y, max(y) + margin_y];
   
   set(ax,'DataAspectRatio',[1 1 1]);
   
   nexttile;
   hold on;
   plot(freq_axis,average',                      'k-');
   plot(freq_axis,average' + sqrt(sigma_k) * Lk, 'r-');
   plot(freq_axis,average' - sqrt(sigma_k) * Lk, 'b-');
   hold off;
   
   savepdf(plotname);
   
end
