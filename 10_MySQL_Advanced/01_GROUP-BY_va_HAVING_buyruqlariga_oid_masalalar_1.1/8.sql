/*  Terminlar
-customerNumber - mijoz id si
-orderDate - buyurtma sanasi
-status - buyurtma holati
-orderDate - buyurtma qilingan vaqti
-shippedDate - buyurtma yetkazilgan vaqti
-reqiuredDate - buyurtmani yetkazish shart bo`lgan sana
"orders" jadvalidan:
  8) 2004-yilda qaysi oylarda 10 tadan kam buyurtma bo`lgan bo`lsa shularni aniqlang.
    Nechtadan buyurtma bo`lganini ham ko`rsating
        +---------+------+
        | oylar   | soni |
        +---------+------+
        | January |    8 |
        | March   |    8 |
        | May     |    8 |
        +---------+------+      */
USE `mashq`;
-- 1- USUL:
SELECT MONTHNAME(`orderDate`) AS "oylar",   -- oylar nomlari
       COUNT(*) AS "soni"                   -- buyurtmalar soni
FROM `orders`                               -- orders jadvalidan
WHERE YEAR(`orderDate`) = 2004              -- 2004-yil bo'lsa
GROUP BY MONTH(`orderDate`),                -- oy raqamlari va
         MONTHNAME(`orderDate`)             -- oy nomlarini guruhla
HAVING `soni` < 10                          -- agar buyurtmalar soni 10 tadan kam bo'lsa
ORDER BY MONTH(`orderDate`);                -- oy raqamlarini tartibla

-- 2- USUL:
SELECT                                      -- tanla
    MONTHNAME(`orderDate`) AS "oylar",      -- oy nomlarini
    COUNT(*) AS "soni"                      -- va buyurtmalar sonini
FROM `orders`                               -- orders jadvalidan
GROUP BY      YEAR(`orderDate`),            -- orderDate ustuni satrlaridagi yillarni,
             MONTH(`orderDate`),            -- orderDate ustuni satrlaridagi oy raqamlarini,
         MONTHNAME(`orderDate`)             -- orderDate ustuni satrlaridagi oy nomlarini,
HAVING YEAR(   MIN(`orderDate`) ) = 2004    -- qaysiki orderDate ustuni satrlaridagi minimal yozuv(yil) 2004 bo'lganlarini
       AND `soni` < 10                      -- va buyurtmalar soni 10 dan kamlarini
ORDER BY  MONTH(`orderDate`);               -- oy tartib raqamlarini o'sish bo'yicha tartiblab chiqaar
