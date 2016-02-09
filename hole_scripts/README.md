.. _HOLE

HOLE Analysis/Visualisation scripts
***********************************

HOLE is an application to calculate the pore radius (www.smartsci.uk/hole). By the time I have written this scripts, I only had acces to linux binaries of HOLE. It was quite frustrating to copy data back and forth to get a simple rendered image. It was also cumbersome to handle thousands of tiny files for plotting. Hence the scripts provided here are the products of the need at the time. I have realized HOLE has got a whole new site and more binaries as of 2014. The plotting script works with the output from versions before 2014, I have not checked the script yet against the new distributions.

Plotting
========
The scripts under this section were started for the purpose of

How to Use:
-----------
.. include:: ../hole_scripts/plot/README.md

Pore Visualisation
==================
The VTK application is a project I started for a course. The idea was and still is to browse through the rendered images just using one application. The current way I get a rendered image of the pore consists of several applications. And again the binaries I had were only for linux at the time. This VTK application would make use of the log outputs and you will have the possiblity of making an animated gif , for example. 

How to Use:
-----------
.. include:: ../hole_scripts/vtk_pore/README.md

vtkPore Application
====================

The purpose of this application is to create series of images to quickly visualise the pore radius with it's surrounding residues.

*   The current version reads only one pdb file, named TM2.pdb
*   You'll need python 2.7 and vtk to run the program.

.. image:: ../source/images/vtk_pore_example.png