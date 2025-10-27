# ERRORlarni ushlash

Protsedurada qandaydir xatolik yuzaga kelganda, uni tegishli ravishda hal qilish juda muhim.

- Joriy bajarilayotgan blokni bajarilishini davom ettirish
- Joriy bajarilayotgan blokdan chiqib ketish
- Xatolik haqida xabar qilish

Protseduramizdan qandaydir xatolik sodir bo'lsa, nima qilish kerakligini protsedura tanasida ko'rsatib ketishimiz mumkin

```sql
DECLARE [action] HANDLER FOR {condition_value} {statement};
```

**`action`** - 2 xil qiymat qabul qilishi mumkin:

- `CONTINUE` - xatolik sodir bo'lganda davom ettirsin
- `EXIT` -  xatolik sodir bo'lganda blokdan chiqib ketsin

CURSOR bilan ishlaganda, agarda CURSORda hechqanday qator topilmasa, qator topilmaganligni bilish uchun `NOT FOUND` - dan foydalanishimiz zarur

**`condition_value`** - quyidagi qiymatni qabul qiladi

- `MySQL error code` - ya'ni mysqldagi errorlarning kodi
- `SQLWARNING` , `NOT FOUND` , `SQLEXCEPTION` - 3 tasidan birini qabul qiladi.

**`statement`** - xatolik sodir bo'lganda bajarilishi kerak bo'lgan ish.

```sql
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
SET hasError = 1;
```

Agarda protseduramizda xatolik sodir bo'lib EXCEPTION qaytarsa, blokni bajarishda davom ettirish buyrug'i. `hasError` degan o'zgaruvchi e'lon qilib, agar xatolik sodir bo'lsa uni qiymatini o'zgartirib qo'yishimiz mumkin. Keyinchalik bu o'zgaruvchi orqali xatolik sodir bo'lgan yoki bo'lmaganligini bilib olishimiz mumkin

---

```sql
DECLARE CONTINUE HANDLER FOR NOT FOUND 
SET RowNotFound = 1;
```

Agarda protseduramizda `SELECT` orqali yoki `CURSOR` orqali ishlayotganimizda, jadvaldan birorta ham ma'lumot topilmasa, `NOT FOUND` dan foydalanib qator topilmaganini aniqlashimiz mumkin. Yuqorida agarda qator topilmasa `RowNotFound` o'zgaruvchi e'lon qilib, unga qiymat berildi. Shu qiymat orqali qator topilmaganini bilishimiz mumkin.

---

```sql
DECLARE CONTINUE HANDLER FOR 1062
SELECT 'Error, duplicate key occurred';
```

Protsedurada  `Mysql error code` lar orqali xatolik sodir bo'lganda nima qilish kerak ekanligini ko'rsatishimiz mumkin.