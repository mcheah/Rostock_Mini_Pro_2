FREECADPATH=/Applications/FreeCAD.app/Contents
PYTHON="$FREECADPATH/Resources/bin/python"
PYTHONPATH="$FREECADPATH/Resources/lib:$FREECADPATH/Resources/Mod"
$PYTHON export_scad.py "$@"