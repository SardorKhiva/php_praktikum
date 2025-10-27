/* 8-masala:
Eng kam buyurtma qilingan 10 ta maxsulotning,
productCode, nomi, nechta buyurtma qilinganligi sonini va
necha summalik buyurtma qilganini chiqaring */
/*------------+-------------------------------------+------+-----------+
| productCode | productName                         | jami | summa     |
+-------------+-------------------------------------+------+-----------+
| S18_4933    | 1957 Ford Thunderbird               |  767 |  50101.57 |
| S24_1046    | 1970 Chevy Chevelle SS 454          |  803 |  53236.67 |
| S24_3969    | 1936 Mercedes Benz 500k Roadster    |  824 |  29763.39 |
| S18_2248    | 1911 Ford Town Car                  |  832 |  45306.77 |
| S18_2870    | 1999 Indy 500 Monte Carlo SS        |  855 | 100770.12 |
| S18_4409    | 1932 Alfa Romeo 8C2300 Spider Sport |  866 |  71526.22 |
| S24_4048    | 1992 Porsche Cayenne Turbo Silver   |  867 |  92973.40 |
| S24_3191    | 1969 Chevrolet Camaro Z28           |  870 |  67357.30 |
| S24_2887    | 1952 Citroen-15CV                   |  873 |  94248.67 |
| S18_2795    | 1928 Mercedes-Benz SSK              |  880 | 132275.98 |
+-------------+-------------------------------------+------+----------*/

use mashq;

SELECT `p`.`productCode` 'mahsulot_kodi',
       `p`.`productName` 'mahsulot_nomi',
       SUM(`od`.`quantityOrdered`) 'buyurtma_soni'
FROM `products`     `p`
         JOIN `orderdetails` `od`
              ON `p`.`productCode` = `od`.`productCode`
GROUP BY `p`.`productCode`, `p`.`productName`
ORDER BY `buyurtma_soni`
LIMIT 10;
/*--------------+-------------------------------------+---------------+
| mahsulot_kodi | mahsulot_nomi                       | buyurtma_soni |
+---------------+-------------------------------------+---------------+
| S18_4933      | 1957 Ford Thunderbird               |           767 |
| S24_1046      | 1970 Chevy Chevelle SS 454          |           803 |
| S24_3969      | 1936 Mercedes Benz 500k Roadster    |           824 |
| S18_2248      | 1911 Ford Town Car                  |           832 |
| S18_2870      | 1999 Indy 500 Monte Carlo SS        |           855 |
| S18_4409      | 1932 Alfa Romeo 8C2300 Spider Sport |           866 |
| S24_4048      | 1992 Porsche Cayenne Turbo Silver   |           867 |
| S24_3191      | 1969 Chevrolet Camaro Z28           |           870 |
| S24_2887      | 1952 Citroen-15CV                   |           873 |
| S18_2795      | 1928 Mercedes-Benz SSK              |           880 |
+---------------+-------------------------------------+--------------*/