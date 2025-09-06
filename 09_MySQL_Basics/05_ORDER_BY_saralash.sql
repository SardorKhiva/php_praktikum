#  ASC - Ascending - o'sib borish tartibida saralash
# Qolip:
SELECT *
FROM `jadval_nomi`
ORDER BY `ustun_nomi` ASC; -- ASC odatda yozish shart emas, standart mavjud bo'ladi

USE `classicmodels`;

# Bitta ustunni saralash
SELECT *
FROM `orders`
ORDER BY `customerNumber` ASC;

# Bir nechta ustunni saralash
SELECT *
FROM `orders`
ORDER BY `customerNumber` DESC,
         `status` ASC;

# DESC - Descending - kamayib borish tartibida saralash
# Qolip:
SELECT *
FROM `jadval_nomi`
ORDER BY `ustun_nomi` DESC;

-- 1 ta ustunni saralash
SELECT *
FROM `orders`
ORDER BY `customerNumber` DESC;

-- 1 nechta ustun bilan saralash
SELECT *
FROM `employees`
ORDER BY `firstName`,
         `lastName` DESC;

# Aralash saralash
-- Har bir ustunga DESC yoki ASC ni ko'satish mumkin
SELECT *
FROM `orders`
ORDER BY `customerNumber` ASC,
         `status` DESC
LIMIT 10;