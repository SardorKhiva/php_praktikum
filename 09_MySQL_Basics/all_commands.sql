#                                 Kirish
# MySQL ga ulanish
mysql -u root -p

# Database - ma'lumotlar ombori - db lar ro'yhati
SHOW DATABASES;

# db qo'shish
CREATE DATABASE [IF NOT EXISTS] magazin;

# db dan foydalanish
USE magazin;

# db ni o'chirish
DROP DATABASE [IF EXISTS] magazin;

#                               Jadvallar
# Jadvallar ro'yhati
SHOW TABLES;

# Jadval hosil qilish
CREATE TABLE [IF NOT EXISTS] jadval_nomi
(
  ustun_nomi_1 malumot_turi [NOT NULL] [DEFAULT VALUE] [default_value_qiymati],
  ...
);

# Jadval tuzilishi
DESCRIBE jadval_nomi;
DESC jadval_nomi;

# Jadvalni o'chirish
DROP TABLE [IF EXISTS] jadval_nomi;

# Jadval ma'lumotlarini tozalash
TRUNCATE TABLE jadval_nomi;

# Jadval tuzilishini boshqa jadvalga nusxalash
CREATE TABLE IF NOT EXISTS copy_news
LIKE news;

# Kerakli ustunlarni boshqa jadvalga nusxalash
CREATE TABLE [IF NOT EXISTS] yangi_news AS
    SELECT category_id, title
    FROM news;  -- kalitlar nusxalanmaydi!

# To'liq nusxalash
CREATE TABLE [IF NOT EXISTS] nusxa_jadval
LIKE jadval;
INSERT INTO nusxa_jadval
SELECT * FROM jadval;

#      SELECT
# db dagi barcha jadvallar
SHOW TABLES;

# Jadvaldagi ma'lum ustunlarni chiqarish
SELECT ustun_1, ustun_2, ...
FROM jadval;

# Jadvaldagi barcha ma'lumotlar
SELECT *
FROM jadval;

# Ustun nomini boshqa nom bilan chiqarish
SELECT lastName AS familya,
       firstName AS ism
FROM employees;

# Jadval ma'lumot/satr lari soni
SELECT COUNT(*)
FROM employees;

# Ustunlarni birlashtirib chiqarish
SELECT CONCAT(lastname, ' ', firstname) AS fullName
FROM employees;

# Ma'lum belgili CONCAT
SELECT CONCAT_WS('-', firstname, lastname) AS fullName
FROM employees;

# Ma'lum shart asosida SELECT
SELECT ismi, familya, IF(yoshi > 70, 'qari', 'yosh')    -- shart rost bo'lsa qari aks holda yosh deydi
FROM aholi;

# Ustundagi minimal, o'rtacha va maksimal qiymatlar
SELECT MIN(yosh),
       AVG(yosh),   -- yaxlitlab chiqarish uchun: FLOOR(AVG(yosh))
       MAX(yosh)
FROM aholi;

# limit, n ta satr ma'lumotlarini olish
SELECT *
FROM jadval
LIMIT 10;   -- 10 ta ma'lumot ko'rsatiladi

#       Saralash - ORDER BY
SELECT *
FROM jadval
ORDER BY saralanadigan_ustun DESC;  -- shu ustunni DESC - kamayish, ASC - ortish tartibida saralash, default ASC

#               Jadvalga ma'lumot qo'shish - INSERT
# Jadvalga ma'lumot yozish
INSERT INTO jadval_nomi (ustun_1, ustun_2)  -- ...
VALUES (qiymat_1, qiymat_2)  -- qiymat_1 ustun_1 ga yoziladi
, ('keyingi_qiymatlar_1', 'keyingi_qiymatlar_2')   -- bir nechta ma'lumotlarni yozish
;

# Boshqa jadvaldan yozish
INSERT INTO jadval (kerakli_ustunlar)   -- shu ustunlarga yozilsin
FROM boshqa_jadval                      -- shu jadvaldagi
WHERE shartlar;                         -- shu shartlarga mos tushuvchi ma'lumotlarni
INSERT INTO news (title, description)
SELECT title, 'description yozsa boladi'
FROM category;

# Oxirgi qo'shilgan ma'lumot ID si
SELECT LAST_INSERT_ID();

# INSERT IGNORE - yozishda xatolikni (dublikat) tashlab ketish
INSERT IGNORE INTO magazin(ustunlar)
VALUES ('qiymatlar');

