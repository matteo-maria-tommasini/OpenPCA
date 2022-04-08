function [sel_spectra, sel_wavelength] = select_range2(spectra, wavelength, xa1, xb1, xa2, xb2)

   id = find((wavelength > xa1 & wavelength < xb1) | (wavelength > xa2 & wavelength < xb2));
   sel_spectra = spectra(:,id);
   sel_wavelength = wavelength(id);

end
