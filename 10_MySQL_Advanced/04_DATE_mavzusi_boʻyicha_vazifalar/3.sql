/* "payments" jadvalidan:
2005 - yildagi barcha dushanba kunlarida,
jami necha so`mlik xarid bo`lganini aniqlang    */
use `mashq`;
SELECT   YEAR(`paymentDate`)  AS 'yil',               -- yillar
COUNT(WEEKDAY(`paymentDate`)) AS 'dushanbalar soni',  -- dushanba hafta kuni indexlari soni
          SUM(`amount`)       AS 'summa'              -- daromad
FROM `payments`                                       -- jadval nomi
WHERE  YEAR(`paymentDate`) = 2005                     -- agar 2005-yil
AND WEEKDAY(`paymentDate`) = 0                        -- va dushanba kunlari bo'lsa
GROUP BY YEAR(`paymentDate`),                         -- to'lov yillarini
      WEEKDAY(`paymentDate`)                          -- va hafta kuni indexlarini guruhlasin


/* `payments` table
customerNumber - mijoz id
checkNumber    - chek raqami
paymentDate    - to'lov sanasi
amount         - to'lov summasi  */