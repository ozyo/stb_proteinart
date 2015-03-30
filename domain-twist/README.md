This script calculates the Twist angle between transmembrane domain and the extracellular domain of ligand-gated ion channels. As long as two domains are aligned on z compoment of the principal axes in theory it should work.


Run the script with ./twist.sh but do modify the arguments with your own inputs in the following order:
(0) pdb file
(1) trajectory file
(2) output file (extension set as .dat if you want to modify change it in the .tcl file)
(3) transmembrane domain selection
(4) extracelluar domain selection


-- Trajectory and pdb files should be aligned so that the z component of the principal axes is parallel to the pore. The fitting of the trajectory should be done before running this script using Calpha atoms of the protein to the pdb file.
 
-- Selections should be provided without any spaces, with underscores: i.e.: resid_211_to_339. Provide only the residue ids. The script selects the protein and the Calpha atoms by default. 

-- Output file consists of 6 columns: frame, average angle of 5 subunits, indivudual angles of chain A-E. Frame corresponds to the time of the trajectory, but remember that with gromacs trajectories frame 0 is the pdb file loaded, frame 1 is the 0ns of the trajectory.

