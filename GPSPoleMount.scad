$thickness = 2;

module screw(){
    translate([0,0,-$thickness/2])
        cylinder(d=3.5,10,$fn=40);
    translate([0,0,$thickness/2])
        cylinder(d=4,10,$fn=40);
}


module topPlate(){
    difference(){
    union(){
        translate([0,-16,0])
            cube([32,32,$thickness]);
                 
        linear_extrude(height=$thickness)  
        polygon(points=[[0,-16],[32,-16],[17,-33],[3,-33]]);
    }

    union(){
        translate([6,23/2,0])
            screw();
            
        translate([6,-23/2,0])
            screw();
            
        translate([26,16.5/2,0])
            screw();
            
        translate([26,-16.5/2,0])
            screw();
    }

    translate([10,-25,-1])
        cylinder(d=11.5,10,$fn=100);
    }
    
    rotate([0,0,-90])
    translate([-11,16,$thickness])
    linear_extrude(height=1)text("TWIRRE",4);
    
    rotate([0,0,-90])
    translate([-6,10,$thickness])
    linear_extrude(height=1)text("GPS",4);

}


module botPlate(){
    difference(){
    union(){
        translate([0,-16,0])
            cube([20,32,$thickness]);
                 
        linear_extrude(height=$thickness)
        polygon(points=[[0,-16],[20,-16],[17,-30.5],[3,-30.5]]);
    }
    
    translate([0,0,$thickness])
        mirror([0,0,1])
        union(){
            translate([6,21/2,0])
                screw();
                
            translate([6,-21/2,0])
                screw();
        }
    }
    
    difference(){
        translate([10,-25,$thickness])
            cylinder(d=11,41 + $thickness,$fn=100);

        translate([10,-25,$thickness + 0.1])
            cylinder(d=8.5,41 + $thickness,$fn=100);
        
        translate([0,-25,20])
            rotate([0,90,0])
                cylinder(d=2,40,$fn=10);
    }
    


}

translate([33,0,0])
botPlate();
topPlate();