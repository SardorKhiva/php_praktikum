# "orderdetails" jadvalidan:
# 9) 1000 dan oshiq zakaz qilingan
# produktlarni codini chiqaring
# va nechta zakaz qilingan sonini chiqaring
USE `mashq`;
SELECT *
FROM `orderdetails`
LIMIT 10;

# SELECT `productCode` AS 'mahsulot kodi',
# COUNT(*) AS 'buyurtmalar soni'
# FROM `orderdetails`
# GROUP BY `productCode`,
#          `orderNumber`
# HAVING COUNT(`orderNumber`) < 1000
# ;