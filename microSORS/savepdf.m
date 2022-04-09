function savepdf(filename)
   warning('off','MATLAB:print:FigureTooLargeForPage');
   fig = gcf;
   fig.PaperPositionMode = 'auto';
   fig_pos = fig.PaperPosition;
   fig.PaperSize = [fig_pos(3) fig_pos(4)];
   print(fig, filename, '-dpdf');
end

