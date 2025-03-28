# PREPARE

```php
prepare()
bindParam()
execute()
```

# INSERT

```php
$insert = "INSERT INTO talaba (firstname, lastname, email) 
VALUES (?, ?, ?);";
$stmt = $conn->prepare($insert);
try{
    $stmt->execute(['Sardor', $lastname, 'dsq2190@gmail.com']);
}catch (Exception $e){
    print_r($e->getMessage());
}

```

### 

```php
$stmt = $conn->prepare("INSERT INTO talaba (firstname, lastname, email)
    VALUES (:firstname, :lastname, :email)");

		$stmt->bindParam(':firstname', $firstname);
		$stmt->bindParam(':lastname', $lastname); 
		$stmt->bindParam(':email', $email);

		// insert a row
    $firstname = "John";
    $lastname = "Doe";
    $email = "john@example.com";
    $stmt->execute();

    // insert another row
    $firstname = "Mary";
    $lastname = "Moe";
    $email = "mary@example.com";
    $stmt->execute();

    // insert another row
    $firstname = "Julie";
    $lastname = "Dooley";
    $email = "julie@example.com";
    $stmt->execute();
```

```php
$data =[
    ':firstname'=>$firstname,
    ':lastname'=>$lastname,
    ':email'=>$email',
];
$stmt->execute($data);
```

# UPDATE

```php
$sql_update = "update talaba set firstname=:firstname where id=:id";
$prepare = $conn->prepare($sql_update);
$prepare->bindParam(':firstname', $firstname);
$prepare->bindParam(':id', $id);

$firstname = "Jasur";
$id = 19;

$prepare->execute();
```

# DELETE

```php
$sql = "DELETE FROM talaba WHERE id=:id";
$prepare = $conn->prepare($sql);
$prepare->bindParam(':id', $id);
$prepare->execute($sql);

CRUD - Create, Read, Update, Delete
insert, select, update, delete
```