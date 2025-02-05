/*  DB struktura qilish. Quizapp loyihasi DBsi.
Foydalanuvchilar test ishlashi
mumkin bo'lgan loyihaning
db strukturasini ishlab chiqish. */
DROP DATABASE IF EXISTS `QuizAppLite`;
CREATE DATABASE IF NOT EXISTS `QuizAppLite`;
USE `QuizAppLite`;

/*Foydalanuvchi haqida ma'lumotlar bo'lsin.
Foydalanuvchi login parolini yozib saytga kiradi
va kerakli fanni tanlab test ishlashni boshlaydi.
*/
CREATE TABLE IF NOT EXISTS `fanlar`
(
    `id`              INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "maksimum 255 ta fan",
    `fan_nomi`        VARCHAR(100)     NOT NULL UNIQUE,
    `testlar_soni`    TINYINT UNSIGNED NOT NULL DEFAULT 25,
    `variantlar_soni` TINYINT UNSIGNED NOT NULL DEFAULT 2
);

CREATE TABLE IF NOT EXISTS `foydalanuvchilar`
(
    `id`     INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `ismi`   VARCHAR(100)     NOT NULL UNIQUE,
    `parol`  VARCHAR(255)     NOT NULL UNIQUE,
    `start`  DATETIME DEFAULT NOW() COMMENT "foydalanuvchining testni boshlagan sana va vaqti",
    `fan_id` INT UNSIGNED NOT NULL COMMENT "qaysi fandan test topshiriladi",
    FOREIGN KEY (`fan_id`) REFERENCES `fanlar` (`id`) ON UPDATE CASCADE
);

#     TEST SAVOLLARI
CREATE TABLE IF NOT EXISTS `test_savollari`
(
    `id`       INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `fan_id`   INT UNSIGNED NOT NULL,
    `savol_id` INT UNSIGNED NOT NULL,
    FOREIGN KEY (`fan_id`) REFERENCES `fanlar` (`id`) ON UPDATE CASCADE
);

#     TEST JAVOB VARIANTLARI
CREATE TABLE IF NOT EXISTS `test_javoblari`
(
    `id`         INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `test_id`    INT UNSIGNED NOT NULL COMMENT "qaysi testga oidligi",
    `correct`    BOOLEAN      NOT NULL,
    `variantlar` TEXT         NOT NULL COMMENT "variantlar matni",
    FOREIGN KEY (`test_id`) REFERENCES `test_savollari` (`id`) ON UPDATE CASCADE
);

#     TEST NATIJALARI
CREATE TABLE IF NOT EXISTS `test_natijalari`
(
    `id`               INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `test_id`          INT UNSIGNED NOT NULL COMMENT "qaysi testni ishlagani",
    `javob_variant_id` INT UNSIGNED NOT NULL,
    `correct`          BOOLEAN      NOT NULL COMMENT "bergan javobi xato/to'g'riligi",
    FOREIGN KEY (`test_id`) REFERENCES `test_savollari` (`id`) ON UPDATE RESTRICT,
    FOREIGN KEY (`javob_variant_id`) REFERENCES `test_javoblari` (`id`) ON UPDATE RESTRICT
);

/*
Masalan Matematikadan 25 ta test ishlaydi deylik.

Testlar hammasi bazada saqlanadi,
tanlashi mumkin bo'lgan variantlar ham bazada saqlanadi.

1 ta testdan 2 ta variant bo'lishi mumkin,
4 ta bo'lishi mumkin ba'zilarida
5 ta variant ham bo'lishi mumkin.

Masalan:

2 + 2 = ? Ushbu ifodani hisoblab natijani toping.
A) 5
B) 3
C) 4

12 - 2 = ? Ushbu ifodani hisoblab natijani toping.
A) 5
B) 3
C) 4
D) 10



Test boshlagan vaqti va tugagan
vaqtini saqlab borish kerak.

Foydalanuvchi qaysi testlarni ishlagani
haqida ham bazaga  yozib borish kerak

qaysi testni to'g'ri yechdi,
qaysilarini noto'g'ri yechgani
haqida ham yozib borish kerak


DB strukturasini dbdiagram.io saytida bajarib linkini yuboring  */

DROP DATABASE `QuizAppFull`;
CREATE DATABASE IF NOT EXISTS `QuizAppFull`;
USE `QuizAppFull`;
SHOW TABLES;

## 1. Foydalanuvchilar jadvali (`users`)

