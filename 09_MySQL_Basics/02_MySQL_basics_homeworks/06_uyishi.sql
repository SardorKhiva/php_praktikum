/*
 "salaries" jadvalidan oyligi :
 - 80000 dan katta bo`lganlarni "super oylik" deb
 - 50000 dan katta va 80000 dan kam bo`lsa "yaxshi oylik" deb
 - 50000 dan kam bo`lsa "kam oylik" deb ekranga chiqarsin.
 Xuddi rasmdagidek:
|------------------------
| oylik        | emp_no |
|-----------------------|
| super oylik  | 10001  |
| super oylik  | 10001  |
| super oylik  | 10001  |
| super oylik  | 10001  |
| super oylik  | 10001  |
| super oylik  | 10001  |
| yaxshi oylik | 10002  |
| yaxshi oylik | 10002  |
| yaxshi oylik | 10002  |
| yaxshi oylik | 10002  |
| yaxshi oylik | 10002  |
| yaxshi oylik | 10002  |
| kam oylik    | 10003  |
| kam oylik    | 10003  |
-------------------------
*/
SHOW DATABASES;

USE `mashq`;

SHOW TABLES;

CREATE TABLE `hodimlar`
(
    `emp_no` INT            NOT NULL,
    `ismi`   VARCHAR(30) UNIQUE,
    `maoshi` DECIMAL(10, 2) NOT NULL
);

INSERT INTO `hodimlar`(`emp_no`, `ismi`, `maoshi`)
VALUES (10001, 'A', 90000),
       (10001, 'B', 90000),
       (10001, 'C', 90000),
       (10001, 'D', 90000),
       (10001, 'E', 90000),
       (10001, 'F', 90000),
       (10001, 'G', 90000),
       (10001, 'H', 90000),
       (10001, 'I', 90000),
       (10002, 'J', 70000),
       (10002, 'K', 70000),
       (10002, 'L', 70000),
       (10002, 'M', 70000),
       (10003, 'N', 40000),
       (10003, 'O', 40000),
       (10003, 'P', 40000),
       (10003, 'Q', 40000);

# select - tanlash
SELECT CASE # switch-case kabi
# agar oylik 80_000 dan ko'p bo'lsa, 'super oylik' desin
           WHEN `maoshi` > 80000 THEN 'Super oylik'

           # agar oylik 80_000 dan kam 50000 dan ko'p bo'lsa, 'yaxshi oylik' desin
           WHEN `maoshi` > 50000 THEN 'Yaxshi oylik'

           # aks holda 'kam oylik' deb chiqarsin
           ELSE 'kam oylik'

           # shu ustun 'oylik' deb chiqarilsin:
           END AS 'oylik',
       `emp_no` # keyingi 'emp_no' ustuni ham chiqarilsin
FROM hodimlar; # hodimlar jadvalidagi
