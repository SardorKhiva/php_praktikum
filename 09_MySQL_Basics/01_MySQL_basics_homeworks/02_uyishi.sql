# 2) "users" jadvalini qo'shing. id, username, password, status, created_date -
#  ushbu maydonlardan tashkil topsin.
#
# id - primary key bo'lsin
#
# username 50 tadan oshmaydigan harfdan iborat bo'lsin, boshlang'ich qiymati yo'q,
# NULL qiymatni qabul qila olmasin
#
# password 32 dan oshmaydigan simvollardan iborat bo'lsin, Boshlang'ich qiymati NULL bo'lsin
#
# status sonlarni qabul qilsin faqat. boshlang'ich qiymati 1 ga teng bo'lsin

CREATE DATABASE `temp_users`;
USE `temp_users`;

CREATE TABLE `users`
(
    `id`       INT PRIMARY KEY NOT NULL,
    `username` VARCHAR(50)     NOT NULL,
    `password` VARCHAR(32) DEFAULT NULL,
    `status`   INT         DEFAULT 1
);
