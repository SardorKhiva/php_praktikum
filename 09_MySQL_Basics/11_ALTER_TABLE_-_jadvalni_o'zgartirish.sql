# ALTER TABLE - jadvalga yangi ustun qo'shish,
#               ustun turi yoki nomini o'zgartirish,
#               jadval nomini o'zgartirish
#               yoki ustunni o'chiradi

SHOW DATABASES;
CREATE DATABASE IF NOT EXISTS `ALTER_TABLE_demo`;
USE `ALTER_TABLE_demo`;

CREATE TABLE IF NOT EXISTS `news`
(
    `id`          INT AUTO_INCREMENT PRIMARY KEY,
    `title`       VARCHAR(100) DEFAULT NULL,
    `category_id` INT,
    `description` TEXT,
    `created_at`  DATETIME     DEFAULT NULL
);

DESC `news`;
/* NATIJA:
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int          | NO   | PRI | NULL    | auto_increment |
| title       | varchar(100) | YES  |     | NULL    |                |
| category_id | int          | YES  |     | NULL    |                |
| description | text         | YES  |     | NULL    |                |
| created_at  | datetime     | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
5 rows in set (0.00 sec) */


-- JADVALGA YANGI USTUN QO'SHISH
-- Qolip:
ALTER TABLE `news`
    ADD `thumb_image` VARCHAR(50) DEFAULT NULL;

DESC `news`;
/* yangi ustun qo'shilgandan keyingi holat:
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int          | NO   | PRI | NULL    | auto_increment |
| title       | varchar(100) | YES  |     | NULL    |                |
| category_id | int          | YES  |     | NULL    |                |
| description | text         | YES  |     | NULL    |                |
| created_at  | datetime     | YES  |     | NULL    |                |
| thumb_image | varchar(50)  | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
6 rows in set (0.00 sec) */

-- BIROR USTUNDAN KEYINDA TURUVCHI USTUN QO'SHISH
ALTER TABLE `news` -- 3) shu jadvaldagi
    ADD `thumb_img` VARCHAR(50) DEFAULT NULL -- 2) shunday ustun hosil qilinsin
        AFTER `category_id`; -- 1) shu ustundan keyin

DESC `news`;
/*
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int          | NO   | PRI | NULL    | auto_increment |
| title       | varchar(100) | YES  |     | NULL    |                |
| category_id | int          | YES  |     | NULL    |                |
| thumb_img   | varchar(50)  | YES  |     | NULL    |                |
| description | text         | YES  |     | NULL    |                |
| created_at  | datetime     | YES  |     | NULL    |                |
| thumb_image | varchar(50)  | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
7 rows in set (0.00 sec) */

#  USTUN JOYLASHISH O'RNINI ALMASHTIRISH
-- Qolip:
ALTER TABLE `table_name`
    CHANGE [COLUMN] `old_column_name` `new_column_name` column_defination
    [FIRST | AFTER `column_name`];

ALTER TABLE `news`
    CHANGE COLUMN `thumb_image` `thumb_image` VARCHAR(50) DEFAULT NULL
        AFTER `thumb_img`;

DESC `news`;
/*  `thumb_image` ustuni `thumb_img` dan keyin joylashitirildi
 +-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int          | NO   | PRI | NULL    | auto_increment |
| title       | varchar(100) | YES  |     | NULL    |                |
| category_id | int          | YES  |     | NULL    |                |
| thumb_img   | varchar(50)  | YES  |     | NULL    |                |
| thumb_image | varchar(50)  | YES  |     | NULL    |                |
| description | text         | YES  |     | NULL    |                |
| created_at  | datetime     | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
7 rows in set (0.00 sec) */

-- JADVALGA YANGI USTUNLAR QO'SHISH
# Qolip:
ALTER TABLE `table_name`
    ADD `new_column_name` column_definations;

-- `news` jadvaliga 2 ta ustun qo'shish
ALTER TABLE `news`
    ADD `column_1` VARCHAR(50) DEFAULT NULL,
    ADD `column_2` INT         DEFAULT NULL;

/* oxiriga 2 ta ustunlarni qo'shish
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int          | NO   | PRI | NULL    | auto_increment |
| title       | varchar(100) | YES  |     | NULL    |                |
| category_id | int          | YES  |     | NULL    |                |
| thumb_img   | varchar(50)  | YES  |     | NULL    |                |
| thumb_image | varchar(50)  | YES  |     | NULL    |                |
| description | text         | YES  |     | NULL    |                |
| created_at  | datetime     | YES  |     | NULL    |                |
| column_1    | varchar(50)  | YES  |     | NULL    |                |
| column_2    | int          | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
9 rows in set (0.00 sec)  */

-- eng boshiga 1- va 2- nomli ustunlar joylash
ALTER TABLE `news`
    ADD `birinchi` INT UNSIGNED DEFAULT 0 FIRST,
    ADD `ikkinchi` ENUM ('A', 'B') AFTER `birinchi`;

