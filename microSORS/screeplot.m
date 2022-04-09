function screeplot(sigma,N,title_string)
   semilogy(1:N,sigma(1:N),'b-o','Linewidth',2);
   xlabel('PC index');
   ylabel('PC variance');
   title(title_string, 'interpreter', 'none');
   xlim([1 N]);
end