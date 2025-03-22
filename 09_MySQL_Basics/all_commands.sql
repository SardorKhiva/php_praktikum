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
WHERE officeCode = 6;                                             -- officeCode = 6 bo'lganlarini

#                     Ma'lumotni o'chirib qayta yozish - REPLACE
# Jadvalga yangi ma`lumot qo`shayotganda,
# qo`shayotgan ma`lumot bilan bir xil bo`lgan ma`lumot
# jadvalda oldindan bor bo`lsa xatolik chiqaradi.
# Agar yuqoridagidek xatolik chiqsa, jadvaldagi ma`lumot
# o`chiriladi va qaytadan qo`shiladi.

REPLACE INTO jadval (ustunlar)
VALUES (qiymatlar);

#                       Ma'lumotlarni o'chirish  -  DELETE
-- shu shartga mos ma'lumotlar o'chirilsin
DELETE
FROM jadvaL_nomi
WHERE shartlar;

-- shart bo'lmasa jadval to'liq o'chadi
DELETE
FROM jadval_nomi;

DELETE
FROM jadval
LIMIT 10;   -- boshidan 10 tani o'chirish

#         Jadvalni o'zgartirish - ALTER TABLE
# ALTER TABLE - jadvalga yangi ustun qo'shish,
# ustun turini o'zgartirish,
# ustun nomini o'zgartirish,
# jadval nomini o'zgartirish yoki
# ustunni o'chirish uchun ishlatiladi

#     Yangi ustun qo'shish
# Qolip
ALTER TABLE jadval_nomi
ADD yangi_ustun_nomi ustun_turi

# Misol
ALTER TABLE news
ADD thumb_image VARBINARY(50)
DEFAULT 0;

# Yangi ustunni biror ustundan keyin hosil qilish
ALTER TABLE news
ADD thumb VARCHAR(50)  -- shu sutn hosil qilinsin
DEFAULT NULL
AFTER category_id;  -- shu ustundan keyin hosil qilinsin

# Ustun o'rnini almashtirish
# Qolip
ALTER TABLE jadval
CHANGE COLUMN ustun ustun_turi
AFTER boshqa_ustun_nomi;

# Misol
ALTER TABLE employees.employees
CHANGE COLUMN thumb_image VARCHAR(50)  -- shu ustun
DEFAULT NULL
AFTER title;                           -- shu ustundan keyin joylansin

# Jadvalga yangi 2 ustun qo'shish
ALTER TABLE jadval
ADD yang_ustun  yangi_ustun_turi,
ADD yangi_ustun_2 yangi_ustun_turi2;    -- va h.k

# Ustun turini o'zgartirish:
ALTER TABLE jadval_nomi
MODIFY ustun_nomi TURI;     -- o'zgartiriladigan ustun turi yoziladi

# Ustunni nomini o'zgartirish
ALTER TABLE jadval
CHANGE COLUMN ustun_eski_nomi ustun_yangi_nomi TURI;

# Ustunni o'chirish
ALTER TABLE jadval_nomi
DROP COLUMN ustun_nomi;

# Jadval nomini o'zgartirish
# 1- usul
ALTER TABLE jadval_nomi
RENAME TO jadval_yangi_nomi;


#             DATE funksiyalari
# CURDATE - Joriy sanani YYYY-OO-KK formatida qaytarish
SELECT CURDATE();

# NOW - Joriy sana va vaqtni YYYY-OO-KK SS:DD:SS formatda qaytaradi
SELECT NOW();

# DATE - Yil-oy-kun ni olish
SELECT DATE(NOW());     -- natija 2025-03-22

# DAY - Kunni olib berish
SELECT DAY(NOW());      -- bugungi kunni olib beradi

# YEAR - Yilni olish
SELECT YEAR(NOW());     -- bu yilni olib beradi, 2025

# MONTH - Oyni olib beradi
SELECT MONTH(NOW());    -- joriy oy

