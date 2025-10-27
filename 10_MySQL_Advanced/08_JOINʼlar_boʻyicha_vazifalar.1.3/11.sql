/*  11-masala:
2003-yil, noyabr oyida buyurtma qilingan maxsulotlarning,
jami 130 tadan ortiq sotilganlarini,
productCode, produkt nomi va
nechta buyurtma qilinganligi sonini chiqaring  */
/*------------+--------------------------------+------+
| productCode | productName                    | jami |
+-------------+--------------------------------+------+
| S18_3232    | 1992 Ferrari 360 Spider red    |  217 |
| S18_3685    | 1948 Porsche Type 356 Roadster |  132 |
| S18_4522    | 1904 Buick Runabout            |  132 |
| S12_3891    | 1969 Ford Falcon               |  131 |
+-------------+--------------------------------+-----*/
USE `mashq`;

SELECT `p`.`productCode`           AS 'productCode',
       `p`.`productName`           AS 'productName',
       SUM(`od`.`quantityOrdered`) AS 'jami'
FROM `products` `p`
         JOIN `orderdetails` `od`
              ON  `p`.`productCode` = `od`.`productCode`
         JOIN `orders` `o`
              ON `od`.`orderNumber` =  `o`.`orderNumber`
WHERE  YEAR(`o`.`orderDate`) = 2003
  AND MONTH(`o`.`orderDate`) = 11
