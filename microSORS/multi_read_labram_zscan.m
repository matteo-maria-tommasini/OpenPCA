function D = multi_read_labram_zscan(path,extension)

   DIR = dir(path+"/*."+extension);
   filenames = fullfile(path, {DIR.name});
   D = {};
   for i=1:length(filenames)
      [wavenumber, coordinates, spectra] = read_labram_zscan(filenames(i));
      [~, name, ~] = fileparts(filenames(i));
      S = struct('name',name,'XYZ',coordinates,'wavenumber',wavenumber,'spectra',spectra);
      D{i} = S;
   end

end