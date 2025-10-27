#                     Procedure hosil qilish:
# Qolip:
DELIMITER //
CREATE PROCEDURE procedure_nomi(parametrlar)
BEGIN
#     sql so'rovlar
    END //
DELIMITER ;

/*
  CREATE PROCEDURE - komandasidan keyin protseduraga nom beriladi.
protsedura nomidan keyin qavs ichida, protsedura uchun vergul
bilan ajratilgan parametrlar ro'yxati yoziladi.
*/

/*
BEGIN END bloklari orasiga SQL kodlar yoziladi.
END kalit so'zidan keyin protseduraning
tanasini tugatish uchun ajratuvchi belgi -
DELIMITER qo'yiladi, odatda DELIMITER ;
*/

# PROCEDURE ni ishga tushirish:
CALL `saqlangan_procedure_nomi`(`argumentlar`);

# PROCEDURE ni o'chirish:
DROP PROCEDURE [IF EXISTS] `procedure_nomi`;