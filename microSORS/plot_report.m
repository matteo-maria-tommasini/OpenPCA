function plot_report(D)

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
   
   for i=1:length(D)
      S1(i,:) = D{i}.S(:,1)';
      S2(i,:) = D{i}.S(:,2)';
      S3(i,:) = D{i}.S(:,3)';
   end
   for i=1:length(D)
      plot(-D{i}.XYZ,S1(i,:),'b-');
      plot(-D{i}.XYZ,S2(i,:),'r-');
      plot(-D{i}.XYZ,S3(i,:),'g-');
   end
   plot(-D{i}.XYZ, mean(S1), 'k-', 'LineWidth', 2);
   plot(-D{i}.XYZ, mean(S1) + std(S1), 'k-', 'LineWidth', 2);
   plot(-D{i}.XYZ, mean(S1) - std(S1), 'k-', 'LineWidth', 2);
   
   ylim([-4 8]);
   hold off;
   
end