USE Xiva_Lolazor;

#  Jadvallar ro'yhati
SHOW TABLES;

# Jadval hosil qilish
# Qolip:
/*
CREATE TABLE [IF NOT EXISTS] `jadval_nomi` (
  `column_name_1` COLUMN_TYPE [NOT NULL] [DEFAULT VALUE],
  `column_name_2` COLUMN_TYPE [NOT NULL] [DEFAULT VALUE],
   ...
);

COLUMN_TYPE - ustunda qanday turdagi ma'lumotlar saqlanishi;

NOT NULL - Ustun NULL qiymatni qabul qilmaydi,
Agar null ni qabul qilsa hech narsa yozilmaydi;

DEFAULT_VALUE - Ustun boshlang'ich qiymati;
*/

# Jadvalga misol
CREATE TABLE IF NOT EXISTS `news`
(
    `id`          INT AUTO_INCREMENT PRIMARY KEY,
    `title`       VARCHAR(100)       DEFAULT NULL,
    `category_id` INT,
    `description` TEXT,
    `created_at`  DATETIME           DEFAULT NULL,
    `updated_at`  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `author_id`   INT,
    `thumb`       VARCHAR(50)        DEFAULT NULL,
    `price`       DOUBLE(16, 2)      DEFAULT 0.00
);

# Eng ko'p ishlatilgan ma'lumotlar turlariga misol:
CREATE TABLE IF NOT EXISTS `misol_1`
(
    `misol_id`       INT AUTO_INCREMENT PRIMARY KEY,
    `xona_nomeri`    INT          NOT NULL DEFAULT 0,
    `xona_qavati`    INT,
    `maktab_nomi`    VARCHAR(100) NOT NULL,
    `maktab_manzili` TEXT,
    `narhi`          FLOAT(5, 2),
    `jami`           DOUBLE(15, 3),
    `kelgan_vaqti`   DATETIME              DEFAULT CURRENT_TIMESTAMP,
    `kelgan_soati`   TIME,
    `kelgan_kuni`    DATE                  DEFAULT NULL,
    `ketgan_kuni`    TIMESTAMP             DEFAULT CURRENT_TIMESTAMP,
    `surgan_kuni`    DATETIME              DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `phone`          VARCHAR(12)  NOT NULL UNIQUE,
    `is_active`      BOOLEAN               DEFAULT FALSE,
    UNIQUE (`maktab_nomi`, `phone`)
    -- CONSTRAINT uk_maktab_phone UNIQUE (`maktab_nomi`, `phone`)
);

-- Primary key li jadvallar
CREATE TABLE IF NOT EXISTS `category`
(
    `id`    INT AUTO_INCREMENT,
    `title` VARCHAR(50),
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `author`
(
    `id`    INT AUTO_INCREMENT PRIMARY KEY,
    `name`  VARCHAR(50) DEFAULT NULL,
    `photo` VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS `news`
(
    `id`          INT AUTO_INCREMENT PRIMARY KEY,
    `title`       VARCHAR(100)       DEFAULT NULL,
    `category_id` INT,
    `description` TEXT,
    `created_at`  DATETIME           DEFAULT NULL,
    `updated_at`  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `author_id`   INT,
    `thumb`       VARCHAR(50)        DEFAULT NULL,
    `price`       DOUBLE(16, 2)      DEFAULT 0.00
);

-- Jadval haqida ma'lumot
DESCRIBE `news`;
DESC `news`;

# PRIMARY KEY - Qatorni jadvalda noyob ekanligini bildiradigan ustun(lar)
/* UNIQUE KEY
   UNIQUE ustundagi barcha qiymatlarni turlicha bo'lishini belgilaydi.
   Bir jadvalda 1 necha UNIQUE bo'lishi mumkin,
   lekin 1 ta PRIMARY KEY bo'ladi.
   UNIQUE - NULL qabul qila oladi,
   PRIMARY KEY - NULL qabul qilmaydi.
 */

# Jadvaldagi barcha indeks kalitlarni ko'rish
SHOW INDEX FROM `misol_1`;

# Jadvaldan uk_maktab_phone degan key ni o'chirish
DROP INDEX `uk_maktab_phone` ON `misol_1`;

# Jadvalni o'chirish
DROP TABLE `news`; -- agar jadval bor yo'qligin ma'lum bo'lsa
DROP TABLE IF EXISTS `news`;
-- agar jadval bor yo'qligin noma'lum bo'lsa

# Jadvalni ma'lumotlardan tozalash
# TRUNCATE TABLE [`jadval_nomi`];
# - AUTO_INCREMENT bor maydon TRUNCATE qilinsa, 1 dan boshlaydi
# - TRUNCATE - DELETE ni ishlatmaydi.

# Jadvalni nusxalash
CREATE TABLE IF NOT EXISTS `copy_news` LIKE `news`;
-- jadval tuzilishi nusxalanadi, yozuvlar emas!

# Jadvaldagi kerakli ustunlarni tanlab,
# ma'lumotlari bilan yangi jadval hosil qilish
CREATE TABLE IF NOT EXISTS `yangi_news`
AS
SELECT `category_id`, `title`
FROM `news`;
# bunda tanlangan jadval tuzilish va yozuvlari ham nusxalanadi

# Jadval haqida ma'lumot
DESC `news`;

# Jadval hosil qilish
CREATE TABLE `department`
(
    `id`   INT(11),
    `name` VARCHAR(255)
);