/* "orderdetails" jadvalidan:
7) eng ko'p sotilgan 10 ta produktni "productCode"
va nechta sotilganini sonini aniqlang   */
USE `mashq`;

SELECT `productCode`   AS 'mahsulot kodi',
SUM(`quantityOrdered`) AS 'nechta sotildi'
FROM `orderdetails`
GROUP BY `productCode`
ORDER BY `nechta sotildi` DESC
LIMIT 10;
/* natija:
+---------------+----------------+
| mahsulot kodi | nechta sotildi |
+---------------+----------------+
| S18_3232      |           1808 |
| S18_1342      |           1111 |
| S700_4002     |           1085 |
| S18_3856      |           1076 |
| S50_1341      |           1074 |
| S18_4600      |           1061 |
| S10_1678      |           1057 |
| S12_4473      |           1056 |
| S18_2319      |           1053 |
| S24_3856      |           1052 |
+---------------+----------------+
10 rows in set (0.01 sec)    */
/*  orderNumber      -- buyurtma, hujjat id
    productCode      -- mahsulot kodi
    quantityOrdered  -- nechta donaligi
    priceEach        -- 1 dona mahsulot narhi
    orderLineNumber  -- hujjatdagi mahsulot tartib raqami   */