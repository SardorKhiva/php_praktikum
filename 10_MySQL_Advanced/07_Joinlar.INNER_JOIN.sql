/* Bir nechta jadvallardan ma`lumot olish uchun JOIN lardan foydalanamiz.

Misollarda ko`rsatishligimiz uchun quyidagi ikkita jadvalni yaratamiz va
ichiga ma`lumotlarni insert qilamiz.
*/

# Kurs nomlarini saqlash uchun `course` jadvali:
CREATE DATABASE `temp`;
USE `temp`;
CREATE TABLE `course`
(
    `id`   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL
);

/* Qaysi talaba qaysi kursga borishi
haqidagi ma`lumotlarni saqlash uchun
"student" jadvali. Bu jadvalda hechqaysi
kursga bormaydiganlari ham bo`lishi mumkin. */
CREATE TABLE `student`
(
    `id`        INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name`      VARCHAR(30)  NOT NULL,
    `course_id` INT DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`course_id`)
        REFERENCES course (`id`)
);

INSERT INTO `course` (`name`)
VALUES ("HTML"),
       ("PHP"),
       ("JS"),
       ("C++"),
       ("Java"),
       ("CSS");

INSERT INTO `student` (`name`, `course_id`)
VALUES ("Sardor", 4),
       ("Eshmat", NULL),
       ("Toshmat", 1),
       ("Elyor", 4),
       ("Ogabek", 5),
       ("Shaxboz", NULL),
       ("Ulugbek", 2),
       ("Botir", 4),
       ("Sarvar", 5),
       ("Muhiddin", 3),
       ("Jasur", NULL),
       ("Samandar", 2);

#                 Qolip:
SELECT `kerakli_ustunlar`
FROM `jadval_1`
         INNER JOIN `jadval_2`
                    ON boglanish_sharti;

/*
"student" jadvalida HTML kursga boradiganlar bor,
Java kursiga boradiganlar bor,
HTML va JAVA kursiga boradiganlar ham bor.
Umuman kursga bormaydiganlar ham bor.

Bizga kim qaysi kursga borayotganligi haqida ma`lumotni olish uchun INNER JOIN dan foydalanamiz. Ya`ni ikkita jadvalda bir biriga mos bo`lgan ma`lumotlarni olish uchun INNER JOIN dan foydalanamiz.
Agar 1-jadvalda ikkinchisiga bog`liq ma`lumot bo`lmasa ularni olmaydi.
*/

# Ushbu so`rovda "student"
# jadvalidagi barchasini olib chiqadi.
SELECT *
FROM `student`;
/*
+----+----------+-----------+
| id | name     | course_id |
+----+----------+-----------+
|  1 | Sardor   |         4 |
|  2 | Eshmat   |      NULL |
|  3 | Toshmat  |         1 |
|  4 | Elyor    |         4 |
|  5 | Ogabek   |         5 |
|  6 | Shaxboz  |      NULL |
|  7 | Ulugbek  |         2 |
|  8 | Botir    |         4 |
|  9 | Sarvar   |         5 |
| 10 | Muhiddin |         3 |
| 11 | Jasur    |      NULL |
| 12 | Samandar |         2 |
+----+----------+----------*/

# Endi shulardan faqat kursga boradiganlarni
# va qaysi kursga borishini chiqaramiz
SELECT *
FROM `student`
         INNER JOIN `course`
                    ON `course`.`id` = `student`.`course_id`
ORDER BY `student`.`id`;
/*
+----+----------+-----------+----+------+
| id | name     | course_id | id | name |
+----+----------+-----------+----+------+
|  1 | Sardor   |         4 |  4 | C++  |
|  3 | Toshmat  |         1 |  1 | HTML |
|  4 | Elyor    |         4 |  4 | C++  |
|  5 | Ogabek   |         5 |  5 | Java |
|  7 | Ulugbek  |         2 |  2 | PHP  |
|  8 | Botir    |         4 |  4 | C++  |
|  9 | Sarvar   |         5 |  5 | Java |
| 10 | Muhiddin |         3 |  3 | JS   |
| 12 | Samandar |         2 |  2 | PHP  |
+----+----------+-----------+----+------+
9 rows in set (0.00 sec) */

# Yana ham aniqroq ko`rinishi uchun kerakli ustunlarni select qilamiz:
SELECT `student`.`id`,
       `student`.`name` AS 'ismi',
       `course`.`name`  AS 'kurs nomi'
FROM `student`
         INNER JOIN `course`
                    ON `course`.`id` = `student`.`course_id`
ORDER BY `student`.`id`;
/*
+----+----------+-----------+
| id | ismi     | kurs nomi |
+----+----------+-----------+
|  1 | Sardor   | C++       |
|  3 | Toshmat  | HTML      |
|  4 | Elyor    | C++       |
|  5 | Ogabek   | Java      |
|  7 | Ulugbek  | PHP       |
|  8 | Botir    | C++       |
|  9 | Sarvar   | Java      |
| 10 | Muhiddin | JS        |
| 12 | Samandar | PHP       |
+----+----------+-----------+
9 rows in set (0.00 sec)  */

# Agar bizga faqat "Java" kursiga boradiganlar kerak bo`lsa:
SELECT `student`.`id`,
       `student`.`name` AS 'ismi',
       `course`.`name`  AS 'kurs nomi'
FROM `student`
         INNER JOIN `course`
                    ON `course`.`id` = `student`.`course_id`
WHERE `course`.`name` = "Java"
ORDER BY `student`.`id`;
/*
+----+--------+-----------+
| id | ismi   | kurs nomi |
+----+--------+-----------+
|  5 | Ogabek | Java      |
|  9 | Sarvar | Java      |
+----+--------+-----------+
2 rows in set (0.00 sec) */

#                LEFT JOIN
# Qolip:
SELECT `kerakli_ustunlar`
FROM `jadval_1`
         LEFT JOIN `jadval_2`
                   ON boglanish_sharti;

/*
LEFT JOIN orqali chap tarafdagi
jadvaldan barcha ma`lumotlar va
ularga bog`langan jadvaldan,
o`ziga tegishlilarini oladi.

Yani "student" jadvalidagi barcha
kursga boradigan va bormaydiganlarni oladi.
Agar ichida kursga boradiganlar bo`lsa,
"course" jadvalidan qaysi kursga borishini aniqlaydi.
Agar kursga bormasa hechnarsa chiqmaydi

LEFT deyilishiga sabab - chap tarafda turgan
jadvaldan barcha ma`lumotlar olinadi.
*/

SELECT `student`.`id`,
       `student`.`name` AS 'ismi',
       `course`.`name`  AS 'kurs nomi'
FROM `student`
LEFT JOIN `course`
ON `course`.`id` = `student`.`course_id`
ORDER BY `student`.`id`;
/*---+----------+-----------+
| id | ismi     | kurs nomi |
+----+----------+-----------+
|  1 | Sardor   | C++       |
|  2 | Eshmat   | NULL      |
|  3 | Toshmat  | HTML      |
|  4 | Elyor    | C++       |
|  5 | Ogabek   | Java      |
|  6 | Shaxboz  | NULL      |
|  7 | Ulugbek  | PHP       |
|  8 | Botir    | C++       |
|  9 | Sarvar   | Java      |
| 10 | Muhiddin | JS        |
| 11 | Jasur    | NULL      |
| 12 | Samandar | PHP       |
+----+----------+-----------+
12 rows in set (0.00 sec)   */


/*
**JOIN** qilish uchun turli shartlar asosida bog'lanish mumkin.
Quyida **JOIN** operatsiyasini amalga oshirishda ishlatiladigan ba'zi shartlar:

### 1. **Egalik Sharti (`ON`)**
Egalik sharti — bu eng keng tarqalgan **JOIN** shartidir.
Bu shartda siz ikkita jadvalni bog'lash uchun ustunlarning tengligini ta'minlaysiz.

#### Misol:
Agar `orders` jadvalida `customerNumber` va `customers` jadvalida `customerNumber` mavjud bo'lsa:

```sql
SELECT o.orderNumber, o.orderDate, c.customerName
FROM orders o
JOIN customers c ON o.customerNumber = c.customerNumber;
```

Bu yerda `customerNumber` ustunlari bir-biriga teng bo'lishi kerak.

### 2. **Qiyoslash Shartlari (`=`, `<`, `>`, `<=`, `>=`, `<>`)**
Siz nafaqat tenglik, balki boshqa qiyoslash operatorlaridan ham foydalanishingiz mumkin.

#### Misol:
Agar `products` jadvalidagi `buyPrice` va `orders` jadvalidagi `amount` ustunlarini qiyoslasangiz:

```sql
SELECT p.productName, o.amount
FROM orders o
JOIN products p ON o.amount > p.buyPrice;
```

Bu yerda `amount` ustuni `buyPrice` ustunidan katta bo'lishi kerak.

### 3. **Mantiqiy Shartlar (`AND`, `OR`)**
Bir nechta shartni birlashtirish uchun **AND** yoki **OR** mantiqiy operatorlaridan foydalanishingiz mumkin.

#### Misol:
Agar `employees` va `departments` jadvallari bo'lsa, va siz xodimlar lavozimi `Manager` bo'lishi,
shuningdek bo'lim kodi `1` bo'lishi kerak deb talab qilsangiz:

```sql
SELECT e.firstName, e.lastName, d.dept_name
FROM employees e
JOIN departments d ON e.jobTitle = 'Manager' AND e.dept_no = d.dept_no;
```

### 4. **`IS NULL` yoki `IS NOT NULL`**
Agar sizning maqsadingiz **NULL** qiymatlar bilan ishlash bo'lsa,
masalan, ma'lum ustunda qiymat mavjud yoki yo'qligini tekshirish.

#### Misol:
Agar `employees` jadvalidagi `reportsTo` ustunida **NULL** bo'lmagan xodimlarni ko'rsatmoqchi bo'lsangiz:

```sql
SELECT e.firstName, e.lastName
FROM employees e
JOIN employees m ON e.reportsTo = m.employeeNumber
WHERE e.reportsTo IS NOT NULL;
```

Bu yerda, `e.reportsTo` ustuni bo'yicha o'zaro bog'lanadi va
`reportsTo` ustuni **NULL** bo'lmagan xodimlar chiqariladi.

### 5. **`BETWEEN` Shartlari**
`BETWEEN` operatori ikki qiymat o'rtasidagi intervalni tekshiradi.
Bu shartda siz sonli yoki sana turidagi ustunlar bilan ishlashingiz mumkin.

#### Misol:
Agar sizda `orders` jadvali bo'lsa va buyurtma sanasi 2020-yil yanvar va fevral o'rtasida bo'lsa:

```sql
SELECT o.orderNumber, o.orderDate
FROM orders o
JOIN customers c ON o.customerNumber = c.customerNumber
WHERE o.orderDate BETWEEN '2020-01-01' AND '2020-02-29';
```

### 6. **`LIKE` Operatoridan Foydalanish**
Agar siz ma'lum bir naqshga mos keluvchi qiymatlarni qidirmoqchi bo'lsangiz,
**LIKE** operatoridan foydalanishingiz mumkin.

#### Misol:
Agar siz xodimlarning ismlari "A" harfi bilan boshlanayotganlarini qidirmoqchi bo'lsangiz:

```sql
SELECT e.firstName, e.lastName
FROM employees e
JOIN departments d ON e.dept_no = d.dept_no
WHERE e.firstName LIKE 'A%';
```

Bu yerda `LIKE 'A%'` sharti faqat "A" bilan boshlanadigan ismlar uchun ishlaydi.

### 7. **`IN` Operatoridan Foydalanish**
Agar siz bir nechta qiymatni tekshirmoqchi bo'lsangiz, **IN** operatoridan foydalanishingiz mumkin.

#### Misol:
Agar siz `departments` jadvalidagi bo'limlardan faqat `1`, `2`,
yoki `3` bo'lim kodiga ega xodimlarni ko'rsatmoqchi bo'lsangiz:

```sql
SELECT e.firstName, e.lastName, e.dept_no
FROM employees e
JOIN departments d ON e.dept_no = d.dept_no
WHERE e.dept_no IN (1, 2, 3);
```

### 8. **`EXISTS` Operatoridan Foydalanish**
**`EXISTS`** operatori yordamida, ma'lum bir subquery mavjud bo'lsa, shartni qo'llashingiz mumkin.

#### Misol:
Agar sizda `employees` va `departments` jadvallari bo'lsa va
faqat xodimlar mavjud bo'lgan bo'limlarni ko'rsatmoqchi bo'lsangiz:

```sql
SELECT e.firstName, e.lastName
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM departments d
    WHERE e.dept_no = d.dept_no
);
```

### Xulosa:
Siz **JOIN** operatsiyasini turli shartlar asosida amalga oshirishingiz mumkin:
tenglik, qiyoslash, mantiqiy operatorlar, **NULL** tekshiruvi, va boshqa shartlar.
Bu imkoniyatlar sizga jadvallarni kerakli tarzda bog'lash va ma'lumotlarni olishda moslashuvchanlik beradi.
*/