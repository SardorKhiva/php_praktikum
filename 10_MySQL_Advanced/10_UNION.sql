/*                UNION  -  2 ta jadvalni birlashtirish uchun ishlatiladi
  2 ta shart asosida ishlaydi:
1) Barcha SELECT da ko'rsatilgan ustunlar soni va tartiblari 1 xil bo'lishi kerak.
2) Ustunlar ma'lumotlari turlari bir xil yoki mos bo'lishi kerak

Natijadagi ustunlar nomlarini, 1-SELECT dan oladi
*/

/*
2 xil UNION bor:
1) UNION ALL
2) UNION DISTINCT yoki UNION
*/

SELECT `lastName` 'familya'     -- chiqarsin familyalarni
FROM  `employees` `e`           -- employees jadvalidan

UNION ALL                       -- va unga qo'shib

SELECT `contactLastName` -- bu ham familyalar
FROM `customers`
ORDER BY `familya`;             -- customers jadvalini
/*----------------+
| familya         |
+-----------------+
| Accorti         |
| Altagar,G M     |
| Andersen        |
| Anton           |
| Ashworth        |
| Barajas         |
| Benitez         |
| Bennett         |
| Berglund        |
| Bergulfsen      |
| Bertrand        |
| Bondur          |
| Bondur          |
| Bott            |
| Bow             |
| Brown           |
| Brown           |
| Brown           |
| Calaghan        |
| Camino          |
| Cartrain        |
| Cassidy         |
| Castillo        |
| Cervantes       |
| Chandler        |
| Choi            |
| Citeaux         |
| Clenahan        |
| Cramer          |
| Cruz            |
| Da Silva        |
| de Castro       |
| Devon           |
| Dewey           |
| Donnermeyer     |
| Ferguson        |
| Fernandez       |
| Feuer           |
| Firrelli        |
| Firrelli        |
| Fixter          |
| Franco          |
| Franco          |
| Franken         |
| Fresnière       |
| Freyre          |
| Frick           |
| Frick           |
| Frick           |
| Gao             |
| Gerard          |
| Graham          |
| Harrison        |
| Hashimoto       |
| Henriot         |
| Hernandez       |
| Hernandez       |
| Hernandez       |
| Holz            |
| Huang           |
| Huxley          |
| Ibsen           |
| Jennings        |
| Jim             |
| Jones           |
| Josephs         |
| Karttunen       |
| Kato            |
| Keitel          |
| Kentary         |
| King            |
| King            |
| King            |
| Klaeboe         |
| Kloss           |
| Koskitalo       |
| Kuger           |
| Labrune         |
| Larsson         |
| Lebihan         |
| Lee             |
| Leong           |
| Lewis           |
| Lincoln         |
| MacKinlay       |
| Marsh           |
| McKenna         |
| McRoy           |
| Mendel          |
| Messner         |
| Moos            |
| Moroni          |
| Murphy          |
| Murphy          |
| Murphy          |
| Müller          |
| Natividad       |
| Nelson          |
| Nelson          |
| Nishi           |
| O'Hara          |
| Oeztan          |
| Ottlieb         |
| Patterson       |
| Patterson       |
| Perrier         |
| Petersen        |
| Pfalzheim       |
| Piestrzeniewicz |
| Pipps           |
| Rancé           |
| Ricotti         |
| Rodriguez       |
| Roel            |
| Roulet          |
| Rovelli         |
| Saavedra        |
| Salazar         |
| Saveley         |
| Schmitt         |
| Schuyler        |
| Semenov         |
| Shimamura       |
| Smith           |
| Snowden         |
| Sommer          |
| Suominen        |
| Tamuri          |
| Taylor          |
| Taylor          |
| Thompson        |
| Thompson        |
| Thompson        |
| Tonini          |
| Tseng           |
| Tseng           |
| Young           |
| Young           |
| Young           |
| Young           |
+-----------------+
145 rows in set (0.00 sec) */

