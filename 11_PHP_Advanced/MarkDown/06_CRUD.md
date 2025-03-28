# CRUD

# PHP + MySQL: SELECT

```php

$sth = $conn->prepare('SELECT firstname, lastname, email FROM talaba');
$sth->execute(); 
$result = $sth->fetchAll(\PDO::FETCH_ASSOC);
echo "<pre>";
print_r($result);
```

### bindParam() bilan select qilish

```php
$firstname = 'Sardor';

$sth = $conn->prepare('SELECT firstname, lastname, email
    FROM talaba WHERE firstname = :ism');

$sth->**bindParam**(':ism', $firstname);
$firstname = 'Eshmat';

$sth->execute(); //firstname = Eshmat bilan execute qiladi

$result = $sth->fetchAll(\PDO::FETCH_ASSOC);
print_r($result);
```

## bindValue() bilan select qilish

```php
$firstname = 'Sardor';

$sth = $conn->prepare('SELECT firstname, lastname, email
    FROM talaba WHERE firstname = :firstname');

$sth->**bindValue**(':firstname', $firstname, PDO::PARAM_STR);
$firstname = 'Eshmat';

$sth->execute(); //firstname = Sardor bilan execute qiladi
$result = $sth->fetchAll(\\PDO::FETCH_ASSOC);
print_r($result);

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

# PHP + MySQL: INSERT

```php
$sql_insert = "INSERT INTO talaba (firstname, lastname, email)
VALUES ('Sardor', 'Dushamov', 'dsq2190@gmail.com');";

//PDO
try {
    $conn->exec($sql_insert);
    echo "Insert qilindi";
}catch(PDOException $e) {
    echo "Insert qilishda xatolik1:" . $e->getMessage();
}
```

### prepare() bilan insert qilish

```php
$insert = "INSERT INTO talaba (firstname, lastname, email) 
VALUES (?, ?, ?);";
$stmt = $conn->**prepare**($insert);
try{
    $stmt->execute(['Eshmat', 'Dushamov', 'dsq2190@gmail.com']);
}catch (Exception $e){
    print_r($e->getMessage());
}

**yoki**

$data = [
	":firstname"=>"Eshmat", 
	":lastname"=>"Dushamov",
	":email"=>"dsq2190@gmail.com"
];

$insert = "INSERT INTO talaba (firstname, lastname, email) 
VALUES (:firstname, :lastname, :email);";
$stmt = $conn->**prepare**($insert);
try{
    $stmt->execute($data);
}catch (Exception $e){
    print_r($e->getMessage());
}
```

### bindParam() bilan insert qilish

```php
$stmt = $conn_pdo->prepare("INSERT INTO talaba (firstname, lastname, email)
    VALUES (:firstname, :lastname, :email)");

		$stmt->bindParam(':firstname', $firstname);
		$stmt->bindParam(':lastname', $lastname); 
		$stmt->bindParam(':email', $email);

		// insert a row
    $firstname = "John";
    $lastname = "Doe";
    $email = "john@example.com";
    $stmt->execute();
```

### bindValue() bilan insert qilish

```php
$stmt = $conn->prepare("INSERT INTO talaba (firstname, lastname, email)
    VALUES (:firstname, :lastname, :email)");

$lastname = "Doe";
$email = "john@example.com";
$stmt->bindValue(':firstname', "Toshmat");
$stmt->bindValue(':lastname', $lastname);
$stmt->bindValue(':email', $email);

$stmt->execute();
```

# PHP + MySQL: UPDATE

```php
$sql_update = "UPDATE talaba SET firstname=:firstname WHERE id=:id";
$prepare = $conn->prepare($sql_update);
$prepare->bindParam(':firstname', $firstname);
$prepare->bindParam(':id', $id);

$firstname = "Jasur";
$id = 358;

$prepare->execute();

YOKI

$data = [
	":firstname"=>"Jasur",
	":id"=>358
];
$sql_update = "UPDATE talaba SET firstname=:firstname WHERE id=:id";
$prepare = $conn->prepare($sql_update);

$prepare->execute($data);
```

# PHP + MySQL: DELETE

```php
$sql_delete = "DELETE FROM talaba WHERE id=:id";
$prepare = $conn->prepare($sql_delete);
$data = [":id" => 360];
$prepare->execute($data);

Jadvaldan barchasini o'chirish uchun:

$sql_delete = "DELETE FROM talaba";
$conn->exec();
```