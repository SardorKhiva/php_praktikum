/*  UNION boʻyicha vazifalar
1-masala:
Barcha mijozlar va hodimlarning ismi,
familyasini va mijoz bo'lsa mijoz deb,
hodim bo`lsa hodim deb chiqsin.
+------------------+-----------------+-------+
| ismi             | familyasi       | mijoz |
+------------------+-----------------+-------+
| Valarie          | Franco          | mijoz |
| Tony             | Snowden         | mijoz |
| Diane            | Murphy          | hodim |
| Mary             | Patterson       | hodim |
| Jeff             | Firrelli        | hodim |
| William          | Patterson       | hodim |
| Gerard           | Bondur          | hodim | */

USE `mashq`;
SELECT `contactFirstName` 'ismi',
       `contactLastName` 'familyasi',
       'Mijoz' AS 'contactType'
FROM `customers`
UNION ALL
SELECT `firstName`,
       `lastName`,
       'Hodim' AS 'contactType'
FROM `employees`
ORDER BY `ismi`, `familyasi`;
/*--------------+-----------------+-------------+
| ismi          | familyasi       | contactType |
+---------------+-----------------+-------------+
| Adrian        | Huxley          | Mijoz       |
| Akiko         | Shimamura       | Mijoz       |
| Alejandra     | Camino          | Mijoz       |
| Alexander     | Feuer           | Mijoz       |
| Alexander     | Semenov         | Mijoz       |
| Allen         | Nelson          | Mijoz       |
| Andy          | Fixter          | Hodim       |
| Ann           | Brown           | Mijoz       |
| Anna          | O'Hara          | Mijoz       |
| Annette       | Roulet          | Mijoz       |
| Anthony       | Bow             | Hodim       |
| Armand        | Kuger           | Mijoz       |
| Arnold        | Cruz            | Mijoz       |
| Barry         | Jones           | Hodim       |
| Ben           | Calaghan        | Mijoz       |
| Bradley       | Schuyler        | Mijoz       |
| Braun         | Urs             | Mijoz       |
| Brian         | Chandler        | Mijoz       |
| Brydey        | Walker          | Mijoz       |
| Carine        | Schmitt         | Mijoz       |
| Carmen        | Anton           | Mijoz       |
| Catherine     | Dewey           | Mijoz       |
| Christina     | Berglund        | Mijoz       |
| Dan           | Lewis           | Mijoz       |
| Daniel        | Da Silva        | Mijoz       |
| Daniel        | Tonini          | Mijoz       |
| Dean          | Cassidy         | Mijoz       |
| Diane         | Murphy          | Hodim       |
| Diego         | Freyre          | Mijoz       |
| Dominique     | Perrier         | Mijoz       |
| Dorothy       | Young           | Mijoz       |
| Ed            | Harrison        | Mijoz       |
| Eduardo       | Saavedra        | Mijoz       |
| Elizabeth     | Devon           | Mijoz       |
| Elizabeth     | Lincoln         | Mijoz       |
| Eric          | Natividad       | Mijoz       |
| Foon Yue      | Tseng           | Hodim       |
| Francisca     | Cervantes       | Mijoz       |
| Franco        | Ricotti         | Mijoz       |
| Frédérique    | Citeaux         | Mijoz       |
| Georg         | Pipps           | Mijoz       |
| George        | Vanauf          | Hodim       |
| Gerard        | Bondur          | Hodim       |
| Gerard        | Hernandez       | Hodim       |
| Giovanni      | Rovelli         | Mijoz       |
| Hanna         | Moos            | Mijoz       |
| Helen         | Bennett         | Mijoz       |
| Henriette     | Pfalzheim       | Mijoz       |
| Horst         | Kloss           | Mijoz       |
| Isabel        | de Castro       | Mijoz       |
| Jan           | Klaeboe         | Mijoz       |
| Janine        | Labrune         | Mijoz       |
| Jean          | Fresnière       | Mijoz       |
| Jean          | King            | Mijoz       |
| Jeff          | Firrelli        | Hodim       |
| Jeff          | Young           | Mijoz       |
| Jerry         | Tseng           | Mijoz       |
| Jesus         | Fernandez       | Mijoz       |
| Jonas         | Bergulfsen      | Mijoz       |
| José Pedro    | Roel            | Mijoz       |
| Julie         | Brown           | Mijoz       |
| Julie         | Firrelli        | Hodim       |
| Julie         | King            | Mijoz       |
| Julie         | Murphy          | Mijoz       |
| Julie         | Young           | Mijoz       |
| Juri          | Hashimoto       | Mijoz       |
| Juri          | Yoshido         | Mijoz       |
| Jytte         | Petersen        | Mijoz       |
| Kalle         | Suominen        | Mijoz       |
| Karin         | Josephs         | Mijoz       |
| Keith         | Franco          | Mijoz       |
| Kelvin        | Leong           | Mijoz       |
| KERRI         | Jim             | Hodim       |
| Kwai          | Lee             | Mijoz       |
| Larry         | Bott            | Hodim       |
| Laurence      | Lebihan         | Mijoz       |
| Leslie        | Jennings        | Hodim       |
| Leslie        | Murphy          | Mijoz       |
| Leslie        | Taylor          | Mijoz       |
| Leslie        | Thompson        | Hodim       |
| Lino          | Rodriguez       | Mijoz       |
| Loui          | Bondur          | Hodim       |
| Mami          | Nishi           | Hodim       |
| Maria         | Hernandez       | Mijoz       |
| Marie         | Bertrand        | Mijoz       |
| Marta         | Hernandez       | Mijoz       |
| Martha        | Larsson         | Mijoz       |
| Martin        | Gerard          | Hodim       |
| Martín        | Sommer          | Mijoz       |
| Martine       | Rancé           | Mijoz       |
| Mary          | Patterson       | Hodim       |
| Mary          | Saveley         | Mijoz       |
| Mary          | Young           | Mijoz       |
| Matti         | Karttunen       | Mijoz       |
| Maurizio      | Moroni          | Mijoz       |
| Mel           | Andersen        | Mijoz       |
| Michael       | Donnermeyer     | Mijoz       |
| Michael       | Frick           | Mijoz       |
| Miguel        | Barajas         | Mijoz       |
| Mihael        | Holz            | Mijoz       |
| Mike          | Gao             | Mijoz       |
| Mike          | Graham          | Mijoz       |
| Mory          | Kentary         | Mijoz       |
| Palle         | Ibsen           | Mijoz       |
| Pamela        | Castillo        | Hodim       |
| Paolo         | Accorti         | Mijoz       |
| Pascale       | Cartrain        | Mijoz       |
| Patricia      | McKenna         | Mijoz       |
| Paul          | Henriot         | Mijoz       |
| Peter         | Ferguson        | Mijoz       |
| Peter         | Franken         | Mijoz       |
| Peter         | Marsh           | Hodim       |
| Philip        | Cramer          | Mijoz       |
| Pirkko        | Koskitalo       | Mijoz       |
| Raanan        | Altagar,G M     | Mijoz       |
| Rachel        | Ashworth        | Mijoz       |
| Renate        | Messner         | Mijoz       |
| Rita          | Müller          | Mijoz       |
| Roland        | Keitel          | Mijoz       |
| Roland        | Mendel          | Mijoz       |
| Rosa          | Salazar         | Mijoz       |
| Sarah         | McRoy           | Mijoz       |
| Sean          | Clenahan        | Mijoz       |
| Steve         | Frick           | Mijoz       |
| Steve         | Thompson        | Mijoz       |
| Sue           | Frick           | Mijoz       |
| Sue           | Taylor          | Mijoz       |
| Susan         | Nelson          | Mijoz       |
| Sven          | Ottlieb         | Mijoz       |
| Thomas        | Smith           | Mijoz       |
| Tom           | King            | Hodim       |
| Tony          | Snowden         | Mijoz       |
| Valarie       | Franco          | Mijoz       |
| Valarie       | Thompson        | Mijoz       |
| Veysel        | Oeztan          | Mijoz       |
| Violeta       | Benitez         | Mijoz       |
| Yoshi         | Tamuri          | Mijoz       |
| Yoshimi       | Kato            | Hodim       |
| Yu            | Choi            | Mijoz       |
| Zbyszek       | Piestrzeniewicz | Mijoz       |
+---------------+-----------------+-------------+
145 rows in set (0.00 sec)  */