#                       GITA o'quv markazi ma'lumotlar bazasi

# bu baza bor bo'lsa o'chirilsin
# DROP DATABASE IF EXISTS `GITA_UZ`;

# baza hosil qilish
CREATE DATABASE IF NOT EXISTS `GITA_UZ`;

# baza bilan ishlash uchun uni tanlash
USE `GITA_UZ`;

# o'quv markaz xonalari haqida ma'lumotlar jadvali
CREATE TABLE IF NOT EXISTS `xonalar`
(
    `id`          INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `xona_raqami` SMALLINT UNSIGNED COMMENT "xona raqami, maximum 128",
    `qavat`       BIT COMMENT "nechanchi qavatda joylashganligi, maximum 64",
    `status`      BOOLEAN DEFAULT 1 COMMENT "xona holati dars o'tishga tayyorligi, odatda tayyor"
);

# o'quv markaz ma'muriyati va hodimlari haqida ma'lumotlar jadvali
CREATE TABLE IF NOT EXISTS `mamuriyat`
(
    `id`         INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `ismi`       VARCHAR(50)     NOT NULL,
    `sharifi`    VARCHAR(50),
    `familyasi`  VARCHAR(50),
    `mansabi`    VARCHAR(50)     NOT NULL,
    `uy_manzili` VARCHAR(255)    NOT NULL,
    `xona_id`    INT UNSIGNED COMMENT "kabineti",
    `telefoni`   CHAR(12) UNIQUE NOT NULL,
    `email`      VARCHAR(100) UNIQUE,
    UNIQUE (`ismi`, `sharifi`, `familyasi`),
    CONSTRAINT `fk_mamuriyat_to_xona_id` FOREIGN KEY (`xona_id`)
        REFERENCES `xonalar` (`id`)
);

# ustozlar haqida ma'lumotlar jadvali
CREATE TABLE IF NOT EXISTS `ustozlar`
(
    `id`               INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `ismi`             VARCHAR(50)  NOT NULL,
    `sharifi`          VARCHAR(50),
    `familyasi`        VARCHAR(50),
    `telefoni`         DEC(12), -- 998919876543, 12 ta raqam
    `manzili`          VARCHAR(255) NOT NULL,
    `tug'ilgan_sanasi` DATE         NOT NULL,
    `email`            VARCHAR(100) UNIQUE
);

# jami kurslar ichida mavjud fanlar haqida ma'lumotlar jadvali,
CREATE TABLE IF NOT EXISTS `fanlar`
(
    `id`       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `nomi`     VARCHAR(50) UNIQUE NOT NULL COMMENT "har bir o'tiladigan predmet-fan nomi",
    `ustoz_id` INT UNSIGNED       NULL,
    `narhi`    DECIMAL(8)         NOT NULL,
    CONSTRAINT `fk_fan_ustozi_id` FOREIGN KEY (`ustoz_id`)
        REFERENCES `ustozlar` (`id`) ON UPDATE CASCADE ON DELETE SET NULL
) AUTO_INCREMENT = 1;
-- boshlang'ich qiymat berish
# ALTER TABLE `fanlar` AUTO_INCREMENT = 10;  -- 10 ga o'zgartirish


# jami mavjud kurslar jadvali
CREATE TABLE IF NOT EXISTS `mavjud_kurslar`
(
    `id`           INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `fan_id`       INT UNSIGNED                                       NOT NULL COMMENT "bir kursda bir nechta fan bo'lishi mumkin",
#     `ustoz_id`     INT UNSIGNED                                       NOT NULL,
    `start`        DATE COMMENT "kurs boshlangan sanasi",
    `stop`         DATE COMMENT "kurs tugash sanasi",
    `pozitsiya`    SMALLINT UNSIGNED COMMENT "bu yilgi nechanchi kursligi",
    `reyting`      ENUM ("a'lo", "yaxshi", "qoniqarli", "qoniqarsiz") NOT NULL COMMENT "kursdagi bolalarning o'zlashtirish reytingi",
    `xona_id`      INT UNSIGNED                                       NOT NULL,
    `kurs_statusi` BOOLEAN DEFAULT 1 COMMENT "kurs holati, odatda aktiv",
    CONSTRAINT `fk_fan_id` FOREIGN KEY (`fan_id`)
        REFERENCES `fanlar` (`id`),
#     CONSTRAINT `fk_ustoz_id` FOREIGN KEY (`ustoz_id`)
#         REFERENCES `ustozlar` (`id`) ON UPDATE CASCADE,
    CONSTRAINT `fk_kurs_to_xona_id` FOREIGN KEY (`xona_id`)
        REFERENCES `xonalar` (`id`)
);

# o'quvchilarning ota-onalari yoki ularni o'rnini bosuvchi shaxslar haqida ma'lumotlar jadvali
CREATE TABLE IF NOT EXISTS `ota_onalar`
(
    `id`         INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `F_I_SH`     VARCHAR(255) COMMENT "familyasi, ismi va sharifi",
    `telefoni`   DEC(12) UNSIGNED UNIQUE NOT NULL,
    `manzili`    VARCHAR(255) COMMENT "ota-ona manzili",
    `qarzdorlik` BOOLEAN DEFAULT 0 COMMENT "ota-onaning o'quv markazdan qarzi bor yo'qligi",
    `boquvchisi` BOOLEAN DEFAULT 1 COMMENT "boquvchisi(ota) si borligi, odatda bor"
);

