# CASE
# Shart operatorlaridan biri CASE dan protsedurada qanday foydalanishni o'rganamiz.


/*1- Qolip:

CASE case_value
   WHEN when_value1 THEN statements
   WHEN when_value2 THEN statements
   ...
   [ELSE else-statements]
END CASE;
*/

USE `classicmodels`;
SELECT DATABASE();
# Misol:

DELIMITER $$

CREATE PROCEDURE `GetCustomerShipping`(
    IN `pCustomerNUmber` INT,
    OUT `pShipping` VARCHAR(50)
)
BEGIN
    DECLARE `customerCountry` VARCHAR(100);

    SELECT `country`
    INTO `customerCountry`
    FROM `customers`
    WHERE `customerNumber` = `pCustomerNUmber`;

    CASE `customerCountry`
        WHEN 'USA' THEN SET `pShipping` = '2-day Shipping';
        WHEN 'Canada' THEN SET `pShipping` = '3-day Shipping';
        ELSE SET `pShipping` = '5-day Shipping';
        END CASE;
END$$

DELIMITER ;


CALL GetCustomerShipping(112, @shipping);
SELECT @shipping;

/* Natija:
+----------------+
| @shipping      |
+----------------+
| 2-day Shipping |
+---------------*/

/* 2 - Qolip
CASE
    WHEN search_condition1 THEN statements
    WHEN search_condition1 THEN statements
    ...
    [ELSE else-statements]
END CASE;
*/

# Misol:
DELIMITER $$

CREATE PROCEDURE `GetDeliveryStatus`(
    IN `pOrderNumber` INT,
    OUT `pDeliveryStatus` VARCHAR(100)
)
BEGIN
    DECLARE `waitingDay` INT DEFAULT 0;
    SELECT DATEDIFF(`requiredDate`, `shippedDate`)
    INTO `waitingDay`
    FROM `orders`
    WHERE `orderNumber` = `pOrderNumber`;

    CASE
        WHEN `waitingDay` = 0 THEN SET `pDeliveryStatus` = 'On Time';
        WHEN `waitingDay` >= 1 AND `waitingDay` < 5 THEN SET `pDeliveryStatus` = 'Late';
        WHEN `waitingDay` >= 5 THEN SET `pDeliveryStatus` = 'Very Late';
        ELSE SET `pDeliveryStatus` = 'No Information';
        END CASE;
END$$
DELIMITER ;

#                             CASE dan select da foydalanish:

SELECT SUM(CASE
               WHEN `status` = 'Shipped' THEN 1
               ELSE 0
    END)        AS 'Shipped',
       SUM(CASE
               WHEN `status` = 'On Hold' THEN 1
               ELSE 0
           END) AS 'On Hold',
       SUM(CASE
               WHEN `status` = 'In Process' THEN 1
               ELSE 0
           END) AS 'In Process',
       SUM(CASE
               WHEN `status` = 'Resolved' THEN 1
               ELSE 0
           END) AS 'Resolved',
       SUM(CASE
               WHEN `status` = 'Cancelled' THEN 1
               ELSE 0
           END) AS 'Cancelled',
       SUM(CASE
               WHEN `status` = 'Disputed' THEN 1
               ELSE 0
           END) AS 'Disputed',
       COUNT(*) AS Total
FROM `orders`;


SELECT SUM(CASE `status`
               WHEN 'Shipped' THEN 1
               ELSE 0
    END)        AS 'Shipped',
       SUM(CASE `status`
               WHEN 'On Hold' THEN 1
               ELSE 0
           END) AS 'On Hold',
       SUM(CASE `status`
               WHEN 'In Process' THEN 1
               ELSE 0
           END) AS 'In Process',
       SUM(CASE `status`
               WHEN 'Resolved' THEN 1
               ELSE 0
           END) AS 'Resolved',
       SUM(CASE `status`
               WHEN 'Cancelled' THEN 1
               ELSE 0
           END) AS 'Cancelled',
       SUM(CASE `status`
               WHEN 'Disputed' THEN 1
               ELSE 0
           END) AS 'Disputed',
       COUNT(*) AS Total
FROM `orders`;



SELECT COUNT(`status`) AS `holati`,
       `status`
FROM `orders`
GROUP BY `status`
ORDER BY `holati` DESC;

# hujjat qaysi faslga to'g'ri kelishini topuvchi protsedura:
DELIMITER //
CREATE PROCEDURE `buyurtmaFasl`(
    IN `hujjatRaqami` INT,
    OUT `qaysiFasl` VARCHAR(30)
)
BEGIN
    DECLARE `oyRaqami` TINYINT;

    SELECT MONTH(`orderDate`)
    INTO `oyRaqami`
    FROM `orders`
    WHERE `hujjatRaqami` = `orderNumber`;

    CASE
        WHEN `oyRaqami` IN (12, 1, 2) THEN SET `qaysiFasl` = 'qish';
        WHEN `oyRaqami` IN (3, 4, 5) THEN SET `qaysiFasl` = 'bahor';
        WHEN `oyRaqami` IN (6, 7, 8) THEN SET `qaysiFasl` = 'yoz';
        WHEN `oyRaqami` IN (9, 10, 11) THEN SET `qaysiFasl` = 'kuz';
        ELSE SET `qaysiFasl` = "bunday fasl yo'q";
        END CASE;

