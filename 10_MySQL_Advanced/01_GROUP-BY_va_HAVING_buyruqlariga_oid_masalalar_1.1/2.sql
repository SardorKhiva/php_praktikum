/*  Ushbu masalalarni ishlashda classicmodels jadvalidan foydalaning

Terminlar
-customerNumber - mijoz id si
-order - zakaz
-status - holati
-orderDate - zakaz qilingan vaqti
-shippedDate - yetkazilgan vaqti
-reqiuredDate - yetkazish shart bo`lgan sana

"products" jadvali:
-productLine - Produkt turi
-quantityInStock - maxsulotning soni
-buy_price - narxi
-quantityOrdered - nechta buyurtma qilingani soni */
/* "orders" jadvalidan:
  2) - zakazlarning nechtasi "Shipped",
 nechtasi "Cancelled", nechtasi "In Process",
 nechtasi "On Hold", nechtasi "Resolved" ,
 nechtasi "Disputed" .      */

SELECT `status` AS "Buyurtma holati",
COUNT(*) AS "Soni"
FROM `orders`
GROUP BY `status`;  /*
+-----------------+------+
| Buyurtma holati | Soni |
+-----------------+------+
| Shipped         |  303 |
| Resolved        |    4 |
| Cancelled       |    6 |
| On Hold         |    4 |
| Disputed        |    3 |
| In Process      |    6 |
+-----------------+------+
6 rows in set (0.00 sec)    */