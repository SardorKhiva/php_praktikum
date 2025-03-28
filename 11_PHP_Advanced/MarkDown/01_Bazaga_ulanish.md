# Bazaga ulanish

```php
Agar PDO yoqilmagan bo'lsa uni php.ini fayli orqali yoqish kerak boladi
php -m

php.ini faylini ichidan shu qatorni topiladi
;**extension=php_pdo_mysql.dll**

va

**extension=php_pdo_mysql.dll

Agar postgresql ishlatayotgan bo`lsangiz:
;extension=php_pdo_pgsql.dll
extension=php_pdo_pgsql.dll**
```

# MySQLi  bilan ulanish

```php
$servername = "localhost";
$username = "username";
$password = "password";
$dbname = "database_nomi";

// Bazaga ulanish
$conn = new mysqli($servername, $username, $password, $dbname);

// Bazaga ulanganligini tekshirish
if ($conn->connect_error) {
    die("Bazaga ulana olmadi: " . $conn->connect_error);
}
echo "Bazaga ulandi!";
```

Barcha so'rovlar bajarilganidan keyin PHP avtomat tarzda ulanishni yopadi. Agar o'zimiz ulanishni yopishni xohlasak
quyidagi ko'rinishda yopamiz

```php
$conn->close();
```

# PDO bilan ulanish

```php
$servername = "localhost";
$username = "username";
$password = "password";
$dbname = "database_nomi";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname",$username, $password);
    echo "Bazaga ulandi!";
} catch(PDOException $e){
    echo "Bazaga ulana olmadi: " . $e->getMessage();
}
```

## Jadval hosil qilish

`PHP` kod orqali `MySQL` da jadval hosil qilamiz. Buning uchun jadval hosil qilish so'rovini `php` da biror
o'zgaruvchiga qiymat qilib beramiz

```php
$sql = "CREATE TABLE talaba (
	id INT AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(30) NOT NULL,
	lastname VARCHAR(30) NOT NULL,
	email VARCHAR(50),
	registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)";
```

# MySQLi da

```php
if ($conn->query($sql) === TRUE) {
    echo "Jadval hosil qilindi";
} else {
    echo "Jadval hosil qilishda xatolik: " . 
$conn->error;
}
$conn->close();
```

**`query()`** - SQL so'rovlarni bajarishga buyruq beradigan funksiya hisoblanadi.

# PDO da

```php
try {
	$conn->exec($sql);
	echo "Jadval hosil qilindi";
}catch(PDOException $e) {
    echo "Jadval hosil qilishda xatolik:" . $e->getMessage();
}
```

**`exec()` -** funksiyasi ham sql so'rovlarni bajarib beruvchi funksiya hisoblanadi