% reset iniziale
clear; close all; clc;

% (1) caricamento dei dati
nomi = [ "A" "B" "C" "D" "D2" ];

for idx = 1:length(nomi)
    nome_campione = nomi(idx);

    D = read_labram_zscan_dataset("../../experimental/marmo/"+nome_campione,"txt");
    intensity{idx} = importdata("../../experimental/marmo/"+nome_campione+".xlsx");
    
    save_alessandra_data(:,1) = D{idx}.XYZ;

    for i = 1:length(D)
       %%%%%%%%%%%%%%%%%%%%%%
       % (2) pre-processing %
       %%%%%%%%%%%%%%%%%%%%%%

       % seleziona range di numeri d'onda
       %xa = min(D{i}.wavenumber);
       %xb = max(D{i}.wavenumber);
       %[D{i}.spectra, D{i}.wavenumber] = ...
       %    select_range(D{i}.spectra, D{i}.wavenumber, xa, xb);
    
       % banda a 1087 calc
       xa2 = 1087 - 15;
       xb2 = 1087 + 15;
       
       % banda a 1462 whe 
       xa1 = 1462 - 15;
       xb1 = 1462 + 15;
       
       [D{i}.spectra, D{i}.wavenumber] = ...
          select_range2(D{i}.spectra, D{i}.wavenumber, xa1, xb1, xa2, xb2);

       % grafico spettri
       plot_spectra(D{i}.wavenumber, ...
          D{i}.spectra, "input_spectra_"+D{i}.name+".pdf");

       %%%%%%%%%%%%%%%%%%
       % pre-processing %
       %%%%%%%%%%%%%%%%%%
       %D{i}.X = D{i}.spectra; % no action  
       %D{i}.X = normalize_spectra(D{i}.spectra);
       D{i}.X = snvcorr(D{i}.spectra);
       %D{i}.X = standardize(D{i}.spectra);

       % grafico spettri processati
       plot_spectra(D{i}.wavenumber, D{i}.X, "processed_spectra_"+D{i}.name+".pdf");

       %%%%%%%%%%%
       % (3) PCA %
       %%%%%%%%%%%

       % analisi PCA: standardizza la fase della prima componente principale
       % in modo che Loading_1(whe) > Loading_1(calcite)
       [D{i}.L, D{i}.S, D{i}.sigma, D{i}.Sigma, D{i}.chi] = ...
           PCA(D{i}.X,D{i}.wavenumber,xa1,xb1,xa2,xb2);
       
       figure;
       hold on;
       plot(D{i}.wavenumber,D{i}.L(:,1),'k-');
       hold off;
       savepdf("loadings_1_"+D{i}.name+".pdf");
          
       
       %%%%%%%%%%%
       % grafici %
       %%%%%%%%%%%
       plot_covariance(D{i}.chi,D{i}.wavenumber);
       savepdf("covariance_"+D{i}.name+".pdf");
    
       screeplot(D{i}.sigma,10);
       savepdf("screeplot_"+D{i}.name+".pdf");
    
       % grafico delle variazioni lungo le componenti principali
       Ns_selected = 3;
       plot_PCA_variations(D{i}.X,D{i}.wavenumber,D{i}.chi,D{i}.sigma,D{i}.L,D{i}.S,Ns_selected);
       savepdf("PC_variations_"+D{i}.name+".pdf"); 

       close all;
       
       save_alessandra_data(:,1+i) = D{i}.S(:,1);
       save_alessandra_nomi_campioni(i) = D{i}.name;
       
    end
    save("alessandra_scores_"+nome_campione+".txt", 'save_alessandra_data', '-ascii');
    clear save_alessandra_data; 
    
    fid=fopen('alessandra_nomi_campioni_'+nome_campione+'.txt','w');
    for i=1:length(save_alessandra_nomi_campioni)
       fprintf(fid,"%s\n",save_alessandra_nomi_campioni(i));
    end
    fclose(fid);
    clear save_alessandra_nomi_campioni;
    
    plot_report(D);
    savepdf("report_"+nome_campione+".pdf"); 

    plot_report2(D);
    savepdf("report2_"+nome_campione+".pdf"); 

    plot_report3(intensity{idx},D)
    savepdf("report3_"+nome_campione+".pdf"); 
    
    data{idx} = D;
    clear D;
end

save('matlab.mat', 'data', 'intensity', 'nomi');

analysis;


 