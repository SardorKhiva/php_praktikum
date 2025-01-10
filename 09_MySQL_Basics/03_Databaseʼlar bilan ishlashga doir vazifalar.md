Databaseʼlar bilan ishlashga doir vazifalar
Ushbu vazifalarni bajarishda, qanday so'rovlar yoziladi, shularni yozib jo'nating.

1) Databasega oid komandalarni takrorlang. Yangi database qo'shing. Nomi "maktab" bo'lsin.

Databaseni o'chiring va qaytadan qo'shing. Database lar ro'yxatini chiqaring

(O'rganish uchun mashq)



2) "users" jadvalini qo'shing. id, username, password, status, created_date - ushbu maydonlardan tashkil topsin.

id - primary key bo'lsin

username 50 tadan oshmaydigan harfdan iborat bo'lsin, boshlang'ich qiymati yo'q, NULL qiymatni qabul qila olmasin

password 32 dan oshmaydigan simvollardan iborat bo'lsin, Boshlang'ich qiymati NULL bo'lsin

status sonlarni qabul qilsin faqat. boshlang'ich qiymati 1 ga teng bo'lsin



3)"maktab" databaseiga quyidagi jadvallarni qo'shing:
"fanlar", "ustozlar", "talabalar".
Qanday ustunlar bo'lishini o'ziz o'ylang.
Misol: ustozlar jadvalini tuzmoqchi bo'lsangiz o'ylang, Ustozni qanday parametrlari bo'ladi odatda?
-ismi
-familyasi
-otasini ismi
-qaysi fandan dars berishi
-tugilgan yili
-manzili
-tel nomeri

4)Telefon kontaktlarini saqlash uchun jadval yarating. Imi, Familyasi, telefon nomeri ustunlari bo'lsin.
Bitta telefon nomer qaytadan kiritish imkoni bo'lmasin.

Yani 1 kishida bir nechta telefon nomer bo'lishi mumkin, lekin 1 ta telefon nomer bir nechta kishida bo'lmasligi kerak.

5)Eski "talabalar" jadvalini o'chirib yangi "talabalar" jadvalini hosil qiling.
Qanday ustunlari bo`lishini o`ylang. Bitta talabani ikkinchi marta kiritish imkoni mavjud bo`lmasligini ta`minlang 