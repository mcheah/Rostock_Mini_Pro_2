include <configuration.scad>;
include <mounting_screws.scad>;

zip_tie=[1.5,3];
corn=12;
//frame_height = 11.2*25.4;
frame_height = 310;
frame_rad = 2*(frame_height-2*corn)/(sqrt(3)+1.3);
tower_rad = frame_rad*cos(30)+rod_diameter/2+corn;
echo(tower_rad);
module lower_frame() difference() {
	minkowski() {
		intersection() {
			circle(r=frame_rad,$fn=6);
            echo(1*2/sqrt(3));
			color("red") rotate(90) circle(r=frame_rad*1.3,$fn=3);
//            color("green") circle(r=frame_radius*1.3,$fn=120);
		}
		circle(r=corn);
	}
	// mounting holes PCB
	translate([0,-10,0])
//	for(x = [-1, 1]) for(y = [-1, 1]) 
//		translate([printbed_screw_spacing[0] / 2 * x, 
//		printbed_screw_spacing[1] / 2 * y, 0]) 
//		circle(r=1.2, $fn = 12);

	translate([0,printbed[1]/4,0]) minkowski() {
		square([6,printbed[1]/2],center=true);
		circle(r=5);
	}

//	// print surface retainer mounts
//	translate([0,-10,0])
//	for(x = [-1, 1]) for(y = [-1, 1]) 
//		translate([(printbed[0]/2+4) * x, 
//		(printbed[1]/2-15) * y, 0]) 
//		circle(r=1.2, $fn = 12);
	
	// mounting screws for motor mounts
    color("green")
	for(i = [0:2]) rotate(i*120)
	translate([0,tower_rad+2.4,0])rotate(180)  mounting_screws(4);

	// mounting screws for Sanguinololu
	// place * in front of the next line to remove these holes
//	if(sanguinololu)
//	rotate(30) translate([(frame_radius*1.3*sin(30))+corner_radius-1,0,0]) 
//	rotate(90) translate([-(97.79+3.82)/2,0,0]) {
//		translate([3.81,3.81,0]) circle(r=1.2,$fn = 12);
//		translate([3.81,46.99,0]) circle(r=1.2,$fn = 12);
//		translate([97.79,46.99,0]) circle(r=1.2,$fn = 12);
//		translate([97.79,3.81,0]) circle(r=1.2,$fn = 12);
//	}
	// zip tie for endstop wiring
//	mirror([1,0,0])  rotate(60) translate([((frame_radius*sin(30))+corner_radius)-zip_tie[1]*2-2,zip_tie[0],0]) 
//		for(x=[-1,1]) translate([zip_tie[1]*x,tower_radius/1.4,0]) square(zip_tie,center=true);
//
//	// zip tie for strain relief hotend wiring
//	mirror([1,0,0])  rotate(60) translate([((frame_radius*sin(30))+corner_radius)-zip_tie[1]*2-16,zip_tie[0],0]) 
//		for(x=[-1,1]) translate([zip_tie[1]*1.75*x,tower_radius/1.4,0]) square(zip_tie,center=true);

	// extruder mount 
//	rotate(0) translate([-printbed[0]/2+10+2,printbed[1]/2-10+6,0]) {
//		translate([0,0,0]) circle(r=2,$fn=12);
//		translate([32,0,0]) circle(r=2,$fn=12);
//	}
}

