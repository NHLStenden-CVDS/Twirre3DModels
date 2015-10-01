module dji_m25($length = 5){
    cylinder(d=2.5,$length+2,$fn=10);
    cylinder(d=3,3,$fn=10);
    cylinder(d=5, 1, $fn=10);
}

module dji_f550_hubTop_vent(){
    translate([0,-9,-10])
    cylinder(d=6, 20, $fn=20);
  
    translate([0,9,-10])
    cylinder(d=6, 20, $fn=20);
    
    cube([6,18,20],center=true);
}

module dji_f550_hubTop_seg(){  
    difference(){
        translate([0,0,0])
        rotate([0,0,0]) 
        linear_extrude(height = 2)
        polygon( points=[
            [0,40],
            [66,42],
            [75,28],
            [86,20],
            [110,16],
            [110,-16],
            [86,-20],
            [75,-28],
            [66,-42],
            [0,-40],
        ]);
        
        //Bolt holes
        union(){
            translate([85,8,-1.01])
            dji_m25();
            translate([85,-8,-1.01])
            dji_m25();
            translate([105,12,-1.01])
            dji_m25();
            translate([105,-12,-1.01])
            dji_m25();
        }
        
        
            

        //Outer ventilation holes
        for(i = [0 : 1]){
        
            mirror([0,i%2,0]){
                translate([63,13,-10])
                cylinder(d=3,20,$fn=10);
                color([1,0,0])
                translate([1,1,-10])
                rotate([0,0,0]) 
                linear_extrude(height = 20)
                polygon( points=[
                    [31,42],
                    [46,15],
                    [52,12.5],
                    [62,10.5],
                    [63.5,12.3],
                    [43,48],
                ]);
            }   
        }
    }    
}


module dji_f550_hubBot_seg(){  
    difference(){
        translate([0,0,0])
        rotate([0,0,0]) 
        linear_extrude(height = 2)
        polygon( points=[
            [0,40],
            [66,42],
            [75,28],
            [86,20],
            [110,16],
            [110,-16],
            [86,-20],
            [75,-28],
            [66,-42],
            [0,-40],
        ]);
        
        //Bolt holes
        union(){
            translate([104,10.5,-1.01])
            dji_m25();
            translate([104,-10.5,-1.01])
            dji_m25();
        }
    }  
    //Solderpads
    color([0.5,0.5,0.5]){
        translate([80,7,2.5])
        rotate([0,0,0])
        cube([7,5,5],center=true); 
        translate([80,-7,2.5])
        rotate([0,0,0])
        cube([7,5,5],center=true);
    } 
}






module dji_f550_hubBot(){
    
    difference(){
        union(){
           for(i = [0 : 6]){
                rotate([0,0,i*60 + 30])
                dji_f550_hubBot_seg();
                
           }
       }
       
        difference(){
        union(){
            difference(){
                union(){
                    rotate_extrude($fn=50)
                    translate([38,0,-2])
                    square(size=[5.5,5.5] , center=true);
                    
                    rotate_extrude($fn=50)
                    translate([55,0,-2])
                    square(size=[7.5,7.5] , center=true);
                }

                for(i = [0 : 6]){
                    rotate([0,0,i*60 + 30])
                    translate([37,0,-3])
                    cube([15,15,20],center=true);
                    
                    rotate([0,0,i*60 + 30])
                    translate([55,0,-3])
                    cube([21,21,20],center=true);
                }
            }

/*
            for(i = [0 : 6]){
                rotate([0,0,i*60 + 42])
                translate([37,0,-3])
                cylinder(d=5.5,6, $fn=20);
                rotate([0,0,i*60 - 42])
                translate([37,0,-3])
                cylinder(d=5.5,6, $fn=20);
                
                rotate([0,1,i*60 + 42])
                translate([55,0,-3])
                cylinder(d=7.5,8,$fn=20);
                
                rotate([0,1,i*60 - 42])
                translate([55,0,-3])
                cylinder(d=7.5,8,$fn=20);
            }*/
            
        }
        translate([35,0,0])
        cube([20,35,20],center=true);
        translate([50,0,0])
        cube([20,60,20],center=true);
    }
       
   }
   
   
     //Solderpads
    color([0.5,0.5,0.5]){
        translate([60,7,2.5])
        rotate([0,0,0])
        cube([7,5,5],center=true); 
        translate([60,-7,2.5])
        rotate([0,0,0])
        cube([7,5,5],center=true);
    }  
   
   
   
}

