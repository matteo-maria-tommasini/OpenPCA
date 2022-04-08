% reset iniziale
clear; close all; clc;

% (1) caricamento dei dati
%nomi = [ "A" "B" "C" "D" "D2" ];
nomi = [ "A" ];

for idx = 1:length(nomi)
    nome_campione = nomi(idx);

    D = read_labram_zscan_dataset("../../experimental/marmo/"+nome_campione,"txt");
    intensity{idx} = importdata("../../experimental/marmo/"+nome_campione+".xlsx");
    
    for i = 1:length(D)
       %%%%%%%%%%%%%%%%%%%%%%
       % (2) pre-processing %
       %%%%%%%%%%%%%%%%%%%%%%

       % seleziona range di numeri d'onda
       
       % banda a 1087 calc
       xa2 = 1087 - 15;
       xb2 = 1087 + 15;
       
       % banda a 1462 whe 
       xa1 = 1462 - 15;
       xb1 = 1462 + 15;
       
       [D{i}.spectra, D{i}.wavenumber] = ...
          select_range2(D{i}.spectra, D{i}.wavenumber, xa1, xb1, xa2, xb2);

       %%%%%%%%%%%%%%%%%%
       % pre-processing %
       %%%%%%%%%%%%%%%%%%
       D{i}.X = snvcorr(D{i}.spectra);
       
       %%%%%%%%%%%
       % (3) PCA %
       %%%%%%%%%%%

       % analisi PCA: standardizza la fase della prima componente principale
       % in modo che Loading_1(whe) > Loading_1(calcite)
       [D{i}.L, D{i}.S, D{i}.sigma, D{i}.Sigma, D{i}.chi] = ...
           PCA(D{i}.X,D{i}.wavenumber,xa1,xb1,xa2,xb2);
      
    end
    
    data{idx} = D;
    clear D;
end

save('matlab_selected_range.mat', 'data', 'intensity', 'nomi');

%analysis;


 