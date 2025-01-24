/*  Terminlar
-customerNumber - mijoz id si
-order - zakaz
-status - holati
-orderDate - zakaz qilingan vaqti
-shippedDate - yetkazilgan vaqti
-reqiuredDate - yetkazish shart bo`lgan sana
"orders" jadvalidan:
  7) - eng qisqa muddatda yetkazilgan buyurtmalarni guruhlang.
Misol uchun: 1 kunni ichida yetkzailgan buyurtmalar soni 6 ta,
2 kunni ichida yetkzailgan buyurmalar soni 16 ta vhkz
        +-----------------+------+
        | yetkazilgan_kun | soni |
        +-----------------+------+
        |            NULL |   14 |
        |               1 |   50 |
        |               2 |   49 |
        |               3 |   52 |
        |               4 |   52 |
        |               5 |   59 |
        |               6 |   45 |
        |               7 |    2 |
        |               8 |    2 |
        |              65 |    1 |
        +-----------------+------+      */
USE `mashq`;
SELECT DAYOFYEAR(`shippedDate`) - DAYOFYEAR(`orderDate`) AS "yetkazilgan kun",  -- yetkazilgan yil kuni - hujjat sanasi
           COUNT(`shippedDate`)                          AS "soni"              -- yetkazilgan sanalar soni
FROM `orders`                                                                   -- orders jadvalidan
GROUP BY `yetkazilgan kun`                                                      -- 1-va 2- satrlarni guruhlash
ORDER BY `yetkazilgan kun`;                                                     -- va ularni o'sish tartibida saralash
/*
+-----------------+------+
| yetkazilgan kun | soni |
+-----------------+------+
|            NULL |    0 |
|               1 |   50 |
|               2 |   49 |
|               3 |   52 |
|               4 |   52 |
|               5 |   59 |
|               6 |   45 |
|               7 |    2 |
|               8 |    2 |
|              65 |    1 |
+-----------------+------+
10 rows in set (0.00 sec)   */