function [spectra, wavelength] = load_spectra(filenames)

Nfiles = length(filenames);
for i=1:Nfiles
   filename = filenames(i);
   w = load(filename);
   if (i == 1)
       D = w;
   else
       D = [ D w(:,2) ];
   end
end

Nspectra = size(D,2) - 1;
wavelength = D(:,1);
spectra = D(:,2:end)';

return

