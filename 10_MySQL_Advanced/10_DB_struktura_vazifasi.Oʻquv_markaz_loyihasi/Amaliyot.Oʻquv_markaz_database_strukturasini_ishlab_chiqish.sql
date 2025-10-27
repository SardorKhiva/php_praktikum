DROP DATABASE IF EXISTS `O'quv markaz`; -- agar baza bor bo'lsa o'chirsin
CREATE DATABASE `O'quv markaz`; -- yangi baza hosil qilish
USE `O'quv markaz`; -- shu bazani ishlatish
CREATE TABLE IF NOT EXISTS `ustozlar` -- ustozlar bazasini hosil qilish
(
    `id`              INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `ismi`            VARCHAR(255) NOT NULL,
    `bio`             TEXT COMMENT "ustoz haqida qisqa ma'lumot",
    `telefon`         VARCHAR(13)  NOT NULL,
    `email`           VARCHAR(255),
    `yashash_manzili` TEXT         NOT NULL
);
CREATE TABLE IF NOT EXISTS `kurslar`
(
    `id`          INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `nomi`        VARCHAR(255),
    `davomiyligi` INT COMMENT 'davomiyligi oylarda',
    `narhi`       DECIMAL(10, 2),
    `ustoz_id`    INT UNSIGNED,
    FOREIGN KEY (`ustoz_id`) REFERENCES `ustozlar` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS `xonalar`
(
    `id`      INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `nomi`    VARCHAR(255)     NOT NULL,
    `sig'imi` TINYINT UNSIGNED NOT NULL COMMENT "xonaga nechta talaba sig'ishi"
);
CREATE TABLE IF NOT EXISTS `guruhlar`
(
    `id`              INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `kurs_id`         INT UNSIGNED COMMENT "bu guruh qaysi kursni o'qiyapti",
    `ustoz_id`        INT UNSIGNED COMMENT "guruhga biriktirilgan ustoz",
    `xona_id`         INT UNSIGNED COMMENT "guruh xonasi",
    `boshlangan_sana` DATE NOT NULL COMMENT "guruh o'qishni boshlagan vaqti",
    `max_talabalar`   TINYINT UNSIGNED COMMENT "maksimal talabalar soni 0 dan 255 gacha",
    FOREIGN KEY (`kurs_id`) REFERENCES `kurslar` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (`ustoz_id`) REFERENCES `ustozlar` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (`xona_id`) REFERENCES `xonalar` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS `ota_onalar`
(
    `id`       INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `ismi`     VARCHAR(255) NOT NULL UNIQUE COMMENT "ota-onalardan birining to'liq ism sharifi familyasi",
    `telefoni` VARCHAR(13)  NOT NULL
);
CREATE TABLE IF NOT EXISTS `talabalar`
(
    `id`         INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `ismi`       VARCHAR(255) NOT NULL COMMENT "talabaning to'liq ismi, sharifi va familyasi",
    `bio`        TEXT COMMENT "talaba haqida qisqa ma'lumot",
    `telefoni`   VARCHAR(13)  NOT NULL,
    `ota_ona_id` INT UNSIGNED NOT NULL COMMENT "kimning farzandi",
    `kurs_id`    INT UNSIGNED COMMENT "qaysi kursga borishi",
    FOREIGN KEY (`ota_ona_id`) REFERENCES `ota_onalar` (`id`),
    FOREIGN KEY (`kurs_id`) REFERENCES `kurslar` (`id`)
);
CREATE TABLE IF NOT EXISTS `guruh_talabalari`
(
    `id`        INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `kurs_id`   INT UNSIGNED COMMENT "bu guruhdagi talaba qaysi kursga boradi",
    `talaba_id` INT UNSIGNED COMMENT "qaysi talaba",
    `boshladi`  DATE COMMENT "guruhga qo'shilgan sanasi",
    FOREIGN KEY (`kurs_id`) REFERENCES `kurslar` (`id`),
    FOREIGN KEY (`talaba_id`) REFERENCES `talabalar` (`id`)
);
CREATE TABLE IF NOT EXISTS `to'lovlar`
(
    `id`             INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `talaba_id`      INT UNSIGNED,
    `guruh_id`       INT UNSIGNED,
    `to'lov_miqdori` DECIMAL(10, 2) COMMENT "to'lov summasi",
    `to'lov_sanasi`  DATE NOT NULL,
    `oy_uchun`       DATE NOT NULL COMMENT "qaysi oy uchun to'lov qilganligi",
    FOREIGN KEY (`talaba_id`) REFERENCES `talabalar` (`id`),
    FOREIGN KEY (`guruh_id`) REFERENCES `guruhlar` (`id`)
);

SHOW TABLES;


/* Добавить новый столбец:
ALTER TABLE employees ADD COLUMN phoneNumber VARCHAR(20);

Изменить тип данных столбца:
ALTER TABLE employees MODIFY COLUMN phoneNumber CHAR(15);

Удалить столбец:
ALTER TABLE employees DROP COLUMN phoneNumber;

Изменить кодировку базы данных:
ALTER DATABASE my_database CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;    */

