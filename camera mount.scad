include <lib/railSystem.scad>;

module IDScamMountHor(){
    rotate([0,-90,0])
    difference(){
        union(){
            railMount(20);
            translate([0,-17,-36/2])cube([3,6,36]);
            translate([0,-16,-3])cube([3,6,13]);
        }
        translate([10,-25,0])cylinder(d=20,20);
        //Mounting holes
        translate([-1,-14,15.1])rotate([0,90,0])cylinder(d=3.1, 20, $fn=10);
        translate([-1,-14,-15.1])rotate([0,90,0])cylinder(d=3.1, 20, $fn=10);
        translate([-1,-54,-12])cube([5,36,24]);
     
    }
}

module IDScamMountVer(){
    
    translate([13,0,10])rotate([0,90,0])railMount(20,1);
    rotate([0,180,0])
    difference(){
        union(){
            railMount(20,2);
            translate([20/2,0,7])
            rotate([0,-90,0]){
                translate([0,-17,-36/2])cube([3,6,36]);
                translate([0,-16,-20/2])cube([3,6,20]);
            }
        }
        translate([10,-25,0])cylinder(d=20,20);
        //Mounting holes
        translate([20/2,0,7])
        rotate([0,-90,0]){
            translate([-1,-14,15.1])rotate([0,90,0])cylinder(d=3.1, 20, $fn=10);
            translate([-1,-14,-15.1])rotate([0,90,0])cylinder(d=3.1, 20, $fn=10);
            translate([-1,-54,-12])cube([5,36,24]);
        }
    }
}


IDScamMountVer();
//IDScamMountHor();
