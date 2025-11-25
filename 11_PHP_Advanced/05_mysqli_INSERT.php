<?php

require('01_old_connect.php');

$sql_insert = "INSERT INTO `test`.`talaba` (`firstname`, `lastname`)
VALUES ('Sardor', 'asdf')";

if ($conn->query($sql_insert)) {
    echo 'Jadvalga $sql_insert INSERT qilindi' . PHP_EOL;
} else {
    echo 'INSERT qilinmadi' . $conn->error . PHP_EOL;
}

// multi_query()    -    ko'p so'rovni bir vaqtda bajarish

$multi_query = "INSERT INTO `test`.`talaba` (`firstname`, `lastname`)
               VALUES('SAGV', 'DSHB'); ";

$multi_query .= "INSERT INTO `test`.`talaba` (`firstname`, `lastname`)
                VALUES ('svbf', 'debh')";

if ($conn->multi_query($multi_query)) {
    echo 'Jadvalga multi_query() orqali INSERT qilindi' . PHP_EOL;
} else {
    echo 'multi_query() orqali INSERT qilinmadi' . $conn->error . PHP_EOL;
}