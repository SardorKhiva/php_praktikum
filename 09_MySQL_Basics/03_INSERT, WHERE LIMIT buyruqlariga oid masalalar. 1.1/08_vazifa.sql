# 8)"employees" jadvalidan:
# - ismi "Ja" bilan boshlanadigan
# ayollarning eng yosh 15 tasini chiqaring.
# - familyasi "Lu" bilan boshlanadigan
# erkaklarning eng qari 15 tasini chiqaring

USE `Mashq`;

SELECT *
FROM `employees`
WHERE `last_name` LIKE 'Ja%'
      AND `gender` = 'F'
      ORDER BY YEAR(`birth_date`) DESC
      LIMIT 15;

SELECT *
FROM `employees`
WHERE `first_name` LIKE 'Lu%'
AND `gender` = 'M'
ORDER BY YEAR(`birth_date`)
LIMIT 15;
