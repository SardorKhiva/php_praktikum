# Console dan:
# mysql -u root -p
# mysql user root password kengaytirilgani
# teriladi va enter bosiladi. Keyin parol bo'lsa kiritiladi.
# Boshida parol bo'lmaydi.

#Keyin db lar ko'riladi:
SHOW DATABASES;

#birorta db hosil qilinadi yoki
# mavjud db_temp_uchun tanlanadi
USE `db_temp_uchun`;

# bo'sh db db_temp_uchun ga importga.sql dan import qilish:
# mysql -u root -p db_temp_uchun < importga.sql

# keyin parol kiritiladi, xato bo'lsa chiqaradi.