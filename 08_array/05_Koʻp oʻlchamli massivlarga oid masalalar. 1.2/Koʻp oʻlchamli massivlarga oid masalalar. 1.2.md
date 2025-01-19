$mamlakatlar = array(
    array(
        "nomi"=>"O'zbekiston",
        "aholi_soni"=>"32979000",
        "maydoni"=>"448978",
        "poytaxti"=>"Toshkent",
        "pul_birligi"=>"So'm",
    ),
    array(
        "nomi"=>"Qozog'iston",
        "aholi_soni"=>"18157078",
        "maydoni"=>"2724902",
        "poytaxti"=>"Nursulton",
        "pul_birligi"=>"Tanga",
    ),
    array(
        "nomi"=>"Turkmaniston",
        "aholi_soni"=>"5125693",
        "maydoni"=>"488100",
        "poytaxti"=>"Ashxobod",
        "pul_birligi"=>"Manat",
    ),
    array(
        "nomi"=>"Turkiya",
        "aholi_soni"=>"80121000",
        "maydoni"=>"783000",
        "poytaxti"=>"Ankara",
        "pul_birligi"=>"Turk lira",
    ),
    array(
        "nomi"=>"Rossiya",
        "aholi_soni"=>"143000000",
        "maydoni"=>"17340000",
        "poytaxti"=>"Mosva",
        "pul_birligi"=>"Rubl",
    ),
    array(
        "nomi"=>"Xitoy",
        "aholi_soni"=>"1347374000",
        "maydoni"=>"9596000",
        "poytaxti"=>"Pekin",
        "pul_birligi"=>"Yuan",
    ),
    array(
        "nomi"=>"AQSH",
        "aholi_soni"=>"327000000",
        "maydoni"=>"9631000",
        "poytaxti"=>"Washington",
        "pul_birligi"=>"Dollar",
    ),
);


$kitoblar = [
    [
        "nomi" => "O'tgan kunlar", 
        "janr" => "tragediya", 
        "bet" => "200"
    ],
    [
        "nomi" => "Stiv Jobs", 
        "janr" => "tragediya", 
        "bet" => "200"
    ],
    [
        "nomi" => "Molxona", 
        "janr" => "komediya", 
        "bet" => "150"
    ],
    [
        "nomi" => "Hamsa", 
        "janr" => "tragediya", 
        "bet" => "580"
    ],
    [
        "nomi" => "Daftar hoshiyasidan bitiklar", 
        "janr" => "komediya", 
        "bet" => "140"
    ],
];

1. Mamlakatlar massividan foydalanib jadval yarating va massiv elementlarini 
chiqaring. (<table> dan foydalaning)

2. Mamlakatlar massividan, Poytaxti "Ankara"  bo`lgan Davlatni aniqlang 

3. Mamlakatlar massividan eng katta Maydonga ega bo'lgan Davlatni aniqlang

4. Kontaktbook yasang. Yani odamlarning ismi va uning telefon nomeridan tashkil 
topsin. Forma da inputga telefon nomer yozsam shu telefon nomerga mos odamni ism  familyasini chiqarib bersin.  

5. Mamlakat massividan foydalanib jadval yarating. (<table> dan foydalaning). 
Aholi soni bo'yicha o'sib borish tartibda saralangan holda chiqsin

6. Massivlar yordamida blog hosil qiling. 
Blog da Quyidagi menyular bo'lsin:
-Asosiy sahifa
-Sport yangiliklari
        -APL
        -OCHL
        -ECHL
-Texnologiya
        -Kompyuter
        -Mobil telefonlar
-Bog'lanish
Menyular ni bosganda biror page ga o'tishi shart emas. 
Ko'p o'lchamli massivdan foydalanib qilinsin.

Blogning quyidagi parametrlari bo'lsin:
-title
-content
-created_at - qo'shilgan sana
-author
-visited 

Blogda pagination ham bo'lsin. Har bir page da 4 tadan ma'lumot ko'rsatilsin. 

7. 

// ikki o'lchamli massiv uchun
Ro'yxatdan o'tish formasini yasang. Ismi, Familyasi, username, password, confirm password kiritish formalari bo'lsin. 
Talablar:
-Barcha inputlar to'ldirilishi shart;
    -Ism va Familya 3 ta harfdan kam bo'lmasligi kerak;
-username - email bo'lishi kerak;
-password - 8 ta harfdan kam bo'lmasligi va oxirgi 2 harfi son bo'lishi kerak;
-confirm_password - password bilan bir xil qiymatda bo'lishi kerak.

Agar ushbu shartlarni birortasi bajarilmasa, ekranga massiv 
ko'rinishida qaysi input polyada qayshi shart najarilmaganini xabari berilsin.



8. $kitoblar massividan quyidagi ko'rinishda massiv hosil qiling.

Array
(
    [tragediya] => Array
        (
            [0] => Array
                (
                    [nomi] => O'tgan kunlar
                    [janr] => tragediya
                    [bet] => 200
                )
            [1] => Array
                (
                    [nomi] => Stiv Jobs
                    [janr] => tragediya
                    [bet] => 200
                )
            [2] => Array
                (
                    [nomi] => Hamsa
                    [janr] => tragediya
                    [bet] => 580
                )
        )
    [komediya] => Array
        (
            [0] => Array
                (
                    [nomi] => Molxona
                    [janr] => komediya
                    [bet] => 150
                )
            [1] => Array
                (
                    [nomi] => Daftar hoshiyasidan bitiklar
                    [janr] => komediya
                    [bet] => 140
                )
        )
)