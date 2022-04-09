function p = linear_fit(x,y)   

   p = polyfit(x,y,1);
   xval = min(x):(max(x)-min(x))/50:max(x);
   yfit = polyval(p,xval);
   
   plot(xval,yfit,'r-');
   text(mean(xval),mean(yfit)+1.5*std(yfit),num2str(p));
end