GROUP BY `p`.`productCode`, `p`.`productName`
ORDER BY `jami` DESC;
/*------------+---------------------------------------------+------+
| productCode | productName                                 | jami |
+-------------+---------------------------------------------+------+
| S18_3232    | 1992 Ferrari 360 Spider red                 |  217 |
| S18_3685    | 1948 Porsche Type 356 Roadster              |  132 |
| S18_4522    | 1904 Buick Runabout                         |  132 |
| S12_3891    | 1969 Ford Falcon                            |  131 |
| S18_4668    | 1939 Cadillac Limousine                     |  130 |
| S18_2432    | 1926 Ford Fire Engine                       |  130 |
| S18_2319    | 1964 Mercedes Tour Bus                      |  129 |
| S700_4002   | American Airlines: MD-11S                   |  129 |
| S18_1367    | 1936 Mercedes-Benz 500K Special Roadster    |  126 |
| S24_3151    | 1912 Ford Model T Delivery Wagon            |  125 |
| S12_1666    | 1958 Setra Bus                              |  122 |
| S24_2011    | 18th century schooner                       |  121 |
| S700_2610   | The USS Constitution Ship                   |  121 |
| S18_3029    | 1999 Yamaha Speed Boat                      |  119 |
| S24_3432    | 2002 Chevy Corvette                         |  117 |
| S32_3522    | 1996 Peterbilt 379 Stake Bed with Outrigger |  117 |
| S50_1392    | Diamond T620 Semi-Skirted Tanker            |  117 |
| S24_1046    | 1970 Chevy Chevelle SS 454                  |  116 |
| S18_1662    | 1980s Black Hawk Helicopter                 |  116 |
| S18_3856    | 1941 Chevrolet Special Deluxe Cabriolet     |  116 |
| S24_3949    | Corsair F4U ( Bird Cage)                    |  116 |
| S24_2360    | 1982 Ducati 900 Monster                     |  115 |
| S12_3380    | 1968 Dodge Charger                          |  115 |
| S24_1628    | 1966 Shelby Cobra 427 S/C                   |  115 |
| S32_2509    | 1954 Greyhound Scenicruiser                 |  115 |
| S18_1589    | 1965 Aston Martin DB5                       |  113 |
| S18_3259    | Collectable Wooden Train                    |  113 |
| S12_4473    | 1957 Chevy Pickup                           |  112 |
| S24_4048    | 1992 Porsche Cayenne Turbo Silver           |  112 |
| S18_2949    | 1913 Ford Model T Speedster                 |  111 |
| S24_2840    | 1958 Chevy Corvette Limited Edition         |  111 |
| S700_1938   | The Mayflower                               |  111 |
| S72_3212    | Pont Yacht                                  |  110 |
| S18_4721    | 1957 Corvette Convertible                   |  109 |
| S50_4713    | 2002 Yamaha YZR M1                          |  109 |
| S18_4933    | 1957 Ford Thunderbird                       |  108 |
| S700_3505   | The Titanic                                 |  108 |
| S700_2466   | America West Airlines B757-200              |  108 |
| S32_2206    | 1982 Ducati 996 R                           |  106 |
| S18_2248    | 1911 Ford Town Car                          |  106 |
| S24_3371    | 1971 Alpine Renault 1600s                   |  105 |
| S32_1268    | 1980’s GM Manhattan Express                 |  105 |
| S12_4675    | 1969 Dodge Charger                          |  104 |
| S24_3856    | 1956 Porsche 356A Coupe                     |  104 |
| S18_2870    | 1999 Indy 500 Monte Carlo SS                |  104 |
| S24_2766    | 1949 Jaguar XK 120                          |  104 |
| S12_3148    | 1969 Corvair Monza                          |  104 |
| S50_1514    | 1962 City of Detroit Streetcar              |  104 |
| S24_2841    | 1900s Vintage Bi-Plane                      |  104 |
| S12_2823    | 2002 Suzuki XREO                            |  103 |
| S18_1984    | 1995 Honda Civic                            |  103 |
| S24_2972    | 1982 Lamborghini Diablo                     |  103 |
| S32_3207    | 1950's Chicago Surface Lines Streetcar      |  103 |
| S18_3782    | 1957 Vespa GS150                            |  102 |
| S18_4027    | 1970 Triumph Spitfire                       |  102 |
| S24_1444    | 1970 Dodge Coronet                          |  102 |
| S72_1253    | Boeing X-32A JSF                            |  102 |
| S18_1129    | 1993 Mazda RX-7                             |  101 |
| S24_2300    | 1962 Volkswagen Microbus                    |  101 |
| S12_1108    | 2001 Ferrari Enzo                           |  101 |
| S18_4600    | 1940s Ford truck                            |  100 |
| S18_3140    | 1903 Ford Model A                           |  100 |
| S10_1949    | 1952 Alpine Renault 1300                    |   99 |
| S18_3278    | 1969 Dodge Super Bee                        |   98 |
| S32_4485    | 1974 Ducati 350 Mk3 Desmo                   |   98 |
| S24_4620    | 1961 Chevrolet Impala                       |   96 |
| S18_1342    | 1937 Lincoln Berline                        |   96 |
| S24_1937    | 1939 Chevrolet Deluxe Coupe                 |   96 |
| S18_2325    | 1932 Model A Ford J-Coupe                   |   95 |
| S10_4757    | 1972 Alfa Romeo GTA                         |   95 |
| S18_3320    | 1917 Maxwell Touring Car                    |   94 |
| S18_2238    | 1998 Chrysler Plymouth Prowler              |   93 |
| S24_1785    | 1928 British Royal Navy Airplane            |   93 |
| S18_2957    | 1934 Ford V8 Coupe                          |   91 |
| S700_2824   | 1982 Camaro Z28                             |   91 |
| S18_1097    | 1940 Ford Pickup Truck                      |   90 |
| S24_3191    | 1969 Chevrolet Camaro Z28                   |   89 |
| S18_1749    | 1917 Grand Touring Sedan                    |   89 |
| S24_4258    | 1936 Chrysler Airflow                       |   89 |
| S32_1374    | 1997 BMW F650 ST                            |   89 |
| S18_1889    | 1948 Porsche 356-A Roadster                 |   87 |
| S10_4962    | 1962 LanciaA Delta 16V                      |   87 |
| S12_3990    | 1970 Plymouth Hemi Cuda                     |   86 |
| S10_4698    | 2003 Harley-Davidson Eagle Drag Bike        |   86 |
| S700_2047   | HMS Bounty                                  |   82 |
| S18_3482    | 1976 Ford Gran Torino                       |   81 |
| S18_4409    | 1932 Alfa Romeo 8C2300 Spider Sport         |   81 |
| S700_3962   | The Queen Mary                              |   81 |
| S24_3969    | 1936 Mercedes Benz 500k Roadster            |   80 |
| S10_2016    | 1996 Moto Guzzi 1100i                       |   80 |
| S24_3816    | 1940 Ford Delivery Sedan                    |   79 |
| S12_1099    | 1968 Ford Mustang                           |   78 |
| S24_2022    | 1938 Cadillac V-16 Presidential Limousine   |   78 |
| S10_1678    | 1969 Harley Davidson Ultimate Chopper       |   77 |
| S18_3136    | 18th Century Vintage Horse Carriage         |   76 |
| S24_3420    | 1937 Horch 930V Limousine                   |   75 |
| S50_1341    | 1930 Buick Marquette Phaeton                |   75 |
| S700_3167   | F/A 18 Hornet 1/72                          |   73 |
| S24_1578    | 1997 BMW R 1100 S                           |   73 |
| S18_2581    | P-51-D Mustang                              |   69 |
| S700_1138   | The Schooner Bluenose                       |   68 |
| S24_2000    | 1960 BSA Gold Star DBD34                    |   68 |
| S24_2887    | 1952 Citroen-15CV                           |   66 |
| S18_2795    | 1928 Mercedes-Benz SSK                      |   65 |
| S24_4278    | 1900s Vintage Tri-Plane                     |   60 |
| S700_1691   | American Airlines: B767-300                 |   57 |
| S18_2625    | 1936 Harley Davidson El Knucklehead         |   57 |
| S32_4289    | 1928 Ford Phaeton Deluxe                    |   55 |
| S700_2834   | ATA: B757-300                               |   54 |
+-------------+---------------------------------------------+-----*/
