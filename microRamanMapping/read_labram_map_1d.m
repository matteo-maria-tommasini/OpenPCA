function [freq_axis, coordinates, spectra] = read_labram_map_1d(filename)

file_ID = fopen(filename,'r');

% the first line holds the list of the sampled wavenumbers (cm**-1)
freq_axis = str2num(fgetl(file_ID));

% then we have a series of lines, each storing the (x,y) coordinates
% of the point, followed by the Raman intensity data
idx = 1;
while ~feof(file_ID)
    data = str2num(fgetl(file_ID));
    coordinates(idx,:) = [ data(1) 0.0 ];
    spectra(idx,:) = data(2:end);
    idx = idx + 1;
end

fclose(file_ID);

end
