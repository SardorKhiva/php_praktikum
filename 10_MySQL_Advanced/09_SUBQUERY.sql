#       SUBQUERY  -  so'rov ichida so'rov.
# Masala: USA da joylashgan ofisda ishlaydigan hodimlarni ismlarini chiqaring.
USE `mashq`;
SELECT *
FROM `employees`;
/*                                      dastlab shu jadvaldan                           shu ustundagi USA ga taaluqli satrlar tanlanadi(1,2,3)
+----------------+-----------+-----------+-----------+---------------------------------+------------+-----------+----------------------+
| employeeNumber | lastName  | firstName | extension | email                           | officeCode | reportsTo | jobTitle             |
+----------------+-----------+-----------+-----------+---------------------------------+------------+-----------+----------------------+
|           1002 | Murphy    | Diane     | x5800     | dmurphy@classicmodelcars.com    | 1          |      NULL | President            |
|           1056 | Patterson | Mary      | x4611     | mpatterso@classicmodelcars.com  | 1          |      1002 | VP Sales             |
|           1076 | Firrelli  | Jeff      | x9273     | jfirrelli@classicmodelcars.com  | 1          |      1002 | VP Marketing         |
|           1088 | Patterson | William   | x4871     | wpatterson@classicmodelcars.com | 6          |      1056 | Sales Manager (APAC) |
|           1102 | Bondur    | Gerard    | x5408     | gbondur@classiccar.com          | 2          |      1056 | Sale Manager (EMEA)  |
|           1143 | Bow       | Anthony   | x5428     | abow@classicmodelcars.com       | 1          |      1056 | Sales Manager (NA)   |
|           1165 | Jennings  | Leslie    | x3291     | ljennings@classicmodelcars.com  | 1          |      1143 | Sales Rep            |
|           1166 | Thompson  | Leslie    | x4065     | lthompson@classicmodelcars.com  | 1          |      1143 | Sales Rep            |
|           1188 | Firrelli  | Julie     | x2173     | jfirrelli@classiccars.com       | 2          |      1143 | Sales Rep            |
|           1216 | Jim       | KERRI     | x4334     | spatterson@classiccars.com      | 2          |      1143 | Sales Rep            |
|           1286 | Tseng     | Foon Yue  | x2248     | ftseng@classicmodelcars.com     | 3          |      1143 | Sales Rep            |
|           1323 | Vanauf    | George    | x4102     | gvanauf@classicmodelcars.com    | 3          |      1143 | Sales Rep            |
|           1337 | Bondur    | Loui      | x6493     | lbondur@classiccar.com          | 2          |      1102 | Sales Rep            |
|           1370 | Hernandez | Gerard    | x2028     | ghernande@classicmodelcars.com  | 4          |      1102 | Sales Rep            |
|           1501 | Bott      | Larry     | x2311     | lbott@classicmodelcars.com      | 7          |      1102 | Sales Rep            |
|           1504 | Jones     | Barry     | x102      | bjones@classicmodelcars.com     | 7          |      1102 | Sales Rep            |
|           1611 | Fixter    | Andy      | x101      | afixter@classicmodelcars.com    | 6          |      1088 | Sales Rep            |
|           1612 | Marsh     | Peter     | x102      | pmarsh@classicmodelcars.com     | 6          |      1088 | Sales Rep            |
|           1619 | King      | Tom       | x103      | tking@classicmodelcars.com      | 6          |      1088 | Sales Rep            |
|           1621 | Nishi     | Mami      | x101      | mnishi@classicmodelcars.com     | 5          |      1056 | Sales Rep            |
|           1625 | Kato      | Yoshimi   | x102      | ykato@classicmodelcars.com      | 5          |      1621 | Sales Rep            |
|           1702 | Gerard    | Martin    | x2312     | mgerard@classicmodelcars.com    | 4          |      1102 | Sales Rep            |
+----------------+-----------+-----------+-----------+---------------------------------+------------+-----------+---------------------*/

