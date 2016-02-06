from modeller import *
from modeller.automodel import *
log.verbose()
env = environ()
env.io.atom_files_directory = ['~/Models/GABAAR/A2B1A2B1G2/M3-M4_GLUCLb/m4TNV_sim/rosetta_refine']

mdl = model(env, file='GABAaR-A2B1A2B1G2_H.sapiens.B99990002_0001.pdb')
mdl.rename_segments(segment_ids=('A', 'B','C','D','E'),renumber_residues=[12,10,12,10,25])
mdl.write(file='GABAaR-A2B1A2B1G2_H.sapiens.B99990002_0001_rnr.pdb')
