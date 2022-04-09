function L = fix_PCA_reference(L, wavenumber, xa1,xb1, xa2,xb2)

   id1 = find(wavenumber < xb1 & wavenumber > xa1);
   id2 = find(wavenumber < xb2 & wavenumber > xa2);

   L1 = mean(L(id1, 1));
   L2 = mean(L(id2, 1));

   if (L1 < L2)
      L(:,1) = -L(:,1);
   end

end
