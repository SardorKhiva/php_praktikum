#       CRUD ma'lumotlar ustida bajariladigan operatsiyalar, amallar:
# Create - Ma'lumotni hosil qilish  - INSERT INTO buyrug'iga to'g'ri keladi
# Read   - Ma'lumotni o'qish        - SELECT buyrug'iga to'g'ri keladi
# Update - Ma'lumotni yangilash     - ( keyingi darslarda o'tiladi )
# Delete - Ma'lumotni o'chirish     - ( keyingi darslarda o'tiladi )

SHOW DATABASES;
USE Mashq;

CREATE TABLE `category`
(
    `id`   INT PRIMARY KEY,
    `name` VARCHAR(50)
);

CREATE TABLE `depratment`
(
    `id`   INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50)
);

SHOW TABLES;

INSERT INTO `category`
VALUES (1, 'Sport');

SELECT *
FROM `category`;

# category jadvaliga ustunlarini ko'rsatmay ma'lumot yozish
INSERT INTO `category`
VALUES (2, "Tarih");

# category jadvaliga ustunlarini ko'rsatib ma'lumot yozish
INSERT INTO `category` (`id`, `name`)
VALUES (5, 'Ta\'lim');

SELECT *
FROM `category`;

# department o'rniga depratment deb yozibman
# id AUTO_INCREMENT bo'lgani uchun id ga nomer berilmasa ham avtomatik beriladi:
INSERT INTO `depratment`(`name`)
VALUES ('Accounting');

INSERT INTO `depratment` (id, name)
VALUES (3, 'Matn');

SELECT *
FROM `depratment`;

# oxirgi id ni davom qildiradi AUTO_INCREMENT bo'lgani uchun
INSERT INTO `depratment` (name)
VALUES ('Maktab');
SELECT *
FROM `depratment`;

# category da AUTO_INCREMENT bo'lmagani uchun xato beradi
# DEFAULT VALUE yo'q deydi
INSERT INTO `category` (name)
VALUES ('sPROT');

CREATE TABLE `news`
(
    `id`          INT PRIMARY KEY AUTO_INCREMENT,
    `title`       VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL
);

INSERT INTO `news` (title, description)
VALUES ('Salom dunyo1', 'Bu 1-description'),
       ('Salom dunyo2', 'Bu 2-description'),
       ('Salom dunyo3', 'Bu 3-description');

SELECT *
FROM `news`;

# Agar mavjud kalitli PRIMARY KEY qiymat kiritilsa xato beradi:
# va ma'lumot yozish shu joyda to'xtab qoladi
INSERT INTO `category`
VALUES (2, 'Iqtisod'); # Duplicate entry '2' for key 'PRIMARY'

# to'xtab qolmaslik uchun, agar shunaqa primary key
# mavjud bo'lsa bu ma'lumotni ignor qilib ketadi yozmay
INSERT IGNORE INTO `category`
VALUES (2, 'Adabiyot');

SELECT * FROM `category`;