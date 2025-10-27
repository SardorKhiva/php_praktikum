/* 10-masala:
Mijozlar qaysi hodimning mijozi
ekanligi haqida ma`lumot chiqaring.
Mijozning ismi, familyasi,
hodimning ismi, familyasi.
Mijozning ismi bo`yicha saralang */
/*---------------+---------------------+----------------+---------------------+
| mijozning_ismi | mijozning_familyasi | hodimning_ismi | hodimning_familyasi |
+----------------+---------------------+----------------+---------------------+
| Adrian         | Huxley              | Andy           | Fixter              |
| Akiko          | Shimamura           | Mami           | Nishi               |
| Alejandra      | Camino              | NULL           | NULL                |
| Alexander      | Feuer               | NULL           | NULL                |
| Alexander      | Semenov             | NULL           | NULL                |
| Allen          | Nelson              | Julie          | Firrelli            |
| Ann            | Brown               | Larry          | Bott                |
| Anna           | O`Hara              | Andy           | Fixter              |
| Annette        | Roulet              | Gerard         | Hernandez           |
| Armand         | Kuger               | NULL           | NULL                |
| Arnold         | Cruz                | Mami           | Nishi               | */

USE `mashq`;
SELECT
       `c`.`contactFirstName` AS 'mijoz_ismi',
       `c`.`contactLastName` AS 'mijoz_familyasi',
       `e`.`firstName` AS 'hodim_ismi',
       `e`.`lastName` AS 'hodim_familyasi'
FROM `customers` `c`
JOIN `employees` `e`
  ON `c`.`salesRepEmployeeNumber` = `e`.`employeeNumber`
