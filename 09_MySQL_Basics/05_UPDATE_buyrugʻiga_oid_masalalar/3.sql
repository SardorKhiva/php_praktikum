/* 3)"products" jadvalidan:
skladdagi soni 3000 dan kam
bo`lganlarni barchasini sotiladigan
narxini 15 % ga kamaytiring */
SHOW DATABASES;
USE `Mashq`;
SHOW TABLES;

SELECT * FROM `products`;   -- to'liq jadval

SELECT `productName` AS "\Mahsulot nomi",   -- ko'rsatilsin Mahsulot nomi
       `quantityInStock` AS "Qoldiq",       -- qolgan tovarlar soni
       `buyPrice` AS "\Narhi"               -- va narhi
FROM `products`                             -- products jadvalidan
WHERE `quantityInStock` < 3000              -- qoldiq 3000 dan kam bo'lganlar
ORDER BY `Qoldiq`;                          -- kamroq mahsulotlar oldinda tursin
/* natija:
+---------------------------------------------+--------+--------+
| Mahsulot nomi                               | Qoldiq | Narhi  |
+---------------------------------------------+--------+--------+
| 1960 BSA Gold Star DBD34                    |     15 |  41.05 |
| 1968 Ford Mustang                           |     68 | 115.36 |
| 1928 Ford Phaeton Deluxe                    |    136 |  36.32 |
| 1997 BMW F650 ST                            |    178 |  73.61 |
| Pont Yacht                                  |    414 |  36.63 |
| 1911 Ford Town Car                          |    540 |  36.63 |
| 1928 Mercedes-Benz SSK                      |    548 |  79.82 |
| F/A 18 Hornet 1/72                          |    551 |  59.84 |
| 2002 Yamaha YZR M1                          |    600 |  37.59 |
| The Mayflower                               |    737 |  47.63 |
| 1996 Peterbilt 379 Stake Bed with Outrigger |    814 |  36.97 |
| P-51-D Mustang                              |    992 |  53.90 |
| 1970 Chevy Chevelle SS 454                  |   1005 |  49.24 |
| Diamond T620 Semi-Skirted Tanker            |   1016 |  68.29 |
| 1969 Ford Falcon                            |   1049 |  83.05 |
| 1957 Corvette Convertible                   |   1249 |  69.93 |
| 1952 Citroen-15CV                           |   1452 |  72.82 |
| 1958 Setra Bus                              |   1579 |  77.90 |
| 1962 City of Detroit Streetcar              |   1645 |  37.49 |
| The Schooner Bluenose                       |   1897 |  34.00 |
| 18th century schooner                       |   1898 |  82.34 |
| 1969 Dodge Super Bee                        |   1917 |  49.05 |
| The Titanic                                 |   1956 |  51.09 |
| 1926 Ford Fire Engine                       |   2018 |  24.92 |
| 1936 Mercedes Benz 500k Roadster            |   2081 |  21.75 |
| 1962 Volkswagen Microbus                    |   2327 |  61.34 |
| 1949 Jaguar XK 120                          |   2350 |  47.25 |
| 1941 Chevrolet Special Deluxe Cabriolet     |   2378 |  64.58 |
| 1958 Chevy Corvette Limited Edition         |   2542 |  15.91 |
| 1940 Ford Pickup Truck                      |   2613 |  58.33 |
| 1917 Grand Touring Sedan                    |   2724 |  86.70 |
| 1900s Vintage Tri-Plane                     |   2756 |  36.23 |
| 1938 Cadillac V-16 Presidential Limousine   |   2847 |  20.61 |
| 1954 Greyhound Scenicruiser                 |   2874 |  25.98 |
| 1937 Horch 930V Limousine                   |   2902 |  26.30 |
+---------------------------------------------+--------+--------+
35 rows in set (0.00 sec) */

UPDATE `products`
SET `buyPrice` = `buyPrice` * 0.85
WHERE `quantityInStock` < 3000;
/* natija:
+---------------------------------------------+--------+-------+
| Mahsulot nomi                               | Qoldiq | Narhi |
+---------------------------------------------+--------+-------+
| 1960 BSA Gold Star DBD34                    |     15 | 34.89 |
| 1968 Ford Mustang                           |     68 | 98.06 |
| 1928 Ford Phaeton Deluxe                    |    136 | 30.87 |
| 1997 BMW F650 ST                            |    178 | 62.57 |
| Pont Yacht                                  |    414 | 31.14 |
| 1911 Ford Town Car                          |    540 | 31.14 |
| 1928 Mercedes-Benz SSK                      |    548 | 67.85 |
| F/A 18 Hornet 1/72                          |    551 | 50.86 |
| 2002 Yamaha YZR M1                          |    600 | 31.95 |
| The Mayflower                               |    737 | 40.49 |
| 1996 Peterbilt 379 Stake Bed with Outrigger |    814 | 31.42 |
| P-51-D Mustang                              |    992 | 45.82 |
| 1970 Chevy Chevelle SS 454                  |   1005 | 41.85 |
| Diamond T620 Semi-Skirted Tanker            |   1016 | 58.05 |
| 1969 Ford Falcon                            |   1049 | 70.59 |
| 1957 Corvette Convertible                   |   1249 | 59.44 |
| 1952 Citroen-15CV                           |   1452 | 61.90 |
| 1958 Setra Bus                              |   1579 | 66.22 |
| 1962 City of Detroit Streetcar              |   1645 | 31.87 |
| The Schooner Bluenose                       |   1897 | 28.90 |
| 18th century schooner                       |   1898 | 69.99 |
| 1969 Dodge Super Bee                        |   1917 | 41.69 |
| The Titanic                                 |   1956 | 43.43 |
| 1926 Ford Fire Engine                       |   2018 | 21.18 |
| 1936 Mercedes Benz 500k Roadster            |   2081 | 18.49 |
| 1962 Volkswagen Microbus                    |   2327 | 52.14 |
| 1949 Jaguar XK 120                          |   2350 | 40.16 |
| 1941 Chevrolet Special Deluxe Cabriolet     |   2378 | 54.89 |
| 1958 Chevy Corvette Limited Edition         |   2542 | 13.52 |
| 1940 Ford Pickup Truck                      |   2613 | 49.58 |
| 1917 Grand Touring Sedan                    |   2724 | 73.70 |
| 1900s Vintage Tri-Plane                     |   2756 | 30.80 |
| 1938 Cadillac V-16 Presidential Limousine   |   2847 | 17.52 |
| 1954 Greyhound Scenicruiser                 |   2874 | 22.08 |
| 1937 Horch 930V Limousine                   |   2902 | 22.36 |
+---------------------------------------------+--------+-------+
35 rows in set (0.01 sec)    */




/* "Motorcycles" turidagi maxsulotlarni
barchasini sotilish narxini 15% ga oshiring */



/* "Classic Cars" turidagi skladdagi
soni 1000 dan kam bo`lgan maxlusotlarni,
sotib olingan narxini 10% oshirib,
sotilishi narxini 18% oshiring */

/* MSRP - sotilish narxi
buyPrice - sotib olingan    */