/*-USA da joylashgan ofislarni topib olamiz, ularning officeCode larini olamiz.
-IN yordamida USA da ishlaydigan employee larni olamiz.
*/
-- 1-kod:
SELECT `officeCode`
FROM `offices`
WHERE `country` = 'USA';
/*-----------+
| officeCode |
+------------+
| 1          |
| 2          |
| 3          |
+-----------*/

-- 2-kod:
SELECT `lastName`,
       `firstName`
FROM `employees`
WHERE officeCode IN (1, 2, 3);
-- SUBQUERY orqali bu yerda qavs ichidagilar topiladi

-- 2-kod ichiga 1-kod yozib SUBQUERY yozamiz
SELECT `lastName`, `firstName`
FROM `employees`
WHERE `officeCode` IN (SELECT `officeCode`
                       FROM `offices`
                       WHERE `country` = 'USA');
/*----------+-----------+
| lastName  | firstName |
+-----------+-----------+
| Murphy    | Diane     |
| Patterson | Mary      |
| Firrelli  | Jeff      |
| Bow       | Anthony   |
| Jennings  | Leslie    |
| Thompson  | Leslie    |
| Bondur    | Gerard    |
| Firrelli  | Julie     |
| Jim       | KERRI     |
| Bondur    | Loui      |
| Tseng     | Foon Yue  |
| Vanauf    | George    |
+-----------+-----------+
12 rows in set (0.00 sec) */

#       O'rtacha to'lovdan kattaroq to'lov qilgan mijozlarni topish
SELECT `amount`
FROM `payments`; -- to'lovlar jadvali

SELECT FLOOR(AVG(`amount`)) -- o'rtacha to'lovni yaxlitlaymiz
FROM `payments`;
/*--------------+
| AVG(`amount`) |
+---------------+
|  32431        |
+--------------*/

SELECT `amount`
FROM `payments`
WHERE amount > ( -- SUBQUERY start
    SELECT FLOOR(AVG(`amount`))
    FROM `payments`) -- SUBQUERY end
ORDER BY `amount`;

#           Eng ko'p to'lagan mijozni topish
SELECT `customerNumber`,
       `checkNumber`,
       `amount`
FROM `payments`
WHERE `amount` = (SELECT MAX(`amount`)
                  FROM `payments`);

#           Umuman buyurtma qilmagan mijozni topish
SELECT `customerName`
FROM `customers`
WHERE `customerNumber` NOT IN (SELECT DISTINCT `customerNumber`
                               FROM `orders`);

#           Eng ko'p, eng kam va o'rtacha nechta tovarli buyurtmalar sonini topish
SELECT MAX(`items`),
       MIN(`items`),
       FLOOR(AVG(`items`))
FROM (SELECT `orderNumber`,
             COUNT(`orderNumber`) AS 'items'
      FROM `orderdetails` `od`
      GROUP BY `orderNumber`) AS `lineitems`;

#       SUBQUERY ni WHERE qismida foydalanish
SELECT `productName`, `buyPrice`
FROM `products` `p1`
WHERE buyPrice > (SELECT AVG(`buyPrice`)
                  FROM `p1`
                  WHERE `productLine` = `p1`.`productLine`);

#       EXISTS / NOT EXISTS
SELECT `customerNumber`,
       `customerName`
FROM `customers`
WHERE EXISTS(SELECT 1 -- 1-ustun
             FROM `orders`
             WHERE `orders`.`customerNumber` = `customers`.`customerNumber`);

SELECT `customerNumber`,
       `customerName`
FROM `customers` `c`
WHERE NOT EXISTS(SELECT 1
                 FROM `orders` `o`
                 WHERE `o`.`customerNumber` = `c`.`customerNumber`);

#               SELECT da ishlatilishi
#    Har 1 buyurtma narhini aniqlash
SELECT `orderNumber`,
       (SELECT SUM(`quantityOrdered` * `priceEach`)
        FROM `orderdetails`
        WHERE `orderdetails`.`orderNumber` = `orders`.`orderNumber`) AS `od`
FROM `orders`;

