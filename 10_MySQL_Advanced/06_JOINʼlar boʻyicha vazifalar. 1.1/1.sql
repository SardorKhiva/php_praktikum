/* "classicmodels" jadvalidan foydalaning
1-masala:
"employees" jadvalidan, hodimlarni ismi, familyasi,
office qaysi city da joylashgani,
va officeni telefon nomerini chiqaring  */
SHOW DATABASES;
USE `mashq`;
SHOW TABLES;
SELECT VERSION();

SELECT * FROM `employees` LIMIT 3;/*
+----------------+-----------+-----------+-----------+--------------------------------+------------+-----------+--------------+
| employeeNumber | lastName  | firstName | extension | email                          | officeCode | reportsTo | jobTitle     |
+----------------+-----------+-----------+-----------+--------------------------------+------------+-----------+--------------+
|           1002 | Murphy    | Diane     | x5800     | dmurphy@classicmodelcars.com   | 1          |      NULL | President    |
|           1056 | Patterson | Mary      | x4611     | mpatterso@classicmodelcars.com | 1          |      1002 | VP Sales     |
|           1076 | Firrelli  | Jeff      | x9273     | jfirrelli@classicmodelcars.com | 1          |      1002 | VP Marketing |
+----------------+-----------+-----------+-----------+--------------------------------+------------+-----------+-------------*/

SELECT * FROM `offices` LIMIT 3; /*
+------------+---------------+-----------------+----------------------+--------------+-------+---------+------------+-----------+
| officeCode | city          | phone           | addressLine1         | addressLine2 | state | country | postalCode | territory |
+------------+---------------+-----------------+----------------------+--------------+-------+---------+------------+-----------+
| 1          | San Francisco | +1 650 219 4782 | 100 Market Street    | Suite 300    | CA    | USA     | 94080      | NA        |
| 2          | Boston        | +1 215 837 0825 | 1550 Court Place     | Suite 102    | MA    | USA     | 02107      | NA        |
| 3          | NYC           | +1 212 555 3000 | 523 East 53rd Street | apt. 5A      | NY    | USA     | 10022      | NA        |
+------------+---------------+-----------------+----------------------+--------------+-------+---------+------------+----------*/
SELECT `e`.`firstName`,
       `e`.`lastName`,
       `o`.`city`,
       `o`.`phone`
FROM `employees` `e`
JOIN `offices` `o`
ON `e`.`officeCode` = `o`.`officeCode`
ORDER BY `e`.`firstName`;
/*----------+-----------+---------------+------------------+
| firstName | lastName  | city          | phone            |
+-----------+-----------+---------------+------------------+
| Andy      | Fixter    | Sydney        | +61 2 9264 2451  |
| Anthony   | Bow       | San Francisco | +1 650 219 4782  |
| Barry     | Jones     | London        | +44 20 7877 2041 |
| Diane     | Murphy    | San Francisco | +1 650 219 4782  |
| Foon Yue  | Tseng     | NYC           | +1 212 555 3000  |
| George    | Vanauf    | NYC           | +1 212 555 3000  |
| Gerard    | Bondur    | Boston        | +1 215 837 0825  |
| Gerard    | Hernandez | Paris         | +33 14 723 4404  |
| Jeff      | Firrelli  | San Francisco | +1 650 219 4782  |
| Julie     | Firrelli  | Boston        | +1 215 837 0825  |
| KERRI     | Jim       | Boston        | +1 215 837 0825  |
| Larry     | Bott      | London        | +44 20 7877 2041 |
| Leslie    | Jennings  | San Francisco | +1 650 219 4782  |
| Leslie    | Thompson  | San Francisco | +1 650 219 4782  |
| Loui      | Bondur    | Boston        | +1 215 837 0825  |
| Mami      | Nishi     | Tokyo         | +81 33 224 5000  |
| Martin    | Gerard    | Paris         | +33 14 723 4404  |
| Mary      | Patterson | San Francisco | +1 650 219 4782  |
| Pamela    | Castillo  | Paris         | +33 14 723 4404  |
| Peter     | Marsh     | Sydney        | +61 2 9264 2451  |
| Tom       | King      | Sydney        | +61 2 9264 2451  |
| William   | Patterson | Sydney        | +61 2 9264 2451  |
| Yoshimi   | Kato      | Tokyo         | +81 33 224 5000  |
+-----------+-----------+---------------+------------------+
23 rows in set (0.00 sec)  */