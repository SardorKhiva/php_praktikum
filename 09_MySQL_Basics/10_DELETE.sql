#   Jadvaldan ma'lumotlarni o'chirish

SHOW DATABASES;     /*
+--------------------+
| Database           |
+--------------------+
| dars_demo          |
| information_schema |
| mashq              |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.00 sec)    */

USE `mashq`;
DESC `departments`; /*
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| dept_no         | char(4)     | NO   | PRI | NULL    |       |
| dept_name       | varchar(40) | NO   | UNI | NULL    |       |
| yangi_ustun_1   | varchar(20) | YES  |     | NULL    |       |
| yangi__ustun__2 | varchar(40) | YES  |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)    */

INSERT INTO `departments`
     VALUES("dept", "dept _ no", "yangi yozuv", "yangi yozuv 2");
# Query OK, 1 row affected (0.01 sec)

SELECT * FROM `departments`;    /* natija:
+---------+-----------+---------------+-----------------+
| dept_no | dept_name | yangi_ustun_1 | yangi__ustun__2 |
+---------+-----------+---------------+-----------------+
| dept    | dept _ no | yangi yozuv   | yangi yozuv 2   |
+---------+-----------+---------------+-----------------+
1 row in set (0.00 sec) */

#       Jadvaldan ma'lumotlarni o'chirish
DELETE FROM `departments`   -- o'chirsin `departments` jadvalidan
WHERE `dept_no` = "dept";   -- qaysiki `dept_no` ustunidagi qiymat "dept" bo'lgan qatorni

SELECT * FROM `departments`;    -- 29-qatorda kiritilgan ma'lumotlar o'chirildi

#      Limit orqali o'chirish
DESC `departments`;

DELETE FROM `departments`           -- o'chirilsin departments jadvalidan
ORDER BY `yangi_ustun_1` LIMIT 5;   -- yangi-ustun_1 ustunini saralab boshidan 5 ta qatorni


#     Jadvalni to'liq o'chirish
# DELETE FROM `departments`;    -- agar shartsiz yozilsa butun boshli jadval o'chadi

