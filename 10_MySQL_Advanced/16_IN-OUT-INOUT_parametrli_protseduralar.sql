/*                        Saqlangan Protsedura parametrlari
Protsedura yana ham samarali va moslashuvchan ishlashligi uchun parametrlardan foydalaniladi.
[IN | OUT | INOUT] parameter_nomi tipi[(uzunligi)]

Mysql da parametrlar quyidagi 3 xil modeldan biri bo'lishi mumkin. Bular: IN, OUT, INOUT

                          IN paramterlar.
  IN parametrlar - bular kiruvchi turidagi paramterlar desak yanglishmagan bo'lamiz.
Qachonki biz protseduramizda IN dan  paramterni ko'rsatgan bo'lsak,
ushbu protsedurani ishga tushirayotganda, kiruvchi qiymatlar bilan chaqiriladi. */

USE `mashq`;

DELIMITER $$
CREATE PROCEDURE `GetOfficeByCountry`(IN `countryName` VARCHAR(255))
BEGIN
    SELECT `officeCode`,
           `city`,
           `state`,
           `country`
    FROM `offices`
    WHERE `country` = `countryName`;
END $$
DELIMITER ;

# Yuqoridagi misolda countryName o'zgaruvchi, IN paramter sifatida ko'rsatilgan.
# Demak bu protsedurani chaqirib ishga tushirganimizda unga countryName uchun qiymat berishimiz shart.

CALL GetOfficeByCountry('USA');

/* Natija:
+------------+---------------+-------+---------+
| officeCode | city          | state | country |
+------------+---------------+-------+---------+
| 1          | San Francisco | CA    | USA     |
| 2          | Boston        | MA    | USA     |
| 3          | NYC           | NY    | USA     |
+------------+---------------+-------+--------*/


# Agar protseduraga countryName IN parametrini ko'rsatmasak xatolik yuz beradi:

CALL `GetOfficeByCountry`();

# ERROR 1318 (42000): Incorrect number of arguments for PROCEDURE dars2.GetOfficeByCountry; expected 1, got 0

#                                             OUT parametrlar
# Quyidagi protsedura "orders"  jadvalidan, buyurtmalarning
# statusiga qarab, jami sonini qaytaradi
DELIMITER $$

CREATE PROCEDURE GetOrderCountByStatus(
    IN orderStatus VARCHAR(25),
    OUT total INT
)
BEGIN
    SELECT COUNT(`orderNumber`)
    INTO `total`
    FROM `orders`
    WHERE `status` = `orderStatus`;
END$$

DELIMITER ;

/* Ushbu GetOrderCountByStatus() protsedura 2 ta paramterga ega:
orderStatus :  IN parametr, ya'ni kiruvchi parametr
total :  OUT parametr, ya'ni jami nechta buyurtma ekanligini o'zida saqlaydi
Endi ushbu protsedurani chaqirib ishga tushiramiz
*/

CALL GetOrderCountByStatus('Shipped', @jami);

/* Ko'rib turganingizdek, protsedurani chaqirganimizda, 2 ta paramter berdik. "orders" jadvalidan  status i "Shipped" bo'lgan buyrutmalarni jami nechtaligini, @jami degan o'zgaruvchiga qiymat qilib beradi. Yuqoridagi so'rovni amalga oshirsak bizga hechqanday natija chiqmaydi. Sababi natija @jami o'zgaruvchisiga qiymat qilib berilgan. OUT paramterlar - protseduraga paramter sifatida berilganda, protsedurani ichida shu parametrga qiymat berish imkoni mavjud. Protsedura ishini tugatgandan keyin, OUT parametrning yangi qiymati bilan protsedura tashqarisida ham foydalanish mumkin. IN paramterlarda bunday qilishni imkoni yo'q.
  Endi natijani ko'rish uchun:
*/

SELECT @jami;

/* Natija:
+-------+
| @jami |
+-------+
|   303 |
+------*/

