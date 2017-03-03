$fn = 30;

module _baseMountFlat(MainBoltSunked){
    width = 50;
    height = 50;
    horSpacing = 40;
    vertSpacing = 32;
    edgeRadi = 5;
    mountDia = 3;
    pivotDistance = 41;
    
    
    difference(){
        hull(){
            translate([width/2-edgeRadi,height/2-edgeRadi])circle(r=edgeRadi);
            translate([-width/2+edgeRadi,height/2-edgeRadi])circle(r=edgeRadi);
            
            translate([width/2-edgeRadi,-height/2+edgeRadi])circle(r=edgeRadi);
            translate([-width/2+edgeRadi,-height/2+edgeRadi])circle(r=edgeRadi);
            
            intersection(){
                translate([0,-18])
                circle(r=pivotDistance+6);
                translate([-width/2,0])
                square([width,2000]);
            }
        }
        
        translate([-horSpacing/2,-vertSpacing/2])circle(d=mountDia);
        translate([horSpacing/2,-vertSpacing/2])circle(d=mountDia);
        translate([-horSpacing/2,vertSpacing/2])circle(d=mountDia);
        translate([horSpacing/2,vertSpacing/2])circle(d=mountDia);
        
        
        
        if(MainBoltSunked){
            translate([0,-18])circle(d=9.2,$fn=6);
        }else{
            translate([0,-18])circle(d=5);            
        }
        translate([0,-18])
            for(i = [-10:0.5:10]){
                rotate([0,0,i])
                    translate([0,pivotDistance])circle(d=5);
        }
    }
}


module baseMount(){
    linear_extrude(2)
    _baseMountFlat(false);
    translate([0,0,2])
    linear_extrude(2)
    _baseMountFlat(true);
}

//baseMount();

width = 32;
height = 53;
edge = 33;
edgeRadi = 3;
pivotBoltDia = 5;
pivotDistance = 41;

module _camBaseFlat(camHorSpacing, camVertSpacing, camDia, MainBoltSunked){

    
    difference(){
        hull(){
            translate([width/2,0])circle(r=edgeRadi);
            translate([-width/2,0])circle(r=edgeRadi);
            translate([width/2,edge])circle(r=edgeRadi);
            translate([-width/2,edge])circle(r=edgeRadi);
            translate([0,height])circle(r=edgeRadi);
        }
        
        if(MainBoltSunked){
            translate([0,pivotBoltDia])
                circle(d=9.2,$fn=6);
            translate([0,pivotBoltDia + pivotDistance])
                circle(d=8.5);
            
            
            translate([camHorSpacing/2,edge/2 - camVertSpacing/2])circle(d=camDia);
            translate([-camHorSpacing/2,edge/2 - camVertSpacing/2])circle(d=camDia);
            translate([camHorSpacing/2,edge/2 + camVertSpacing/2])circle(d=camDia);
            translate([-camHorSpacing/2,edge/2 + camVertSpacing/2])circle(d=camDia);
        }else{
            translate([0,pivotBoltDia])
                circle(d=pivotBoltDia);
            translate([0,pivotBoltDia + pivotDistance])
                circle(d=pivotBoltDia);
            
            
            translate([camHorSpacing/2,edge/2 - camVertSpacing/2])circle(r=camDia);
            translate([-camHorSpacing/2,edge/2 - camVertSpacing/2])circle(r=camDia);
            translate([camHorSpacing/2,edge/2 + camVertSpacing/2])circle(r=camDia);
            translate([-camHorSpacing/2,edge/2 + camVertSpacing/2])circle(r=camDia);

        }
        
    }
}

module camBase(camHorSpacing, camVertSpacing, camDia, text){
    hBot = 2;
    hTop = 4;
    textDepth = 1;
       
    difference(){
        union(){
            linear_extrude(hBot)
            _camBaseFlat(camHorSpacing, camVertSpacing, camDia, false);
            translate([0,0,hBot])
                linear_extrude(hTop)
                    _camBaseFlat(camHorSpacing, camVertSpacing, camDia, true);
            }
        translate([0,20,hBot+hTop - textDepth + 0.1])
        linear_extrude(textDepth)
        scale(0.4)
        text(text,halign ="center",font="Verdana:style=Bold");
    }
}

baseMount();

translate([0,40])camBase(24,25,3,"XIMEA");