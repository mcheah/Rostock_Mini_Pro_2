/*
Two of these spacers are placed between platform and hotend-mount.

Improvement: 
- offers an offset for the hotend-mount
- the fan of the E3D-Hotend fits between mount and platform 

TODO:
-
*/

$fn=48;
use <misc_parts.scad>

module mount_spacer()
{
    difference() 
    {
        round_cuboid(x=19,y=10,z=34,r=3);
        cylinder(d=3,h=40,center=true);
        scale([1,1,1.4]) rotate([90,0,0]) cube([12,12,20],center=true);
//        scale([1,1,1.4]) rotate([90,0,0]) cylinder(d=12,h=20,center=true);
        translate([0,0,2.3/2+6*1.4-0.3]) screw_M3(10);
        
        rotate([180,0,0]) translate([0,0,2.3/2+6*1.4-0.3]) screw_M3(10);
    }
}

mount_spacer();
//translate([0,0,2.3/2+6*1.4-0.3]) screw_M3(10);