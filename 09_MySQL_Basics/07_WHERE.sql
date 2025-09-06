/*
 Qolip:
 SELECT
    kerakli_ustunlar
 FROM
    jadval_nomi
 WHERE
    qidiruv_shartlari;
 */

USE `classicmodels`;

#  WHERE - filtrlash uchun ishlatiladi
SELECT *
FROM `classicmodels`.`employees`
WHERE `employeeNumber` = 1088;

SELECT *
FROM `classicmodels`.`employees`
WHERE `employeeNumber` > 1088;

SELECT *
FROM `employees`
WHERE `employeeNumber` < 1088;

SELECT *
FROM `employees`
WHERE `employeeNumber` <= 1088;

SELECT *
FROM `employees`
WHERE `employeeNumber` <> 1088; -- yoki, `employeeNumber` != 1088;

SELECT *
FROM `employees`
WHERE `employeeNumber` = 1088
   OR `lastName` = "Bott"; -- WHERE `employeeNumber` = 1088 || `lastName` = "Bott";

SELECT *
FROM `employees`
WHERE `employeeNumber` = 1088
  AND (`lastName` = "Bott" OR `officeCode` = 5);

-- BETWEEN - 2 ta oraliqdagi qiymatlarni kiritish uchun
/*
 Qolip:
 SELECT
    `kerakli_ustunlar`
 FROM
    `jadval_nomi`
 WHERE
     `filtrlanadigan_ustun_nomi`
     BETWEEN `minimal_qiymat` AND `maximal_qiymat`;
 */

SELECT *
FROM `employees`
WHERE `employeeNumber` BETWEEN 1088 AND 1200; -- 1088 va 1200 oralig'idagi intervalni filtrla

SELECT *
FROM `orders`
WHERE `orderDate`
          BETWEEN '2003-01-01'
          AND '2003-01-23';

-- LIKE - o'xshashlarni qidiradi
/*
 WHERE `customerName` LIKE 'a%'; -- qiymati a bilan boshlanadiganlarni qidirish
 WHERE `customerName` LIKE '%a'; -- qiymati a bilan tugaydiganlarni qidirish
 WHERE `customerName` LIKE '%aaa%'; --
 WHERE `customerName` LIKE ''; --
 */

-- Создаём таблицу
CREATE TABLE customers2
(
    id           INT AUTO_INCREMENT PRIMARY KEY,
    customerName VARCHAR(50)
);

-- Вставляем тестовые данные
INSERT INTO customers2 (customerName)
VALUES ('Anna'),
       ('Alex'),
       ('AlmaaaShop'),
       ('Baaa'),
       ('Jackson'),
       ('Anderson'),
       ('Benny'),
       ('Conor'),
       ('Kate'),
       ('Sam');

-- 1. Имя начинается с A
SELECT *
FROM customers2
WHERE customerName LIKE 'A%';

-- 2. Имя заканчивается на son
SELECT *
FROM customers2
WHERE customerName LIKE '%son';

-- 3. Имя содержит aaa
SELECT *
FROM customers2
WHERE customerName LIKE '%aaa%';

-- 4. Третий символ = n
SELECT *
FROM customers2
WHERE customerName LIKE '__n%';

-- 5. Второй символ = a
SELECT *
FROM customers2
WHERE customerName LIKE '_a%';

-- 6. Поиск с учётом регистра
SELECT *
FROM customers2
WHERE BINARY customerName LIKE 'A%';

-- 7. Регулярка: имя содержит "a" или "e"
SELECT *
FROM customers2
WHERE customerName REGEXP 'a|e';
-- WHERE customerName REGEXP '[ae]';

# IN - berilgan qiymatlar ichidan moslarini qidirish
SELECT *
FROM `employees`
WHERE `employeeNumber` IN (1501, 1076, 1176, 1209); -- shu qiymatlarni qidiradi

SELECT *
FROM `customers`
WHERE `country` IN ("USA", "Spain", "Africa", "Italy");

# NOT IN - IN ni teskarisi, mavjud emaslarini qidiradi
SELECT *
FROM `employees`
WHERE NOT `employeeNumber`
    IN (1501, 1076, 1176, 1209);

-- tepadagi bilan bir xil
SELECT *
FROM `employees`
WHERE `employeeNumber`
          NOT IN (1501, 1076, 1176, 1209);

# IS NULL - maydondan NULL ga teng bo'lganlarni qidirish
SELECT *
FROM `customers`
WHERE `state` IS NULL;

# IS NOT NULL - maydondan NULL ga teng emaslarni qidirish
SELECT *
FROM `customers`
WHERE `state` IS NOT NULL;

-- ANY va ALL
-- Создаём тестовую базу
CREATE DATABASE IF NOT EXISTS `test_any_all`;
USE `test_any_all`;

-- Удаляем таблицу если она есть
DROP TABLE IF EXISTS `salaries`;

-- Создаём таблицу
CREATE TABLE IF NOT EXISTS `salaries`
(
    `id`     INT AUTO_INCREMENT PRIMARY KEY,
    `name`   VARCHAR(50),
    `salary` INT
);

-- Вставляем тестовые данные
INSERT IGNORE INTO salaries (name, salary)
VALUES ('Anna', 3000),
       ('Bob', 5000),
       ('Cathy', 7000),
       ('David', 10000);

-- Данные:
-- Anna  - 3000
-- Bob   - 5000
-- Cathy - 7000
-- David - 10000

-- ===============================
-- ========== ANY =================
-- ===============================

-- 1. Равно хотя бы одному значению (как IN)
SELECT *
FROM `salaries`
WHERE salary = ANY (SELECT `salary`
                    FROM `salaries`
                    WHERE `salary` IN (3000, 7000));
