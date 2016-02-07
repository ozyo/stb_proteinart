.. _analysis:

Analysis
********

This is the test file using common markup.

Features
========

Different scripts I use to analyze the simulations of pentameric ligand-gated ion channels are provided here. In future updates these scripts will be free applicable to any type of membrane protein.

Almost all the cases starts the calculation from a pdb and corresponding trajectory file. To reduce the memory requirements and loading times please strip away anythin but the protein from the input files (Depending on the size of the trajectory vmd might crash unexpectedly). Also periodic boundary treatment of the trajectories and fitting to the z axis should be done before running any analysis.

Domain-Twist
------------
.. include:: ../analysis/domain-twist/README.md

Helix-Twist
-----------
.. include:: ../analysis/helix_twist/README.md

Helix-Tilt
----------
.. include:: ../analysis/helix_twist/README.md

Ca-Ca distance
--------------
.. include:: ../analysis/residue_distance/README.md

Salt Bridge Data Plotting
-------------------------
.. include:: ../analysis/salt_bridges/README.md

Secondary Structure Sequence Logos
----------------------------------
.. include:: ../analysis/ss_stride/README.md