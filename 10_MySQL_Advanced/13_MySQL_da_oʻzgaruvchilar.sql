/*                                 MySQLda o'zgaruvchilar
Mysqlda ham o'zgaruvchilardan foydalanish mumkin.
2 ta yoki undan ortiq SQL so'rovda biror belgilangan
qiymatni yoki so'rov natijasida hosil bo'lgan qiymatni,
boshqa so'rovlarda ham ishlatish imkonini beradi.
Mysql da o'zgaruvchilarni quyidagicha e'lon qilinadi va qiymat beriladi:
*/
USE `mashq`; -- pastadagi jadvallar joylashgan baza

SET @variable_name := `value`;
SET @uzgaruvchi := 1997;

# @ belgisi bilan Mysqlda o'zgaruvchilarni ajratib olish mumkin
# Qiymat berish:

SET @jami := 100;

# SELECT bilan ham qiymat berish mumkin:
SELECT @variable_name := `value`;

# bunda ishlamaydi:
SELECT @variable_name2 = `value`;

-- Select qilib qiymat beramiz
SELECT @buyPrice := `buyprice`  -- @buyPrice o'zgaruvchisi o'zlashtirsin `buyprice` ustunidan
FROM `products`                 -- `products` jadvalidan
WHERE `buyprice` > 95           -- qaysiki `buyprice` ustunidagi qiymatlari 95 dan katta bo'lganlarini
ORDER BY `buyprice`;            -- o'sish tartibida saralab oxirgisini oladi!


# O'zgaruvchini SELECT qilib ko'ramiz
SELECT @buyPrice;           -- `products`.`buyprice` dagi 95 dan katta qiymatlarni o'zida saqlagan o'zgaruvchini chiqarish

# --Yuqoridagi o'zgaruvchini boshqa so'rovlarda ishlatish mumkin
SELECT *
FROM `products`
WHERE `buyPrice` = @buyPrice;