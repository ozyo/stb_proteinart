The script calculates the distance between two residues. Residues could be located in different subunits or within the same subunit. 

Run the script with ./distance.sh but do modify the arguments with your own inputs in the following order:
(0) pdb file
(1) trajectory file
(2) output file (extension set as .dat if you want to modify change it in the .tcl file)
(3) type: (intersubunit or intrasubunit)
(4) residue 1
(5) residue 2

-- Trajectory should be fixed for periodic boundary conditions. 

-- Type intersubunit works in counterclockwise manner.
 
-- By default script calculates the CA distances. 

-- Output file consists of 6 columns: frame, averaage distance of 5 subunits, indivudual distance measurements. Frame corresponds to the time of the trajectory, but remember that with gromacs trajectories frame 0 is the pdb file loaded, frame 1 is the 0ns of the trajectory.