# HOUR - Soatni olish
SELECT HOUR(NOW());

# WEEK - Shu kun yilninng nechanchi haftasi ekanligini olib beradi
SELECT WEEK(NOW());

# WEEKDAY - Hafta kuni indexini olISH
SELECT WEEKDAY(NOW());  -- shu bugun shanba bo'lsa 5 ni qaytaradi

# DAYOFWEEK - Berilgan sanan haftaning qaysi kuniga to'g'ri kelishi
SELECT DAYOFWEEK(NOW());

# DAYNAME - Sana kuni haftaning qaysi kunida ekanligini qaytaradi
SELECT DAYNAME(NOW());

# ADDDATE - Berilgan sanaga kun, soat, daqiqa va boshqalarni qo'shish
-- sanaga 10 kun qo'shish
SELECT ADDDATE('2025-03-22', 10);

-- sanaga 10 kun qo'shish
SELECT ADDDATE(CURDATE(), -10);

-- 10 kunni INTERVAL bilan qo'shish
SELECT ADDDATE(CURDATE(), INTERVAL 10 day); -- 10 kundan keyingi sana

-- 10 soat qo'shish
SELECT ADDDATE(CURDATE(), INTERVAL 10 hour);
/* INTERVAL dan keyin bular yozilishi mumkin + va - orqali
 year - yil,
 quarter - 3 oylik (yil boshidan)
 month - oy
 week - hafta
 day - kun
 hour - soat
 minute - daqiqa
 second - soniya
 */

-- ADDTIME - sanaga vaqt qo'shish
SELECT ADDTIME(NOW(), '2 02:12:11');    -- 2 kun va shuncha soat:daqiqa:soniya qo'shadi

#           DATE_FORMAT()  -  berilgan sanani kerakli formatda chiqaradi
# DATE_FORMAT(date, format);        umumiy ko'rinishi
# date — sanani yoki vaqtni bildiradi (DATE, DATETIME, TIMESTAMP tipidagi ma'lumotlar).
# format — sanani qanday formatda ko‘rsatishni belgilaydi (bu yerda format belgilaridan foydalaniladi).
SELECT NOW(), DATE_FORMAT(NOW(), '%Y');
SELECT NOW(), DATE_FORMAT(NOW(), '%y');
SELECT NOW(), DATE_FORMAT(NOW(), '%d %m %Y ');
# DATE_FORMAT() Format belgilarining ro‘yxati:
/*------------+--------------------------------------+--------------+
| Format kodi |	Tavsif                               | Misol        |
+-------------+--------------------------------------+--------------+
| %Y	      | To‘liq yil (4 raqam)                 | 2025         |
| %y 	      | Oxirgi 2 raqamli yil                 | 25           |
| %m	      | Oyning raqamli shakli (2)            | 01           |
| %c	      | Oyning raqamli shakli (1-12)         | 1            |
| %M		  | Oy nomi (to‘liq)	                 | January      |
| %b		  | Oy nomi (qisqa)	                     | Jan          |
| %d		  | Kun (2 raqam bilan)	                 | 27           |
| %e	      | Kun (1 yoki 2 raqam bilan)	         | 27           |
| %H	      | Soat (24 soatli format)              | 15           |
| %h		  | Soat (12 soatli format)	             | 03           |
| %i	      | Daqiqa (2 raqam)                     | 05           |
| %s	      | Sekund (2 raqam)	                 | 45           |
| %p	      | AM yoki PM                           | PM           |
| %w	      | Haftaning kuni (0-6)                 | 1 (dushanba) |
| %W	      | Haftaning kuni (nomi bilan)          | Monday       |
| %j	      | Yil boshlanganidan beri kun          | 027          |
| %a	      | Haftaning kuni (qisqa nomi)	         | Mon          |
| %U	      | Yil boshlanganidan beri hafta (1-53) | 04           |
+-------------------------------------------------------------------*/