ORDER BY `mijoz_ismi`;
/*--------------+-----------------+------------+-----------------+
| mijoz_ismi    | mijoz_familyasi | hodim_ismi | hodim_familyasi |
+---------------+-----------------+------------+-----------------+
| Adrian        | Huxley          | Andy       | Fixter          |
| Akiko         | Shimamura       | Mami       | Nishi           |
| Allen         | Nelson          | Julie      | Firrelli        |
| Ann           | Brown           | Larry      | Bott            |
| Anna          | O'Hara          | Andy       | Fixter          |
| Annette       | Roulet          | Gerard     | Hernandez       |
| Arnold        | Cruz            | Mami       | Nishi           |
| Ben           | Calaghan        | Andy       | Fixter          |
| Braun         | Urs             | Martin     | Gerard          |
| Brian         | Chandler        | Leslie     | Thompson        |
| Carine        | Schmitt         | Gerard     | Hernandez       |
| Catherine     | Dewey           | Pamela     | Castillo        |
| Christina     | Berglund        | Barry      | Jones           |
| Dan           | Lewis           | George     | Vanauf          |
| Daniel        | Da Silva        | Loui       | Bondur          |
| Daniel        | Tonini          | Gerard     | Hernandez       |
| Dean          | Cassidy         | Barry      | Jones           |
| Diego         | Freyre          | Gerard     | Hernandez       |
| Dominique     | Perrier         | Loui       | Bondur          |
| Dorothy       | Young           | KERRI      | Jim             |
| Eduardo       | Saavedra        | Martin     | Gerard          |
| Elizabeth     | Devon           | Larry      | Bott            |
| Elizabeth     | Lincoln         | George     | Vanauf          |
| Eric          | Natividad       | Mami       | Nishi           |
| Francisca     | Cervantes       | Julie      | Firrelli        |
| Franco        | Ricotti         | Pamela     | Castillo        |
| Frédérique    | Citeaux         | Gerard     | Hernandez       |
| Georg         | Pipps           | Pamela     | Castillo        |
| Giovanni      | Rovelli         | Pamela     | Castillo        |
| Helen         | Bennett         | Larry      | Bott            |
| Henriette     | Pfalzheim       | Barry      | Jones           |
| Jan           | Klaeboe         | Barry      | Jones           |
| Janine        | Labrune         | Gerard     | Hernandez       |
| Jean          | Fresnière       | Foon Yue   | Tseng           |
| Jean          | King            | Leslie     | Thompson        |
| Jeff          | Young           | Foon Yue   | Tseng           |
| Jerry         | Tseng           | Julie      | Firrelli        |
| Jesus         | Fernandez       | Martin     | Gerard          |
| Jonas         | Bergulfsen      | Barry      | Jones           |
| José Pedro    | Roel            | Martin     | Gerard          |
| Julie         | Young           | Leslie     | Thompson        |
| Julie         | Brown           | Leslie     | Jennings        |
| Julie         | King            | George     | Vanauf          |
| Julie         | Murphy          | Leslie     | Jennings        |
| Juri          | Yoshido         | KERRI      | Jim             |
| Juri          | Hashimoto       | Leslie     | Jennings        |
| Jytte         | Petersen        | Pamela     | Castillo        |
| Kalle         | Suominen        | Larry      | Bott            |
| Keith         | Franco          | Foon Yue   | Tseng           |
| Kelvin        | Leong           | KERRI      | Jim             |
| Kwai          | Lee             | George     | Vanauf          |
| Laurence      | Lebihan         | Loui       | Bondur          |
| Leslie        | Murphy          | Foon Yue   | Tseng           |
| Leslie        | Taylor          | KERRI      | Jim             |
| Maria         | Hernandez       | Foon Yue   | Tseng           |
| Marie         | Bertrand        | Loui       | Bondur          |
| Marta         | Hernandez       | KERRI      | Jim             |
| Martha        | Larsson         | Barry      | Jones           |
| Martín        | Sommer          | Martin     | Gerard          |
| Martine       | Rancé           | Gerard     | Hernandez       |
| Mary          | Young           | Leslie     | Thompson        |
| Mary          | Saveley         | Loui       | Bondur          |
| Matti         | Karttunen       | Larry      | Bott            |
| Maurizio      | Moroni          | Pamela     | Castillo        |
| Michael       | Donnermeyer     | Barry      | Jones           |
| Michael       | Frick           | Foon Yue   | Tseng           |
| Miguel        | Barajas         | Julie      | Firrelli        |
| Mihael        | Holz            | Martin     | Gerard          |
| Mike          | Graham          | Peter      | Marsh           |
| Mike          | Gao             | Mami       | Nishi           |
| Mory          | Kentary         | Mami       | Nishi           |
| Palle         | Ibsen           | Pamela     | Castillo        |
| Paolo         | Accorti         | Pamela     | Castillo        |
| Pascale       | Cartrain        | Pamela     | Castillo        |
| Paul          | Henriot         | Loui       | Bondur          |
| Peter         | Ferguson        | Andy       | Fixter          |
| Pirkko        | Koskitalo       | Larry      | Bott            |
| Rachel        | Ashworth        | Larry      | Bott            |
| Roland        | Keitel          | Barry      | Jones           |
| Roland        | Mendel          | Pamela     | Castillo        |
| Rosa          | Salazar         | George     | Vanauf          |
| Sarah         | McRoy           | Peter      | Marsh           |
| Sean          | Clenahan        | Andy       | Fixter          |
| Steve         | Frick           | George     | Vanauf          |
| Steve         | Thompson        | Leslie     | Thompson        |
| Sue           | Frick           | Leslie     | Jennings        |
| Sue           | Taylor          | Leslie     | Jennings        |
| Susan         | Nelson          | Leslie     | Jennings        |
| Thomas        | Smith           | Larry      | Bott            |
| Tony          | Snowden         | Peter      | Marsh           |
| Valarie       | Thompson        | Leslie     | Thompson        |
| Valarie       | Franco          | Julie      | Firrelli        |
| Veysel        | Oeztan          | Barry      | Jones           |
| Violeta       | Benitez         | KERRI      | Jim             |
| Wales         | MacKinlay       | Peter      | Marsh           |
| Wendy         | Victorino       | Peter      | Marsh           |
| William       | Brown           | George     | Vanauf          |
| Wing          | Huang           | Julie      | Firrelli        |
| Yoshi         | Tamuri          | George     | Vanauf          |
| Yu            | Choi            | Foon Yue   | Tseng           |
+---------------+-----------------+------------+-----------------+
100 rows in set (0.00 sec)  */
