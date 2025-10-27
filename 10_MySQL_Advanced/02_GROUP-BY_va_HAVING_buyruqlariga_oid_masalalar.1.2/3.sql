/*  "customers" jadvalidan:
bir xil ismli mijozlarni aniqlang,
 2 tadan ko`p bir xil ismli mijozlarni
 ismi va sonini aniqlang */
USE `mashq`;
SELECT `contactFirstName`        AS 'mijoz ismi',
       COUNT(`contactFirstName`) AS 'takrorlanishlar soni'
FROM `customers`
GROUP BY `mijoz ismi`
HAVING `takrorlanishlar soni` > 2
ORDER BY `mijoz ismi`;

/* masala shartiga muvofiq:
+------------+----------------------+
| mijoz ismi | takrorlanishlar soni |
+------------+----------------------+
| Julie      |                    4 |
+------------+----------------------+
1 row in set (0.00 sec)     */

SELECT `contactFirstName` AS 'mijoz ismi',
COUNT(`contactFirstName`) AS 'takrorlanishlar soni'
FROM `customers`
GROUP BY `mijoz ismi`
ORDER BY `mijoz ismi`;
/* qaysi ism necha marta takrorlanganligi:
+---------------+----------------------+
| mijoz ismi    | takrorlanishlar soni |
+---------------+----------------------+
| Adrian        |                    1 |
| Akiko         |                    1 |
| Alejandra     |                    1 |
| Alexander     |                    2 |
| Allen         |                    1 |
| Ann           |                    1 |
| Anna          |                    1 |
| Annette       |                    1 |
| Armand        |                    1 |
| Arnold        |                    1 |
| Ben           |                    1 |
| Bradley       |                    1 |
| Braun         |                    1 |
| Brian         |                    1 |
| Brydey        |                    1 |
| Carine        |                    1 |
| Carmen        |                    1 |
| Catherine     |                    1 |
| Christina     |                    1 |
| Dan           |                    1 |
| Daniel        |                    2 |
| Dean          |                    1 |
| Diego         |                    1 |
| Dominique     |                    1 |
| Dorothy       |                    1 |
| Ed            |                    1 |
| Eduardo       |                    1 |
| Elizabeth     |                    2 |
| Eric          |                    1 |
| Francisca     |                    1 |
| Franco        |                    1 |
| Frédérique    |                    1 |
| Georg         |                    1 |
| Giovanni      |                    1 |
| Hanna         |                    1 |
| Helen         |                    1 |
| Henriette     |                    1 |
| Horst         |                    1 |
| Isabel        |                    1 |
| Jan           |                    1 |
| Janine        |                    1 |
| Jean          |                    2 |
| Jeff          |                    1 |
| Jerry         |                    1 |
| Jesus         |                    1 |
| Jonas         |                    1 |
| José Pedro    |                    1 |
| Julie         |                    4 |
| Juri          |                    2 |
| Jytte         |                    1 |
| Kalle         |                    1 |
| Karin         |                    1 |
| Keith         |                    1 |
| Kelvin        |                    1 |
| Kwai          |                    1 |
| Laurence      |                    1 |
| Leslie        |                    2 |
| Lino          |                    1 |
| Maria         |                    1 |
| Marie         |                    1 |
| Marta         |                    1 |
| Martha        |                    1 |
| Martín        |                    1 |
| Martine       |                    1 |
| Mary          |                    2 |
| Matti         |                    1 |
| Maurizio      |                    1 |
| Mel           |                    1 |
| Michael       |                    2 |
| Miguel        |                    1 |
| Mihael        |                    1 |
| Mike          |                    2 |
| Mory          |                    1 |
| Palle         |                    1 |
| Paolo         |                    1 |
| Pascale       |                    1 |
| Patricia      |                    1 |
| Paul          |                    1 |
| Peter         |                    2 |
| Philip        |                    1 |
| Pirkko        |                    1 |
| Raanan        |                    1 |
| Rachel        |                    1 |
| Renate        |                    1 |
| Rita          |                    1 |
| Roland        |                    2 |
| Rosa          |                    1 |
| Sarah         |                    1 |
| Sean          |                    1 |
| Steve         |                    2 |
| Sue           |                    2 |
| Susan         |                    1 |
| Sven          |                    1 |
| Thomas        |                    1 |
| Tony          |                    1 |
| Valarie       |                    2 |
| Veysel        |                    1 |
| Violeta       |                    1 |
| Wales         |                    1 |
| Wendy         |                    1 |
| William       |                    1 |
| Wing          |                    1 |
| Yoshi         |                    1 |
| Yu            |                    1 |
| Zbyszek       |                    1 |
+---------------+----------------------+
105 rows in set (0.00 sec)  */