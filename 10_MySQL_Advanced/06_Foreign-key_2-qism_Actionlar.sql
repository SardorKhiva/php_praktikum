# CASCADE actionlar
/* Biror ma'lumot UPDATE yoki DELETE bo'lganda,
FOREIGN KEY bilan bog'langan jadvallardagi ma'lumotlarga
ham ta'sir qilishi mumkin.

   Ya'ni 1 ta qatorni o'chirmoqchimiz,
lekin undagi biror ustun boshqa jadvalga
FOREIGN KEY bilan bog'langan.

   Yuqoridagi `student` va `course` jadvallarini misol
qilishimiz mumkin.

   Agar "course" jadvalidan "HTML" qiymatli qatorni o`chirmoqchimiz.
"student" jadvalida "HTML" ning id si ishlatilgan bo`lsa,
o`sha barcha ishlatilgan qatorlarni ham o`chirishni xohlayapmiz.

  Ya`ni "HTML" kursiga boradigan barcha studenlarni o`chirmoqchimiz.
Shunday holda ON DELETE [action_nomi] dan foydalanamiz.

  Ya`ni bog`langan jadvalda birortasi o`chirilsa,
ikkichi jadvaldan ham shu ma`lumotga bog`liq bo`lganlarini ham o`chiradi.
Uning uchun jadvalimizni quyidagicha hosil qilishimiz kerak     */

