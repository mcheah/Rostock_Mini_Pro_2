$fn=180;
//intended to support extruder motor mounted on top of plate
module plate_spacer() {
    difference() {
        translate([-(70)/2,-10,0]) cube([70,10,4.5]);
        translate([-60/2,-10/2,0]) cylinder(d=4.8,h=20);
        translate([60/2,-10/2,0]) cylinder(d=4.8,h=20);
    }
    translate([-45/2,-10,0]) cube([45,20,12]);
}
plate_spacer();