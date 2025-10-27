<?php
// 2-masala.Textareaga kiritilgan
// kirilchadagi matnni lotinchaga va aksincha,
// lotinchada kirilchaga o’girsin.


// Lotinchadan krillchaga
function latinToCyrillic($text): string
{
    $latin = [
        "O‘", "G‘", "Sh", "Ch", "Ng", "Yo", "Ya", "Yu", "E",
        "o‘", "g‘", "sh", "ch", "ng", "yo", "ya", "yu", "e",
        "A", "B", "D", "E", "F", "G", "H", "I", "J", "K", "L",
        "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "X",
        "Y", "Z", "a", "b", "d", "e", "f", "g", "h", "i", "j",
        "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u",
        "v", "x", "y", "z", "'"
    ];
    $cyrillic = [
        "Ў", "Ғ", "Ш", "Ч", "Нг", "Ё", "Я", "Ю", "Э",
        "ў", "ғ", "ш", "ч", "нг", "ё", "я", "ю", "э",
        "А", "Б", "Д", "Е", "Ф", "Г", "Ҳ", "И", "Ж",
        "К", "Л", "М", "Н", "О", "П", "Қ", "Р", "С",
        "Т", "У", "В", "Х", "Й", "З", "а", "б", "д",
        "е", "ф", "г", "ҳ", "и", "ж", "к", "л", "м",
        "н", "о", "п", "қ", "р", "с", "т", "у", "в",
        "х", "й", "з", "ъ"
    ];

    // $text da uchragan $latin massividagi
    // elementlarni birma bir $cyrillic dagi elementlar bilan almashtirsin
    return str_replace($latin, $cyrillic, $text);   
}

// krillchadan lotinchaga
function cyrillicToLatin($text): string
{
    $cyrillic = [
        "Ў", "Ғ", "Ш", "Ч", "Нг", "Ё", "Я", "Ю", "Э",
        "ў", "ғ", "ш", "ч", "нг", "ё", "я", "ю", "э",
        "А", "Б", "Д", "Е", "Ф", "Г", "Ҳ", "И", "Ж",
        "К", "Л", "М", "Н", "О", "П", "Қ", "Р", "С",
        "Т", "У", "В", "Х", "Й", "З", "а", "б", "д",
        "е", "ф", "г", "ҳ", "и", "ж", "к", "л", "м",
        "н", "о", "п", "қ", "р", "с", "т", "у", "в",
        "х", "й", "з", "ъ"
    ];
    $latin = [
        "O‘", "G‘", "Sh", "Ch", "Ng", "Yo", "Ya", "Yu", "E",
        "o‘", "g‘", "sh", "ch", "ng", "yo", "ya", "yu", "e",
        "A", "B", "D", "E", "F", "G", "H", "I", "J", "K", "L",
        "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "X",
        "Y", "Z", "a", "b", "d", "e", "f", "g", "h", "i", "j",
        "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u",
        "v", "x", "y", "z", "'"
    ];

    // $text da uchragan $cyrillic massividagi
    // elementlarni birma bir $latin dagi elementlar bilan almashtirsin
    return str_replace($cyrillic, $latin, $text);
}

if (!empty($_POST["textarea"]) && !empty($_POST['type'])) 
{
    
    $text = $_POST["textarea"];     // kiritilgan matn
    $type = $_POST["type"];         // bosilgan tugma (krilchami lotinchami?)

    // agar lotinchaga o'girish tugmasi bosilgan bo'lsa
    if ($type === "Lotinchaga o'girish") 
    {
        $text = cyrillicToLatin($text);
    }
    
    // agar krillchaga o'girish tugmasi bosilgan bo'lsa
    if ($type === "Криллчага ўгириш") 
    {
        $text = latinToCyrillic($text);
    }

}

?>

<form method="post">
    <h4><label for="txtarea">Matn kiriting: | Матн киритинг: </label><br></h4>
    <p>
        <textarea cols="50" name="textarea" rows="10" id="txtarea" autofocus required></textarea>
    </p>
    <input type="submit" value="Lotinchaga o'girish" name="type">
    <input type="submit" value="Криллчага ўгириш" name="type">
</form>

<p>
    <?= $text ?? ''; ?>
</p>