/* 3)"products" jadvalidan:
skladdagi soni 3000 dan kam
bo`lganlarni barchasini sotiladigan
narxini 15 % ga kamaytiring */      -- SOTILISH NARHI QOLIB SOTIB OLISH NARHINI O'ZGARTIRIBMAN
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
SELECT `productName` AS "Mahsulot nomi",
       `MSRP` AS "Sotilish narhi"
FROM `products`
WHERE `productLine` = 'Motorcycles';
/* natija:
+---------------------------------------+----------------+
| Mahsulot nomi                         | Sotilish narhi |
+---------------------------------------+----------------+
| 1969 Harley Davidson Ultimate Chopper |         126.57 |
| 1996 Moto Guzzi 1100i                 |         157.30 |
| 2003 Harley-Davidson Eagle Drag Bike  |         256.12 |
| 2002 Suzuki XREO                      |         199.19 |
| 1936 Harley Davidson El Knucklehead   |          80.11 |
| 1957 Vespa GS150                      |          82.23 |
| 1997 BMW R 1100 S                     |         149.05 |
| 1960 BSA Gold Star DBD34              |          89.16 |
| 1982 Ducati 900 Monster               |          91.60 |
| 1997 BMW F650 ST                      |         116.91 |
| 1982 Ducati 996 R                     |          53.20 |
| 1974 Ducati 350 Mk3 Desmo             |         134.96 |
| 2002 Yamaha YZR M1                    |          95.23 |
+---------------------------------------+----------------+
13 rows in set (0.00 sec)
 */

UPDATE `products`
SET `MSRP` = `MSRP` * (100 - 15) / 100
WHERE `productLine` = "Motorcycles";
/*
 Query OK, 13 rows affected, 11 warnings (0.05 sec)
Rows matched: 13  Changed: 13  Warnings: 11
 */
SELECT `productName` AS "Mahsulot nomi",
       `MSRP`        AS "Sotilish narhi"
FROM `products`
WHERE `productLine` = "Motorcycles";
/* natija:
+---------------------------------------+----------------+
| Mahsulot nomi                         | Sotilish narhi |
+---------------------------------------+----------------+
| 1969 Harley Davidson Ultimate Chopper |          91.44 |
| 1996 Moto Guzzi 1100i                 |         113.65 |
| 2003 Harley-Davidson Eagle Drag Bike  |         185.05 |
| 2002 Suzuki XREO                      |         143.91 |
| 1936 Harley Davidson El Knucklehead   |          57.88 |
| 1957 Vespa GS150                      |          59.42 |
| 1997 BMW R 1100 S                     |         107.69 |
| 1960 BSA Gold Star DBD34              |          64.42 |
| 1982 Ducati 900 Monster               |          66.18 |
| 1997 BMW F650 ST                      |          84.46 |
| 1982 Ducati 996 R                     |          38.44 |
| 1974 Ducati 350 Mk3 Desmo             |          97.51 |
| 2002 Yamaha YZR M1                    |          68.81 |
+---------------------------------------+----------------+
13 rows in set (0.00 sec)   */


/* "Classic Cars" turidagi skladdagi
soni 1000 dan kam bo`lgan maxlusotlarni,
sotib olingan narxini 10% oshirib,
sotilishi narxini 18% oshiring */
SELECT `productName` AS "\Mahsulot nomi",
       `quantityInStock` AS "\Mahsulotlar soni",
       `buyPrice` AS "\Sotib olish narhi",
       `MSRP` AS "\Sotish narhi"