#     DATEDIFF()  -  2 sana orasidagi kunlar farqi
SELECT DATEDIFF(CURDATE(), '2001-02-10'),
       DATEDIFF(CURDATE(), '1997-02-13'),
       DATEDIFF('2001-02-10', '1997-02-13');

#       DATE_SUB() va SUBDATE()  -  berilgan sanadan biror vaqtni AYIRADI
SELECT DATE_SUB(NOW(), INTERVAL 1 QUARTER);     -- hozirgi sanadan 1 kvartal (3 oy) ayiradi
SELECT SUBDATE(NOW(), 330);

#       MONTHNAME()  -  oy nomini inglizcha qaytaradi
SELECT MONTH(CURRENT_DATE), MONTHNAME(CURDATE()), CURDATE();

#       TIMEDIFF()  -  ikkita soat:daqiqa:soniya ni farqini qaytaradi
SELECT NOW(), TIMEDIFF(TIME(NOW()), '19:34:56');
SELECT NOW(), TIMEDIFF('19:34:56', TIME(NOW()));

#                         Ma'lumotlarni guruhlash - GROUP BY
SELECT ustunlar
FROM jadval
GROUP BY guruhlanadigan_ustun;  -- shu nomdagi ustunlardagi bir xil ma'lumotlar guruhlanadi
# agregat funksiyal;ar bilan birgalikda ishlatiladi
# misol:
SELECT dept_no
FROM dept_emp
GROUP BY dept_no;

# HAVING - guruhlanib chiqqan natijalarni filtrlash
SELECT dept_no
FROM dept_emp
GROUP BY dept_no
HAVING dept_no > 1000;  -- guruhlangan ustun ma'lumotlari ichidan shu sondan kattalarni tanlash

# Xulosalash ROLLUP
SELECT ustun1, ustun2, ..., agregat_funksiya(ustun)
FROM jadval
GROUP BY ROLLUP(ustun1, ustun2, ...);

SELECT YEAR(paymentDate) as yil,
       customerNumber as cus,
       SUM(amount)
FROM classicmodels.payments
GROUP BY customerNumber,
         YEAR(paymentDate) WITH ROLLUP  -- har bir guruhlangan ustunni summasi chiqarilyapti
LIMIT 12;
/* Natija:
+------+-----+-------------+
| yil  | cus | SUM(amount) |
+------+-----+-------------+
| 2003 | 103 |    14571.44 |
| 2004 | 103 |     7742.92 |
| NULL | 103 |    22314.36 |    <-- ROLLUP summalarni summasi har bir customerNumber uchun
| 2003 | 112 |    32641.98 |
| 2004 | 112 |    47539.00 |
| NULL | 112 |    80180.98 |
| 2003 | 114 |    53429.11 |
| 2004 | 114 |   127155.96 |
| NULL | 114 |   180585.07 |
| 2004 | 119 |    67426.01 |
| 2005 | 119 |    49523.67 |
| NULL | 119 |   116949.68 |
+------+-----+-------------+
12 rows in set (0.0018 sec)  */

#             Tashqi kalitlar - FOREIGN KEY
# 1-usul, nomsiz (MySQL ni o'zi nom beradi)
CREATE TABLE student
(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    course_id INT DEFAULT NULL,
    FOREIGN KEY (course_id) -- shu ustun
        REFERENCES course(id) -- course jadvalidagi id ga bog'lansin
)

# 2-usul, o'zimiz foreign key ga nom beramiz
CREATE TABLE  student
(
    id INT UNSIGNED  NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    course_id INT DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_student_c     -- FOREIGN KEY nomi
        FOREIGN KEY(course_id)
            REFERENCES course(id)
);

# Jadvalga FOREIGN KEY qo'shish
ALTER TABLE student -- shu jadvaldagi
ADD FOREIGN KEY (course_id) -- course_id ustuniga FOREIGN KEY qo'shish
REFERENCES course (id);     -- course jadvalidagi id ustuniga havola qiluvchi

