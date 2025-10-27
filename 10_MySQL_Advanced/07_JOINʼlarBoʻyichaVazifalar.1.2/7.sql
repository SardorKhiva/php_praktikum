/* 7-masala:
"TOP 10 PRODUCTS" masalasi
Eng ko`p buyurtma qilingan 10 ta maxsulotning,
productCode, nomi va
nechta buyurtma qilinganligi sonini chiqaring */
/*------------+-----------------------------------------+------+
| productCode | productName                             | soni |
+-------------+-----------------------------------------+------+
| S18_3232    | 1992 Ferrari 360 Spider red             | 1808 |
| S18_1342    | 1937 Lincoln Berline                    | 1111 |
| S700_4002   | American Airlines: MD-11S               | 1085 |
| S18_3856    | 1941 Chevrolet Special Deluxe Cabriolet | 1076 |
| S50_1341    | 1930 Buick Marquette Phaeton            | 1074 |
| S18_4600    | 1940s Ford truck                        | 1061 |
| S10_1678    | 1969 Harley Davidson Ultimate Chopper   | 1057 |
| S12_4473    | 1957 Chevy Pickup                       | 1056 |
| S18_2319    | 1964 Mercedes Tour Bus                  | 1053 |
| S24_3856    | 1956 Porsche 356A Coupe                 | 1052 |
+-------------+-----------------------------------------+------+
*/

use mashq;
SELECT `p`.`productCode` 'mahsulot_kodi',
       `p`.`productName` 'mahsulot_nomi',
       SUM(`od`.`quantityOrdered`) 'buyurtma_soni'
FROM `products`     `p`
JOIN `orderdetails` `od`
    ON `p`.`productCode` = `od`.`productCode`
GROUP BY `p`.`productCode`, `p`.`productName`
# GROUP BY `od`.`quantityOrdered`
ORDER BY `buyurtma_soni` DESC
LIMIT 10;
/*
+---------------+-----------------------------------------+---------------+
| mahsulot_kodi | mahsulot_nomi                           | buyurtma_soni |
+---------------+-----------------------------------------+---------------+
| S18_3232      | 1992 Ferrari 360 Spider red             |          1808 |
| S18_1342      | 1937 Lincoln Berline                    |          1111 |
| S700_4002     | American Airlines: MD-11S               |          1085 |
| S18_3856      | 1941 Chevrolet Special Deluxe Cabriolet |          1076 |
| S50_1341      | 1930 Buick Marquette Phaeton            |          1074 |
| S18_4600      | 1940s Ford truck                        |          1061 |
| S10_1678      | 1969 Harley Davidson Ultimate Chopper   |          1057 |
| S12_4473      | 1957 Chevy Pickup                       |          1056 |
| S18_2319      | 1964 Mercedes Tour Bus                  |          1053 |
| S24_3856      | 1956 Porsche 356A Coupe                 |          1052 |
+---------------+-----------------------------------------+--------------*/
