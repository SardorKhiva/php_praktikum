/* "orders" jadvalidan:
customerNumber=141 bo`lgan mijoz,
2005-yilda qilgan buyurtmalarining,
nechtasi "Shipped" bo`lganini aniqlang  */
USE `mashq`;
SELECT `customerNumber` AS 'mijoz id',
  YEAR(`shippedDate`)   AS 'yil',
 COUNT(`status`)        AS 'yetkazilganlar soni'
FROM  `orders`
WHERE `status`        = 'Shipped'
AND `customerNumber`  = 141
AND YEAR(`orderDate`) = 2005
GROUP BY
    YEAR(`shippedDate`)
/*---------+------+---------------------+
| mijoz id | yil  | yetkazilganlar soni |
+----------+------+---------------------+
|      141 | 2005 |                   6 |
+----------+------+---------------------+
1 row in set (0.00 sec)  */

/* `orders` table
orderNumber    - buyurtma raqami
orderDate      - buyurtma olingan sana
requireDate    - buyurtma yetkazilishi kerak bo'lgan oxirgi muddat
shippedDate    - buyurtma yetkazilgan sana
status         - buyurtma holati
comments       - izohlar
customerNumber - buyurtma bergan mijoz raqami   */