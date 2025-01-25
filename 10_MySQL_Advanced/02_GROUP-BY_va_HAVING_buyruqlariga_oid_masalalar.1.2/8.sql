/*  "orderdetails" jadvalidan:
8) -eng kam sotilgan 10 ta produktni jami
nechta sotilgani va jami necha summalik sotilganini aniqlang    */
USE `mashq`;

SELECT `productCode`   AS 'mahsulot kodi',
SUM(`quantityOrdered`) AS 'nechta sotildi'
FROM `orderdetails`
GROUP BY `productCode`
ORDER BY `nechta sotildi`
LIMIT 10;
/* natija:
+---------------+----------------+
| mahsulot kodi | nechta sotildi |
+---------------+----------------+
| S18_4933      |            767 |
| S24_1046      |            803 |
| S24_3969      |            824 |
| S18_2248      |            832 |
| S18_2870      |            855 |
| S18_4409      |            866 |
| S24_4048      |            867 |
| S24_3191      |            870 |
| S24_2887      |            873 |
| S18_2795      |            880 |
+---------------+----------------+
10 rows in set (0.01 sec)   */

/*  orderNumber      -- buyurtma, hujjat id
    productCode      -- mahsulot kodi
    quantityOrdered  -- nechta donaligi
    priceEach        -- 1 dona mahsulot narhi
    orderLineNumber  -- hujjatdagi mahsulot tartib raqami   */