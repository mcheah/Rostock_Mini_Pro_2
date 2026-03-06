$fa=3;
$fs=0.2;
module tapered(h,r1,r2)
{
echo("H=",h);
echo("R1=",r1);
echo("r2=",r2);    
    //cylinder(h=9.3,r1=4.3,r2=4);
    cylinder(h=h,r1=r1,r2=r2);
    
}
//intended to push idler pulley out from idler_end slightly to align with motor shaft
module pulley_spacer() {
difference()
{
    union(){
        tapered(9,5,4);
        translate([0,0,-5.0])
        cylinder(r=7.8/2,h=5.0);
    }
    translate([0,0,-150])
    cylinder(r=2.4,h=300,center=true);
}
}
pulley_spacer();