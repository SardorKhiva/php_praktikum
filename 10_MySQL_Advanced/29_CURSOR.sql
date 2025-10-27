#                         CURSOR
/*
  Saqlangan protsedura ichida natijalar to'plamini boshqarish uchun CURSOR dan foydalaniladi.
  CURSOR - so'rov orqali qaytarilgan natijalar ustida alohida-alohida amallar bajarishga imkon beradi.
*/

#         DECLARE CURSOR  -  CURSOR ni e'lon qilish
DECLARE `cursor_name`
  CURSOR FOR
         `SELECT_statements`;       -- ustunni SELECT qilish

/*
  Select qilib kerakli bo'lgan ma'lumotlarni olib
  biror nom ostida vaqtincha saqlab turish uchun
  CURSOR dan foydalanamiz.
 */

#             OPEN  -  CURSOR ni ochish
# OPEN `cursor_name`;

-- natijalardan foydalanish uchun CURSOR ni OPEN buyrug'i orqali ochish zarur.

DELIMITER $$
DROP PROCEDURE IF EXISTS `cursorDemo`;
CREATE PROCEDURE `cursorDemo`()
BEGIN

    DECLARE `finished` INTEGER DEFAULT 0;
    DECLARE `emailAddress` VARCHAR(100) DEFAULT "";

    -- DECLARE CURSOR for employee email
    -- hodimlar elektorn pochtalari uchun CURSOR e'lon qilish
    DECLARE `curEmail` CURSOR FOR
        SELECT `email`
        FROM `employees`;

    -- DECLARE NOT FOUND HANDLER
    -- emaillar bo'lmasa 1 qiymatni beruvchi HANDLER ni e'lon qilish
    DECLARE CONTINUE HANDLER
        FOR NOT FOUND
        SET `finished` = 1;

    OPEN `curEmail`;
END $$

DELIMITER ;

#         FETCH - CURSOR dan olish
/*
  OPEN orqali CURSOR ni ochganimizdan keyin,
  CURSOR dagi natijalarni FETCH orqali alohida-
  alohida qator qilib olib undan foydalanish mumkin.
*/

DELIMITER %%
DROP PROCEDURE `cursor_get_emails`;
CREATE PROCEDURE IF NOT EXISTS `cursor_get_emails`()
BEGIN

    FETCH `cursor_name`
        INTO `variables_list`;

    getEmail:
    LOOP
        FETCH `curEmail`
            INTO `emailAddress`;
        IF `finished` = 1 THEN
            LEAVE `getEmail`;
        END IF;

        -- build email list
        SET `emailList` = CONCAT(`emailAddress`, " : ", `emailList`);
    END LOOP getEmail;
END %%

DELIMITER ;

#         CLOSE - CURSOR ni yopish
/*
  CLOSE - buyrug'i orqali CURSOR dan foydalanib
  bo'lganimizdan keyin uni yopish mumkin.
  Agarda CURSOR boshqa ishlatilmaydigan bo'lsa,
  CLOSE qilib yopish zarur.:
     CLOSE `cursor_name`;
 */


#           Misol:
USE `classicmodels`;

DELIMITER %%
CREATE PROCEDURE `createEmailsList`(
    INOUT `emailList` VARCHAR(4000)
)
BEGIN
    DECLARE `finished` INT DEFAULT 0;
    DECLARE `emailAddress` VARCHAR(100) DEFAULT "";

-- declare cursor for employee email
    DECLARE `curEmail`
        CURSOR FOR
        SELECT `email`
        FROM `employees`;

-- declare not found handler
    DECLARE CONTINUE HANDLER
        FOR NOT FOUND
        SET `finished` = 1;

    OPEN `curEmail`;

    `getEmail`:
    LOOP
        FETCH `curEmail` INTO `emailAddress`;

        IF `finished` = 1 THEN
            LEAVE `getEmail`;
        END IF;

-- build email list
        SET `emailList` = CONCAT(`emailAddress`, " : ", `emailList`);
    END LOOP `getEmail`;
    CLOSE `curEmail`;
END %%

DELIMITER ;

SET @emailList = "";
CALL createEmailSList(@emailList);
SELECT @emailList;

# Natija:
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| mgerard@classicmodelcars.com : ykato@classicmodelcars.com : mnishi@classicmodelcars.com : tking@classicmodelcars.com : pmarsh@classicmodelcars.com : afixter@classicmodelcars.com : bjones@classicmodelcars.com : lbott@classicmodelcars.com : pcastillo@classicmodelcars.com : ghernande@classicmodelcars.com : lbondur@classicmodelcars.com : gvanauf@classicmodelcars.com : ftseng@classicmodelcars.com : spatterson@classiccars.com : jfirrelli@classiccars.com : lthompson@classicmodelcars.com : ljennings@classicmodelcars.com : abow@classicmodelcars.com : gbondur@classicmodelcars.com : wpatterson@classicmodelcars.com : jfirrelli@classicmodelcars.com : mpatterso@classicmodelcars.com : dmurphy@classicmodelcars.com :  |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