FROM `products`
WHERE `productLine` = "Classic Cars";
/* natija:
+-------------------------------------+------------------+-------------------+--------------+
| Mahsulot nomi                       | Mahsulotlar soni | Sotib olish narhi | Sotish narhi |
+-------------------------------------+------------------+-------------------+--------------+
| 1952 Alpine Renault 1300            |             7305 |             98.58 |       214.30 |
| 1972 Alfa Romeo GTA                 |             3252 |             85.68 |       136.00 |
| 1962 LanciaA Delta 16V              |             6791 |            103.42 |       147.74 |
| 1968 Ford Mustang                   |               68 |             98.06 |       203.20 |
| 2001 Ferrari Enzo                   |             3619 |             95.59 |       207.80 |
| 1969 Corvair Monza                  |             6906 |             89.14 |       151.08 |
| 1968 Dodge Charger                  |             9123 |             75.16 |       117.44 |
| 1969 Ford Falcon                    |             1049 |             70.59 |       129.77 |
| 1970 Plymouth Hemi Cuda             |             5663 |             31.92 |        79.80 |
| 1969 Dodge Charger                  |             7323 |             58.73 |       115.16 |
| 1993 Mazda RX-7                     |             3975 |             83.51 |       141.54 |
| 1965 Aston Martin DB5               |             9042 |             65.96 |       124.44 |
| 1948 Porsche 356-A Roadster         |             8826 |             53.90 |        77.00 |
| 1995 Honda Civic                    |             9772 |             93.89 |       142.25 |
| 1998 Chrysler Plymouth Prowler      |             4724 |            101.51 |       163.73 |
| 1999 Indy 500 Monte Carlo SS        |             8164 |             56.76 |       132.00 |
| 1992 Ferrari 360 Spider red         |             8347 |             77.90 |       169.34 |
| 1985 Toyota Supra                   |             7733 |             57.01 |       107.57 |
| 1969 Dodge Super Bee                |             1917 |             41.69 |        60.31 |
| 1976 Ford Gran Torino               |             9127 |             73.49 |       146.99 |
| 1948 Porsche Type 356 Roadster      |             8990 |             62.16 |       141.28 |
| 1970 Triumph Spitfire               |             5545 |             91.92 |       143.62 |
| 1957 Corvette Convertible           |             1249 |             59.44 |       111.60 |
| 1957 Ford Thunderbird               |             3209 |             34.21 |        71.27 |
| 1970 Chevy Chevelle SS 454          |             1005 |             41.85 |        55.12 |
| 1970 Dodge Coronet                  |             4074 |             32.37 |        57.80 |
| 1966 Shelby Cobra 427 S/C           |             8197 |             29.18 |        50.31 |
| 1949 Jaguar XK 120                  |             2350 |             40.16 |        68.15 |
| 1958 Chevy Corvette Limited Edition |             2542 |             13.52 |        26.52 |
| 1952 Citroen-15CV                   |             1452 |             61.90 |        88.08 |
| 1982 Lamborghini Diablo             |             7723 |             16.24 |        37.76 |
| 1969 Chevrolet Camaro Z28           |             4695 |             50.51 |        85.61 |
| 1971 Alpine Renault 1600s           |             7995 |             38.58 |        61.23 |
| 2002 Chevy Corvette                 |             9446 |             62.11 |       107.08 |
| 1956 Porsche 356A Coupe             |             6600 |             98.30 |       140.43 |
| 1992 Porsche Cayenne Turbo Silver   |             6582 |             69.78 |       118.28 |
| 1961 Chevrolet Impala               |             7869 |             32.33 |        80.84 |
| 1982 Camaro Z28                     |             6934 |             46.53 |       101.15 |
+-------------------------------------+------------------+-------------------+--------------+
38 rows in set (0.01 sec)  */

UPDATE `products`
SET    `buyPrice` = `buyPrice` + (`buyPrice` / 10),
       `MSRP` = `MSRP` * (100 - 18) / 100
WHERE `productLine` = "Classic Cars";
/* Query OK, 38 rows affected, 69 warnings (0.02 sec)
Rows matched: 38  Changed: 38  Warnings: 69     */

SELECT `productName` AS "\Mahsulot nomi",
       `quantityInStock` AS "\Mahsulotlar soni",
       `buyPrice` AS "\Sotib olish narhi",
       `MSRP` AS "\Sotish narhi"
