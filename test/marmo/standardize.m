function C = standardize(S)
   
   % Assumption: 
   % the rows of S contain the spectra
   
   % (1) center each variable and divide it by its 
   % standard deviation
   for i=1:size(S,2)
      C(:,i) = (S(:,i) - mean(S(:,i))) ./ std(S(:,i));
   end
   
end
