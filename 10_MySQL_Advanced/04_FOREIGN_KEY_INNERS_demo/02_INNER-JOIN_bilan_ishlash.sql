SHOW DATABASES; /*
+--------------------+
| Database           |
+--------------------+
| dars_demo          |
| information_schema |
| mashq              |
| mysql              |
| performance_schema |
| sys                |
| temp               |
+--------------------+
7 rows in set (0.01 sec)    */
USE `temp`;
SHOW TABLES;    /*
+----------------+
| Tables_in_temp |
+----------------+
| courses        |
| student course |
| students       |
| teachers       |
+----------------+
4 rows in set (0.00 sec)    */

SELECT * FROM `courses`;  /*
+----+------------+--------------+------------+
| id | title      | course_price | teacher_id |
+----+------------+--------------+------------+
|  1 | Matematika |      1000000 |          1 |
|  2 | Fizika     |      1200000 |          2 |
|  3 | Ona tili   |      1500000 |          3 |
|  4 | Kimyo      |      1000000 |          4 |
|  5 | Biologiya  |       800000 |          5 |
|  6 | PHP        |      2000000 |          6 |
|  7 | MySQl      |      1400000 |          7 |
+----+------------+--------------+------------+
7 rows in set (0.00 sec)  */

SELECT * FROM `students`;  /*
+----+---------+------------+--------------+
| id | name    | birth_day  | phone_number |
+----+---------+------------+--------------+
|  1 | Eshmat  | 1990-01-01 | 998909999999 |
|  2 | Toshmat | 1975-11-11 | 998909991111 |
|  3 | Sardor  | 1988-05-23 | 998909994444 |
|  4 | Dilshod | 1990-01-02 | 998334569845 |
+----+---------+------------+--------------+
4 rows in set (0.01 sec)  */

SELECT * FROM `student course`; /*
+----+------------+-----------+
| id | student_id | course_id |
+----+------------+-----------+
|  1 |          1 |         1 |
|  2 |          1 |         2 |
|  3 |          1 |         3 |
|  4 |          2 |         4 |
|  5 |          2 |         5 |
|  6 |          2 |         6 |
|  7 |          3 |         7 |
|  8 |          4 |         7 |
+----+------------+-----------+
8 rows in set (0.00 sec)  */

SELECT *
FROM `courses`
INNER JOIN `teachers`
ON `courses`.`id` = `teachers`.`id`;
/* `courses` va `teachers` jadvallaridagi barcha ustunlarni inner join qilinishi:
+----+------------+--------------+------------+----+---------+---------------+
| id | title      | course_price | teacher_id | id | name    | tel           |
+----+------------+--------------+------------+----+---------+---------------+
|  1 | Matematika |      1000000 |          1 |  1 | Jasur   | +998123456789 |
|  2 | Fizika     |      1200000 |          2 |  2 | Dilshod | +998123456788 |
|  3 | Ona tili   |      1500000 |          3 |  3 | Karim   | +998123456787 |
|  4 | Kimyo      |      1000000 |          4 |  4 | Islom   | +998123456786 |
|  5 | Biologiya  |       800000 |          5 |  5 | Madina  | +998123456785 |
|  6 | PHP        |      2000000 |          6 |  6 | Dilnoza | +998123456784 |
|  7 | MySQl      |      1400000 |          7 |  7 | Shaxzod | +998123456783 |
+----+------------+--------------+------------+----+---------+---------------+
7 rows in set (0.00 sec)  */
SELECT `courses`.`id` AS 'id',
       `courses`.`title` AS 'kurs nomi',
       `courses`.`course_price` AS 'kurs narhi',
       `teachers`.`name` AS 'ustoz ismi',
       `teachers`.`tel` AS 'ustoz telefoni'
FROM `courses`
INNER JOIN `teachers`
ON `courses`.`id` = `teachers`.`id`;
/* 2 ta jadvaldan kerakli ustunlarni inner join qilsak:
+----+------------+------------+------------+----------------+
| id | kurs nomi  | kurs narhi | ustoz ismi | ustoz telefoni |
+----+------------+------------+------------+----------------+
|  1 | Matematika |    1000000 | Jasur      | +998123456789  |
|  2 | Fizika     |    1200000 | Dilshod    | +998123456788  |
|  3 | Ona tili   |    1500000 | Karim      | +998123456787  |
|  4 | Kimyo      |    1000000 | Islom      | +998123456786  |
|  5 | Biologiya  |     800000 | Madina     | +998123456785  |
|  6 | PHP        |    2000000 | Dilnoza    | +998123456784  |
|  7 | MySQl      |    1400000 | Shaxzod    | +998123456783  |
+----+------------+------------+------------+----------------+
7 rows in set (0.00 sec)  */