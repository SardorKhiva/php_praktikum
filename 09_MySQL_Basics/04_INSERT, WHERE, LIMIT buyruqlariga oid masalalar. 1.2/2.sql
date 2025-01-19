# 2)"customer" jadvalidan:
# -Amerikalik bo`lmagan barcha mijozlarni
# ro`yxatini chiqaring(3 xil usulda)

SHOW DATABASES;
USE `Mashq`;
SHOW TABLES;

# to'liq jadval
SELECT *
FROM `customers`;

# 1-usul
# mamlakat USA bo'lmasa
SELECT *
FROM `customers`
WHERE `country` != 'USA';

# 2-usul
# mamlakat USA bo'lmasa, <> eskiroq sintaksis
SELECT *
FROM `customers`
WHERE country <> 'USA';

# 3-usul
# country = USA ni inkori
SELECT *
FROM `customers`
WHERE NOT (`country` = 'USA');

# 4-usul
# 1-va 2- variantlarni so'z bilan ifodalangan varianti
SELECT *
FROM `customers`
WHERE `country` NOT IN ('USA');

# 5-usul
# mamlakat ustunida USA borligini inkori
SELECT *
FROM `customers`
WHERE `country` NOT LIKE 'USA';




# -Amerikalik va Fransiyalik bo`lgan
# mijozlarni ro`yxatini chiqaring(3 xil usulda)

SELECT *                 -- tanlaymiz
FROM `customers`         -- shu jadvaldan
WHERE `country` = 'USA'  -- qaysiki davlat Amerika bo'lsa
OR `country` = 'France'; -- yoki davlat Fransiya bo'lsa

SELECT *
FROM `customers`
WHERE `country`
LIKE 'USA'                  -- country ustunida USA
OR `country` LIKE 'France'; -- yoki country ustunida France bo'lsa

SELECT *
FROM `customers`
WHERE `country`
IN ('USA', 'France');       -- tepadagini jamlangani in - ichida

SELECT *
FROM `customers`
WHERE (`country` = 'USA'
OR `country` = 'France');

SELECT *
FROM `customers`
WHERE
 CASE
  WHEN
   `country` = 'USA' OR
   `country` = 'France'
    THEN 1
  ELSE 0
END = 1;

SELECT *
FROM `customers`
WHERE
    CASE
     WHEN `country` IN ('USA', 'France')
     THEN 1
END = 1;



/*
customers jadvali ustunlari:
customerNumber
customerName
contactLastName
contactFirstName
phone
addressLine1
addressLine2
city
state
postalCode
country
salesRepEmployeeNumber
creditLimit
*/