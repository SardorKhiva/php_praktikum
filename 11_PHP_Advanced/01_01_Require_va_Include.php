<?php

        // REQUIRE va INCLUDE
/*
Keling ushbu mavzuni yaxshi tushunib olishimiz uchun misol keltirsak:

Tasavvur qiling siz yangiliklar sayti yani blog qilmoqchisiz. 
Blogimiz quyidagi 3 qismdan tashkil topadi:
Header qismi. Ya'ni saytning eng tepa, menyular joylashadigan qismi
Yangiliklarni o'qish va ro'yxatini ko'rish qismi. 
Bu qism content qismi deyiladi
Eng pastgi qismi. Buni veb dasturlashda footer deyiladi */
// header.php:
// <?php
echo "bu header";



// footer.php:
echo "bu footer";


// index.php:

include 'header.php';
echo "bu asosiy"."<br>";
include 'footer.php';


// require va include - php skriptga php fayllarni qo'shib qo'yish uchun ishlatiladi.
// require - agar php fayl mavjud bo'lmasa shu joyni o'zida xato berib ishni to'xtatadi.
// include esa shu xatoni ko'rsatib skriptni ishini davom qildiradi.
// include_once - agar qo'shilayotgan php bir xil bo'lsa faqat 1 tasi qoladi (xatoni sakrab o'tadi)
// require_once - agar agar qo'shilayotgan php bir xil bo'lsa faqat 1 tasi qoladi (xatoni bo'lsa stop)

echo "Bu asosiy php fayli\n";

// agar qo'shilayotgan faylda funksiyalar ham bo'lsa xato beradi, chunki funksiyalar ham qayta e'lon qilinadi
// require "01_02_Include_demo.php";   // faylni mavjud bor bo'lsa qo'shadi aks holda shu joyda stop beradi
// include "01_02_Include_demoo.php";  // xatoni ham ko'rsatib skript bajarilishda davom etadi
// require "01_03_Include_demoo.php";  // xato , shu joyga kelganda stop beradi


// include qilingan fayldagi o'zgaruvchidan foydalanish:

// require "01_02_Include_demo.php";
//require "01_02_Include_demo.php";   // yana bir bor nariga skriptdagi matnni ko'rsatadi

// require_once "01_02_Include_demo.php";
// include_once "01_02_Include_demo.php";
// include_once __DIR__ . "/01_02_Include_demo.php";
require_once __DIR__ . "/01_02_Include_demo.php";
echo "Bir dona $color $meva bor\n";   // qo'shilgan php dagi o'zgaruvchidan foydalandik

echo "15 soni " . toq(15) . PHP_EOL;    // qo'shilgan php dagi function dan foydalandik