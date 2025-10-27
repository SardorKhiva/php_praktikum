/*  "orders" jadvalidan:
2004-yilda eng qisqa muddatda
yetkazilgan 10 ta buyurtmani aniqlang */
USE `mashq`;
SELECT YEAR(`shippedDate`)              AS 'yil',
   DATEDIFF(`shippedDate`, `orderDate`) AS 'muddat',
            `orderNumber`               AS 'hujjat raqami'
FROM            `orders`
WHERE      YEAR(`shippedDate`) = 2004
GROUP BY        `yil`,
                `muddat`,
                `orderNumber`
ORDER BY        `muddat`
LIMIT 10;
/*-----+--------+---------------+
| yil  | muddat | hujjat raqami |
+------+--------+---------------+
| 2004 |      1 |         10246 |
| 2004 |      1 |         10229 |
| 2004 |      1 |         10273 |
| 2004 |      1 |         10257 |
| 2004 |      1 |         10221 |
| 2004 |      1 |         10238 |
| 2004 |      1 |         10222 |
| 2004 |      1 |         10253 |
| 2004 |      1 |         10264 |
| 2004 |      1 |         10254 |
+------+--------+---------------+
10 rows in set (0.00 sec)  */


SELECT DATEDIFF(`shippedDate`, `orderDate`) AS 'muddat'
FROM `orders`
WHERE YEAR(`shippedDate`) = 2004    -- 2004-yildagilarni, comment qilsa barcha muddatni chiqaradi
ORDER BY `muddat`;             -- muddatni tartiblash
/* `orders` table
orderNumber    - buyurtma raqami
orderDate      - buyurtma olingan sana
requireDate    - buyurtma yetkazilishi kerak bo'lgan oxirgi muddat
shippedDate    - buyurtma yetkazilgan sana
status         - buyurtma holati
comments       - izohlar
customerNumber - buyurtma bergan mijoz raqami   */