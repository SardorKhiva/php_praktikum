/* "customers" jadvalidan:
1) -qaysi davlatdan nechtadan mijoz borligini aniqlang  */
USE `mashq`;

SELECT *
FROM `customers`;

SELECT `country` AS 'davlat',
COUNT(`country`) AS 'mijozlar soni'
FROM `customers`
GROUP BY `country`
ORDER BY `country`;
/* davlat nomlari bo'yicha tartiblash:
+--------------+---------------+
| davlat       | mijozlar soni |
+--------------+---------------+
| Australia    |             5 |
| Austria      |             2 |
| Belgium      |             2 |
| Canada       |             3 |
| dedede       |             1 |
| Denmark      |             2 |
| Finland      |             3 |
| France       |            12 |
| Germany      |            13 |
| Hong Kong    |             1 |
| Ireland      |             2 |
| Israel       |             1 |
| Italy        |             4 |
| Japan        |             2 |
| Netherlands  |             1 |
| New Zealand  |             4 |
| Norway       |             3 |
| Philippines  |             1 |
| Poland       |             1 |
| Portugal     |             2 |
| Singapore    |             3 |
| South Africa |             1 |
| Spain        |             7 |
| Sweden       |             2 |
| Switzerland  |             3 |
| UK           |             5 |
| USA          |            36 |
+--------------+---------------+
27 rows in set (0.00 sec)   */

SELECT `country` AS 'davlat',
COUNT(`country`) AS 'mijozlar soni'
FROM `customers`
GROUP BY `country`
ORDER BY `mijozlar soni` DESC;
/* mijozlar soni kamayish tartibida tartiblanganda:
+--------------+---------------+
| davlat       | mijozlar soni |
+--------------+---------------+
| USA          |            36 |
| Germany      |            13 |
| France       |            12 |
| Spain        |             7 |
| Australia    |             5 |
| UK           |             5 |
| Italy        |             4 |
| New Zealand  |             4 |
| Norway       |             3 |
| Singapore    |             3 |
| Finland      |             3 |
| Canada       |             3 |
| Switzerland  |             3 |
| Sweden       |             2 |
| Denmark      |             2 |
| Portugal     |             2 |
| Japan        |             2 |
| Ireland      |             2 |
| Belgium      |             2 |
| Austria      |             2 |
| Poland       |             1 |
| Hong Kong    |             1 |
| Netherlands  |             1 |
| South Africa |             1 |
| Philippines  |             1 |
| dedede       |             1 |
| Israel       |             1 |
+--------------+---------------+
27 rows in set (0.00 sec)   */