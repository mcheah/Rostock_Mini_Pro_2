r=1.6;
w=20;
l=12;
$fa=3;
$fs=0.1;
module endstop_template(height) {
difference()
{
    cube([40,15.9,height]);
    translate([0,0,-1]) endstop_holes(height+2);
    translate([0,0,-1]) pin_holes(height+2);
}
}

module endstop_holes(height) {
translate([2+r,1.5+r,height/2])
cylinder(r=r,h=height,center=true);
translate([2+r+(w-r),1.5+r,height/2])
cylinder(r=r,h=height,center=true);
translate([2+r+(w-r)+14.5,1.5+r,height/2])
cylinder(r=r,h=height,center=true);
translate([2+r+(w-r)+14.5,1.5+r+(l-r),height/2])
cylinder(r=r,h=height,center=true);   
}

module pin_holes(height) {
    pin_r=1.1/2;
    cen_l = 15.9/2;
    //horizontal 3 holes
    translate([7.5,cen_l,height/2])
    cylinder(r=pin_r,h=height,center=true);
    translate([7.5+5.0,cen_l,height/2])
    cylinder(r=pin_r,h=height,center=true);
    translate([7.5+10,cen_l,height/2])
    cylinder(r=pin_r,h=height,center=true);
    //vertical 4 holes
//    for(i=0;i<4;i++) {
    for(y = [cen_l-5.0:2.5:cen_l+2.5]) {
//        y=4+i*2;
        translate([27.25,y,height/2])
        cylinder(r=pin_r,h=height,center=true);
    }
}
endstop_template(0.65);