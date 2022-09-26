% initial clean up of the full workspace
clc; clear all; close all;

%% input of the Raman mapping data

% read from the instrument format (slow)
%[freq_axis, coordinates, spectra] = read_renishaw_map('Cannabis_Trichromes_extmap_10x_0-5lp_10s_10acc_441_crr.txt');
% save to binary format for later use
%save_raman_map('map.mat', freq_axis, coordinates, spectra);

% read in binary format (fast)
load('map.mat'); 


%% rejection of the spectra in the map that show saturation effects
[spectra, coordinates] = remove_saturated(spectra, coordinates);


%% select the wavenumber interval on which PCA is carried out
[freq_axis spectra] = select_range(freq_axis,spectra, 1580, 1700);
%[freq_axis spectra] = select_range(freq_axis,spectra, 1280, 1310);


%% carry out the PCA calculation
[L, S, sigma, Sigma, chi] = PCA(spectra);


%% PCA plots

% screeplot
semilogy(1:8,sigma(1:8),'bo-');
xlabel("PC index");
ylabel("principal variance");


% (1) SCOREMAPS
spacing = 0.01;
NPC_max = 4;
mean_spectrum = mean(spectra);
for k=1:NPC_max
    plotname = "PCA_scoremap_" + num2str(k) + ".pdf";
    figure();
    PCA_scoremap(S(:,k),L(:,k),sigma(k),freq_axis,mean_spectrum,coordinates,plotname);
    title("PCA #"+num2str(k));
end

% (2) plots of the individual LOADINGS (i.e. spectral variations with
% respect to the average spectrum)
for k=1:NPC_max
    plotname = "PCA_loading_" + num2str(k) + ".pdf";
    figure();
    plot(freq_axis,L(:,k),'k-');
    title("PCA Loading "+num2str(k));
    savepdf(plotname);
end

% (3) Average spectrum (computed over the mapped area)
figure(); plot(freq_axis, mean_spectrum, 'k-'); 
xlabel('wavenumber/cm^{-1}');
savepdf('average_spectrum.pdf');
