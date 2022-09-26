function [new_spectra, new_coordinates] = remove_saturated(spectra, coordinates)

Nspectra = size(spectra,1);
idx_remove = [ ];

for i=1:Nspectra
    idx_zero = find(spectra(i,:) == 0);
    if (length(idx_zero) > 10)
        idx_remove = [ idx_remove i ];
        disp(i)
    end
end

idx_keep = setdiff(1:Nspectra,idx_remove);
new_spectra = spectra(idx_keep,:);
new_coordinates = coordinates(idx_keep,:);

end