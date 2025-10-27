/* 12-masala:
2003-yil dekabr oyida
eng ko`p summali zakazni
qilgan mijozni ismi, familyasi,
buyurtma qilgan vaqti va
buyurtma id sini chiqaring. */

USE `mashq`;

SELECT `c`.`contactFirstName`,
       `c`.`contactLastName`,
       `o`.`orderDate`,
       `o`.`orderNumber`
FROM `payments` `p`

         JOIN `customers` `c`
              ON `p`.`customerNumber` = `c`.`customerNumber`
         JOIN `orders` `o`
              ON `c`.`customerNumber` = `o`.`customerNumber`
WHERE YEAR(`p`.`paymentDate`) = 2003    -- to'lov qilingan yil 2003 bo'lsin
  AND MONTH(`p`.`paymentDate`) = 12     -- va shu yilning dekabri bo'lsin
  AND YEAR(`o`.`orderDate`) = 2003      -- va buyurtma 2003-yil
  AND MONTH(`o`.`orderDate`) = 12       -- dekabr oyida qilingan bo'lsin
ORDER BY `p`.`amount` DESC              -- eng katta to'lovlarni kamayish tartibida saralab
LIMIT 1;                                -- eng oldingisini chiqarsin
/*-----------------+-----------------+------------+-------------+
| contactFirstName | contactLastName | orderDate  | orderNumber |
+------------------+-----------------+------------+-------------+
| Diego            | Freyre          | 2003-12-02 |       10203 |
+------------------+-----------------+------------+------------*/