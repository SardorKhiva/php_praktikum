/* "payments" jadvalidan:
2004 - yilda , yanvardan to mart oyining oxirigacha
jami necha so`mlik xarid bo`lganini aniqlang    */
USE `mashq`;
SELECT YEAR(`paymentDate`) AS 'yil',
    QUARTER(`paymentDate`) AS 'kvartal',
        SUM(`amount`)      AS 'xaridlar summasi'
FROM        `payments`
WHERE  YEAR(`paymentDate`) = 2004
AND QUARTER(`paymentDate`) = 1
GROUP BY
       YEAR(`paymentDate`),
    QUARTER(`paymentDate`);
/*-----+---------+------------------+
| yil  | kvartal | xaridlar summasi |
+------+---------+------------------+
| 2004 |       1 |        745407.35 |
+------+---------+------------------+
1 row in set (0.00 sec) */


/* `payments` table
customerNumber - mijoz id
checkNumber    - chek raqami
paymentDate    - to'lov sanasi
amount         - to'lov summasi  */