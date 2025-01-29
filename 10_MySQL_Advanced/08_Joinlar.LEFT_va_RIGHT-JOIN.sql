/*              JOIN larning 3 turi bor:
1. INNER JOIN - 2 jadvalning bog'langan qismi
2. LEFT JOIN  - chap tomodagi jadval to'liq chiqadi
va o'ng tomondagi jadvalning faqat chap tomondagi jadvalga aloqasi borlari chiqadi
        Qolip:
SELECT `chap_jadval_nomi`.`ustun_nomi`, ... ,
       `o'ng_jadval_nomi`.`ustun_nomi`, ... ,
FROM `chap_jadval_nomi`
LEFT JOIN `o'ng_jadval_nomi`
ON `shartlar` (bog'liqligi bor jadval.ustun nomlari)

3. RIGHT JOIN - o'ng tomondagi jadval to'liq chiqadi
va chap tomondagi jadvalning o'ng tomonga taaluqli ustunlari chiqadi
agar chap tomondagi jadvalda ma'lumot bo'lmasa NULL chiqadi
*/

SHOW DATABASES;
USE `temp`;
SHOW TABLES;
DESC `courses`;

SELECT *
FROM `courses`
LEFT JOIN `teachers`
ON `courses`.`teacher_id` = `teachers`.`id`;
/* barcha ustunlarni left join qilish
+----+------------+--------------+------------+------+---------+---------------+
| id | title      | course_price | teacher_id | id   | name    | tel           |
+----+------------+--------------+------------+------+---------+---------------+
|  1 | Matematika |      1000000 |          1 |    1 | Jasur   | +998123456789 |
|  2 | Fizika     |      1200000 |          2 |    2 | Dilshod | +998123456788 |
|  3 | Ona tili   |      1500000 |          3 |    3 | Karim   | +998123456787 |
|  4 | Kimyo      |      1000000 |          4 |    4 | Islom   | +998123456786 |
|  5 | Biologiya  |       800000 |          5 |    5 | Madina  | +998123456785 |
|  6 | PHP        |      2000000 |          6 |    6 | Dilnoza | +998123456784 |
|  7 | MySQl      |      1400000 |          7 |    7 | Shaxzod | +998123456783 |
+----+------------+--------------+------------+------+---------+---------------+
7 rows in set (0.00 sec)  */

SELECT `courses`.`id`,
       `courses`.`title` AS 'kurs nomi',
       `course_price` AS 'kurs narhi',
       `teachers`.`name` AS 'ustoz ismi'
FROM `courses`
LEFT JOIN `teachers`
ON `courses`.`teacher_id` = `teachers`.`id`
# ORDER BY
;
/*
+----+------------+------------+------------+
| id | kurs nomi  | kurs narhi | ustoz ismi |
+----+------------+------------+------------+
|  1 | Matematika |    1000000 | Jasur      |
|  2 | Fizika     |    1200000 | Dilshod    |
|  3 | Ona tili   |    1500000 | Karim      |
|  4 | Kimyo      |    1000000 | Islom      |
|  5 | Biologiya  |     800000 | Madina     |
|  6 | PHP        |    2000000 | Dilnoza    |
|  7 | MySQl      |    1400000 | Shaxzod    |
+----+------------+------------+------------+
7 rows in set (0.00 sec)    */

