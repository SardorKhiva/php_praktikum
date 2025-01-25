/* "products" jadvalidan:
6) -"productVendor" ustuni bo`yicha guruhlansin. Skladda har bir vendorda jami
45000 dan ortiq produkt bor bo`lganlarni chiqaring  */
/*  +-----------------------------------+
    | productVendor             | soni  |
    +-----------------------------------+
    | Classic Metal Creations   | 45408 |
    | Gearbox Collectibles      | 60495 |
    | Min Lin Diecast           | 50089 |
    | Welly Diecast Productions | 45095 |
    +---------------------------+-------+  */
SELECT `productVendor`,
SUM(`quantityInStock`) AS 'soni'
FROM `products`
GROUP BY `productVendor`
HAVING `soni` > 45000
ORDER BY `productVendor`;
/* natija:
+---------------------------+-------+
| productVendor             | soni  |
+---------------------------+-------+
| Classic Metal Creations   | 45408 |
| Gearbox Collectibles      | 60495 |
| Min Lin Diecast           | 50089 |
| Welly Diecast Productions | 45095 |
+---------------------------+-------+
4 rows in set (0.00 sec)    */

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