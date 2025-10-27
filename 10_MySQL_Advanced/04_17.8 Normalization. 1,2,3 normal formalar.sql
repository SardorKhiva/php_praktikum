# MySQL normalizatsiyasi bu —
# ma'lumotlar bazasini optimallashtirish jarayoni bo‘lib, unda
# ma'lumotlarni takrorlanish (redundancy) va ziddiyatlarni kamaytirish
# uchun jadvallarni maxsus qoidalarga bo‘lishadi.
# Bu jarayon normal shakllar (normal forms) orqali amalga oshiriladi.
# Quyida uch asosiy normal shakl (1NF, 2NF, 3NF) tushuntirilgan:

### 1. Normal shakl (1NF):
/* Shartlari:
1. Har bir ustunda faqat bitta qiymat bo‘lishi kerak (ko‘p qiymat yoki massiv emas).
2. Har bir ustunning qiymati atomar, ya'ni bo‘linmaydigan bo‘lishi kerak.
3. Har bir satr noyob bo‘lishi kerak (takroriy satrlar bo‘lmasligi kerak).  */

/* Misol:
Jadval atomar bo‘lmagan qiymatlarga ega bo‘lsa:
| ID  | Ism       | Telefon          |
|-----|-----------|------------------|
| 1   | Anvar     | 998901234567, 998909876543 |
| 2   | Doston    | 998998765432     |

Bu jadval 1NF emas, chunki **Telefon** ustuni bir nechta qiymatga ega. Uni 1NF shakliga keltirish uchun har bir qiymat alohida qatorga ajratiladi:

| ID  | Ism       | Telefon        |
|-----|-----------|----------------|
| 1   | Anvar     | 998901234567   |
| 1   | Anvar     | 998909876543   |
| 2   | Doston    | 998998765432   |

---

### **2. Normal shakl (2NF):**
**Shartlari:**
1. Jadval 1NF bo‘lishi kerak.
2. Har bir ustun **asosiy kalit (primary key)** ga to‘liq bog‘liq bo‘lishi kerak.

**Misol:**
Agar jadvalda ba'zi ustunlar asosiy kalitning faqat bir qismiga bog‘liq bo‘lsa:
| KursID | TalabaID | KursNom     | TalabaIsm | TalabaYosh |
|--------|----------|-------------|-----------|------------|
| 1      | 101      | Matematika  | Anvar     | 20         |
| 2      | 102      | Fizika      | Doston    | 22         |

Bu yerda **KursNom** faqat **KursID** ga bog‘liq, **TalabaIsm** va **TalabaYosh** esa faqat **TalabaID** ga bog‘liq. Uni 2NF shakliga keltirish uchun jadvallarni bo‘lamiz:

**Kurslar:**
| KursID | KursNom     |
|--------|-------------|
| 1      | Matematika  |
| 2      | Fizika      |

**Talabalar:**
| TalabaID | TalabaIsm | TalabaYosh |
|----------|-----------|------------|
| 101      | Anvar     | 20         |
| 102      | Doston    | 22         |

**Bog‘lanish jadvali:**
| KursID | TalabaID |
|--------|----------|
| 1      | 101      |
| 2      | 102      |

---

### **3. Normal shakl (3NF):**
**Shartlari:**
1. Jadval 2NF bo‘lishi kerak.
2. Jadvaldagi har bir ustun faqat asosiy kalitga bog‘liq bo‘lishi kerak, boshqa ustunga bog‘liq bo‘lmasligi kerak.

**Misol:**
| TalabaID | TalabaIsm | TalabaYosh | Fakultet | DekanIsmi |
|----------|-----------|------------|----------|-----------|
| 101      | Anvar     | 20         | Matematika | Hasanov   |
| 102      | Doston    | 22         | Fizika     | Karimov   |

Bu yerda **DekanIsmi** fakultetga bog‘liq, lekin asosiy kalitga emas. Uni 3NF shakliga keltirish uchun jadvallarni yana bo‘lamiz:

**Talabalar:**
| TalabaID | TalabaIsm | TalabaYosh | Fakultet |
|----------|-----------|------------|----------|
| 101      | Anvar     | 20         | Matematika |
| 102      | Doston    | 22         | Fizika     |

**Fakultetlar:**
| Fakultet    | DekanIsmi |
|-------------|-----------|
| Matematika  | Hasanov   |
| Fizika      | Karimov   |

---

### **Foyda:**
1. Ma'lumotlar takrorlanishi kamayadi.
2. Ma'lumotlarni yangilash osonlashadi.
3. Bo‘sh joy tejaladi va ma'lumotlar bazasining samaradorligi oshadi.