# o'quvchilar haqida ma'lumotlar jadvali
CREATE TABLE IF NOT EXISTS `o'quvchilar`
(
    `id`               INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `ismi`             VARCHAR(50)            NOT NULL,
    `sharifi`          VARCHAR(50) COMMENT "bazan otasi ismi nomalum bo'lishi mumkin, (bolalar uyi)",
    `familyasi`        VARCHAR(50)            NOT NULL,
    `jinsi`            ENUM ('erkak', 'ayol') NOT NULL,
    `tug'ilgan_sanasi` DATE                   NOT NULL,
    `telefoni`         DEC(12) UNSIGNED,
    `email`            VARCHAR(100),
    `ota_ona_id`       INT UNSIGNED COMMENT "o'quvchilar ota-onalari jadvaliga havola, FOREIGN KEY",
    CONSTRAINT `fk_ota_ona` FOREIGN KEY (`ota_ona_id`)
        REFERENCES `ota_onalar` (`id`) ON UPDATE CASCADE
);

# darslar grafigi haqida ma'lumotlar jadvali
CREATE TABLE IF NOT EXISTS `kurslar_jadvali`
(
    `id`               INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `kurs_id`          INT UNSIGNED                             NULL COMMENT "qaysi kurs-dars o'qitiladi",
    `talaba_id`        INT UNSIGNED,
    `hafta_kunlari`    ENUM ('1', '2', '3', '4', '5', '6', '7') NOT NULL COMMENT "haftaning qaysi kunlari dars bor",
    `boshlanish_vaqti` TIME                                     NOT NULL COMMENT "kurs boshlanish soati",
    `tugash_vaqti`     TIME                                     NOT NULL COMMENT "kurs tugash vaqti",
    CONSTRAINT `fk_kurs` FOREIGN KEY (`kurs_id`)
        REFERENCES `mavjud_kurslar` (`id`) ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT `fk_kurs_talaba` FOREIGN KEY (`talaba_id`)
        REFERENCES `o'quvchilar` (`id`) ON DELETE SET NULL
);

#               bazi jadvallarga ma'lumotlar kiritib ko'ramiz
INSERT INTO `xonalar`(`xona_raqami`, `qavat`, `status`)
VALUES (1, 1, 1), -- direktor xonasi
       (2, 1, 1); -- administrator xonasi


INSERT IGNORE INTO `mamuriyat` (`ismi`, `sharifi`, `familyasi`, `mansabi`, `uy_manzili`, `xona_id`, `telefoni`, `email`)
VALUES ("Qudrat", NULL, "Abdurahimov",
        "direktor", "Toshkent shahar, Kulol masjidi yonida",
        1, 998913478415, "noname@pochta.uz"),
       ("Xadicha", "Abdullayevna", "Otojonova",
        "Administrator", "Toshkent shahar, ...", 2,
        998901236547, "gita@mail.uz");

INSERT IGNORE INTO `ustozlar` (`ismi`, `sharifi`, `familyasi`, `telefoni`, `manzili`, `tug'ilgan_sanasi`, `email`)
VALUES ("SHerzodbek", NULL, "Muhammadiyev", 998993459865, "Toshkent shahar", '1995-12-20', "test@gmail.uz"),
       ("abc", "def", "ghi", 998334281015, "Toshkent qishlog'i", '1990-02-10', "pochta001@uzmail.uz");


INSERT IGNORE INTO `fanlar` (`nomi`, `ustoz_id`, `narhi`)
VALUES ("Java", 1, 500000),
       ("Kotlin", 1, 500000),
       ("Flutter", 2, 500000);

INSERT IGNORE INTO `ota_onalar` (`F_I_SH`, `telefoni`, `manzili`)
VALUES ("Abdullayev Farxod Azimovich", 998914374597, "Toshkent shahar, ...");


INSERT IGNORE INTO `o'quvchilar`
(`ismi`, `sharifi`, `familyasi`, `jinsi`, `tug'ilgan_sanasi`, `telefoni`, `email`, `ota_ona_id`)
VALUES ("Sardor", "Maxmudovich", "Abdullohov", 'erkak', '1998-12-20', 998914896121, 'testvuz@gmail.uz', 1);

#           bazi protseduralarni qo'shsa bo'ladi, jadvaldan ma'lumot olishni osonlashtirish uchun

# o'quv markazi ma'muriyati haqidagi jadvalni chiqaruvchi protsedura
DELIMITER $$ -- vaqtinchalik operatorlar orasini ajratuvchi belgi
CREATE PROCEDURE `mamuriyat_haqida`() -- protsedura hosil qilish va nom berish
BEGIN -- protsedura tanasining boshlanishi
    SELECT * -- tanlab chiqarsin barcha ustunlarni
    FROM `mamuriyat`; -- mamuriyat jadvalidan
END$$ -- protsedura tanasining tugashi
DELIMITER ; -- ajratuvchini odatiy holatga keltirish

CALL mamuriyat_haqida();
-- saqlangan protsedurani chaqirish

# o'quvchilar sonini chiqarish
DROP PROCEDURE IF EXISTS `talabalarSoni`;

DELIMITER //
CREATE PROCEDURE IF NOT EXISTS `talabalarSoni`()
BEGIN
    DECLARE `soni` INT UNSIGNED DEFAULT 0; -- protsedura ichida `soni` o'zgaruvchisini 0 qiymat bilan olamiz
    SELECT COUNT(`ismi`) -- ism ustunlari soni qiymatini
    INTO `soni` -- soni o'zgaruvchisiga saqlaymiz
    FROM `o'quvchilar`; -- qaysiki o'quvchilar jadvalidan

    SELECT `soni`; -- protsedura ichida o'zgaruvchini chiqaramiz
END//

CALL talabalarSoni(); -- tepadagi protsedurani chaqiramiz


