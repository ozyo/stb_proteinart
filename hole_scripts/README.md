.. _HOLE

HOLE Analysis/Visualisation scripts
***********************************

HOLE is an application to calculate the pore radius (www.smartsci.uk/hole). By the time I have written this scripts, I only had acces to linux binaries of HOLE. It was quite frustrating to copy data back and forth to get a simple rendered image. It was also cumbersome to handle thousands of tiny files for plotting.


FEATURES
========

Plotting
--------
The scripts under this section were started for the purpose of making data handling easier. HOLE has a hole newbsite and a new release as of 2014. There is also MDAnlaysis package I came across. What I have provided here is nowhere near MDAnalysis package obviously. If you want to just plot the minimum radius with positions or a certain region of the pore this script will do the job.

How to Use:
///////////
.. include:: ../hole_scripts/plot/README.md

Pore Visualisation
------------------
The VTK application is a project I started for a course. The idea was and still is to browse through the rendered images just using one application. The current way I get a rendered image of the pore consists of several applications. And again the binaries I had were only for linux at the time. This VTK application would make use of the log outputs and you will have the possiblity of making an animated gif , for example. 

How to Use:
///////////
.. include:: ../hole_scripts/vtk_pore/README.md