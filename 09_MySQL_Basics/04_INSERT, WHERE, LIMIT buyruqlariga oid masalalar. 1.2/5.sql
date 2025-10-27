# 5)"customers" jadvalidan:
# - faqat 2-adresi ko`rsatilgan
# klientlarni chiqaring
USE `Mashq`;
SELECT * FROM `customers`;

SELECT *
FROM `customers`
# WHERE `addressLine2` != 'null'    -- 1-usul
# WHERE `addressLine2` IS NOT NULL  -- 2-usul
# WHERE `addressLine2` <> 'NULL'    -- 3-usul
# WHERE `addressLine2` NOT LIKE 'NULL' -- 4-usul
# WHERE `addressLine2` LIKE '%'     -- 5-usul
WHERE CHARACTER_LENGTH(`addressLine2`) > 0; -- 6-usul

# - 2-adresi ko`rsatilmagan
# klientlarni chiqaring
SELECT *
FROM `customers`
WHERE `addressLine2` = 'NULL'       -- 1-usul
# WHERE `addressLine2` IS NULL;     -- 2-usul


/*
"customers" jadvali tuzilishi:
customerNumber   - Mijozning unikal identifikatsiya raqami
customerName     - Mijozning yoki kompaniyaning nomi
contactLastName  - Contactning familiyasi
contactFirstName - Conctactning ismi
phone            - Mijozning telefoni
addressLine1     - mijozning asosiy manzili
addressLine2     - mijozning keyingi manzili
city             - shahar nomi
state            - viloyat yoki shtat nomi
postalCode       - pochta indeksi
country          - mijoz yashaydigan davlat
salesRepEmployeeNumber -  Mijoz bilan ishlaydigan xodimning raqami
creditLimit      -  Mijoz uchun belgilangan kredit limiti
 */