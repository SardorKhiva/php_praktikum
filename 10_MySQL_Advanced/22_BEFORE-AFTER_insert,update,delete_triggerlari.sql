#             Ramazon 2025 Xiva taqvimi test bazasi misolida
#             AFTER DELETE TRIGGERIGA misol

DROP DATABASE IF EXISTS `Ramazon_2025_Xiva`;
CREATE DATABASE IF NOT EXISTS `Ramazon_2025_Xiva`;
USE `Ramazon_2025_Xiva`;
CREATE TABLE IF NOT EXISTS `taqvim`
(
    `Ramazon`       SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Hafta_kunlari` VARCHAR(10) NOT NULL,
    `Mart`          SMALLINT UNSIGNED,
    `Ogiz_yopish`   TIME        NOT NULL UNIQUE,
    `Ogiz_ochish`   TIME        NOT NULL UNIQUE
);

INSERT INTO `taqvim`(`Hafta_kunlari`, `Mart`, `Ogiz_yopish`, `Ogiz_ochish`)
VALUES ("Shanba", 1, '06:13', '18:53'),
       ("Yakshanba", 2, '06:11', '18:54'),
       ("Dushanba", 3, '06:10', '18:55'),
       ("Seshanba", 4, '06:08', '18:56'),
       ("Chorshanba", 5, '06:06', '18:57'),
       ("Payshanba", 6, '06:05', '18:58'),
       ("Juma", 7, '06:03', '19:00'),
       ("Shanba", 8, '06:02', '19:01'),
       ("Yakshanba", 9, '06:00', '19:02'),
       ("Dushanba", 10, '05:58', '19:03'),
       ("Seshanba", 11, '05:57', '19:04'),
       ("Chorshanba", 12, '05:55', '19:05'),
       ("Payshanba", 13, '05:53', '19:06'),
       ("Juma", 14, '05:51', '19:08'),
       ("Shanba", 15, '05:50', '19:09'),
       ("Yakshanba", 16, '05:48', '19:10'),
       ("Dushanba", 17, '05:46', '19:11'),
       ("Seshanba", 18, '05:45', '19:12'),
       ("Chorshanba", 19, '05:43', '19:13'),
       ("Payshanba", 20, '05:41', '19:14'),
       ("Juma", 21, '05:39', '19:15'),
       ("Shanba", 22, '05:37', '19:16'),
       ("Yakshanba", 23, '05:36', '19:17'),
       ("Dushanba", 24, '05:34', '19:18'),
       ("Seshanba", 25, '05:32', '19:20'),
       ("Chorshanba", 26, '05:30', '19:21'),
       ("Payshanba", 27, '05:28', '18:22'),
       ("Juma", 28, '05:27', '19:23'),
       ("Shanba", 29, '05:25', '19:24'),
       ("Yakshanba", 30, '05:23', '19:25');

SELECT *
FROM `taqvim`;
/*--------+---------------+------+-------------+-------------+
| Ramazon | Hafta_kunlari | Mart | Ogiz_yopish | Ogiz_ochish |
+---------+---------------+------+-------------+-------------+
|       1 | Shanba        |    1 | 06:13:00    | 18:53:00    |
|       2 | Yakshanba     |    2 | 06:11:00    | 18:54:00    |
|       3 | Dushanba      |    3 | 06:10:00    | 18:55:00    |
|       4 | Seshanba      |    4 | 06:08:00    | 18:56:00    |
|       5 | Chorshanba    |    5 | 06:06:00    | 18:57:00    |
|       6 | Payshanba     |    6 | 06:05:00    | 18:58:00    |
|       7 | Juma          |    7 | 06:03:00    | 19:00:00    |
|       8 | Shanba        |    8 | 06:02:00    | 19:01:00    |
|       9 | Yakshanba     |    9 | 06:00:00    | 19:02:00    |
|      10 | Dushanba      |   10 | 05:58:00    | 19:03:00    |
|      11 | Seshanba      |   11 | 05:57:00    | 19:04:00    |
|      12 | Chorshanba    |   12 | 05:55:00    | 19:05:00    |
|      13 | Payshanba     |   13 | 05:53:00    | 19:06:00    |
|      14 | Juma          |   14 | 05:51:00    | 19:08:00    |
|      15 | Shanba        |   15 | 05:50:00    | 19:09:00    |
|      16 | Yakshanba     |   16 | 05:48:00    | 19:10:00    |
|      17 | Dushanba      |   17 | 05:46:00    | 19:11:00    |
|      18 | Seshanba      |   18 | 05:45:00    | 19:12:00    |
|      19 | Chorshanba    |   19 | 05:43:00    | 19:13:00    |
|      20 | Payshanba     |   20 | 05:41:00    | 19:14:00    |
|      21 | Juma          |   21 | 05:39:00    | 19:15:00    |
|      22 | Shanba        |   22 | 05:37:00    | 19:16:00    |
|      23 | Yakshanba     |   23 | 05:36:00    | 19:17:00    |
|      24 | Dushanba      |   24 | 05:34:00    | 19:18:00    |
|      25 | Seshanba      |   25 | 05:32:00    | 19:20:00    |
|      26 | Chorshanba    |   26 | 05:30:00    | 19:21:00    |
|      27 | Payshanba     |   27 | 05:28:00    | 18:22:00    |
|      28 | Juma          |   28 | 05:27:00    | 19:23:00    |
|      29 | Shanba        |   29 | 05:25:00    | 19:24:00    |
|      30 | Yakshanba     |   30 | 05:23:00    | 19:25:00    |
+---------+---------------+------+-------------+------------*/

DROP TABLE IF EXISTS `log_taqvim`;
CREATE TABLE `log_taqvim`
(
    `Ramazon`       SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Hafta_kunlari` VARCHAR(10) NOT NULL,
    `Mart`          SMALLINT UNSIGNED,
    `Ogiz_ochish`   TIME        NOT NULL UNIQUE,
    `Ogiz_yopish`   TIME        NOT NULL UNIQUE,
    `deleted_at`    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TRIGGER IF EXISTS `taqvim_trigger`;
DELIMITER //
CREATE TRIGGER `taqvim_trigger`     -- trigger hosil qilish
    AFTER DELETE                    -- ma'lumot o'chirilgandan keyin
    ON `taqvim`                     -- qaysiki taqvim jadvalidan
    FOR EACH ROW                    -- har bir o'chirilgan qator uchun
    INSERT INTO `log_taqvim`        -- ma'o'chirilgan ma'lumotlarni `log_taqvim` jadvaliga yozish
    (Hafta_kunlari, Mart, Ogiz_ochish, Ogiz_yopish)     -- shu ustunlarga
    VALUES (OLD.Hafta_kunlari, OLD.Mart, OLD.Ogiz_ochish, OLD.Ogiz_yopish);  -- shu ustunlardan
DELIMITER ;

-- taqvimdagi o'tib ketgan kunlar
SELECT *
FROM `taqvim`
WHERE Mart < DAY(NOW());
/*--------+---------------+------+-------------+-------------+
| Ramazon | Hafta_kunlari | Mart | Ogiz_ochish | Ogiz_yopish |
+---------+---------------+------+-------------+-------------+
|       1 | Shanba        |    1 | 18:59:00    | 06:13:00    |
|       2 | Yakshanba     |    2 | 18:54:00    | 06:11:00    |
|       3 | Dushanba      |    3 | 18:55:00    | 06:10:00    |
|       4 | Seshanba      |    4 | 18:56:00    | 06:08:00    |
|       5 | Chorshanba    |    5 | 18:57:00    | 06:06:00    |
+---------+---------------+------+-------------+------------*/

-- o'tib ketgan kunlarni taqvimdan o'chiramiz
DELETE          -- o'chirilsin
FROM `taqvim`   -- taqvim jadvalidan
WHERE `Mart` < DAY(NOW());  -- qaysiki `Mart` oyidagi o'tib ketgan kunlar

SELECT *
FROM `log_taqvim`;
/*--------+---------------+------+-------------+-------------+---------------------+
| Ramazon | Hafta_kunlari | Mart | Ogiz_ochish | Ogiz_yopish | deleted_at          |
+---------+---------------+------+-------------+-------------+---------------------+
|       1 | Shanba        |    1 | 18:53:00    | 06:13:00    | 2025-03-06 00:43:04 |
|       2 | Yakshanba     |    2 | 18:54:00    | 06:11:00    | 2025-03-06 00:43:04 |
|       3 | Dushanba      |    3 | 18:55:00    | 06:10:00    | 2025-03-06 00:43:04 |
|       4 | Seshanba      |    4 | 18:56:00    | 06:08:00    | 2025-03-06 00:43:04 |
|       5 | Chorshanba    |    5 | 18:57:00    | 06:06:00    | 2025-03-06 00:43:04 |
+---------+---------------+------+-------------+-------------+--------------------*/

SELECT *
FROM `taqvim`;
/*--------+---------------+------+-------------+-------------+
| Ramazon | Hafta_kunlari | Mart | Ogiz_yopish | Ogiz_ochish |
+---------+---------------+------+-------------+-------------+
|       6 | Payshanba     |    6 | 06:05:00    | 18:58:00    |
|       7 | Juma          |    7 | 06:03:00    | 19:00:00    |
|       8 | Shanba        |    8 | 06:02:00    | 19:01:00    |
|       9 | Yakshanba     |    9 | 06:00:00    | 19:02:00    |
|      10 | Dushanba      |   10 | 05:58:00    | 19:03:00    |
|      11 | Seshanba      |   11 | 05:57:00    | 19:04:00    |
|      12 | Chorshanba    |   12 | 05:55:00    | 19:05:00    |
|      13 | Payshanba     |   13 | 05:53:00    | 19:06:00    |
|      14 | Juma          |   14 | 05:51:00    | 19:08:00    |
|      15 | Shanba        |   15 | 05:50:00    | 19:09:00    |
|      16 | Yakshanba     |   16 | 05:48:00    | 19:10:00    |
|      17 | Dushanba      |   17 | 05:46:00    | 19:11:00    |
|      18 | Seshanba      |   18 | 05:45:00    | 19:12:00    |
|      19 | Chorshanba    |   19 | 05:43:00    | 19:13:00    |
|      20 | Payshanba     |   20 | 05:41:00    | 19:14:00    |
|      21 | Juma          |   21 | 05:39:00    | 19:15:00    |
|      22 | Shanba        |   22 | 05:37:00    | 19:16:00    |
|      23 | Yakshanba     |   23 | 05:36:00    | 19:17:00    |
|      24 | Dushanba      |   24 | 05:34:00    | 19:18:00    |
|      25 | Seshanba      |   25 | 05:32:00    | 19:20:00    |
|      26 | Chorshanba    |   26 | 05:30:00    | 19:21:00    |
|      27 | Payshanba     |   27 | 05:28:00    | 18:22:00    |
|      28 | Juma          |   28 | 05:27:00    | 19:23:00    |
|      29 | Shanba        |   29 | 05:25:00    | 19:24:00    |
|      30 | Yakshanba     |   30 | 05:23:00    | 19:25:00    |
+---------+---------------+------+-------------+------------*/

/*
        Vaqt muhitlarini sozlash
SELECT @@global.time_zone, @@session.time_zone;
SET time_zone = '+5:00';
SET GLOBAL time_zone = '+5:00';
select now(), sysdate();
*/

--  ***************************************************************

#                       BEFORE INSERT
#  Jadvalga biror yangi qator qo'shishdan oldin BEFORE (oldin) INSERT (joylash) triggeri tushadi.
# Qolip:
DELIMITER $$                   -- ajratuvchi
CREATE TRIGGER `trigger_name`  -- shu nomli trigger hosil qilish
    BEFORE INSERT              -- joylashdan oldin ishlasin
    ON `table_name`            -- shu jadvalga bog'lansin, shu jadval o'zgarsa automat ishga tushadi
    FOR EACH ROW               -- har bir qatorlarni
    BEGIN                      -- agar SQL so'rov 1 dan ko'p bo'lsa BEGIN END orasiga yoziladi
        -- statements          -- bajariladigan so'rovlar
    END $$                     -- trigger tanasining tugashi

DELIMITER ;                    -- ajratuvchini standart holatga keltirish

/*
BEFORE INSERT triggerida, NEW (yangi qiymatlar)dan foydalanish va ularni
o'zgartirish mumkin. Ammo OLD (eski qiymatlar)dan foydalanib bo'lmaydi,
chunki oldigani qiymatlar hali mavjud bo'lmaydi.
*/

#     Misol:
/*
 `products` jadvalidan har bir product dan nechtadan omborda borligi ko'rsatilgan.
 Agar mijoz qaysidir product dan sotib olsa, omborda ham shuncha kamayishi kerak.
 Endi alohida jadval hosil qilamiz va shunga yozamiz.
 */

CREATE TABLE `ostatka`(
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `productNumber` VARCHAR(11) NOT NULL,
  `soni` INT NOT NULL
);

DELIMITER //
DROP TRIGGER IF EXISTS `ostatka_product_trigger`;
CREATE TRIGGER `ostatka_product_trigger`
BEFORE INSERT
On `orderdetails`
FOR EACH ROW
  BEGIN
     DECLARE `rowcount` INT;
     DECLARE `jami` INT DEFAULT 0;

     SELECT COUNT(*)
         INTO `rowcount`
      FROM `ostatka`
          WHERE `productNumber` = NEW.`productCode`;

     SELECT `quantityInStock`
         INTO `jami`
      FROM `products`
          WHERE `productCode` = NEW.`productCode`;

     IF `rowcount` > 0
         THEN
         UPDATE `ostatka`
             SET `soni` = `soni` - NEW.`quantityOrdered`;
     ELSE
         INSERT INTO `ostatka` (`productNumber`, `soni`)
           VALUES (NEW.`productCode`, `jami` - NEW.`quantityOrdered`);
     END IF;
  END//
  DELIMITER ;