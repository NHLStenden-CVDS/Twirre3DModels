include <lib/railSystem lib.scad>;

module camMount(){
    difference(){
        union(){
            railMount(20);
            translate([0,-17,-36/2])cube([3,6,36]);
            translate([0,-16,-3])cube([3,6,13]);
        }
        //Mounting holes
        //translate([-1,-44,15])rotate([0,90,0])cylinder(d=3.1, 20, $fn=10);
        //translate([-1,-44,-15])rotate([0,90,0])cylinder(d=3.1, 20, $fn=10);
        translate([-1,-14,15])rotate([0,90,0])cylinder(d=3.1, 20, $fn=10);
        translate([-1,-14,-15])rotate([0,90,0])cylinder(d=3.1, 20, $fn=10);
        translate([-1,-54,-12])cube([5,36,24]);
     
    }

    
}
