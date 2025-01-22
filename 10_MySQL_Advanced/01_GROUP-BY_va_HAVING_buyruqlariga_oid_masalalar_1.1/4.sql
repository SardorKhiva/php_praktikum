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
-quantityOrdered - nechta buyurtma qilingani soni
"orders" jadvalidan:
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
        +--------------+------+
*/