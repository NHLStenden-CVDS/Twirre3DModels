$thickness = 3;

module hook(){
    difference(){
        union(){
            cube([10,5,$thickness]);
            translate([0,5,0])cube([25,7,$thickness]);
            
            
            linear_extrude(height = $thickness)
            polygon(points=
                    [[0,0],
                    [-9,0],
                    [0,12]]);
        }
        translate([10 + 11,5 + 7/2,-1])cylinder(d=3,20, $fn=20);
    }
}


union(){
    hook();
    translate([66.6 + 10,0,0])hook();

    linear_extrude(height = $thickness)
    polygon(points=
            [[-9,0],
            [35,-60],
            [110,-60],
            [110,0]]);
}