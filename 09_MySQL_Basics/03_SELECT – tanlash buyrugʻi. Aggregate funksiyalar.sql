# Ma'lumotlarni olish, jadvalning ustun_1 va boshqa ustunlarini ko'rsatish:
# mysql> SELECT ustun_1, ustun_2, ... FROM jadval;

# Kategoriya nomli jadvalning barcha ustunlarini olish, ko'rsatish:
# mysql> SELECT * FROM Kategoriya;

# name jadvalidan department ustunini tanlash:
# mysql> SELECT name FROM department;

# Jadvaldan kerakli ustunlarni tanlash:
# departmanet jadvalidagi name va id ustunlarini tanlash, ko'rsatish:
# mysql> SELECT name, id FROM department;

# Alias, o'zgacha nomlash
# department jadvalidagi name ustunini nomi deb ko'rsatish:
# mysql> SELECT name AS nomi, id FROM department;
# mysql> SELECT name nomi, id FROM department; -- AS siz ham yozsa bo'ladi

#                     MySQl aggregate functions
# SUM - Yig'indisi
# mysql> SELECT SUM(`ustun_nomi`) as `alias` from `jadval_nomi`;


# AVG - O'rtacha qiymatni oladi
# mysql> SELECT AVG(`ustun_nomi`) as `alias` from `jadval_nomi`;


# MAX - Ustundagi maximal elementni olish
# mysql> SELECT MAX(`ustun_nomi`) as `alias` from `jadval_nomi`;

# MIN - Ustundagi minimal elementni olish
# mysql> SELECT MIN(`ustun_nomi`) as `alias` from `jadval_nomi`;

# COUNT - Jadvaldagi qatorlar sonini olish
# mysql> SELECT COUNT(*) FROM department;
# mysql> SELECT COUNT(*) AS jami FROM department; -- jami qatorlar soni

# CONCAT - Ustunlarni birlashtirish, masalan ism + familya:
# select concat(first_name, ' ', last_name) as ism_familyasi from user_details;