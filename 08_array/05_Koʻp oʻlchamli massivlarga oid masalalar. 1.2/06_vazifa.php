<?php
/**
 * 6. Massivlar yordamida blog hosil qiling.
 * Blog da Quyidagi menyular bo'lsin:
 * -Asosiy sahifa
 * -Sport yangiliklari
 * -APL
 * -OCHL
 * -ECHL
 * -Texnologiya
 * -Kompyuter
 * -Mobil telefonlar
 * -Bog'lanish
 * Menyular ni bosganda biror page ga o'tishi shart emas.
 * Ko'p o'lchamli massivdan foydalanib qilinsin.
 *
 * Blogning quyidagi parametrlari bo'lsin:
 * -title
 * -content
 * -created_at - qo'shilgan sana
 * -author
 * -visited
 *
 * Blogda pagination ham bo'lsin. Har bir page da 4 tadan ma'lumot ko'rsatilsin.
 */
$sana = date("r");
$s = "Sardor Khorazmiy";

$blog_menyu = [
    ["title" => "Asosiy sahifa",
        "content" => "Asosiy sahifa haqida ma'lumotlar",
        "created_at" => "$sana",
        "author" => "$s",
        "visited" => false
    ],
    ["title" => "Sport yangiliklari",
        "content" => "Sport yangiliklari haqida",
        "created_at" => "$sana",
        "author" => "$s",
        "visited" => false
    ],
    ["title" => "APL",
        "content" => "APL haqida",
        "created_at" => "$sana",
        "author" => "$s",
        "visited" => false
    ],
    ["title" => "OCHL",
        "content" => "OCHL haqida",
        "created_at" => "$sana",
        "author" => "$s",
        "visited" => false
    ],
    ["title" => "ECHL",
        "content" => "ECHL haqida",
        "created_at" => "$sana",
        "author" => "$s",
        "visited" => false
    ],
    ["title" => "Texnologiya",
        "content" => "Yangi texnologiyalar haqida maqolalar",
        "created_at" => "$sana",
        "author" => "$s",
        "visited" => false
    ],
    ["title" => "Kompyuter",
        "content" => "Kompyuterlar haqida maqolalar",
        "created_at" => "$sana",
        "author" => "$s",
        "visited" => false
    ],
    ["title" => "Mobil telefonlar",
        "content" => "Mobil telefonlar haqida maqolalar",
        "created_at" => "$sana",
        "author" => "$s",
        "visited" => false
    ],
    ["title" => "Bog'lanish",
        "content" => "Blog egasi bilan bog'lanish",
        "created_at" => "$sana",
        "author" => "$s",
        "visited" => false
    ]
];

foreach ($blog_menyu as $blog)
{
    foreach ($blog as $key => $value)
    {
       if ($blog['visited'] === false)
       {
            echo $blog['title'] . "<br>";
            echo "<b>Content haqida: </b> " . $blog['content'] . "<br>";
            echo "<b>Qachon yozildi: </b> " . $blog['created_at'] . "<br>";
            echo "Muallif: " . $blog['author'] . "<br>";
            $blog['visited'] = true;
       }
    }
    echo "<br>";
}