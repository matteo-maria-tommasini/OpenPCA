function C = snv(S)
   
   % Assumption: S is a vector
   
   % center with respect 
   % the average
   C = S - mean(S);
   
   % divide by the 
   % standard deviation
   C = C ./ std(S);
   
end
