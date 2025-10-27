<?php
/*   5-masala.
Sodda kalkulyator qiling. Ikkita son berilgan A va B;
Shu sonlar ustida qo`shish, ayirish, bo`lish, ko`paytirish amallarini bajaring.
$amal = "-"; bo`lsa ayirsin, $amal = "*" bo`lsa, ikkita sonni kopaytirsin.
+ bo`lsa qo`shsin, / bo`lsa bo`lsin.
 */

global $input, $result, $a, $b, $amal, $natija;

echo "\n__________________Sodda kalkulyator__________________\n";
echo "\nRaqam, Arifmetik Amal, Yana raqam = Natija: \n";

// oddiy kod ichida koddan misol yechish:
//    $input = trim(floatval(STDIN));
//
//    $result = eval("return $input;");
//    echo "Natija: $result\n";
//
//    echo eval("return $input;");

$a = floatval(trim(readline()));
$amal = trim(readline());
$b = floatval(trim(readline()));

switch ($amal) {
    case "+": $natija = $a + $b; break;
    case "-": $natija = $a - $b; break;
    case "*": $natija = $a * $b; break;
    case "/":
        if ($b != 0) {
            $natija = $a / $b;
            break;
        }
        else{
            exit();
        }
    case "%": $natija = $a % $b; break;
    default: $natija = null;
}
echo "$a $amal $b = $natija" . PHP_EOL . PHP_EOL;

////////////////////////////////////////////////////////
$input = trim(fgets(STDIN)); // Читаем строку из стандартного ввода

// ifodani qismlarga ajratamiz:
if (sscanf($input, "%f%[+-*/%]%f", $num1, $operator, $num2) === 3)
{
    // hisoblash
    $result = match ($operator)
    {
        '+' => $num1 + $num2,
        '-' => $num1 - $num2,
        '*' => $num1 * $num2,
        '/' => $num2 != 0 ? $num1 / $num2 : "0 ga bo'lib bo'lmaydi",
        default => "Noma'lum operator",
    };

// switch ($operator)
//    {
//        case '+':            $result = $num1 + $num2;            break;
//        case '-':            $result = $num1 - $num2;            break;
//        case '*':            $result = $num1 * $num2;            break;
//        case '/':            $result = $num2 != 0 ? $num1 / $num2 : "0 ga bo'lib bo'lmaydi";
//            break;
//        default:             $result = "Noma'lum operator";
//    }

    echo "Natija: $result\n";
}
else
{
    echo "Xato kiritildi, qaytdana urinib ko'ring.\n";
}