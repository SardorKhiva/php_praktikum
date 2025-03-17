<?php

$servername = 'localhost';
$username = 'root';
$password = '1302';
$dbname = 'test';

// mysqli orqali ulanish
try {
    $conn_mysqli = new mysqli($servername, $username, $password, $dbname);
    if ($conn_mysqli->connect_error === null) {
//        echo "Connected successfully";
    }
//} catch (mysqli_sql_exception $e) {   // bu ham ishlarkan
} catch (Exception $e) {                // bu ham ishlaydi
    echo "mysqli orqali bazaga ulanishda xatolik: " . $e->getMessage() . PHP_EOL;
//    print_r($e);                      // xatolikni chuqurroq tahlil qilish
}

// PDO orqali ulanish
try {
    $conn = new PDO("mysql: host = $servername; dbname = $dbname", $username, $password);
//    echo "Connected successfully." . PHP_EOL;
} catch (PDOException $e) {
    echo "PDO orqali bazaga ulanishda xatolik: " . $e->getMessage();
}

/*
PhpStorm 2024.3.5
Build #PS-243.26053.13, built on March 12, 2025
Licensed to Sardor Khorazmiy
Subscription is active until March 24, 2025.
Runtime version: 21.0.6+8-b631.39 amd64 (JCEF 122.1.9)
VM: OpenJDK 64-Bit Server VM by JetBrains s.r.o.
Toolkit: sun.awt.windows.WToolkit
Windows 11.0
GC: G1 Young Generation, G1 Concurrent GC, G1 Old Generation
Memory: 2048M
Cores: 12
Registry:
  run.processes.with.pty=TRUE
  ide.experimental.ui=true
Non-Bundled Plugins:
  com.dodecahedron.plugin (1.0.6.1)
  com.eversql.plugins.jetbrains (2.0.5)
  com.wakatime.intellij.plugin (15.0.3)
  ski.chrzanow.foldableprojectview (2.0.0)
  izhangzhihao.rainbow.brackets (2024.2.9-241)
  net.king2500.plugins.PhpAdvancedAutoComplete (1.1.0)
  mobi.hsz.idea.gitignore (4.5.6)
*/