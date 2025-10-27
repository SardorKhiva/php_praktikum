SHOW DATABASES;
USE Mashq;
SHOW TABLES;

CREATE TABLE IF NOT EXISTS `womens`
(
    `age`    INT PRIMARY KEY,
    `single` INT DEFAULT 1,
    `name`   VARCHAR(20) NOT NULL
);

SHOW TABLES;

SELECT *
FROM `womens`;

INSERT INTO `womens` (`age`, `single`, `name`)
VALUES (17, 1, 'Adiba'),
       (18, 1, 'Aziza'), -- pasdagi kod shuni chiqaradi
       (19, 2, 'Afifa'),
       (20, 2, 'Mahmuda'),
       (21, 1, 'Sharifa');
-- va buni ham chiqaradi

# MA'LUMOTLARNI FILTRLASH VA QIDIRISH
SELECT * -- TANLAYMIZ HAMMASINI
FROM `womens` --  womens jadvalidagi
WHERE `age` BETWEEN 18 AND 21 -- age ustunidagi qiymatlar 18 va 20 orasida
  AND single = 1;
-- va single 1 bo'lsa

/*             QOLIP
SELECT
    `kerakli_ustunlar`
FROM
    `jadval_nomi`
WHERE
    shartlar
 */

#         = tenglikka tekshirish
SELECT * -- tanlaymiz
FROM `employees` -- employees jadvalidan
WHERE `emp_no` = 20909;
-- emp_no ustuni 20909 ga teng bo'lgan satrlarini chiqarish

#         > va >= , katta va katta yoki tenglikka tekshirish
#         < va <= , kichik va kichik yoki tenglikka tekshirish ham bor
SELECT *              -- tanlaymiz
FROM `employees`      -- employees jadvalidan
WHERE `salary` > 500; -- salary 500 dan ko'p bo'lgan ustun
                      -- satrlarini chiqarish

#             != , <> teng emaslikka tekshirish
SELECT *            -- tanlaymiz
FROM `womens`       -- womens jadvalidan
WHERE single <> 2;   -- single ustuni 2 ga teng bo'lmagan satrlarni chiqaramiz
-- WHERE single != 2;  -- tepadagi qator bilan bir xil

#               OR || YOKI operatori  - juda bo'lmasa bittasi
SELECT *        -- tanlaymiz
FROM `womens`   -- womens jadvalidagi
-- qaysiki single = 1 yoki ( || )
-- age = 17 ga teng bo'lgan ustun satrlarini chiqaramiz
WHERE single = 1 OR age = 17;

#               AND && VA operatori   - barchasi
SELECT *        -- tanlaymiz
FROM `womens`   -- womens jadvalidan
WHERE age = 18 AND  -- age = 18 bo'lgan va
      name = 'Aziza';  -- name = 'Aziza' bo'lgan

/*       BETWEEN operatori asosan sonlar va sanalar bilan ishlatiladi (Between - orasida)
2 ta interval orasidan qidirish. Qolip:
SELECT `ustun_1, ustun_2, ...
FROM `jadval_nomi`
WHERE `ustun_nomi` BETWEEN MIN_VALUE AND MAX_VALUE;
*/

SELECT *
FROM `womens`
WHERE `age` BETWEEN 18 AND 20;  -- 18 va 20 orasidagilar

SELECT *
FROM `hodimlar`
WHERE `tugilgan_sana`   -- misol uchun, aslida bunday ustun kiritilmagan menda
BETWEEN '1991-08-31' AND '2000-01-01';

#           IN - ichida
SELECT *
FROM `womens`
WHERE `age` IN (17, 18);    -- age ustuni ichida 17 va 18 saqlaganlar

#           NOT IN - ichida emas
SELECT *
FROM `womens`
WHERE `single`
NOT IN (2);     -- single ustuni ichida 2 mavjud bo'lmaganlari

#           IS NULL va NOT NULL
-- IS NULL  - Maydondan NULL bo'lganlarni qidirish
SELECT *
FROM `womens`
WHERE `single` IS NULL;     -- single ustunidan NULL bo'lganlar

-- NOT NULL - Maydondan NULL ga teng bo'lmaganlarini qidirish
-- single ustunidan NULL bo'lmaganlar:
SELECT * FROM `womens` WHERE `single` IS NOT NULL;

#       LIKE - filtrga tushganlar bo'yicha qidirish
SELECT *
FROM `womens`
WHERE `name` LIKE 'A%'; -- A bilan boshlangan filtr, davomida nima bo'lsayam chiqadi

SELECT *
FROM `womens`
WHERE `name` LIKE '%A'; -- A bilan tugaydi, oldinda nimalar borligini farqi yo'q

SELECT * FROM `womens` WHERE `name` LIKE '%a%';     -- orasida a harfi bor ustunga ega satrlarni chiqarish
SELECT * FROM `womens` WHERE `name` LIKE 'A%A';     -- A bilan boshlanib A bilan tugagan ustunga ega satrlarni chiqarish

#       NOT LIKE - filtrga tushmaganlar bo'yicha qidirish
SELECT * FROM `womens` WHERE `name` NOT LIKE 'A%';  -- A bilan boshlanmaganlarni chiqarish, tepadagini teskarisi.