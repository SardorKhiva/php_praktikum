# MA'LUMOTLAR OMBORLARINI KO'RISH
SHOW DATABASES;

# Oilam nomli database bo'lmasa shunday database hosil qilish
CREATE DATABASE IF NOT EXISTS `Oilam`;

# Oilam db dan foydalanish
USE `Oilam`;

# Oilam nomli databse o'chirish
# DROP DATABASE Oilam;

# Oilam nomli db bo'lsa o'chirish
# DROP DATABASE IF EXISTS `Oilam`;

# Dasturlar nomli database hosil qilish
# CREATE DATABASE `Dasturlar`;

# Jadval qolip
# CREATE TABLE IF NOT EXISTS `<jadval_nomi>`(
#     ustun nomi      DATA TIPI,     NULL QIYMAT OLMASIN   DEFAULT QIYMAT
#     [COLUMN_01]   [COLUMN_TYPE]    [NOT_NULL]           [DEFAULT_VALUE],
#     majburiy        majburiy        majburiy emas         majburiy emas
# )

# ******************************************************
# MySQL data types:
# a) Number;
# b) String;
# c) Boolean;
# d) Date and time;
# e) JSON;

# Numeric turlari:
# nomi:         hajmi, bayt:      signed (-lik) diapazoni:    Unsigned(faqat musbat) diapazoni:
# a) tinyint          1             -128    ...  127              0 ... 255
# b) smallint         2             -32 768 ...  32 767           0 ... 65535
# c) mediumint        3             -8 388 608 ... 8 388 607      0 ... 16 777 215
# d) int              4             -2 147 483 648 ...            0 ... 4 294 967 294
#                                    2 147 483 647
#
# e) bigint           5             -9 223 372 036 854 775 808   0 ... 18 446 744 073 709 551 615
#                                    9 223 372 036 854 775 807
#
# f) decimal                          65 xonagacha
# (sinonim NUMERIC)
# g) float
# h) double
# ******************************************************

# Oilam db ni tanlaymiz
USE Oilam;

# SARDOR nomli jadval hosil qilamiz
CREATE TABLE `SARDOR`
(
    # int tipl id nomli avtomatik qiymati
    # oshib boruvchi ustun
    `id`   INT AUTO_INCREMENT PRIMARY KEY,

    # name nomli 255 ta belgigacha
    # null qiymat olmaydigan char tipli ustun
    `name` VARCHAR(255) NOT NULL,

    # bet nomli musbat int ustun
    `bet`  INT UNSIGNED
);

CREATE TABLE `Materiallar`
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255),

    # cost nomli jami 19 xonali
    # . kasr qismi 4 xonali decimal tip
    cost        DECIMAL(19, 4) NOT NULL
);

# Maʼlumotlar tiplari. String, Boolean, JSON tiplar. Bazaga ulanish:
# CHAR(size)  - 255 bayt egallaydi, doim 255 baytni xotirada band qiladi
# VARCHAR(size) - maksimum 255 bayt egallaydi, matn uzunligi va
# kodirovkaga qarab xotirada joy egallaydi

CREATE TABLE IF NOT EXISTS book(
    id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,     # name nomli 100 ta harfgacha bo'lgan ustun
    isbn CHAR(12) NOT NULL,
    bet INT UNSIGNED,
    PRIMARY KEY (id)
);

# DATE AND TIME
# DATE 1001-01-01 ... 9999-12-31
# DATETIME 1001-01-01 00:00:00 ... 9999-12-31 23:59:59
# TIMESTAMP GMT li DATETIME
# TIME -838:59:59 ... 838:59:59 ikki holat orasdagi oraliq vaqt,
# soatdagi kabi maximum 23:59:59 lik vaqt emas

CREATE TABLE IF NOT EXISTS talaba(
    id INT AUTO_INCREMENT PRIMARY KEY,
    ism VARCHAR(20) NOT NULL,
    familya VARCHAR(30) NOT NULL,
    tugilgan_sanasi DATE NOT NULL,
    created_at DATETIME NOT NULL
);

DROP TABLE IF EXISTS turlar;

CREATE TABLE IF NOT EXISTS category(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    # yozilgan vaqtni odatiy (default) qiymat qilib berish
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS lesson(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    start_at TIME NOT NULL,
    end_at TIME NOT NULL
);

CREATE TABLE task (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    title VARCHAR(255) NOT NULL,
    completed BOOLEAN NOT NULL
);

CREATE TABLE event (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    event_name VARCHAR(255) NOT NULL,
    visitor VARCHAR(255) NOT NULL,
    properties JSON NOT NULL,
    browser JSON NOT NULL
);