# OpenPCA/microSORS
 This is a collection of Matlab scripts for PCA analysis, specialized to the case of a series of SORS spectra measured by defocusing steps with a Horiba Jobin-Hyvon LABRAM micro-Raman equipment.

 List of m-files (top-down ordering)
 ===================================

## the two data analysis scripts that should be run one atfer the other
main_1_load_data_and_run_PCA.m  
main_2_analysis.m

## the set of the supporting functions
### handle the reading of micro-SORS data (Labram instrument)
multi_read_labram_zscan.m       
read_labram_zscan.m             

### plot the set of micro-SORS spectra
plot_spectra.m

## pre-processing of data
### SNV correction (see )
snvcorr.m                       
snv.m      

### select wavenumber range (either single or double)
select_range.m                  
select_range2.m                 

### carry out PCA analysis and plot the results
PCA.m                           
screeplot.m                     
cumulative_screeplot.m
fix_PCA_reference.m

### save current plots on pdf files (i.e. archives results of Matlab runs)
savepdf.m                       



Unused (to be deleted soon)
load_spectra.m                                 
normalize_spectra.m             
plot_report2.m                  
plot_report3.m                  
linear_fit.m                    
save_PCA_report.m               
plot_PCA_variations.m           
plot_covariance.m               
plot_report.m                   


# Author contact details:
 Prof. Matteo Tommasini  
 Dipartimento di Chimica, Materiali e Ingegneria Chimica "G. Natta"  
 Politecnico di Milano, Piazza Leonardo da Vinci 32, 20133 Milano, Italy  
 email: matteo.tommasini@polimi.it  
 


