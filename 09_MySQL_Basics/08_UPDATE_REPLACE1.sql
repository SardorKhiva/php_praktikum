# Yangilash uchun umumiy shablon:
UPDATE `jadval`
SET `ustun_1` = `qiymat_1`,
    `ustun_2` = `qiymat_2`
WHERE shartlar;     -- SHARTLAR YOZILMASA BARCHA SATRLARGA YOZADI


UPDATE `qizlar`                         -- yangilansin qizlar jadvalidagi (1)
SET `telefon_nomer` = '998909999999'    -- telefon_nomer ustunidagi shu raqamga (3)
WHERE `ism` = 'Sharapat'                -- qaysiki ism     ustuni qiymati Sharapat (2)
AND `familya` = 'Eshmatova';            -- va      familya ustuni qiymati Eshmatova bo'lsa

USE `Mashq`;
SELECT * FROM `employees`
WHERE `emp_no` = 10001
AND `first_name` = 'Georgi';
-- natija:
# +--------+------------+------------+-----------+--------+------------+
# | emp_no | birth_date | first_name | last_name | gender | hire_date  |
# +--------+------------+------------+-----------+--------+------------+
# |  10001 | 1953-09-02 | Georgi     | Facello   | M      | 1986-06-26 |
# +--------+------------+------------+-----------+--------+------------+
# 1 row in set (0.00 sec)

UPDATE `employees`
SET `first_name` = 'Eshmat'
WHERE `emp_no` = 10001
AND `first_name` = 'Georgi';

SELECT *
FROM `employees`
WHERE `emp_no` = 10001;
-- natija:
# +--------+------------+------------+-----------+--------+------------+
# | emp_no | birth_date | first_name | last_name | gender | hire_date  |
# +--------+------------+------------+-----------+--------+------------+
# |  10001 | 1953-09-02 | Eshmat     | Facello   | M      | 1986-06-26 |
# +--------+------------+------------+-----------+--------+------------+
# 1 row in set (0.00 sec)

UPDATE `employees`
SET `first_name` = 'Eshmat',
    `last_name` = 'Toshmatov'
WHERE `emp_no` = 10001;
# Query OK, 1 row affected (0.01 sec)
# Rows matched: 1  Changed: 1  Warnings: 0

-- natijada:
# +--------+------------+------------+-----------+--------+------------+
# | emp_no | birth_date | first_name | last_name | gender | hire_date  |
# +--------+------------+------------+-----------+--------+------------+
# |  10001 | 1953-09-02 | Eshmat     | Toshmatov | M      | 1986-06-26 |
# +--------+------------+------------+-----------+--------+------------+
# 1 row in set (0.00 sec)

SELECT *
FROM `salaries` LIMIT 2; -- natija:
# +--------+--------+------------+------------+
# | emp_no | salary | from_date  | to_date    |
# +--------+--------+------------+------------+
# |  10001 |  60117 | 1986-06-26 | 1987-06-26 |
# |  10001 |  62102 | 1987-06-26 | 1988-06-25 |
# +--------+--------+------------+------------+
# 2 rows in set (0.00 sec)

UPDATE `salaries`
SET `salary` = `salary` + 500
WHERE `emp_no` = 10001
AND `from_date` = "1986-06-26";
# Query OK, 1 row affected (0.01 sec)
# Rows matched: 1  Changed: 1  Warnings: 0

SELECT *
FROM `salaries` LIMIT 2; -- natija:
# +--------+--------+------------+------------+
# | emp_no | salary | from_date  | to_date    |
# +--------+--------+------------+------------+
# |  10001 |  60617 | 1986-06-26 | 1987-06-26 |
# |  10001 |  62102 | 1987-06-26 | 1988-06-25 |
# +--------+--------+------------+------------+
# 2 rows in set (0.00 sec)

REPLACE INTO `departments` (`id`, `name`)
VALUES (2, 'Sales');
#   Yuqoridagi so'rovda departments jadvaliga:
# agar id = 2 bo'lgan qator yo'q bo'lsa, yangi ma'lumot sifatida qo'shadi,
# agar id = 2 bo'lgan qator bor bo'lsa, aynan shu id = 2 qatorli `name` ustunidagi yozuv ustiga 'Sales' ni yozadi