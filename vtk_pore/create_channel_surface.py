import vtk
from draw_pdb import *
#for now we read only one pdb file. Also we need to seperate the points and the radius data from an sph file. These are later stages not VTK issues. They will be fixed when volume rendering app is good enough. 

##first we read the pdb file create everything.

### after pdb file is read we setup the pore volume rendering.

data = vtk.vtkPolyData()
data.SetPoints(molecules_io.read_points("sph_coord.txt"))
data.GetPointData().SetScalars(molecules_io.read_scalars("sph_radii.txt"))

disk = vtk.vtkSphereSource()
disk.SetCenter(0,0,0)
disk.SetRadius(1.0)

diskGlyph = vtk.vtkGlyph3D()
diskGlyph.SetInput(data)
diskGlyph.SetSource(disk.GetOutput())
diskGlyph.SetScaleModeToScaleByScalar()

ctfun = vtk.vtkColorTransferFunction()
ctfun.AddRGBPoint(1.0, 1, 1, 1)
ctfun.AddRGBPoint(2.0, 0.5, 0.0, 0.0)
ctfun.AddRGBPoint(5.5, 1.0, 0.5, 0.5)
ctfun.AddRGBPoint(7.0, 0.9, 0.2, 0.3)
ctfun.AddRGBPoint(9.0, 0.81, 0.27, 0.1)
ctfun.AddRGBPoint(11.0, 0.5, 0.5, 0.5)

delny = vtk.vtkDelaunay3D()
delny.SetInput(diskGlyph.GetOutput())
delny.SetTolerance(1.0)
delny.SetAlpha(2.0)
delny.BoundingTriangulationOff()
delnyMapper=vtk.vtkDataSetMapper()
delnyMapper.SetInput(delny.GetOutput())

volumeMapper=vtk.vtkUnstructuredGridVolumeRayCastMapper()
volumeMapper.SetInput(delny.GetOutput())
volprop=vtk.vtkVolumeProperty()
volprop.SetColor(ctfun)
volprop.SetInterpolationTypeToLinear()


# Create a renderer and add the actors to it
#NTM: I also create the actors in here.
renderer = vtk.vtkRenderer()
renderer.SetBackground(0, 0, 0)
renderer.AddActor(ballActor)
renderer.AddActor(tubeActor)

volume=vtk.vtkVolume()
volume.SetMapper(volumeMapper)
volume.SetProperty(volprop)
renderer.AddVolume(volume)

# Create a render window
render_window = vtk.vtkRenderWindow()
render_window.SetWindowName("Channel Surface")
render_window.SetSize(500, 500)
render_window.AddRenderer(renderer)

# Create an interactor
interactor = vtk.vtkRenderWindowInteractor()
interactor.SetRenderWindow(render_window)

# Initialize the interactor and start the rendering loop
interactor.Initialize()
render_window.Render()
interactor.Start()
