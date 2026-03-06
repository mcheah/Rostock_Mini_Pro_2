/* 
Info: 
This part is just a template for the other parts of the linear drive.

Improvement: 
- diagonal fin is parametrised and reusable
- remove screw-models --> put in misc-parts

TODO: 
- 
*/

$fn = 36;
$fa = 12;
$fs = 0.5;

include <bracket_inc.scad>
include <misc_parts_inc.scad>
use <misc_parts.scad>


//// fin-module
// height1: front of fin
// height2: back of fin
// length1: length all together
// length2: length of the fin-part that gets merged in the adjacent part
// width:   ....
use <prism.scad>
module diagonal_fin2(height1, height2, length1, length2, width) 
{
    ds = 3; // =y0, distance from the endpoints
    y1 = (length1-length2)/2;
    y2 = (length1+length2)/2;
    y3 = length1 - ds;
    surface = [ [0,ds], [height1,ds], [height1,y1], [height2,y2], [height2,y3], [0,y3] ];
    union() 
    {
        rotate([0,-90,0]) prism(surface,width,center=true);
        // mounting screw hole.
        translate([0, length1, height2/2]) difference() 
        {
            cylinder(r=5, h=height2, center=true);
            translate([0,0,height2/2-1]) rotate([0,180,0]) screw_M3(10); 
        }
   }
}

translate([0,100,0]) diagonal_fin2(40, 6, 50, 40, 5);

module diagonal_fin3(height1, height2, length1, length2,length3, width,width2) 
{
    ds = 3; // =y0, distance from the endpoints
    y1 = (length1-length2)/2;
    y2 = (length1+length2)/2;
    y3 = length1 - ds;
    surface = [ [0,ds], [height1,ds], [height1,y1], [height1,30],
    [height2,y2], [height2,y3], [0,y3] ];
    wall_surface = [ [0,y3-length3], [height1,30-length3], [
    height1,30], [height2,y2], [0,y2] ];
    union() 
    {
        rotate([0,-90,0]) linear_extrude(width,center=true) polygon(points=surface);  
        translate([width2/2+width/2,0,0]) rotate([0,-90,0]) linear_extrude(width2,center=true) polygon(points=wall_surface);
        // mounting screw hole.
        translate([0, length1, height2/2]) difference() 
        {
            cylinder(r=5, h=height2, center=true);
            translate([0,0,height2/2-1]) rotate([0,180,0]) screw_M3(10); 
        }
   }
   echo(y1);
   echo(y2);
   echo(y3);
}

translate([50,100,0]) diagonal_fin3(30,7,40,30,3.0,5,20);

module bracket(height) 
{
    w = rod_distance;
    difference() 
    {
        union() 
        {
            translate([0, -1, 0]) cube([w+12, 22, height], center=true);
            // Sandwich mount hull
            translate([-w/2, 10, 0]) cylinder(r=6, h=height, center=true);
            translate([+w/2, 10, 0]) cylinder(r=6, h=height, center=true);
        }
        // Sandwich mount screw holes
        translate([-w/2, 10, height/2-1]) rotate([0,180,0]) screw_M4(height);
        translate([+w/2, 10, height/2-1]) rotate([0,180,0]) screw_M4(height);

        // Smooth rod mounting slots.
        for (x = [-w/2, w/2])
        {
            translate([x, 0, 0]) 
            {
                cylinder(r=rod_hole_radius, h=height+1, center=true);
                translate([0, -10, 0]) cube([2, 20, height+1], center=true);
            }
        }
        // Belt path.
        translate([0, -5, 0]) cube([w-20, 20, height+1], center=true);
        translate([0, -9, 0]) cube([w-12, 20, height+1], center=true);
        translate([-w/2+10, 1, 0]) cylinder(r=4, h=height+1, center=true);
        translate([+w/2-10, 1, 0]) cylinder(r=4, h=height+1, center=true);
    }
}

translate([0, 0, 10]) bracket(20);
