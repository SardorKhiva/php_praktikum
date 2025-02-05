/* 2-masala.
Fransiyada ishlaydigan ishchilarni va
Fransiyalik mijozlarni ismi va familyasini  chiqaring */
USE `mashq`;

-- Fransiyada ishlovchi hodimlar:
SELECT `o`.`country`,
       `e`.`firstName`,
       `e`.`lastName`,
       'hodim' AS 'kim'
 FROM `employees` `e`
          JOIN `offices` `o`
               ON `e`.`officeCode` = `o`.`officeCode`
 WHERE `o`.`country` = 'France';
/*--------+-----------+-----------+-------+
| country | firstName | lastName  | kim   |
+---------+-----------+-----------+-------+
| France  | Gerard    | Hernandez | hodim |
| France  | Pamela    | Castillo  | hodim |
| France  | Martin    | Gerard    | hodim |
+---------+-----------+-----------+-------+
3 rows in set (0.00 sec)    */

-- Fransiyada yashovchi mijozlar:
SELECT `country`          AS 'davlat',
       `contactFirstName` AS 'ismi',
       `contactLastName`  AS 'familyasi',
       'mijoz'            AS 'kim'
FROM `customers`
WHERE `country` = (SELECT `country`
                   WHERE `country` = 'France');
/*-------+---------------+-----------+-------+
| davlat | ismi          | familyasi | kim   |
+--------+---------------+-----------+-------+
| France | Carine        | Schmitt   | mijoz |
| France | Janine        | Labrune   | mijoz |
| France | Mary          | Saveley   | mijoz |
| France | Martine       | Rancé     | mijoz |
| France | Marie         | Bertrand  | mijoz |
| France | Frédérique    | Citeaux   | mijoz |
| France | Annette       | Roulet    | mijoz |
| France | Daniel        | Da Silva  | mijoz |
| France | Daniel        | Tonini    | mijoz |
| France | Laurence      | Lebihan   | mijoz |
| France | Paul          | Henriot   | mijoz |
| France | Dominique     | Perrier   | mijoz |
+--------+---------------+-----------+-------+
12 rows in set (0.00 sec)   */


-- endi 2 so'rovni UNION ALL orqali birlashtiramiz:
SELECT `country`          AS 'davlat',
       `contactFirstName` AS 'ismi',
       `contactLastName`  AS 'familyasi',
       'mijoz'            AS 'kim'
FROM `customers`
WHERE `country` = (SELECT `country`
                   WHERE `country` = 'France')
UNION ALL
SELECT `o`.`country`,
       `e`.`firstName`,
       `e`.`lastName`,
       'hodim' AS 'kim'
FROM `employees` `e`
         JOIN `offices` `o`
              ON `e`.`officeCode` = `o`.`officeCode`
WHERE `o`.`country` = 'France'
ORDER BY `ismi`, `familyasi`;
/*-------+---------------+-----------+-------+
| davlat | ismi          | familyasi | kim   |
+--------+---------------+-----------+-------+
| France | Annette       | Roulet    | mijoz |
| France | Carine        | Schmitt   | mijoz |
| France | Daniel        | Da Silva  | mijoz |
| France | Daniel        | Tonini    | mijoz |
| France | Dominique     | Perrier   | mijoz |
| France | Frédérique    | Citeaux   | mijoz |
| France | Gerard        | Hernandez | hodim |
| France | Janine        | Labrune   | mijoz |
| France | Laurence      | Lebihan   | mijoz |
| France | Marie         | Bertrand  | mijoz |
| France | Martin        | Gerard    | hodim |
| France | Martine       | Rancé     | mijoz |
| France | Mary          | Saveley   | mijoz |
| France | Pamela        | Castillo  | hodim |
| France | Paul          | Henriot   | mijoz |
+--------+---------------+-----------+-------+
15 rows in set (0.00 sec)   */

