This script calculates the secondary structure information for a trajectory with STRIDE. Output is plotted in the form of sequence logos. For an example see Supplementary Material at Yoluk et al. 2015 DOI:10.1021/acschemneuro.5b00111 . Optionally one can run the script region.sh to extract secondary structure information of the desired region.

Run the script with ./for_seqLogo.sh but do modify the arguments with your own inputs in the following order:
(0) pdb file
(1) trajectory file

Run the script with ./region.sh but do modify the arguments with your own inputs in the following order:
(0) Residue selection
(1) Output


-- Trajetory should be fixed for periodic boundary conditions.
 
-- Selections should be provided without any spaces, with underscores: i.e.: resid_211_to_339. Provide only the residue ids. The script selects the protein and the Calpha atoms by default. 