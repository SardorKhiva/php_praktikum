#  Jadvalga ma'lumot qo'shish
-- Qolip:
INSERT INTO `jadval_nomi` (`ustun_1`, `ustun_2` /*, ... */)
VALUES ('qiymat_1', 'qiymat_2' /*, ... */);

-- `category` jadvaliga 1 ta ma'lumot qo'shish
INSERT INTO `category`(`title`)
VALUES ("Sport");

-- 1 dan ko'p ma'lumotlar qo'shish
INSERT INTO `category`(`title`)
VALUES ("Media"),
       ("Hokazo");

-- Insert ning yana 1 ko'rinishi
INSERT INTO `category`
VALUES (18, 'Sport');

# AUTO_INCREMENT mavjud bo'lgan ustunga INSERT qilinsa shu qiymatdan boshlab increment bo'lib ketadi

# Jadvalni ba'zi ustunlariga qiymat berish
USE `Xiva_Lolazor`;
INSERT INTO `news`(`title`, `description`)
VALUES ('Salom dunyo', 'Bu description');

# Jadvalga bir nechta ma'lumot qo'shish
INSERT INTO `news`(`title`, `description`)
VALUES ('Salom dunyo', 'Bu short description'),
       ("Ikkinchi ma'lumot", "Bu 2-description"),
       ("Uchinchi ma'lumot", "Bu 3-description");

# Boshqa jadvaldan ma'lumot olib INSERT qilish
-- Qolip:
INSERT INTO `jadval_nomi`(`kerakli_ustunlar`)
SELECT `boshqa_jadval_ustunlari`
FROM `boshqa_jadval`
WHERE shartlar;