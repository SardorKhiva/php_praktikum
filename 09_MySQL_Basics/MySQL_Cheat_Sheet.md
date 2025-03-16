                                   MySQL dagi ba'zi asosiy so'rovlar
http://www.sqlteaching.com/
https://www.codecademy.com/learn/learn-sql
https://www.codecademy.com/catalog/language/sql

                MySQL buyruqlar

MySQL bazaga kirish: 
mysql -u [foydalanuvchi_ismi] -p; 
(keyin parol kiritiladi)

Barcha ma'lumotlar omborini(db) ko'rish: 
SHOW DATABASES;

MySQL ga ma'lum bir db ni console da tanlab turib kirish: 
mysql -u [foydalanuvchi_ismi] -p [db_nomi] 
(keyin parol kiritiladi)

Yangi db hosil qilish: 
CREATE DATABASE [IF NOT EXISTS] [db_nomi]; 
IF NOT EXISTS - agar mavjud bo'lmasa

DB ni tanlash: 
USE [db_nomi];

Qaysi db tanlanganini ko'rsatish: 
SELECT DATABASE();

Barcha jadvallarni ko'rish: 
SHOW jadvalS;

Jadval tuzilishini ko'rish: 
DESC [jadval_nomi]; DESC = DESCRIBE 

Jadvaldagi barcha indekslar ro'yhati: 
SHOW INDEX 
FROM [jadval_nomi];

Yangi jadval hosil qilish: 
CREATE jadval [jadval_nomi] (
[ustun_nomi] VARCHAR(120),  
[boshqa_ustun_nomlari] DATETIME);

Jadvalga yangi ustun qo'shish: 
ALTER jadval [jadval_nomi] 
ADD ustun [ustun_nomi] VARCHAR(120); 

Jadvalga int tipli, primary key va auto_increment (va h.k)li ustun qo'shish:
ALTER jadval [jadval_nomi] 
ADD ustun [yangi_ustun_nomi] int NOT NULL AUTO_INCREMENT PRIMARY KEY;

Jadvalga yozuv yozish: 
INSERT INTO [jadval_nomi] ([ustun_1], [ustun_2]) 
VALUES ('[qiymat_1]', '[qiymat_2]');

Joriy sana va vaqtni chiqaruvchi funksiya: 
NOW()

jadvaldagi barcha yozuvlarni ko'rsatish: 
SELECT * 
FROM [jadval_nomi];

Yozuvlarni analiz qilish: 
EXPLAIN SELECT * 
FROM [jadval_nomi];

Har bir so'rovni alohida analiz qilish:
SET profiling = 1;
SELECT * 
FROM users WHERE age > 30;
SHOW PROFILES;


Jadvaldagi ma'lum ustunlarni chiqarish: 
SELECT [ustun_nomi], [boshqa_ustun_nomlari] 
FROM [jadval_nomi];

Jadvaldagi yozuv (satr, qator) lar soni: 
SELECT COUNT([ustun_nomi]) 
FROM [jadval_nomi];

Bir xil ma'lumotli qatorlarni guruhlash: 
SELECT COUNT([guruhlangan_ustun_nomi]) 
FROM [jadval_nomi]) AS count 
GROUP BY [guruhlanuvchi_ustun_nomi];

Ma'lum shartlarga ko'ra ma'lumotlarni chiqarish: 
SELECT * 
FROM [jadval_nomi] 
WHERE [ustun_nomi] = [qiymat]; 
(<, >, != lar AND, OR bilan ishlatishi mumkin)

Jadvaldan ma'lum ustundan ma'lum bir jumlasi bor qatorlarni chiqarish[jumla]: 
SELECT *                          -- barcha ustunlar 
FROM [jadval]                     -- qaysi jadval  
WHERE [ustun]                     -- qidirilayotgan ustun
LIKE '%[qidirilayotgan_jumla]%';  -- %shu ikki belgi orasidagi jumla qidiriladi%

Ma'lum bir [qiymat] bilan boshlanuvchi jumani qidrish: 
SELECT * 
FROM [jadval] 
WHERE [ustun] 
LIKE '[value]%';

