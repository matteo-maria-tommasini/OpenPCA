function [freq spectra] = select_range(full_freq, full_spectra, xa, xb)

  id = find(full_freq < xb & full_freq > xa);
  freq = full_freq(id);
  spectra = full_spectra(:,id);
  
end