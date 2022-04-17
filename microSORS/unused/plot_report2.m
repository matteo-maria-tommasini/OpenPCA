function plot_report2(D)

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
      
      plot(S1(i,:), S2(i,:), 'k-o');
   end
   
end