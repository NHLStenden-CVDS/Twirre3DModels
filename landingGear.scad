include <lib/flamewheel.scad>;


module landingGear_Base($boltDia = 2.5, $text="Twirre"){
    difference(){
        translate([0,9.5,0])
        rotate([90,0,0]) 
        linear_extrude(height = 9.40)
        polygon( points=[
            [-2,-2],
            [17,-2],
            [33,35],
            [-2,35],
        ]);
    
translate([-5,0.89,-2.1])rotate([1.22,0,0])mirror([0,1,0])cube([50,10,50]);
        dji_f550_leg(); 
     
     
     
        translate([10,20,15])rotate([90,0,0])cylinder(d=$boltDia, 50, $fn=10);
    
        translate([14,20,32])rotate([90,0,0])cylinder(d=$boltDia, 50, $fn=10);   
        
        
            
    translate([10,9.6,15])rotate([90,0,0])cylinder(d=5, 2, $fn=6);        
            
    translate([14,9.6,32])rotate([90,0,0])cylinder(d=5, 2, $fn=6);
    
    
        translate([22,8.8,22])
        rotate([90,0,180])
        linear_extrude(height = 4)
        text($text, size=5);
    }
    

}

module landingGear_BaseLid($boltDia = 2.5, $text="Twirre"){
    

    difference(){
    rotate([90,0,0]) 
    linear_extrude(height =2)
        polygon( points=[
            [-2,-2],
            [17,-2],
            [33,35],
            [-2,35],
        ]);
    
            translate([10,20,15])rotate([90,0,0])cylinder(d=2.4, 50, $fn=10);
    
        translate([14,20,32])rotate([90,0,0])cylinder(d=2.1, 50, $fn=10);
        
        dji_f550_leg(); 
        
        
        translate([3,-0.9,22])
        rotate([90,0,0])
        linear_extrude(height = 4)
        text("Twirre", size=5);
    }  
    

    
}




module landingGear_leg($height = 70, $taper = 3){
    
    translate([0,-0.5,0])landingGear_Base();
    
    difference(){
        translate([0,8,0])
        rotate([90,0,0])
        linear_extrude(height = 9)
        polygon( points=[
            [-2,-2],
            [17,-2],
            [17 - 5,-2 - $height],
            [-2 + 5,-2 - $height],
        ]);
        
        //SPRING
        translate([0,10,0])
        rotate([90,0,0])
        linear_extrude(height = 12)
        polygon( points=[
            [-2,-7],
            [12,-9],
            [-2,-11],
        ]);    
        
        translate([0,10,-6])
        rotate([90,0,0])
        linear_extrude(height = 12)
        polygon( points=[
            [17,-7],
            [3,-9],
            [17,-11],
        ]);
        

        //SIDE HOLES
        translate([0,10,0])
        rotate([90,0,0])
        linear_extrude(height = 15)
        polygon( points=[
            [2,-20],
            [13,-20],
            [17 - 5,-$height/2],
            [-2 + 5,-$height/2],
        ]);    

        translate([0,10,0])
        rotate([90,0,0])
        linear_extrude(height = 15)
        polygon( points=[
            [5,-$height],
            [10,-$height],
            [17 - 5,-$height/2 - 4],
            [-2 + 5,-$height/2 - 4],
        ]);
        
        //TAPER
        translate([-25,-1,-2])
        rotate([0,90,0])
        linear_extrude(height = 50)
        polygon( points=[
            [0,0],
            [$height + 1,$taper],
            [$height + 1,-50],
            [0,-50],
        ]);
    
        translate([-25,8,-2])
        mirror([0,1,0])
        rotate([0,90,0])
        linear_extrude(height = 50)
        polygon( points=[
            [0,0],
            [$height + 1,$taper],
            [$height + 1,-50],
            [0,-50],
        ]);
    }
    

    

    

}



module landingGear_complete(){
    translate([-10,0,-7])
    rotate([-90,180,0])landingGear_BaseLid();
    rotate([-90,0,0])landingGear_leg();
}


landingGear_complete();