# FOREIGN KEY ni o'chirish
ALTER TABLE jadval
DROP FOREIGN KEY foreign_key_name;

#       CASCADE action lar
# ON DELETE RESTRICT, CASCADE, SET NULL
CREATE TABLE parent
(
    id INT PRIMARY KEY
);

CREATE TABLE child
(
  id INT PRIMARY KEY,
  parent_id INT,
  CONSTRAINT FK_child_id
    FOREIGN KEY (parent_id)
        REFERENCES parent(id)
-- parent jadvalidan ma'lumot o'chirilsa, unga bog'langan child jadvalidagi ma'lumot ham o'chadi
            ON DELETE CASCADE
            ON DELETE SET NULL  -- NULL bo'ladi
            ON DELETE RESTRICT  -- o'chirishga ruxsat bermaydi
);

# DELETE - o'chirilayotganda, UPDATE - yangilanayotganda

#             Birlashitirish (eniga) - JOIN
/* JOIN turlari:
INNER JOIN                    - faqat mos keluvchi qatorlar
LEFT JOIN (LEFT OUTER JOIN)   - chap tomondan barchasi, o'ng tomondan mos kelganlari, mos kelganlar bo'lmasa NULL
RIGHT JOIN (RIGHT OUTER JOIN) - o'ng tomondan barchasi, chap tomondan mos kelganlari, mos kelganlar bo'lmasa NULL
FULL JOIN(FULL OUTER JOIN)    - MySQL da UNION orqali amalga oshiriladi
CROSS JOIN                    - har bir qatorni boshqa jadvaldagi har bir qator bilan birlashtiradi (kartesian ko'paytma)
SELF JOIN                     - o'zini o'ziga qo'shish

Misol:
students (talabalar)
id	name	group_id
1	Ali	    101
2	Hasan	102
3	Bobur	101

groups (guruhlar)
id	  group_name
101	   A guruhi
102	   B guruhi
*/
# INNER JOIN ga misol:
SELECT students.name,
       groups.group_name
FROM students
INNER JOIN groups
  ON students.group_id = groups.id;
/* Natija:
name	group_name
Ali	    A guruhi
Hasan	B guruhi
Bobur	A guruhi
*/

#             Ma'lumotlarni yangilashda JOIN - UPDATE va JOIN
# Boshqa jadval asosida bir jadvalni yangilash
UPDATE jadval1
JOIN jadval2
  ON jadval1.common_column = jadval2.common_column
SET jadval1.column_name = yangi_qiymat
WHERE shartlar;

/* Misol
students (talabalar)
id	name	group_id	scholarship
1	Ali	    101	        200000
2	Hasan	102	        250000
3	Bobur	101	        200000

groups (guruhlar)
id  	group_name	bonus
101	    A guruhi	50000
102	    B guruhi	60000

Agar har bir talabaga o'z guruhidagi `bonus` qiymatini
`scholarship` (stipendiya) ustuniga qo'shmoqchi bo'lsak:
 */
UPDATE students
JOIN groups
  ON students.group_id = groups.id
SET students.scholarship = students.scholarship + groups.bonus;
/* Natija
id	name	group_id	scholarship
1	Ali	    101	        250000
2	Hasan	102	        310000
3	Bobur	101	        250000
*/
/* UPDATE JOIN turlari
INNER JOIN - faqat mos keluvchi qatorlarni yangilaydi.
LEFT JOIN  - chap jadvaldagi barchasini yangilaydi,
             mos keluvchi ma'lumotlar topilmasa ham
RIGHT JOIN - o'ng jadvaldagi barcha qatorlarni yangilaydi,
             MySQL da kamdan-kam ishlatiladi
*/

# Ma'lumotlarni o'chirishda  - DELETE JOIN
