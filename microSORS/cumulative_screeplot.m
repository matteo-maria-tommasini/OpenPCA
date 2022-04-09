function cumulative_screeplot(sigma,N,title_string)
   for i=1:N 
      explained_variance(i) = 100.0 * sum(sigma(1:i)) / sum(sigma); 
   end
   plot(1:N,explained_variance(1:N),'b-o','Linewidth',2);
   xlabel('PC index');
   ylabel('explained variance (%)');
   title(title_string, 'interpreter', 'none');
   xlim([1 N]);
end