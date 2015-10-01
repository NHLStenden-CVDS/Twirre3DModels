include <lib/flamewheel.scad>;
include <lib/railSystem.scad>;

$batLength = 142;
$batHeight = 46;
$batWidth = 52;
$wallSize = 3;


module battery(){
    union(){
        color([0.2,1,0.2,1])
            translate([0,1.5,1.5])cube([$batLength,$batWidth - 3,$batHeight - 3]);
        
        rotate([0,-90,0]){
            translate([3,3,0])
                color([1,0.2,0.2,1])
                    cylinder(d=5,20);   //Positive lead
            
            translate([3,8,0])
                color([0.2,0.2,0.2,1])
                    cylinder(d=5,20);   //Negative lead
            
        }
    }
}


module bolt(){
    translate([0,0,8])
    rotate([180,0,0]){
        union(){
            translate([0,0,-2])cylinder(d=5, 2, $fn = 15);
            cylinder(d=3.1, 2 + $wallSize, $fn = 15);
            translate([0,0,2 + $wallSize])cylinder(d=6.5, 4, $fn = 6);
        }
    }
}

module bolts(){
    translate([27.5,25,0])bolt();
    translate([27.5,-25,0])bolt();
    translate([-27.5,25,0])bolt();
    translate([-27.5,-25,0])bolt();
}
module frontRail(){
    translate([0,0,0]) rotate([0,0,90]) rail($batWidth);  
    
            translate([-$wallSize,$batWidth/2,0])
        rotate([0,90,0]){
            translate([0,20,0])cylinder(d=4, $wallSize, $fn=10);
            cylinder(d=4, $wallSize, $fn=10);
            translate([0,-20,0])cylinder(d=4, $wallSize, $fn=10);
        }
}

module velcroBlock(){
    difference(){
    cube([4,6,20]);
    translate([0,3,4])cube([4,3,12]);
    }
}
module compartment(){
    
     //Text
    difference(){
        union(){
            translate([-$wallSize,-$wallSize,-$wallSize])
                cube([$batLength + $wallSize * 2,$batWidth + $wallSize * 2,$batHeight + $wallSize * 2]);
            
            translate([-$wallSize,-10,$batHeight])
            cube([$batLength + $wallSize * 2,$batWidth + 20,$wallSize + 3]);
            
        }
        
        
        translate([-$wallSize * 2,0,0])
        cube([$batLength + $wallSize * 2, $batWidth, $batHeight]);
        translate([$batLength/2,$batWidth/2,$batHeight ]) bolts();
        
        
       
        
           
        //Ventilation
        //Rear
        translate([$batLength/2 + 12,-$batWidth / 2,$batHeight - 15])
            cube([30,$batWidth * 2,15]);
        translate([$batLength/2 + 60,-$batWidth / 2,$batHeight - 15])
            cube([10,$batWidth * 2,15]);
        translate([$batLength/2 + 12,-$batWidth / 2,$batHeight - 43])
            cube([30,$batWidth * 2,15]);
        translate([$batLength/2 + 60,-$batWidth / 2,$batHeight - 43])
            cube([10,$batWidth * 2,15]);
        
            //Front
    translate([142,0,0]){
        mirror([1,0,0]){
        translate([$batLength/2 + 12,-$batWidth / 2,$batHeight - 15])
            cube([30,$batWidth * 2,15]);
        translate([$batLength/2 + 60,-$batWidth / 2,$batHeight - 15])
            cube([10,$batWidth * 2,15]);
        translate([$batLength/2 + 12,-$batWidth / 2,$batHeight - 43])
            cube([30,$batWidth * 2,15]);
        translate([$batLength/2 + 60,-$batWidth / 2,$batHeight - 43])
            cube([10,$batWidth * 2,15]);
        }
    }
    
    //Front rail mounting points
        translate([$batLength - $wallSize,$batWidth/2,$batHeight/2])
        rotate([0,90,0]){
            translate([0,20,0])cylinder(d=4.2, 40, $fn=10);
            cylinder(d=4.2, 40, $fn=10);
            translate([0,-20,0])cylinder(d=4.2, 40, $fn=10);
        }
        
        
    //Bottom Ventilation
    translate([0,$batWidth - $wallSize/2,20]){
        rotate([90,0,0]){
            translate([$batLength/2 + 12,-$batWidth / 2,$batHeight - 12])
                cube([30,$wallSize * 4,15]);
            translate([$batLength/2 + 60,-$batWidth / 2,$batHeight - 12])
                cube([10,$wallSize * 4,15]);
            translate([$batLength/2 + 12,-$batWidth / 2,$batHeight - 46])
                cube([30,$wallSize * 4,15]);
            translate([$batLength/2 + 60,-$batWidth / 2,$batHeight - 46])
                cube([10,$wallSize * 4,15]);
                
            translate([$batLength/2 - 42,-$batWidth / 2,$batHeight - 12])
                cube([30,$wallSize * 4,15]);
            translate([$batLength/2 - 70,-$batWidth / 2,$batHeight - 12])
                cube([10,$wallSize * 4,15]);
            translate([$batLength/2 - 42,-$batWidth / 2,$batHeight - 46])
                cube([30,$wallSize * 4,15]);
            translate([$batLength/2 - 70,-$batWidth / 2,$batHeight - 46])
                cube([10,$wallSize * 4,15]);
        }
    }
        
            translate([$batLength/2 - 20,$batWidth/2 - 5,$batHeight + $wallSize * 2 - 0.5])linear_extrude(height = 5)text("Twirre");
    }
    

    

    //Rails
    translate([0,-$wallSize,$batHeight/2]) rail(145);    
    translate([0,$wallSize + $batWidth,$batHeight/2]) rotate([180,0,0]) rail(145);
    //translate([$batLength + $wallSize,0,$batHeight/2]) rotate([0,0,90]) rail($batWidth);
    translate([0,$batWidth / 2,-$wallSize]) rotate([90,0,0]) rail(145);    


    translate([-$wallSize,-$wallSize - 6,-$wallSize]) velcroBlock();
    translate([-$wallSize,-$wallSize - 6,$batHeight - 20 + $wallSize]) velcroBlock();
    
    translate([0,$batWidth,0]){
        mirror([0,1,0]){
            translate([-$wallSize,-$wallSize - 6,-$wallSize]) velcroBlock();
            translate([-$wallSize,-$wallSize - 6,$batHeight - 20 + $wallSize]) velcroBlock();
        }
    }
}



rotate([0,90,0])compartment();
//rotate([0,90,0])frontRail();