USE mashq;
CREATE TABLE `course`
(
    `id`   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE `student`
(
    `id`        INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name`      VARCHAR(30)  NOT NULL,
    `course_id` INT DEFAULT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `FK_student_c`
        FOREIGN KEY (`course_id`)
            REFERENCES course (`id`)
);

# `course` jadvaliga kurslarni kiritamiz:
INSERT INTO `course`(`name`)
VALUES ('HTML'),
       ('PHP'),
       ('JS'),
       ('C++'),
       ('Java'),
       ('CSS');
SELECT *
FROM course;
/*---+------+
| id | name |
+----+------+
|  1 | HTML |
|  2 | PHP  |
|  3 | JS   |
|  4 | C++  |
|  5 | Java |
|  6 | CSS  |
+----+------+
6 rows in set (0.00 sec)    */

# `student` jadvaliga o'quvchilarning ma'lumotlarini kiritish:
INSERT INTO `student` (`name`, `course_id`)
VALUES ("Sardor", 4),
       ("Eshmat", NULL),
       ("Toshmat", 1),
       ("Elyor", 4),
       ("Og'abek", 5),
       ("Shaxboz", NULL),
       ("Ulug'bek", 2),
       ("Botir", 4),
       ("Sarvar", 5),
       ("Muhiddin", 3),
       ("Jasur", NULL),
       ("Samandar", 2);

SELECT *
FROM `student`;
/*---+----------+-----------+
| id | name     | course_id |
+----+----------+-----------+
|  1 | Sardor   |         4 |
|  2 | Eshmat   |      NULL |
|  3 | Toshmat  |         1 |
|  4 | Elyor    |         4 |
|  5 | Og'abek  |         5 |
|  6 | Shaxboz  |      NULL |
|  7 | Ulug'bek |         2 |
|  8 | Botir    |         4 |
|  9 | Sarvar   |         5 |
| 10 | Muhiddin |         3 |
| 11 | Jasur    |      NULL |
| 12 | Samandar |         2 |
+----+----------+-----------+
12 rows in set (0.00 sec)   */

#                   Actionlar
#           ON DELETE RESTRICT (DEFAULT)
/*
Yuqoridagi "course" va "student" jadvallarini hosil qildik.
"student" jadvalida "course_id" ustunini
FOREIGN KEY bilan "student" jadvaliga bog`ladik.
Va shu foreign key ustunda ON DELETE actioniga hechnarsa yozmadik.
Agar hechnarsa yozmasak ON DELETE RESTRICT deb qabul qiladi.

Bu degani agarda "course" jadvalidan biror ma`lumot o`chirilmoqchi
bo`lsa va o`sha o`chirilmoqchi bo`lgan ma`lumot "student"
jadvalidagi "course_id" ustuni bilan bog`langan bo'lsa,
"course" jadvalidan bu ma`lumotni o`chirishga ruxsat etilmaydi.     */

SELECT *
FROM `course`;
/*
+----+------+
| id | name |
+----+------+
|  1 | HTML |
|  2 | PHP  |   <--- aytaylik shu qatorni o'chirmoqchimiz
|  3 | JS   |
|  4 | C++  |
|  5 | Java |
|  6 | CSS  |
+----+------+
*/

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
|  5 | Og'abek  |         5 |
|  6 | Shaxboz  |      NULL |
|  7 | Ulug'bek |         2 |
|  8 | Botir    |         4 |
|  9 | Sarvar   |         5 |
| 10 | Muhiddin |         3 |
| 11 | Jasur    |      NULL |
| 12 | Samandar |         2 |   <--- 2 id li course shu qatorda ishlatilgan
+----+----------+-----------+
*/

DELETE
FROM `course`
WHERE `id` = 2;
/*
`course` jadvalidagi id = 2 ni o'chirmoqchi bo'lsak,  PHP ni ya'ni:
Quyidagicha xatolik chiqadi:
ERROR 1451 (23000): Cannot delete or update a parent row:
a foreign key constraint fails
(`mashq`.`student`, CONSTRAINT `FK_student_c` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`))
Ya'ni o'chirishga ruxsat bermaydi.
*/

#                ON DELETE CASCADE
# Oldingi FOREIGN KEY ni o'chiramiz:
ALTER TABLE `student`
    DROP FOREIGN KEY `FK_student_c`;

# Endi yangi FOREIGN KEY qo'shamiz:
ALTER TABLE `student`
    ADD CONSTRAINT `FK_student_c`
        FOREIGN KEY (`course_id`)
            REFERENCES course (`id`)
            ON DELETE CASCADE;

/*
Yuqoridagi "course" va "student" jadvallarini
hosil qildik va "student" jadvalida "course_id"
ustunini FOREIGN KEY bilan "student" jadvaliga bog`ladik.
Va shu foreign key ustunda ON DELETE CASCADE qo`lladik.
Bu degani agarda "course" jadvalidan biror ma`lumot o`chirilsa,
o`sha o`chirilgan ma`lumot "student" jadvali bilan bog`langan bo'lsa,
"student" jadvalidagi bog`langan ma`lumot ham o`chirilsin degani.
*/

SELECT *
FROM `course`; /*
+----+------+
| id | name |
+----+------+
|  1 | HTML |
|  2 | PHP  |
|  3 | JS   |
|  4 | C++  |
|  5 | Java |
|  6 | CSS  |
+----+------*/

SELECT *
FROM `student`;/*
+----+----------+-----------+
| id | name     | course_id |
+----+----------+-----------+
|  1 | Sardor   |         4 |
|  2 | Eshmat   |      NULL |
|  3 | Toshmat  |         1 |
|  4 | Elyor    |         4 |
|  5 | Og'abek  |         5 |
|  6 | Shaxboz  |      NULL |
|  7 | Ulug'bek |         2 |
|  8 | Botir    |         4 |
|  9 | Sarvar   |         5 |
| 10 | Muhiddin |         3 |
| 11 | Jasur    |      NULL |
| 12 | Samandar |         2 |
+----+----------+-----------*/

DELETE
FROM `course`
WHERE `id` = 2;

SELECT *
FROM `course`; /*
+----+------+
| id | name |
+----+------+
|  1 | HTML |   -- id=2 li PHP o'chdi
|  3 | JS   |
|  4 | C++  |
|  5 | Java |
|  6 | CSS  |
+----+-----*/

SELECT *
FROM `student`;
/*
course_id = 2 li satrlar o'chdi
+----+----------+-----------+
| id | name     | course_id |
+----+----------+-----------+
|  1 | Sardor   |         4 |
|  2 | Eshmat   |      NULL |
|  3 | Toshmat  |         1 |
|  4 | Elyor    |         4 |
|  5 | Og'abek  |         5 |
|  6 | Shaxboz  |      NULL |
|  8 | Botir    |         4 |
|  9 | Sarvar   |         5 |
| 10 | Muhiddin |         3 |
| 11 | Jasur    |      NULL |
+----+----------+-----------+
`student` jadvalidan `course_id` si
2 ga teng bo'lganlar ham o'chiriladi. */

#           ON DELETE SET NULL
# DROP TABLE `student`;
CREATE TABLE `student`
(
    `id`        INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name`      VARCHAR(30)  NOT NULL,
    `course_id` INT DEFAULT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `FK_student_c`
        FOREIGN KEY (`course_id`)
            REFERENCES course (`id`)
            ON DELETE SET NULL
);

INSERT INTO `student`
VALUES (8, "Sardor", 4),
       (9, "Eshmat", NULL),
       (10, "Toshmat", 1),
       (11, "Elyor", 4),
       (12, "Og'abek", 5),
       (13, "Shaxboz", NULL),
       (14, "Ulug'bek", 1),
       (15, "Botir", 4),
       (16, "Sarvar", 5),
       (17, "Muhiddin", 3),
       (18, "Jasur", NULL),
       (20, "Samandar", NULL);

/*
Bu holatda `course` jadvalidan biror ma'lumot
o'chirmoqchi bo'lsak va bu ma'lumot `student` jadvalidagi
`course_id` ustuni bilan bog'langan bo'lsa,
`course` jadvalidan ma'lumotlarni o'chiradi.
   Lekin `student` jadvalidagi `course_id` ustunidagi
qiymatni NULL ga aylantiradi.
*/

SELECT *
FROM `student`;
/*
+----+----------+-----------+
| id | name     | course_id |
+----+----------+-----------+
|  8 | Sardor   |         4 |
|  9 | Eshmat   |      NULL |
| 10 | Toshmat  |         1 |
| 11 | Elyor    |         4 |
| 12 | Og'abek  |         5 |
| 13 | Shaxboz  |      NULL |
| 14 | Ulug'bek |         1 |
| 15 | Botir    |         4 |
| 16 | Sarvar   |         5 |
| 17 | Muhiddin |         3 |   <--- shu qatorni o'chiramiz
| 18 | Jasur    |      NULL |
| 20 | Samandar |      NULL |
+----+----------+-----------+
*/

SELECT * FROM `course`;
/*
+----+------+
| id | name |
+----+------+
|  1 | HTML |
|  3 | JS   |  <-- shuni o'chiramiz
|  4 | C++  |
|  5 | Java |
|  6 | CSS  |
+----+------+
*/
DELETE FROM `course` WHERE `id` = 3;

SELECT * FROM `course`;
/*
+----+------+
| id | name |
+----+------+
|  1 | HTML |
|  4 | C++  |
|  5 | Java |
|  6 | CSS  |
+----+-----*/

SELECT * FROM `student`;
/*
+----+----------+-----------+
| id | name     | course_id |
+----+----------+-----------+
|  8 | Sardor   |         4 |
|  9 | Eshmat   |      NULL |
| 10 | Toshmat  |         1 |
| 11 | Elyor    |         4 |
| 12 | Og'abek  |         5 |
| 13 | Shaxboz  |      NULL |
| 14 | Ulug'bek |         1 |
| 15 | Botir    |         4 |
| 16 | Sarvar   |         5 |
| 17 | Muhiddin |      NULL |   <-- NULL ga aylandi
| 18 | Jasur    |      NULL |
| 20 | Samandar |      NULL |
+----+----------+-----------+
`course` jadvalidan id = 3 li qator ham o'chdi.
*/

