-- db larni ko'rish
SHOW DATABASES;

# Test ni qo'llash
USE Test;

# Test ichidagi jadvallarni ko'rish
SHOW TABLES;

# 20 ta limitli cars jadvalini ko'rish
SELECT *
FROM cars
LIMIT 20;

# 10 ta limitli cars jadvalini ko'rish
SELECT *
FROM cars
LIMIT 10;

-- ASC - ASCENDING - O'SISH BO'YICHA SARALASH
-- cars jadvalidagi `Год от` ustunini
SELECT *
FROM cars
ORDER BY `Год от`;  -- agar ustun nomidan keyin saralash usuli yozilmasa ASC tanlanadi

SELECT *
FROM cars
ORDER BY `Год от` ASC
LIMIT 10;

-- DESC - DESCENDING - KAMAYISH BO'YICHA SARALASH:
-- cars jadvalidagi `Год от` ustunini kamayish tartibida
SELECT *
FROM cars
ORDER BY `Год от` DESC
LIMIT 10;
-- 10 ta ko'rsatish


-- jamlab saralash
SELECT *
FROM cars
ORDER BY `ID_MARK` DESC,
         `Год от`
LIMIT 10;

# cars jadvalidagi `ID_MARK` ustunini kamayish,
# `Год от` ni ortish tartibida saralash.

# yani, dastlab mashinalar markasi bo'yicha id lari kamayish tartibida tursin,
# keyin shuni ichida eski mashinalarni oldinda tursin.
# keyingi saralashlar oldingi saralashlar ta'sirida bo'ladi