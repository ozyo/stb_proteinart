Hole is an application to calculate the pore radius. Calculation of pore radius over a trajectory is handled via individual pdb files, therefore the output requires a bit of data parsing before plotting. 

Plotting via matriks file gives a surfrace rendered plot, requires gnuplot.
Plotting via log files of a certain region is done entireley in python (Should be possible to combine with matplotlib, in a future update...)
vtkPore is a baby vtk application to render the surfaces calculated by HOLE for visualization.