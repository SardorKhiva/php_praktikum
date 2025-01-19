# 5) Eski "talabalar" jadvalini
# o'chirib yangi "talabalar"
# jadvalini hosil qiling.
# Qanday ustunlari bo`lishini o`ylang.
# Bitta talabani ikkinchi marta kiritish
# imkoni mavjud bo`lmasligini ta`minlang.

# db larni ko'rish
SHOW DATABASES;

# maktab db ni qo'llash, ishlatish, tanlash:
USE `maktab`;

# maktab db jadvallarini ko'rish
SHOW TABLES;

# oldin talabalar jadvali bo'lsa o'chirish
DROP TABLE IF EXISTS `talabalar`;

#talabalar jadvalini hosil qilish
CREATE TABLE `talabalar`
(
    `id`            INT AUTO_INCREMENT,
    `ism_familyasi` VARCHAR(100) UNIQUE NOT NULL,
    `telefoni`      CHAR(13)
);
