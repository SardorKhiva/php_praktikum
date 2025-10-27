-- ESLATMA: BAZADA MA'LUMOTLAR DOIMAM MAVJUD BO'LMAGANI UCHUN CHIQMAY QOLISHI MUMKIN, KIRITILSA CHIQADI

# 2) "employees" jadvalidan:
# - Erkak jinsdagilarning soni
# - Ayol jinsdagilarning soni chiqaring
# - "Van" familyali erkaklar sonini
# - "Van" ismli ayollar sonini
# - "Van" familyali ayollarning 15 tasini chiqaring
# - "Van" familyali erkaklarning 15 tasini familya va
#   ismini 1 ta ustundam ya`ni "FullName" degan nom bilan chiqaring.
# Yuqoridagilar uchun alohida - alohida so'rovlar yoziladi.
# first_name - familya
# last_name - ism


SHOW DATABASES;
USE Mashq;
SHOW TABLES;

# - Erkak jinsdagilarning soni:
-- demak * o'rniga ustun nomini yozsak ham shu qiymatlar chiqyabdi
SELECT COUNT(*)     -- barcha ustunlardagi sonlariki
FROM `employee`     -- employee jadvalining
WHERE gender = 'M'; -- qaysiki gender = M bo'lganlarini, insi erkak bo'lganlarini ya'ni
# NATIJA: `COUNT(*)`: 169238

# - Ayol jinsdagilarning soni chiqaring:
SELECT COUNT(*)
FROM `employee`
WHERE `gender` = 'F';   -- natija: 112842

# - "Van" familyali erkaklar sonini
SELECT COUNT(`last_name`)   -- first_name ustuni sonida
FROM `employee`              -- employee jadvalidagi
WHERE `last_name` = 'Van'   -- first_name = Van bo'lganlarini va
  AND `gender` = 'M';        -- jinsi erkak bo'lganlarining adadi

# - "Van" ismli ayollar sonini
SELECT COUNT(`first_name`)
FROM `employee`
WHERE `first_name` = 'Van' AND
      `gender` = 'F';

# - "Van" familyali ayollarning 15 tasini chiqaring
SELECT `last_name`
FROM `employee`
WHERE `first_name` = 'Van' AND `gender` = 'F'
LIMIT 15;

# - "Van" familyali erkaklarning 15 tasini familya va
#   ismini 1 ta ustundam ya`ni
#   "FullName" degan nom bilan chiqaring.
SELECT CONCAT(`first_name`, ' ',  `last_name`) AS `Fullname`
FROM `employee`
WHERE `last_name` = 'Van' AND
      `gender` = 'M'
LIMIT 15;