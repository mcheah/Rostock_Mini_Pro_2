/*
Info: 
This lib contains things like screws, nuts and bearings.

Improvement:
- wasn't there before

TODO: 
- differentiate between parts that get substracted and normal parts (different diameters)

*/

include <misc_parts_inc.scad>

module screw_M3(length) 
{
    cylinder(d=M3_screw_hole_dia, h=length);
	cylinder(d=M3_nut_hole_dia, h=2.3, center=true, $fn=6);
}
screw_M3(10);

module screw_M4(length) 
{
    cylinder(d=M4_screw_hole_dia, h=length);
	cylinder(d=M4_nut_hole_dia, h=3.3, center=true, $fn=6);
}
translate([0,10,0]) screw_M4(10);


// Bearing - inner Diameter, outer diameter, width
module bearing(ID,OD,W) 
{
    translate([0,0,W/2]) difference() 
    {
        cylinder(d=OD, h=W, center=true);
        cylinder(d=ID, h=W+1, center=true);
    }
}
translate([0,30,0]) bearing(5,16,5);


// unregular cube
// 4 of the 12 edges are rounded
module round_cuboid(x,y,z,r,$fn=48) 
{
    cube([x,y-2*r,z],center=true);
    cube([x-2*r,y,z],center=true);
    cube([x-2*r,y-2*r,z],center=true);
    
    translate([+x/2-r,+y/2-r,0]) cylinder(r=r,h=z,center=true);
    translate([+x/2-r,-y/2+r,0]) cylinder(r=r,h=z,center=true);
    translate([-x/2+r,+y/2-r,0]) cylinder(r=r,h=z,center=true);
    translate([-x/2+r,-y/2+r,0]) cylinder(r=r,h=z,center=true);
}   
translate([0,50,0]) round_cuboid(x=19,y=10,z=30,r=3);

// unregular cube
// all 12 edges are rounded
module round_cuboid3(x,y,z,r,$fn=48) 
{
    cube([x,y-2*r,z-2*r],center=true);
    cube([x-2*r,y,z-2*r],center=true);
    cube([x-2*r,y-2*r,z],center=true);
    
    translate([+x/2-r,+y/2-r,0]) cylinder(r=r,h=z-2*r,center=true);
    translate([+x/2-r,-y/2+r,0]) cylinder(r=r,h=z-2*r,center=true);
    translate([-x/2+r,+y/2-r,0]) cylinder(r=r,h=z-2*r,center=true);
    translate([-x/2+r,-y/2+r,0]) cylinder(r=r,h=z-2*r,center=true);

    translate([+x/2-r,0,+z/2-r]) rotate([90,0,0]) cylinder(r=r,h=y-2*r,center=true);
    translate([+x/2-r,0,-z/2+r]) rotate([90,0,0]) cylinder(r=r,h=y-2*r,center=true);
    translate([-x/2+r,0,+z/2-r]) rotate([90,0,0]) cylinder(r=r,h=y-2*r,center=true);
    translate([-x/2+r,0,-z/2+r]) rotate([90,0,0]) cylinder(r=r,h=y-2*r,center=true);
    
    translate([0,+y/2-r,+z/2-r]) rotate([0,90,0]) cylinder(r=r,h=x-2*r,center=true);
    translate([0,+y/2-r,-z/2+r]) rotate([0,90,0]) cylinder(r=r,h=x-2*r,center=true);
    translate([0,-y/2+r,+z/2-r]) rotate([0,90,0]) cylinder(r=r,h=x-2*r,center=true);
    translate([0,-y/2+r,-z/2+r]) rotate([0,90,0]) cylinder(r=r,h=x-2*r,center=true);
    
    translate([+(x/2-r),+(y/2-r),+(z/2-r)]) sphere(r=r);
    translate([+(x/2-r),+(y/2-r),-(z/2-r)]) sphere(r=r);
    translate([+(x/2-r),-(y/2-r),+(z/2-r)]) sphere(r=r);
    translate([+(x/2-r),-(y/2-r),-(z/2-r)]) sphere(r=r);
    translate([-(x/2-r),+(y/2-r),+(z/2-r)]) sphere(r=r);
    translate([-(x/2-r),+(y/2-r),-(z/2-r)]) sphere(r=r);
    translate([-(x/2-r),-(y/2-r),+(z/2-r)]) sphere(r=r);
    translate([-(x/2-r),-(y/2-r),-(z/2-r)]) sphere(r=r);
}

translate([0,70,0]) round_cuboid3(20,10,15,2);