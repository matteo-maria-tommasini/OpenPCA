function save_loading(freq_axis, L, id)
   data = [ freq_axis L(:,id) ];
   filename = "loading-"+num2str(id)+".txt";
   fid = fopen(filename,'w');
   for i=1:size(data,1);
      fprintf(fid,"%f %f\n", data(i,1), data(i,2));
   end
   fclose(fid);
end
