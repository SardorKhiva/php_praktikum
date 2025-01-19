<?php
/*
(PHP 5 >= 5.5.0, PHP 7, PHP 8)
boolval — Возвращает логическое значение переменной
*/

echo '0:        '.(boolval(0) ? 'true' : 'false')."\n";
echo '42:       '.(boolval(42) ? 'true' : 'false')."\n";
echo '0.0:      '.(boolval(0.0) ? 'true' : 'false')."\n";
echo '4.2:      '.(boolval(4.2) ? 'true' : 'false')."\n";
echo '"":       '.(boolval("") ? 'true' : 'false')."\n";
echo '"string": '.(boolval("string") ? 'true' : 'false')."\n";
echo '"0":      '.(boolval("0") ? 'true' : 'false')."\n";
echo '"1":      '.(boolval("1") ? 'true' : 'false')."\n";
echo '[1, 2]:   '.(boolval([1, 2]) ? 'true' : 'false')."\n";
echo '[]:       '.(boolval([]) ? 'true' : 'false')."\n";
echo 'stdClass: '.(boolval(new stdClass) ? 'true' : 'false')."\n";
echo PHP_EOL . PHP_EOL;

echo "true:\n";
// bu holatda true bo'lsa 1 chiqadi
echo boolval(true) . PHP_EOL;
var_dump(boolval(true));
echo PHP_EOL . PHP_EOL;

echo "false:\n";
// aks holda hech narsa chiqmaydi
echo boolval(false) . PHP_EOL;
var_dump(boolval(false));
echo PHP_EOL . PHP_EOL;

echo "12:\n";
echo boolval(12) . PHP_EOL;
var_dump(boolval(12));
echo PHP_EOL . PHP_EOL;

echo "0:\n";
echo boolval(0) . PHP_EOL;
var_dump(boolval(0));
echo PHP_EOL . PHP_EOL;

echo " :\n";
echo boolval('') . PHP_EOL;
var_dump(boolval(''));
echo PHP_EOL . PHP_EOL;

echo "Matn:\n";
echo boolval("Matn") . PHP_EOL;
var_dump(boolval("Matn"));
echo PHP_EOL . PHP_EOL;
