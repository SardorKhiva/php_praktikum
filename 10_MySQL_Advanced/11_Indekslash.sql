SHOW DATABASES;
USE `dars_demo`;
SELECT COUNT(*)
FROM `employees`;
/*
+----------+
| COUNT(*) |
+----------+
|   300024 |
+----------+
1 row in set (0.03 sec)
*/

SELECT *
FROM `employees`
WHERE `first_name` = 'Aamer'
LIMIT 50;
# 50 rows in set (0.03 sec)

EXPLAIN
SELECT *
FROM `employees`
WHERE `first_name` = 'Aamer'
LIMIT 50;
/*
+----+-------------+-----------+------------+------+---------------+------+---------+------+--------+----------+-------------+
| id | select_type | table     | partitions | type | possible_keys | key  | key_len | ref  | rows   | filtered | Extra       |
+----+-------------+-----------+------------+------+---------------+------+---------+------+--------+----------+-------------+
|  1 | SIMPLE      | employees | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 296987 |    10.00 | Using where |
+----+-------------+-----------+------------+------+---------------+------+---------+------+--------+----------+-------------+
1 row in set, 1 warning (0.01 sec)  */

# 1-usulda index qo'yish:
CREATE TABLE t
(
    `c1` INT PRIMARY KEY,
    `c2` INT NOT NULL,
    `c3` INT NOT NULL,
    `c4` VARCHAR(10),
    INDEX (`c2`, `c3`)
);

# 2-usul:
CREATE INDEX `index_name` ON `table_name` (`column_list`);
# misol:
CREATE INDEX idx_c4 ON t(c4);

CREATE INDEX `employees_first_name_index`
ON employees (`first_name`);

SELECT *
FROM `employees`
WHERE `first_name` = 'Aamer'
LIMIT 50;
# 50 rows in set (0.05 sec)

EXPLAIN
SELECT *
FROM `employees`
WHERE `first_name` = 'Aamer'
LIMIT 50;
/* 228 ta qator bilan tekshirib solishtirib chiqdi:
+----+-------------+-----------+------------+------+----------------------------+----------------------------+---------+-------+------+----------+-------+
| id | select_type | table     | partitions | type | possible_keys              | key                        | key_len | ref   | rows | filtered | Extra |
+----+-------------+-----------+------------+------+----------------------------+----------------------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | employees | NULL       | ref  | employees_first_name_index | employees_first_name_index | 16      | const |  228 |   100.00 | NULL  |
+----+-------------+-----------+------------+------+----------------------------+----------------------------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)
*/


#                             JADVALDAGI INDEXD LAR RO'YHATINI OLISH:
SHOW INDEXES
FROM `employees`;
/*
+-----------+------------+----------------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table     | Non_unique | Key_name                   | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-----------+------------+----------------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| employees |          0 | PRIMARY                    |            1 | emp_no      | A         |      296987 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| employees |          1 | employees_first_name_index |            1 | first_name  | A         |        1282 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+-----------+------------+----------------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0.00 sec)    */

#                             JADVALDAGI INDEXNI O'CHIRISH:
DROP INDEX `index_name`
ON `table_name`;

#                                 gender  ustuniga index berish:
SELECT *
FROM `employees`
WHERE `first_name` = 'Aamer'
  AND `gender` = 'F'
LIMIT 50;
# 50 rows in set (0.08 sec)

CREATE INDEX `employees_gender_index`
ON `employees`(`gender`);
/* Query OK, 0 rows affected (2.30 sec)
Records: 0  Duplicates: 0  Warnings: 0   */

SELECT *
FROM `employees`
WHERE `first_name` = 'Aamer'
  AND `gender` = 'F'
LIMIT 50;
# 50 rows in set (0.01 sec)

/*        Indexlashning yaxshi va yomon tomonlari:
    yaxshi tomonlari:
1) qidirish  tezlashadi
2) filtrlash tezlashadi

   yomon tomonlari:
1) INSERT sekinlashadi
2) UPDATE sekinlashadi
3) xotiradan yana shu jadval hajmiga teng joy ajratiladi
*/

/*                Tavsiyalar:
- Indexlarni oldindan hosil qilish shart emas
- Foydalanmaydigan indexlarni olib tashlang
- Kichik (bir necha ming) qatorli jadvallarda indexlardan foydalanmang
- Sekin so'rovlardan boshlang - ular uchun noyob indexlarni yarating
- Indexlarni qo'yishdan oldin local bazada qo'yib  tekshirib (EXPLAIN bilan) ko'ring
*/

