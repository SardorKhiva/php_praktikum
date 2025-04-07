<?php
require '01_connect.php';

if ($conn->exec("TRUNCATE TABLE test.talaba") == true) {
    echo "\n\nTalaba jadvali tozalanmadi!\n\n";
} else {
    echo "\n\nTalaba jadvali tozalandi!\n\n";
};