#                                         INOUT parametrlar
# INOUT paramterlarni protseduraga kirish parametrlar sifatida ishlatish mumkin
# va protsedurani ichida ham INOUT paramterni qiymatini yangilash,
# uni ustida amallar bajarish va yangi qiymat berish mumkin.
# Protsedura ishini tugatganda INOUT paramterning yangi qiymati bilan,
# protsedura tashqarisida ham foydanalish mumkin.
DELIMITER $$

CREATE PROCEDURE SetCounter(
    INOUT counter INT,
    IN inc INT
)
BEGIN
    SET counter = counter + inc;
END$$

DELIMITER ;

/* Yuqorida hosil qilgan protsedura, INOUT parametr  va IN parametr qabul qiladi.
Endi shu protsedurani quyidagi hollarda ishga tushirib tekshiramiz:
-- @counter nomli o'zgaruvchiga 1 qiymati berildi:       */
SET @counter = 1;
-- boshlang'ich qiymati

-- SetCounter() protsedurasini ishga tushiramiz, unga ikkita parametr beramiz
CALL SetCounter(@counter, 1);
-- @counter ni qiymati 1 ga teng edi.
-- SET counter = counter + inc; bu amal bajarilgandan keyin,
-- @counter ning yangi qiymati @counter = 1 + 1, ya'ni 2 ga teng bo'ladi
-- Natijani chiqaramiz:
SELECT @counter;

/* Natija:
+----------+
| @counter |
+----------+
|        2 |
+---------*/
# ----------------------------------------------------------------------------------

# Davom etamiz va protsedurani yana ishga tushiramiz
CALL SetCounter(@counter, 1);
-- @counter ni yangi qiymati 2 ga teng bo'lgan edi yuqoridagi so'rovda.
-- SET counter = counter + inc; bu amal bajarilgandan keyin,
-- @counter ning yangi qiymati @counter = 2 + 1, ya'ni 3 ga teng bo'ladi
-- Natijani chiqaramiz:
SELECT @counter;

/* Natija:
+----------+
| @counter |
+----------+
|        3 |
+---------*/
# ---------------------------------------------------------------------------------
# --Davom etamiz va protsedurani IN paramterga boshqa qiymat berib ishga tushiramiz
CALL SetCounter(@counter, 5);
-- @counter ni yangi qiymati 3 ga teng bo'lgan edi yuqoridagi so'rovda.
-- SET counter = counter + inc; bu amal bajarilgandan keyin,
-- @counter ning yangi qiymati @counter = 3 + 5, ya'ni 8 ga teng bo'ladi
-- Natijani chiqaramiz:
SELECT @counter;

/* Natija:
+----------+
| @counter |
+----------+
|        8 |
+----------+

Ko'rib turganingizdek natija 8 ga teng.     */

# 1. IN (входной параметр)
# Используется для передачи значений в процедуру.
# Значение передается только внутрь и
# не может быть изменено внутри процедуры.
SET @customerId := 114;
DELIMITER //
CREATE PROCEDURE `GetUser`(IN `customer_id` INT)
BEGIN
    SELECT *
    FROM `customers`
    WHERE `customerNumber` = `customer_id`;
END //
DELIMITER ;
CALL GetUser(103); -- oddiy sonni yuborish
CALL GetUser(@customerId);
-- oddiy o'zgaruvchi sifatida yuborish

DELIMITER //
CREATE PROCEDURE limitlash(IN n INT UNSIGNED)
BEGIN
    SELECT *
    FROM customers
    LIMIT n;
END //
CALL limitlash(5); -- customers jadvalini 5 ta limit bilan chiqar

DELIMITER //
DROP PROCEDURE IF EXISTS sqrt_x;
CREATE PROCEDURE `sqrt_x`(IN x INT UNSIGNED, y INT UNSIGNED)
BEGIN
    SELECT SQRT(`x`)   AS "Ildizi",
           POW(`y`, 2) AS "Kvadrati"
    INTO `x`, `y`;
    SELECT `x`, `y`;
