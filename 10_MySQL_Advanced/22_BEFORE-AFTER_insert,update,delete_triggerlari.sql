USE `classicmodels`;
#                       BEFORE INSERT
#  Jadvalga biror yangi qator qo'shishdan oldin BEFORE (oldin) INSERT (joylash) triggeri tushadi.
# Qolip:
DELIMITER $$ -- ajratuvchi
CREATE TRIGGER `trigger_name` -- shu nomli trigger hosil qilish
    BEFORE INSERT -- joylashdan oldin ishlasin
    ON `table_name` -- shu jadvalga bog'lansin, shu jadval o'zgarsa automat ishga tushadi
    FOR EACH ROW -- har bir qatorlarni
BEGIN -- agar SQL so'rov 1 dan ko'p bo'lsa BEGIN END orasiga yoziladi
    -- statements          -- bajariladigan so'rovlar
END $$ -- trigger tanasining tugashi

DELIMITER ; -- ajratuvchini standart holatga keltirish

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

-- Ostatka jadvalini yaratish: mahsulot qoldiqlarini saqlash uchun.
CREATE TABLE `ostatka`
(
    `id`            INT AUTO_INCREMENT PRIMARY KEY, -- "id": Har bir yozuv uchun noyob raqam; avtomatik ravishda oshadi va asosiy kalit sifatida ishlatiladi.
    `productNumber` VARCHAR(11) NOT NULL,           -- "productNumber": Mahsulot raqami (maksimal 11 ta belgi), bo'sh bo'lishi mumkin emas.
    `soni`          INT         NOT NULL            -- "soni": Mahsulotning qoldiq miqdori, butun son; qiymat bo'sh bo'lishi mumkin emas.
);

-- SQL buyruqlari oxirini belgilash uchun delimiter o'zgarishi: standart ';' o'rniga '//' ishlatilmoqda.
DELIMITER //

-- Agar "ostatka_product_trigger" trigger mavjud bo'lsa, uni o'chirib tashlash.
DROP TRIGGER IF EXISTS `ostatka_product_trigger`;

-- "ostatka_product_trigger" nomli trigger yaratish.
CREATE TRIGGER `ostatka_product_trigger`
    BEFORE INSERT -- Trigger "orderdetails" jadvaliga yangi yozuv qo'shilishidan oldin ishga tushadi.
    ON `orderdetails` -- Trigger "orderdetails" jadvali uchun amal qiladi.
    FOR EACH ROW -- Har bir qo'shilayotgan yozuv uchun alohida trigger bajariladi.
BEGIN -- trigger amaliyot tanasining boshi
    -- "rowcount" o'zgaruvchisini e'lon qilish: "ostatka" jadvalidagi mos yozuvlar sonini saqlash uchun.
    DECLARE `rowcount` INT;

    -- "jami" o'zgaruvchisini e'lon qilish: "products" jadvalidan olingan mahsulotning mavjud miqdorini saqlash uchun; boshlang'ich qiymati 0.
    DECLARE `jami` INT DEFAULT 0;

    -- "ostatka" jadvalidagi yangi qo'shilayotgan mahsulotga mos yozuvlar sonini hisoblash.
    SELECT COUNT(*)
    INTO `rowcount`
    FROM `ostatka`
    WHERE `productNumber` = NEW.`productCode`;

    -- "products" jadvalidan yangi qo'shilayotgan mahsulotning mavjud miqdorini olish.
    SELECT `quantityInStock`
    INTO `jami`
    FROM `products`
    WHERE `productCode` = NEW.`productCode`;

    -- Agar "ostatka" jadvalida ushbu mahsulot uchun yozuv mavjud bo'lsa (rowcount > 0)
    IF `rowcount` > 0
    THEN
        -- Mavjud yozuvdagi mahsulot miqdorini yangilash: buyurtmada berilgan miqdorni chiqarib tashlash.
        UPDATE `ostatka`
        SET `soni` = `soni` - NEW.`quantityOrdered`
        WHERE `productNumber` = NEW.`productCode`;
    ELSE
        -- Agar yozuv mavjud bo'lmasa, "ostatka" jadvaliga yangi yozuv qo'shish: mahsulot raqami va yangilangan miqdorni kiritish.
        INSERT INTO `ostatka` (`productNumber`, `soni`)
        VALUES (NEW.`productCode`, `jami` - NEW.`quantityOrdered`);
    END IF; -- if shart operatorining tugashi
END// -- trigger amaliyot tanasining oxiri

DELIMITER ; -- Delimiter ni asl holatiga qaytarish.

# Endi `orderdetails` jadvaliga yangi ma'lumot yoziladigan bo'lsa ushbu trigger ishlaydi.

SELECT *
FROM `ostatka`; -- jadval bo'sh

