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
CREATE TABLE `test_db`
(
    `id`         INT AUTO_INCREMENT PRIMARY KEY,
    `created_at` DATETIME
);

INSERT INTO `test_db`(`created_at`)
VALUES ('2019-12-10 14:29:36');

# JSON

/*
CREATE TABLE IF NOT EXISTS `json_table_name`
(
    ...
    json_column_name
    JSON,
    ...
)
*/
# JSON turidagi ustunga DEFAULT qiymat berish mumkin emas.
# INDEX qilish imkoni yo'q

CREATE TABLE IF NOT EXISTS `events`
(
    `id`         INT AUTO_INCREMENT PRIMARY KEY,
    `event_name` VARCHAR(255),
    `visitor`    VARCHAR(255),
    `properties` JSON,
    `browser`    JSON
);

INSERT INTO `events`(`event_name`, `visitor`, `properties`, `browser`)
VALUES ('pageview', '1',
        '{
          "page": "/"
        }',
        '{
          "name": "Safari",
          "OS": "Mac",
          "resolution": {
            "x": 1920,
            "y": 1080
          }
        }'),
       ('pageview', '2', '{
         "page": "/contact"
       }', '{
         "name": "Firefox",
         "OS": "Windows",
         "resolution": {
           "x": 2560,
           "y": 1600
         }
       }'),
       ('pageview', '1', '{
         "page": "/products"
       }',
        '{
          "name": "Safari",
          "OS": "Mac",
          "resolution": {
            "x": 1920,
            "y": 1080
          }
        }'),
       ('purchase', '3', '{
         "amount": 200
       }',
        '{
          "name": "Firefox",
          "OS": "Windows",
          "resolution": {
            "x": 1600,
            "y": 900
          }
        }'),
       ('purchase', '4',
        '{
          "amount": 150
        }',
        '{
          "name": "Firefox",
          "OS": "Windows",
          "resolution": {
            "x": 1280,
            "y": 800
          }
        }'),
       ('purchase', '4', '{
         "amount": 500
       }',
        '{
          "name": "Chrome",
          "OS": "Windows",
          "resolution": {
            "x": 1680,
            "y": 1050
          }
        }');

SELECT *
FROM `events`;

# JSON ustunlaridan qiymatlarni olish uchun (->>) operatoridan foydalaniladi
SELECT `id`,
       `browser` -> '$.name'      AS `browser`,
       `properties` -> '$.amount' AS `amount`
FROM `events`;

# https://www.digitalocean.com/community/tutorials/working-with-json-in-mysql

# BOOLEAN
CREATE TABLE `tasks`
(
    `id`        INT PRIMARY KEY AUTO_INCREMENT,
    `title`     VARCHAR(255) NOT NULL,
    `completed` BOOLEAN
);

# DECIMAL
CREATE TABLE `materials`
(
    `id`          INT AUTO_INCREMENT PRIMARY KEY,
    `description` VARCHAR(255),
    `cost`        DECIMAL(19, 4) NOT NULL
);

INSERT INTO `materials`(`description`, `cost`)
VALUES ('Bicycle', 500.34),
       ('Seat', 10.23),
       ('Break', 5.21);

/*
 DECIMAL(13, 4) - jami 13 ta raqam, 4 tasi verguldan keyingi sonlar
 999999999.9999 - yuqoridagining max qiymati

DECIMAL(6, 4) - -99.9999 dan 99.9999
UNSIGNED DECIMAL(6, 4) - 0.0000 dan 99.9999 gacha
*/
