/* 1-masala - "employees" jadvalidan,
hodimlarni ismi, familyasi,
office qaysi city da joylashgani,
va officeni telefon nomerini chiqaring */

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
+-------------------*/
USE `mashq`;
SHOW TABLES; /*
+------------------+
| Tables_in_mashq  |
+------------------+
| course           |
| current_dept_emp |
| customers        |
| departments      |
| employees        |
| offices          |
| orderdetails     |
| orders           |
| payments         |
| productlines     |
| products         |
| student          |
+-----------------*/

SELECT * FROM `employees` LIMIT 3; /*
+----------------+-----------+-----------+-----------+--------------------------------+------------+-----------+--------------+
| employeeNumber | lastName  | firstName | extension | email                          | officeCode | reportsTo | jobTitle     |
+----------------+-----------+-----------+-----------+--------------------------------+------------+-----------+--------------+
|           1002 | Murphy    | Diane     | x5800     | dmurphy@classicmodelcars.com   | 1          |      NULL | President    |
|           1056 | Patterson | Mary      | x4611     | mpatterso@classicmodelcars.com | 1          |      1002 | VP Sales     |
|           1076 | Firrelli  | Jeff      | x9273     | jfirrelli@classicmodelcars.com | 1          |      1002 | VP Marketing |
+----------------+-----------+-----------+-----------+--------------------------------+------------+-----------+--------------+
#                    2            1                                                        3
# 1-ustunda - ismi,
# 2-ustunda - familyasi,
# 3-ustunda (foreign key) ofis joylashgan shahar
# va keyin shu ofislar telefon nomerlari kerak */


SELECT * FROM `offices` LIMIT 3; /*
+------------+---------------+-----------------+----------------------+--------------+-------+---------+------------+-----------+
| officeCode | city          | phone           | addressLine1         | addressLine2 | state | country | postalCode | territory |
+------------+---------------+-----------------+----------------------+--------------+-------+---------+------------+-----------+
| 1          | San Francisco | +1 650 219 4782 | 100 Market Street    | Suite 300    | CA    | USA     | 94080      | NA        |
| 2          | Boston        | +1 215 837 0825 | 1550 Court Place     | Suite 102    | MA    | USA     | 02107      | NA        |
| 3          | NYC           | +1 212 555 3000 | 523 East 53rd Street | apt. 5A      | NY    | USA     | 10022      | NA        |
+------------+---------------+-----------------+----------------------+--------------+-------+---------+------------+----------*/

SHOW CREATE TABLE `employees`; /* shu komanda orqali mavjud jadval strukturasini qanday tuziulganini bilsa bo'ladi:
 employees | CREATE TABLE `employees` (
  `employeeNumber` int NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeNumber`),
  KEY `reportsTo` (`reportsTo`),
  KEY `officeCode` (`officeCode`),
  CONSTRAINT `employees_ibfk_1`
    FOREIGN KEY (`reportsTo`) REFERENCES `employees` (`employeeNumber`),
  CONSTRAINT `employees_ibfk_2`
    FOREIGN KEY (`officeCode`) REFERENCES `offices` (`officeCode`)  <--- `officeCode` `offices` dagi `officeCode` ustuniga link ko'rsatyabdi
) ENGINE=InnoDB DEFAULT CHARSET=latin1
*/

#                 NATIJA:
SELECT `e`.`firstName`   AS 'ismi',
       `e`.`lastName`    AS 'familyasi',
       `offices`.`city`  AS 'ofis joylashgan shahar',
       `offices`.`phone` AS 'ofis telefoni'
FROM `employees` AS `e`
         LEFT JOIN `offices`
                   ON e.officeCode = offices.officeCode;
/* natija:
+----------+-----------+------------------------+------------------+
| ismi     | familyasi | ofis joylashgan shahar | ofis telefoni    |
+----------+-----------+------------------------+------------------+
| Diane    | Murphy    | San Francisco          | +1 650 219 4782  |
| Mary     | Patterson | San Francisco          | +1 650 219 4782  |
| Jeff     | Firrelli  | San Francisco          | +1 650 219 4782  |
| William  | Patterson | Sydney                 | +61 2 9264 2451  |
| Gerard   | Bondur    | Boston                 | +1 215 837 0825  |
| Anthony  | Bow       | San Francisco          | +1 650 219 4782  |
| Leslie   | Jennings  | San Francisco          | +1 650 219 4782  |
| Leslie   | Thompson  | San Francisco          | +1 650 219 4782  |
| Julie    | Firrelli  | Boston                 | +1 215 837 0825  |
| KERRI    | Jim       | Boston                 | +1 215 837 0825  |
| Foon Yue | Tseng     | NYC                    | +1 212 555 3000  |
| George   | Vanauf    | NYC                    | +1 212 555 3000  |
| Loui     | Bondur    | Boston                 | +1 215 837 0825  |
| Gerard   | Hernandez | Paris                  | +33 14 723 4404  |
| Pamela   | Castillo  | Paris                  | +33 14 723 4404  |
| Larry    | Bott      | London                 | +44 20 7877 2041 |
| Barry    | Jones     | London                 | +44 20 7877 2041 |
| Andy     | Fixter    | Sydney                 | +61 2 9264 2451  |
| Peter    | Marsh     | Sydney                 | +61 2 9264 2451  |
| Tom      | King      | Sydney                 | +61 2 9264 2451  |
| Mami     | Nishi     | Tokyo                  | +81 33 224 5000  |
| Yoshimi  | Kato      | Tokyo                  | +81 33 224 5000  |
| Martin   | Gerard    | Paris                  | +33 14 723 4404  |
+----------+-----------+------------------------+-----------------*/