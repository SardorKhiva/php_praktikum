# 3)"orderdetails" jadvalidan:

SHOW DATABASES;
USE `Mashq`;
SHOW TABLES;
SELECT * FROM `orderdetails`;

# I MASALA
# -produkt soni 30 dan kam bo`lgan
# narxi 100 dan katta bo`lgan zakazlarning,
# har bir zakaz jami necha $ lik
# bo`lganini hisoblang
SELECT                                      -- tanlaymiz
    SUM(`quantityOrdered` * `priceEach`)    -- yig'indisini (4)
        AS "Jami yig'indi"                  -- shu nomda chiqaramiz (5)
FROM `orderdetails`                         -- orderdetails jadvalidagi (1)
WHERE `quantityOrdered` < 30                --  mahsulotlar soni 30 dan kam (2)
AND `priceEach` > 100;                      -- va narhi 100$ dan ko'p bo'lganlarini (3)

/* bajarilish tartibi:
1. FROM (jadval qayerdan olinadi)
2. WHERE (qaysi ustunlar to'g'ri keladi)
3. SELECT (qanday ma'lumotlar hisoblanadi va qaytariladi)
4. SUM (ma'lumotlar agregatsiyalanadi, summasi olinadi)
*/



# II MASALA

# -Product codi S10_1949,
# S12_1099, S18_1662, S18_4027,
# S18_3136 ga teng bo`lgan orderlarning,
# jami nechta zakaz qilingani va jami
# necha sumlik zakaz qilinganini hisoblang

SELECT
    SUM(`quantityOrdered`) AS
    "\Jami buyurtmalar soni",
    SUM(`quantityOrdered` * `priceEach`) AS
    "\Jami buyurtma so'mda"
FROM `orderdetails`
WHERE `productCode` IN ('S10_1949', 'S12_1099',
           'S18_1662', 'S18_4027', 'S18_3136');

/*
Ustunlar nomlari:
orderNumber     - buyurtma raqami
productCode     - mahsulot takrorlanmas kodi
quantityOrdered - buyurtma berilgan tovarlar soni
priceEach       - bir dona mahsulot narhi
orderLineNumber - buyurtmadagi tartib raqami
*/