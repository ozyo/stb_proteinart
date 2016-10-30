cut -f 1 -d ';' zglu_ffbonded.itp | awk '!seen[$0]++' > ligands.ff/ffbonded.itp 
cut -f 1 -d ';' zglu_block.dat | awk '!seen[$0]++' > ligands.ff/ligands.rtp