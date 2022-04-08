close all; clear all; clc;

load matlab_full_range.mat

for sample_id = 1:length(data)
   figure;
   hold on
   for i=1:length(data{sample_id})
      scores(i,:) = data{sample_id}{i}.S(:,1)';
   end
   
   I = intensity{sample_id}.data(:,4);
   S = mean(scores);
   Sd = std(scores);
  
   plot(I, S,      'ko');
   plot(I, S + Sd, 'g-');
   plot(I, S - Sd, 'g-');
   
   p = linear_fit(I,S);
   
   xlabel('intensity ratio (Alessandra)');
   ylabel('score value (PC1, average)');
   title(nomi(sample_id));
   hold off;
   
   savepdf("linear_fit_"+nomi(sample_id)+".pdf");
   
end

