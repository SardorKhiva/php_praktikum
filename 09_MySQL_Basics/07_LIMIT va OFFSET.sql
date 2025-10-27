# LIMIT - kerakli adadda satrlarni chiqarish
SHOW DATABASES;
USE `Mashq`;
SHOW TABLES;

# 4386 ta ustuni bor barcha avtomobillar hadiqa bazani ko'rish'
SELECT * FROM cars;

-- boshidan boshlab 10 ta satr ko'rish:
SELECT * FROM cars LIMIT 10;

-- boshidan 5 ta satr tashlab (OFFSET) 20 ta satrni ko'rish:
SELECT * FROM cars LIMIT 5, 10;

-- agar WHERE buyrug'i bo'lsa LIMIT oxirda yoziladi:
SELECT * FROM cars WHERE Страна LIKE 'Узбекистан' LIMIT 2;