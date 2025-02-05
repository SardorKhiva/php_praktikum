/*                                Protsedurada o'zgaruvchilar
Protsedurani ichida o'zgaruvchilar hosil qilib,
ularga qiymat berib ulardan foydalanishimiz mumkin.
Protsedurani ichida o'zgaruvchini e'lon qilish uchun
DECLARE kalit so'zidan foydalaniladi.
*/

DECLARE `uzgaruvchi_nomi` DATATYPE(size) [DEFAULT boshlangich_qiymat];


# Xuddi yangi jadval hosil qilganda,
# ustunlarni nomlash va turlarini ko`rsatgandagidek,
# o`zgaruvchilarni ham xuddi shunday e'lon qilinadi.
# Misollar:
DECLARE `totalSale` DEC(10,2) DEFAULT 0.0;
DECLARE `x`, `y` INT DEFAULT 0;

# O'zgaruvchiga qiymat berish
SET `variable_name` = value;


DECLARE `total` INT DEFAULT 0;
SET `total` = 10;

# Yuqoridagi misolda `total` nomli o'zgaruvchiga 10 qiymati berildi.
# O'zgaruvchiga SELECT INTO bilan ham qiymat berish mumkin.
DECLARE `soni` INT DEFAULT 0;

SELECT COUNT(*), `firstName`
INTO `soni`, `firstname`
FROM `products`;

# Bu o'zgaruvchilardan faqatgina protsedurani ichidagina foydalanish mumkin.
# END tugash buyrug'i berilgandan keyin bu o'zgaruvchilarni ishlatish imkoni mavjud emas.
SELECT COUNT(*)
FROM `orders`; -- 326 ta qator bor

DELIMITER $$

DROP PROCEDURE IF EXISTS `GetTotalOrder`;
CREATE PROCEDURE IF NOT EXISTS `GetTotalOrder`()
BEGIN
    DECLARE `totalOrder` INT DEFAULT 0;

    SELECT COUNT(*)
    INTO `totalOrder`
    FROM `orders`;

    SELECT `totalOrder`;
END$$
DELIMITER ;


# Yuroqidagi protsedurani ishlashini tahlil qilamiz:
# `totalOrder` nomli o'zgaruvchi e'lon qildik va
# boshlang'ich qiymatiga 0 berdik.
# Bu o'zgaruvchi products jadvalida jami nechta order
# yani buyurtma bo'lganini sonini COUNT() funksiyasi yordamida aniqlab,
# chiqqani natijani  `totalOrder` nomli o'zgaruvchida ushlab turish uchun  kerak
DECLARE `totalOrder` INT DEFAULT 0;

# SELECT INTO bilan chiqqan natijani totalOrder o'zgaruvchiga beramiz
SELECT COUNT(*)
INTO `totalOrder`
FROM `orders`;

SELECT `totalOrder`;
-- bilan o'zgaruvchini select qilamiz.

#     Endi bu protsedurani chaqirib ishga tushiramiz:
CALL `GetTotalOrder`();

/* Natija:
+------------+
| totalOrder |
+------------+
|        326 |
+-----------*/


DROP PROCEDURE IF EXISTS `test`;
DELIMITER ::
CREATE PROCEDURE IF NOT EXISTS `test`()
BEGIN
    DECLARE `pi1` DOUBLE; -- o'zgaruvchini nomi va tipi bilan e'lon qilish
    DECLARE `pi2` DOUBLE;

    SELECT 3.14151 INTO `pi1`; -- `pi1` ga qiymat berish
    SET `pi2` = 3.1415; -- `pi2` ga qiymat berish

    SELECT `pi1`, `pi2`;
END ::
DELIMITER ;

CALL test();