/*
Ushbu masalalarni ishlashda classicmodels jadvalidan foydalaning
"products" jadvali:
-productLine - Produkt turi
-quantityInStock - maxsulotning soni
-buy_price - narxi
-quantityOrdered - nechta buyurtma qilingani soni */
/*      Terminlar
-customerNumber - mijoz id si
-order - zakaz
-status - holati
-orderDate - zakaz qilingan vaqti
-shippedDate - yetkazilgan vaqti
-reqiuredDate - yetkazish shart bo`lgan sana
"orders" jadvalidan:
  5) - har yilda nechtadan buyurtma qilinganini aniqlang    */
SELECT YEAR(`orderDate`) AS "Yil",
       SUM(`orderNumber`) AS "Buyurtmalar soni"
FROM `mashq`.`orders`
GROUP BY YEAR(`orderDate`); /*
+------+------------------+
| Yil  | Buyurtmalar soni |
+------+------------------+
| 2003 |          1127481 |
| 2004 |          1552910 |
| 2005 |           665184 |
+------+------------------+
3 rows in set (0.00 sec)    */