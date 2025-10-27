/* "products" jadvalidan:
5) "productVendor" ustuni bo`yicha guruhlang va
   har bir vendorda skladda nechta produkt borligini
   sonini va jami summasi chiqaring.    */
/*  +---------------------------+-------+-------------------------------+
    | productVendor             | soni  | sum(quantityInStock*buyPrice) |
    +-------------------------------------+---------+-------------------+
    | Autoart Studio Design     | 30093 |          1487281.90           |
    | Carousel DieCast Legends  | 40805 |          1921187.48           |
    | Classic Metal Creations   | 45408 |          2855182.28           |
    | Exoto Designs             | 44166 |          2484164.75           |
    | Gearbox Collectibles      | 60495 |          3312774.67           |
    | Highway 66 Mini Classics  | 37520 |          2179940.85           |
    | Min Lin Diecast           | 50089 |          3051350.78           |
    | Motor City Art Classics   | 43105 |          2382449.30           |
    | Red Start Diecast         | 35046 |          2060495.26           |
    | Second Gear Diecast       | 42865 |          2238738.81           |
    | Studio M Art Models       | 42253 |          1282571.91           |
    | Unimax Art Galleries      | 38191 |          2500751.38           |
    | Welly Diecast Productions | 45095 |          2777426.86           |
    +---------------------------+-------+-------------------------------+   */
SELECT  `productVendor`,
SUM(`quantityInStock`) AS 'soni',
SUM(`quantityInStock` * `buyPrice`) AS 'summasi'
FROM `products`
GROUP BY `productVendor`
ORDER BY `productVendor`;


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