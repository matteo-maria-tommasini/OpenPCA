function screeplot(sigma,N)

   figure;
   plot(1:N,sigma(1:N),'b-o','Linewidth',2);
   xlabel('index of the principal component');
   ylabel('principal variance')
   savepdf('screeplot.pdf'); 
   
end