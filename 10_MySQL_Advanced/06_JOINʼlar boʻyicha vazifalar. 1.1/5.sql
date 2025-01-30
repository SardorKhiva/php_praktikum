/*  5-masala
"orderdetails" jadvalidan, orderNumberi,
qachon buyurtma qilgan sanasi,
yetkazilgan sana, orderning holati,
productCode, produktning nomi,
producktVendori, nechta zakaz qilingan soni,
har birining narxini chiqaring  */

USE `mashq`;

DESC `orderdetails`; /*
| orderNumber |
| productCode |
| quantityOrdered |
| priceEach |
| orderLineNumber | */

DESC `orders`; /*
| orderNumber |
| orderDate |
| requiredDate |
| shippedDate |
| status |
| comments |
| customerNumber | */

SELECT `od`.`orderNumber`     'hujjat_raqami',
       `o`.`orderDate`        'hujjat_sanasi',
       `o`.`shippedDate`      'yetkazilgan_vaqti',
       `o`.`status`           'holati',
       `od`.`productCode`     'mahsulot_kodi',
       `p`.`productName`      'mahsulot_nomi',
       `p`.`productVendor`    'yetkazib_beruvchi',
       `od`.`quantityOrdered` 'buyurtmalar_soni',
       `p`.`MSRP`             'narhi'
FROM `orderdetails` `od`
         JOIN `orders` `o`
              ON `od`.`orderNumber` = `o`.`orderNumber`
         JOIN `products` `p`
              ON `od`.`productCode` = `p`.`productCode`
ORDER BY `hujjat_raqami`,
         `hujjat_sanasi`,
         `mahsulot_nomi`;
