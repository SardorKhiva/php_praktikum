/* "products" jadvalidan:
2) har bir produkt turidan skladda nechtadan
produkt borligini aniqlang va sonini
kamayib borish tartibida saralab chiqaring   */
SELECT `productLine` AS 'mahsulot turi',
      SUM(`quantityInStock`) AS 'soni'
FROM `products`
GROUP BY `productLine`
ORDER BY `soni` DESC;
/* natija:
+------------------+--------+
| mahsulot turi    | soni   |
+------------------+--------+
| Classic Cars     | 219183 |
| Vintage Cars     | 124880 |
| Motorcycles      |  69401 |
| Planes           |  62287 |
| Trucks and Buses |  35851 |
| Ships            |  26833 |
| Trains           |  16696 |
+------------------+--------+
7 rows in set (0.00 sec)    */

/*  "products" jadvali:
-productLine - Produkt turi
-quantityInStock - maxsulotning soni
-buy_price - narxi
-quantityOrdered - nechta buyurtma qilingani soni   */