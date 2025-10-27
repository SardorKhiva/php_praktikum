#                   TRIGGER
/*
  TRIGGER - jadvalda INSERT, UPDATE, yoki DELETE kabi buyruqlar bajarilganda avtomatik ravishda chaqiriladigan saqlangan dastur(protsedura)dir.

  Ma'lum bir hodisa yuz berganda bajariladi.

  Masalan, yangi satr qo'shilganda (INSERT), satr yangilanganda(UPDATE),
  satr o'chirilganda (DELETE).

*/

#       CREATE TRIGGER
# Umumiy qolip:
CREATE TRIGGER trigger_name {trigger_time} {trigger_event}
     ON table_name FOR EACH ROW
     trigger_body;

/*
- trigger_name - trigger nomi
- trigger_time - triggerning qaysi paytda ishga tushishi.
BEFORE (oldin) AFTER (keyin) dan birisi bo'lishi mumkin.
- trigger_event - triggerning qaysi hodisadan keyin ishga tushishi.
INSERT, UPDATE, DELETE qiymatlaridan birisi bo'lishi mumkin.

- table_name - jadval nomi
- trigger_body - triggerning tana qismi
*/

#         INSERT qilishdan oldin ishga tushadigan trigger (BEFORE INSERT):
CREATE TRIGGER `trigger_name`
    BEFORE INSERT
    ON `table_name`
    FOR EACH ROW
    `trigger_body`;

#        INSERT qilingandan keyin ishga tushadigan trigger (AFTER INSERT):
CREATE TRIGGER `trigger_name`
    AFTER INSERT
    ON `table_name`
    FOR EACH ROW
    `tirgger_body`;

#               OLD va NEW
/*
OLD - eski
NEW - yangi

Misol:
Bazada customerNumber = 123 bo'lgan satr bor,
shu satrda firstName = 'Harry' bo'lgan yozuv bor.
firstName ni yangilaymiz. UPDATE orqali bunday so'rov yoziladi:
*/
SHOW DATABASES;
USE `classicmodels`;
SHOW TABLES;
DESC `customers`;

SELECT *
FROM `customers`
WHERE `customerNumber` = 121; /*
+----------------+--------------------+-----------------+------------------+------------+------------------------+--------------+---------+-------+------------+---------+------------------------+-------------+
| customerNumber | customerName       | contactLastName | contactFirstName | phone      | addressLine1           | addressLine2 | city    | state | postalCode | country | salesRepEmployeeNumber | creditLimit |
+----------------+--------------------+-----------------+------------------+------------+------------------------+--------------+---------+-------+------------+---------+------------------------+-------------+
|            121 | Baane Mini Imports | Bergulfsen      | Jonas            | 07-98 9555 | Erling Skakkes gate 78 | NULL         | Stavern | NULL  | 4110       | Norway  |                   1504 |    81700.00 |
+----------------+--------------------+-----------------+------------------+------------+------------------------+--------------+---------+-------+------------+---------+------------------------+-------------+
1 row in set (0.00 sec) */

UPDATE `customers`
SET `contactFirstName` = 'Sardor'
WHERE `customerNumber` = 121;

/*
Bu maydonnning eski qiymati 'Jonas' edi.
Eski qatorni ma'lumotlariga OLD kalit so'zi yordamida
murojaat qilish mumkin.

NEW bilan bo'lsa, UPDATE bo'lgandan keyingi yangi qiymatli qatordagi ma'lumotlarga murojaat qilish mumkin.
*/

#                     OLD || NEW
/*
Trigger event:     OLD:        NEW:
INSERT             No          Yes
UPDATE             Yes         Yes
DELETE             Yes         No
*/
/*
Misol:  Yangi jadval hosil qilamiz. `orderdetails` jadvalidan
biror qator o'chirilsa shuni `log_od` jadvaliga yozib boradigan trigger
hosil qilamiz:
*/
CREATE TABLE `log_od`
(
    `id`              INT AUTO_INCREMENT PRIMARY KEY,
    `orderNumber`     INT(11) NOT NULL,
    `productCode`     VARCHAR(15),
    `quantityOrdered` INT(11),
    `priceEach`       DECIMAL(10, 2),
    `deleted_ad`      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

# Trigger hosil qilish:
CREATE TRIGGER `orderdetails_trigger`
    AFTER DELETE
    ON `orderdetails`
    FOR EACH ROW
    INSERT INTO `log_od`(`orderNumber`, `productCode`, `quantityOrdered`, `priceEach`, `deleted_ad`)
    VALUES (old.orderNumber, old.productCode, old.quantityOrdered, old.priceEach);

# Trigger hosil qilinganidan keyin `orderdetails` jadvalidan biror qatorni DELETE qilamiz (o'chiramiz).
# DELETE qilingandan keyin `log_od` jadvalni SELECT qilinsa `orderdetails` da o'chirilgan ma'lumotlar paydo bo'ladi.

#             TRIGGER lar ro'yhati:
SHOW TRIGGERS;

#             TRIGGER ni o'chirish:
DROP TRIGGER [IF EXISTS] trigger_name;