#                 WHERE - ustunlardagi ma'lumotlarni filtrlash
# Qolip
SELECT kerakli_ustunlar
FROM jadval_nomi
WHERE qidiruv_parametrlari_shartlari;   -- shu shartga mos ustunlarni tanlab oladim, mantiqiy ifodalar ham ishlatiladi

# BETWEEN - ma'lum oraliqqa mos keluvchi qiymatlar
SELECT ustunlar
FROM jadval
WHERE ustun BETWEEN boshi AND oxiri;        -- boshi va oxiri qiymatiga mos keluvchi qiymatlarni filtrlaydi

# LIKE - ustundan qidirish
SELECT ustunlar
FROM jadval
WHERE customerName LIKE 'a%'    -- a bilan boshlanadiganlarni qidirish
WHERE customerName LIKE '%a'    -- a bilan tugaydiganlarni qidirish
WHERE customerName LIKE 'S%r'   -- S bilan boshlanib r bilan tugayidganlarni qidirish
WHERE customerName LIKE '_r'    -- r bilan tugaydigan jami 2 harfdan iborat jumlani qidirish va h.k
;

#     IN - ichida shu qiymatlar borlarini filtrlash uchun
SELECT *
FROM employees.employees
WHERE emp_no IN (1501, 1076, 1176, 1209);  -- shu ustundan shu qiymatlarni o'z ichiga olganlarni filtrlasin

#         NOT IN - IN ni teskarisi
SELECT *
FROM employees.employees
WHERE emp_no IN (1501, 1076, 1176, 1209);  -- shu ustundan shu qiymatlarni o'z ichiga olmaganlarni filtrlasin

#     IS NULL - NULL qiymatlilarni filtrlasin
SELECT *
FROM customers
WHERE state IS NULL;    -- shu ustundagi qiymatlar null bo'lganlarini filtrlasin

#       IS NOT NULL - NULL qiymat mavjud bo'lmaganlarni filtrlash
SELECT *
FROM customers
WHERE state IS NULL;    -- shu ustundagi qiymatlar null bo'lmaganlarini filtrlasin

#       ANY - SUBQUERY dagi WHERE shartidagi hech bo'lmasa 1 tasi rost bo'lganni filtrlaydi
SELECT *
FROM products
WHERE price > ANY (SELECT price FROM products WHERE category_id = 1);  -- category_id = 1 dan katta bo'lgan hech bo'lmasa bittasi katta bo'lgan tovar narhlarini filtrlaydi
# boshqa mantiqiy operatorlar bilan ham ishlatiladi

#       ALL - SUBQUERY dagi WHERE shartidagi hech bo'lmasa barchasi rost bo'lganni filtrlaydi
# ANY kabi, faqat hammasi mos kelishi kerak, ANY da bittasi mos kelsa ham bajarilardi
# boshqa mantiqiy operatorlar bilan ham ishlatiladi

#                     LIMIT va OFFSET - natijalarni chegaralash
SELECT ustunlar
FROM jadval
LIMIT 10            -- jami 10 ta natijani chiqarish
LIMIIT 5, 10;      -- boshidan 5 tani tashlab ketib 10 tani olish

# BAJARILISH KETMA-KETLIGI:
# FROM -> WHERE -> SELECT -> ORDER BY -> LIMIT;

#                   Ynagilash - UPDATE
UPDATE jadval
SET ustun_1 = qiymat_1,
    ustun_2 = qiymat_2
#     , ... va hokazo
WHERE shartlar;          -- shu shartga mos ustunlarni yangilash

# REPLACE - qiymatni almashtirish
UPDATE employees.employees
SET email = REPLACE(email, '@classicmodelcars.com', '@mail.uz')  -- 2-parametrni 3-parametrdagi qiymatlarga almashtirsin
WHERE officeCode = 6                                             -- officeCode = 6 bo'lganlarini

#                     Ma'lumotni o'chirib qayta yozish - REPLACE
# Jadvalga yangi ma`lumot qo`shayotganda,
# qo`shayotgan ma`lumot bilan bir xil bo`lgan ma`lumot
# jadvalda oldindan bor bo`lsa xatolik chiqaradi.
# Agar yuqoridagidek xatolik chiqsa, jadvaldagi ma`lumot
# o`chiriladi va qaytadan qo`shiladi.

REPLACE INTO jadval (ustunlar)
VALUES (qiymatlar);