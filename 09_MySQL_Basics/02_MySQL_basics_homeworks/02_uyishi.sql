-- "salaries" jadvalidan foydalanib:
-- -o'rtacha oylik qanchaligini
-- -eng katta oylik qanchaligini
-- -eng kichik oylik qanchaligini aniqlang

SHOW DATABASES;

USE `Test`;

# employee jadvali hosil qilamiz
CREATE TABLE IF NOT EXISTS `employees`
(
    `id`         INT PRIMARY KEY, # unikal identifikator
    `name`       VARCHAR(255),    # hamkasb nomi
    `DivisionID` INT NOT NULL,    # bo'linma id si
    `ManagerID`  INT NOT NULL,    # Menejer ID si
    `Salary`     DECIMAL(10, 2)   # Ish haqi (10 xonali son, shundan 2 xonasi haqiqiy son)
);

# jadvalga vazifa uchun ma'lumotlar "tashlaymiz", yozamiz
INSERT INTO employees (id, name, DivisionID, ManagerID, Salary)
VALUES (356, 'Daniel Smith', 100, 133, 40000.00),
       (357, 'Emily Johnson', 101, 134, 45000.00),
       (358, 'Michael Brown', 102, 135, 42000.00),
       (359, 'Sarah Devis', 103, 136, 43000.00),
       (360, 'Chris Wilson', 104, 137, 48000.00);

# jadvalni ko'rish
SELECT *
FROM employees;

# O'rtacha oylik - average salary
SELECT AVG(`Salary`) AS `O'rtacha oylik`
FROM employees;

# maximal oylik - maximal salary
SELECT MAX(`Salary`) AS `Maximal oylik`
FROM employees;

# minimal oylik - minimal salary
SELECT MIN(`Salary`) AS `Minimal oylik`
FROM employees;