SELECT *
FROM `orderdetails`
LIMIT 3;
/*------------+-------------+-----------------+-----------+-----------------+
| orderNumber | productCode | quantityOrdered | priceEach | orderLineNumber |
+-------------+-------------+-----------------+-----------+-----------------+
|       10100 | S18_1749    |              30 |    136.00 |               3 |
|       10100 | S18_2248    |              50 |     55.09 |               2 |
|       10100 | S18_4409    |              22 |     75.46 |               4 |
+-------------+-------------+-----------------+-----------+----------------*/

INSERT INTO `orderdetails` (`orderNumber`, `productCode`, `quantityOrdered`, `priceEach`, `orderLineNumber`)
VALUES (10100, 'S10_1678', 30, 140, 3);

SELECT *
FROM `ostatka`;
/*---+---------------+------+
| id | productNumber | soni |
+----+---------------+------+
|  8 | S10_1678      | 7903 |
+----+---------------+-----*/

SELECT `productCode`
FROM `products`;

DROP DATABASE IF EXISTS `trigger_demo_db`;
CREATE DATABASE IF NOT EXISTS `trigger_demo_db`;
USE `trigger_demo_db`;
#                             AFTER INSERT
CREATE TABLE `members`
(
    `id`        INT AUTO_INCREMENT PRIMARY KEY,
    `name`      VARCHAR(100) NOT NULL,
    `email`     VARCHAR(255),
    `birthDate` DATE
);

