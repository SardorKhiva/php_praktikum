<?php
// 2-masala. Ushbu arrayni qo’llagan holda
// quyidagi matnni ekranga chiqaring.
// $web = array('Yii2', 'PHP', 'MySQL', 'jQuery', 'Postgre SQL');
// ‘Progress’ - Zamonaviy kasblar akademiyasida BACKEND DASTURLASH kursiga
// START beriladi.
// Veb dasturlash (Backend) | PHP, jQuery, MySQL, Postgre SQL, Yii2 va hk

$web = ['Yii2', 'PHP', 'MySQL', 'jQuery', 'Postgre SQL'];
$var = implode(', ', $web);
//echo $var;

$reklom = <<<HEREDOC
'Progress' - Zamonaviy kasblar akademiyasida BACKEND DASTURLASH kursiga START beriladi.
Veb dasturlash (Backend) | $var va hk 
HEREDOC;

echo $reklom . PHP_EOL;