# 7)"employees" jadvalidan:
# - 1959 - yilda tug`ilgan,
# (familyasi "Kyoichi" bo`lgan ayollarni)
# va (familyasi "Uma" bo`lgan erkaklarni)
# barchasini 1 ta so`rovda chiqaring

USE `Mashq`;

SELECT *
FROM `employees`;

SELECT  *
FROM         `employees`
WHERE        `first_name`  = 'Kyoichi'
    AND      `gender`      = 'F'
    AND YEAR(`birth_date`) = 1959
 OR          `first_name`  = 'Uma'
    AND      `gender`      = 'M'
    AND YEAR(`birth_date`) = 1959
    ORDER BY `gender`;