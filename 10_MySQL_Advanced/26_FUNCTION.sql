#                             FUNCTION - FUNKSIYA
# Funksiya - 1 ta qiymat qaytaradigan maxsus saqlanadigan dastur.

/*
        funskiyalarga misollar:
   Agregat :
- SUM()
- COUNT()
- MAX()
- MIN()
- AVG()

   DATE:
- YEAR()
- MONTH()
- HOUR()
- DAY()
...
 */

# Funksiya qolipi:

DELIMITER $$

CREATE FUNCTION `function_name`( param_1,
    param_2, ...
) RETURNS datatype
BEGIN
    -- funksiya tanasi, statements
    END $$

DELIMITER ;
/*
  -  function_name - funksiya nomi. Funksiyaga xohlagancha nom berish mumkin.
  -  param_1, param_2 - funksiya parametrlari
  -  RETURNS datatype - funskiya qaytaradigan natijaning ma'lumot turi
 */

USE `classicmodels`;

DELIMITER $$

CREATE FUNCTION CustomerLevel(
    `credit` DECIMAL(10, 2)
) RETURNS VARCHAR(20)

BEGIN
    DECLARE `customerLevel` VARCHAR(20);

    IF (`credit` > 50000) THEN
        SET `customerLevel` = 'PLATINUM';
    ELSEIF (`credit` <= 50000 AND `credit` >= 10000) THEN
        SET `customerLevel` = 'GOLD';
    ELSEIF (`credit` < 10000) THEN
        SET `customerLevel` = 'SILVER';
    END IF;
    RETURN (`customerLevel`);
END$$

DELIMITER ;

# Yuqoridagi funksiyani hosil qilganimizdan keyin uni tekshirib ko'ramiz:
SELECT CustomerLevel(1000000) AS level,
       CustomerLevel(1000)    AS level;

#     SELECT dan funksiyadan foydalanish
SELECT `customerName`,
       CustomerLevel(`creditLimit`)
