function [wavenumbers, coordinates, spectra] = read_labram_zscan(filename)

file_ID = fopen(filename,'r');

% the first row in the txt datafile contains the vector of wavenumbers
% for wich the Raman spectra that follow were all recorded (units 1/cm)
wavenumbers = str2num(fgetl(file_ID));

% the following lines in the txt datafile contain the single Raman spectra
% recorded at single defocusing values (z coordinate). The first number
% in each line holds the z value, the following numbers are the Raman 
% intensities at the wavenumbers defined above
idx = 1;
while ~feof(file_ID)
    data = str2num(fgetl(file_ID));
    coordinates(idx,:) = [ data(1) ] * 10.0; % fix units to microns
    spectra(idx,:) = data(2:end);
    idx = idx + 1;
end

fclose(file_ID);

end
