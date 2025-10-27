#  LIMIT orqali kerakli miqdorda yozuvlarni jadvaldan olish mumkin.
# Qolip:
SELECT `kerakli_ustunlar`
FROM `jadval_nomi`
LIMIT offset, row_count; -- offset - nechanchi yozuvdan boshlab
-- row_count - nechta qator yozuv kerakligi

SHOW DATABASES;
USE `classicmodels`;
SHOW TABLES;

SELECT *
FROM `customers`; -- 122 ta yozuv chiqdi

SELECT *
FROM `customers`
LIMIT 10;   -- 10 ta qator chiqarish

SELECT *
FROM `customers`
LIMIT 5, 10;    -- 5-qatordan boshlab 10 ta qatorni tanlab chiqarish