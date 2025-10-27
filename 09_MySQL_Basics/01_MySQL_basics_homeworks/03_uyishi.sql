# 3)"maktab" databaseiga quyidagi jadvallarni qo'shing:
# "fanlar", "ustozlar", "talabalar".
# Qanday ustunlar bo'lishini o'ziz o'ylang.
# Misol: ustozlar jadvalini tuzmoqchi bo'lsangiz o'ylang,
# Ustozni qanday parametrlari bo'ladi odatda?
# -ismi
# -familyasi
# -otasini ismi
# -qaysi fandan dars berishi
# -tugilgan yili
# -manzili
# -tel nomeri

USE `maktab`;
DROP table `fanlar`, `ustozlar`, `talabalar`;

CREATE TABLE `fanlar`
(
    `id`               INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `nomi`             VARCHAR(255)                   NOT NULL UNIQUE,
    `boshlanish_vaqti` TIMESTAMP                      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `tugash_vaqti`     TIMESTAMP                      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `kirilganligi`     BOOLEAN                                 DEFAULT FALSE NOT NULL
);

CREATE TABLE `ustozlar`
(
    `id`            INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `ismi`          VARCHAR(255)                   NOT NULL,
    `sharifi`       VARCHAR(255)                   NOT NULL,
    `familyasi`     VARCHAR(255)                   NOT NULL,
    `fani`          VARCHAR(255)                   NOT NULL UNIQUE,
    `tugilgan_yili` DATE                           NOT NULL,
    `manzili`       VARCHAR(255)                   NOT NULL,
    `telefoni`      CHAR(13)                       NOT NULL UNIQUE
);

CREATE TABLE `talabalar`
(
    `id`            INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `ismi`          VARCHAR(255)                   NOT NULL,
    `sharifi`       VARCHAR(255)                   NOT NULL,
    `familyasi`     VARCHAR(255)                   NOT NULL,
    `rahbari`       VARCHAR(255)                   NOT NULL,
    `ortacha_baho`  FLOAT                          NOT NULL,
    `tugilgan_yili` DATE                           NOT NULL,
    `manzili`       VARCHAR(255)                   NOT NULL,
    `telefoni`      CHAR(13)                       NOT NULL UNIQUE
);