@echo off

rem Path to your FreeCAD installation
set FREECADPATH=C:\Program Files\FreeCAD 1.1

rem FreeCAD’s bundled Python executable
set PYTHON="%FREECADPATH%\bin\python.exe"

rem Python search path for FreeCAD modules
set PYTHONPATH="%FREECADPATH%\lib;%FREECADPATH%\Mod"

rem Run the exporter script with all passed arguments
echo %PYTHON% export_scad.py %*
