# PDOStatement

##

## bindParam()

Parametr bilan qiymat berish

```php
$firstname = "Sardor";

$sth = $conn->prepare('SELECT firstname, lastname, email
    FROM talaba WHERE firstname = :ism');

$sth->**bindParam**(':ism', $firstname, PDO::PARAM_STR);
$firstname = 'Eshmat';

$sth->execute(); //firstname = Eshmat bilan execute qiladi

$result = $sth->fetchAll(\PDO::FETCH_ASSOC);
print_r($result);
```

## bindValue()

```php
$firstname = 'Sardor';

$sth = $conn->prepare('SELECT firstname, lastname, email
    FROM talaba WHERE firstname = :firstname');

$sth->**bindValue**(':firstname', $firstname, PDO::PARAM_STR);
$firstname = 'Eshmat';

$sth->execute(); //firstname = Sardor bilan execute qiladi
$result = $sth->fetchAll(\PDO::FETCH_ASSOC);
print_r($result);
```

## execute()

Tayyorlangan so'rovni bajaradi

```php
$sth = $conn->prepare('SELECT firstname, lastname, email
    FROM talaba WHERE firstname = :firstname');

$sth->bindParam(':firstname', $firstname, PDO::PARAM_STR);

$firstname = 'Sardor';

$sth->**execute**();
```

## errorInfo()

SQL so'rovlar bajarishda sodir bo'lgan xatolik haqida ma'lumot olish

```php

$sth = $conn->prepare('SELECT firstnamae, lastname, email
    FROM talaba
    WHERE firstname = :firstname');
$sth->bindValue(':firstname', $firstname, PDO::PARAM_STR);

$firstname = 'Mary';
$sth->execute();
$arr = $sth->**errorInfo**();
print_r($arr);
```

## fetch()

So'rov natijalar to'plamidan 1 tasini olish

```php
$firstname = 'Sardor';
$sth = $conn->prepare('SELECT id, firstname, lastname, email
    FROM talaba
    WHERE firstname = :firstname order by id DESC ');
$sth->bindValue(':firstname', $firstname, PDO::PARAM_STR);
$sth->execute();

$result = $sth->fetch(PDO::FETCH_ASSOC);
$result = $sth->fetch(PDO::FETCH_BOTH);
$result = $sth->fetch(PDO::FETCH_LAZY);
$result = $sth->fetch(PDO::FETCH_OBJ);
print_r($result);
```

## fetchAll()

So'rov natijalar to'plamidan barchasini olish

```php
$firstname = 'Sardor';
$sth = $conn->prepare('SELECT id, firstname, lastname, email
    FROM talaba
    WHERE firstname = :firstname order by id DESC ');
$sth->bindValue(':firstname', $firstname, PDO::PARAM_STR);
$sth->execute();
$result = $sth->fetchAll(PDO::FETCH_ASSOC);
$result = $sth->fetchAll(PDO::FETCH_BOTH);
$result = $sth->fetchAll(PDO::FETCH_LAZY);
$result = $sth->fetchAll(PDO::FETCH_OBJ);
print_r($result);
```

## rowCount()

So'rov natijasidagi qatorlar sonini qaytaradi

```php
$firstname = 'Sardor';
$sth = $conn->prepare('SELECT id, firstname, lastname, email
    FROM talaba
    WHERE firstname = :firstname order by id DESC ');
$sth->bindValue(':firstname', $firstname, PDO::PARAM_STR);
$sth->execute();
$count = $sth->rowCount();
```