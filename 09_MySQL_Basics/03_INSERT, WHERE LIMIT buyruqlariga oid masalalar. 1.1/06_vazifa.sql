# 6)"employees" jadvalidan:
# - (familyasi "Kyoichi" bo'lgan ayollarni)
# va (familyasi "Uma" bo`lgan erkaklarni)
# barchasini 1 ta so`rovda chiqaring

USE `Mashq`;

SELECT *            -- tanlaymiz barcha ustunni
FROM `employees`    -- shu jadvaldan
WHERE `first_name` = 'Kyoichi' -- qaysiki familyasi Kyoichi
  AND `gender` = 'F'           -- va jinsi ayol
  OR `first_name` = 'Uma'      -- yoki familyasi Uma
  AND `gender` = 'M'           -- va jinsi erkak
  ORDER BY `gender`            -- oldin erkaklarni chiqaramiz
  ;     -- aralash chiqarish uchun tepadagi qatorni commentga olinadi