module upper_frame_holes() {
//	minkowski() {
//		intersection() {
//			circle(r=frame_rad,$fn=6);
//			rotate(90) circle(r=frame_rad*1.3,$fn=3);
//		}
//		circle(r=corn);
//	}
//	// mounting screws for idler mounts
//	for(i = [0:2]) rotate(i*120)
//	translate([0,tower_rad+2.4,0])rotate(180)  mounting_screws(4);

//	// inside opening 60% of outside dimensions
	scale(0.25) minkowski() {
		intersection() {
			circle(r=(tower_radius-rod_diameter/2-corner_radius)/cos(30),$fn=6);
			rotate(90) circle(r=(tower_radius-rod_diameter/2-corner_radius)/cos(30)*1.3,$fn=3);
		}
		circle(r=corner_radius);
	}
    translate([0,-85,0])
    extruder_mounting_screws(4);
	// zip ties for endstop wiring
//	rotate(30) translate([((frame_rad*2.0*sin(30))+corn)*0.6+zip_tie[1]*2,0,0]) 
//		for(x=[-1,1],y=[-0.5,0.5]) translate([zip_tie[1]*x,tower_rad/4*y,0]) square(zip_tie,center=true);
//
//	rotate(150) translate([((frame_rad*2.0*sin(30))+corn)*0.6+zip_tie[1]*2,0,0])
//		for(x=[-1,1],y=[-0.5,0.5]) translate([zip_tie[1]*x,tower_rad/4*y,0]) square(zip_tie,center=true);

//	mirror([1,0,0])  rotate(60) translate([((frame_radius*sin(30))+corner_radius)-zip_tie[1]*2-2,zip_tie[0],0]) 
//		for(x=[-1,1]) translate([zip_tie[1]*x,tower_radius/1.4,0]) square(zip_tie,center=true);    
}

module upper_frame() difference() {
	minkowski() {
		intersection() {
			circle(r=frame_rad,$fn=6);
			rotate(90) circle(r=frame_rad*1.3,$fn=3);
		}
		circle(r=corn);
	}
	// mounting screws for idler mounts
	for(i = [0:2]) rotate(i*120)
	translate([0,tower_rad+2.4,0])rotate(180)  mounting_screws(4);

//	// inside opening 60% of outside dimensions
	scale(0.25) minkowski() {
		intersection() {
			circle(r=(tower_radius-rod_diameter/2-corner_radius)/cos(30),$fn=6);
			rotate(90) circle(r=(tower_radius-rod_diameter/2-corner_radius)/cos(30)*1.3,$fn=3);
		}
		circle(r=corner_radius);
	}
    translate([0,-85,0])
    extruder_mounting_screws(4);
	// zip ties for endstop wiring
	rotate(30) translate([((frame_rad*2.0*sin(30))+corn)*0.6+zip_tie[1]*2,0,0]) 
		for(x=[-1,1],y=[-0.5,0.5]) translate([zip_tie[1]*x,tower_rad/4*y,0]) square(zip_tie,center=true);

	rotate(150) translate([((frame_rad*2.0*sin(30))+corn)*0.6+zip_tie[1]*2,0,0])
		for(x=[-1,1],y=[-0.5,0.5]) translate([zip_tie[1]*x,tower_rad/4*y,0]) square(zip_tie,center=true);

//	mirror([1,0,0])  rotate(60) translate([((frame_radius*sin(30))+corner_radius)-zip_tie[1]*2-2,zip_tie[0],0]) 
//		for(x=[-1,1]) translate([zip_tie[1]*x,tower_radius/1.4,0]) square(zip_tie,center=true);
}

module printbed_gasket() difference() {
	translate([0,-10,0]) square([printbed[0],printbed[1]],center=true);
	// mounting holes PCB
	translate([0,-10,0])
	for(x = [-1, 1]) for(y = [-1, 1]) 
		translate([printbed_screw_spacing[0] / 2 * x, 
		printbed_screw_spacing[1] / 2 * y, 0]) 
		circle(r=1.5, $fn = 12);
	// slot for wires and thermister
	translate([0,printbed[1]/4,0]) minkowski() {
		square([6,printbed[1]/2],center=true);
		circle(r=5);
	}
}

lower_frame();
//linear_extrude(5)
translate([tower_rad*1.35,tower_rad*0.7,0]) rotate(180) upper_frame();
//translate([tower_rad*1.35,tower_rad*0.7,0]) rotate(180) upper_frame_holes();
printbed_gasket();
