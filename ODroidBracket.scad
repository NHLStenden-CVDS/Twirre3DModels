difference()
{
    union(){
        translate([76/2,0,-5.5])
            cylinder(d=7,8.5, $fn=50);

        translate([-76/2,0,-5.5])
            cylinder(d=7,8.5, $fn=50);

        translate([0,0,-4])
            cube([76,7,3],center=true);
        
        
    }
    
    translate([76/2,0,-10])
        cylinder(d=3.5, 20, $fn=50);
        
    translate([-76/2,0,-10])
        cylinder(d=3.5, 20, $fn=50);
    
}