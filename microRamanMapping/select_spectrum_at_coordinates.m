function R = select_spectrum_at_coordinates(coordinates,spectra,freq_axis,x0,y0)

   % locate the spectra indexes at points nearby (x0, y0)
   delta = ( coordinates - [ x0 y0 ] );
   for i=1:size(delta,1)
      distance(i) = sqrt(delta(i,1)^2 + delta(i,2)^2);
   end
   
   [ d_min, id ] = min(distance);
   if (d_min > 2.5)
       disp("Warning: selected point at distance > 2.5 um from (x0,y0");
   end
   
   R(:,1) = freq_axis;
   R(:,2) = spectra(id,:)';
   
end
