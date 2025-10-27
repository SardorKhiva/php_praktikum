<?php
// 10. Berilgan matnni teskarisini chiqaring.
// "Salom" => "molaS"

echo "Matn kiriting: ";
$matn = trim(fgets(STDIN));

// I usul
echo "Teskarisi: ";
echo strrev($matn) . PHP_EOL;
$matn2 = $matn;

// II usul
echo "Teskarisi: ";
$uzunlik = mb_strlen($matn2) - 1;
for ($i = $uzunlik; $i >= 0; $i--) {
    echo $matn2[$i];
}
echo PHP_EOL;

// III usul
$matn3 = '';
$uzunlik = mb_strlen($matn) - 1;
for ($i = $uzunlik; $i >= 0; $i--) {
    $matn3 .= $matn[$i];
}
echo "Teskarisi: $matn3" . PHP_EOL;
