# 4) Telefon kontaktlarini saqlash uchun jadval yarating. 
# Ismi, Familyasi, telefon nomeri ustunlari bo'lsin.
# Bitta telefon nomer qaytadan kiritish imkoni bo'lmasin.
# Yani 1 kishida bir nechta telefon nomer bo'lishi mumkin,
# lekin 1 ta telefon nomer bir nechta kishida bo'lmasligi kerak.

USE `Oilam`;
CREATE TABLE `contacts`
(
    `id`        INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `ismi`      VARCHAR(30)                    NOT NULL,
    `familyasi` VARCHAR(40)                    NOT NULL,
    `telefoni`  CHAR(13) UNIQUE                NOT NULL
);