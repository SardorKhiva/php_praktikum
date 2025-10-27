/* 13-masala:
2003-yil dekabr oyida,
eng kam sonli zakazni qilgan
mijozni ismi, familyasi,
buyurtma yetkazilgan vaqti va
buyurtma id sini chiqaring. */

USE `mashq`;
SELECT `od`.`quantityOrdered` AS 'buyurtmalar_soni',
       `c`.`contactFirstName` AS 'ismi',
       `c`.`contactLastName` AS 'familyasi',
       `o`.`shippedDate` AS 'yetkazilgan_sanasi',
       `o`.`orderNumber` AS 'buyurtma_id'
FROM `customers` `c`
JOIN `orders`    `o`
  ON `c`.`customerNumber` = `o`.`customerNumber`
JOIN `orderdetails` `od`
  ON `o`.`orderNumber` = `od`.`orderNumber`
WHERE YEAR(`o`.`orderDate`)    = 2003
  AND YEAR(`o`.`shippedDate`)  = 2003
  AND MONTH(`o`.`orderDate`)   = 12
  AND MONTH(`o`.`shippedDate`) = 12
ORDER BY `od`.`quantityOrdered` -- ASC da 20 ta buyurtma  , DESC da esa 50 ta buyurtma
LIMIT 1;
/* bu eng kam buyurtma qilgan mijoz
+------------------+--------+-----------+--------------------+-------------+
| buyurtmalar_soni | ismi   | familyasi | yetkazilgan_sanasi | buyurtma_id |
+------------------+--------+-----------+--------------------+-------------+
|               20 | Diego  | Freyre    | 2003-12-07         |       10203 |
+------------------+--------+-----------+--------------------+------------*/

/* bu eng ko'p buyurtma qilgan mijoz
+------------------+-------+-----------+--------------------+-------------+
| buyurtmalar_soni | ismi  | familyasi | yetkazilgan_sanasi | buyurtma_id |
+------------------+-------+-----------+--------------------+-------------+
|               50 | Wales | MacKinlay | 2003-12-06         |       10202 |
+------------------+-------+-----------+--------------------+------------*/