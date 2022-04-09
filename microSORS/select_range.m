function [sel_spectra, sel_wavelength] = select_range(spectra, wavelength, xa, xb)

   id = find(wavelength > xa & wavelength < xb);
   sel_spectra = spectra(:,id);
   sel_wavelength = wavelength(id);

end
