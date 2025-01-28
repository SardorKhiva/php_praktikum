/* Bir nechta jadvallardan ma`lumot olish uchun JOIN lardan foydalanamiz.

Misollarda ko`rsatishligimiz uchun quyidagi ikkita jadvalni yaratamiz va
ichiga ma`lumotlarni insert qilamiz.
*/

# Kurs nomlarini saqlash uchun `course` jadvali:
CREATE DATABASE `temp`;
USE `temp`;
CREATE TABLE `course`
(
    `id`   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL
);

/* Qaysi talaba qaysi kursga borishi
haqidagi ma`lumotlarni saqlash uchun
"student" jadvali. Bu jadvalda hechqaysi
kursga bormaydiganlari ham bo`lishi mumkin. */
CREATE TABLE `student`
(
    `id`        INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name`      VARCHAR(30)  NOT NULL,
    `course_id` INT DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`course_id`)
        REFERENCES course (`id`)
);

INSERT INTO `course` (`name`)
VALUES ("HTML"),
       ("PHP"),
       ("JS"),
       ("C++"),
       ("Java"),
       ("CSS");

INSERT INTO `student` (`name`, `course_id`)
VALUES ("Sardor", 4),
       ("Eshmat", NULL),
       ("Toshmat", 1),
       ("Elyor", 4),
       ("Ogabek", 5),
       ("Shaxboz", NULL),
       ("Ulugbek", 2),
       ("Botir", 4),
       ("Sarvar", 5),
       ("Muhiddin", 3),
       ("Jasur", NULL),
       ("Samandar", 2);

#                 Qolip:
SELECT `kerakli_ustunlar`
FROM `jadval_1`
         INNER JOIN `jadval_2`
                    ON boglanish_sharti;

/*
"student" jadvalida HTML kursga boradiganlar bor,
Java kursiga boradiganlar bor,
HTML va JAVA kursiga boradiganlar ham bor.
Umuman kursga bormaydiganlar ham bor.

Bizga kim qaysi kursga borayotganligi haqida ma`lumotni olish uchun INNER JOIN dan foydalanamiz. Ya`ni ikkita jadvalda bir biriga mos bo`lgan ma`lumotlarni olish uchun INNER JOIN dan foydalanamiz.
Agar 1-jadvalda ikkinchisiga bog`liq ma`lumot bo`lmasa ularni olmaydi.
*/

# Ushbu so`rovda "student"
# jadvalidagi barchasini olib chiqadi.
SELECT *
FROM `student`;
/*
+----+----------+-----------+
| id | name     | course_id |
+----+----------+-----------+
|  1 | Sardor   |         4 |
|  2 | Eshmat   |      NULL |
|  3 | Toshmat  |         1 |
|  4 | Elyor    |         4 |
|  5 | Ogabek   |         5 |
|  6 | Shaxboz  |      NULL |
|  7 | Ulugbek  |         2 |
|  8 | Botir    |         4 |
|  9 | Sarvar   |         5 |
| 10 | Muhiddin |         3 |
| 11 | Jasur    |      NULL |
| 12 | Samandar |         2 |
+----+----------+----------*/

# Endi shulardan faqat kursga boradiganlarni
# va qaysi kursga borishini chiqaramiz
SELECT *
FROM `student`
         INNER JOIN `course`
                    ON `course`.`id` = `student`.`course_id`
ORDER BY `student`.`id`;
/*
+----+----------+-----------+----+------+
| id | name     | course_id | id | name |
+----+----------+-----------+----+------+
|  1 | Sardor   |         4 |  4 | C++  |
|  3 | Toshmat  |         1 |  1 | HTML |
|  4 | Elyor    |         4 |  4 | C++  |
|  5 | Ogabek   |         5 |  5 | Java |
|  7 | Ulugbek  |         2 |  2 | PHP  |
|  8 | Botir    |         4 |  4 | C++  |
|  9 | Sarvar   |         5 |  5 | Java |
| 10 | Muhiddin |         3 |  3 | JS   |
| 12 | Samandar |         2 |  2 | PHP  |
+----+----------+-----------+----+------+
9 rows in set (0.00 sec) */

# Yana ham aniqroq ko`rinishi uchun kerakli ustunlarni select qilamiz:
SELECT `student`.`id`,
       `student`.`name` AS 'ismi',
       `course`.`name`  AS 'kurs nomi'
FROM `student`
         INNER JOIN `course`
                    ON `course`.`id` = `student`.`course_id`
ORDER BY `student`.`id`;
/*
+----+----------+-----------+
| id | ismi     | kurs nomi |
+----+----------+-----------+
|  1 | Sardor   | C++       |
|  3 | Toshmat  | HTML      |
|  4 | Elyor    | C++       |
|  5 | Ogabek   | Java      |
|  7 | Ulugbek  | PHP       |
|  8 | Botir    | C++       |
|  9 | Sarvar   | Java      |
| 10 | Muhiddin | JS        |
| 12 | Samandar | PHP       |
+----+----------+-----------+
9 rows in set (0.00 sec)  */

# Agar bizga faqat "Java" kursiga boradiganlar kerak bo`lsa:
SELECT `student`.`id`,
       `student`.`name` AS 'ismi',
       `course`.`name`  AS 'kurs nomi'
FROM `student`
         INNER JOIN `course`
                    ON `course`.`id` = `student`.`course_id`
WHERE `course`.`name` = "Java"
ORDER BY `student`.`id`;
/*
+----+--------+-----------+
| id | ismi   | kurs nomi |
+----+--------+-----------+
|  5 | Ogabek | Java      |
|  9 | Sarvar | Java      |
+----+--------+-----------+
2 rows in set (0.00 sec) */

#                 LEFT JOIN