CREATE TABLE users
(
    id            INT AUTO_INCREMENT PRIMARY KEY,     -- Har bir foydalanuvchi uchun unikal ID
    username      VARCHAR(50) UNIQUE NOT NULL,        -- Foydalanuvchining noyob username'i
    password_hash VARCHAR(255)       NOT NULL,        -- Parolni xavfsizlik uchun xeshlangan holda saqlaymiz
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Ro'yxatdan o'tgan vaqtni avtomatik saqlaydi
);


# 2. Fanlar jadvali (`subjects`)

CREATE TABLE subjects
(
    id   INT AUTO_INCREMENT PRIMARY KEY, -- Har bir fan uchun unikal ID
    name VARCHAR(100) UNIQUE NOT NULL    -- Fan nomi (masalan, "Matematika", "Fizika")
);


# 3. Test savollari (`tests`)

CREATE TABLE tests
(
    id         INT AUTO_INCREMENT PRIMARY KEY,                          -- Har bir test uchun unikal ID
    subject_id INT  NOT NULL,                                           -- Test qaysi fan uchun ekanligini ko'rsatadi
    question   TEXT NOT NULL,                                           -- Testning savol matni
    FOREIGN KEY (subject_id) REFERENCES subjects (id) ON DELETE CASCADE -- Fan o'chirib tashlansa, unga tegishli testlar ham o'chadi
);


# 4. Test javob variantlari (`answers`)

CREATE TABLE answers
(
    id          INT AUTO_INCREMENT PRIMARY KEY,                   -- Har bir javob varianti uchun unikal ID
    test_id     INT          NOT NULL,                            -- Ushbu javob qaysi testga tegishli ekanligini ko'rsatadi
    answer_text VARCHAR(255) NOT NULL,                            -- Variant matni (masalan, "A) 5")
    is_correct  BOOLEAN      NOT NULL DEFAULT FALSE,              -- To'g'ri javob bo'lsa TRUE, noto'g'ri bo'lsa FALSE
    FOREIGN KEY (test_id) REFERENCES tests (id) ON DELETE CASCADE -- Test o'chirilsa, unga tegishli variantlar ham o'chadi
);


# 5. Foydalanuvchining test ishlash jarayoni (`user_tests`)

CREATE TABLE user_tests
(
    id          INT AUTO_INCREMENT PRIMARY KEY,                         -- Har bir test sessiyasi uchun unikal ID
    user_id     INT      NOT NULL,                                      -- Foydalanuvchi ID'si
    subject_id  INT      NOT NULL,                                      -- Foydalanuvchi qaysi fan testini ishlagan
    started_at  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,            -- Test qachon boshlanganligini saqlaydi
    finished_at DATETIME          DEFAULT NULL,                         -- Test tugash vaqti (agar null bo'lsa, hali tugatilmagan)
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,      -- Foydalanuvchi o'chirilsa, tegishli test sessiyalari ham o'chadi
    FOREIGN KEY (subject_id) REFERENCES subjects (id) ON DELETE CASCADE -- Fan o'chirilsa, tegishli test sessiyalari ham o'chadi
);


# 6. Foydalanuvchining test natijalari (`user_answers`)

CREATE TABLE user_answers
(
    id                 INT AUTO_INCREMENT PRIMARY KEY,                         -- Har bir foydalanuvchi javobi uchun unikal ID
    user_test_id       INT     NOT NULL,                                       -- Qaysi test sessiyasiga tegishli ekanligi
    test_id            INT     NOT NULL,                                       -- Foydalanuvchi qaysi test savoliga javob bergan
    selected_answer_id INT     NOT NULL,                                       -- Foydalanuvchi tanlagan javob varianti
    is_correct         BOOLEAN NOT NULL,                                       -- To'g'ri bo'lsa TRUE, noto'g'ri bo'lsa FALSE
    FOREIGN KEY (user_test_id) REFERENCES user_tests (id) ON DELETE CASCADE,   -- Test sessiyasi o'chirilsa, tegishli javoblar ham o'chadi
    FOREIGN KEY (test_id) REFERENCES tests (id) ON DELETE CASCADE,             -- Test savoli o'chirilsa, tegishli javoblar ham o'chadi
    FOREIGN KEY (selected_answer_id) REFERENCES answers (id) ON DELETE CASCADE -- Variant o'chirilsa, tegishli javoblar ham o'chadi
);

/*
1. Foydalanuvchi ro'yxatdan o'tadi  `users` jadvaliga yoziladi.
2. Test ishlashni boshlaydi  `user_tests` jadvaliga yoziladi.
3. Har bir savolga javob beradi  `user_answers` jadvaliga yoziladi.
4. Test tugaganda, `user_tests.finished_at` maydoni yangilanadi.
5. Natijalar chiqariladi  `user_answers` orqali foydalanuvchi to'g'ri yoki noto'g'ri javob bergani tekshiriladi.
*/