/* "customers" jadvalidan:
2) -jadvaldagi har bir davlat uchun creditLimit larni yig`indisni chiqaring */

SELECT `country` AS 'davlat',
SUM(`creditLimit`) AS "kreditlar yig'indisi"
FROM `customers`
GROUP BY `country`
ORDER BY `country`;
/* davlat nomlari bo'yicha tartiblash:
+--------------+----------------------+
| davlat       | kreditlar yig'indisi |
+--------------+----------------------+
| Australia    |            430300.00 |
| Austria      |            117000.00 |
| Belgium      |            103400.00 |
| Canada       |            228600.00 |
| dedede       |             34000.00 |
| Denmark      |            204200.00 |
| Finland      |            285800.00 |
| France       |            932300.00 |
| Germany      |            257100.00 |
| Hong Kong    |             58600.00 |
| Ireland      |             69400.00 |
| Israel       |                 0.00 |
| Italy        |            388800.00 |
| Japan        |            175600.00 |
| Netherlands  |                 0.00 |
| New Zealand  |            362500.00 |
| Norway       |            273600.00 |
| Philippines  |             81500.00 |
| Poland       |                 0.00 |
| Portugal     |                 0.00 |
| Singapore    |            201700.00 |
| South Africa |                 0.00 |
| Spain        |            517800.00 |
| Sweden       |            169500.00 |
| Switzerland  |            141300.00 |
| UK           |            443700.00 |
| USA          |           2811700.00 |
+--------------+----------------------+
27 rows in set (0.00 sec)   */

SELECT `country` AS 'davlatlar',
SUM(`creditLimit`) AS "kreditlar yig'indisi"
FROM `customers`
GROUP BY `country`
ORDER BY `kreditlar yig'indisi` DESC;
/* kredit summalari kamayish tartibida saralash:
+--------------+----------------------+
| davlatlar    | kreditlar yig'indisi |
+--------------+----------------------+
| USA          |           2811700.00 |
| France       |            932300.00 |
| Spain        |            517800.00 |
| UK           |            443700.00 |
| Australia    |            430300.00 |
| Italy        |            388800.00 |
| New Zealand  |            362500.00 |
| Finland      |            285800.00 |
| Norway       |            273600.00 |
| Germany      |            257100.00 |
| Canada       |            228600.00 |
| Denmark      |            204200.00 |
| Singapore    |            201700.00 |
| Japan        |            175600.00 |
| Sweden       |            169500.00 |
| Switzerland  |            141300.00 |
| Austria      |            117000.00 |
| Belgium      |            103400.00 |
| Philippines  |             81500.00 |
| Ireland      |             69400.00 |
| Hong Kong    |             58600.00 |
| dedede       |             34000.00 |
| Poland       |                 0.00 |
| Portugal     |                 0.00 |
| Netherlands  |                 0.00 |
| South Africa |                 0.00 |
| Israel       |                 0.00 |
+--------------+----------------------+
27 rows in set (0.00 sec)   */