$fa=3;
$fs=0.2;
clearance=0.2;
mount_th=5;
hole_d=4.4;
th=4.4+1.2*2;
mount_hole_spacing=73;
mount_hole_clearance=5;
mount_w=mount_hole_spacing+mount_hole_clearance*2;
module nema17face(thickness) {
    translate([0,0,thickness/2])
    difference() {
    cube([42+clearance,42+clearance,thickness],center=true);
    cylinder(d=22+clearance,h=thickness+2,center=true);
    translate([-15.5,-15]) cylinder(d=3+clearance*8,h=thickness+2,center=true);
    translate([15.5,-15]) cylinder(d=3+clearance*8,h=thickness+2,center=true);
    translate([-15.5,15]) cylinder(d=3+clearance*8,h=thickness+2,center=true);
    translate([15.5,15]) cylinder(d=3+clearance*8,h=thickness+2,center=true);

    translate([(42+clearance)/2,17+clearance/2]) rotate(45) translate([0,0,-thickness/2-1]) cube([20,20,thickness+2]);
    rotate(90) translate([(42+clearance)/2,17+clearance/2]) rotate(45) translate([0,0,-thickness/2-1]) cube([20,20,thickness+2]);
    //rotate(180) translate([(42+clearance)/2,17+clearance/2]) rotate(45) square([20,20]);
    //rotate(270) translate([(42+clearance)/2,17+clearance/2]) rotate(45) square([20,20]);
    //translate([-(42+clearance)/2,17+clearance/2]) rotate(45) square([20,20]);
    //translate([(42+clearance)/2,-(17+clearance/2)]) rotate(45) square([20,20]);
    //translate([(42+clearance)/2,17+clearance/2]) rotate(45) square([20,20]);
    }//difference()
}

module extruder_bracket_spacer(thickness) {
    translate([0,0,(42+clearance)/2+1.5])rotate([90,0,0]) nema17face(thickness);
    //add tabs
    translate([0,0,-(mount_th-4.5)]) difference() {
        translate([-(mount_w)/2,-thickness,0]) cube([mount_w,thickness,mount_th]);
        translate([-mount_hole_spacing/2,-thickness/2,0]) cylinder(d=hole_d,h=20);
        translate([mount_hole_spacing/2,-thickness/2,0]) cylinder(d=hole_d,h=20);
    }
}

extruder_bracket_spacer(th);
// nema17face(th);