-- Ожидается: Anna (3000), Cathy (7000)

-- 2. Больше любого (т.е. хотя бы одного значения)
SELECT *
FROM salaries
WHERE salary > ANY (SELECT salary FROM salaries WHERE salary > 0);
-- Ожидается: все сотрудники, кроме Anna (3000) — потому что 3000 > 0 верно, но 3000 не больше никого ещё

-- 3. Меньше любого (т.е. меньше максимального значения)
SELECT *
FROM salaries
WHERE salary < ANY (SELECT salary FROM salaries);
-- Ожидается: все сотрудники, кроме David (10000), так как он не меньше ни одного значения

-- ===============================
-- ========== ALL =================
-- ===============================

-- 4. Равно всем значениям (обычно работает только если в подзапросе 1 элемент)
SELECT *
FROM salaries
WHERE salary = ALL (SELECT salary FROM salaries WHERE salary = 5000);
-- Ожидается: только Bob (5000)

-- 5. Больше всех (т.е. больше максимального)
SELECT *
FROM salaries
WHERE salary > ALL (SELECT salary FROM salaries);
-- Ожидается: пусто (никто не больше самого себя)

-- 6. Меньше всех (т.е. меньше минимального)
SELECT *
FROM salaries
WHERE salary < ALL (SELECT salary FROM salaries);
-- Ожидается: только Anna (3000)

-- ===============================
-- ========== Сравнение =============
-- ===============================

-- 7. > ANY  = больше минимального
SELECT *
FROM salaries
WHERE salary > ANY (SELECT salary FROM salaries);
-- Ожидается: все кроме Anna (3000)

-- 8. > ALL  = больше максимального
SELECT *
FROM salaries
WHERE salary > ALL (SELECT salary FROM salaries);
-- Ожидается: пусто

-- 9. < ANY  = меньше максимального
SELECT *
FROM salaries
WHERE salary < ANY (SELECT salary FROM salaries);
-- Ожидается: все кроме David (10000)

-- 10. < ALL = меньше минимального
SELECT *
FROM salaries
WHERE salary < ALL (SELECT salary FROM salaries);
-- Ожидается: пусто

/*
= ANY → как IN
> ANY → больше минимального
< ANY → меньше максимального
= ALL → совпадает со всеми (обычно 1 значение)
> ALL → больше максимального
< ALL → меньше минимального
 */

#     ALL - hammasi to'g'ri kelishi kerak,
#     ANY - hech bo'lmasa bir donasi to'gri kelishi kerak
# ANY → "хотя бы одно совпадение".
# ALL → "все совпадения".
-- Manager lar orasidagi eng katta maosh oldigan hodim
SELECT *
FROM `employees`.`salaries`
WHERE `salary` > ALL ( -- 3)-odimdagi dan katta bo'lgan hamma yozuvlarni chiqarish
    SELECT `salary` -- 3) salary - maoshlari
    FROM `classicmodels`.`employees` -- 1) classicmodels bazasi, employees jadvalidagi
    WHERE `jobTitle` = 'Manager' -- 2) ustundagi yozuv qiymatlari jobtitle = Manager bo'lganlarning
);

# || va && bilan ALL ANY ni solishtirish
# || va && - bir shart yoki bir nechta shartli ifodalar bilan ishlatiladi
# Найти сотрудников,
# у которых зарплата больше 1000
# и должность "Manager":
SELECT *
FROM `employees`
WHERE `salary` > 1000 && `jobTitle` = 'Manager';


SELECT *
FROM `employees`
WHERE `salary` > 5000 || -- maoshi 5000 dan katta yoki
      `jobTitle` = 'Manager';
-- lavozimi Manager bo'lganlarni filterlash

# ANY va ALL esa odatda subqueries (ichkiso'rov) larda
# ma'lumotlar to'plami bilan solishtirganda ishlatiladi

-- maoshi managerlardan hech bo'lmasa bittasinikidan katta bo'lganlar:
WHERE `salary` > ANY (SELECT `salary` FROM `employees` WHERE `jobTitle` = 'Manager');

-- maoshi managerlarning barchasinikidan katta bo'lganlar
WHERE `salary` > ALL (SELECT `salary` FROM `employees` WHERE `jobTitle` = 'Manager');

/*
🔑 Отличие

|| и && → работают с несколькими условиями в одном запросе.

ANY и ALL → работают с результатом подзапроса (списком значений).

📌 Если проще:

|| и && — это про "логика внутри запроса".

ANY и ALL — это про "сравнение с набором данных из подзапроса".
 */

CREATE TABLE IF NOT EXISTS `employees`
(
    `id`     INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name`   VARCHAR(50),
    `salary` DECIMAL(10, 2)
);

INSERT IGNORE INTO `employees`(`name`, `salary`)
VALUES ('Ali', 1000),
       ('Bek', 2000),
       ('Mahmud', 3000);

SELECT *
FROM `employees`
WHERE `salary` > ANY
      ( -- salary > 1000 yoki salary > 2000 lar (1-qismi true bo'lgani uchun shu joydan tekshirishni to'xtatib natijaga o'tadi!)
          SELECT `salary`
          FROM `employees`
          WHERE `name` IN ('Ali', 'Bek'));
/*
| id | name   | salary  |
| 2  | Bek    | 2000.00 |
| 3  | Mahmud | 3000.00 |
 */

SELECT *
FROM `employees`
WHERE `salary` > ALL ( -- Ali va Bek lardan oyligi katta barchasi
    SELECT `salary`
    FROM `employees`
    WHERE `name` IN ('Ali', 'Bek'));
-- Mahmud 3000 ni qaytaradi, chunki shartdagi hamma qismlar true bo'lishi kerak edi