/* 16-masala:
Umuman buyurtma qilmagan mijozlarni
ismi va familyasini chiqaring. */

USE `mashq`;

SELECT
    `c`.`customerNumber`   AS 'id',
    `c`.`contactFirstName` AS 'ismi',
    `c`.`contactLastName`  AS 'familyasi'
FROM `customers` `c`
LEFT JOIN `orders` `o` -- mijozlar bilan buyurtmalar jadvallarini birlashtiramiz
  ON `c`.`customerNumber` = `o`.`customerNumber` -- mijoz raqamlari teng bo'lgan satrlar asosida
WHERE `o`.`orderNumber` IS NULL; -- qaysiki hujjat raqami yo'q bo'lgan mijzolarni filtrlasin
/*----+------------+-----------------+
| id  | ismi       | familyasi       |
+-----+------------+-----------------+
| 125 | Zbyszek    | Piestrzeniewicz |
| 168 | Keith      | Franco          |
| 169 | Isabel     | de Castro       |
| 206 | Brydey     | Walker          |
| 223 | Horst      | Kloss           |
| 237 | Alejandra  | Camino          |
| 247 | Renate     | Messner         |
| 273 | Peter      | Franken         |
| 293 | Ed         | Harrison        |
| 303 | Bradley    | Schuyler        |
| 307 | Mel        | Andersen        |
| 335 | Philip     | Cramer          |
| 348 | Patricia   | McKenna         |
| 356 | Armand     | Kuger           |
| 361 | Karin      | Josephs         |
| 369 | Lino       | Rodriguez       |
| 376 | Braun      | Urs             |
| 409 | Rita       | Müller          |
| 443 | Alexander  | Feuer           |
| 459 | Sven       | Ottlieb         |
| 465 | Carmen     | Anton           |
| 477 | Hanna      | Moos            |
| 480 | Alexander  | Semenov         |
| 481 | Raanan     | Altagar,G M     |
+-----+------------+----------------*/