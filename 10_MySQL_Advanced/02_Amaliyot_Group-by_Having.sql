/* 1-masala. "orders" jadvalidan:
har yilda nechtadan buyurtma qilinganini aniqlang   */
SHOW DATABASES; /* bazalar
+--------------------+
| Database           |
+--------------------+
| dars_demo          |
| information_schema |
| mashq              |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.00 sec)    */
USE `mashq`;
SHOW TABLES;    /*
+------------------+
| Tables_in_mashq  |
+------------------+
| current_dept_emp |
| customers        |
| departments      |
| employees        |
| offices          |
| orderdetails     |
| orders           |
| payments         |
| productlines     |
| products         |
+------------------+
10 rows in set (0.00 sec)   */

DESC `orders`;  /*
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| orderNumber    | int         | NO   | PRI | NULL    |       |
| orderDate      | date        | NO   |     | NULL    |       |
| requiredDate   | date        | NO   |     | NULL    |       |
| shippedDate    | date        | YES  |     | NULL    |       |
| status         | varchar(15) | NO   |     | NULL    |       |
| comments       | text        | YES  |     | NULL    |       |
| customerNumber | int         | NO   | MUL | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
7 rows in set (0.01 sec)    */

SELECT YEAR(`orderDate`) AS "Sotilish yili",
COUNT(*) AS "Buyurtmalar soni"
FROM `orders`
GROUP BY YEAR(`orderDate`); /*
+---------------+------------------+
| Sotilish yili | Buyurtmalar soni |
+---------------+------------------+
|          2003 |              111 |
|          2004 |              151 |
|          2005 |               64 |
+---------------+------------------+
3 rows in set (0.00 sec)    */

SELECT * FROM `orders` LIMIT 10; /*
+-------------+------------+--------------+-------------+---------+------------------------------------------------------------------------+----------------+
| orderNumber | orderDate  | requiredDate | shippedDate | status  | comments                                                               | customerNumber |
+-------------+------------+--------------+-------------+---------+------------------------------------------------------------------------+----------------+
|       10100 | 2003-01-06 | 2003-01-13   | 2003-01-10  | Shipped | NULL                                                                   |            363 |
|       10101 | 2003-01-09 | 2003-01-18   | 2003-01-11  | Shipped | Check on availability.                                                 |            128 |
|       10102 | 2003-01-10 | 2003-01-18   | 2003-01-14  | Shipped | NULL                                                                   |            181 |
|       10103 | 2003-01-29 | 2003-02-07   | 2003-02-02  | Shipped | NULL                                                                   |            121 |
|       10104 | 2003-01-31 | 2003-02-09   | 2003-02-01  | Shipped | NULL                                                                   |            141 |
|       10105 | 2003-02-11 | 2003-02-21   | 2003-02-12  | Shipped | NULL                                                                   |            145 |
|       10106 | 2003-02-17 | 2003-02-24   | 2003-02-21  | Shipped | NULL                                                                   |            278 |
|       10107 | 2003-02-24 | 2003-03-03   | 2003-02-26  | Shipped | Difficult to negotiate with customer. We need more marketing materials |            131 |
|       10108 | 2003-03-03 | 2003-03-12   | 2003-03-08  | Shipped | NULL                                                                   |            385 |
|       10109 | 2003-03-10 | 2003-03-19   | 2003-03-11  | Shipped | Customer requested that FedEx Ground is used for this shipping         |            486 |
+-------------+------------+--------------+-------------+---------+------------------------------------------------------------------------+----------------+
10 rows in set (0.00 sec)   */



/* 2-masala. "orderdetails" jadvalidan:
- har bir produkt nechtadan sotilganini soni bilan chiqaring    */

SELECT * FROM `orderdetails` LIMIT 10;  /*  jadval bilan tanishib olish
+-------------+-------------+-----------------+-----------+-----------------+
| orderNumber | productCode | quantityOrdered | priceEach | orderLineNumber |
+-------------+-------------+-----------------+-----------+-----------------+
|       10100 | S18_1749    |              30 |    136.00 |               3 |
|       10100 | S18_2248    |              50 |     55.09 |               2 |
|       10100 | S18_4409    |              22 |     75.46 |               4 |
|       10100 | S24_3969    |              49 |     35.29 |               1 |
|       10101 | S18_2325    |              25 |    108.06 |               4 |
|       10101 | S18_2795    |              26 |    167.06 |               1 |
|       10101 | S24_1937    |              45 |     32.53 |               3 |
|       10101 | S24_2022    |              46 |     44.35 |               2 |
|       10102 | S18_1342    |              39 |     95.55 |               2 |
|       10102 | S18_1367    |              41 |     43.13 |               1 |
+-------------+-------------+-----------------+-----------+-----------------+
10 rows in set (0.01 sec)   */

