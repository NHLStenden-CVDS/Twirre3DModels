include <lib/flamewheel.scad>;


module arduino(){
    translate([0,0,0])
        cylinder(d=3,20,$fn=10);//Topleft
    translate([15.2,50.8,0])
        cylinder(d=3,20,$fn=10);//Middle top
    translate([15.2 + 27.9,50.8,0]) 
        cylinder(d=3,20,$fn=10);//Middle bottom
    translate([0,50.8 + 24.1,0])    
        cylinder(d=3,20,$fn=10);//Topright
    
    
    translate([15.2+27.9+5.1,-1.3,0])
        cylinder(d=3,20,$fn=10);//Bottomleft
    translate([15.2+27.9+5.1,-1.3 + 82.5,0])
        cylinder(d=3,20,$fn=10);//BottomRight
}


difference(){
union(){
color([255,0,0])
translate([50,-18,-3.1])
cube([60,36,5]);

color([255,0,0])
translate([75,-40,-3.1])
cube([35,80,5]);


}
union(){
translate([80,-55,0])
rotate([0,0,60])
cube([50,50,30],center=true);
mirror([0,1,0])
translate([80,-55,0])
rotate([0,0,60])
cube([50,50,30],center=true);
}

rotate([0,0,180/6])
dji_f550_hubTop_seg();
rotate([0,0,-180/6])
dji_f550_hubTop_seg();


translate([104,37,-10])rotate([0,0,-180])arduino();
}



