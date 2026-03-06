w=15;
l=51.1;
d=10.5;
th=1.5;
tilt=45;
long_l = l+2*th;
long_w = w+2*th;
module fan_shroud(depth) {
    rotate([90-tilt,0,0])
    translate([0,l/2+th,depth/2])
    difference() {
        cube([w+2*th,l+2*th,depth],center=true);
        cube([w,l,depth+2],center=true);
    }
}
fan_shroud(d);
translate([50,0,0]) fan_shroud(100);
module fan_mount() {
    difference() {
        union(){
            translate([-w/2-th,0,0])
            cube([th,cos(90-tilt)*long_l,sin(90-tilt)*long_l]);   
            translate([+w/2,0,0])
            cube([th,cos(90-tilt)*long_l,sin(90-tilt)*long_l]);       
        } 
        fan_shroud(100);

    }
    fan_shroud(d);
    translate([-w/2-th,0,0])
    cube([w+2*th,cos(90-tilt)*long_l,th]);
    translate([-w/2-th,cos(90-tilt)*long_l-th,0])
    cube([w+2*th,th,sin(90-tilt)*long_l]);
}
translate([0,50,0]) fan_mount();

module fan_mount2() {
    difference() {
        translate([0,-cos(90-tilt)*long_l,0])
        fan_mount();
        fan_subtract();
    }
}
color("green") translate([50,+50+cos(90-tilt)*long_l,0]) fan_mount2();

module fan_subtract() {
    rotate([90-tilt,0,0])
    translate([-w/2,0,-25])
    cube([w,2,50]);
    translate([-w/2,-th-sin(90-tilt)*long_l,th])
        cube([w,sin(90-tilt)*long_l,cos(90-tilt)*long_l]);
}
%translate([0,50+cos(90-tilt)*long_l,0]) fan_subtract();

//fan_mount2();
//color("blue")
//fan_subtract();