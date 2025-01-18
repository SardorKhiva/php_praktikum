# 4-masala:
# "employees" jadvalidan:
# - "Van" familyali erkaklar orasidan,
# emp_no qiymati 10000 va 30000 ni
# orasida yotganlarni chiqaring
SHOW DATABASES;
USE `Mashq`;
SHOW TABLES;

SELECT * FROM `employees` LIMIT 10;
# SELECT COUNT(*) FROM `employees`;   -- 300 024 ta satr

SELECT *            -- hamma ustunlar tanlab
FROM `employees`    -- employees jadvalidan
WHERE `emp_no`      -- qaysiki emp_no ustunidagi
 BETWEEN 10000 AND 30000 -- 10000 va 30000 qiymatlilari
 AND `first_name` = 'Van' -- va familyasi Van bo'lgan
 AND `gender` = 'M';      -- va jinsi erkak bo'lganlar ko'rsatilsin

# - "Van" familyali ayollar orasidan,
# 1962- yilda tug`ilganlarni chiqaring
SELECT *
FROM `employees`
WHERE `last_name` LIKE 'Van'
AND `gender` = 'F'
AND YEAR(`birth_date`) = 1962;

/*
emp_no  birth_date  first_name  last_name   gender  hire_date
*/