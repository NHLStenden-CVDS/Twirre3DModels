include <lib/railSystem.scad>;

module sonarMount(){
    rotate([0,90,0])
    translate([-20,0,-10])railMount(30,2);

    translate([-38.1/2 -10, -14.478 - 15, -10])
    difference(){
        union(){
            translate([-3,-3,0])cube([38.1 + 6,14.478 + 6,3]);
            translate([38.1/2 - 15,10,0])cube([30,10,3]);
            //cylinder(d=5.5,6,$fn=10);
            //translate([38.1,14.478,0])cylinder(d=5.5,6,$fn=10);
        }
        translate([0,14.478,0])cylinder(d=3.2,20,$fn=10);
        translate([38.1,0,0])cylinder(d=3.2,20,$fn=10);
    }
    
    translate([2,0,-10])
    rotate([0,-90,0])railMount(30,1);
}

sonarMount();