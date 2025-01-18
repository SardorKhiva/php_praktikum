# 9)"employees" jadvalidan:
# A) Familyasi 4 ta harfdan
# tashkil topgan erkaklar sonini aniqlang

# B) Familyasi "S" bilan boshlanadigan
# ayollar sonini aniqlang

# C) -Familyasi "S" bilan boshlanadigan,
# Ismi esa 'r' bilan tugaydigan
# erkaklar sonini aniqlang

USE `Mashq`;

# A:
SELECT COUNT(*) AS "Familyasi 4 ta harfli erkaklar soni"
FROM `employees`
WHERE CHAR_LENGTH(`first_name`) = 4
AND `gender` = 'M';

# B:
SELECT COUNT(*) AS "Familyasi S bilan boshlanadigan ayollar soni"
FROM `employees`
WHERE `gender` = 'F'
AND `first_name` LIKE 'S%';