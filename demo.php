<?php
/*
$x = 5;
$y = 5;

if ($x++ == 5 && $y++ == 6) {
    echo "True";
} else {
    echo "False";
}

echo " x=$x y=$y";  // False x=6 y=6

*/

/*
$x = 10;
$y = 20;

if ($x > $y + $y != 3) {
//    $x > $y + $y != 3
//      $x + $y
// $x > 40 != 3
// false != 3 (0 dan farqli son true)
// false != true
    print "True";
} else {
    print "False";
}

// natija true
*/

/*
switch ($b) {
    case false:
    {
        print "False";  // shu
        break;
    }
    case 'b':
    {
        print "True";
        break;
    }
}
*/

/*
$a = 9;
$b = 10;
if ($a == $b || ++$a > $b){
    echo 'shart 1';
} elseif($a > $b || ++$a > $b){
    echo 'shart 2';
} else {
    echo 'shart 3';
}
*/

/* hech narsa chiqmaydi
$a = "1";
$b = "0";

//echo (int)$a && $b;
echo (int)"1" && "0";
*/

/*
$x = '';
if ($x == 0)
    print "true" ;
else
    print "false";
    print "true";
*/

$num = abs(93 - 103);
switch ($num) {
    case '10':
        echo "string 10";       // bu chiqadi:
        break;
    case 10:
        echo "10";
        break;
    default:
        echo "boshqa";
}