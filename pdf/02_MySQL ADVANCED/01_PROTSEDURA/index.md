
Mysqlda ham o'zgaruvchilardan ham foydalanish mumkin. 2ta yoki undan ortiq SQL so'rovda biror belgilangan qiymatni yoki so'rov natijasida hosil bo'lgan qiymatni, boshqa so'rovlarda ham ishlatish imkonini beradi.

Mysql da o'zgaruvchilarni quyidagicha e'lon qilinadi va qiymat beriladi:

```sql
SET @variable_name := value;
```

**`@`** belgisi bilan Mysqlda o'zgaruvchilarni ajratib olish mumkin

```sql
Qiymat berish:

		SET @jami := 100;
```

**`SELECT` bilan ham qiymat berish mumkin:**

```sql
		SELECT @variable_name := value;

-- Select qilib qiymat beramiz
		SELECT @buyPrice:=buyprice
		FROM products
		WHERE buyprice > 95
		ORDER BY buyprice;

-- O'zgaruvchini SELECT qilib ko'ramiz
		SELECT @buyPrice;

--Yuqoridagi o'zgaruvchini boshqa so'rovlarda ishlatish mumkin
		SELECT * 
		FROM products 
		WHERE buyPrice = @buyPrice;
```




Protsedura - (saqlangan protsedura)bazada saqlanadigan dasturiy qism.  Ya'ni protseduraning nomi, kirish paramaterlari bo'lishi, tanasida sql so'rovlar yozish, o'zgaruvchilar, IF,  SIKL operatorlari va shunga o'xshash operatorlarni ishlatish imkoni mavjud. Protsedura sql so'rov va amallarni bajaradi lekin hechqanday qiymat qaytarmaydi. Keling misol bilan o'rganamiz:

```sql
SELECT 
    customerName, city, state, postalCode, country
FROM
    customers
ORDER BY customerName;

Hosil bo'lgan natijani: **1-NATIJA** deb nomlab turamiz 
```

Tasavvur qiling siz yuqoridagi so'rovni doim ishlatasiz. Har safar bir xil so'rovni yozib uni ishga tushirasiz. Agar bu 50-60 qatorlik yoki undan ortiq qatorli so'rov bo'ladigan bo'lsa, sizning xotirangizda to'liq so'rov saqlanishi juda qiyin va har safar shuncha qator kodni yozishizga to'g'ri keladi. Shunday paytda savol tug'iladi: shu yozgan so'rovingizni biror joyda saqlab qo'yilsa va kerakli paytda ishga tushirilsa va natija olinsa. Har safar qaytadan yozib o'tirilmasa...

Buni MySQLda `PROTSEDURA` bilan amalga oshirish mumkin. Bu qanday bo'ladi?

```sql
--Protsedura hosil qilami
DELIMITER $$
		CREATE PROCEDURE MijozlarRuyxati()
		BEGIN
		 SELECT 
		    customerName, city, state, postalCode, country
		FROM
		    customers
		ORDER BY customerName;    
END$$
DELIMITER ;
```

Yuqorida biz `MijozlarRuyxati()` deb nomlangan, saqlangan protsedura hosil qildik.

Endi ushbu saqlangan protsedurani quyidagicha chaqirib ishga tushiramiz:

```sql
CALL MijozlarRuyxati();
```

Chiqqan natijani **1-NATIJA** bilan solishtiring. Ko'rib turganingizdek natija bir xil.

Qachonki saqlangan protsedurani `CALL` qilib chaqirganimizda, ma'lumotlar omboridan shu nomli protsedurani qidiradi, uni xotiraga joylaydi va protsedurani ishga tushiradi

**Foydalari**

```sql
-Tarmoq tarffigini kamligi.
Saqlanadigan protseduralar, dasturlar va MySQL Server o`rtasidagi tarmoq trafigini kamaytirishga yordam beradi. 
Sababi, bir nechta qator uzunlikdagi so`rovlarni yuborish o`rniga, saqlangan protseduralarning nomi va parametrlarini yuborish yetarli.

-Bazani havfsizligini oshiradi
Ma`lumotlar bazasida barcha userlarga to`liq ruxsat bermasdan, protseduralarni ishlatishgagina ruxsat berishimiz mumkin. 
```