close all; clear all; clc;

load matlab.mat

figure;
hold on
for i=1:length(data)
   scores(i,:) = data{i}.S(:,1)';
end

I = intensity.data(:,4);
S = mean(scores);
Sd = std(scores);
  
plot(I, S,      'ko');
plot(I, S + Sd, 'g-');
plot(I, S - Sd, 'g-');
   
p = linear_fit(I,S);
   
xlabel('whewellite/calcite intensity ratio (manual inspection of spectra)');
ylabel('score value (PC1, average)');
title(sample_name);
hold off;

savepdf("linear_fit_"+sample_name+".pdf");

