/* 14-masala:
"TOP 10 CUSTOMER" masalasi
2003-yilda TOP 10 ta eng ko`p zakazlarni
amalga oshirgan mijozlarning ismi,
familyasi, nechta buyurtmani amalga
oshirgani haqida ma`limot chiqaring */
USE `mashq`;
SELECT `c`.`contactFirstName`                 AS 'ismi',
       `c`.`contactLastName`                  AS 'familyasi',
       COUNT(DISTINCT `od`.`quantityOrdered`) AS 'buyurtmalar_soni'
FROM `customers` `c`
         JOIN `orders` `o`
              ON `c`.`customerNumber` = `o`.`customerNumber`
         JOIN `orderdetails` `od`
              ON `o`.`orderNumber` = `od`.`orderNumber`
WHERE YEAR(`o`.`orderDate`) = 2003
GROUP BY `c`.`contactFirstName`, `c`.`contactLastName`
ORDER BY `buyurtmalar_soni` DESC
LIMIT 10;
/*----------+-----------+------------------+
| ismi      | familyasi | buyurtmalar_soni |    necha marta buyurtma qilinganligi
+-----------+-----------+------------------+
| Diego     | Freyre    |               26 |
| Eric      | Natividad |               26 |
| Susan     | Nelson    |               25 |
| Giovanni  | Rovelli   |               22 |
| Julie     | Brown     |               21 |
| Veysel    | Oeztan    |               20 |
| Wing      | Huang     |               19 |
| Anna      | O'Hara    |               18 |
| Juri      | Hashimoto |               18 |
| Jeff      | Young     |               18 |
+-----------+-----------+-----------------*/

/*--------+-----------+------------------+
| ismi    | familyasi | buyurtmalar_soni |
+---------+-----------+------------------+
| Wales   | MacKinlay |               50 |
| Wales   | MacKinlay |               50 |
| Julie   | Murphy    |               49 |
| Valarie | Franco    |               49 |
| Valarie | Franco    |               49 |
| Steve   | Thompson  |               48 |
| Diego   | Freyre    |               48 |
| Jeff    | Young     |               48 |
| Diego   | Freyre    |               48 |
| Diego   | Freyre    |               47 |
+---------+-----------+-----------------*/