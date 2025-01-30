/* 4-masala
"orderdetails" jadvalidan, orderNumber i,
qachon buyurtma qilgan sanasi,
buyurtma holati va orderdetails jadvalidagi
qolgan barcha ustunlari bilan chiqaring */
use mashq;
SELECT DISTINCT `o`.`orderNumber` AS 'hujjat raqami',
                `o`.`orderDate`      'hujjat sanasi',
                `o`.`status`,
                `od`.* -- `orderdatails` barcha jadvallari
FROM `orderdetails` `od`
/*LEFT*/
    JOIN `orders` `o`
ON `o`.`orderNumber` = `od`.`orderNumber`;