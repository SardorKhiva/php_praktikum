/* "products" jadvalidan:
4) "productVendor" ustuni bo`yicha guruhlang va
har bir vendorda nechta produkt borligini
sonini chiqaring. (Skladdagi sonini emas) */
/*  +----------------------------------+
    | productVendor             | soni |
    +----------------------------------+
    | Autoart Studio Design     |  8   |
    | Carousel DieCast Legends  |  9   |
    | Classic Metal Creations   | 10   |
    | Exoto Designs             |  9   |
    | Gearbox Collectibles      |  9   |
    | Highway 66 Mini Classics  |  9   |
    | Min Lin Diecast           |  8   |
    | Motor City Art Classics   |  9   |
    | Red Start Diecast         |  7   |
    | Second Gear Diecast       |  8   |
    | Studio M Art Models       |  8   |
    | Unimax Art Galleries      |  8   |
    | Welly Diecast Productions |  8   |
    +----------------------------------+  */
SELECT `productVendor`,
        COUNT(`productCode`) AS 'soni'
FROM `products`
GROUP BY `productVendor`
# ORDER BY `soni`       -- soni kamayish tartibida agar kerak bo'lsa
ORDER BY `productVendor`;
/*--------------------------+------+
| productVendor             | soni |
+---------------------------+------+
| Autoart Studio Design     |    8 |
| Carousel DieCast Legends  |    9 |
| Classic Metal Creations   |   10 |
| Exoto Designs             |    9 |
| Gearbox Collectibles      |    9 |
| Highway 66 Mini Classics  |    9 |
| Min Lin Diecast           |    8 |
| Motor City Art Classics   |    9 |
| Red Start Diecast         |    7 |
| Second Gear Diecast       |    8 |
| Studio M Art Models       |    8 |
| Unimax Art Galleries      |    8 |
| Welly Diecast Productions |    8 |
+---------------------------+------+
13 rows in set (0.00 sec) */


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