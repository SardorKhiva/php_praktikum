/*               LOOP
LOOP - 1 yoki 1 nechta takrorlanuvchi amallarni bajarish uchun ishlatiladi.
Qolip:
[label:] LOOP   -- label - loop ismi
    statement_list  -- amallar ro'yhati
END LOOP [label]

Sikl tanasi necha marta takrorlanishini bilmasanggiz LOOP dan foydalaning.
label - LOOP uchun nom. Bu nomni LOOP ni boshida, tanasida va oxirida ishlatiladi.
LEAVE yoki RETURN buyrug'i bilan LOOP ni to'xtatish yoki chiqib ketish mumkin

[sikl_nomi:] LOOP
    ...
    --- sikldan chiqib ketish
    IF condition THEN
        LEAVE [sikl_nomi];
    END IF;
    ...
END LOOP;
LEAVE xuddi PHP da BREAK ga o'xshaydi.
Odatda LOOP ning tanasida, amallar albatta shartlar asosida takror bajariladi
yoki bajarishdan to'xtaydi. Ya'ni LOOP ni ichida
*/
USE `test`;

DROP PROCEDURE IF EXISTS loopDemo1; -- agar protsedura bor bo'lsa o'chirilsin
DELIMITER //                        -- ajratuvchini shu belgiga almashtirish
CREATE PROCEDURE loopDemo1()        -- protsedura hosil qilish
BEGIN                               -- protsedura boshlanishi
    DECLARE x INT;                  -- protsedura ichida int tipli x o'zgaruvchi hosil qilish
    DECLARE str VARCHAR(255);       -- string tipli o'zgaruvchi hosil qilish

    SET x = 1;                      -- x ga 1 qiymatini berish
    SET str = '';                   -- str ga bo'shliq berish

    loop_label:                     -- LOOP ni nomlash
    LOOP                            -- LOOP boshi
        IF x > 10 THEN              -- agar x katta bo'lsa 10 dan
            LEAVE loop_label;       -- shu nomli LOOP dan siklni to'xtatib chiqib ketsin
        END IF;                     -- if tugashi

        SET x = x + 1;              -- x++
        IF (x MOD 2) THEN           -- agar x % 2 == 1 bo'lsa
            ITERATE loop_label;     -- ITERATE = CONTINUE
        ELSE                        -- aks holda
            SET str = CONCAT(str, x, ','); -- str ga x ni qo'shib (concat) borsin
        END IF;                     -- if tugashi
    END LOOP loop_label;            -- loop_label nomli LOOP ning tugashi
    SELECT str;                     -- str ni chiqarish
END//                               -- protseduraning tugashi
DELIMITER ;                         -- ajratuvchi belgini standart ; ga almashtirish

CALL loopDemo1();                   -- protsedurani chaqirish

