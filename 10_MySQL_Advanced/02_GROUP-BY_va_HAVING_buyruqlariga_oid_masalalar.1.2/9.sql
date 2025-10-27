/* "orderdetails" jadvalidan:
9) 1000 dan oshiq zakaz qilingan
produktlarni codini chiqaring
va nechta zakaz qilingan sonini chiqaring   */
USE `mashq`;
SELECT *
FROM `orderdetails`
# LIMIT 10
;

SELECT                                              -- tanlaymiz
       `productCode` AS 'mahsulot kodi',            -- mahsulot kodini
       SUM(quantityOrdered) AS 'buyurtmalar soni'   -- va buyurtmalar sonlari yig'indilarini
FROM `orderdetails`                                 -- orderdetails jadvalidagi
GROUP BY `productCode`                              -- bir xil mahsulot kodlarini guruhlaymiz
HAVING SUM(`quantityOrdered`) > 1000                -- va sotilish soni 1000 dan oshgan mahsulotlarni filtrlab
ORDER BY `buyurtmalar soni` DESC;                   -- buyurtmalar sonlarini kamayish ko'rinishida tartiblaymiz
/* natija:
+---------------+------------------+
| mahsulot kodi | buyurtmalar soni |
+---------------+------------------+
| S18_3232      |             1808 |
| S18_1342      |             1111 |
| S700_4002     |             1085 |
| S18_3856      |             1076 |
| S50_1341      |             1074 |
| S18_4600      |             1061 |
| S10_1678      |             1057 |
| S12_4473      |             1056 |
| S18_2319      |             1053 |
| S24_3856      |             1052 |
| S24_3949      |             1051 |
| S700_3167     |             1047 |
| S18_1662      |             1040 |
| S18_2949      |             1038 |
| S24_1578      |             1033 |
| S10_4757      |             1030 |
| S24_2300      |             1029 |
| S12_2823      |             1028 |
| S700_2610     |             1020 |
| S12_1108      |             1019 |
| S24_2000      |             1015 |
| S32_1374      |             1014 |
| S18_4721      |             1013 |
| S24_2011      |             1011 |
| S24_4278      |             1009 |
+---------------+------------------+
25 rows in set (0.01 sec)    */

/*  orderNumber      -- buyurtma, hujjat id
    productCode      -- mahsulot kodi
    quantityOrdered  -- nechta donaligi
    priceEach        -- 1 dona mahsulot narhi
    orderLineNumber  -- hujjatdagi mahsulot tartib raqami   */