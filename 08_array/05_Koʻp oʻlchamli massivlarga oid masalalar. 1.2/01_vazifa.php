<?php
// 1. Mamlakatlar massividan foydalanib
// jadval yarating va massiv elementlarini 
// chiqaring. (<table> dan foydalaning)

$mamlakatlar =
    [
        [
            "nomi" => "O'zbekiston",
            "aholi_soni" => "32979000",
            "maydoni" => "448978",
            "poytaxti" => "Toshkent",
            "pul_birligi" => "So'm",
        ],
        [
            "nomi" => "Qozog'iston",
            "aholi_soni" => "18157078",
            "maydoni" => "2724902",
            "poytaxti" => "Nursulton",
            "pul_birligi" => "Tanga",
        ],
        [
            "nomi" => "Turkmaniston",
            "aholi_soni" => "5125693",
            "maydoni" => "488100",
            "poytaxti" => "Ashxobod",
            "pul_birligi" => "Manat",
        ],
        [
            "nomi" => "Turkiya",
            "aholi_soni" => "80121000",
            "maydoni" => "783000",
            "poytaxti" => "Ankara",
            "pul_birligi" => "Turk lira",
        ],
        [
            "nomi" => "Rossiya",
            "aholi_soni" => "143000000",
            "maydoni" => "17340000",
            "poytaxti" => "Mosva",
            "pul_birligi" => "Rubl",
        ],
        [
            "nomi" => "Xitoy",
            "aholi_soni" => "1347374000",
            "maydoni" => "9596000",
            "poytaxti" => "Pekin",
            "pul_birligi" => "Yuan",
        ],
        [
            "nomi" => "AQSH",
            "aholi_soni" => "327000000",
            "maydoni" => "9631000",
            "poytaxti" => "Washington",
            "pul_birligi" => "Dollar",
        ]
    ];
?>

<!doctype html>
<html lang="UZ">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no,
          initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>Mamlakatlar</title>
    <style>
        table {
            border-collapse: collapse;
        }

        tr, th, td {
            padding: 5px;
            border: black 1px solid;
        }
    </style>
</head>
<body>
<table>
    <thead>
    <tr>
        <th>Davlat nomi</th>
        <th>Aholi soni</th>
        <th>Maydoni</th>
        <th>Poytaxti</th>
        <th>Pul birligi</th>
    </tr>
    </thead>
    <tbody>
    <?php foreach ($mamlakatlar as $mamlakat) : ?>
        <tr>
            <td>
                <?= $mamlakat['nomi'] ?>
            </td>
            <td>
                <?= number_format($mamlakat['aholi_soni'], 0, '.', ' ') ?>
            </td>
            <td>
                <?= number_format($mamlakat['maydoni'], 0, '.', ' ') ?>
            </td>
            <td>
                <?= $mamlakat['poytaxti'] ?>
            </td>
            <td>
                <?= $mamlakat['pul_birligi'] ?>
            </td>
        </tr>
    <?php endforeach; ?>
    </tbody>
</table>
</body>
</html>