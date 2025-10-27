/*  Terminlar
-customerNumber - mijoz id si
-order - zakaz
-status - holati
-orderDate - zakaz qilingan vaqti
-shippedDate - yetkazilgan vaqti
-reqiuredDate - yetkazish shart bo`lgan sana
"orders" jadvalidan:
9)customerNumber = 141 bo`lgan mijoz,
 2003, 2004,2005 - yillarda qilgan buyurtmalarining,
 nechtasi "Shipped" bo`lganini aniqlang.
        +------+------+
        | yil  | soni |
        +------+------+
        | 2003 |    8 |
        | 2004 |    8 |
        | 2005 |    6 |
        +------+------+     */
USE `mashq`;

SELECT                                          -- tanlansin
        YEAR(`orderDate`)   AS 'yil',           -- `orderDate` ustunidagi yillar 'yil' deb,
       COUNT(`orderNumber`) AS 'soni'           -- `orderNumber` ustunidagi hujjatlar sonlari 'soni' deb
FROM `orders`                                   -- `orders` jadvalidan
WHERE `customerNumber` = 141                    -- agar hujjat raqami 141 bo'lsa
  AND `status` =  'Shipped'                     -- va shipped statuslilarni
  AND YEAR(`orderDate`) IN (2003, 2004, 2005)   -- yil 2003 dan 2005 gachalarini
GROUP BY `yil`                                  -- yillar bo'yicha guruhlash
ORDER BY `yil`;                                 -- yillarni oshib borishda tartiblash