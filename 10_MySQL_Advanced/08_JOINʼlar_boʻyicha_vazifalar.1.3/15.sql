/* 15-masala:
2004-yilda eng ko`p summali to`lov
amalga oshirgan 10 ta customerning ,
ismi familyasi, necha $ to`laganligini aniqlang */
USE `mashq`;
SELECT `c`.`contactFirstName` AS 'mijoz_ismi',
       `c`.`contactLastName`  AS 'mijoz_familyasi',
        SUM(`p`.`amount`)     AS 'summa'
FROM `customers` `c`
JOIN `payments`  `p`
  ON `c`.`customerNumber` = `p`.`customerNumber`
GROUP BY `c`.`contactFirstName`, `c`.`contactLastName`
ORDER BY `summa` DESC
LIMIT 10;
/*-----------+-----------------+-----------+
| mijoz_ismi | mijoz_familyasi | summa     |
+------------+-----------------+-----------+
| Diego      | Freyre          | 715738.98 |
| Susan      | Nelson          | 584188.24 |
| Peter      | Ferguson        | 180585.07 |
| Jeff       | Young           | 177913.95 |
| Eric       | Natividad       | 156251.03 |
| Mike       | Graham          | 154622.08 |
| Rachel     | Ashworth        | 148410.09 |
| Anna       | O'Hara          | 137034.22 |
| Julie      | Brown           | 132340.78 |
| Mary       | Saveley         | 130305.35 |
+------------+-----------------+----------*/