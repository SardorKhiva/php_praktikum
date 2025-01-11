# 2 ta so`rov yozing. 1-si so`rovingiz "employees"
# jadvalidan 10 ta jinsi erkak bo`lganlarni chiqarsin
# 2-si so`rovingiz "employees" jadvalidan 10 ta jinsi
# ayol bo`lganlarni chiqarsin  where ishlatilmasin.

SHOW DATABASES;

USE Test;

SHOW TABLES;

CREATE TABLE IF NOT EXISTS `employees_2`
(
    `id`     INT PRIMARY KEY,  # unikal identifikator
    `name`   VARCHAR(255),     # hamkasb nomi
    `gender` BOOLEAN NOT NULL, # 1 erkak, 0 ayol
    `Salary` DECIMAL(10, 2)    # Ish haqi (10 xonali son, shundan 2 xonasi haqiqiy son)
);

# DESCRIBE employees_2; #  структурa таблицы


# ajnabiy ismlar dublikat bo'ldi, yozishga erindim
INSERT INTO `employees_2` (`id`, `name`, `gender`, `Salary`)
VALUES (01, 'Daniel Smith', 1, 40000.00),
       (02, 'Michael Brown', 1, 42000.00),
       (03, 'Chris Wilson', 1, 48000.00),
       (04, 'David Minchays', 1, 49000.00),
       (05, 'John Connor', 1, 48500.00),
       (06, 'Daniel Smiths', 1, 40000.00),
       (07, 'Michael Browny', 1, 42000.00),
       (08, 'Chris Wilsons', 1, 48000.00),
       (09, 'David Minchay', 1, 49000.00),
       (10, 'John Connor', 1, 48500.00),
       (11, 'Sarah Devist', 0, 43000.00),
       (12, 'Emily Johnson', 0, 45000.00),
       (13, 'Sarah Connor', 0, 50000.00),
       (14, 'Anna Bella', 0, 44000.00),
       (15, 'Rosa Mariny', 0, 47500.00),
       (16, 'Sarah Devis', 0, 43000.00),
       (17, 'Emily Johnsony', 0, 45000.00),
       (18, 'Sarah Connori', 0, 50000.00),
       (19, 'Anna Bellah', 0, 44000.00),
       (20, 'Rosa Marin', 0, 47500.00);

# erkaklarga 1 berilgani uchun 10 ta limit bilan kamayish tartibida chiqarilsa,
# 10 ta erkak ro'yhati chiqadi
SELECT *             # barchasini tanlab
FROM employees_2     # employees_2 jadvalidagi
ORDER BY gender DESC # gender ni teskari saralash
LIMIT 10;            # 10 ta limit bilan

# 10 ta ayol ro'yhati
SELECT *
FROM employees_2
ORDER BY gender
LIMIT 10;

SELECT `name` AS `ismi`,    # name ustuni ismi deb ko'rinsin
`gender` AS `jinsi`         # gender jinsi
FROM employees_2            # employees_2 jadvalidagi
ORDER BY jinsi, ismi        # jinsi va ismi saralansin
LIMIT 10;                   # 10 tasi