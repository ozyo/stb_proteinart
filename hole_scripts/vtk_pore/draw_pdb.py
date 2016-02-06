#!/usr/bin/env python
import vtk
import molecules_io
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

