<?php

require('01_old_connect.php');

$sql_insert = "INSERT INTO test.talaba (firstname, lastname, email)
VALUES ('Sardor', 'asdf', 'dszgf')";

if ($conn->query($sql_insert) == TRUE) {
    echo 'Jadvalga INSERT qilindi' . PHP_EOL;
} else {
    echo 'INSERT qilinmadi' . $conn->error . PHP_EOL;
}

// multi_query()    -    ko'p so'rovni bir vaqtda bajarish

$multi_query = "INSERT INTO test.talaba (firstname, lastname, email)
               VALUES('SAGV', 'DSHB', 'SAEDHN')";

$multi_query .= "INSERT INTO test.talaba (firstname, lastname, email)
                VALUES ('svbf', 'debh', 'sdabh')";

if ($conn->query($multi_query) == TRUE) {
    echo 'Jadvalga multi_query() orqali INSERT qilindi' . PHP_EOL;
} else {
    echo 'multi_query() orqali INSERT qilinmadi' . $conn->error . PHP_EOL;
}