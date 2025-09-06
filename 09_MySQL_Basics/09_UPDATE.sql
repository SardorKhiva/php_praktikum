-- UPDATE - yozuvlarni yangilash
# Qolip:
UPDATE `jadval_nomi`
SET `ustun_1` = 'qiymat_1',
    `ustun_2` = 'qiymat_2'
WHERE [shartlar];

USE `classicmodels`;
SELECT `firstname`,
       `lastname`,
       `email`
FROM `employees`
WHERE `employeeNumber` = 1056;
/* natija:
| firstname | lastname  | email                          |
| Mary      | Patterson | mpatterso@classicmodelcars.com |
 */

UPDATE `employees` -- yangilansin shu nomli jadvaldagi yozuvlar,
SET `email` = 'sardor@dushamov' -- shu ustunidagilar shu yozuvga
WHERE `employeeNumber` = 1056; -- qaysiki employeeNumber = 1056 bo'lganlari

SELECT `firstName` AS `familyasi`,
       `lastName`  AS `ismi`,
       `email`     AS `updated`
FROM `employees`
WHERE `employeeNumber` = 1056;
/* updated table:
| familyasi | ismi      | updated         |
| Mary      | Patterson | sardor@dushamov |
 */

#  1 nechta ustunni 1 vaqtda o'zgartirish
UPDATE
    `employees`
SET `lastName` = 'Sanjar',
    `email`    = 'sanjar@mail.uz'
WHERE `employeeNumber` = 1056;

SELECT `firstName`,
       `lastName`,
       `email`
FROM `employees`
WHERE `employeeNumber` = 1056;
/* updated table:
| firstName | lastName | email          |
| Mary      | Sanjar   | sanjar@mail.uz |
 */

#  REPLACE() - maydon qiymatini boshqa qiymatga almashtirish
/*Qolip:
REPLACE(str, find_string, replace_with);
str - string turidagi ma'lumot,
find_string - str ma'lumotdan o'zgartirish kerak bo'lgan bo'lak,
replace_with - qidirilgan ma'lumot bo'lagini o'rniga almashadigan yangi yozuv
 */

# masalan, email lar *.@mail.uz bilan tugagan,
# bu funksiya orqali email domenini o'zgartirsa bo'ladi

-- yangilanishdan oldin
SELECT *
FROM `employees`
WHERE `officeCode` = 6;
/* natija:                                            @classicmodelcars.com yozuvlari
+----------------+-----------+-----------+-----------+---------------------------------+------------+-----------+----------------------+
| employeeNumber | lastName  | firstName | extension | email                           | officeCode | reportsTo | jobTitle             |
+----------------+-----------+-----------+-----------+---------------------------------+------------+-----------+----------------------+
|           1088 | Patterson | William   | x4871     | wpatterson@classicmodelcars.com | 6          |      1056 | Sales Manager (APAC) |
|           1611 | Fixter    | Andy      | x101      | afixter@classicmodelcars.com    | 6          |      1088 | Sales Rep            |
|           1612 | Marsh     | Peter     | x102      | pmarsh@classicmodelcars.com     | 6          |      1088 | Sales Rep            |
|           1619 | King      | Tom       | x103      | tking@classicmodelcars.com      | 6          |      1088 | Sales Rep            |
+----------------+-----------+-----------+-----------+---------------------------------+------------+-----------+----------------------+
4 rows in set (0.00 sec)
 */

-- yangilanishdan keyin
UPDATE `employees` -- 1) yangilash employees jadvalidagi
SET `email` =  -- 2) email ustunini
    REPLACE(`email`, -- 3) shu ustundagi
            '@classicmodelcars.com', -- 4) shu yozuvlarni
            '@mail.uz')  -- 5) shu yozuvlarga
WHERE `officeCode` = 6; -- 6) qaysiki officeCode = 6 bo'lganlarini
/*                                                    @mail.uz ga almashdi
+----------------+-----------+-----------+-----------+--------------------+------------+-----------+----------------------+
| employeeNumber | lastName  | firstName | extension | email              | officeCode | reportsTo | jobTitle             |
+----------------+-----------+-----------+-----------+--------------------+------------+-----------+----------------------+
|           1088 | Patterson | William   | x4871     | wpatterson@mail.uz | 6          |      1056 | Sales Manager (APAC) |
|           1611 | Fixter    | Andy      | x101      | afixter@mail.uz    | 6          |      1088 | Sales Rep            |
|           1612 | Marsh     | Peter     | x102      | pmarsh@mail.uz     | 6          |      1088 | Sales Rep            |
|           1619 | King      | Tom       | x103      | tking@mail.uz      | 6          |      1088 | Sales Rep            |
+----------------+-----------+-----------+-----------+--------------------+------------+-----------+----------------------+
4 rows in set (0.00 sec)
 */
