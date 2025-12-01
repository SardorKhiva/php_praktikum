<?php
/**
 * Foydalanuvchi: User
 * Loyiha nomi: PRAKTIKUM
 * Fayl nomi: 12_DATE.php
 * Fayl yaratilgan: 29.11.2025 22:28
 * Maqsad: php da date, time, strtotime funksiyalari
 */
goto resume;
// date() - sana, yoki vaqtni formatlaydi
// qolip:
// date(string $format, int $timestamp);
// qolip - 1 ta mahsus lotin harfli format belgisi,
// timestamp - UNIX timestamp soniya, yozilmasa hozirgi vaqt

resume:
echo "\tKun:\n";
echo 'd: ' . date('d') . PHP_EOL;
echo 'j: ' . date('j') . PHP_EOL;
echo 'D: ' . date('D') . PHP_EOL;
echo 'l: ' . date('l') . PHP_EOL;
echo 'L: ' . date('L') . PHP_EOL;
echo 'N: ' . date('N') . PHP_EOL;
echo 'w: ' . date('w') . PHP_EOL;
echo 'z: ' . date('z') . PHP_EOL;
echo 'S: ' . date('S') . PHP_EOL;

// --- JAMI FORMATLAR ---
/*
PHP `date()` funksiyasining barcha format kodlari

==============================================================
PHP `date()` formatlarining to‘liq ro‘yxati
===========================================================

# 1. Kun (Day)

| Kod   | Ma’nosi                               | Misol    |
| ----- | ------------------------------------- | -------- |
| d     | Oy kunining tartib raqami (01–31)     | 07       |
| j     | Oldi 0siz kun                         | 7        |
| D     | Haftaning qisqa nomi                  | Mon, Tue |
| l (L) | Haftaning to‘liq nomi                 | Monday   |
| N     | Haftaning raqami (1–7, 1 = Dushanba)  | 3        |
| w     | Haftaning raqami (0–7, 0 = Yakshanba) | 0        |
| z     | Yilning nechinchi kuni (0–365)        | 154      |
| S     | Tartib qo‘shimchasi (st, nd, rd, th)  | 1st      |

# 2. Hafta (Week)

| Kod | Ma’nosi          | Misol |
| --- | ---------------- | ----- |
| W   | ISO hafta raqami | 42    |

# 3. Oy (Month)

| Kod | Ma’nosi            | Misol   |
| --- | ------------------ | ------- |
| m   | Oy (01–12)         | 04      |
| n   | Oy oldi 0siz       | 4       |
| M   | Oyning qisqa nomi  | Jan     |
| F   | Oyning to‘liq nomi | January |
| t   | Oy nechta kun      | 31      |

# 4. Yil (Year)

| Kod | Ma’nosi                 | Misol |
| --- | ----------------------- | ----- |
| Y   | To‘liq yil              | 2025  |
| y   | 2 xonali yil            | 25    |
| L   | Kabisa yilmi (1 yoki 0) | 1     |
| o   | ISO yil                 | 2025  |

# 5. Vaqt (Time)

| Kod | Ma’nosi                | Misol  |
| --- | ---------------------- | ------ |
| H   | Soat 24-format (00–23) | 15     |
| h   | Soat 12-format (01–12) | 03     |
| G   | Soat (0–23)            | 8      |
| g   | Soat (1–12)            | 8      |
| i   | Daqiqa (00–59)         | 07     |
| s   | Sekund (00–59)         | 45     |
| u   | Mikrosekund            | 654321 |

# 6. AM/PM

| Kod | Ma’nosi    | Misol |
| --- | ---------- | ----- |
| a   | am yoki pm | pm    |
| A   | AM yoki PM | PM    |

# 7. Vaqt zonasi (Timezone)

| Kod | Ma’nosi            | Misol  |
| --- | ------------------ | ------ |
| e   | Vaqt zonasi nomi   | UTC    |
| T   | Vaqt zonasi qisqa  | CET    |
| O   | GMT offset (+0500) | +0500  |
| P   | GMT offset (+:00)  | +05:00 |
| Z   | Offset sekundlarda | 18000  |

# 8. To‘liq vaqt belgisi (Full datetime)

| Kod | Ma’nosi        | Misol                           |
| --- | -------------- | ------------------------------- |
| c   | ISO 8601       | 2025-11-29T22:00:00+05:00       |
| r   | RFC 2822       | Sat, 29 Nov 2025 22:00:00 +0500 |
| U   | UNIX timestamp | 1732900000                      |

==============================================================
*/