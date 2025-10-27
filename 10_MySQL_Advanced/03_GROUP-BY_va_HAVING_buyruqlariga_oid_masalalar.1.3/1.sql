/*  "payments" jadvalidan:
1) har yili qancha summalik to`lov
   bo`lganligini summasini chiqaring
    +------+------------+
    | yil  | jami       |
    +------+------------+
    | 2003 | 3250217.70 |
    | 2004 | 4313328.25 |
    | 2005 | 1290293.28 |
    +------+------------+   */
SELECT
    YEAR(`paymentDate`) AS 'yil',
     SUM(`amount`)      AS 'jami'
FROM `payments`
GROUP BY `yil`                    -- YEAR(`paymentDate`)
ORDER BY `yil`;
/* natija:
+------+------------+
| yil  | jami       |
+------+------------+
| 2003 | 3250217.70 |
| 2004 | 4313328.25 |
| 2005 | 1290293.28 |
+------+------------+
3 rows in set (0.00 sec)    */
/* payments table
customerNumber - mijoz id
checkNumber    - chek raqami
paymentDate    - to'lov sanasi
amount         - mijoz to'lagan summa   */