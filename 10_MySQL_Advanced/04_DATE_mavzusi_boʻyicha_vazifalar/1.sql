/* "payments" jadvalidan:
2003 - yil, nechta to`lov bo`lgan va necha so`mlik bo`lganini */
use mashq;
SELECT  YEAR(`paymentDate`) AS 'yil',
       COUNT(`paymentDate`) AS "to'lovlar soni",
         SUM(`amount`)      AS "summa"
FROM `payments`
WHERE YEAR(`paymentDate`) = 2003
GROUP BY YEAR(`paymentDate`)
# HAVING `yil` = 2003   -- HAVING bilan WHERE bir vaqtda ishlatilmaydi
ORDER BY `yil`
/*-----+----------------+------------+
| yil  | to'lovlar soni | summa      |
+------+----------------+------------+
| 2003 |            100 | 3250217.70 |
+------+----------------+------------+
1 row in set (0.00 sec)  */

/* `payments` table
customerNumber - mijoz id
checkNumber    - chek raqami
paymentDate    - to'lov sanasi
amount         - to'lov summasi  */