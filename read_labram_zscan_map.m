function [wavenumbers, coordinates, spectra] = read_labram_zscan_map(filename)

file_ID = fopen(filename,'r');

% la prima riga del file di dati contiene la lista dei numeri d'onda
% considerati nella raccolta degli spettri Raman (unita' cm**-1)
wavenumbers = str2num(fgetl(file_ID));

% segue nel file una serie di linee (una per punto misurato) che 
% contengono la coordinata del punto (z) e, successivamente, 
% la sequenza di intensita' Raman misurate per ogni valore del 
% numero d'onda.
idx = 1;
while ~feof(file_ID)
    data = str2num(fgetl(file_ID));
    coordinates(idx,:) = [ data(1) ] * 10.0; % fix units to microns
    spectra(idx,:) = data(2:end);
    idx = idx + 1;
end

fclose(file_ID);

end
