# CURDATE() funksiyasi  - hozirgi sanani chiqaradi
SELECT CURDATE(), CURRENT_DATE();/*
+------------+----------------+
| CURDATE()  | CURRENT_DATE() |
+------------+----------------+
| 2025-01-26 | 2025-01-26     |
+------------+----------------+
1 row in set (0.00 sec)  */

USE `dars_demo`;
SELECT COUNT(*)
FROM `employees`
WHERE `hire_date` <= CURDATE(); -- bugundan oldingi
/*---------+
| COUNT(*) |
+----------+
|   300024 |
+----------+
1 row in set (0.12 sec) */

SELECT SUM(`salary`)    -- `salary` ustunidagi qiymatlar summasini chiqarsin
FROM `salaries`         -- `salaries` jadvaidan
WHERE CURDATE()         -- agar, hozirgi sana
BETWEEN `from_date`     -- orasida bo'lsa `from_date`
AND `to_date`;          -- va `to_date` ustunlarining
/*--------------+
| SUM(`salary`) |
+---------------+
|   17291866123 |
+---------------+
1 row in set (1.52 sec) */


/*            NOW(), CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP -
              hozirgi sana va vaqtni 'YYYY-MM-DD HH-MM-DD' chiqaradi    */
/*--------------------+---------------------+---------------------+
| NOW()               | CURRENT_TIMESTAMP   | CURRENT_TIMESTAMP() |
+---------------------+---------------------+---------------------+
| 2025-01-26 09:36:04 | 2025-01-26 09:36:04 | 2025-01-26 09:36:04 |
+---------------------+---------------------+---------------------+
1 row in set (0.00 sec) */

#       NOW() - funksiyasidan jadvalda default qiymat sifatida ishlatsa bo'ladi
CREATE TABLE `kategoriya`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT NOW()
);

#       NOW() ni so'rovlarda ishlatilishi
SELECT COUNT(*)
FROM `salaries`
WHERE NOW()
BETWEEN `from_date`
AND `to_date`;
/*---------+
| COUNT(*) |
+----------+
|   240124 |
+----------+
1 row in set (1.36 sec) */

SELECT COUNT(*)
FROM `salaries`
WHERE `to_date` <= NOW();
/*---------+
| COUNT(*) |
+----------+
|  2603923 |
+----------+
1 row in set (1.22 sec) */

/*    DATE()  -  berilgan 'YYYY-MM-DD HH:MM:DD' formatdagi vaqtdan, sanani ajratib beradi.
 Ya'ni, natijani 'YYYY-MM-DD' formatda qaytaradi.   */

SELECT DATE('2022-09-16 19:02:40'), DATE(NOW());/*
+-----------------------------+-------------+
| DATE('2022-09-16 19:02:40') | DATE(NOW()) |
+-----------------------------+-------------+
| 2022-09-16                  | 2025-01-26  |
+-----------------------------+-------------+
1 row in set (0.00 sec)  */

#           So'rovlarda ishlatilishi
SELECT *
FROM `salaries`
WHERE `to_date` >= DATE(NOW())
LIMIT 5;
/* natija:
+--------+--------+------------+------------+
| emp_no | salary | from_date  | to_date    |
+--------+--------+------------+------------+
|  10001 |  88958 | 2002-06-22 | 9999-01-01 |
|  10002 |  72527 | 2001-08-02 | 9999-01-01 |
|  10003 |  43311 | 2001-12-01 | 9999-01-01 |
|  10004 |  74057 | 2001-11-27 | 9999-01-01 |
|  10005 |  94692 | 2001-09-09 | 9999-01-01 |
+--------+--------+------------+------------+
5 rows in set (0.00 sec)  */

SELECT *
FROM `salaries`
WHERE `from_date` >= DATE('1992-01-01 00:01:23')
AND   `to_date`   <= DATE('1992-12-31 23:59:59')
LIMIT 5;
/*
+--------+--------+------------+------------+
| emp_no | salary | from_date  | to_date    |
+--------+--------+------------+------------+
|  10098 |  56202 | 1992-05-11 | 1992-12-11 |
|  10115 |  47429 | 1992-03-02 | 1992-05-24 |
|  10402 |  52095 | 1992-01-01 | 1992-12-31 |
|  11011 |  61954 | 1992-06-09 | 1992-10-26 |
|  11097 |  67346 | 1992-01-28 | 1992-07-26 |
+--------+--------+------------+------------+
5 rows in set (0.01 sec)  */

#       DAY()  -  kunni olib beradi
SELECT DAY('2025-01-26 19:02:40') AS `bugungi_sana`; /*
+--------------+
| bugungi_sana |
+--------------+
|           26 |
+--------------+
1 row in set (0.00 sec) */