END //
CALL sqrt_x(36, 5);


# 2. OUT (выходной параметр)
# Используется для возврата значения из процедуры.
# Внутри процедуры можно изменить OUT параметр,
# но передавать ему значение при вызове не нужно.
DELIMITER //
CREATE PROCEDURE GetCustomerName(IN customer_id INT,
                                 OUT customer_name VARCHAR(100))
BEGIN
    SELECT `customerName`
    INTO `customer_name`
    FROM `customers`
    WHERE `customerNumber` = `customer_id`;
END //
DELIMITER ;

CALL GetCustomerName(103, @name);
# @name ni ko'rsatish
SELECT @name;

DELIMITER // # ; operator ishini tugatuvchi belgini / /  ga almashtirib turamiz
DROP PROCEDURE IF EXISTS `getEmployeeName`;
CREATE PROCEDURE `getEmployeeName`(IN employee_id INT, OUT employee_name VARCHAR(100))
BEGIN
    SELECT `firstName`
    INTO `employee_name`
    FROM `employees`
    WHERE `employeeNumber` = `employee_id`
    ORDER BY `employeeNumber`;
END //
CALL getEmployeeName(1002, @emp_name); -- 1-qiymatni(o'zgaruvchini) yuborib 2-qiymatga yozish
SELECT @emp_name;


# 3. INOUT (входной и выходной параметр)
# Может использоваться и для передачи данных в процедуру,
# и для возврата измененных данных.
DELIMITER //
CREATE PROCEDURE doubleValue(INOUT num INT)
BEGIN
    SET num = num * 2;
END //
DELIMITER ;
SET @value = 5;
CALL DoubleValue(@value);
SELECT @VALUE; -- 2 holatda ham 10 chiqadi
SELECT @value;

DROP PROCEDURE IF EXISTS `sonKvadrati`;
DELIMITER //
CREATE PROCEDURE `sonKvadrati`(INOUT `x` BIGINT UNSIGNED)
BEGIN
    SET `x` = POW(`x`, 2);
END //
SET @n = 50; -- shu sessiyadagina mavjud bo'ladigan n o'zgaruvchisi hosil qilib unga 50 qiymatini berish
CALL sonKvadrati(@n); -- shu proteduraga n ni yuborish
SELECT @n;
-- va o'zgartirilgan n ni olish

# Вывод:
# IN — только ввод, нельзя менять внутри процедуры.
# OUT — только вывод, перед вызовом значение не передается.
# INOUT — и ввод, и вывод, можно изменять внутри процедуры.


# В MySQL `IN`, `OUT` и `INOUT` используются для объявления параметров в хранимых процедурах.

### 1. **IN (входной параметр)**
#    - Передаёт значение в процедуру.
#    - Можно использовать в запросах, но нельзя изменять внутри процедуры (только для чтения).

#    **Пример:**

DELIMITER //
CREATE PROCEDURE GetProduct(IN `product_id` INT)
BEGIN
    SELECT * FROM `products` WHERE `id` = `product_id`;
END //
DELIMITER ;

#    **Вызов:**
CALL GetProduct(1);

USE `mashq`;
DELIMITER //
DROP PROCEDURE IF EXISTS `IN_test`;
CREATE PROCEDURE `IN_test`(IN `nomer` INT)
BEGIN
    SELECT *
    FROM `orders`
    WHERE `orderNumber` = `nomer`; -- nomer o'zgaruvchisida saqlangan qiymat bilan solishtiradi
END //
DELIMITER ;

# `orders` jadvalidagi `orderNumber` ustunidan
# qiymati 10100 ga teng bo'lganlarini olib beruvchi
# `IN_test` protsedurani 10100 argument bilan chaqirish:
CALL IN_test(10100);



### 2. **OUT (выходной параметр)**
#    - Используется для возврата значения из процедуры.
#    - Внутри процедуры его можно изменить.

#    **Пример:**

DELIMITER //
CREATE PROCEDURE `GetProductName`(IN `product_id` INT, OUT `product_name` VARCHAR(255))
BEGIN
    SELECT `name`
    INTO `product_name`
    FROM `products`
    WHERE `id` = `product_id`;
END //
DELIMITER ;

#    **Вызов:**
CALL GetProductName(1, @name);
SELECT @name;

DROP PROCEDURE IF EXISTS `OUT_test`;
DELIMITER +-
CREATE PROCEDURE IF NOT EXISTS `OUT_test`(IN `nomer_IN` INT, OUT `nomer_OUT` INT)
BEGIN
    SELECT `orderNumber`
    INTO `nomer_OUT`
    FROM `orders`
    WHERE `orderNumber` = `nomer_IN`;
END+-
DELIMITER ;

SET @test_var := 10100;
SELECT @test_var;
CALL OUT_test(2, @test_var);

### 3. **INOUT (входной и выходной параметр)**
#    - Может принимать входное значение и изменяться внутри процедуры.

#    **Пример:**
DELIMITER //
CREATE PROCEDURE DoubleValue(INOUT num INT)
BEGIN
    SET num = num * 2;
END //
DELIMITER ;


#    **Вызов:**
SET @val = 10;
CALL DoubleValue(@val);
SELECT @val;
-- Результат: 20

/* Когда использовать?
- **IN** — когда нужно передать данные в процедуру.
- **OUT** — когда нужно вернуть данные из процедуры.
- **INOUT** — когда нужно передать данные и изменить их внутри процедуры.
🚀
 */

/*
Можно сравнить с передачей аргументов в функции в языках программирования, например, C или PHP.

### **IN → передача аргумента по значению (by value)**
Это как обычный аргумент в C или PHP: передаём значение, но внутри оно не меняется снаружи.

#### **C**
```c
void func(int x) {
    x = x * 2; // Изменится только локально в функции
}

int main() {
    int a = 10;
    func(a);
    printf("%d", a); // Выведет 10, потому что a передавалось по значению
    return 0;
}
```

#### **PHP**
```php
function func($x) {
    $x = $x * 2; // Только локально
}

$a = 10;
func($a);
echo $a; // 10, потому что $a не изменилось
```

---

### **OUT → передача аргумента по указателю / ссылке (by reference)**
Значение передаётся обратно через указатель или ссылку.

#### **C**
```c
void func(int *x) {
    *x = *x * 2; // Меняем значение по адресу
}

int main() {
    int a = 10;
    func(&a); // Передаём адрес переменной
    printf("%d", a); // Выведет 20, потому что a изменилось
    return 0;
}
```

#### **PHP**
```php
function func(&$x) {
    $x = $x * 2; // Меняет исходную переменную
}

$a = 10;
func($a);
echo $a; // 20, потому что $a передавалось по ссылке
```

---

### **INOUT → аналог указателя / ссылки с возможностью передавать начальное значение**
Работает как `OUT`, но при этом можно передавать начальное значение.

#### **C**
```c
void func(int *x) {
    *x = *x * 2; // Изменяем переданное значение
}

int main() {
    int a = 10;
    func(&a); // Передаём адрес переменной
    printf("%d", a); // 20, так как a изменилось
    return 0;
}
```

#### **PHP**
```php
function func(&$x) {
    $x = $x * 2;
}

$a = 10;
func($a);
echo $a; // 20

---

### **Вывод**
- `IN` в MySQL = передача по значению (не изменяется в процедуре).
- `OUT` в MySQL = передача по ссылке (процедура может изменить значение).
- `INOUT` в MySQL = передача по ссылке (процедура может изменить значение и использовать начальное).
*/