qiy bilan boshlanib mat bilan tugovchi (orasida har qanday bitta harf bor bo'lgan) jumlani qidirish:  
SELECT * 
FROM [jadval] 
WHERE [ustun] 
LIKE '[qiy_mat]';

Ma'lum bir oraliqlar orasidagi qiymatlari bor jadval ustunlarini chiqarish : 
SELECT * 
FROM [jadval] 
WHERE [ustun] 
BETWEEN [qiymat_1] AND [qiymat_2];  -- odatda sana va sonlarda ishlatiladi

Select with custom order and only limit: 
Jadvalni ma'lum ustunini ma'lum chegarada oshish yoki kamayish tartibida chiqarish: 
SELECT * 
FROM [jadval] 
WHERE [filrlanuvchi_ustun] 
ORDER BY [tartiblanuvchi_ustun] ASC 
LIMIT [chegaralovchi_son];      -- nechta satr chiqsin 
(Tartiblash: DESC - kamayuvchi, ASC - oshuvchi)  

Ma'lum shartga mos ustundagi yozuvlarni yangilash: 
UPDATE [jadval] 
SET [ustun] = '[updated-value]' 
WHERE [ustun] = [value];

Ma'lum shartga mos ustundagi yozuvlarni o'chirish: 
DELETE FROM [jadval] 
WHERE [ustun] = [value];

Jadvaldagi barcha yozuvlarni o'chirish (jadvalning o'zini o'chirmasdan): 
DELETE 
FROM [jadval];
(Bu, shuningdek, id ustuni kabi avtomatik ravishda yaratilgan ustunlar uchun o'sish hisoblagichini tiklaydi.)

Jadvaldagi barcha yozuvlarni o'chirish, (jadvalni o'zi o'chmaydi): 
TRUNCATE jadval [jadval];

Jadval ustunini o'chirish:
ALTER jadval [jadval] 
DROP ustun [ustun];

Jadvalni o'chirish: 
DROP jadval [jadval];

DB ni o'chirish: 
DROP DATABASE [database];

Ustunlarni qayta nomlab(alias) chiqarish: 
SELECT [ustun] AS [custom-ustun] 
FROM [jadval];

Ma'lumotlar bazasini eksport qilish: 
mysqldump -u [username] -p [database] > db_backup.sql

Qulflangan jadvallar uchun 
--lock-jadvals=false 
parametridan foydalaning.

Ma'lumotlar bazasi dumpini import qilish: 
mysql -u [username] -p -h localhost [database] < db_backup.sql

Chiqish: 
EXIT;

        Agregat funksiyalar:
Dublikatlarsiz(takrorlanishlarsiz) ma'lumotlarni ma'lum shartlar asosida chiqarish: 
SELECT DISTINCT name, email, acception 
FROM owners 
WHERE acception = 1 AND date >= 2015-01-01 00:00:00

Jadvaldagi ma'lum ustun qiymatlari yig'indisini chiqarish:
SELECT SUM([ustun]) 
FROM [jadval];

Ma'lum ustunlarni guruhlab qiymatlari yig'indisini chiqarish:
SELECT [kategoriya-ustun], 
       SUM([ustun]) 
FROM [jadval] 
GROUP BY [kategoriya-ustun];

[ustun] dagi maksimal qiymatni topish:
SELECT MAX([ustun]) 
FROM [jadval];

Minimal qiymatni topish: 
SELECT MIN([ustun]) 
FROM [jadval];

O'rtacha qiymatni topish: 
SELECT AVG([ustun]) 
FROM [jadval];

[kategoriya-ustun]ni guruhlab 2 xona aniqlikda yaxlitlab o'rtacha qiymatlarini chiqarish: 
SELECT [kategoriya-ustun], 
ROUND(AVG([ustun]), 2) 
FROM [jadval] 
GROUP BY [kategoriya-ustun];

Bir nechta jadvalni chiqarish: 
SELECT [jadval1].[ustun], 
       [jadval1].[boshqa-ustun], 
       [jadval2].[ustun] 
FROM [jadval1], [jadval2];

INNER JOIN, Bir xil qiymatli 2 ta ustuni bor jadvallarni bir xil ma'lumotlari borlarini birlashitirish: 
SELECT * 
FROM [jadval1] 
INNER JOIN [jadval2] 
ON [jadval1].[ustun] = [jadval2].[ustun];

LEFT JOIN: 
SELECT * 
FROM [jadval1] 
LEFT OUTER JOIN [jadval2] 
ON [jadval1].[ustun] = [jadval2].[ustun];
(Chapdagi jadval so'rovda paydo bo'ladigan birinchi jadvaldir.)

alias bilan ustunlarni qayta nomlab chiqarish: 
SELECT [jadval1].[ustun] AS '[value]', 
       [jadval2].[ustun] AS '[value]' 
FROM [jadval1], [jadval2];

        Foydalanuvchiga oid funksiyalari:
Barcha foydalanuvchilar ro'yhati: 
SELECT User, Host 
FROM mysql.user;

Yangi foydalanuvchi hosil qilish: 
CREATE USER 'username'@'localhost' 
IDENTIFIED BY 'password';

Barcha jadvallar uchun foydalanuvchiga HAMMA ruxsatni berish:
GRANT ALL ON database.* TO 'user'@'localhost';

Mysql hostining IP manzilini bilib olish:
SHOW VARIABLES 
WHERE Variable_name = 'hostname';