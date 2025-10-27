/*
ALTER TABLE - jadvalga yangi ustun qo'shish,
              ustun turini yoki nomini o'zgartirish,
              jadval nomini o'zgartirish yoki ustunni o'chirish uchun ishlatiladi.
*/

/*                  Jadvalga yangi ustun qo'shish:
ALTER TABLE `jadval` ADD `ustun_nomi` USTUN_TURI;
 */

DESC `mashq`.`departments`;
/*  jadval tuzilishi (ma'lumotlari emas):
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_no   | char(4)     | NO   | PRI | NULL    |       |
| dept_name | varchar(40) | NO   | UNI | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.01 sec)     */

SELECT *
FROM `mashq`.`departments`;
/*
+---------+--------------------+
| dept_no | dept_name          |
+---------+--------------------+
| d009    | Customer Service   |
| d005    | Development        |
| d002    | Finance            |
| d003    | Human Resources    |
| d001    | Marketing          |
| d004    | Production         |
| d006    | Quality Management |
| d008    | Research           |
| d007    | Sales              |
+---------+--------------------+
9 rows in set (0.02 sec)    */

#               Jadvalga yangi ustun qo'shish
ALTER TABLE `mashq`.`departments`
    ADD `yangi_ustun` VARCHAR(50) DEFAULT NULL;
/*  Query OK, 0 rows affected (0.05 sec)
 Records: 0  Duplicates: 0  Warnings: 0     */

SELECT * FROM `mashq`.`departments`;
/* qo'shilgan `yangi_ustun`
+---------+--------------------+-------------+
| dept_no | dept_name          | yangi_ustun |
+---------+--------------------+-------------+
| d001    | Marketing          | NULL        |
| d002    | Finance            | NULL        |
| d003    | Human Resources    | NULL        |
| d004    | Production         | NULL        |
| d005    | Development        | NULL        |
| d006    | Quality Management | NULL        |
| d007    | Sales              | NULL        |
| d008    | Research           | NULL        |
| d009    | Customer Service   | NULL        |
+---------+--------------------+-------------+
9 rows in set (0.00 sec)     */
DESC `mashq`.`departments`;
/*  jadval strukturasi:
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| dept_no     | char(4)     | NO   | PRI | NULL    |       |
| dept_name   | varchar(40) | NO   | UNI | NULL    |       |
| yangi_ustun | varchar(50) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)    */

#           Jadvaldan biror ustunni o'chirish
ALTER TABLE `mashq`.`departments`
      DROP COLUMN `yangi_ustun`;    /*
Query OK, 0 rows affected (0.15 sec)
Records: 0  Duplicates: 0  Warnings: 0      */

DESC `mashq`.`departments`;     /* natija:
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_no   | char(4)     | NO   | PRI | NULL    |       |
| dept_name | varchar(40) | NO   | UNI | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.09 sec)    */

#           Jadvalga bir nechta ustun qo'shish
ALTER TABLE `mashq`.`departments`
     ADD `yangi_ustun_1`  VARCHAR(50) DEFAULT NULL,
     ADD `yangi_ustun_2` VARCHAR(40) DEFAULT 0; /*
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0  */

#           Jadvaldagi ustun turini o'zgartirish
ALTER TABLE `mashq`.`departments`
MODIFY `yangi_ustun_1` VARCHAR(20); -- oldingisi 50 edi, hozir 20

DESC `mashq`.`departments`;     /* jadval strukturasi
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| dept_no       | char(4)     | NO   | PRI | NULL    |       |
| dept_name     | varchar(40) | NO   | UNI | NULL    |       |
| yangi_ustun_1 | varchar(20) | YES  |     | NULL    |       |
| yangi_ustun_2 | varchar(40) | YES  |     | 0       |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)        */

#           Jadvaldagi ustun nomini o'zgartirish
ALTER TABLE `mashq`.`departments` -- mashq bazasi departments jadvalidagi
CHANGE `yangi_ustun_2`      -- yangi_ustun_2 ustunini
    `yangi__ustun__2` VARCHAR(40);  -- yangi__ustun__2 deb tipi va tip hajmini o'zgartirmasdan yoziladi
DESC `mashq`.`departments`; /* jadval strukturasi
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| dept_no         | char(4)     | NO   | PRI | NULL    |       |
| dept_name       | varchar(40) | NO   | UNI | NULL    |       |
| yangi_ustun_1   | varchar(20) | YES  |     | NULL    |       |
| yangi__ustun__2 | varchar(40) | YES  |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)    */

#           Jadval nomini o'zgartirish
#     1 - usul:
ALTER TABLE `mashq`.`departments`   -- mashq bazasi, departments jadvalini
RENAME `deps`;                      -- deps ga qayta nomlash

SHOW TABLES; /* natija:
+------------------+
| Tables_in_mashq  |
+------------------+
| current_dept_emp |
| customers        |
| deps             |    <-- oldin departments edi
| employees        |
| offices          |
| orderdetails     |
| orders           |
| payments         |
| productlines     |
| products         |
+------------------+
10 rows in set (0.00 sec)   */

#     2 - usul:
RENAME TABLE `deps` -- deps jadvalini qayta nomla
TO `departments`;   -- departments ga

SHOW TABLES;    /*  natija:
+------------------+
| Tables_in_mashq  |
+------------------+
| current_dept_emp |
| customers        |
| departments      |    <-- oldin deps edi
| employees        |
| offices          |
| orderdetails     |
| orders           |
| payments         |
| productlines     |
| products         |
+------------------+
10 rows in set (0.00 sec)   */