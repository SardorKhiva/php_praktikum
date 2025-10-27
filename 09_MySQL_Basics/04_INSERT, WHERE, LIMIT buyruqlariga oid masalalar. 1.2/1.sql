# DIQQAT!!! Ushbu masalalarni
# "classicmodels" databasidan foydalanib bajaring

# "products" jadvalida:
# -productLine - Produkt turi
# -quantityInStock - maxsulotning ombordagi soni
# -buy_price - narxi

# 1) "products" jadvalidan:
# -maxsulot soni 2000 dan kam bo`lgan,
# "Classic Cars" turidagi maxsulotlar chiqaring
SELECT * FROM `products`;   -- jadval bilan qisqa tanishish

SELECT *    -- tanlaymiz barcha ustunni
FROM `products` -- products jadvalidan
WHERE `quantityInStock` < 2000  -- qaysiki maxsulot soni 2000 dan kam bo`lsa
AND `productLine` = 'Classic Cars'; -- va mahsulot turi Classic cars bo'lsa


# -"Classic Cars" turidagi
# maxsulotlar skladda
# jami necha sumlik ekanini aniqlang.

SELECT SUM(`buyPrice`)
FROM `products`
WHERE `productLine` = 'Classic Cars';


SHOW DATABASES;
USE `Mashq`;
SHOW TABLES;