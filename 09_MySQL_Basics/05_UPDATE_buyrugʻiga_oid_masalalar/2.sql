/* 2)"customers" jadvalidan:
Alexander Semenov ni telefon
nomerini "+7 812 293 3311" ga,
creditLimitini 34000 ga o`zgartiring */

SHOW DATABASES;
USE `Mashq`;

SELECT *
FROM `customers`;

SELECT *
FROM `customers`
WHERE
    `contactLastName` = " Semenov" AND
    `contactFirstName` = "Alexander";
/* Natija:
+----------------+--------------+-----------------+------------------+-------------------+--------------+--------------+------+-------+------------+---------+------------------------+-------------+
| customerNumber | customerName | contactLastName | contactFirstName | phone             | addressLine1 | addressLine2 | city | state | postalCode | country | salesRepEmployeeNumber | creditLimit |
+----------------+--------------+-----------------+------------------+-------------------+--------------+--------------+------+-------+------------+---------+------------------------+-------------+
|            480 | DEDE         |  Semenov        | Alexander        | +7 812 293 3311 5 | FRFRFR       | NULL         | dede | NULL  | NULL       | dedede  |                   NULL |    34000.00 |
+----------------+--------------+-----------------+------------------+-------------------+--------------+--------------+------+-------+------------+---------+------------------------+-------------+
1 row in set (0.00 sec) */

UPDATE `customers`
SET `phone` = "+7 812 293 3311",
    `creditLimit` = 34000,
    `contactLastName` = "Semenov"       -- Semenov dan oldingi probelni yo;qotish
WHERE
    `contactLastName` = " Semenov" AND
    `contactFirstName` = "Alexander";
/* Natija:
+----------------+--------------+-----------------+------------------+-----------------+--------------+--------------+------+-------+------------+---------+------------------------+-------------+
| customerNumber | customerName | contactLastName | contactFirstName | phone           | addressLine1 | addressLine2 | city | state | postalCode | country | salesRepEmployeeNumber | creditLimit |
+----------------+--------------+-----------------+------------------+-----------------+--------------+--------------+------+-------+------------+---------+------------------------+-------------+
|            480 | DEDE         | Semenov         | Alexander        | +7 812 293 3311 | FRFRFR       | NULL         | dede | NULL  | NULL       | dedede  |                   NULL |    34000.00 |
+----------------+--------------+-----------------+------------------+-----------------+--------------+--------------+------+-------+------------+---------+------------------------+-------------+
1 row in set (0.00 sec) */
