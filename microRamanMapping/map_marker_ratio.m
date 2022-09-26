function map_marker_ratio(target_freq_a, target_freq_b, coordinates, freq_axis, spectra)

   id_target_a = find(abs(freq_axis-target_freq_a)<0.5);
   id_target_b = find(abs(freq_axis-target_freq_b)<0.5);
   
   x = coordinates(:,1);
   y = coordinates(:,2);
   z_a = spectra(:,id_target_a(1));
   z_b = spectra(:,id_target_b(1));
   
   pointsize = 250;
   scatter(x, y, pointsize, z_a ./ z_b, 's', 'filled');
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