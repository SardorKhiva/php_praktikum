# 3)"employees" jadvalidan:
# 1962 - yilda tug`ilganlarning 15 tasini,
# tug`ilgan kuni ortib borish tartibda saralab,
# tugilgan sanasi, ismi va familyasini chiqaring

# 1992 - yilda ishga kirgan ayollarning
# 20 tasini ismlarini o`sish tartibida chiqaring
# hire_date - ustunida ishga kirgan sanasi haqida
# ma`lumot saqlanadi

SHOW DATABASES;
USE `Mashq`;
SHOW TABLES;
SHOW TABLE STATUS;

SELECT * FROM `employees`;

# 1962 - yilda tug`ilganlarning 15 tasini,
# # tug`ilgan kuni ortib borish tartibda saralab,
# # tugilgan sanasi, ismi va familyasini chiqaring
SELECT  -- ko'rsatilsin
 `birth_date`, `first_name`, `last_name` -- tug'ilgan kuni, ismi va familyasi
FROM `employee` -- employee jadvalining
WHERE `birth_date` -- qaysiki tug'ilgan kunlari ustunlarida
  LIKE '%1962%'    -- orasida 1962 so'zi bo'lsa
ORDER BY (`birth_date`) ASC -- tug'ilgan sanasi o'sish tartibida saralansin
-- ASC - ascending - o'sish buyrug'ini yozish shartmas
LIMIT 15;       -- 15 ta limit (chegara) bilan

# 1992 - yilda ishga kirgan ayollarning
# 20 tasini ismlarini o`sish tartibida chiqaring
# hire_date - ustunida ishga kirgan sanasi haqida
# ma`lumot saqlanadi
SELECT `first_name`     -- first_name ustuni  ko'rsatilsin
FROM `employee`         -- employee jadvalidagi
WHERE `hire_date`       -- qaysiki ishga kirgan vaqti
  LIKE '%1992%'         -- 1992-yil bo'lsa
  AND `gender` = 'F'    -- va jinsi ayol bo'lsa
ORDER BY (`first_name`) -- ismlarini saralansin
LIMIT 20;               -- va 20 ta limit bo'lsin