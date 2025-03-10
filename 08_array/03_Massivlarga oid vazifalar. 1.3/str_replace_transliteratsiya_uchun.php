<?php
// Функция `str_replace` в PHP используется для
// замены строк или символов в тексте.
// Она может заменить одно значение или массив значений на другое.
// Функция является мощным инструментом для выполнения поиска и замены в строках.

### Синтаксис

// str_replace(mixed $search, mixed $replace, mixed $subject, int &$count = null): string|array

### Аргументы:

/*
1. **`$search`**:
   - Что искать в тексте. Это может быть строка или массив строк.

2. **`$replace`**:
   - На что заменять найденное. Это может быть строка или массив строк.

3. **`$subject`**:
   - Исходная строка (или массив строк), где будет выполняться поиск и замена.

4. **`$count`** (необязательный):
   - Сюда записывается количество выполненных замен.
*/

### Возвращаемое значение:
//- Если `$subject` — строка, возвращается строка с заменами.
//- Если `$subject` — массив, возвращается массив с заменами.


### Пример 1: Простая замена в строке

$text = "Hello, World!";
$result = str_replace("World", "PHP", $text);

echo $result; // Вывод: Hello, PHP!

### Пример 2: Замена нескольких строк

$text = "I love apples and oranges.";
$result = str_replace(["apples", "oranges"], ["bananas", "grapes"], $text);

echo $result; // Вывод: I love bananas and grapes.

### Пример 3: Количество замен

$text = "apple apple apple";
$result = str_replace("apple", "banana", $text, $count);

echo $result; // Вывод: banana banana banana
echo $count;  // Вывод: 3

### Пример 4: Замена в массиве

$fruits = ["apple", "orange", "apple pie"];
$result = str_replace("apple", "banana", $fruits);

print_r($result);
// Вывод:
// Array
// (
//     [0] => banana
//     [1] => orange
//     [2] => banana pie
// )

/*
### Особенности работы:
1. **Порядок замен**:
   - Если использовать массивы, замены производятся слева направо, в порядке указания элементов.

2. **Чувствительность к регистру**:
   - Функция чувствительна к регистру. Например, `str_replace("world", "PHP", "Hello, World!")` ничего не заменит.

3. **Неизменность исходного значения**:
   - `str_replace` не изменяет переданную строку или массив, а возвращает новую строку или массив с заменами.
*/

### Пример для транслитерации:

$text = "Shahar Chiroyli";
$result = str_replace(["Sh", "Ch"], ["Ш", "Ч"], $text);

echo $result; // Вывод: Шахар Чиройли

/*
### Когда использовать:
- Для простой и прямой замены в строках.
- Для обработки массивов, требующих одинаковых замен.
- При выполнении транслитерации или нормализации текста.
*/