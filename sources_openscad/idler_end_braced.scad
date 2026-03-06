/*
Info: 
This part sits at the upper end of the rods, below the top-plate. You need 3 of these.

Improvement:
- fins offers extra stability during the print (4 mounting screws instead of 2)
- direct mounting-platform for small hal-sensor-pcb

TODO: 
- give information on the hal-sensor-project

*/

idler_end_height = 30;
nn=5;

tilt = 0;
$fa=10;
$fs=0.1;
hole_r=2.4;//4
nnn = 0.0;
include <bracket_inc.scad> 
use <bracket.scad>
include <misc_parts_inc.scad>
use <misc_parts.scad>
use <prism.scad>
use <endstop_template.scad>
use <pulley_spacer.scad>
module bearing_mount() 
{
    rotate([90 - tilt, 0, 0]) union() 
    {  
        translate([0, 0, 2.3]) cylinder(r1=12, r2=9, h=1.1, center=true);
        translate([0, 0, -2.3]) cylinder(r1=9, r2=12, h=1.1, center=true);
        translate([0,0,2.3+1.1/2])
        pulley_spacer();        
    }
}
translate([50, 0, idler_end_height/2]) bearing_mount();

module bearing_mount_draft() {
    hi = idler_end_height; // Total height.
    translate([0,-(2.3-1.1/2),-hi/2-nnn/2]) {
        difference() {
            union() {
            translate([-8/2,-1.1-9.0,0])
            cube([8,(1.1+9.0),hi/2+nnn/2]);
            }

            color("blue")
            rotate([atan((1.1+9.0-1.1/2)/((hi/2+nnn/2)-(4))),0,0])
            translate([-8/2,-1.1-9.0-1.1/2,0])
            cube([8,1.1+9.0,hi+nnn]);
            //translate([0,2.3-1.1/2,hi/2+nnn/2])
            //bearing_mount_hole();
        }
        translate([0,2.3-1.1/2,hi/2+nnn/2])
        color("green")
        bearing_mount();
    }
}
color("green")
translate([0, 7.5, idler_end_height/2]) bearing_mount_draft();

module bearing_mount_hole()  
{
    rotate([90 - tilt, 0, 0]) cylinder(r=hole_r, h=40, center=true);
}
translate([0,0,idler_end_height/2]) bearing_mount_hole();

module idler_end() 
{
	difference() {
        hi = idler_end_height; // Total height.
        wr = rod_distance;
        translate([0, 0, hi/2]) difference() 
        {
            union() 
            {
                translate([0,0,nn/2]) bracket(hi+nn);
                translate([+wr/2,10,-hi/2]) mirror([1,0,0]) diagonal_fin3(30,7,40,30,3.0,5,+wr/2);
                translate([-wr/2,10,-hi/2]) diagonal_fin3(30,7,40,30,3.0,5,+wr/2);
                translate([0, 7.5, 0]) bearing_mount_draft();
            }    

            translate([0, 8, 0]) bearing_mount_hole();
        
            for (i = [-1, 1]) for (z = [-8,8])
                translate([i*(+wr/2-6),-6, z]) rotate([0,i*90,0]) screw_M3(25);
        }
        //subtract holes to mount pcb endstop
        #translate([-23.5,0,(idler_end_height+nn)])
        color("green")
        rotate([270,0,0])
        mirror([0,0,0]) {
            #endstop_holes(15);
            translate([0,0,10.0015-2.1])
            pin_holes(15);
        }
    }
}

translate([0,50,0]) idler_end();