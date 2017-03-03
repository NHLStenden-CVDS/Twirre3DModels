boardWidth = 101.5;
boardLength = 101.5;
boardEdgeRadi = 4;


caseWidth = boardWidth + 7.5;
caseDepth = boardLength + 12;
caseRearWidth = 155;
caseRearDepth = 40;
caseWallHeight =70;
caseConnectorHeight = 4;
caseConnectorSize = 25;
caseWallThickness = 5;

case_rightholesize = 45;
case_rightholeoffset =45;
case_leftholesize = 40;
case_leftholeoffset =52;
case_floorDepth = 4;

motherboard_offset_x = 11;
motherboard_offset_y = 6 - caseWidth/2;


//MISC
{
    module _NHL_KCCV_Logo(){
        translate([-426/2,0]){
        rotate([180,0,0]){
            //N
             polygon(points=[
            [0,0],
            [38,7],
            [107,94],
            [107,15],
            [144,18],
            [144,191],
            [107,191],
            [107,154],
            [38,65],
            [38,191],
            [0,191]]);
            
            
            //H
             polygon(points=[
            [173,24],
            [208,27],
            [208,102],
            [265,80],
            [265,35],
            [300,40],
            [300,191],
            [265,191],
            [265,120],
            [208,140],
            [208,191],
            [173,191],]);
            
            
            //L
             polygon(points=[
            [325,42],
            [361,46],
            [361,155],
            [426,155],
            [408,191],
            [325,191]]);
        }
        translate([0,-240])
        scale(4.3)
        text("Computer Vision");
    }
    }
    
}


//Motherboard
{
module _board_shape(){
    hull(){
        translate([boardEdgeRadi,boardEdgeRadi])circle(r = boardEdgeRadi);
        translate([boardWidth-boardEdgeRadi,boardEdgeRadi])circle(r = boardEdgeRadi);
        translate([boardWidth-boardEdgeRadi,boardLength-boardEdgeRadi])circle(r = boardEdgeRadi);
        translate([boardEdgeRadi,boardLength-boardEdgeRadi])circle(r = boardEdgeRadi);
    }
}

module _board_mountholes(custDia=0){
    smallDia = 3.5;
    bigDia = 4;
    
    if(custDia>0){
        translate([3,4])circle(d=custDia);
        translate([3 + 95,4])circle(d=custDia);
        
        translate([3,4 + 90])circle(d=custDia);
        translate([3 + 95,4 + 90])circle(d=custDia);
    }else{
        translate([3,4])circle(d=bigDia);
        translate([3 + 95,4])circle(d=bigDia);
        
        translate([3,4 + 90])circle(d=smallDia);
        translate([3 + 95,4 + 90])circle(d=smallDia); 
    }
}


module _board_connectors_right(){
    translate([31,-5.5])square([10,14]);    //Audiojack
    translate([45,-4])square([15,17]);      //USB
    translate([63,-4])square([15,17]);      //USB
}

module _board_connectors_left(){
    translate([0,boardLength])
    mirror([0,1]){
        translate([16.5, -1])square([10,14]);  //Powerbarrel
        translate([29,-1])square([8.5,13]);    //MiniHDMI
        translate([40,-1])square([16,14]);      //ETH
        translate([59.5,-1])square([15,24]);      //USB
        translate([77,-1])square([8.5,13]);    //MiniHDMI
    }
}

module _board_cooling(){
    holeDia = 35;
    translate([boardWidth/2,boardLength/2 - holeDia/2])
    circle(d=holeDia);
}


module _preview_motherboard(){
    _board_shape();
    _board_connectors_right();
    _board_connectors_left();
 
}
}



//Controlpanel
{
    module _controlpanel_mount(){
        width = 50;
        height = 35;
        mountHoleDia = 3;
        edgeRadi = 10;
        
        translate([height,width/2])circle(d=mountHoleDia,$fn=10);
        translate([0,width/2])circle(d=mountHoleDia,$fn=10);
        translate([0,-width/2])circle(d=mountHoleDia,$fn=10);
        translate([height,-width/2])circle(d=mountHoleDia,$fn=10);
        
        hull(){
            translate([height - edgeRadi,width/2 - edgeRadi])circle(r=edgeRadi,$fn=20);
            translate([height - edgeRadi,-width/2 + edgeRadi])circle(r=edgeRadi,$fn=20);
            translate([edgeRadi,-width/2 + edgeRadi])circle(r=edgeRadi,$fn=20);
            translate([edgeRadi,width/2 - edgeRadi])circle(r=edgeRadi,$fn=20);
        }
    }
}

