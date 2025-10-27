/* "orderdetails" jadvalidan:
6) Product codi S10_1949, S12_1099, S18_1662, S18_4027, S18_3136
ga teng bo`lgan orderlarning, har bir produktdan jami nechta zakaz
qilingani va jami necha sumlik zakaz qilinganini hisoblang  */
USE `mashq`;

SELECT `productCode` AS 'mahsulot kodi',
      COUNT(`productCode`) AS 'nechta buyurtma',
      SUM(`priceEach` * `quantityOrdered`) AS 'buyurtma summasi'
FROM `orderdetails`
GROUP BY `productCode`
HAVING `productCode` IN ('S10_1949', 'S12_1099', 'S18_1662', 'S18_4027', 'S18_3136');
/* natija:
+---------------+-----------------+------------------+
| mahsulot kodi | nechta buyurtma | buyurtma summasi |
+---------------+-----------------+------------------+
| S10_1949      |              28 |        190017.96 |
| S12_1099      |              27 |        161531.48 |
| S18_1662      |              28 |        144959.91 |
| S18_3136      |              28 |         85328.57 |
| S18_4027      |              27 |        122254.75 |
+---------------+-----------------+------------------+
5 rows in set (0.01 sec)    */

/*  orderNumber      -- buyurtma, hujjat id
    productCode      -- mahsulot kodi
    quantityOrdered  -- nechta donaligi
    priceEach        -- 1 dona mahsulot narhi
    orderLineNumber  -- hujjatdagi mahsulot tartib raqami   */