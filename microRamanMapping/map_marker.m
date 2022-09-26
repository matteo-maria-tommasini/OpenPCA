function map_marker(target_freq, coordinates, freq_axis, spectra)

   id_target = find(abs(freq_axis-target_freq)<0.5);
   
   x = coordinates(:,1);
   y = coordinates(:,2);
   z = spectra(:,id_target(1));
   
   pointsize = 250;
   scatter(x, y, pointsize, z, 's', 'filled');
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
   
end