//Case
{
module _case_basicshape(){
    union(){
        translate([0,-caseWidth/2])square([caseDepth, caseWidth]);   
        translate([0,-caseRearWidth/2])square([caseRearDepth, caseRearWidth]);    
    }
}

module _case_xt60_outerDimensions(){
    square([8.128,15.735],center=true);
}
module _case_xt60_innerDimensions(){
    square([8.128 * 0.9 ,15.735 * 0.9],center=true);
}

module _case_base(){
    difference(){
        _case_basicshape();
        translate([motherboard_offset_x,motherboard_offset_y])_board_mountholes();
        translate([motherboard_offset_x,motherboard_offset_y])_board_cooling();
        _case_basemount();
    }    
}


module _case_wall(){
    difference(){
        minkowski(){
            _case_basicshape();
            circle(r=caseWallThickness);
        }
        _case_basicshape();
    }
}

module _case_basemount(){
    dia = 4;
    
    translate([caseDepth + caseWallThickness - 14,30])circle(d=4,$fn=10);
    translate([caseDepth + caseWallThickness - 14,-30])circle(d=4,$fn=10);
    translate([caseDepth + caseWallThickness - 14 - 90,60])circle(d=4,$fn=10);
    translate([caseDepth + caseWallThickness - 14 - 90,-60])circle(d=4,$fn=10);
}

module _case_cammount(){
    width = 43;
    depth = 32;
    
    translate([0,width/2,0])circle(d=3,$fn=10);
    translate([0,-width/2,0])circle(d=3,$fn=10);
    
    translate([depth,width/2,0])circle(d=3,$fn=10);
    translate([depth,-width/2,0])circle(d=3,$fn=10);
}

module _case_batterymount_single(){
    rad = 2;
    width = 20;
    
    hull(){
        translate([0,-width/2])circle(r=rad,$fn=10);
        translate([0,width/2])circle(r=rad,$fn=10);
    }
}

module _case_batterymount(){
    width = 25;
    depth = 40;
    translate([0,width])_case_batterymount_single();
    translate([0,-width])_case_batterymount_single();
    translate([depth,width])_case_batterymount_single();
    translate([depth,-width])_case_batterymount_single();
}


module _case_mountpoint_diff(){
    outerDia = 6;
    boltDia = 3;
    
    totalHeight = 30;
    nutHeight = 3;
    nutPos = 5;
    
    nutDia = 6;
    
    translate([0,0,-totalHeight])
    linear_extrude(totalHeight)
    circle(d=boltDia,$fn=10);
    
    translate([0,0,-totalHeight + nutPos])
    linear_extrude(nutHeight){
        hull(){
            circle(d=nutDia,$fn=6);
            translate([10,10,0])circle(d=nutDia,$fn=6);  
        }
    }
}

module _case_mountpoint_3d(){
    outerDia = 6;
    boltDia = 3;
    
    totalHeight = 30;
    nutHeight = 3;
    nutPos = 5;
    
    nutDia = 6;
    
    translate([0,0,-totalHeight]){
        linear_extrude(nutPos)
        difference(){
            circle(d=outerDia,$fn=10);
            circle(d=boltDia,$fn=10);
        }    
        translate([0,0,nutHeight + nutPos])
        linear_extrude(totalHeight - nutHeight - nutPos)
        difference(){
            circle(d=outerDia,$fn=10);
            circle(d=boltDia,$fn=10);
        }
    }

}


module _case_cover_innerrim(rimwidth){
    planeWidth = 1000;
    planeHeight = 1000;
    
    
echo ( rimwidth);
    difference(){
        translate([-planeWidth /2,-planeHeight / 2])
            square([planeWidth ,planeHeight]);
        
        minkowski(){
            difference(){
                translate([-planeWidth /2,-planeHeight / 2])
                    square([planeWidth ,planeHeight]);
            
                _case_basicshape();
            }
            circle(r=rimwidth,$fn=10);
        }
    }
}

module _case_cover_edgerim(){
    planeWidth = 1000;
    planeHeight = 1000;
    
    offset = 1.5;
    rimwidth = 4;
    
    difference(){
        minkowski(){
            _case_cover_innerrim(offset);
            circle(r=1,$fn=10);
            
        }
        _case_cover_innerrim(rimwidth);
        
        translate([0,-40])
        square([20,80]);//Room for battery strap

        translate([50,-30])
        square([200,60]);//Room for cameramount

        translate([0,caseRearWidth/2,0])circle(d=20,$fn=10);
        translate([0,-caseRearWidth/2,0])circle(d=20,$fn=10);
        translate([caseDepth,caseWidth/2,0])circle(d=20,$fn=10);
        translate([caseDepth,-caseWidth/2,0])circle(d=20,$fn=10);
    }
}

module _case_cover_3d(){

    difference(){
        linear_extrude(5)
        difference(){
            union(){
            _case_wall();
            _case_basicshape();
            }
            translate([caseDepth - 4,0])
                mirror([1,0])
                    _case_cammount();
            
            translate([3,0])
                _case_batterymount();
            
            
            translate([0,caseRearWidth/2,0])circle(d=3,$fn=10);
            translate([0,-caseRearWidth/2,0])circle(d=3,$fn=10);
            translate([caseDepth,caseWidth/2,0])circle(d=3,$fn=10);
            translate([caseDepth,-caseWidth/2,0])circle(d=3,$fn=10);
            
            
        }
    
        
        translate([20,70,0])
            rotate([0,0,90]){
            linear_extrude(5)
                _case_xt60_innerDimensions();
            translate([0,0,5/2])
            linear_extrude(5)
                _case_xt60_outerDimensions();
        }
    }
        
        translate([0,0,-1])
        linear_extrude(1)
        _case_cover_edgerim();

        
    mirror([0,0,1])
    linear_extrude(caseWallHeight - caseConnectorHeight - caseConnectorSize)
        difference(){
            _case_wall();
            difference(){
                _case_wall();
                translate([case_rightholeoffset,0])
                square([case_rightholesize,caseWidth]);
                
                mirror([0,1])
                translate([case_leftholeoffset,0])
                square([case_leftholesize,caseWidth]);
            }
        }
    
}

module _case_fan(){
    boltSpacing = 40;
    boltDia = 3;
    dia = 35;
    
    
    circle(d=dia);
    translate([boltSpacing/2,boltSpacing/2])circle(d=boltDia);
    translate([-boltSpacing/2,boltSpacing/2])circle(d=boltDia);
    translate([-boltSpacing/2,-boltSpacing/2])circle(d=boltDia);
    translate([boltSpacing/2,-boltSpacing/2])circle(d=boltDia);
    
}


module _case_wall_3d(){
    difference(){
        union(){
            linear_extrude(caseConnectorHeight)_case_wall();
            linear_extrude(caseWallHeight)
                difference(){
                    _case_wall();
                    translate([case_rightholeoffset,0])
                    square([case_rightholesize,caseWidth]);
                    
                    mirror([0,1])
                    translate([case_leftholeoffset,0])
                    square([case_leftholesize,caseWidth]);
                }
        }
        translate([0,0,caseWallHeight]){
            translate([0,caseRearWidth/2,0])mirror([0,1])_case_mountpoint_diff();
            translate([0,-caseRearWidth/2,0])mirror([0,0])_case_mountpoint_diff();
            translate([caseDepth,caseWidth/2,0])mirror([1,1])_case_mountpoint_diff();
            translate([caseDepth,-caseWidth/2,0])mirror([1,0])_case_mountpoint_diff(); 
        }
        
        
        translate([-10,30,caseWallHeight/2])
        rotate([0,90,0])
        linear_extrude(20)
        _case_fan();    
        translate([-10,-30,caseWallHeight/2])
        rotate([0,90,0])
        linear_extrude(20)
        _case_fan();
        
        
        translate([caseDepth + caseWallThickness + 1,0,25])
        rotate([0,-90,0])
        linear_extrude(caseWallThickness + 2)
        _controlpanel_mount();
        
    }
    
    
    translate([0,0,caseWallHeight]){
        translate([0,caseRearWidth/2,0])_case_mountpoint_3d();
        translate([0,-caseRearWidth/2,0])_case_mountpoint_3d();
        translate([caseDepth,caseWidth/2,0])_case_mountpoint_3d();
        translate([caseDepth,-caseWidth/2,0])_case_mountpoint_3d(); 
    }
    
    
    translate([caseDepth + caseWallThickness,0,25])
    rotate([90,0,90])
    linear_extrude(1)
    scale(0.1)
    _NHL_KCCV_Logo();
    
    


}


module _case_base_3d(){
    translate([0,0,-case_floorDepth])
    difference(){
        linear_extrude(case_floorDepth)
            union(){
                _case_wall();
                _case_base();
            }
            
        linear_extrude(case_floorDepth/2)                       //Sunk in screws for motherboard
        translate([motherboard_offset_x,motherboard_offset_y])
            _board_mountholes(8);
            
        }

    

    }
}

module CASE(){
    _case_wall_3d();
    _case_base_3d();
}

module COVER(){
    _case_cover_3d();
}


module PREVIEW(){
    translate([motherboard_offset_x,motherboard_offset_y])color("green")linear_extrude(25)_preview_motherboard();


    CASE();
    translate([0,0,170]) COVER(); 
}

CASE();
//rotate([180,0,0])
//COVER();
