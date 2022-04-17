# OpenPCA/microSORS
 This is a collection of Matlab scripts for PCA analysis, specialized to the case of a series of SORS spectra measured by defocusing steps with a Horiba Jobin-Hyvon LABRAM micro-Raman equipment.

 List of m-files (top-down ordering)
 ===================================

## The two data analysis scripts that should be run one atfer the other
main_1_load_data_and_run_PCA.m  
main_2_analysis.m

## The set of the supporting functions

### handle the reading of micro-SORS data (Labram instrument)
multi_read_labram_zscan.m       
read_labram_zscan.m             

### plot the set of micro-SORS spectra
plot_spectra.m

## pre-processing of data

### select wavenumber range (either single or double)
select_range.m                  
select_range2.m                 

### SNV correction (Standard Normal Variate correction, see [1,2])
snvcorr.m                       
snv.m

### carry out PCA analysis and plot the results
PCA.m                           
screeplot.m                     
cumulative_screeplot.m
fix_PCA_reference.m

### save current plots on pdf files (e.g. to document the results of Matlab runs)
savepdf.m


# Author contact details
 Prof. Matteo Tommasini  
 Dipartimento di Chimica, Materiali e Ingegneria Chimica "G. Natta"  
 Politecnico di Milano, Piazza Leonardo da Vinci 32, 20133 Milano, Italy  
 email: matteo.tommasini@polimi.it  


# References

[1] Barnes RJ, Dhanoa MS, Lister SJ: Standard Normal Variate Transformation and De-trending of Near-Infrared Diffuse Reflectance Spectra. Appl Spectrosc 1989, 43(5):772-777.

[2] https://www.americanpharmaceuticalreview.com/Featured-Articles/116330-Practical-Considerations-in-Data-Pre-treatment-for-NIR-and-Raman-Spectroscopy/


