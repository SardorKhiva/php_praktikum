SHOW DATABASES;
CREATE DATABASE `temp`;
USE `temp`;
SHOW TABLES;

/*CREATE TABLE IF NOT EXISTS `talabalar`
(
    `id`        INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name`      VARCHAR(30)  NOT NULL,
    `course_id` INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`course_id`)
        REFERENCES kurslar (`id`)
); */

CREATE TABLE IF NOT EXISTS `courses`
(
    `id`           INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `title`        VARCHAR(50)  NOT NULL,
    `course_price` DECIMAL(7, 0) DEFAULT 0,
    `teacher_id`   INT UNSIGNED NOT NULL,
    FOREIGN KEY (`teacher_id`)
        REFERENCES teachers (`id`)
);
INSERT INTO `courses` (`title`, `course_price`, `teacher_id`)
VALUES ("Matematika", 1000000, 1),
       ("Fizika", 1200000, 2),
       ("Ona tili", 1500000, 3),
       ("Kimyo", 1000000, 4),
       ("Biologiya", 800000, 5),
       ("PHP", 2000000, 6),
       ("MySQl", 1400000, 7);
SELECT * FROM courses; /*
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
7 rows in set (0.00 sec)    */


CREATE TABLE IF NOT EXISTS `teachers`
(
    `id`   INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(30)  NOT NULL,
    `tel`  VARCHAR(13)  NOT NULL
);
INSERT INTO `teachers` (`name`, `tel`)
VALUES ("Jasur", '+998123456789'),
       ("Dilshod", '+998123456788'),
       ("Karim", '+998123456787'),
       ("Islom", '+998123456786'),
       ("Madina", '+998123456785'),
       ("Dilnoza", '+998123456784'),
       ("Shaxzod", '+998123456783');
SELECT * FROM `teachers`; /*
+----+---------+---------------+
| id | name    | tel           |
+----+---------+---------------+
|  1 | Jasur   | +998123456789 |
|  2 | Dilshod | +998123456788 |
|  3 | Karim   | +998123456787 |
|  4 | Islom   | +998123456786 |
|  5 | Madina  | +998123456785 |
|  6 | Dilnoza | +998123456784 |
|  7 | Shaxzod | +998123456783 |
+----+---------+---------------+
7 rows in set (0.00 sec)    */


CREATE TABLE IF NOT EXISTS `students`
(
    `id`           INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name`         VARCHAR(40)  NOT NULL,
    `birth_day`    DATE         NOT NULL,
    `phone_number` VARCHAR(13)  NOT NULL
);
INSERT INTO `students` (`name`, `birth_day`, `phone_number`)
VALUES ("Eshmat", '1990-01-01', '998909999999'),
       ("Toshmat", '1975-11-11', '998909991111'),
       ("Sardor", '1988-05-23', '998909994444'),
       ("Dilshod", '1990-01-02', '998334569845');
SELECT * FROM `students`; /*
+----+---------+------------+--------------+
| id | name    | birth_day  | phone_number |
+----+---------+------------+--------------+
|  1 | Eshmat  | 1990-01-01 | 998909999999 |
|  2 | Toshmat | 1975-11-11 | 998909991111 |
|  3 | Sardor  | 1988-05-23 | 998909994444 |
|  4 | Dilshod | 1990-01-02 | 998334569845 |
+----+---------+------------+--------------+
4 rows in set (0.00 sec)    */


CREATE TABLE `student course`
(
    `id`         INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `student_id` INT UNSIGNED NOT NULL,
    `course_id`  INT UNSIGNED NOT NULL,
    FOREIGN KEY (`student_id`)
        REFERENCES `students` (`id`)
);
INSERT INTO `student course` (`student_id`, `course_id`)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (2, 4),
       (2, 5),
       (2, 6),
       (3, 7),
       (4, 7);
SELECT * FROM `student course`;  /*
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
8 rows in set (0.00 sec)    */

