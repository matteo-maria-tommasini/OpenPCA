% reset iniziale
clear; close all; clc;

% (1) load Raman datasets corresponding to 10 z-scan defocusing
%     experiments on different sample locations
D = read_labram_zscan_dataset("test/marble/","txt");

% read Raman intensities manually determined by inspection of
% individual spectra
intensity = importdata("test/marble/sample_A.xlsx");
names = [ "A" ];


% (2) carry out data selection (wavenumber range) and PCA
%     on each z-scan experiment
for i = 1:length(D)

   % seleziona range di numeri d'onda
   xa = min(D{i}.wavenumber);
   xb = max(D{i}.wavenumber);
   [D{i}.spectra, D{i}.wavenumber] = ...
           select_range(D{i}.spectra, D{i}.wavenumber, xa, xb);

   % optional: apply standard normal variate correction to each Raman
   %           spectrum. The so-called Standard Normal Variate (SNV) method 
   %           performs a normalization of the spectra that consists in subtracting 
   %           each spectrum by its own mean and dividing it by its own standard deviation. 
   %           After SNV, each spectrum will have a mean of 0 and a standard 
   %           deviation of 1. See also https://doi.org/10.1366%2F15-07905
   %D{i}.X = snvcorr(D{i}.spectra);
   D{i}.X = D{i}.spectra; % no correction
   
   % (3) apply PCA
   
   % 1087 cm**-1 line (calcite)
   xa2 = 1087 - 15;
   xb2 = 1087 + 15;
       
   % 1462 cm**-1 line (whewellite) 
   xa1 = 1462 - 15;
   xb1 = 1462 + 15;
   
   % analisi PCA: standardizza la fase della prima componente principale
   % in modo che Loading_1(whe) > Loading_1(calcite)
   [D{i}.L, D{i}.S, D{i}.sigma, D{i}.Sigma, D{i}.chi] = ...
           PCA(D{i}.X,D{i}.wavenumber,xa1,xb1,xa2,xb2);
end

data = D;

save('matlab_full_range.mat', 'data', 'intensity', 'names');


 