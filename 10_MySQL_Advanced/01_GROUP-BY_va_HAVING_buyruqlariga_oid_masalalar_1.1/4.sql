/*
Ushbu masalalarni ishlashda classicmodels jadvalidan foydalaning

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
-quantityOrdered - nechta buyurtma qilingani soni   */
/* "orders" jadvalidan:
  4) - 2003 - yilda qilingan buyurtmalarni hafta kunlari bo`yicha, nechtadan buyurtma bo`lganini aniqlang.
Quyidagidek natija chiqishi kerak:
        +--------------+------+
        | kunlar       | soni |
        +--------------+------+
        | Friday       |   21 |
        | Monday       |   18 |
        | Saturday     |    5 |
        | Sunday       |    4 |
        | Thursday     |   17 |
        | Tuesday      |   23 |
        | Wednesday    |   23 |
        +--------------+------+     */
SET lc_time_names = 'en_US';
SET lc_time_names = 'ru_RU';
USE `mashq`;
SELECT DAYNAME(`orderDate`) AS "kunlar",
         COUNT(`orderDate`) AS "soni"
FROM `orders`
GROUP BY DAYNAME(`orderDate`);  /*
+------------+------+
| hafta kuni | soni |
+------------+------+
| Monday     |   50 |
| Thursday   |   59 |
| Friday     |   69 |
| Wednesday  |   64 |
| Tuesday    |   56 |
| Sunday     |   11 |
| Saturday   |   17 |
+------------+------+
7 rows in set (0.00 sec)    */