module dji_f550_hubTop(){
    difference(){
        union(){
            for(i = [0 : 6]){
                rotate([0,0,i*60 + 30])
                dji_f550_hubTop_seg();
                
            }
        }
        
        
        
        //Inner ventilation holes
        
        for(i = [0 : 1]){
            mirror([i%2,0,0]){
                for(j = [0 : 1]){
                    mirror([0,j%2,0]){
                        translate([35.5,17,0])
                        dji_f550_hubTop_vent();
                        translate([19.5,20,0])
                        dji_f550_hubTop_vent();
                    }
                }
            }
        }

    }
    
  


    
}
module dji_f550_leg(){
    translate([7,-0.4,22])rotate([0,-12,0])cube([10,8,5]);  //Dji name tag
    
    
    difference(){
        difference(){
            translate([-0.5,0,-1])cube([39,7.2,53]);    //Main body
            translate([15.5,-0.5,-1])rotate([0,24,0])cube([32,8,80]);  
        }
        
       
    translate([-2,5.5 + (7.2 - 5.5)/2,-1])rotate([-1.2,0,0])cube(100,100,100);
    
    translate([-2,(7.2 - 5.5)/2,-1])mirror([0,1,0])rotate([-1.2,0,0])cube(100,100,100);
        
        union(){
            //BOTTOM HOLE
            translate([7,-1,7])
                rotate([-90,0,0])cylinder(r=2, 20,$fn=20);
            translate([10,-1,7])
                rotate([-90,0,0])cylinder(r=2, 20,$fn=20);
            translate([7,-1,18])
                rotate([-90,0,0])cylinder(r=2, 20,$fn=20);
            translate([12.5,-1,18])
                rotate([-90,0,0])cylinder(r=4, 20,$fn=20);
           
            translate([0,9,0])
            rotate([90,0,0]) 
            linear_extrude(height = 10)
            polygon( points=[
                [5,7],
                [7,5],
                [10,5],
                [12,7],
                [16.5,17.5],
                [12,22],
                [7,20],
                [5,18],
            ]);
            
            //TOP HOLE
            translate([8,-1,31])
                rotate([-90,0,0])cylinder(r=2, 20,$fn=20);
            translate([20,-1,33])
                rotate([-90,0,0])cylinder(r=2, 20,$fn=20);
           
            translate([0,9,2])
            rotate([90,0,0]) 
            linear_extrude(height = 10)
            polygon( points=[
                [5,28],
                [7,26],
                [20,29],
                [22,31],
                [30,50],
                [5,50],
            ]);
        }
    }
}
module dji_f550_arm(){ 
 
    translate([20,175,-20])
    rotate([0,0,90])
    dji_f550_leg();
    
    difference(){
        union(){
            cube([32,30,37]);   //Base
            
            difference(){
                translate([0,30,0])
                cube([32,155,38]);   //Arm

                translate([-5,30+18,10])
                rotate([0,90,0])
                cylinder(r=18,50);
                
                translate([-1,30,-50 + 8])
                cube([50,10,50]);
                
                translate([-1,30+18,-1])
                cube([50,165,29]);
    
                translate([-800 +3.5,100,20])
                cylinder(r=800,20,$fn=200);
                
                translate([832 - 3.5,100,20])
                cylinder(r=800,20,$fn=200);
            }
            
            translate([16.5,165 + 30,32])
            cylinder(d=40,6, $fn=20);
        }
        translate([-5,0,10])
        rotate([0,90,0])
        cylinder(r=18,50);
        
        translate([-1,8,-50 + 8])
        cube([50,10,50]);
    }

}




module dji_f550_complete(){
    
    translate([0,0,37])
    dji_f550_hubTop();
    dji_f550_hubBot();

    for(i = [0 : 6]){
        rotate([0,0,i*60])
        translate([-16,80,0])
        dji_f550_arm();
    }
}