#           UNION DISTINCT  -  unikal
SELECT `lastName` 'familya'
FROM `employees`

UNION DISTINCT  -- bir xil yozuvlarni qoldiradi

SELECT `contactLastName`
FROM `customers`
ORDER BY `familya`;
/*----------------+
| familya         |
+-----------------+
| Accorti         |
| Altagar,G M     |
| Andersen        |
| Anton           |
| Ashworth        |
| Barajas         |
| Benitez         |
| Bennett         |
| Berglund        |
| Bergulfsen      |
| Bertrand        |
| Bondur          |
| Bott            |
| Bow             |
| Brown           |
| Calaghan        |
| Camino          |
| Cartrain        |
| Cassidy         |
| Castillo        |
| Cervantes       |
| Chandler        |
| Choi            |
| Citeaux         |
| Clenahan        |
| Cramer          |
| Cruz            |
| Da Silva        |
| de Castro       |
| Devon           |
| Dewey           |
| Donnermeyer     |
| Ferguson        |
| Fernandez       |
| Feuer           |
| Firrelli        |
| Fixter          |
| Franco          |
| Franken         |
| Fresnière       |
| Freyre          |
| Frick           |
| Gao             |
| Gerard          |
| Graham          |
| Harrison        |
| Hashimoto       |
| Henriot         |
| Hernandez       |
| Holz            |
| Huang           |
| Huxley          |
| Ibsen           |
| Jennings        |
| Jim             |
| Jones           |
| Josephs         |
| Karttunen       |
| Kato            |
| Keitel          |
| Kentary         |
| King            |
| Klaeboe         |
| Kloss           |
| Koskitalo       |
| Kuger           |
| Labrune         |
| Larsson         |
| Lebihan         |
| Lee             |
| Leong           |
| Lewis           |
| Lincoln         |
| MacKinlay       |
| Marsh           |
| McKenna         |
| McRoy           |
| Mendel          |
| Messner         |
| Moos            |
| Moroni          |
| Murphy          |
| Müller          |
| Natividad       |
| Nelson          |
| Nishi           |
| O'Hara          |
| Oeztan          |
| Ottlieb         |
| Patterson       |
| Perrier         |
| Petersen        |
| Pfalzheim       |
| Piestrzeniewicz |
| Pipps           |
| Rancé           |
| Ricotti         |
| Rodriguez       |
| Roel            |
| Roulet          |
| Rovelli         |
| Saavedra        |
| Salazar         |
| Saveley         |
| Schmitt         |
| Schuyler        |
| Semenov         |
| Shimamura       |
| Smith           |
| Snowden         |
| Sommer          |
| Suominen        |
| Tamuri          |
| Taylor          |
| Thompson        |
| Tonini          |
| Tseng           |
| Urs             |
| Vanauf          |
| Victorino       |
| Walker          |
| Yoshido         |
| Young           |
+-----------------+
123 rows in set (0.00 sec)  */

#                     UNION
SELECT `firstName` 'ism',
       `lastName` 'familya'
FROM `employees`

UNION       -- UNION ni o'zi tursa DISTINCT bo'lib unikal qiymatlarni oladi

SELECT `contactFirstName`,
       `contactLastName`
