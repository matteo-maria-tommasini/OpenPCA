function C = snvcorr(S)
   
   % Assumption: 
   % the rows of S contain the spectra
   
   % (1) center each spectrum with respect 
   % to its average
   for i=1:size(S,1)
      C(i,:) = S(i,:) - mean(S(i,:));
   end
   
   % (2) divide each spectrum by its 
   % standard deviation
   for i=1:size(C,1)
      C(i,:) = C(i,:) ./ std(C(i,:));
   end
   
end