END//
DELIMITER ;
DROP PROCEDURE `buyurtmaFasl`;

CALL `buyurtmaFasl`(10100, @fasl);
SELECT @fasl;


-- qaysi faslda nechta buyurtma bo'lgan
DELIMITER //
CREATE PROCEDURE `buyurtmaSonFasl`(
    OUT `qish` INT, `bahor` INT, `yoz` INT, `kuz` INT
)
BEGIN
    SELECT SUM(MONTH(`orderDate`))
    INTO `oyRaqami`
    FROM `orders`
    GROUP BY `orderDate`;

    CASE
        WHEN `oyRaqami` IN (12, 1, 2) THEN SET `qaysiFasl` = 'qish';
        WHEN `oyRaqami` IN (3, 4, 5) THEN SET `qaysiFasl` = 'bahor';
        WHEN `oyRaqami` IN (6, 7, 8) THEN SET `qaysiFasl` = 'yoz';
        WHEN `oyRaqami` IN (9, 10, 11) THEN SET `qaysiFasl` = 'kuz';
        ELSE SET `qaysiFasl` = "bunday fasl yo'q";
        END CASE;

END//
DELIMITER ;
DROP PROCEDURE `buyurtmaFasl`;

CALL `buyurtmaFasl`(10100, @fasl);
SELECT @fasl;



SELECT CASE -- Использует CASE для определения времени года на основе месяца (MONTH(orderDate)).
           WHEN MONTH(orderDate) IN (12, 1, 2) THEN 'qish'
           WHEN MONTH(orderDate) IN (3, 4, 5) THEN 'bahor'
           WHEN MONTH(orderDate) IN (6, 7, 8) THEN 'yoz'
           WHEN MONTH(orderDate) IN (9, 10, 11) THEN 'kuz'
           ELSE "Noma\'lum"
           END  AS fasl,
       COUNT(*) AS buyurtmalar_soni -- Считает количество заказов в каждом времени года (COUNT(*) AS buyurtmalar_soni).
FROM orders
GROUP BY fasl; -- Группирует результаты по времени года (GROUP BY fasl).


DELIMITER //

CREATE PROCEDURE `buyurtmalarFasllar`()
BEGIN
    SELECT CASE
               WHEN MONTH(orderDate) IN (12, 1, 2) THEN 'qish'
               WHEN MONTH(orderDate) IN (3, 4, 5) THEN 'bahor'
               WHEN MONTH(orderDate) IN (6, 7, 8) THEN 'yoz'
               WHEN MONTH(orderDate) IN (9, 10, 11) THEN 'kuz'
               ELSE 'Noma\'lum'
               END  AS fasl,
           COUNT(*) AS buyurtmalar_soni
    FROM orders
    GROUP BY fasl;
END//

DELIMITER ;

-- Удаляем процедуру, если она уже существует
DROP PROCEDURE IF EXISTS buyurtmalarFasllar;

-- Вызываем процедуру
CALL buyurtmalarFasllar();


DELIMITER **
CREATE PROCEDURE `getCustomerShipping`(
    IN `pCustomerNumber` INT,
    OUT `pShipping` VARCHAR(50)
)
BEGIN
    DECLARE `customerCountry` VARCHAR(100);

    SELECT `country`
    INTO `customerCountry`
    FROM `customers`
    WHERE `customerNumber` = `pCustomerNumber`;

    CASE `customerCountry`
        WHEN 'USA' THEN SET `pShipping` = '2 kunda yetkaziladi';
        WHEN 'Canada' THEN SET `pShipping` = '3 kunda yetkaziladi';
        ELSE SET `pShipping` = '5 kunda yetkaziladi';
        END CASE;
END**
DELIMITER ;

CALL getCustomerShipping(113, @YURT);
SELECT @YURT;

SHOW DATABASES;
USE `classicmodels`;
SHOW TABLES; /*
| Tables\_in\_classicmodels |
| :--- |
| customers |
| employees |
| offices |
| orderdetails |
| orders |
| payments |
| productlines |
| products |    */

DESC `orders`; /*
| orderNumber |
| orderDate |
| requiredDate |
| shippedDate |
| status |
| comments |
| customerNumber |  */

SELECT DISTINCT DATEDIFF(`requiredDate`, `shippedDate`) AS "kun"
              , `orderNumber`                           AS 'hujjat raqami'
FROM `orders`
ORDER BY `kun`;

SELECT *
FROM orders
WHERE orderNumber = 10165;