SELECT *
FROM `employees`
WHERE DAY(`hire_date`) = 16
LIMIT 10;
/*-------+------------+------------+---------------+--------+------------+
| emp_no | birth_date | first_name | last_name     | gender | hire_date  |
+--------+------------+------------+---------------+--------+------------+
|  10086 | 1962-11-19 | Somnath    | Foote         | M      | 1990-02-16 |
|  10104 | 1961-11-19 | Xinyu      | Warwick       | M      | 1987-04-16 |
|  10109 | 1958-11-25 | Mariusz    | Prampolini    | F      | 1993-06-16 |
|  10150 | 1955-01-29 | Zhenbing   | Perng         | F      | 1986-11-16 |
|  10196 | 1954-01-27 | Marc       | Hellwagner    | M      | 1994-11-16 |
|  10200 | 1961-12-31 | Vidya      | Awdeh         | M      | 1985-10-16 |
|  10230 | 1955-09-11 | Clyde      | Vernadat      | M      | 1996-06-16 |
|  10264 | 1958-09-08 | Nalini     | Kawashimo     | F      | 1997-07-16 |
|  10277 | 1964-08-15 | Isaac      | Schwartzbauer | M      | 1985-06-16 |
|  10296 | 1964-05-13 | Petter     | Lorho         | M      | 1989-09-16 |
+--------+------------+------------+---------------+--------+------------+
10 rows in set (0.00 sec)   */


#       YEAR() - yilni qaytaradi
SELECT YEAR(NOW());     -- hozirgi sanadan yilning tartib raqamini olib beradi
SELECT * FROM `employees` WHERE YEAR(`hire_date`) = 1997;       -- 1997-yilda ishga kirganlarni chiqarish


#       MONTH() - oyni qaytaradi
SELECT MONTH(NOW());    -- hozirgi sanadagi oyning tartib raqamini chiqaradi,
SELECT * FROM `employees` WHERE MONTH(`hire_date`) = 9;     -- 9-oyda ishga olinganlarni chiqaradi
SELECT `first_name`,
MONTH(`hire_date`) AS 'hired_month',
      `hire_date`
FROM `employees`
WHERE MONTH(`hire_date`) = 9
LIMIT 5;
/* natija:
+------------+-------------+------------+
| first_name | hired_month | hire_date  |
+------------+-------------+------------+
| Kyoichi    |           9 | 1989-09-12 |
| Saniya     |           9 | 1994-09-15 |
| Karsten    |           9 | 1991-09-01 |
| Bader      |           9 | 1988-09-21 |
| Alain      |           9 | 1988-09-05 |
+------------+-------------+------------+
5 rows in set (0.00 sec)    */

#       HOUR()  -  soatni qaytaradi
SELECT HOUR(NOW());     -- hozirgi vaqtdan soatni chiqarib beradi
SELECT HOUR('2025-07-07 12:34:56');     -- shu sanadan soatni ajratib beradi


#       WEEK    -    yilning nechanchi haftasiligini qaytaradi
SELECT WEEK(NOW());     -- hozirgi sana yilning nechanchi haftaligi ekanligini ko'rsatadi

#       WEEKDAY   -   hafta kuni indexi (index 0 dan boshlanadi)
SELECT WEEKDAY(NOW());      -- hozirgi sana hafta kuni indexi, dushanba - 0

#           DAYOFWEEK()  va DAYNAME()  -  hafta kuni tartib raqami va hafta kuni nomini qaytaradi
SELECT DAYOFWEEK(NOW());    -- yakshanba - 1, dushanba - 2, ...
SELECT DAYNAME(NOW());      -- hozirgi sana hafta kuni nomini odatda inglizcha chiqaradi
SELECT DAYOFWEEK(NOW()) AS 'hafta kuni t/r',
       DAYNAME(NOW())   AS 'hafta kuni nomi';

#           DATE_ADD() | ADDDATE()  -  berilgan sanaga kun, soat, minut va boshqa vaqt turlarini qo'shadi
SELECT NOW(), ADDDATE(NOW(),  10);    -- hozirgi sanaga 10 kun qo'shadi
SELECT NOW(), ADDDATE(NOW(), -10);    -- hozirgi sanaga 10 kun ayiradi
SELECT NOW(), ADDDATE(NOW(), INTERVAL  1 DAY);    -- hozirgi sanaga 1 kun qo'shadi, INTERVAL dan keyin 'miqdor' va vaqt turi inglizcha yoziladi
SELECT NOW(), ADDDATE(NOW(), INTERVAL -1 DAY);    -- hozirgi sanaga 1 kun ayiradi, INTERVAL dan keyin 'miqdor' va vaqt turi inglizcha yoziladi
/* miqdordan keyin
SECOND  -  soniya
MINUTE  - daqiqa
HOUR    - soat
DAY     - kun
WEEK    - hafta
MONTH   - oy
QUARTER - kvartal (1-3- oylar 1-kvartal va h.k)
YEAR    - yil   */

#           ADDTIME()  -  berilgan sanaga vaqt qo'shadi
#   2025-01-27 11:14:26
# +
#            2 12:00:00
#   2025-01-29 23:14:26
SELECT NOW(), ADDTIME(NOW(), '2 12:00:00');     -- hozirgi sanaga 2 kun, 12 soat 0 daqiqa 0 soniya qo'shadi

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