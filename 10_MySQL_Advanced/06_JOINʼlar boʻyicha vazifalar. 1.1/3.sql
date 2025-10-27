/* 3-masala
"customers" jadvalidan, 141 nomerli mijozning ismi familyasi,
uning barcha to`lovlari haqida chek nomerini, to`lov qilgan sana
va qancha to`lov qilganligi haqida ma`lumotlarini chiqaring */
/*------+---------+-------------+-----------+
| ism   | familya | paymentDate | amount    |
+-------+---------+-------------+-----------+
| Diego | Freyre  | 2003-07-19  | 36251.03  |
| Diego | Freyre  | 2004-11-01  | 36140.38  |
| Diego | Freyre  | 2005-05-19  | 46895.48  |
| Diego | Freyre  | 2004-01-30  | 59830.55  |
| Diego | Freyre  | 2004-12-31  | 116208.40 |
| Diego | Freyre  | 2005-03-25  | 65071.26  |
| Diego | Freyre  | 2005-03-18  | 120166.58 |
| Diego | Freyre  | 2003-10-26  | 49539.37  |
| Diego | Freyre  | 2003-02-25  | 40206.20  |
| Diego | Freyre  | 2003-12-09  | 63843.55  |
| Diego | Freyre  | 2004-07-09  | 35420.74  |
| Diego | Freyre  | 2004-08-16  | 20009.53  |
| Diego | Freyre  | 2004-05-17  | 26155.91  |
+-------+---------+-------------+----------*/

USE `mashq`;
SELECT `c`.`contactFirstName` 'ismi',                                   -- customersdan ism olinsin
       `c`.`contactLastName`  'familyasi',                              -- customersdan familya olinsin
       `p`.`checkNumber`      'chek_raqami',                            -- paymentsdan chek raqam olinsin
       `p`.`paymentDate`      "to'lov_qilindi",                         -- paymentsdan to'lov qilingan sana olinsin
       `p`.`amount`           "to'lov_miqdori"                          -- paymentsdan to'lov miqdori olinsin
FROM `customers` `c`                                                    -- customers dan, shu jadval eng chapda asosiy bo'ladi
         JOIN `payments` `p`                                            -- payment bilan "qo'shilsin"
              ON `c`.`customerNumber` = `p`.`customerNumber`    --  qaysiki customerNumber lari teng bo'lgan ustunlar bo'lsa
         JOIN `orders` `o`                                              -- orders qo'shilsin
              ON `c`.`customerNumber` = `o`.`customerNumber`    -- qaysiki customerNumber lari teng bo'lgan ustunlari bor bo'lsa
WHERE `c`.`customerNumber` = 141                                        -- chiqarilsin qaysiki mijoz id si 141 bo'lsa
  AND `o`.`status` = 'Shipped'                                          -- va mahsulot yetkazilgan bo'lsa
GROUP BY `chek_raqami`;                                                 -- chek raqamlari bo'yicha guruhlansin

/*-------+-----------+-------------+----------------+----------------+
| ismi   | familyasi | chek_raqami | to'lov_qilindi | to'lov_miqdori |
+--------+-----------+-------------+----------------+----------------+
| Diego  | Freyre    | AU364101    | 2003-07-19     |       36251.03 |
| Diego  | Freyre    | DB583216    | 2004-11-01     |       36140.38 |
| Diego  | Freyre    | DL460618    | 2005-05-19     |       46895.48 |
| Diego  | Freyre    | HJ32686     | 2004-01-30     |       59830.55 |
| Diego  | Freyre    | ID10962     | 2004-12-31     |      116208.40 |
| Diego  | Freyre    | IN446258    | 2005-03-25     |       65071.26 |
| Diego  | Freyre    | JE105477    | 2005-03-18     |      120166.58 |
| Diego  | Freyre    | JN355280    | 2003-10-26     |       49539.37 |
| Diego  | Freyre    | JN722010    | 2003-02-25     |       40206.20 |
| Diego  | Freyre    | KT52578     | 2003-12-09     |       63843.55 |
| Diego  | Freyre    | MC46946     | 2004-07-09     |       35420.74 |
| Diego  | Freyre    | MF629602    | 2004-08-16     |       20009.53 |
| Diego  | Freyre    | NU627706    | 2004-05-17     |       26155.91 |
+--------+-----------+-------------+----------------+---------------*/


/* mashq bazasi strukturasi: jadval nomi, ustun nomi, tiplari
SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'mashq';

#   `mashq` bazasidagi barcha jadvallar va ularning ustunlari alifbo tartibida
SELECT COLUMN_NAME, TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'mashq'
ORDER BY TABLE_NAME, COLUMN_NAME;

# `mashq` bazasi va uning jadvallari strukturasi:
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'mashq'; */