CREATE TABLE `reminders`
(
    `id`       INT AUTO_INCREMENT,
    `memberId` INT,
    `message`  VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`, `memberId`)
);

DELIMITER //
CREATE TRIGGER `after_members_insert`
    AFTER INSERT
    ON `members`
    FOR EACH ROW
BEGIN
    IF NEW.birthDate IS NULL THEN
        INSERT INTO `reminders` (`memberId`, `message`)
        VALUES (NEW.id, CONCAT('Hi ', NEW.name, ', please update your date of birth.'));
    END IF;
END//

DELIMITER ;


-- members jadvaliga ma'lumot qo'shamiz
INSERT INTO `members`(name, email, birthDate)
VALUES ('John Doe', 'john.doe@example.com', NULL),
       ('Jane Doe', 'jane.doe@example.com', '2000-01-01');

-- kiritilgan ma'lumotlar:
SELECT *
FROM `members`;

-- qaysi qatorda sana kiritilmagan:
SELECT *
FROM `reminders`;

#                             BEFORE | AFTER UPDATE
/*
Jadvaldagi biror qator UPDATE bo'lishidan oldin
yoki keyin ishga tushadigan trigger
*/   --             Qolip:
DELIMITER //
CREATE TRIGGER `trigger_name`
    { BEFORE | AFTER } UPDATE
        ON `table_name` FOR EACH ROW
BEGIN
    -- statements
END //

DELIMITER ;

CREATE TABLE `account`
(
    `acct_num` INT,
    `amount` DECIMAL(10, 2)
);

INSERT INTO `account`
VALUES (10, 14.98),
       (11, 1937.50),
       (12, -100.00);

SELECT *
FROM `account`;

DELIMITER //
CREATE TRIGGER `upd_check`
    BEFORE UPDATE
    ON `account`
    FOR EACH ROW
    BEGIN
       IF NEW.`amount` < 0 THEN
           SET NEW.`amount` = 0;
           ELSEIF NEW.`amount` > 100 THEN
           SET NEW.`amount` = 100;
        END IF;
    END//
DELIMITER ;

-- 120 ni 100 qilish uchun 120 qiymat berib ko'ramiz
UPDATE `account`
SET `amount` = 120
WHERE `acct_num` = 10;

SELECT *
FROM `account`;


#                         BEFORE | AFTER DELETE
# Jadvaldagi biror qator DELETE bo'lishidan oldin
# yoki keyin ishga tushadigan trigger.

#       Qolip:
DELIMITER //
CREATE TRIGGER `trigger_name`
    BEFORE DELETE
    ON `table_name`
    FOR EACH ROW
        BEGIN
            -- statements
        END//
DELIMITER ;


-- salaries jadvalini hosil qilamiz
CREATE TABLE `salaries`
(
  `employeeNumber` INT PRIMARY KEY,
  `validFrom` DATE NOT NULL,
  `amount` DEC(12, 2) NOT NULL DEFAULT 0
);

-- salaries jadvaliga ma'lumot qo'shamiz
INSERT INTO `salaries` (`employeeNumber`, `validFrom`, `amount`)
VALUES (1002, '2000-01-01', 50000),
       (1056, '2000-01-01', 60000),
       (1076, '2000-01-01', 70000);

-- salaries dan biror qator o'chirilganda arxivda saqlash uchun
-- salariesArchives jadvalini hosil qilamiz
CREATE TABLE `salariesArchives`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `employeeNumber` INT UNIQUE KEY,
    `validFrom` DATE NOT NULL,
    `amount` DEC(12, 2) NOT NULL DEFAULT 0,
    `deletedAt` TIMESTAMP DEFAULT NOW()
);

-- before delete trigger hosil qilamiz
DELIMITER **
CREATE TRIGGER `before_salaries_delete`
    BEFORE DELETE
    ON `salaries`
    FOR EACH ROW
    BEGIN
       INSERT INTO `salariesArchives`
        (`employeeNumber`, `validFrom`, `amount`)
        VALUES (OLD.`employeeNumber`, OLD.`validFrom`, OLD.`amount`);
    END**
DELIMITER ;

-- salaries jadvalidan biror ma'lumot o'chiramiz
DELETE
FROM `salaries`
WHERE `employeeNumber` = 1002;

-- O'chgan ma'lumotlar bu jadvalda hosil bo'ladi
SELECT *
FROM `salariesArchives`;







--  ***************************************************************

#             Ramazon 2025 Xiva taqvimi test bazasi misolida
#             AFTER DELETE TRIGGERIGA misol


DROP TABLE IF EXISTS `taqvim`;
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
    `Ogiz_yopish`   TIME        NOT NULL UNIQUE,
    `Ogiz_ochish`   TIME        NOT NULL UNIQUE,
    `oraliq_vaqt`   TIME        NOT NULL,
    `deleted_at`    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TRIGGER IF EXISTS `taqvim_trigger`;
DELIMITER //
CREATE TRIGGER `taqvim_trigger` -- trigger hosil qilish
    AFTER DELETE -- ma'lumot o'chirilgandan keyin
    ON `taqvim` -- qaysiki taqvim jadvalidan
    FOR EACH ROW -- har bir o'chirilgan qator uchun
    INSERT INTO `log_taqvim` -- ma'o'chirilgan ma'lumotlarni `log_taqvim` jadvaliga yozish
        (Hafta_kunlari, Mart, Ogiz_ochish, Ogiz_yopish, oraliq_vaqt) -- shu ustunlarga
    VALUES (OLD.Hafta_kunlari, OLD.Mart, OLD.Ogiz_ochish, OLD.Ogiz_yopish, -- shu ustunlardan
            TIMEDIFF(Ogiz_ochish, Ogiz_yopish)); -- qancha vaqt och yurilgani, test uchun yozilgan albatta
DELIMITER ;

-- taqvimdagi o'tib ketgan kunlar
SELECT *
FROM `taqvim`
WHERE Mart < DAY(NOW());
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
+---------+---------------+------+-------------+------------*/

-- o'tib ketgan kunlarni taqvimdan o'chiramiz
DELETE -- o'chirilsin
FROM `taqvim` -- taqvim jadvalidan
WHERE `Mart` < DAY(NOW()); -- qaysiki `Mart` oyidagi o'tib ketgan kunlar

SELECT *
FROM `log_taqvim`;
/*--------+---------------+------+-------------+-------------+-------------+---------------------+
| Ramazon | Hafta_kunlari | Mart | Ogiz_yopish | Ogiz_ochish | oraliq_vaqt | deleted_at          |
+---------+---------------+------+-------------+-------------+-------------+---------------------+
|       1 | Shanba        |    1 | 06:13:00    | 18:53:00    | 12:40:00    | 2025-03-08 12:37:02 |
|       2 | Yakshanba     |    2 | 06:11:00    | 18:54:00    | 12:43:00    | 2025-03-08 12:37:02 |
|       3 | Dushanba      |    3 | 06:10:00    | 18:55:00    | 12:45:00    | 2025-03-08 12:37:02 |
|       4 | Seshanba      |    4 | 06:08:00    | 18:56:00    | 12:48:00    | 2025-03-08 12:37:02 |
|       5 | Chorshanba    |    5 | 06:06:00    | 18:57:00    | 12:51:00    | 2025-03-08 12:37:02 |
|       6 | Payshanba     |    6 | 06:05:00    | 18:58:00    | 12:53:00    | 2025-03-08 12:37:02 |
|       7 | Juma          |    7 | 06:03:00    | 19:00:00    | 12:57:00    | 2025-03-08 12:37:02 |
+---------+---------------+------+-------------+-------------+-------------+--------------------*/

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

SHOW DATABASES;
/*
        Vaqt muhitlarini sozlash
SELECT @@global.time_zone, @@session.time_zone;
SET time_zone = '+5:00';
SET GLOBAL time_zone = '+5:00';
select now(), sysdate();
*/