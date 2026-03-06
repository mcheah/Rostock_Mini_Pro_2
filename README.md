# RepRap Delta Rostock Mini Pro 2

This project has been modified with the goal of producing .step file outputs compatible with modern CAD software.  See [sources_step](sources_step/README.md) for more details.

This project offers an improved, redesigned and cleaned fork of the original sources.

### Based on the following projects:
- Rostock Mini Pro 2 (orgua) [github](https://github.com/orgua/Rostock_Mini_Pro_2)
- Rostock Mini Pro (CZAR) [thingiverse](http://www.thingiverse.com/thing:318971)
- Rostock Mini (bwevans) [thingiverse](http://www.thingiverse.com/thing:32850/) 
- Rostock (Johann) [thingiverse](http://www.thingiverse.com/thing:17175), [github](https://github.com/jcrocholl/rostock)

### Used Software: 
- [Fusion 360](https://www.autodesk.com/products/fusion-360/)
- [OpenSCAD](http://www.openscad.org) 2026.02.19 (git 10cc3aa8)
- [FreeCAD](https://www.freecad.org/) 1.1.0rc2
- [Inkscape](https://inkscape.org) 0.91

### Changes compared to Mini Pro 2 (orgua)
- Exported all scad files to .step for import into fusion 360
- Generated fusion 360 assemblies for all main components
- Added a braced version of the idler end bracket for better stiffness
- Replaced magnetic endstop with Makerbot style pcb mechanical endstop
- updated bwevan's frame generation scad to top-mounted extruders
- Added a WIP platform with 50mm radial fans

### Improvements in comparison to the Mini Pro:
- openSCAD-code base reworked
   - more modular design and more parametric
   - better documentation
   - cleaner code, no missing dependencies, less dead code
   - it's easier to make own mods
- included [bill of material](sources_bom/readme.md) and links (for orientation)
- included marlin-config (for orientation) 
- included redesign of [bottom and top plate](sources_inkscape/readme.md) (Inkscape svg)
- more space under the printer (there is just USB and power coming out of mine)
   - this design allows shorter wires to the motors and results in better EMC
   - shock absorbing standoffs (if printed with soft PLA)
   - better cooling for motors
   - allows active cooling for motor-drivers
- better stability, less wiggle, stiffer frame, better print-quality
   - better fin-design for all plate-connecting parts
   - design of hotend-mount is much more sturdy 
   - allow two lm8uu per rod (4 per carriage)
- the fan of the E3D-Hotend fits between hotend-mount and platform
   - hotend is lifted and print-space in z-direction is bigger 
- included space / cutout for nuts on more places
- hal-sensor-end-stops with better repeatability 
- better cable-management
- includes a filament-holder on top of the printer
- direct mounting at carriage of open belt-ends with zip-ties (with belt_mount_for_carriage.scad) 
   - groves secure belt-mount 
- built in power-switch next to the heat-bed

### Still to do: 
- include cooling into platform
- add more pictures
- further optimize the code 
- document hal-sensor-board
- motor-mount: add even more space above the motor for better cooling

### Pictures (in progress):

![Front](/assembly_pictures/DSC08004.jpg)

![TOP](/assembly_pictures/DSC07994.jpg)

![DETAIL](/assembly_pictures/DSC07998.jpg)
