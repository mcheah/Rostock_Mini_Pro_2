include <configuration.scad>
use <bracket.scad>
      
h = motor_end_height; // Total height.
m = 30; // Motor mounting screws distance (center to center)
w = 60; // Smooth rod distance (center to center)
diagonal_fin_length = 40;
module mounting_screws(screws) {
    translate([-w/2, 12, 0]) circle(r=2.2,  $fn=12);
    translate([w/2, 12, 0]) circle(r=2.2,  $fn=12);
	if (screws>2) for (x = [-30, 30]) translate([x, diagonal_fin_length+12-1, 0]) {
		translate([0, 1, 0]) circle(r=1.8,  $fn=12);
	}
}

module extruder_mounting_screws(screws) {
    extruder_w = 73;
    slot_len = 6;
    extruder_l = 40;
    hull() {
    translate([-extruder_w/2, 0, 0]) circle(r=2.2,  $fn=12);
    translate([-extruder_w/2, slot_len, 0]) circle(r=2.2,  $fn=12);
    }//hull
    hull(){
    translate([extruder_w/2, 0, 0]) circle(r=2.2,  $fn=12);    
    translate([extruder_w/2, slot_len, 0]) circle(r=2.2,  $fn=12);
    }
	if (screws>2) for (x = [-extruder_w/2, extruder_w/2]) translate([x, extruder_l, 0]) {
        hull() {
            circle(r=2.2,  $fn=12);
            translate([0,slot_len,0]) circle(r=2.2,  $fn=12);
        }//hull
	}//if(screws>2)
}
//translate([0,-12,0])
//extruder_mounting_screws(4);