FROM `customers`
ORDER BY `customerName`;
/*-----------------------------------+------------------------------+
| customerName                       | CustomerLevel(`creditLimit`) |
+------------------------------------+------------------------------+
| Alpha Cognac                       | PLATINUM                     |
| American Souvenirs Inc             | SILVER                       |
| Amica Models & Co.                 | PLATINUM                     |
| ANG Resellers                      | SILVER                       |
| Anna's Decorations, Ltd            | PLATINUM                     |
| Anton Designs, Ltd.                | SILVER                       |
| Asian Shopping Network, Co         | SILVER                       |
| Asian Treasures, Inc.              | SILVER                       |
| Atelier graphique                  | GOLD                         |
| Australian Collectables, Ltd       | PLATINUM                     |
| Australian Collectors, Co.         | PLATINUM                     |
| Australian Gift Network, Co        | PLATINUM                     |
| Auto Associés & Cie.               | PLATINUM                     |
| Auto Canal+ Petit                  | PLATINUM                     |
| Auto-Moto Classics Inc.            | GOLD                         |
| AV Stores, Co.                     | PLATINUM                     |
| Baane Mini Imports                 | PLATINUM                     |
| Bavarian Collectables Imports, Co. | PLATINUM                     |
| BG&E Collectables                  | SILVER                       |
| Blauer See Auto, Co.               | PLATINUM                     |
| Boards & Toys Co.                  | GOLD                         |
| CAF Imports                        | PLATINUM                     |
| Cambridge Collectables Co.         | GOLD                         |
| Canadian Gift Exchange Network     | PLATINUM                     |
| Classic Gift Ideas, Inc            | PLATINUM                     |
| Classic Legends Inc.               | PLATINUM                     |
| Clover Collections, Co.            | PLATINUM                     |
| Collectable Mini Designs Co.       | PLATINUM                     |
| Collectables For Less Inc.         | PLATINUM                     |
| Corporate Gift Ideas Co.           | PLATINUM                     |
| Corrida Auto Replicas, Ltd         | PLATINUM                     |
| Cramer Spezialitäten, Ltd          | SILVER                       |
| Cruz & Sons Co.                    | PLATINUM                     |
| Daedalus Designs Imports           | PLATINUM                     |
| Danish Wholesale Imports           | PLATINUM                     |
| DEDE                               | GOLD                         |
| Der Hund Imports                   | SILVER                       |
| Diecast Classics Inc.              | PLATINUM                     |
| Diecast Collectables               | PLATINUM                     |
| Double Decker Gift Stores, Ltd     | GOLD                         |
| Down Under Souveniers, Inc         | PLATINUM                     |
| Dragon Souveniers, Ltd.            | PLATINUM                     |
| Enaco Distributors                 | PLATINUM                     |
| Euro+ Shopping Channel             | PLATINUM                     |
| Extreme Desk Decorations, Ltd      | PLATINUM                     |
| Feuer Online Stores, Inc           | SILVER                       |
| Franken Gifts, Co                  | SILVER                       |
| Frau da Collezione                 | GOLD                         |
| FunGiftIdeas.com                   | PLATINUM                     |
| Gift Depot Inc.                    | PLATINUM                     |
| Gift Ideas Corp.                   | GOLD                         |
| Gifts4AllAges.com                  | GOLD                         |
| giftsbymail.co.uk                  | PLATINUM                     |
| GiftsForHim.com                    | PLATINUM                     |
| Handji Gifts& Co                   | PLATINUM                     |
| Havel & Zbyszek Co                 | SILVER                       |
| Heintze Collectables               | PLATINUM                     |
| Herkku Gifts                       | PLATINUM                     |
| Iberia Gift Imports, Corp.         | PLATINUM                     |
| Kelly's Gift Shop                  | PLATINUM                     |
| King Kong Collectables, Co.        | PLATINUM                     |
| Kommission Auto                    | SILVER                       |
| L'ordine Souveniers                | PLATINUM                     |
| La Corne D'abondance, Co.          | PLATINUM                     |
| La Rochelle Gifts                  | PLATINUM                     |
| Land of Toys Inc.                  | PLATINUM                     |
| Lisboa Souveniers, Inc             | SILVER                       |
| Lyon Souveniers                    | PLATINUM                     |
| Marseille Mini Autos               | PLATINUM                     |
| Marta's Replicas Co.               | PLATINUM                     |
| Men 'R' US Retailers, Ltd.         | PLATINUM                     |
| Messner Shopping Network           | SILVER                       |
| Microscale Inc.                    | GOLD                         |
| Mini Auto Werke                    | GOLD                         |
| Mini Caravy                        | PLATINUM                     |
| Mini Classics                      | PLATINUM                     |
| Mini Creations Ltd.                | PLATINUM                     |
| Mini Gifts Distributors Ltd.       | PLATINUM                     |
| Mini Wheels Co.                    | PLATINUM                     |
| Mit Vergnügen & Co.                | SILVER                       |
| Motor Mint Distributors Inc.       | PLATINUM                     |
| Muscle Machine Inc                 | PLATINUM                     |
| Natürlich Autos                    | SILVER                       |
| Norway Gifts By Mail, Co.          | PLATINUM                     |
| Online Diecast Creations Co.       | PLATINUM                     |
| Online Mini Collectables           | PLATINUM                     |
| Osaka Souveniers Co.               | PLATINUM                     |
| Oulu Toy Supplies, Inc.            | PLATINUM                     |
| Petit Auto                         | PLATINUM                     |
| Porto Imports Co.                  | SILVER                       |
| Precious Collectables              | SILVER                       |
| Québec Home Shopping Network       | GOLD                         |
| Raanan Stores, Inc                 | SILVER                       |
| Reims Collectables                 | PLATINUM                     |
| Rovelli Gifts                      | PLATINUM                     |
| Royal Canadian Collectables, Ltd.  | PLATINUM                     |
| Royale Belge                       | GOLD                         |
| Salzburg Collectables              | PLATINUM                     |
| SAR Distributors, Co               | SILVER                       |
| Saveley & Henriot, Co.             | PLATINUM                     |
| Scandinavian Gift Ideas            | PLATINUM                     |
| Schuyler Imports                   | SILVER                       |
| Signal Collectibles Ltd.           | PLATINUM                     |
| Signal Gift Stores                 | PLATINUM                     |
| Souveniers And Things Co.          | PLATINUM                     |
| Stuttgart Collectable Exchange     | SILVER                       |
| Stylish Desk Decors, Co.           | PLATINUM                     |
| Suominen Souveniers                | PLATINUM                     |
| Super Scale Inc.                   | PLATINUM                     |
| Technics Stores Inc.               | PLATINUM                     |
| Tekni Collectables Inc.            | GOLD                         |
| The Sharp Gifts Warehouse          | PLATINUM                     |
| Tokyo Collectables, Ltd            | PLATINUM                     |
| Toms Spezialitäten, Ltd            | PLATINUM                     |
| Toys of Finland, Co.               | PLATINUM                     |
| Toys4GrownUps.com                  | PLATINUM                     |
| UK Collectables, Ltd.              | PLATINUM                     |
| Vida Sport, Ltd                    | PLATINUM                     |
| Vitachrome Inc.                    | PLATINUM                     |
| Volvo Model Replicas, Co           | PLATINUM                     |
| Warburg Exchange                   | SILVER                       |
| West Coast Collectables Co.        | PLATINUM                     |
+------------------------------------+------------------------------+
122 rows in set (0.0024 sec)    */

