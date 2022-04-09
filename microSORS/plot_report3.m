function plot_report3(intensity,D)

   figure;
   hold on;
   % fix score reference
   for i=1:length(D)
      if (D{i}.S(1,1) < 0)
         D{i}.S(:,1) = -D{i}.S(:,1);
         D{i}.L(:,1) = -D{i}.L(:,1);
      end
      if (D{i}.S(1,2) < 0)
         D{i}.S(:,2) = -D{i}.S(:,2);
         D{i}.L(:,2) = -D{i}.L(:,2);
      end
   end
   
   % store the PC1 scores
   for i=1:length(D)
      S1(i,:) = D{i}.S(:,1)';
   end
   
   plot(-D{i}.XYZ, snv(mean(S1)),           'g-', 'LineWidth', 2);
   plot(-D{i}.XYZ, snv(mean(S1) + std(S1)), 'k-', 'LineWidth', 1);
   plot(-D{i}.XYZ, snv(mean(S1) - std(S1)), 'k-', 'LineWidth', 1);
   plot(intensity.data(:,1), snv(intensity.data(:,4)), 'r-', 'LineWidth', 2);
   
end