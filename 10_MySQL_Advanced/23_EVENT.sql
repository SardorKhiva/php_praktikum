/*
MySQL da EVENT - oldindan rejalashtirilgan jadval asosida ishlaydigan vazifadir.

MySQL EVENT bir yoki bir nechta SQL so'rovlarni o'z ichiga olgan obyekt hisoblanadi.
Ular ma'lumotlar bazasida saqlanadi va bir yoki bir necha marta bajarilishi mumkin.

MySQL EVENT SCHEDULER - rejalashtirilgan event larni va ularning bajarilishini, ya'ni
rejaga muvofiq ishlashini ta'minlaydi va ularni boshqaradi.
*/

/*
 EVENT lar reja asosida ishlashi uchun uni yoqish zarur.
 Quyidagi komanda orqali ham yoqish mumkin.
 */

USE test;

SET GLOBAL `event_scheduler` = ON; -- yoqish
SET GLOBAL `event_scheduler` = OFF;
-- o'chirish

/*
        mysql.cnf - mysql sozlamalari faylidan yoqish
event_scheduler = ON
*/

/*
 MySQL EVENT lar ko'p holatlarda juda foydali bo'lishi mumkin,
 masalan ma'lumotlar baza jadvallarini optimallashtirish, loglarni tozalash,
 ma'lumotlarni arxivlash yoki ishlamay qolgan vaqtlarda murakkab
 hisob-kitoblarni bajarish va hokazo.
 */
#                                     EVENT hosil qilish
/*        Qolip:
DELIMITER //
CREATE EVENT `event_nomi`
ON SCHEDULE {ishga_tushish_vaqti} DO
BEGIN
-- event tanasi
END //
DELIMITER ;
*/


# ON SCHEDULE qismida ushbu eventning qachon sodir bo'lish vaqtini ko'rsatamiz.

#                         AT - 1 marta bajariladigan EVENT
/*
 Agar EVENT 1 marta ishga tushishi kerak bo'lsa,
 ishga tushadigan vaqtni quyidagicha ko'rsatamiz:

CREATE EVENT [IF NOT EXISTS] `event_name`
ON SCHEDULE AT TIMESTAMP [+ INTERVAL]
DO
-- event body
 */

# Misol:
ON SCHEDULE AT CURRENT_TIMESTAMP

-- hozirgi vaqtdan, qanchadir vaqt o'tgandan keyin ishga tushadigan event
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL n
[HOUR | MONTH | WEEK | DAY | MINUTE]
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 HOUR

/*
1 marta ishga tushadigan event lar ishga tushgandan keyin avtomatik o'chib ketadi.

O'chib ketmasligi uchun quyidagicha so'rov yoziladi:
 */
CREATE EVENT [IF NOT EXISTS] `event_name`
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL
1 HOUR
ON COMPLETION PRESERVE
DO
-- event body

# Misol:

DROP TABLE course;
CREATE TABLE IF NOT EXISTS `course`
(
    `id`    SERIAL,
    `title` VARCHAR(30),
    `yozilgan_vaqti` DATETIME NOT NULL
);

DROP EVENT event_course_insert;
CREATE EVENT `event_course_insert`
    ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
    ON COMPLETION PRESERVE
    DO
    INSERT INTO `course`(`title`, `yozilgan_vaqti`)
    VALUES ('kurs', NOW());

SELECT *
FROM `course`;


# Yuqoridagi misoldagi event 1 marta ishga tushadi
# va o'chib ketmasdan turaveradi.

SHOW EVENTS;    -- bazadagi EVENT larni ko'rish

#                 EVERY - takrorlanuvchi event

/*
Bir necha marta qayta sodir bo'ladigan EVENT larni
EVERY buyrug'i bilan hosil qilamiz.
 */

EVERY n [HOUR | MONTH | WEEK | DAY | MINUTE | SECOND]

# Misol:
DROP EVENT IF EXISTS `event_course_insert`;
CREATE EVENT `event_course_insert`
  ON SCHEDULE EVERY 1 SECOND
DO
  INSERT INTO `course`(`title`, `yozilgan_vaqti`)
  VALUES ('kurs', NOW());

-- har soniyada `course` jadvaliga ma'lumotlar yozilayotganini ko'rish
SELECT *
FROM `course`;

/*          Belgilangan interval oralig'ida event
START buyrug'i yordamida event qachondan boshlab ishga tushishi kerak va
END buyrug'i yordamida qachon ishlashdan to'xtashi kerakligi yoziladi.
*/

EVERY n [HOUR | MONTH | WEEK | DAY | MINUTE]
STARTS DATE ENDS DATE

# Misol:
DROP EVENT IF EXISTS `event_course_insert_interval`;

CREATE EVENT `event_course_insert_interval`
ON SCHEDULE
  EVERY 1 MINUTE
  STARTS CURRENT_TIMESTAMP
  ENDS CURRENT_TIMESTAMP + INTERVAL 1 HOUR
DO
  INSERT INTO `course`(title, yozilgan_vaqti)
  VALUES ('intervalli event', NOW());

SELECT *
FROM `course`;

# Yana misol:
ON SCHEDULE
  EVERY 1 DAY
  STARTS CURRENT_TIMESTAMP + INTERVAL 1 WEEK
ENDS '2025-03-12 00:00:00'
 DO
  -- EVENT tanasi