import vtk
import molecules_io

#for now we read only one pdb file. Also we need to seperate the points and the radius data from an sph file. These are later stages not VTK issues. They will be fixed when volume rendering app is good enough. 

##first we read the pdb file create everything.

pdb=vtk.vtkPDBReader()
pdb.SetFileName("TM2.pdb")

ball = vtk.vtkSphereSource()
ball.SetRadius(0.25)
ball.SetThetaResolution(8)
ball.SetPhiResolution(8)

ballGlyph = vtk.vtkGlyph3D()
ballGlyph.SetInput(pdb.GetOutput())
ballGlyph.SetColorMode(1)
ballGlyph.SetScaleMode(2)
ballGlyph.SetScaleFactor(0.25)
ballGlyph.SetSourceConnection(ball.GetOutputPort())

ballMapper = vtk.vtkPolyDataMapper()
ballMapper.SetInputConnection(ballGlyph.GetOutputPort())
ballMapper.ImmediateModeRenderingOn()

ballActor = vtk.vtkActor()
ballActor.SetMapper(ballMapper)

tubeFilter =vtk.vtkTubeFilter()
tubeFilter.SetInput(pdb.GetOutput())
tubeFilter.SetRadius(0.15)
tubeFilter.SetNumberOfSides(7)

tubeMapper =vtk.vtkPolyDataMapper()
tubeMapper.SetInputConnection(tubeFilter.GetOutputPort())
tubeMapper.ScalarVisibilityOff()

tubeActor = vtk.vtkActor()
tubeActor.SetMapper(tubeMapper)
tubeActor.GetProperty().SetColor(0.8,0.8,0.8)

tubeActor.GetProperty().SetSpecularColor(1, 1, 1)
tubeActor.GetProperty().SetSpecular(0.3)
tubeActor.GetProperty().SetSpecularPower(20)
tubeActor.GetProperty().SetAmbient(0.2)
tubeActor.GetProperty().SetDiffuse(0.8)

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

#diskMapper=vtk.vtkPolyDataMapper()
#diskMapper.SetInput(diskGlyph.GetOutput())

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

# renderer.AddActor(...)
#diskActor= vtk.vtkActor()
#diskActor.SetMapper(diskMapper)
#renderer.AddActor(diskActor)
#triangulation = vtk.vtkActor()
#triangulation.SetMapper(delnyMapper)
#renderer.AddActor(triangulation)

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
