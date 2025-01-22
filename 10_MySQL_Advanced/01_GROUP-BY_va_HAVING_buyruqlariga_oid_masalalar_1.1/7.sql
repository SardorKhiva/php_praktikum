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
  7) - eng qisqa muddatda yetkazilgan buyurtmalarni guruhlang.
Misol uchun: 1 kunni ichida yetkzailgan buyurtmalar soni 6 ta, 2 kunni ichida yetkzailgan buyurmalar soni 16 ta vhkz
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
        +-----------------+------+
*/