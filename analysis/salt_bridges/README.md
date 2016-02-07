These scripts takes as an input the data from VMD timeline tool. Saltbridge data for two simulations are counted and converted into percantages. Final outut is a tab seperated file (merged.txt) where first coulumn represents the residue pair, second column sim1 and third coulmn sim2. 

Run the script with ./saltbridge.sh but do modify the arguments with your own inputs in the following order:
(0) Simulation 1 (VMD Timeline Salt Bridge data)
(1) Simulation 2 (VMD Timeline Salt Bridge data)
(2) Simulation length

For a test run ./saltbridge.sh sim1.dat sim2.dat 502

*** Known Issues:
--- Double entries for residue pairs exist because VMD reports the existence of salt bridges based on atoms not residues. ASP and ARG residues for example can have multiple salt bridge contacts. As a result the value reported for a saltbridge may exceed 100%. Requires normalization.
