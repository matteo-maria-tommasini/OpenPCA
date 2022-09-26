function [freq_axis, coordinates, spectra] = read_renishaw_map(filename)

file_ID = fopen(filename,'r');
data = str2num(fgetl(file_ID)); % first line is skipped

% then we have a series of lines, each storing the (x,y) coordinates
% of the point, followed by the Raman intensity data
row_idx = 1;
col_idx = 1;
data = str2num(fgetl(file_ID));
x = data(1);
y = data(2);
wavenumber = data(3);
intensity = data(4);
freq_axis(1) = wavenumber;
spectra(1,1) = intensity;
coordinates(1,:) = [ x y ];
eps = 0.001;
while ~feof(file_ID)
    data = str2num(fgetl(file_ID));
    if (abs(data(1)-x) > eps | abs(data(2)-y) > eps) % point has changed
       row_idx = row_idx + 1;
       col_idx = 1;
       x = data(1);
       y = data(2);
       coordinates(row_idx,:) = [ x y ];
    else
       col_idx = col_idx + 1;
       if (row_idx == 1) 
           freq_axis(col_idx) = data(3);
       end
       spectra(row_idx,col_idx) = data(4);
    end
end

fclose(file_ID);

end