FROM `customers`
ORDER BY `ism`, `familya`;
/*--------------+-----------------+
| ism           | familya         |
+---------------+-----------------+
| Adrian        | Huxley          |
| Akiko         | Shimamura       |
| Alejandra     | Camino          |
| Alexander     | Feuer           |
| Alexander     | Semenov         |
| Allen         | Nelson          |
| Andy          | Fixter          |
| Ann           | Brown           |
| Anna          | O'Hara          |
| Annette       | Roulet          |
| Anthony       | Bow             |
| Armand        | Kuger           |
| Arnold        | Cruz            |
| Barry         | Jones           |
| Ben           | Calaghan        |
| Bradley       | Schuyler        |
| Braun         | Urs             |
| Brian         | Chandler        |
| Brydey        | Walker          |
| Carine        | Schmitt         |
| Carmen        | Anton           |
| Catherine     | Dewey           |
| Christina     | Berglund        |
| Dan           | Lewis           |
| Daniel        | Da Silva        |
| Daniel        | Tonini          |
| Dean          | Cassidy         |
| Diane         | Murphy          |
| Diego         | Freyre          |
| Dominique     | Perrier         |
| Dorothy       | Young           |
| Ed            | Harrison        |
| Eduardo       | Saavedra        |
| Elizabeth     | Devon           |
| Elizabeth     | Lincoln         |
| Eric          | Natividad       |
| Foon Yue      | Tseng           |
| Francisca     | Cervantes       |
| Franco        | Ricotti         |
| Frédérique    | Citeaux         |
| Georg         | Pipps           |
| George        | Vanauf          |
| Gerard        | Bondur          |
| Gerard        | Hernandez       |
| Giovanni      | Rovelli         |
| Hanna         | Moos            |
| Helen         | Bennett         |
| Henriette     | Pfalzheim       |
| Horst         | Kloss           |
| Isabel        | de Castro       |
| Jan           | Klaeboe         |
| Janine        | Labrune         |
| Jean          | Fresnière       |
| Jean          | King            |
| Jeff          | Firrelli        |
| Jeff          | Young           |
| Jerry         | Tseng           |
| Jesus         | Fernandez       |
| Jonas         | Bergulfsen      |
| José Pedro    | Roel            |
| Julie         | Brown           |
| Julie         | Firrelli        |
| Julie         | King            |
| Julie         | Murphy          |
| Julie         | Young           |
| Juri          | Hashimoto       |
| Juri          | Yoshido         |
| Jytte         | Petersen        |
| Kalle         | Suominen        |
| Karin         | Josephs         |
| Keith         | Franco          |
| Kelvin        | Leong           |
| KERRI         | Jim             |
| Kwai          | Lee             |
| Larry         | Bott            |
| Laurence      | Lebihan         |
| Leslie        | Jennings        |
| Leslie        | Murphy          |
| Leslie        | Taylor          |
| Leslie        | Thompson        |
| Lino          | Rodriguez       |
| Loui          | Bondur          |
| Mami          | Nishi           |
| Maria         | Hernandez       |
| Marie         | Bertrand        |
| Marta         | Hernandez       |
| Martha        | Larsson         |
| Martin        | Gerard          |
| Martín        | Sommer          |
| Martine       | Rancé           |
| Mary          | Patterson       |
| Mary          | Saveley         |
| Mary          | Young           |
| Matti         | Karttunen       |
| Maurizio      | Moroni          |
| Mel           | Andersen        |
| Michael       | Donnermeyer     |
| Michael       | Frick           |
| Miguel        | Barajas         |
| Mihael        | Holz            |
| Mike          | Gao             |
| Mike          | Graham          |
| Mory          | Kentary         |
| Palle         | Ibsen           |
| Pamela        | Castillo        |
| Paolo         | Accorti         |
| Pascale       | Cartrain        |
| Patricia      | McKenna         |
| Paul          | Henriot         |
| Peter         | Ferguson        |
| Peter         | Franken         |
| Peter         | Marsh           |
| Philip        | Cramer          |
| Pirkko        | Koskitalo       |
| Raanan        | Altagar,G M     |
| Rachel        | Ashworth        |
| Renate        | Messner         |
| Rita          | Müller          |
| Roland        | Keitel          |
| Roland        | Mendel          |
| Rosa          | Salazar         |
| Sarah         | McRoy           |
| Sean          | Clenahan        |
| Steve         | Frick           |
| Steve         | Thompson        |
| Sue           | Frick           |
| Sue           | Taylor          |
| Susan         | Nelson          |
| Sven          | Ottlieb         |
| Thomas        | Smith           |
| Tom           | King            |
| Tony          | Snowden         |
| Valarie       | Franco          |
| Valarie       | Thompson        |
| Veysel        | Oeztan          |
| Violeta       | Benitez         |
| Wales         | MacKinlay       |
| Wendy         | Victorino       |
| William       | Brown           |
| William       | Patterson       |
| Wing          | Huang           |
| Yoshi         | Tamuri          |
| Yoshimi       | Kato            |
| Yu            | Choi            |
| Zbyszek       | Piestrzeniewicz |
+---------------+----------------*/

