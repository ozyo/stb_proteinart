This script calculates the tilt angle of the transmembrane helices relative to the channel axis in pentameric ligand-gated ion channels. The tilt angle is defined between on the xz plane of helical axis and the channel axis (pore). Script is hardcoded to work with 5 chains for now. 

Run the script with ./helix_twist.sh but do modify the arguments with your own input parameters in the following order:
(0) pdb file
(1) trajectory file
(2) output file 
(3) Helix selection

-- Trajectory and pdb files should be aligned so that the z component of the principal axes is parallel to the pore. The fitting of the trajectory should be done before running this script using Calpha atoms of the protein to the pdb file.
 
-- Selections should be provided without any spaces, with underscores: i.e.: resid_211_to_339. Provide only the residue ids. The script selects the protein and the Calpha atoms by default. 

-- Output file consists of 6 columns: frame, average angle of 5 helices, indivudual angles of chain A-E. Frame corresponds to the time of the trajectory, but remember that with gromacs trajectories frame 0 is the pdb file loaded, frame 1 is the 0ns of the trajectory.