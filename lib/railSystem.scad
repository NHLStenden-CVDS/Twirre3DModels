module rail($length, $spacing = true){
    $height = 15;
    $partWidth = 5;
    
    translate([0,-3,0]){
        difference(){
            translate([0,-1.5,-$height/2]) cube([$length,3,$height]);
            translate([0,0,$height/2])rotate([-45,0,0])cube([$length,10,10]);
            mirror([0,1,0])translate([0,0,$height/2])rotate([-45,0,0])cube([$length,10,10]);   
           
            translate([0,0,-$height/2])rotate([-45,0,0])cube([$length,10,10]);
            mirror([0,1,0])translate([0,0,-$height/2])rotate([-45,0,0])cube([$length,10,10]);  
            
            
    if($spacing)        
         for(i = [$partWidth : $partWidth * 2 : $length]){
            rotate([180,0,0])translate([i,0.5,-$height/2])cube([$partWidth,50,$height]);
        }
            
        }
        

        
        translate([0,0,-$height*1/(1.5*2)])cube([$length,3,$height/1.5]);
    }
}


module railMount($width, $onlyPart = 0){
    difference(){
        union(){
    
            if($onlyPart!=1)translate([0,-10,-3])cube([$width,9,13]);
            if($onlyPart!=2)translate([0,-10,-11.5])cube([$width,9,7.5]);
        }
    
    translate([-1,0,0])rail($width + 2, false);
    translate([-1,0,-1.5])rail($width + 2, false);
        
    translate([3.5,-7.5,-15])
        cylinder(d=2.3,50, $fn=10);
    translate([$width - 3.5,-7.5,-15])
        cylinder(d=2.3,50, $fn=10);
    translate([3.5,-7.5,-11.6])cylinder(d=5,1.6,$fn=6);
    translate([$width - 3.5,-7.5,-11.6])cylinder(d=5,1.6,$fn=6);
            
    translate([-1,-2,-6])cube([$width + 2,2,12]);
    }
}
