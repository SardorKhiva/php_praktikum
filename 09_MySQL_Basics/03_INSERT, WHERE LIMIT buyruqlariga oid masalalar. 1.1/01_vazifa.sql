# 1) O`zingizda mavjud biror jadvalga :
# - bitta ma`lumot qo`shing
# - 3 ta ma`lumot kiriting
# - faqat boshlang`ich qiymatlari yo`q
# bo`lgan ustunlarga qiymat berib kiriting

SHOW DATABASES;
USE `Mashq`;
SHOW TABLES;
CREATE TABLE `darslar_ruyhati`
(
    `id`        INT AUTO_INCREMENT PRIMARY KEY,
    `dars_nomi` VARCHAR(30) NOT NULL
);

SHOW TABLES;
SELECT * FROM `darslar_ruyhati`;

INSERT INTO `darslar_ruyhati` (`dars_nomi`)
VALUES
    ("Ona tili"),
    ("Matematika"),
    ("Odobnoma"),
    ("Jismoniy tarbiya"),
    ("Tasviriy san'at"),
    ("Rus tili"),
    ("Ingliz tili"),
    ("Mantiq"),
    ("Huquqshunslik asoslari"),
    ("Tarix"),
    ("Islom asoslari");

SELECT * FROM `darslar_ruyhati`;