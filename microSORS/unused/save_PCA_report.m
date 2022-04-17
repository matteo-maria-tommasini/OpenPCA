function save_PCA_report(S,filenames,N)

fid = fopen('report.txt','w');
for i=1:length(filenames)
   fprintf(fid, '%s ',filenames(i));
   for k=1:N
      fprintf(fid, '%10.6f', S(i,k));
   end
   fprintf(fid, '\n');
end
fclose(fid);

end