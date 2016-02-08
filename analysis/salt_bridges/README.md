Run the script with:
``./salt_bridge.sh sim1 sim2 length``

(0) Sim1: VMD Timeline Salt Bridge data
(1) Sim2: VMD Timeline Salt Bridge data
(2) length: Simulation length

Output Format: Final outut is a tab seperated file (merged.txt) where first coulumn represents the residue pair, second column sim1 and third coulmn sim2.

**KNOWN ISSUES**

- Double entries for residue pairs exist because VMD reports the existence of salt bridges based on atoms not residues. ASP and ARG residues for example can have multiple salt bridge contacts. As a result the value reported for a saltbridge may exceed 100%. Requires normalization.

- Simulations are assumed to be of equal length.