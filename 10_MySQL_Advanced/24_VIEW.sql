#                 VIEW
/*
VIEW - bazada saqlanadigan sql so'rovlardan tashkil topgan
virtual jadval hisoblanadi. View jadvaldan farq qiladi.
Farq shundaki, jadvalda ma'lumotlar saqlanadi,
VIEW da esa saqlanmaydi. VIEW dagi so'rovlar
orqali boshqa jadvallardan ma'lumotlar olinadi.

Aytaylik, sizda katta so'rov bor,
ya'ni 5-6 ta jadvallardan ma'lumotlarni olib chiqadigan.
Shu so'rovni har safar yozib yurmaslik uchun biror
.txt faylga yoki .sql faylga yozib qo'yish mumkin.
Kerak bo'lganda shu faylni topib ichidagi so'rovdan
foydalanish mumkin. MySQL da VIEW lar orqali so'rovlarga
biror nom berib uni bazada saqlab qo'yishimiz mumkin.

Join lar mavzusidagi 11-masalaning so'rovini
misol tariqasida olamiz
*/

USE `classicmodels`;
SELECT `od`.`productCode`,
       `p`.`productName`,
       SUM(`od`.`quantityOrdered`) AS `jami`
FROM `orderdetails` AS `od`
         LEFT JOIN `products` `p`
                   ON `od`.`productCode` = `p`.`productCode`
         LEFT JOIN `orders` `o`
                   ON `od`.`orderNumber` = `o`.`orderNumber`
WHERE YEAR(`o`.`orderDate`) = 2003
  AND MONTH(`o`.`orderDate`) = 11
GROUP BY `productCode`
HAVING `jami` > 130;

/*
 Ushbu so'rov bizga 3 ta jadvaldan kerakli
 ma'lumotlarni olib chiqadi.
 */

#           VIEW qolipi:
CREATE OR REPLACE VIEW
    `contacts` AS
    SELECT
        `firstName`,
        `lastName`,
        `extension`,
        `email`
FROM `employees`;

# `contacts` VIEW ni chiqarish
SELECT *
FROM `contacts`;

# Ushbu so'rov asosida VIEW hosil qilamiz
CREATE OR REPLACE VIEW `orderDetails2003`
AS
    SELECT
        `od`.`productCode`,
        `p`.`productName`,
        SUM(`od`.`quantityOrdered`) AS `jami`
FROM `orderdetails` AS `od`
LEFT JOIN `products` `p`
ON `od`.`productCode` = `p`.`productCode`
LEFT JOIN `orders` `o`
ON `od`.`orderNumber` = `o`.`orderNumber`
WHERE
    YEAR (`o`.`orderDate`) = 2003
AND MONTH(`o`.`orderDate`) = 11
GROUP BY `productCode`
    HAVING `jami` > 130;

# VIEW ga `orderDetails2003` deb nom berdik.
# Endi shu VIEW dan foydalanamiz:

SELECT *
FROM `orderDetails2003`;
/*------------+--------------------------------+------+
| productCode | productName                    | jami |
+-------------+--------------------------------+------+
| S18_3232    | 1992 Ferrari 360 Spider red    |  217 |
| S18_3685    | 1948 Porsche Type 356 Roadster |  132 |
| S12_3891    | 1969 Ford Falcon               |  131 |
| S18_4522    | 1904 Buick Runabout            |  132 |
+-------------+--------------------------------+-----*/

# Yoki
SELECT *
FROM `orderDetails2003`
WHERE `productCode` = 'S18_3232';
/*------------+-----------------------------+------+
| productCode | productName                 | jami |
+-------------+-----------------------------+------+
| S18_3232    | 1992 Ferrari 360 Spider red |  217 |
+-------------+-----------------------------+-----*/

SHOW FULL TABLES;   -- barcha table va view larni ko'rish

SHOW CREATE VIEW `orderDetails2003`;    -- view haqidan ma'lumot
/*
PHP Strom chiqargani:
 | View | Create View | character\_set\_client | collation\_connection |
| :--- | :--- | :--- | :--- |
| orderdetails2003 | CREATE ALGORITHM=UNDEFINED DEFINER=\`root\`@\`%\` SQL SECURITY DEFINER VIEW \`orderdetails2003\` AS select \`od\`.\`productCode\` AS \`productCode\`,\`p\`.\`productName\` AS \`productName\`,sum\(\`od\`.\`quantityOrdered\`\) AS \`jami\` from \(\(\`orderdetails\` \`od\` left join \`products\` \`p\` on\(\(\`od\`.\`productCode\` = \`p\`.\`productCode\`\)\)\) left join \`orders\` \`o\` on\(\(\`od\`.\`orderNumber\` = \`o\`.\`orderNumber\`\)\)\) where \(\(year\(\`o\`.\`orderDate\`\) = 2003\) and \(month\(\`o\`.\`orderDate\`\) = 11\)\) group by \`od\`.\`productCode\` having \(\`jami\` &gt; 130\) | utf8mb4 | utf8mb4\_0900\_ai\_ci |


console chiqargani:
  orderdetails2003 | CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `orderdetails2003` AS select `od`.`productCode` AS `productCode`,`p`.`productName` AS `productName`,sum(`od`.`quantityOrdered`) AS `jami` from ((`orderdetails` `od` left join `products` `p` on((`od`.`productCode` = `p`.`productCode`))) left join `orders` `o` on((`od`.`orderNumber` = `o`.`orderNumber`))) where ((year(`o`.`orderDate`) = 2003) and (month(`o`.`orderDate`) = 11)) group by `od`.`productCode` having (`jami` > 130) | utf8mb4              | utf8mb4_0900_ai_ci   |
 */


#             VIEW ni o'chirish
DROP VIEW IF EXISTS `contacts`;

