# "employees" jadvalidagi 2 ta ustunni
#  ya`ni first_name va last_name ustunlarini
#  nomini Ism va Familya ko`rinishida chiqaring

SHOW DATABASES;

USE northwind;

SHOW TABLES;

SELECT *
FROM Employees;

SELECT CONCAT(FirstName, ' ', LastName) AS 'Ism va Familya'
FROM Employees;