#                 Protsedurada funksiyadan foydalanish
DELIMITER $$

CREATE PROCEDURE getCustomer_Level(
    IN `customerNo` INT,
    OUT `customerLevel` VARCHAR(20)
)
BEGIN
    DECLARE `credit` DEC(10, 2) DEFAULT 0;

    -- customer dan credit limit ni olish
    SELECT `creditLimit`
    INTO `credit`
    FROM `customers`
    WHERE `customerNumber` = `customerNo`;

    -- funksiyani chaqirish
    SET `customerLevel` = customerLevel(credit);
END $$

DELIMITER ;

#         Funksiyani o'chirish:
DROP FUNCTION IF EXISTS `function_name`;

#         Funksiyalar ro'yhati:
SHOW FUNCTION STATUS
    WHERE `db` = 'classicmodels';
/*--------------+---------------+----------+---------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
| Db            | Name          | Type     | Definer | Modified            | Created             | Security_type | Comment | character_set_client | collation_connection | Database Collation |
+---------------+---------------+----------+---------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
| classicmodels | CustomerLevel | FUNCTION | root@%  | 2025-03-11 12:56:48 | 2025-03-11 12:56:48 | DEFINER       |         | utf8mb4              | utf8mb4_0900_ai_ci   | utf8mb4_0900_ai_ci |
+---------------+---------------+----------+---------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
1 row in set (0.0078 sec)    */

#         FUNCTION va PROCEDURE ning farqlari
/*
 1.    Qaytariladigan qiymat
    Funksiya:   Har doim 1 ta qiymat qaytaradi va shu qiymatni SQL so'rovlarida
    (masalan, SELECT ichida) ifoda sifatida ishlatish mumkin.

    Protsedura:    To'g'ridan-to'g'ri qiymat qaytarmaydi. Agar natijalar kerak bo'lsa,
    ular chiqish parametrlar (OUT/INOUT) orqali berilishi yoki
    natija to'plamlari shaklida qaytarishi mumkin.


 2.    Chaqirilish usuli
    Funksiya:    To'g'ridan-to'g'ri SQL ifoda ichida, ya'ni so'rov ichida
    nomini chaqirish orqali foydalaniladi.

    Protsedura:    CALL buyrug'i orqali chaqiriladi
    va SQL so'rov ichida bevosita ishlatilmaydi.


 3.    Parametrlar
    Funksiya:    Faqat IN parametrlarini qabul qiladi.

    Protsedura:    IN, OUT, INOUT parametrlarini qabul qilishi mumkin,
    bu esa bir nechta qiymatlarni uzatish yoki olish imkonini beradi.


 4.    Maqsad va qo'llanish
    Funksiya:    Asosab hisob-kitob, ma'lumotlarni qayta ishlash yoki
    ma'lum bir natijani qaytarish uchun mo'ljallangan.
    Ularni SQL so'rovlarda erkin (xohlagan joyda) ishlatish mumkin.

    Protsedura:    Murakkab ish jarayonlarini (masalan, 1 nechta SQL
    so'rovlarni bajarish, tranzaksiyalarni boshqarish, yoki ma'lumotlarni
    o'zgartirish) amalga oshirish uchun qo'llaniladi.


 5.    Yon ta'sir (Side effects)
    Funksiya:    Odatda ma'lumotlar bazasining holatini o'zgartirishga
    (INSERT, UPDATE, DELETE) yo'l qo'ymaydi - u faqat hisoblash yoki
    o'qish amallari uchun ishlatiladi.

    Protsedura:    Ma'lumotlar bazasinig holatini o'zgartirish
    (jadvaldagi ma'lumotlarni o'zgartirish, tranzaksiyalarni boshqarish)
    uchun erkin qo'llaniladi.


 Masalan, agar biror ifodani hisob-kitob natijasini olish kerak bo'lsa - funksiya,
 agar bir nechta operatsiyalarni ketma-ket bajarish talab qilinsa, protsedura mos keladi.

 */