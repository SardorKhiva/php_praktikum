/* 6-masala:
"customers" jadvalidan,
141 nomerli mijozning ismi familyasi,
uning barcha yetkazilib berilgan buyurtmalarinining,
buyurtma qilingan sanasi va yetkazilgan sanasini,
buyurtma qilgan maxsulotning nomi,
maxsulotning kodi, nechta zakaz qilgani va
har birini qanchadan sotilganini aniqlang */
USE `mashq`;

SELECT `c`.`customerNumber`,
       CONCAT(`c`.`contactFirstName`, ' ', `c`.`contactLastName`) 'ism_familyasi',
       `o`.`orderDate`                                            'hujjat_sanasi',
       `o`.`shippedDate`                                          'yetkazilgan_sana',
       `p`.`productName`                                          'mahsulot_nomi',
       `p`.`productCode`                                          'mahsulot_kodi',
       `od`.`quantityOrdered`                                     'buyurtmalar_soni',
       `p`.`MSRP`                                                 'narhi'
FROM `customers` `c`
         JOIN `orders` `o`
              ON `c`.`customerNumber` = `o`.`customerNumber`
         JOIN `orderdetails` `od`
              ON `o`.`orderNumber` = `od`.`orderNumber`
         JOIN `products` `p`
              on od.productCode = p.productCode
WHERE `c`.`customerNumber` = 141
  AND `status` = 'Shipped';