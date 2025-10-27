<?php

$yosh = 18;

if ($yosh == 18) {
    echo "Siz $yosh yoshdasiz";
} else {
    echo "Siz $yosh yoshdamassiz";
}
echo PHP_EOL;


if ($yosh < 18):
    echo "Siz $yosh yoshdan kichiksiz\n";
elseif ($yosh > 18):
    echo "Siz $yosh yoshdan kattasiz\n";
else:
    echo "Siz $yosh yoshdasiz\n";
endif;
echo PHP_EOL;

// php if ni ichida html ishlatishga misol:
if ($yosh < 18):
    ?>
    <p>Siz 18 yoshdan kichiksiz</p>
<?php
else:
    echo "Siz 18 yoshdan kattasiz\n";
endif;
echo PHP_EOL;