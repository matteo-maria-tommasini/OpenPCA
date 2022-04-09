close all; clear all; clc;

load matlab.mat

tiledlayout(4,3)
for i=1:length(data)
    nexttile;
    title_string = data{i}.name;
    screeplot(data{i}.sigma,10,title_string);
end
savepdf('screeplot.pdf'); 


tiledlayout(4,3)
for i=1:length(data)
    nexttile;
    title_string = data{i}.name;
    cumulative_screeplot(data{i}.sigma,10,title_string);
end
savepdf('cumulative_screeplot.pdf'); 


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