SELECT CONCAT(`firstName`, ' ', `lastName`) 'fullname'
FROM `employees`
UNION
SELECT
    CONCAT(`contactFirstName`, ' ', `contactLastName`)
FROM `customers`
ORDER BY `fullname`;
/*-------------------------+
| fullname                 |
+--------------------------+
| Adrian Huxley            |
| Akiko Shimamura          |
| Alejandra  Camino        |
| Alexander  Feuer         |
| Alexander Semenov        |
| Allen Nelson             |
| Andy Fixter              |
| Ann  Brown               |
| Anna O'Hara              |
| Annette  Roulet          |
| Anthony Bow              |
| Armand Kuger             |
| Arnold Cruz              |
| Barry Jones              |
| Ben Calaghan             |
| Bradley Schuyler         |
| Braun Urs                |
| Brian Chandler           |
| Brydey Walker            |
| Carine  Schmitt          |
| Carmen Anton             |
| Catherine  Dewey         |
| Christina  Berglund      |
| Dan Lewis                |
| Daniel  Tonini           |
| Daniel Da Silva          |
| Dean Cassidy             |
| Diane Murphy             |
| Diego  Freyre            |
| Dominique Perrier        |
| Dorothy Young            |
| Ed Harrison              |
| Eduardo  Saavedra        |
| Elizabeth  Lincoln       |
| Elizabeth Devon          |
| Eric Natividad           |
| Foon Yue Tseng           |
| Francisca Cervantes      |
| Franco Ricotti           |
| Frédérique  Citeaux      |
| Georg  Pipps             |
| George Vanauf            |
| Gerard Bondur            |
| Gerard Hernandez         |
| Giovanni  Rovelli        |
| Hanna  Moos              |
| Helen  Bennett           |
| Henriette  Pfalzheim     |
| Horst  Kloss             |
| Isabel  de Castro        |
| Jan Klaeboe              |
| Janine  Labrune          |
| Jean  Fresnière          |
| Jean King                |
| Jeff Firrelli            |
| Jeff Young               |
| Jerry Tseng              |
| Jesus Fernandez          |
| Jonas  Bergulfsen        |
| José Pedro  Roel         |
| Julie Brown              |
| Julie Firrelli           |
| Julie King               |
| Julie Murphy             |
| Julie Young              |
| Juri Hashimoto           |
| Juri Yoshido             |
| Jytte  Petersen          |
| Kalle Suominen           |
| Karin Josephs            |
| Keith Franco             |
| Kelvin Leong             |
| KERRI Jim                |
| Kwai Lee                 |
| Larry Bott               |
| Laurence  Lebihan        |
| Leslie Jennings          |
| Leslie Murphy            |
| Leslie Taylor            |
| Leslie Thompson          |
| Lino  Rodriguez          |
| Loui Bondur              |
| Mami Nishi               |
| Maria Hernandez          |
| Marie Bertrand           |
| Marta Hernandez          |
| Martha Larsson           |
| Martín  Sommer           |
| Martin Gerard            |
| Martine  Rancé           |
| Mary  Saveley            |
| Mary Patterson           |
| Mary Young               |
| Matti Karttunen          |
| Maurizio  Moroni         |
| Mel Andersen             |
| Michael Donnermeyer      |
| Michael Frick            |
| Miguel Barajas           |
| Mihael Holz              |
| Mike Gao                 |
| Mike Graham              |
| Mory Kentary             |
| Palle Ibsen              |
| Pamela Castillo          |
| Paolo  Accorti           |
| Pascale  Cartrain        |
| Patricia  McKenna        |
| Paul  Henriot            |
| Peter  Franken           |
| Peter Ferguson           |
| Peter Marsh              |
| Philip  Cramer           |
| Pirkko Koskitalo         |
| Raanan Altagar,G M       |
| Rachel Ashworth          |
| Renate  Messner          |
| Rita  Müller             |
| Roland  Mendel           |
| Roland Keitel            |
| Rosa Salazar             |
| Sarah McRoy              |
| Sean Clenahan            |
| Steve Frick              |
| Steve Thompson           |
| Sue Frick                |
| Sue Taylor               |
| Susan Nelson             |
| Sven  Ottlieb            |
| Thomas  Smith            |
| Tom King                 |
| Tony Snowden             |
| Valarie Franco           |
| Valarie Thompson         |
| Veysel Oeztan            |
| Violeta Benitez          |
| Wales MacKinlay          |
| Wendy Victorino          |
| William Brown            |
| William Patterson        |
| Wing Huang               |
| Yoshi  Tamuri            |
| Yoshimi Kato             |
| Yu Choi                  |
| Zbyszek  Piestrzeniewicz |
+--------------------------+
145 rows in set (0.00 sec)  */

