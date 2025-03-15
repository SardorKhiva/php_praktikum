MySQL
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
SHOW TABLES;

Jadval tuzilishini ko'rish: 
DESC [jadval_nomi]; DESC = DESCRIBE 

Jadvaldagi barcha indekslar ro'yhati: 
SHOW INDEX 
FROM [jadval_nomi];

Yangi jadval hosil qilish: 
CREATE TABLE [jadval_nomi] (
[ustun_nomi] VARCHAR(120),  
[boshqa_ustun_nomlari] DATETIME);

Jadvalga yangi ustun qo'shish: 
ALTER TABLE [jadval_nomi] 
ADD COLUMN [ustun_nomi] VARCHAR(120); 

Jadvalga int tipli, primary key va auto_increment (va h.k)li ustun qo'shish:
ALTER TABLE [jadval_nomi] 
ADD COLUMN [yangi_ustun_nomi] int NOT NULL AUTO_INCREMENT PRIMARY KEY;

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
FROM [table] 
WHERE [column] 
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
UPDATE [table] 
SET [column] = '[updated-value]' 
WHERE [column] = [value];

Ma'lum shartga mos ustundagi yozuvlarni o'chirish: 
DELETE FROM [table] 
WHERE [column] = [value];

Jadvaldagi barcha yozuvlarni o'chirish (jadvalning o'zini o'chirmasdan): 
DELETE 
FROM [table];
(Bu, shuningdek, id ustuni kabi avtomatik ravishda yaratilgan ustunlar uchun o'sish hisoblagichini tiklaydi.)

Jadvaldagi barcha yozuvlarni o'chirish, (jadvalni o'zi o'chmaydi): 
TRUNCATE TABLE [table];

Jadval ustunini o'chirish:
ALTER TABLE [table] 
DROP COLUMN [column];

Jadvalni o'chirish: 
DROP TABLE [table];

DB ni o'chirish: 
DROP DATABASE [database];

Ustunlarni qayta nomlab(alias) chiqarish: 
SELECT [column] AS [custom-column] 
FROM [table];

Ma'lumotlar bazasini eksport qilish: 
mysqldump -u [username] -p [database] > db_backup.sql

Qulflangan jadvallar uchun 
--lock-tables=false 
parametridan foydalaning.

Ma'lumotlar bazasi dumpini import qilish: 
mysql -u [username] -p -h localhost [database] < db_backup.sql

Chiqish: 
EXIT;

        Agregat funksiyalar:
Select but without duplicates: 
SELECT DISTINCT name, email, acception 
FROM owners 
WHERE acception = 1 AND date >= 2015-01-01 00:00:00

Calculate total number of records: 
SELECT SUM([column]) FROM [table];

Count total number of [column] and group by [category-column]: 
SELECT [category-column], 
       SUM([column]) 
FROM [table] 
GROUP BY [category-column];

Get largest value in [column]: 
SELECT MAX([column]) 
FROM [table];

Get smallest value: 
SELECT MIN([column]) 
FROM [table];

Get average value: 
SELECT AVG([column]) 
FROM [table];

Get rounded average value and group by [category-column]: 
SELECT [category-column], 
ROUND(AVG([column]), 2) 
FROM [table] 
GROUP BY [category-column];

Multiple tables
Select from multiple tables: 
SELECT [table1].[column], 
       [table1].[another-column], 
       [table2].[column] 
FROM [table1], [table2];

Combine rows from different tables: 
SELECT * 
FROM [table1] 
INNER JOIN [table2] 
ON [table1].[column] = [table2].[column];

Combine rows from different tables but do not require the join condition: 
SELECT * 
FROM [table1] 
LEFT OUTER JOIN [table2] 
ON [table1].[column] = [table2].[column]; 
(The left table is the first table that appears in the statement.)

Rename column or table using an alias: 
SELECT [table1].[column] AS '[value]', 
       [table2].[column] AS '[value]' 
FROM [table1], [table2];

        Users functions
List all users: 
SELECT User, Host 
FROM mysql.user;

Create new user: 
CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';

Grant ALL access to user for * tables: 
GRANT ALL ON database.* TO 'user'@'localhost';

Find out the IP Address of the Mysql Host
SHOW VARIABLES WHERE Variable_name = 'hostname'; (source)