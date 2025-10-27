/* "payments" jadvalidan:
2004 - yil dekabr oyida nechta to`lov bo`lgan
va necha so`mlik bo`lganini */
use mashq;
SELECT  YEAR(`paymentDate`) AS 'yil',
       MONTH(`paymentDate`) AS 'oy',
       COUNT(`paymentDate`) AS "to'lovlar soni",
         SUM(`amount`)      AS 'summa'
FROM `payments`
WHERE `yil` = 2004
  AND `oy`  = 12
GROUP BY  YEAR(`paymentDate`),
         MONTH(`paymentDate`)
# HAVING `yil` = 2004   -- having effektiv emas
#    AND `oy`  = 12;
/*-----+------+----------------+-----------+
| yil  | oy   | to'lovlar soni | summa     |
+------+------+----------------+-----------+
| 2004 |   12 |             23 | 819285.62 |
+------+------+----------------+-----------+
1 row in set (0.00 sec) */

/* `payments` table
customerNumber - mijoz id
checkNumber    - chek raqami
paymentDate    - to'lov sanasi
amount         - to'lov summasi  */