SELECT `orderNumber`          AS `hujjat raqami`,
       MONTHNAME(`orderDate`) AS `oy`,
       `status`               AS `holati`,
       (CASE
            WHEN MONTH(`orderDate`) IN (12, 1, 2) THEN 'qish'
            WHEN MONTH(`orderDate`) IN (3, 4, 5) THEN 'bahor'
            WHEN MONTH(`orderDate`) IN (6, 7, 8) THEN 'yoz'
            WHEN MONTH(`orderDate`) IN (9, 10, 11) THEN 'kuz'
#            ELSE 'MAVJUDMAS!'      -- MONTH() funsiyasi 1 va 12 dan boshqa son qaytarmasa kerak?!
           END)               AS `fasl`
FROM `orders`;

# qaysi faslda nechta jami nechta buyurtma berilgan
SELECT (CASE
            WHEN MONTH(`orderDate`) IN (12, 1, 2) THEN 'qish'
            WHEN MONTH(`orderDate`) IN (3, 4, 5) THEN 'bahor'
            WHEN MONTH(`orderDate`) IN (6, 7, 8) THEN 'yoz'
            WHEN MONTH(`orderDate`) IN (9, 10, 11) THEN 'kuz'
    END)                    AS `fasl`,
       count(`orderNumber`) AS 'soni'
FROM `orders`
GROUP BY `fasl`;
/* jami hujjatlar
+-------+------+
| fasl  | soni |
+-------+------+
| qish  |   73 |
| bahor |   85 |
| yoz   |   54 |
| kuz   |  114 |
+-------+------+
4 rows in set (0.01 sec)    */

SELECT CASE
           WHEN MONTH(`orderDate`) IN (12, 1, 2) THEN 'qish'
           WHEN MONTH(`orderDate`) IN (3, 4, 5) THEN 'bahor'
           WHEN MONTH(`orderDate`) IN (6, 7, 8) THEN 'yoz'
           WHEN MONTH(`orderDate`) IN (9, 10, 11) THEN 'kuz'
           END            AS `fasl`,
       COUNT(`orderDate`) AS 'soni',
       `status`
FROM `orders`
WHERE `status` = 'Shipped'
GROUP BY `fasl`;
/* yetkazilganlar
+------+------+---------+
| fasl  | soni | status  |
+-------+------+---------+
| qish  |   72 | Shipped |
| bahor |   71 | Shipped |
| yoz   |   51 | Shipped |
| kuz   |  109 | Shipped |
+-------+------+---------+
4 rows in set (0.07 sec) */

# yetkazilgandan boshqa holatdagi hujjatlar haqida
SELECT (CASE
            WHEN MONTH(`orderDate`) IN (12, 1, 2) THEN 'qish'
            WHEN MONTH(`orderDate`) IN (3, 4, 5) THEN 'bahor'
            WHEN MONTH(`orderDate`) IN (6, 7, 8) THEN 'yoz'
            WHEN MONTH(`orderDate`) IN (9, 10, 11) THEN 'kuz'
    END)                  AS `fasl`,
       COUNT(`orderDate`) AS `soni`,
       `status`
FROM `orders`
WHERE (`status` IS NOT NULL)
  AND (`status` NOT IN ('Shipped'))
GROUP BY `fasl`, `status`
ORDER BY `soni` DESC;

SELECT (CASE
            WHEN MONTH(`orderDate`) IN (12, 1, 2) THEN 'qish'
            WHEN MONTH(`orderDate`) IN (3, 4, 5) THEN 'bahor'
            WHEN MONTH(`orderDate`) IN (6, 7, 8) THEN 'yoz'
            WHEN MONTH(`orderDate`) IN (9, 10, 11) THEN 'kuz'
    END)                  AS `fasl`,
       COUNT(`orderDate`) AS `soni`,
       `status`
FROM `orders`
WHERE (`status` IS NOT NULL)
  AND (`status` NOT IN ('Shipped'))
GROUP BY 1, 3 -- tepadagi bilan bir xil, bunda select dagi ustun tartib raqami kiritiladi
ORDER BY `soni` DESC;
/*------+------+------------+
| fasl  | soni | status     |
+-------+------+------------+
| bahor |    6 | In Process |
| yoz   |    3 | Cancelled  |
| bahor |    3 | On Hold    |
| bahor |    3 | Disputed   |
| kuz   |    2 | Resolved   |
| kuz   |    2 | Cancelled  |
| bahor |    1 | Cancelled  |
| kuz   |    1 | On Hold    |
| qish  |    1 | Resolved   |
| bahor |    1 | Resolved   |
+-------+------+------------+
10 rows in set (0.13 sec)   */

# jami buyurtma hujjatlari holatlari
SELECT DISTINCT `status`
FROM `orders`;

SELECT DISTINCT DATEDIFF(`requiredDate`, `shippedDate`)
FROM `customers`
         JOIN `orders`
              ON customers.customerNumber = orders.customerNumber;