DESC `news`;
/*------------+---------------+------+-----+---------+----------------+
| Field       | Type          | Null | Key | Default | Extra          |
+-------------+---------------+------+-----+---------+----------------+
| birinchi    | int unsigned  | YES  |     | 0       |                |
| ikkinchi    | enum('A','B') | YES  |     | NULL    |                |
| id          | int           | NO   | PRI | NULL    | auto_increment |
| title       | varchar(100)  | YES  |     | NULL    |                |
| category_id | int           | YES  |     | NULL    |                |
| thumb_img   | varchar(50)   | YES  |     | NULL    |                |
| thumb_image | varchar(50)   | YES  |     | NULL    |                |
| description | text          | YES  |     | NULL    |                |
| created_at  | datetime      | YES  |     | NULL    |                |
| column_1    | varchar(50)   | YES  |     | NULL    |                |
| column_2    | int           | YES  |     | NULL    |                |
+-------------+---------------+------+-----+---------+----------------+
11 rows in set (0.00 sec) */


# USTUNNI O'ZGARTIRISH
-- Qolip:
ALTER TABLE `jadval_nomi`
    MODIFY `ustun_nomi` ustun_xususiyatlari;

ALTER TABLE `news`
    MODIFY `column_1` VARCHAR(150) NOT NULL
#     AFTER `category_id` -- shu ustundan keyin o'zgartirilib joylashsin
;
/* column_1 ustuni xususiyati varchar(50) dan varchar(150) ga o'zgardi
 +-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int          | NO   | PRI | NULL    | auto_increment |
| title       | varchar(100) | YES  |     | NULL    |                |
| category_id | int          | YES  |     | NULL    |                |
| thumb_img   | varchar(50)  | YES  |     | NULL    |                |
| thumb_image | varchar(50)  | YES  |     | NULL    |                |
| description | text         | YES  |     | NULL    |                |
| created_at  | datetime     | YES  |     | NULL    |                |
| column_1    | varchar(150) | NO   |     | NULL    |                |
| column_2    | int          | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
9 rows in set (0.00 sec) */

# USTUN NOMINI O'ZGARTIRISH
-- Qolip:
ALTER TABLE `jadval_nomi`
    CHANGE COLUMN `ustun_eski_nomi` `ustun_yangi_nomi` ustun_yangi_xususiyatlari;

ALTER TABLE `news`
    CHANGE COLUMN `column_1` `col_1` VARCHAR(50);

DESC `news`;
/*  column_1 ustuni col_1 ga va varchar(150) varchar(50) ga almashdi
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int          | NO   | PRI | NULL    | auto_increment |
| title       | varchar(100) | YES  |     | NULL    |                |
| category_id | int          | YES  |     | NULL    |                |
| thumb_img   | varchar(50)  | YES  |     | NULL    |                |
| thumb_image | varchar(50)  | YES  |     | NULL    |                |
| description | text         | YES  |     | NULL    |                |
| created_at  | datetime     | YES  |     | NULL    |                |
| col_1       | varchar(50)  | YES  |     | NULL    |                |
| column_2    | int          | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
9 rows in set (0.00 sec) */

# USTUNNI O'CHIRISH
-- Qolip:
ALTER TABLE `jadval_nomi`
    DROP COLUMN `ustun_nomi`;


-- shu ustunlarni o'chirish
ALTER TABLE `news`
    DROP COLUMN `column_2`
-- shu ustunni o'chirish
#     ,DROP COLUMN `ikkinchi`  -- vergul qo'yib boshqa ustunlarni ham o'chirish mumkin
;

# JADVAL NOMINI O'ZGARTIRISH
-- 1-usul:
ALTER TABLE `jadval_nomi`
    RENAME TO `yangi_jadval_nomi`;

SHOW TABLES;
/* bazadagi jadvallar:
+----------------------------+
| Tables_in_alter_table_demo |
+----------------------------+
| news                       |
+----------------------------+
1 row in set (0.01 sec) */

-- news jadvali nomini yangiliklar ga o'zgartirish
ALTER TABLE `news`
    RENAME TO `yangiliklar`;

/* bazadagi jadvallar
+----------------------------+
| Tables_in_alter_table_demo |
+----------------------------+
| yangiliklar                |
+----------------------------+
1 row in set (0.00 sec) */

-- 2-usulda jadval nomini o'zgartirish:
RENAME TABLE `jadval_nomi`
    TO `yangi_jadval_nomi`;

RENAME TABLE `yangiliklar`
    TO `news`;

SHOW TABLES;
/* avvalgi nom bilan 2-usulda nomlandi:
+----------------------------+
| Tables_in_alter_table_demo |
+----------------------------+
| news                       |
+----------------------------+
1 row in set (0.00 sec) */