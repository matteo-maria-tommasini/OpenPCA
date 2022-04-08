% report per capitolo PCA tesi PhD Alessandra Botteon
close all; clear all; clc;

load matlab_selected_range.mat

% principal variances
for id=1:length(data{1})
   table(id,:) = [id sum(data{1}{id}.sigma) data{1}{id}.sigma(1:3)'];
end

% loadings D{i}.spectra
ave = [ data{1}{1}.wavenumber' mean(data{1}{1}.spectra)' ];
 L1 = [ data{1}{1}.wavenumber'      data{1}{1}.L(:,1) ];
 L2 = [ data{1}{1}.wavenumber'      data{1}{1}.L(:,2) ];
 L3 = [ data{1}{1}.wavenumber'      data{1}{1}.L(:,3) ];

hold on
plot(ave(:,1), ave(:,2), 'r-')
plot(ave(:,1), ave(:,2) +  10 * sqrt(data{1}{1}.sigma(1)) * L1(:,2))
plot(ave(:,1), ave(:,2) +  50 * sqrt(data{1}{1}.sigma(1)) * L1(:,2))
plot(ave(:,1), ave(:,2) + 100 * sqrt(data{1}{1}.sigma(1)) * L1(:,2))
plot(ave(:,1), ave(:,2) + 150 * sqrt(data{1}{1}.sigma(1)) * L1(:,2))

save("ave_A_id1_selected_range.txt", 'ave', '-ascii');
save( "L1_A_id1_selected_range.txt", 'L1', '-ascii');
save( "L2_A_id1_selected_range.txt", 'L2', '-ascii');
save( "L3_A_id1_selected_range.txt", 'L3', '-ascii');

