function plot_PCA_variations(data, Ns_selected)

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
            
      x = data.wavenumber;
      y_plus  = mean(data.X) + data.L(:,idx)' .* sqrt(data.sigma(idx));
      y_minus = mean(data.X) - data.L(:,idx)' .* sqrt(data.sigma(idx));
      
      nexttile;
      hold on;
      plot(x, mean(data.X), 'Color', [ 0 0 0 1.0 ], 'LineWidth', 2);
      plot(x, y_plus,       'Color', [ 1 0 0 0.5 ], 'LineWidth', 2);
      plot(x, y_minus,      'Color', [ 0 0 1 0.5 ], 'LineWidth', 2);
      PC_label = sprintf("PC%d",idx);
      labels = [ "ave" "ave+"+PC_label "ave-"+PC_label ];
      if (idx == Ns_selected)
         legend(labels);
      end
      xlabel('wavenumber/cm^{-1}');
      ylabel('intensity'); 
      xlim([min(data.wavenumber) max(data.wavenumber)]);
      ylim([min([y_plus, y_minus]) max([y_plus, y_minus])]);
      title('Variations along '+PC_label);
      set(gca,'FontSize', 7 + 5 / Ns_selected);
      hold off;
      
   end
   
end
