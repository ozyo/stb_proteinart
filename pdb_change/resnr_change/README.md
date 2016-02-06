Residue numbering in a PDB file does not always match the Uniprot sequences. While some scientists excludes the signal peptide, other do. Using the renumber.py script one can manipulate the starting residue number for each chain. This script uses modeller to renumber the residues.

Often in crystal structures large domains are removed, however the residue number is left consecutive. this script takes a pdb file and outputs a partially renumbered pdb.

***KNOWN ISSUES: when beta field in a pdb file contains 6 digits, partial renumbering fails as it expects a space between z and beta field.