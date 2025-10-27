#                                             DELIMITER
# Bir nechta so'rovlarni yozganimizda so'rovlarni  `;` - ushbu belgi bilan ajratib yozamiz.

SELECT *
FROM `products`;
SELECT *
FROM `customers`;

/*
Mysql klient dasturlar bo'lsa `;` ushbu belgi orqali so'rovlarni ajratib olib,
alohida - alohida so'rov sifatida bajaradi.
Yuqorida hosil qilgan protsedurada ham ko'rishimiz mumkin,
protseduraning tana qismida bir nechta so'rovlarni amalga oshirishimiz,
`;` ajratuvchi belgidan ko'p marotaba foydalanish mumkin.
Bunday holda protsedurani ichidagi so'rovlarni ham alohida alohida qilib bajarib ketadi.

Protsedurani ichidagi so'rovlar hammasi faqat chaqirilgandagina bajarilishi kerak.
Bu so'rovlar protseduraning tanasiga tegishli so'rovlar ekanligini
ajratib qo'yish uchun `$`,`$$` yoki `/`, `//` ajratuvchi belgilardan foydalanishimiz mumkin.
Bu ajratuvchi belgilarni `MySQL` da `DELIMITER` deb ataladi.
*/

DELIMITER $$

CREATE PROCEDURE protsedura_nomi()
BEGIN
    -- sql so'rovlar;
END $$

DELIMITER ;

/*
Yuqorida `PROTSEDURA` hosil qilishni tahlil qilaylik.

1)`DELIMITER $$` buyrug'i:
  Ushbu qatorgacha mysqlda so'rovlar `;` bilan alohida alohida so'rovlarga ajratilib kelingan.
Yuqoridagi buyruq berilishi bilan, shu qatordan keyingi barcha so'rovlar
`$$` bilan yoki `DELIMITER`da ko'rsatilgan belgi bilan ajratilishni boshlaydi.
Endi bundan buyog'iga `$$` belgisi bilan so'rovlarni ajratadi va bajaradi.

  2)** **`CREATE PROCEDURE protsedura_nomi()` buyrug'i:
Ushbu qatordagi buyruq, protseduraga nom berib uni hosil qilish buyrug'i hisoblanadi

  3) `BEGIN`  buyrug'i:
Ushbu buyruq protseduraning tana qismining boshlanishini bildiriladi

  4) `-- sql so'rovlar` bu qismga barcha sql so'rovlarimizni,
logikalarimizni, bajarish kerak bo'lgan skriptlar yoziladigan maydon hisoblanadi

  5) `END $$` buyrug'i:
Ushbu buyruq, protseduraning barcha qismlari tugashini anglatadi

  6)`DELIMITER ;` buygug'i:
Yuqorida biz, mysql dasturi so'rovlarni ajratib olish uchun
`$$` belgisidan foydalanish buyrug'ini bergan edik.
Endi shuni o'z joyiga, yani odatdagidek `;`belgisi
bilan ajratishda davom etsin deb buyruq beramiz.

💡 ESLATMA: DELIMITER protseduraning biror qismi emas!
*/


/* Prodtsedura / Prodcedure
Protsedura - (saqlangan protsedura) bazada saqlanadigan dasturiy qismdir.
Protsedura SQL so'rov va amallarni bajaradi lekin hech qanday qiymat qaytarmasligi ham mumkin qaytarmasligi ham mumkin.
*/


#                               PROCEDURE
# Protsedura - (saqlangan protsedura)bazada saqlanadigan dasturiy qism.
# Ya'ni protseduraning nomi, kirish paramaterlari bo'lishi,
# tanasida sql so'rovlar yozish, o'zgaruvchilar,
# IF,  SIKL operatorlari va shunga o'xshash operatorlarni ishlatish imkoni mavjud.
# Protsedura sql so'rov va amallarni bajaradi lekin hechqanday qiymat qaytarmaydi.
# Keling misol bilan o'rganamiz:

SELECT customerName,
       city,
       state,
       postalCode,
       country
FROM customers
ORDER BY customerName;

# Hosil bo'lgan natijani: 1-NATIJA deb nomlab turamiz

# Tasavvur qiling siz yuqoridagi so'rovni doim ishlatasiz.
# Har safar bir xil so'rovni yozib uni ishga tushirasiz.
# Agar bu 50-60 qatorlik yoki undan ortiq qatorli so'rov bo'ladigan bo'lsa,
# sizning xotirangizda to'liq so'rov saqlanishi juda qiyin va
# har safar shuncha qator kodni yozishizga to'g'ri keladi.
# Shunday paytda savol tug'iladi: shu yozgan so'rovingizni biror joyda saqlab qo'yilsa
# va kerakli paytda ishga tushirilsa va natija olinsa.
# Har safar qaytadan yozib o'tirilmasa...

# Buni MySQLda `PROTSEDURA` bilan amalga oshirish mumkin. Bu qanday bo'ladi?

# --Protsedura hosil qilami
DELIMITER $$
CREATE PROCEDURE MijozlarRuyxati()
BEGIN
    SELECT customerName,
           city,
           state,
           postalCode,
           country
    FROM customers
    ORDER BY customerName;
END$$
DELIMITER ;

# Yuqorida biz `MijozlarRuyxati()` deb nomlangan, saqlangan protsedura hosil qildik.
# Endi ushbu saqlangan protsedurani quyidagicha chaqirib ishga tushiramiz:

CALL MijozlarRuyxati();

# Chiqqan natijani 1-NATIJA bilan solishtiring. Ko'rib turganingizdek natija bir xil.

# Qachonki saqlangan protsedurani `CALL` qilib chaqirganimizda,
# ma'lumotlar omboridan shu nomli protsedurani qidiradi,
# uni xotiraga joylaydi va protsedurani ishga tushiradi

/*
                Foydalari:

-Tarmoq tarffigini kamligi.
Saqlanadigan protseduralar, dasturlar va MySQL Server o`rtasidagi tarmoq trafigini kamaytirishga yordam beradi.
Sababi, bir nechta qator uzunlikdagi so`rovlarni yuborish o`rniga, saqlangan protseduralarning nomi va parametrlarini yuborish yetarli.

-Bazani havfsizligini oshiradi
Ma`lumotlar bazasida barcha userlarga to`liq ruxsat bermasdan, protseduralarni ishlatishgagina ruxsat berishimiz mumkin.
*/


SHOW DATABASES;
USE `mashq`;

DELIMITER //
CREATE PROCEDURE showDB()
BEGIN
    SHOW DATABASES;
END //
DELIMITER ;

CALL showDB();
CALL MijozlarRuyxati();

