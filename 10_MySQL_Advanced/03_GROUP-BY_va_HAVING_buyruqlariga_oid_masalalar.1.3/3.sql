/* "products" jadvalidan:
3) har bir produkt turidan skladda nechtadan
   produkt borligini aniqlang va sonini kamayib
   borish tartibida saralang va jami necha
   sumlik ekanligini chiqaring
    +-------------------------+---------------+
    | productLine      | soni   |    summa    |
    +-------------------------+---------------+
    | Classic Cars     | 219183 | 14059337.71 |
    | Vintage Cars     | 124880 | 5704259.82  |
    | Motorcycles      | 69401  | 3565714.18  |
    | Planes           | 62287  | 3099282.76  |
    | Trucks and Buses | 35851  | 2139329.56  |
    | Ships            | 26833  | 1239140.43  |
    | Trains           | 16696  |  727251.77  |
    +------------------+--------+-------------+ */
SELECT `productLine`,
SUM(`quantityInStock`)              AS 'soni',
SUM(`quantityInStock` * `buyPrice`) AS 'summa'
FROM `products`
GROUP BY `productLine`
ORDER BY `soni` DESC;
/*-----------------+--------+-------------+
| productLine      | soni   | summa       |
+------------------+--------+-------------+
| Classic Cars     | 219183 | 16817868.17 |
| Vintage Cars     | 124880 |  5533375.01 |
| Motorcycles      |  69401 |  3558947.56 |
| Planes           |  62287 |  3055460.69 |
| Trucks and Buses |  35851 |  1963741.46 |
| Ships            |  26833 |  1140793.72 |
| Trains           |  16696 |   710143.77 |
+------------------+--------+-------------+
7 rows in set (0.00 sec)    */

/* "products" jadvali:
-productLine - Produkt turi
-quantityInStock - maxsulotning soni
-buy_price - narxi
-quantityOrdered - nechta buyurtma qilingani soni */
/* `products` table
productCode - tovar id
productName - tovar ismi
productLine - tovar kategoriyasi, turi
productScale - mahsulot masshtabi, nisbati
productVendor - tovar yetkazib beruvchi
productDescription - tovarga izoh
quantityInStock - ombordagi mahsulot soni
buyPrice - sotib olingan narhi
MSRP - sotish narhi */
SELECT productLine,
SUM(quantityInStock)        AS 'soni',
SUM(quantityInStock * MSRP) AS 'summa'
FROM products
GROUP BY productLine
ORDER BY soni DESC;