SELECT `productCode` AS "Mahsulot kodi",    -- 3- mahsulot kodi
COUNT(`productCode`) AS "Nechtadan sotildi" -- 4- yonidan nechta sotilgani chiqarilsin
FROM `orderdetails`                         -- 1- orderdetails jadvalidan
GROUP BY `productCode`;                     -- 2- productCode satrlaridagi bir xil yozuvlar guruhlansin
/* natija:
+---------------+----------------+
| Mahsulot kodi | Nechta sotildi |
+---------------+----------------+
| S10_1678      |             28 |
| S10_1949      |             28 |
| S10_2016      |             28 |
| S10_4698      |             28 |
| S10_4757      |             28 |
| S10_4962      |             28 |
| S12_1099      |             27 |
| S12_1108      |             27 |
| S12_1666      |             28 |
| S12_2823      |             28 |
| S12_3148      |             27 |
| S12_3380      |             27 |
| S12_3891      |             27 |
| S12_3990      |             27 |
| S12_4473      |             28 |
| S12_4675      |             27 |
| S18_1097      |             28 |
| S18_1129      |             27 |
| S18_1342      |             28 |
| S18_1367      |             28 |
| S18_1589      |             25 |
| S18_1662      |             28 |
| S18_1749      |             25 |
| S18_1889      |             27 |
| S18_1984      |             27 |
| S18_2238      |             28 |
| S18_2248      |             25 |
| S18_2319      |             28 |
| S18_2325      |             28 |
| S18_2432      |             28 |
| S18_2581      |             28 |
| S18_2625      |             28 |
| S18_2795      |             28 |
| S18_2870      |             25 |
| S18_2949      |             28 |
| S18_2957      |             28 |
| S18_3029      |             28 |
| S18_3136      |             28 |
| S18_3140      |             27 |
| S18_3232      |             53 |
| S18_3259      |             27 |
| S18_3278      |             27 |
| S18_3320      |             28 |
| S18_3482      |             27 |
| S18_3685      |             25 |
| S18_3782      |             27 |
| S18_3856      |             28 |
| S18_4027      |             27 |
| S18_4409      |             25 |
| S18_4522      |             27 |
| S18_4600      |             28 |
| S18_4668      |             28 |
| S18_4721      |             27 |
| S18_4933      |             24 |
| S24_1046      |             25 |
| S24_1444      |             28 |
| S24_1578      |             28 |
| S24_1628      |             25 |
| S24_1785      |             28 |
| S24_1937      |             28 |
| S24_2000      |             28 |
| S24_2011      |             27 |
| S24_2022      |             28 |
| S24_2300      |             28 |
| S24_2360      |             27 |
| S24_2766      |             25 |
| S24_2840      |             28 |
| S24_2841      |             28 |
| S24_2887      |             24 |
| S24_2972      |             27 |
| S24_3151      |             27 |
| S24_3191      |             25 |
| S24_3371      |             27 |
| S24_3420      |             28 |
| S24_3432      |             25 |
| S24_3816      |             28 |
| S24_3856      |             27 |
| S24_3949      |             28 |
| S24_3969      |             25 |
| S24_4048      |             27 |
| S24_4258      |             28 |
| S24_4278      |             28 |
| S24_4620      |             27 |
| S32_1268      |             28 |
| S32_1374      |             28 |
| S32_2206      |             27 |
| S32_2509      |             28 |
| S32_3207      |             27 |
| S32_3522      |             28 |
| S32_4289      |             28 |
| S32_4485      |             27 |
| S50_1341      |             28 |
| S50_1392      |             28 |
| S50_1514      |             27 |
| S50_4713      |             27 |
| S700_1138     |             27 |
| S700_1691     |             28 |
| S700_1938     |             27 |
| S700_2047     |             28 |
| S700_2466     |             28 |
| S700_2610     |             27 |
| S700_2824     |             28 |
| S700_2834     |             28 |
| S700_3167     |             28 |
| S700_3505     |             27 |
| S700_3962     |             27 |
| S700_4002     |             28 |
| S72_1253      |             28 |
| S72_3212      |             27 |
+---------------+----------------+
109 rows in set (0.00 sec)      */


/*  3-masala. "productVendor" ustuni bo‘yicha guruhlansin.
Skladda har bir vendorda jami 45000 dan ortiq produkt bor bo'lganlarni chiqaring        */
SELECT `productVendor` AS "Mahsulot yetkazib beruvchilar", -- 4- `productvendor` sarlavhasini "Mahsulot yetkazib beruvchilar" deb va
SUM(`quantityInStock`) AS "Soni"                           -- 5- `quantityInStock` sarlavhasini "Soni" deb chiqarsin
FROM `products`                                            -- 1- products jadvalidagi
GROUP BY `productVendor`                                   -- 2- productVendor ustunidagi satrlarni guruhlab
HAVING SUM(`quantityInStock`) > 45000;                     -- 3- 45 000 dan ziyod mahsulot soni borlarni
/*  natija:
+----------------------------+-------+
| Mahsulot yetkazib beruvchi | Soni  |
+----------------------------+-------+
| Min Lin Diecast            | 50089 |
| Classic Metal Creations    | 45408 |
| Welly Diecast Productions  | 45095 |
| Gearbox Collectibles       | 60495 |
+----------------------------+-------+
4 rows in set (0.00 sec)    */