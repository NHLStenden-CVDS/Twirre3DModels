$_plateLenght = 50;
$_plateWidth = 29.2;
$_plateHeight = 2;
$_plateBaseHeight = 1.6;

$_poleDia = 11;
$_poleMountHeight = 30;
$_poleClearanceTop = 4;
$_poleClearanceBot = 31;

$_boltDia = 3.2;
$_boltClearance = 2;

module bolt(){
  cylinder(d=$_boltDia,$_plateHeight*3,$fn=15);  
}

module bottomPlate(){
    difference(){
        cube([  $_plateLenght,
                $_plateWidth + $_boltDia * 2 + $_boltClearance * 4,
                $_plateHeight + $_plateBaseHeight]);    //Main plate

        translate([ 0,
                    $_boltDia + $_boltClearance * 2,
                    $_plateHeight])
                    cube([  $_plateLenght,
                            $_plateWidth,
                            $_plateHeight]);
    
        translate([ $_plateLenght - ($_boltDia / 2 + $_boltClearance),
                    0 + ($_boltDia / 2 + $_boltClearance),
                    0]) bolt();

        translate([ 0 + ($_boltDia / 2 + $_boltClearance),
                    0 + ($_boltDia / 2 + $_boltClearance),
                    0]) bolt();
            
        translate([ $_plateLenght - ($_boltDia / 2 + $_boltClearance),
                    $_plateWidth + $_boltDia + $_boltClearance * 2 + ($_boltDia / 2 + $_boltClearance),
                    0]) bolt();

        translate([ 0 + ($_boltDia / 2 + $_boltClearance),
                    $_plateWidth + $_boltDia + $_boltClearance * 2 + ($_boltDia / 2 + $_boltClearance),
                    0]) bolt();
    }

    

}

module topPlate(){
    difference(){
        cube([  $_plateLenght,
                $_plateWidth + $_boltDia * 2 + $_boltClearance * 4,
                $_plateHeight]);    //Main plate

    
    translate([ $_plateLenght - ($_boltDia / 2 + $_boltClearance),
                0 + ($_boltDia / 2 + $_boltClearance),
                0]) bolt();

    translate([ 0 + ($_boltDia / 2 + $_boltClearance),
                0 + ($_boltDia / 2 + $_boltClearance),
                0]) bolt();
        
    translate([ $_plateLenght - ($_boltDia / 2 + $_boltClearance),
                $_plateWidth + $_boltDia + $_boltClearance * 2 + ($_boltDia / 2 + $_boltClearance),
                0]) bolt();

    translate([ 0 + ($_boltDia / 2 + $_boltClearance),
                $_plateWidth + $_boltDia + $_boltClearance * 2 + ($_boltDia / 2 + $_boltClearance),
                0]) bolt();
    }
    
    
    translate([$_plateLenght/2,$_plateWidth/2 + $_boltDia * 2 ,0])    
    difference(){
        cylinder(d1=$_poleDia + $_poleClearanceBot, d2=$_poleDia + $_poleClearanceTop, $_poleMountHeight, $fn=40);
        cylinder(d=$_poleDia, $_poleMountHeight, $fn=40);
    }
}



translate([$_plateLenght + 10,0,0])bottomPlate();
topPlate();