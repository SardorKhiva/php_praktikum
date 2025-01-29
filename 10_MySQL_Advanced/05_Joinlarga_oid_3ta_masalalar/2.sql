/*  2- masala. "TOP 10 PRODUCTS" masalasi
Eng ko`p buyurtma qilingan 10 ta maxsulotning,
productCode, nomi va nechta buyurtma qilinganligi sonini chiqaring   */
# `product` va `orderdetails` jadvallaridan
USE `mashq`;
SELECT `p`.`productCode`          AS 'mahsulot kodi',           -- products jadvalidan mahsultolar kodlarini olsin
       `p`.`productName`          AS 'mahsulot nomi',           -- products jadvalidan mahsultolar nomlarini olsin
       SUM(`o`.`quantityOrdered`) AS 'buyurtmalar soni'         -- `orderdetails` jadvalidan buyurtmalar sonini olsin
FROM `products` `p`                                             -- pdoucts ni alias berib p deb nomlaymiz
    LEFT JOIN `orderdetails` `o`                                -- products ga orderdaetails ni left join qilamiz va orderdetails jadvali nomini o deb turamiz
           ON `p`.`productCode` = `o`.`productCode`    -- qaysiki p dagi productCode va o dagi productCode lari teng bo'lganlari left join bo'lsin
GROUP BY `p`.`productCode`                                      -- mahsulotlar kodlari guruhlansin
ORDER BY `buyurtmalar soni` DESC                                -- buyurtmalar sonini kamayish tartibida
LIMIT 10;                                                       -- 10 ta chiqaramiz
/*--------------+-----------------------------------------+------------------+
| mahsulot kodi | mahsulot nomi                           | buyurtmalar soni |
+---------------+-----------------------------------------+------------------+
| S18_3232      | 1992 Ferrari 360 Spider red             |             1808 |
| S18_1342      | 1937 Lincoln Berline                    |             1111 |
| S700_4002     | American Airlines: MD-11S               |             1085 |
| S18_3856      | 1941 Chevrolet Special Deluxe Cabriolet |             1076 |
| S50_1341      | 1930 Buick Marquette Phaeton            |             1074 |
| S18_4600      | 1940s Ford truck                        |             1061 |
| S10_1678      | 1969 Harley Davidson Ultimate Chopper   |             1057 |
| S12_4473      | 1957 Chevy Pickup                       |             1056 |
| S18_2319      | 1964 Mercedes Tour Bus                  |             1053 |
| S24_3856      | 1956 Porsche 356A Coupe                 |             1052 |
+---------------+-----------------------------------------+-----------------*/