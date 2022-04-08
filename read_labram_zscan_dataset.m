function D = read_labram_zscan_dataset(path,extension)

   DIR = dir(path+"/*."+extension);
   filenames = fullfile(path, {DIR.name});
   D = {};
   for i=1:length(filenames)
      [wavenumber, coordinates, spectra] = read_labram_zscan_map(filenames(i));
      [~, name, ~] = fileparts(filenames(i));
      S = struct('name',name,'XYZ',coordinates,'wavenumber',wavenumber,'spectra',spectra);
      D{i} = S;
   end

end