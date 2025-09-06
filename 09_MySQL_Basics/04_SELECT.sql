/* Qolip
SELECT `ustun_1`, `ustun_2`, ...
FROM `jadval_nomi`;
*/

USE `classicmodels`;

# Tanlangan ma'lumotlar omboridagi jadvallarni chiqarish
SHOW TABLES;

# Jadvaldagi barcha ustunlarni tanlash
SELECT *
FROM `employees`;

# Ma'lum bir ustunlarni tanlash
SELECT `lastName`,
       `firstName`
FROM `employees`;

# Jadvaldagi ustun nomini boshqa nom(Alias) bilan chiqarish
SELECT `lastName`  AS `familya`,
       `firstName` AS `ism`,
       `email`
FROM `employees`;

# COUNT() - Jadvaldagi yozuvlar soni
SELECT COUNT(*) -- * o'rniga xohlagan ustun nomini yozsa bo'ladi
FROM `employees`;

-- ustunlarni birlashtirgan holda ma'lumot olish
SELECT CONCAT(`lastName`, ' ', `firstName`)
           AS `fullName`
FROM `employees`;

-- CONCAT_WS()
/*
 CONCAT() funksiyasiga o'xshash
 CONCAT_WS 1-parametrida qo'shadigan belgi beriladi
 masalan:
 */
SELECT CONCAT(`lastName`, ', ', `firstName`)
FROM `employees`;

SELECT CONCAT_WS(', ', `lastName`, `firstName`)
FROM `employees`;

# IF
SELECT `quantityInStock`,
       IF(`quantityInStock` < 50, "kam", "ko'p") -- shart to'g'ri bo'lsa kam, aks holda ko'p chiqadi
FROM `classicmodels`.`products`
# ORDER BY `quantityInStock`
;

# MAX - ustundagi eng katta qiymat, MIN - eng kichik
SELECT MAX(`buyPrice`) AS `Maksimal`,
       MIN(`buyPrice`) AS 'Minimal'
FROM `classicmodels`.`products`;

# SUM - summa, AVG - o'rtacha
SELECT SUM(`employeeNumber`)
FROM `classicmodels`.`employees`;

SELECT AVG(`employeeNumber`) AS "\O'rtacha"
FROM `classicmodels`.`employees`;

# LIMIT - chegaralash
SELECT *
FROM `employees`
LIMIT 10; -- boshidan 10 ta yozuv chiqar