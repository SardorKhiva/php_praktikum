# "salaries" jadvalida oylik maoshlar
# haqida ma`lumot saqlanadi.
# Eng ko`p oylik oladigan 10 ta
# employee ning, faqat employee nomerlarini chiqaring.

SHOW DATABASES;

USE Test;

SHOW TABLES;

SELECT *
FROM employees_2;

SELECT `Salary` AS `Maoshi, kamayish tartibida`
FROM `employees_2`
ORDER BY `Salary` DESC
LIMIT 10;

