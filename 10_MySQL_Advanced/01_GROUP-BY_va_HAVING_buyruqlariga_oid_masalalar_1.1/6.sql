/* Terminlar
-customerNumber - mijoz id si
-order - zakaz
-status - holati
-orderDate - zakaz qilingan vaqti
-shippedDate - yetkazilgan vaqti
-reqiuredDate - yetkazish shart bo`lgan sana
"orders" jadvalidan:
  6) - har oyda nechtadan zakaz buyurtma qilinganini aniqlang   */
USE `mashq`;

SELECT MONTHNAME(`orderDate`) AS "Oy",
COUNT(`orderDate`) AS "Buyurtmalar soni"
FROM `orders`
GROUP BY MONTHNAME(`orderDate`);     /*
+-----------+------------------+
| Oy        | Buyurtmalar soni |
+-----------+------------------+
| January   |               25 |
| February  |               26 |
| March     |               27 |
| April     |               29 |
| May       |               29 |
| June      |               19 |
| July      |               18 |
| August    |               17 |
| September |               20 |
| October   |               31 |
| November  |               63 |
| December  |               22 |
+-----------+------------------+
12 rows in set (0.00 sec)       */