/* 1)"employees" jadvalida:
 - "Bondur" ismli employeelarni
 officeCode qiymatlari 2 ga o`zgartiring    */

SHOW DATABASES;
USE `Mashq`;
SHOW TABLES;
SELECT * FROM `employees`;

SELECT *
FROM `employees`
WHERE
    `firstName` = 'Bondur' or
     `lastName` = 'Bondur'
;

UPDATE `employees`
SET `officeCode` = 2
WHERE
    `lastName`  = 'Bondur';


/*
- "spatterson@classicmodelcars.com"
emailli employeeni ismini "Jim" ga,
familyasini "Kerri" ga o'zgartiring
*/
SELECT * FROM `employees` LIMIT 10;

UPDATE `employees`
SET `lastName` = "Jim",
    `firstName` = "Kerri"
WHERE
    `email` = "spatterson@classicmodelcars.com";


# - "officeCode" i 2 ga teng bo`lgan
# employeelarning, barchasi emaillarini
# "@classicmodelcars.com" dan
# "@classiccar.com" ga aylantiring

-- qidirilayotgan maydonlar
SELECT *
FROM  `Mashq`.`employees`
WHERE `officeCode` = 2;
# natija:
# +----------------+----------+-----------+-----------+------------------------------+------------+-----------+---------------------+
# | employeeNumber | lastName | firstName | extension | email                        | officeCode | reportsTo | jobTitle            |
# +----------------+----------+-----------+-----------+------------------------------+------------+-----------+---------------------+
# |           1102 | Bondur   | Gerard    | x5408     | gbondur@classicmodelcars.com | 2          |      1056 | Sale Manager (EMEA) |
# |           1188 | Firrelli | Julie     | x2173     | jfirrelli@classiccars.com    | 2          |      1143 | Sales Rep           |
# |           1216 | Jim      | KERRI     | x4334     | spatterson@classiccars.com   | 2          |      1143 | Sales Rep           |
# |           1337 | Bondur   | Loui      | x6493     | lbondur@classicmodelcars.com | 2          |      1102 | Sales Rep           |
# +----------------+----------+-----------+-----------+------------------------------+------------+-----------+---------------------+
# 4 rows in set (0.00 sec)


-- masala ishlanishi
UPDATE `employees`      -- employees jadvalini yangilash
#  shartlarga muvofiq kelgan email ustuni qatorilarni
#  @ bilan 2 qismga bo'lib 2-qismiga '@classiccar.com' konkatenatsiya qilinsin
SET `email` = CONCAT(SUBSTRING_INDEX(`email`, '@', 1), '@classiccar.com')
WHERE                   -- qaysiki
    `officeCode` = 2    -- officeCode = 2 bo'lsa
    AND `email` LIKE '%@classicmodelcars.com'  -- va email da shu jumla qatnashsa
;

# hosil qo'lgan jadval
SELECT * FROM `employees` WHERE `officeCode` = 2;
# +----------------+----------+-----------+-----------+----------------------------+------------+-----------+---------------------+
# | employeeNumber | lastName | firstName | extension | email                      | officeCode | reportsTo | jobTitle            |
# +----------------+----------+-----------+-----------+----------------------------+------------+-----------+---------------------+
# |           1102 | Bondur   | Gerard    | x5408     | gbondur@classiccar.com     | 2          |      1056 | Sale Manager (EMEA) |
# |           1188 | Firrelli | Julie     | x2173     | jfirrelli@classiccars.com  | 2          |      1143 | Sales Rep           |
# |           1216 | Jim      | KERRI     | x4334     | spatterson@classiccars.com | 2          |      1143 | Sales Rep           |
# |           1337 | Bondur   | Loui      | x6493     | lbondur@classiccar.com     | 2          |      1102 | Sales Rep           |
# +----------------+----------+-----------+-----------+----------------------------+------------+-----------+---------------------+
# 4 rows in set (0.00 sec)

/*
SUBSTRING_INDEX(string, delimiter, count)
string - ajratib olinadigan matn yoki ustun
delimiter - matnni ajratuvchi belgi(lar)
count - ajralishi kerak bo'lgan qismlar soni
    - agar musbat son (1) bo'lsa, boshidan ko'rsatilgan belgi(delimiter) gacha bo'ladi
    - agar 2 bo'lsa, 2 la qismini ham oladi
    - agar manfiy son (-1) bo'lsa, delimiter dan o'ng tarafdagi qismini oladi
    - agar -2 bo'lsa 2 la qismini ham oladi
misol:
SELECT SUBSTRING_INDEX('john.doe@example.com', '@', 1);  -- john.doe
SELECT SUBSTRING_INDEX('john.doe@example.com', '@', 2);  -- john.doe@example.com
SELECT SUBSTRING_INDEX('john.doe@example.com', '@', -1); -- example.com
SELECT SUBSTRING_INDEX('john.doe@example.com', '@', -2); -- john.doe@example.com
*/


/*
-- Mashq bazasida qanday jadvalda qanday ustun
-- nomlari borligini ko'rish
SELECT TABLE_NAME, COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Mashq'
  AND DATA_TYPE
    IN ('varchar', 'text', 'char'); */