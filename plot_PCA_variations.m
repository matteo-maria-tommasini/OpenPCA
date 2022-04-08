function plot_PCA_variations(X,wavenumber,chi,sigma,L,S,Ns_selected)

   figure;
   
   switch (Ns_selected)
      case { 1, 2 } 
         tiledlayout(1,2);
      case { 3, 4 }
         tiledlayout(2,2);
      otherwise
         N = ceil(sqrt(Ns_selected));
         tiledlayout(N,N);
   end
   
   for idx=1:Ns_selected
            
      x = wavenumber;
      y_plus  = mean(X) + L(:,idx)' .* sqrt(sigma(idx));
      y_minus = mean(X) - L(:,idx)' .* sqrt(sigma(idx));
      
      nexttile;
      hold on;
      plot(wavenumber, mean(X), 'Color', [ 0 0 0 1.0 ], 'LineWidth', 2);
      plot(wavenumber, y_plus,  'Color', [ 1 0 0 0.5 ], 'LineWidth', 2);
      plot(wavenumber, y_minus, 'Color', [ 0 0 1 0.5 ], 'LineWidth', 2);
      PC_label = sprintf("PC%d",idx);
      labels = [ "ave" "ave+"+PC_label "ave-"+PC_label ];
      if (idx == Ns_selected)
         legend(labels);
      end
      xlabel('wavenumber (cm^{-1})'); 
      ylabel('intensity'); 
      xlim([min(wavenumber) max(wavenumber)]);
      ylim([min([y_plus, y_minus]) max([y_plus, y_minus])]);
      title('Variations along '+PC_label);
      set(gca,'FontSize', 7 + 5 / Ns_selected);
      hold off;
      
   end
   
end
