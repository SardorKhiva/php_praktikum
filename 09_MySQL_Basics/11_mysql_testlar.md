    Bu yerda MySQl Basics testlariga bergan javoblarimni yozganman,
    <-- nelgisi bor qatorni xato belgilabman, boshqalarini to'g'ri belgiladim.
1. MYSQL qaysi dasturlash tilida yozilgan? 
    C/C++

2. Jadvalda nechtagacha primary key bo'lishi mumkinmi?
   1
 
3. Mysql da USE termini nimani tanlashda ishlatiladi?
   database
 
4. PRIMARY KEY - NULL qiymat qabul qiladi. UNIQUE KEY - NULL qiymat qabul qilmaydi. Jumla to’g’rimi?
   yo'q
 
5. “talaba” jadvalidagi talabalar sonini aniqlash so’rovi qanday?
   select count(*) from talaba;
 
6. Quyidagi buyruqlardan qaysi biri ma'lumotlar bazasini o'chirish uchun ishlatiladi?
   DROP DATABASE DATABASE_NAME;

7. MYSQL da kalit so'zlarni yozishda katta-kichik ekanligini ahamiyati bormi?
   ha
   yo'q <--
   komputerning operatsion tizimiga bog’liq

8. Mysqlni SQL dan farqi nima?
   Mysql dasturiy ta’minot(Relyatsion ma'lumotlar bazasini boshqarish tizimi), SQL esa ma'lumotlar bazasi tili.

9. Ma'lumotlar bazasi mavjud bo'lmasagina yaratish uchun qaysi buyruqdan foydalaniladi?
   IF NOT EXISTS 

10. Qaysi buyruq yordamida jadval hosil qilinadi?
    create table…;
 
11. Quyidagilardan qaysi biri alter buyrug'i yordamida jadvalga ustun qo'shish uchun to’g’ri sintaksis?
    ALTER TABLE table_name ADD column_name data type; 

12. “Students” jadvalidan ismi “jon” bilan tugaydigan barcha ismlarni olish so’rovini to’g’ri belgilang.
    where ism like ‘%jon’; 

13. Quyidagilardan qaysi biri agregat funksiya?
    COUNT

14. Alter buyrug'i yordamida ustun nomini o'zgartirsa bo’ladimi?
    ha

15. "Primary key" kaliti nima?
    Qatorni jadvalda noyobligini (unique) bildiruvchi va AUTO_INCREMENT bilan oshiriladigan bir ustun

16. talaba” jadvalidan Sardor ismli talabani o’chirish so’rovi qanday?
    delete from talaba where ismi = “Sardor”;

17. Barcha ma'lumotlar bazalarini ko'rish uchun qaysi buyruq ishlatiladi?
    Show databases;

18. Ma’lumotlarni saralash buyrug’i qaysi?
    ORDER BY

19. “talaba” jadvaliga Sardor ismli talabani qo’shish so’rovi qanday?
    insert into talaba (ismi) values (“Sardor”);

20. Jadvaldan, "phone_number" ustunida qiymat bor qatorlarni olish so'rovi qanday?
    where phone_number is not null 

21. Primary key bo’lga ustun data type’i INT dan boshqa yana qanda data type’ga ega bo'lishi mumkinmi?
    bigint 

22. Qaysi mysql termini yordamida, so'rov natijalariga cheklov(ogranicheniya) qo'yiladi?
    LIMIT 

23. Qaysi buyruq yordamida jadvaldagi qatorni o’chirish mumkin?
    DELETE

24. Sql buyruqlarining DDL (Data Definition Language) turiga qaysi buyruqlar kiradi?
    CREATE,DROP,AlTER,TRUNCATE,COMMENT,RENAME
    CREATE,DROP,AlTER,SELECT,INSERT
    DELETE,UPDATE,SELECT CREATE  <--

25. Sql buyruqlari necha turga bo’linadi?
    2
    3
    4
    5  <-- 
