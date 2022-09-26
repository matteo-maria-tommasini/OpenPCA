function sel_spectra = select_spectra_based_on_score(spectra, S, threshold, PC_id)
    id_spectra = find(S(:,PC_id) > threshold(1) & S(:,PC_id) < threshold(2));
    sel_spectra = spectra(id_spectra,:);
end