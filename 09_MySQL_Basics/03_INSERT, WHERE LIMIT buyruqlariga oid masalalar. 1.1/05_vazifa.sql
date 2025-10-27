# 5)"salaries" jadvalidan:
# - berilgan emp_no va
# berilgan sananing qiymati bo'yicha,
# ushbu employee berilgan sanada
# qanday "salary" olganini chiqaring.
# Misol uchun:
# berilgan sana : "2001-12-31"
# emp_no: 499966

# MASALA SHARTI NOANIQ USULDA YOZILGAN

SHOW DATABASES;
USE `Mashq`;
SHOW TABLES;

SELECT * FROM `salaries` limit 10;

SELECT *
FROM   `salaries`
WHERE
#     `from_date` = '2001-12-31' AND
# ORDER BY `emp_no` DESC; -- 499966 yo'qligini tekshirish, yo'q ekan
  `emp_no`    = 499966;