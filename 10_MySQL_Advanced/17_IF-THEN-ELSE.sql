# IF - THEN - ELSE

# IF operatori

# Protseduraning tanasida IF - shart operatoridan foydalanish mumkin.

# 💡 IF() funksiya bilan IF operatori boshqa boshqa narsalar.


/*
  IF shart operatorining 3 xil ko'rinishda ishlatish mumkin:

- `IF-THEN`
- `IF-THEN-ELSE`
- `IF-THEN-ELSEIF- ELSE`
 */

### `IF-THEN`

# Shart bajarilsagina uning tanasidagi amallar bajariladi.

/*
    Qolip:
			IF shart THEN
			   amallar;
			END IF;
*/

# Misol:

DELIMITER $$

CREATE PROCEDURE GetCustomerLevel(
    IN  `pCustomerNumber` INT,
    OUT `pCustomerLevel`  VARCHAR(20))
BEGIN
    DECLARE `credit` DECIMAL(10,2) DEFAULT 0;

    SELECT `creditLimit`
    INTO `credit`
    FROM `customers`
    WHERE `customerNumber` = `pCustomerNumber`;

    IF credit > 50000 THEN
        SET `pCustomerLevel` = 'PLATINUM';
    END IF;
END$$

DELIMITER ;


# Yuqoridagi `GetCustomerLevel()` protsedurasi 2 ta parametr qabul qiladi:
# `pCustomerNumber` va `pCustomerLevel`. `pCustomerNumber` ustuni bo'yicha
# `customers` jadvalidan `creditLimit` qiymatini aniqlab, `credit`  o'zgaruvchiga olamiz.
# OUT parametr bo'lgan `pCustomerLevel` ga "PLATINIUM" qiymatini beramiz qachonki,
# customerning  credit limiti 50000 dan katta bo'lsa.

-- creditLimit 50000 dan katta bo'lganlar
SELECT
    `customerNumber`,
    `creditLimit`
FROM
    `customers`
WHERE
    `creditLimit` > 50000
ORDER BY
    `creditLimit` DESC;

/* Natija:
+----------------+-------------+
| customerNumber | creditLimit |
+----------------+-------------+
|            141 |   227600.00 |
|            124 |   210500.00 |
|            298 |   141300.00 |
|            151 |   138500.00 |
|            187 |   136800.00 |
|            146 |   123900.00 |
*/

-- Endi protseduramizni chaqirib ishga tushiramiz:

CALL GetCustomerLevel(141, @level);
SELECT @level;

/* Natija:
+----------+
| @level   |
+----------+
| PLATINUM |
+---------*/

### **`IF-THEN-ELSE`**

/* Qolip:

			**IF condition THEN
			   statements;
ELSE
			   else-statements;
END IF;
*/

# Yuqoridagi `GerCustomerLevel()` protsedurasini o'chirib yangi protsedura yozamiz

DROP PROCEDURE GetCustomerLevel;
DELIMITER $$

CREATE PROCEDURE GetCustomerLevel(
    IN  `pCustomerNumber` INT,
    OUT `pCustomerLevel`  VARCHAR(20))
BEGIN
    DECLARE credit DECIMAL DEFAULT 0;

    SELECT `creditLimit`
    INTO `credit`
    FROM `customers`
    WHERE `customerNumber` = `pCustomerNumber`;

    IF credit > 50000 THEN
        SET `pCustomerLevel` = 'PLATINUM';
    ELSE
        SET `pCustomerLevel` = 'NOT PLATINUM';
    END IF;
    END$$

DELIMITER ;

# Ko'rib turganingizdek bu misolda `ELSE` qismi ham qo'shildi.
# Ya'ni agarda `IF` qismidagi shart bajarilsa `THEN` qismi ishga tushadi,
# agar shart bajarilmasa `ELSE` qismi ishga tushadi.
# Endi `ELSE` qismi ishlashini tekshiramiz.
# Buning uchun oldin creditLimit 50000 dan kam bo'lgan mijozlarni chiqarib,
# ular orasidan birortasini olib, protseduraga paramter sifatida beramiz:

SELECT
    `customerNumber`,
    `creditLimit`
FROM
    `customers`
WHERE
    `creditLimit` <= 50000
ORDER BY
    `creditLimit` DESC;

/* Natija:
+----------------+-------------+
| customerNumber | creditLimit |
+----------------+-------------+
|            447 |    49700.00 |
|            233 |    48700.00 |
|            452 |    45300.00 |
|            173 |    43400.00 |
*/

