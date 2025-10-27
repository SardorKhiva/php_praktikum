/*  "orders" jadvalidan:
2005-yilda eng kam vaqtda yetkazilgan
10 ta buyurtmalarni va necha kunda
yetkazilganini chiqaring */
USE `mashq`;
SELECT YEAR(`shippedDate`)              AS 'yil',
   DATEDIFF(`shippedDate`, `orderDate`) AS 'muddat',
            `orderNumber`               AS 'hujjat_raqami'
FROM        `orders`
WHERE  YEAR(`shippedDate`) = 2005
GROUP BY    `yil`,
            `muddat`,
            `orderNumber`
ORDER BY    `muddat`,
            `orderNumber`
LIMIT        10;

/* `orders` table
orderNumber    - buyurtma raqami
orderDate      - buyurtma olingan sana
requireDate    - buyurtma yetkazilishi kerak bo'lgan oxirgi muddat
shippedDate    - buyurtma yetkazilgan sana
status         - buyurtma holati
comments       - izohlar
customerNumber - buyurtma bergan mijoz raqami   */