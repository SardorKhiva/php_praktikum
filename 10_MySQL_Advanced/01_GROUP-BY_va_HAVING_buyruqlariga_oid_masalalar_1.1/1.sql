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
-quantityOrdered - nechta buyurtma qilingani soni
"orders" jadvalidan:
1) -- har bir mijoz jami nechtadan zakazni amalga oshirgan   */
SHOW DATABASES;
USE `mashq`;    -- Database changed
SHOW TABLES; /* `mashq` bazasidagi barcha jadvallar:
+------------------+
| Tables_in_mashq  |
+------------------+
| current_dept_emp |
| customers        |
| departments      |
| employees        |
| offices          |
| orderdetails     |
| orders           |
| payments         |
| productlines     |
| products         |
+------------------+
10 rows in set (0.00 sec)   */

SELECT `customerNumber` AS "Mijoz ID",
COUNT(*) AS "Jami nechtadan buyurtma"
FROM `orders`
GROUP BY `customerNumber`;
/* natija:
+----------+-------------------------+
| Mijoz ID | Jami nechtadan buyurtma |
+----------+-------------------------+
|      103 |                       3 |
|      112 |                       3 |
|      114 |                       5 |
|      119 |                       4 |
|      121 |                       4 |
|      124 |                      17 |
|      128 |                       4 |
|      129 |                       3 |
|      131 |                       4 |
|      141 |                      26 |
|      144 |                       4 |
|      145 |                       5 |
|      146 |                       3 |
|      148 |                       5 |
|      151 |                       4 |
|      157 |                       4 |
|      161 |                       4 |
|      166 |                       4 |
|      167 |                       3 |
|      171 |                       2 |
|      172 |                       3 |
|      173 |                       2 |
|      175 |                       3 |
|      177 |                       2 |
|      181 |                       3 |
|      186 |                       3 |
|      187 |                       3 |
|      189 |                       2 |
|      198 |                       3 |
|      201 |                       3 |
|      202 |                       2 |
|      204 |                       2 |
|      205 |                       3 |
|      209 |                       3 |
|      211 |                       2 |
|      216 |                       3 |
|      219 |                       2 |
|      227 |                       2 |
|      233 |                       3 |
|      239 |                       2 |
|      240 |                       2 |
|      242 |                       3 |
|      249 |                       2 |
|      250 |                       3 |
|      256 |                       2 |
|      259 |                       2 |
|      260 |                       2 |
|      276 |                       4 |
|      278 |                       3 |
|      282 |                       4 |
|      286 |                       2 |
|      298 |                       2 |
|      299 |                       2 |
|      311 |                       3 |
|      314 |                       3 |
|      319 |                       2 |
|      320 |                       3 |
|      321 |                       4 |
|      323 |                       5 |
|      324 |                       3 |
|      328 |                       3 |
|      333 |                       3 |
|      334 |                       3 |
|      339 |                       2 |
|      344 |                       2 |
|      347 |                       2 |
|      350 |                       3 |
|      353 |                       5 |
|      357 |                       3 |
|      362 |                       3 |
|      363 |                       3 |
|      379 |                       3 |
|      381 |                       4 |
|      382 |                       4 |
|      385 |                       3 |
|      386 |                       3 |
|      398 |                       4 |
|      406 |                       3 |
|      412 |                       3 |
|      415 |                       1 |
|      424 |                       3 |
|      447 |                       3 |
|      448 |                       3 |
|      450 |                       4 |
|      452 |                       3 |
|      455 |                       2 |
|      456 |                       2 |
|      458 |                       3 |
|      462 |                       3 |
|      471 |                       3 |
|      473 |                       2 |
|      475 |                       2 |
|      484 |                       2 |
|      486 |                       3 |
|      487 |                       2 |
|      489 |                       2 |
|      495 |                       2 |
|      496 |                       4 |
+----------+-------------------------+
98 rows in set (0.03 sec)   */