FROM `products`
WHERE `productLine` = "Classic Cars";
/* natija:
+-------------------------------------+------------------+-------------------+--------------+
| Mahsulot nomi                       | Mahsulotlar soni | Sotib olish narhi | Sotish narhi |
+-------------------------------------+------------------+-------------------+--------------+
| 1952 Alpine Renault 1300            |             7305 |            108.44 |       175.73 |
| 1972 Alfa Romeo GTA                 |             3252 |             94.25 |       111.52 |
| 1962 LanciaA Delta 16V              |             6791 |            113.76 |       121.15 |
| 1968 Ford Mustang                   |               68 |            107.87 |       166.62 |
| 2001 Ferrari Enzo                   |             3619 |            105.15 |       170.40 |
| 1969 Corvair Monza                  |             6906 |             98.05 |       123.89 |
| 1968 Dodge Charger                  |             9123 |             82.68 |        96.30 |
| 1969 Ford Falcon                    |             1049 |             77.65 |       106.41 |
| 1970 Plymouth Hemi Cuda             |             5663 |             35.11 |        65.44 |
| 1969 Dodge Charger                  |             7323 |             64.60 |        94.43 |
| 1993 Mazda RX-7                     |             3975 |             91.86 |       116.06 |
| 1965 Aston Martin DB5               |             9042 |             72.56 |       102.04 |
| 1948 Porsche 356-A Roadster         |             8826 |             59.29 |        63.14 |
| 1995 Honda Civic                    |             9772 |            103.28 |       116.65 |
| 1998 Chrysler Plymouth Prowler      |             4724 |            111.66 |       134.26 |
| 1999 Indy 500 Monte Carlo SS        |             8164 |             62.44 |       108.24 |
| 1992 Ferrari 360 Spider red         |             8347 |             85.69 |       138.86 |
| 1985 Toyota Supra                   |             7733 |             62.71 |        88.21 |
| 1969 Dodge Super Bee                |             1917 |             45.86 |        49.45 |
| 1976 Ford Gran Torino               |             9127 |             80.84 |       120.53 |
| 1948 Porsche Type 356 Roadster      |             8990 |             68.38 |       115.85 |
| 1970 Triumph Spitfire               |             5545 |            101.11 |       117.77 |
| 1957 Corvette Convertible           |             1249 |             65.38 |        91.51 |
| 1957 Ford Thunderbird               |             3209 |             37.63 |        58.44 |
| 1970 Chevy Chevelle SS 454          |             1005 |             46.04 |        45.20 |
| 1970 Dodge Coronet                  |             4074 |             35.61 |        47.40 |
| 1966 Shelby Cobra 427 S/C           |             8197 |             32.10 |        41.25 |
| 1949 Jaguar XK 120                  |             2350 |             44.18 |        55.88 |
| 1958 Chevy Corvette Limited Edition |             2542 |             14.87 |        21.75 |
| 1952 Citroen-15CV                   |             1452 |             68.09 |        72.23 |
| 1982 Lamborghini Diablo             |             7723 |             17.86 |        30.96 |
| 1969 Chevrolet Camaro Z28           |             4695 |             55.56 |        70.20 |
| 1971 Alpine Renault 1600s           |             7995 |             42.44 |        50.21 |
| 2002 Chevy Corvette                 |             9446 |             68.32 |        87.81 |
| 1956 Porsche 356A Coupe             |             6600 |            108.13 |       115.15 |
| 1992 Porsche Cayenne Turbo Silver   |             6582 |             76.76 |        96.99 |
| 1961 Chevrolet Impala               |             7869 |             35.56 |        66.29 |
| 1982 Camaro Z28                     |             6934 |             51.18 |        82.94 |
+-------------------------------------+------------------+-------------------+--------------+
38 rows in set (0.01 sec)   */

/* MSRP - sotilish narxi
buyPrice - sotib olingan    */