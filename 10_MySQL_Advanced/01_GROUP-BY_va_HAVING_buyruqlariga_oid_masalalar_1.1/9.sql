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
  9) - customerNumber=141 bo`lgan mijoz, 2003, 2004,2005 - yillarda qilgan buyurtmalarining, nechtasi "Shipped" bo`lganini aniqlang.
        +------+------+
        | yil  | soni |
        +------+------+
        | 2003 |    8 |
        | 2004 |    8 |
        | 2005 |    6 |
        +------+------+
*/