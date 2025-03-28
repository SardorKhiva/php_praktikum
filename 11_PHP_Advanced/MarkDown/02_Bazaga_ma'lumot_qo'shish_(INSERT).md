# Bazaga ma'lumot qo'shish (INSERT)

# MySQLi da

```php
$sql_insert = "INSERT INTO dars2.talaba (firstname, lastname, email, registered_at)
VALUES ('Sardor', 'Dushamov', 'dsq2190@gmail.com', '2020-01-28 16:03:42');";
//MySQLi
if ($conn->query($sql_insert) === TRUE) {
    echo "Insert qilindi";
} else {
    echo "Jadval hosil qilishda xatolik: " . $conn->error;
}
$conn->close();
```

# PDO da

```php
$sql_insert = "INSERT INTO dars2.talaba (firstname, lastname, email, registered_at)
VALUES ('Sardor', 'Dushamov', 'dsq2190@gmail.com', '2020-01-28 16:03:42');";
//PDO
try {
    $conn_pdo->exec($sql_insert);
    echo "Insert qilindi";
}catch(PDOException $e) {
    echo "Insert qilishda xatolik1:" . $e->getMessage();
}
```

# Bir vaqtni o'zida birnechta ma'lumot

## MySQLi da

**`multi_query()`** - funksiyasi yordamida amalga oshirish mumkin

```php
$sql_insert = "INSERT INTO dars2.talaba (firstname, lastname, email, registered_at)
VALUES ('Sardor', 'Dushamov', 'dsq2190@gmail.com', '2020-01-28 16:03:42');";
$sql_insert .= "INSERT INTO dars2.talaba (firstname, lastname, email, registered_at)
VALUES ('Sardor1', 'Dushamov1', 'dsq2190@gmail.com', '2020-01-28 16:03:42');";
$sql_insert .= "INSERT INTO dars2.talaba (firstname, lastname, email, registered_at)
VALUES ('Sardor2', 'Dushamov2', 'dsq2190@gmail.com', '2020-01-28 16:03:42');";
//MySQLi
if ($conn->**multi_query**($sql_insert) === TRUE) {
    echo "Insert qilindi";
} else {
    echo "Jadval hosil qilishda xatolik: " . $conn->error;
}
$conn->close();
```

## PDO da

```php
$conn_pdo->exec($sql_insert);
```

# lastInsertId()

So'nggi kiritilgan qator yoki ketma-ketlik IDsini qaytaradi

```php
$sql_insert = "INSERT INTO talaba (firstname, lastname, email, registered_at)
VALUES ('Sardor', 'Dushamov', 'dsq2190@gmail.com', '2020-01-28 16:03:42');";

$conn->exec($sql_insert);
echo $conn->lastInsertId();
```