SELECT
    CONCAT(`firstName`, ' ', `lastName`) 'fullname',
'Employee' AS 'contactType'
FROM `employees`
UNION
SELECT CONCAT(`contactFirstName`, ' ', `contactLastName`),
       'Customer' AS 'contactType'
FROM `customers`
ORDER BY `fullname`;
/*-------------------------+-------------+
| fullname                 | contactType |
+--------------------------+-------------+
| Adrian Huxley            | Customer    |
| Akiko Shimamura          | Customer    |
| Alejandra  Camino        | Customer    |
| Alexander  Feuer         | Customer    |
| Alexander Semenov        | Customer    |
| Allen Nelson             | Customer    |
| Andy Fixter              | Employee    |
| Ann  Brown               | Customer    |
| Anna O'Hara              | Customer    |
| Annette  Roulet          | Customer    |
| Anthony Bow              | Employee    |
| Armand Kuger             | Customer    |
| Arnold Cruz              | Customer    |
| Barry Jones              | Employee    |
| Ben Calaghan             | Customer    |
| Bradley Schuyler         | Customer    |
| Braun Urs                | Customer    |
| Brian Chandler           | Customer    |
| Brydey Walker            | Customer    |
| Carine  Schmitt          | Customer    |
| Carmen Anton             | Customer    |
| Catherine  Dewey         | Customer    |
| Christina  Berglund      | Customer    |
| Dan Lewis                | Customer    |
| Daniel  Tonini           | Customer    |
| Daniel Da Silva          | Customer    |
| Dean Cassidy             | Customer    |
| Diane Murphy             | Employee    |
| Diego  Freyre            | Customer    |
| Dominique Perrier        | Customer    |
| Dorothy Young            | Customer    |
| Ed Harrison              | Customer    |
| Eduardo  Saavedra        | Customer    |
| Elizabeth  Lincoln       | Customer    |
| Elizabeth Devon          | Customer    |
| Eric Natividad           | Customer    |
| Foon Yue Tseng           | Employee    |
| Francisca Cervantes      | Customer    |
| Franco Ricotti           | Customer    |
| Frédérique  Citeaux      | Customer    |
| Georg  Pipps             | Customer    |
| George Vanauf            | Employee    |
| Gerard Bondur            | Employee    |
| Gerard Hernandez         | Employee    |
| Giovanni  Rovelli        | Customer    |
| Hanna  Moos              | Customer    |
| Helen  Bennett           | Customer    |
| Henriette  Pfalzheim     | Customer    |
| Horst  Kloss             | Customer    |
| Isabel  de Castro        | Customer    |
| Jan Klaeboe              | Customer    |
| Janine  Labrune          | Customer    |
| Jean  Fresnière          | Customer    |
| Jean King                | Customer    |
| Jeff Firrelli            | Employee    |
| Jeff Young               | Customer    |
| Jerry Tseng              | Customer    |
| Jesus Fernandez          | Customer    |
| Jonas  Bergulfsen        | Customer    |
| José Pedro  Roel         | Customer    |
| Julie Brown              | Customer    |
| Julie Firrelli           | Employee    |
| Julie King               | Customer    |
| Julie Murphy             | Customer    |
| Julie Young              | Customer    |
| Juri Hashimoto           | Customer    |
| Juri Yoshido             | Customer    |
| Jytte  Petersen          | Customer    |
| Kalle Suominen           | Customer    |
| Karin Josephs            | Customer    |
| Keith Franco             | Customer    |
| Kelvin Leong             | Customer    |
| KERRI Jim                | Employee    |
| Kwai Lee                 | Customer    |
| Larry Bott               | Employee    |
| Laurence  Lebihan        | Customer    |
| Leslie Jennings          | Employee    |
| Leslie Murphy            | Customer    |
| Leslie Taylor            | Customer    |
| Leslie Thompson          | Employee    |
| Lino  Rodriguez          | Customer    |
| Loui Bondur              | Employee    |
| Mami Nishi               | Employee    |
| Maria Hernandez          | Customer    |
| Marie Bertrand           | Customer    |
| Marta Hernandez          | Customer    |
| Martha Larsson           | Customer    |
| Martín  Sommer           | Customer    |
| Martin Gerard            | Employee    |
| Martine  Rancé           | Customer    |
| Mary  Saveley            | Customer    |
| Mary Patterson           | Employee    |
| Mary Young               | Customer    |
| Matti Karttunen          | Customer    |
| Maurizio  Moroni         | Customer    |
| Mel Andersen             | Customer    |
| Michael Donnermeyer      | Customer    |
| Michael Frick            | Customer    |
| Miguel Barajas           | Customer    |
| Mihael Holz              | Customer    |
| Mike Gao                 | Customer    |
| Mike Graham              | Customer    |
| Mory Kentary             | Customer    |
| Palle Ibsen              | Customer    |
| Pamela Castillo          | Employee    |
| Paolo  Accorti           | Customer    |
| Pascale  Cartrain        | Customer    |
| Patricia  McKenna        | Customer    |
| Paul  Henriot            | Customer    |
| Peter  Franken           | Customer    |
| Peter Ferguson           | Customer    |
| Peter Marsh              | Employee    |
| Philip  Cramer           | Customer    |
| Pirkko Koskitalo         | Customer    |
| Raanan Altagar,G M       | Customer    |
| Rachel Ashworth          | Customer    |
| Renate  Messner          | Customer    |
| Rita  Müller             | Customer    |
| Roland  Mendel           | Customer    |
| Roland Keitel            | Customer    |
| Rosa Salazar             | Customer    |
| Sarah McRoy              | Customer    |
| Sean Clenahan            | Customer    |
| Steve Frick              | Customer    |
| Steve Thompson           | Customer    |
| Sue Frick                | Customer    |
| Sue Taylor               | Customer    |
| Susan Nelson             | Customer    |
| Sven  Ottlieb            | Customer    |
| Thomas  Smith            | Customer    |
| Tom King                 | Employee    |
| Tony Snowden             | Customer    |
| Valarie Franco           | Customer    |
| Valarie Thompson         | Customer    |
| Veysel Oeztan            | Customer    |
| Violeta Benitez          | Customer    |
| Wales MacKinlay          | Customer    |
| Wendy Victorino          | Customer    |
| William Brown            | Customer    |
| William Patterson        | Employee    |
| Wing Huang               | Customer    |
| Yoshi  Tamuri            | Customer    |
| Yoshimi Kato             | Employee    |
| Yu Choi                  | Customer    |
| Zbyszek  Piestrzeniewicz | Customer    |
+--------------------------+-------------+
145 rows in set (0.00 sec)  */