USE `Xiva_Lolazor`;

CREATE TABLE `kitoblar`
(
    `kitob_id` INT AUTO_INCREMENT PRIMARY KEY,
    `nomi`     VARCHAR(255)
);

INSERT INTO `kitoblar`(`nomi`)
VALUES ('Salom dunyo'),
       ('Maugli'),
       ('Pakaxontas');

DROP TABLE `kitoblar`;

CREATE TABLE `kitoblar`
(
    `id`   INT AUTO_INCREMENT,
    `nomi` VARCHAR(255) NOT NULL,
    `bet`  INT UNSIGNED -- UNSIGNED - ishorasiz, 0 dan yuqori butun sonlar
);
DROP TABLE IF EXISTS `kitoblar`;

CREATE TABLE IF NOT EXISTS `kitoblar`
(
    `id`   INT AUTO_INCREMENT,
    `nomi` VARCHAR(13) NOT NULL,
    `nom`  CHAR(13)    NULL,
    `bet`  INT UNSIGNED,
    PRIMARY KEY (`id`)
);

INSERT INTO `kitoblar` (`nomi`, `bet`)
VALUES ('Bu kitob nomi', 5);

CREATE TABLE `temp`
(
    `city`   CHAR(10),
    `street` VARCHAR(10)
);

INSERT INTO `temp`
VALUES ('Pune', 'Oxford');

-- LENGTH - UZUNLIK
SELECT LENGTH(temp.`city`)
FROM temp;

/*
 CHAR - Belgilangan uzunlikdagi simvollar satrini saqlash uchun ishlatiladi.
VARCHAR - O`zgaruvchan uzunlikdagi ma'lumotlarni saqlash uchun foydalaniladi.
 */

#   TEXT , TINYTEX
/*
VARCHAR tipida default qiymat berish mumkin
TEXT va TINYTEXT da default qiymat berib bo'lmaydi
*/

CREATE TABLE IF NOT EXISTS `people`
(
    `id`         INT AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name`  VARCHAR(50) NOT NULL,
    `birth_date` DATE        NOT NULL
);

SELECT NOW(); -- hozirgi sana va vaqt
SELECT DATE(NOW()); -- joriy sana
SELECT CURDATE(); -- joriy sana

SELECT DAY('2019-12-10')     kun,
       MONTH('2019-12-10')   oy,
       QUARTER('2019-12-10') yil_choragi,
       YEAR('2019-12-10')    yil;

-- TIME
CREATE TABLE IF NOT EXISTS `dars`
(
    `id`       INT PRIMARY KEY AUTO_INCREMENT,
    `name`     VARCHAR(255) NOT NULL,
    `start_at` TIME,
    `end_at`   TIME
);

INSERT INTO `dars`(`name`, `start_at`, `end_at`)
VALUES ('Web', '19:00:00', '21:00:00');

# TIMESTAMP - UTC joriy sana va vaqt
CREATE TABLE `test_timestamp`
(
    t1 TIMESTAMP
);

INSERT INTO `test_timestamp`
VALUES ('2020-01-11 01:00:01');

# INTERVAL: '1970-01-01 00:00:01' UTC -  '2038-01-19 03:14:07' UTC

CREATE TABLE IF NOT EXISTS `categories`
(
    `id`         INT AUTO_INCREMENT PRIMARY KEY,
    `name`       VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

# DATETIME
