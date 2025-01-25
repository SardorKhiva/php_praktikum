/* "products" jadvalidan:
7) "productVendor" ustuni bo`yicha guruhlansin.
Skladda har bir vendorda jami summasi 2000000
dan oshgan vendorlarni chiqaring    */
#     BAZALARDAGI SONLAR FARQ QILISHI MUMKIN, MASALA YECHILISHIGA E'TIBOR BERING
#     SIZDAGI VA MENDAGI BAZALARDAGI SONLAR FARQ QILISHI MMUKIN
/*  +---------------------------+------------+
    | productVendor             | summa      |
    +---------------------------+------------+
    | Classic Metal Creations   | 2855182.28 |
    | Exoto Designs             | 2484164.75 |
    | Gearbox Collectibles      | 3312774.67 |
    | Highway 66 Mini Classics  | 2179940.85 |
    | Min Lin Diecast           | 3051350.78 |
    | Motor City Art Classics   | 2382449.30 |
    | Red Start Diecast         | 2060495.26 |
    | Second Gear Diecast       | 2238738.81 |
    | Unimax Art Galleries      | 2500751.38 |
    | Welly Diecast Productions | 2777426.86 |
    +---------------------------+------------+  */
SELECT `productVendor`,
SUM(`quantityInStock` * `buyPrice`) AS 'summa'
FROM `products`
GROUP BY `productVendor`
HAVING `summa` > 2000000 -- commentga olinsa hamma vendro summalari bilan chiqadi
ORDER BY `productVendor`;

/*--------------------------+------------+
| productVendor             | summa      |
+---------------------------+------------+
| Classic Metal Creations   | 3242307.83 |
| Exoto Designs             | 2572125.54 |
| Gearbox Collectibles      | 3876686.20 |
| Highway 66 Mini Classics  | 2349639.38 |
| Min Lin Diecast           | 3339245.23 |
| Motor City Art Classics   | 2431142.43 |
| Red Start Diecast         | 2139645.11 |
| Second Gear Diecast       | 2474282.23 |
| Unimax Art Galleries      | 2600551.88 |
| Welly Diecast Productions | 3106177.05 |
+---------------------------+------------+
10 rows in set (0.00 sec)   */

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