-- Endi protsedurani chaqiramiz
CALL GetCustomerLevel(447, @level);
SELECT @level;

/*Natija:
+--------------+
| @level       |
+--------------+
| NOT PLATINUM |
+-------------*/

-- Protsedurani ichidagi ELSE qismi muvaffaqiyatli ishladi.

### **`IF-THEN-ELSEIF-ELSE`**
/* Qolip:
		IF condition THEN
			   statements;
        ELSEIF elseif-condition THEN
			   elseif-statements;
    	ELSE
			   else-statements;
        END IF;
*/

DROP PROCEDURE GetCustomerLevel;

DELIMITER $$

CREATE PROCEDURE GetCustomerLevel(
    IN  `pCustomerNumber` INT,
    OUT `pCustomerLevel`  VARCHAR(20))
BEGIN
    DECLARE `credit` DECIMAL DEFAULT 0;

    SELECT `creditLimit`
    INTO `credit`
    FROM `customers`
    WHERE `customerNumber` = `pCustomerNumber`;

    IF credit > 50000 THEN
        SET `pCustomerLevel` = 'PLATINUM';
    ELSEIF `credit` <= 50000 AND `credit` > 10000 THEN
        SET `pCustomerLevel` = 'GOLD';
    ELSE
        SET `pCustomerLevel` = 'SILVER';
    END IF;
END $$

DELIMITER ;

# Yuqoridagi misolda `IF-THEN-ELSEIF-ELSE`  foydalanildi.
# Ya'ni `IF` qismidagi shart bajarilsa `THEN` qismi ishga tushadi,
# agar shart bajarilmasa, `ELSEIF` qilib yana boshqa shartlarga tekshiradi.
# Barcha shartlar bajarilmasa `ELSE` qismi ishga tushadi.


SHOW DATABASES; -- bazalarni ko'rish
USE `mashq`; -- mashq bazasini tanlash

DELIMITER // -- ; ni shu belgiga almashtirish
DROP PROCEDURE `to'lovlar`;
CREATE PROCEDURE `to'lovlar`(
    IN summa INT UNSIGNED, -- tashqaridan summa ga qiymat yuboriladi
    OUT `holat` VARCHAR(50) -- ichkarida holat ga ma'lumot yoziladi
)
BEGIN
    DECLARE `narh` NUMERIC(10, 2) DEFAULT 0.0; -- if uchun o'zgaruvchi
    SELECT `amount` -- amount ustunidagi narhlarni
    INTO `narh` -- narh o'zgaruvchisiga yozamiz
    FROM `payments` -- payments jadvalidan
    WHERE `amount` = `summa`; -- qaysiki tashqaridan kelgan summa o'zgaruvchisiga teng bo'lgan narhga teng bo'lsa

    IF `narh` < 1000 THEN -- agar narhi 1000 dan ko'p bo'lsa
        SET `holat` = "eng arzon"; -- holati yaxshi deb olinsin
    END IF;
END //
DELIMITER ;

CALL `to'lovlar`(1000, @holat);
SELECT @holat;

DELIMITER //
CREATE PROCEDURE `sotishNarhlari`(
    IN `product_code` VARCHAR(15),
    OUT `narhi` VARCHAR(30)
)
BEGIN
    DECLARE `narh` DECIMAL(10, 2) DEFAULT 0.0;
    SELECT `MSRP`
    INTO `narh`
    FROM `products`
    WHERE `product_code` = `productCode`;

    IF `narh` < 100 THEN
        SET `narhi` = '$100 dan arzon';
    ELSEIF `narh` < 100 THEN
        SET `narhi` = '$100 dan qimmat';
    END IF;

END //
DROP PROCEDURE sotishNarhlari;

CALL sotishNarhlari('S10_1678', @narhi);
SELECT @narhi;

/*                          1. IF — Условное выражение
IF используется для выполнения логических условий внутри запроса или выражения.

Применение IF в SQL-запросах:
Внутри SELECT для вычислений
           Внутри SET при изменении переменных
Внутри UPDATE при обновлении значений
                             Пример 1: Использование IF в SELECT    */
SHOW DATABASES;
USE `classicmodels`;
SHOW TABLES;

DESCRIBE `payments`;
SELECT *,
       IF(`amount` > 10000, "10 000 $ dan qimmat", " 10 000 $ dan arzon") AS `narh`
FROM `payments`;

