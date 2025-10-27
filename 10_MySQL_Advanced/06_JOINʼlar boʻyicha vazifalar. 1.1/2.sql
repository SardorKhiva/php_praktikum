/* 2-masala:
"customers" jadvalidan, 141 nomerli mijozning ismi familyasi,
uning barcha yetkazilib berilgan buyurtmalarini nomerini,
buyurtma qilgan vaqti va yetkazilgan vaqtini chiqaring */
USE `mashq`;
SELECT * FROM `customers` LIMIT 3; /*
+----------------+----------------------------+-----------------+------------------+--------------+-------------------+--------------+-----------+----------+------------+-----------+------------------------+-------------+
| customerNumber | customerName               | contactLastName | contactFirstName | phone        | addressLine1      | addressLine2 | city      | state    | postalCode | country   | salesRepEmployeeNumber | creditLimit |
+----------------+----------------------------+-----------------+------------------+--------------+-------------------+--------------+-----------+----------+------------+-----------+------------------------+-------------+
|            103 | Atelier graphique          | Schmitt         | Carine           | 40.32.2555   | 54, rue Royale    | NULL         | Nantes    | NULL     | 44000      | France    |                   1370 |    21000.00 |
|            112 | Signal Gift Stores         | King            | Jean             | 7025551838   | 8489 Strong St.   | NULL         | Las Vegas | NV       | 83030      | USA       |                   1166 |    71800.00 |
|            114 | Australian Collectors, Co. | Ferguson        | Peter            | 03 9520 4555 | 636 St Kilda Road | Level 3      | Melbourne | Victoria | 3004       | Australia |                   1611 |   117300.00 |
+----------------+----------------------------+-----------------+------------------+--------------+-------------------+--------------+-----------+----------+------------+-----------+------------------------+------------*/

SELECT *
FROM `customers`
WHERE `customerNumber` = 141;
/*---------------+------------------------+-----------------+------------------+----------------+--------------------+--------------+--------+-------+------------+---------+------------------------+-------------+
| customerNumber | customerName           | contactLastName | contactFirstName | phone          | addressLine1       | addressLine2 | city   | state | postalCode | country | salesRepEmployeeNumber | creditLimit |
+----------------+------------------------+-----------------+------------------+----------------+--------------------+--------------+--------+-------+------------+---------+------------------------+-------------+
|            141 | Euro+ Shopping Channel | Freyre          | Diego            | (91) 555 94 44 | C/ Moralzarzal, 86 | NULL         | Madrid | NULL  | 28034      | Spain   |                   1370 |   227600.00 |
+----------------+------------------------+-----------------+------------------+----------------+--------------------+--------------+--------+-------+------------+---------+------------------------+------------*/
#         1                                     3                 2

SHOW CREATE TABLE `customers`; /*
FOREIGN KEY (`salesRepEmployeeNumber`)       <-- `customers` jadvalidagi `salesRepEmployeeNumber` ustuni
  REFERENCES `employees` (`employeeNumber`)  <-- `employees` jadvalidagi `employeeNumber` ustuniga bog'langan ekan
*/

SELECT `c`.`customerNumber` AS 'mijoz_id',
       `c`.`contactFirstName` AS 'ismi',
       `c`.`contactLastName` AS 'familyasi',
       `o`.`orderNumber` AS 'hujjat_raqami',
       `o`.`orderDate` AS 'hujjat_sanasi',
       `o`.`shippedDate` AS 'yetkazilgan_vaqti'
FROM `customers` `c`
JOIN `orders` `o`
ON `c`.`customerNumber` = `o`.`customerNumber`
WHERE `o`.`status` = 'Shipped'
  AND `c`.`customerNumber` = 141;
/*---------+--------+-----------+---------------+---------------+-------------------+
| mijoz_id | ismi   | familyasi | hujjat_raqami | hujjat_sanasi | yetkazilgan_vaqti |
+----------+--------+-----------+---------------+---------------+-------------------+
|      141 | Diego  | Freyre    |         10104 | 2003-01-31    | 2003-02-01        |
|      141 | Diego  | Freyre    |         10128 | 2003-06-06    | 2003-06-11        |
|      141 | Diego  | Freyre    |         10133 | 2003-06-27    | 2003-07-03        |
|      141 | Diego  | Freyre    |         10153 | 2003-09-28    | 2003-10-03        |
|      141 | Diego  | Freyre    |         10156 | 2003-10-08    | 2003-10-11        |
|      141 | Diego  | Freyre    |         10190 | 2003-11-19    | 2003-11-20        |
|      141 | Diego  | Freyre    |         10203 | 2003-12-02    | 2003-12-07        |
|      141 | Diego  | Freyre    |         10205 | 2003-12-03    | 2003-12-07        |
|      141 | Diego  | Freyre    |         10212 | 2004-01-16    | 2004-01-18        |
|      141 | Diego  | Freyre    |         10244 | 2004-04-29    | 2004-05-04        |
|      141 | Diego  | Freyre    |         10246 | 2004-05-05    | 2004-05-06        |
|      141 | Diego  | Freyre    |         10279 | 2004-08-09    | 2004-08-15        |
|      141 | Diego  | Freyre    |         10311 | 2004-10-16    | 2004-10-20        |
|      141 | Diego  | Freyre    |         10350 | 2004-12-02    | 2004-12-05        |
|      141 | Diego  | Freyre    |         10355 | 2004-12-07    | 2004-12-13        |
|      141 | Diego  | Freyre    |         10358 | 2004-12-10    | 2004-12-16        |
|      141 | Diego  | Freyre    |         10378 | 2005-02-10    | 2005-02-11        |
|      141 | Diego  | Freyre    |         10379 | 2005-02-10    | 2005-02-11        |
|      141 | Diego  | Freyre    |         10380 | 2005-02-16    | 2005-02-18        |
|      141 | Diego  | Freyre    |         10383 | 2005-02-22    | 2005-02-25        |
|      141 | Diego  | Freyre    |         10394 | 2005-03-15    | 2005-03-19        |
|      141 | Diego  | Freyre    |         10412 | 2005-05-03    | 2005-05-05        |
+----------+--------+-----------+---------------+---------------+-------------------+
22 rows in set (0.00 sec)  */
