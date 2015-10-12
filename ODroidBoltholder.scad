difference(){
cube([6.0,12,1.5]);

translate([0,6,-1])
    cylinder(d=3.5,10,$fn=50);
}