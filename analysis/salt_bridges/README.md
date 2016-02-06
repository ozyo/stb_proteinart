These scripts takes as an input the data from VMD timeline tool. Saltbridge data for two simulations are counted and converted into percantages. Final outut is a tab seperated file where first coulumn represents the residue pair, second column sim1 and third coulmn sim2. Intermediate files for each simulation is also written as tmp_sim1.dat tmp_sim2.dat

*** Known Issues: Double entries for residue pairs exist: VMD reports the existence of salt bridges based on atoms not residues. 

Run the script with ./twist.sh but do modify the arguments with your own inputs in the following order:
(0) Simulation 1 (VMD Timeline Salt Bridge data)
(1) Simulation 2 (VMD Timeline Salt Bridge data)