This script should work with any pore calculations. To generate the surface you'll need the pore coordinates and the corresponding radii of these coordinates.

If you are using HOLE, process the log file to seperate the coordinates from radii. Supply them as sph_coord.txt and sph_radii.txt If you want to see the residues around the pore select only the pore lining secondary structures and save them as TM2.pdb Both sph_*.txt and TM2.pdb files should be at the same folder as the .py files. 

Run the script with python: python create_channel_surface.py An interactive window will start. Write know there are no active interactions implemented. In the future the script will be able to read a trajectory and calculate the pore radii on the fly.

Note that script requires python 2.7 and VTK. 