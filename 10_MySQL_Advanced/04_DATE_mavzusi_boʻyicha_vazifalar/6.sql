/* "orders" jadvalidan:
2003 - yilda eng uzoq vaqtda yetkazib
berilgan 10 ta buyurtmani aniqlang */
USE `mashq`;
SELECT     YEAR(`shippedDate`)              AS 'yil',
       DATEDIFF(`shippedDate`, `orderDate`) AS 'muddat',
                `orderNumber`               AS 'hujjat raqami'
FROM            `orders`
WHERE      YEAR(`shippedDate`) = 2003
GROUP BY        `yil`,
                `muddat`,
                `orderNumber`
ORDER BY        `muddat` DESC
LIMIT 10;
/*-----+--------+---------------+
| yil  | muddat | hujjat raqami |
+------+--------+---------------+
| 2003 |     65 |         10165 |
| 2003 |      6 |         10152 |
| 2003 |      6 |         10159 |
| 2003 |      6 |         10160 |
| 2003 |      6 |         10154 |
| 2003 |      6 |         10133 |
| 2003 |      6 |         10121 |
| 2003 |      6 |         10145 |
| 2003 |      6 |         10140 |
| 2003 |      6 |         10138 |
+------+--------+---------------+
10 rows in set (0.00 sec)   */

/* barcha buyurtma qabul qilingan va
 yetkazib berilgan kunlar orasidagi farqlar:    */
SELECT DATEDIFF(`shippedDate`, `orderDate`) AS 'muddat'
FROM `orders`
WHERE YEAR(`shippedDate`) = 2003    -- 2003-yildagilarni, comment qilsa barcha muddatni chiqaradi
ORDER BY `muddat` DESC;             -- muddati kamayish tartibida

/* `orders` table
orderNumber    - buyurtma raqami
orderDate      - buyurtma olingan sana
requireDate    - buyurtma yetkazilishi kerak bo'lgan oxirgi muddat
shippedDate    - buyurtma yetkazilgan sana
status         - buyurtma holati
comments       - izohlar
customerNumber - buyurtma bergan mijoz raqami   */