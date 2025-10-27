# 4)"payments" jadvalidan:
# -2004-yil necha sumlik to`lov
# amalga oshirilganini va eng
# kichik to`lov necha $ ekanligini aniqlang
USE `Mashq`;

SELECT * FROM `payments`;

SELECT SUM(`amount`) AS "\2004-yil uchun jami to'lovlar",
       MIN(`amount`) AS "\Eng kam to'lov"
FROM `payments`
WHERE YEAR(`paymentDate`) = 2004;

# -2005- yil necha sumlik to`lov
# amalga oshirilganini va eng
# katta to`lov necha $
# bo`lganligini aniqlang
SELECT SUM(`payments`.`amount`) AS "\2005-yil uchun jami to'lovlar",
       MAX(`payments`.`amount`) AS "\2005-yil uchun eng katta to'lov"
FROM `payments`
WHERE YEAR(`Mashq`.`payments`.`paymentDate`) = 2005;


/*
"payments" jadvali tuzilishi:
customerNumber    - mijoz id si
checkNumber       - to'lov, chek id si
paymentDate       - to'lov sanasi
amount            - to'lov summasi
*/