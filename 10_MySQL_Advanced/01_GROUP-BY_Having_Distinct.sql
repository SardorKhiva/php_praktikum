SHOW DATABASES; /*
+--------------------+
| Database           |
+--------------------+
| dars_demo          |
| information_schema |
| mashq              |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.00 sec)     */

USE `dars_demo`; -- Database changed
SHOW TABLES; /*
+----------------------+
| Tables_in_dars_demo  |
+----------------------+
| current_dept_emp     |
| departments          |
| dept_emp             |
| dept_emp_latest_date |
| dept_manager         |
| employees            |
| salaries             |
| titles               |
+----------------------+
8 rows in set (0.01 sec)    */

SELECT COUNT(*)
FROM `employees`;
/* satr, qatorlar soni
+----------+
| COUNT(*) |
+----------+
|   300024 |
+----------+
1 row in set (0.03 sec) */

# DISTINCT - dublikatlarsiz ma'lumotlarni olish

SELECT DISTINCT `first_name` -- first_name ustunidagi unikal qiymatlarni olish
FROM `employees` -- employees jadvalidan
ORDER BY `first_name`;
-- ismlarni tartiblab chiqarish
/* jadvalni ko'rinishi:
+----------------+
| first_name     |
+----------------+
| Aamer          |
| Aamod          |
| Abdelaziz      |
| Abdelghani     |
| Abdelkader     |
| Abdelwaheb     |
| Abdulah        |
| Abdulla        |
| Achilleas      |
| Adam           |
| Adamantios     |
| Adas           |
| Adel           |
| Adhemar        |
| Adib           |
| Adil           |
| Adin           |
| Adit           |
| Adly           |
| Aemilian       |
| Aiichiro       |
| Aiman          |
| Aimee          |
| Akeel          |
| Akemi          |
| Akeno          |
| Akhilish       |
| Aksel          |
| Alagu          |
| Alain          |
| Alair          |
| Alassane       |
| Alejandra      |
| Alejandro      |
| Aleksandar     |
| Aleksander     |
| Alenka         |
| Alexius        |
| Almudena       |
| Alois          |
| Aloke          |
| Along          |
| Aloys          |
| Alper          |
| Alselm         |
| Aluzio         |
| Amabile        |
| Amalendu       |
| Amstein        |
| Anestis        |
| Angel          |
| Angus          |
| Anneke         |
| Anneli         |
| Annemarie      |
| Anoosh         |
| Anwar          |
| Anyuan         |
| Apostol        |
| Aral           |
| Aram           |
| Aran           |
| Arch           |
| Arco           |
| Arfst          |
| Aria           |
| Arie           |
| Arif           |
| Aris           |
| Arlette        |
| Armond         |
| Arnd           |
| Arne           |
| Arno           |
| Arnould        |
| Aron           |
| Arra           |
| Arto           |
| Arumugam       |
| Arun           |
| Aruna          |
| Arunachalam    |
| Arunas         |
| Arup           |
| Arve           |
| Arvin          |
| Arvind         |
| Ashish         |
| Atilio         |
| Atreye         |
| Atreyi         |
| Augustine      |
| Avishai        |
| Ayakannu       |
| Ayonca         |
| Babette        |
| Bader          |
| Badri          |
| Bangqing       |
| Baocai         |
| Baoqiu         |
| Barna          |
| Barry          |
| Bartek         |
| Barton         |
| Baruch         |
| Barun          |
| Basant         |
| Basem          |
| Basil          |
| Basim          |
| Baziley        |
| Becky          |
| Bedir          |
| Bedrich        |
| Behnaam        |
| Berhard        |
| Berna          |
| Bernardo       |
| Bernd          |
| Berni          |
| Bernice        |
| Bernt          |
| Berry          |
| Berthier       |
| Berto          |
| Beshir         |
| Bezalel        |
| Bikash         |
| Bilhanan       |
| Billie         |
| Billur         |
| Bingning       |
| Bluma          |
| Boalin         |
| Boaz           |
| Bodh           |
| Bodo           |
| Bogdan         |
| Boguslaw       |
| Bojan          |
| Bokyung        |
| Boriana        |
| Bouchung       |
| Boutros        |
| Bowen          |
| Branimir       |
| Breannda       |
| Brendon        |
| Brewster       |
| Brigham        |
| Byong          |
| Candida        |
| Candido        |
| Caolyn         |
| Carrsten       |
| Cathie         |
| Cedric         |
| Chaitali       |
| Chandrasekaran |
| Changho        |
| Chanjung       |
| Chaosheng      |
| Chaoyi         |
| Charlene       |
| Charmane       |
| Chenxi         |
| Chenye         |
| Chenyi         |
| Cheong         |
| Chikako        |
| Chikara        |
| Chinho         |
| Chinhyun       |
| Chinya         |
| Chiradeep      |
| Chiranjit      |
| Chirstian      |
| Chrisa         |
| Chriss         |
| Christ         |
| Christfried    |
| Christoper     |
| Christoph      |
| Christophe     |
| Chuanti        |
| Chuanyi        |
| Claude         |
| Claudi         |
| Clyde          |
| Collette       |
| Conal          |
| Conor          |
| Conrado        |
| Constantijn    |
| Constantine    |
| Constantino    |
| Cordelia       |
| Cristinel      |
| Cullen         |
| DAIDA          |
| Danae          |
| Danai          |
| Danco          |
| Danel          |
| Danil          |
| Danny          |
| Dannz          |
| Dante          |
| Dayanand       |
| Debaprosad     |
| Debatosh       |
| Deborah        |
| DeForest       |
| Dekang         |
| Demin          |
| Demos          |
| Denis          |
| Deniz          |
| Denny          |
| Dharmaraja     |
| Dhritiman      |
| Diederik       |
| Dietrich       |
| Dinah          |
| Dines          |
| Dinkar         |
| Dipankar       |
| Dipayan        |
| Divier         |
| Divine         |
| Djelloul       |
| Djenana        |
| Dmitri         |
| Dmitry         |
| Domenick       |
| Domenico       |
| Doohun         |
| Doowon         |
| Douadi         |
| Duangkaew      |
| Duke           |
| Dulce          |
| Dung           |
| Duri           |
| Duro           |
| Dzung          |
| Ebbe           |
| Eben           |
| Eberhardt      |
| Ebru           |
| Eckart         |
| Edwin          |
| Eirik          |
| Eishiro        |
| Ekawit         |
| Eldridge       |
| Elgin          |
| Elliott        |
| Elrique        |
| Elvia          |
| Elvis          |
| Elzbieta       |
| Emdad          |
| Emran          |
| Ennio          |
| Eran           |
| Erez           |
| Eric           |
| Erzsebet       |
| Etsuo          |
| Evgueni        |
| Ewing          |
| Fabrizio       |
| Fai            |
| Faiza          |
| Falguni        |
| Fan            |
| Fatemeh        |
| Fay            |
| Fayez          |
| Fei            |
| Feipei         |
| Feixiong       |
| Feiyu          |
| Felicidad      |
| Fen            |
| Ferdinand      |
| Filipe         |
| Filipp         |
| Flemming       |
| Florian        |
| Florina        |
| Foong          |
| Fox            |
| Francesca      |
| Francoise      |
| Franziska      |
| Frazer         |
| Frederique     |
| Freyja         |
| Froduald       |
| Fumiko         |
| Fumino         |
| Fumitaka       |
| Fumitake       |
| Fumiya         |
| Fumiyo         |
| Fun            |
| Fuqing         |
| Fusako         |
| Gad            |
| Gadiel         |
| Gaetan         |
| Gal            |
| Gao            |
| Garnet         |
| Garnik         |
| Gaurav         |
| Gay            |
| Gen            |
| Genevieve      |
| Genki          |
| Gennadi        |
| Gennady        |
| Genta          |
| Geoff          |
| Geoffrey       |
| Geoffry        |
| Georg          |
| George         |
| Georgi         |
| Georgy         |
| Ger            |
| Geraldo        |
| Gererd         |
| Ghassan        |
| Gian           |
| Gianluca       |
| Giao           |
| Giap           |
| Gift           |
| Gil            |
| Gila           |
| Gilbert        |
| Gill           |
| Gina           |
| Gino           |
| Gio            |
| Giordano       |
| Giri           |
| Girolamo       |
| Gita           |
| Gladys         |
| Goa            |
| Godehard       |
| Goetz          |
| Goh            |
| Golgen         |
| Goncalo        |
| Gonzalo        |
| Goo            |
| Gopalakrishnan |
| Gor            |
| Gou            |
| Greger         |
| Gregory        |
| Gretta         |
| Gritta         |
| Gro            |
| Guadalupe      |
| Guangming      |
| Gudjon         |
| Guenter        |
| Guiseppe       |
| Gully          |
| Gunilla        |
| Guoxiang       |
| Guozhong       |
| Gurbir         |
| Guther         |
| Guttorm        |
| Hailing        |
| Hairong        |
| Haldon         |
| Haldun         |
| Halsur         |
| Harjit         |
| Harngdar       |
| Hatem          |
| Hatim          |
| Hatsukazu      |
| Hauke          |
| Hausi          |
| Heather        |
| Heejo          |
| Heeju          |
| Heekeun        |
| Hein           |
| Heng           |
| Henk           |
| Heon           |
| Heping         |
| Herb           |
| Herbert        |
| Hercules       |
| Hidde          |
| Hidefumi       |
| Hidekazu       |
| Hideo          |
| Hideyuki       |
| Hilari         |
| Hilary         |
| Hinrich        |
| Hirochika      |
| Hironobu       |
| Hironoby       |
| Hiroyasu       |
| Hisao          |
| Hitofumi       |
| Hitomi         |
| Holgard        |
| Honesty        |
| Honglan        |
| Hongzhu        |
| Hongzue        |
| Horward        |
| Houman         |
| Howell         |
| Hsiangchu      |
| Huai           |
| Huan           |
| Huei           |
| Hugh           |
| Hugo           |
| Huican         |
| Huiqun         |
| Hyuckchul      |
| Hyuncheol      |
| Iara           |
| Ibibia         |
| Idoia          |
| IEEE           |
| Inderjeet      |
| Indrajit       |
| Ingemar        |
| Ingmar         |
| Insup          |
| Ioana          |
| Ipke           |
| Irena          |
| Irene          |
| Isaac          |
| Isamu          |
| Ishfaq         |
| Itzchak        |
| Izaskun        |
| Jaana          |
| Jaber          |
| Jackson        |
| Jacopo         |
| Jacqueline     |
| Jaewon         |
| Jaewoo         |
| Jagoda         |
| Jahangir       |
| Jaideep        |
| Jaihie         |
| Jamaludin      |
| Janalee        |
| Janche         |
| Jaques         |
| Jaroslava      |
| Jasminko       |
| Jayesh         |
| Jayson         |
| Jeane          |
| Jeanna         |
| Jeanne         |
| Jenwei         |
| Jeong          |
| Jessie         |
| Jiafu          |
| Jiakeng        |
| Jiang          |
| Jianhao        |
| Jianhua        |
| Jianhui        |
| Jiann          |
| Jianwen        |
| Jingling       |
| Jinpo          |
| Jinxi          |
| Jinya          |
| Jiong          |
| Jixiang        |
| JiYoung        |
| JoAnna         |
| JoAnne         |
| Jolita         |
| Jongsuk        |
| Jordanka       |
| Josyula        |
| Jouko          |
| Jouni          |
| Jovan          |
| Joydip         |
| Juichirou      |
| Jungsoon       |
| Junichi        |
| Junsik         |
| Juyoung        |
| Kagan          |
| Kaijung        |
| Kamakshi       |
| Kamran         |
| Kankanahalli   |
| Kannan         |
| Karlis         |
| Karoline       |
| Karsten        |
| Kasidit        |
| Kasturi        |
| Katsuo         |
| Katsuyuki      |
| Kauko          |
| KayLiang       |
| Kayoko         |
| Kazuhide       |
| Kazuhiko       |
| Kazuhira       |
| Kazuhiro       |
| Kazuhisa       |
| Kazuhito       |
| Kazunori       |
| Kazuyasu       |
| Keiichiro      |
| Kellie         |
| Kellyn         |
| Kendra         |
| Kenroku        |
| Kensei         |
| Kensyu         |
| Kenton         |
| Kerhong        |
| Kerryn         |
| Kersti         |
| Keung          |
| Khaled         |
| Khalid         |
| Khalil         |
| Khatoun        |
| Khedija        |
| Khoa           |
| Khosrow        |
| Khue           |
| Khun           |
| Kiam           |
| Kien           |
| King           |
| Kinh           |
| Kirk           |
| Kish           |
| Kitty          |
| Kiyokazu       |
| Kiyomitsu      |
| Kiyotoshi      |
| Koichi         |
| Kokou          |
| Kolar          |
| Koldo          |
| Kotesh         |
| Kousuke        |
| Krassimir      |
| Krisda         |
| Kristen        |
| Krister        |
| Kristian       |
| Kristin        |
| Kristina       |
| Kristine       |
| Kristinn       |
| Kristof        |
| Kshitij        |
| Kwan           |
| Kwangho        |
| Kwangjo        |
| Kwangsub       |
| Kwangyoen      |
| Kwee           |
| Kwok           |
| Kwun           |
| Kyoichi        |
| Lakshmi        |
| Lalit          |
| Lansing        |
| Larisa         |
| Laurentiu      |
| Leaf           |
| Leah           |
| Leandro        |
| Lech           |
| Leen           |
| Leif           |
| Lein           |
| Lena           |
| Lene           |
| Leni           |
| Lenore         |
| Leon           |
| Leszek         |
| Leucio         |
| Licheng        |
| Lidong         |
| Lihong         |
| Lijia          |
| Lijie          |
| Lillian        |
| LiMin          |
| Limsoon        |
| Lobel          |
| Lokesh         |
| Lorien         |
| Lubomir        |
| Lucian         |
| Lucien         |
| Luerbio        |
| Luigi          |
| Luisa          |
| Luise          |
| Lunjin         |
| Mabhin         |
| Mabo           |
| Mabry          |
| Macha          |
| Mack           |
| Mads           |
| Magdalena      |
| Magy           |
| Maha           |
| Mahendra       |
| Mahmut         |
| Maia           |
| Maik           |
| Maja           |
| Makato         |
| Make           |
| Malu           |
| Mamdouh        |
| Mana           |
| Mandell        |
| Mang           |
| Mani           |
| Manibrata      |
| Manohar        |
| Mansur         |
| Mantis         |
| Manton         |
| Manu           |
| Mara           |
| Marc           |
| Marco          |
| Marek          |
| Maren          |
| Margareta      |
| Margo          |
| Mari           |
| Maria          |
| Mariangiola    |
| Marie          |
| Marin          |
| Mario          |
| Maris          |
| Marit          |
| Mariusz        |
| Marjo          |
| Mark           |
| Marke          |
| Marko          |
| Marl           |
| Marla          |
| Marlo          |
| Marsal         |
| Marsha         |
| Marsja         |
| Mart           |
| Martial        |
| Martien        |
| Martijn        |
| Martina        |
| Martine        |
| Martins        |
| Mary           |
| Masadi         |
| Masaki         |
| Masako         |
| Masali         |
| Masami         |
| Masamitsu      |
| Masanao        |
| Masaru         |
| Masasuke       |
| Masato         |
| Masoud         |
| Matk           |
| Mats           |
| Matt           |
| Maya           |
| Mayuko         |
| Mayumi         |
| Mayuri         |
| Mechthild      |
| Menkae         |
| Michaela       |
| Mihalis        |
| Mikhail        |
| Mingdong       |
| Minghong       |
| Mingsen        |
| Mingzeng       |
| Miomir         |
| Miquel         |
| Mircea         |
| Mitchel        |
| Mitsuyuki      |
| Miyeon         |
| Mizuhito       |
| Mohamadou      |
| Mohammad       |
| Mohammed       |
| Mohan          |
| Mohd           |
| Moheb          |
| Mohit          |
| Mohua          |
| Moie           |
| Mokhtar        |
| Mona           |
| Mong           |
| Moni           |
| Monique        |
| Mooi           |
| Moon           |
| Mori           |
| Moriyoshi      |
| Morrie         |
| Morris         |
| Moss           |
| Mostafa        |
| Moti           |
| Moto           |
| Mototsugu      |
| Moty           |
| Mountaz        |
| Mrinalini      |
| Munehiko       |
| Munehiro       |
| Munenori       |
| Muneo          |
| Munir          |
| Murthy         |
| Muzhong        |
| Nadjib         |
| Naftali        |
| Naftaly        |
| Nagui          |
| Nahid          |
| Nahla          |
| Nahum          |
| Nakhoon        |
| Nalini         |
| Naraig         |
| Narain         |
| Nathalie       |
| Nathan         |
| Navid          |
| Navin          |
| Nechama        |
| Nectarios      |
| Neelam         |
| Neven          |
| Nevin          |
| Nevio          |
| Niclas         |
| Nidapan        |
| Nigel          |
| Nikolaos       |
| Nikolaus       |
| Nimmagadda     |
| Niranjan       |
| Nirmal         |
| Nishit         |
| Niteen         |
| Nitsan         |
| Nobuyoshi      |
| Noritoshi      |
| Oddvar         |
| Odinaldo       |
| Odoardo        |
| Odysseas       |
| Oguz           |
| Ohad           |
| Oksana         |
| Oldrich        |
| Olivera        |
| Ortrud         |
| Ortrun         |
| Oscal          |
| Oscar          |
| Otilia         |
| Otmar          |
| Ottavia        |
| Owen           |
| Paddy          |
| Padma          |
| Palash         |
| Paloma         |
| Panayotis      |
| Pantung        |
| Paraskevi      |
| Paris          |
| Parke          |
| Parto          |
| Parviz         |
| Pascal         |
| Pasqua         |
| Patricia       |
| Patricio       |
| Peer           |
| Percy          |
| Perla          |
| Perry          |
| Persi          |
| Peternela      |
| Petter         |
| Phillip        |
| Phule          |
| Phuoc          |
| Pintsang       |
| Piyawadee      |
| Piyush         |
| Pohua          |
| Poorav         |
| Poornachandra  |
| Pradeep        |
| Pragnesh       |
| Pramod         |
| Pranas         |
| Pranav         |
| Pranay         |
| Pranjal        |
| Prasadram      |
| Premal         |
| Premsyl        |
| Prodip         |
| Przemyslawa    |
| Qingxiang      |
| Qiwen          |
| Quingbo        |
| Qunsheng       |
| Radhakrishnan  |
| Radhia         |
| Radhika        |
| Radoslaw       |
| Rafael         |
| Rafail         |
| Rafols         |
| Raimond        |
| Rajmohan       |
| Ramachenga     |
| Ramalingam     |
| Ramya          |
| Ramzi          |
| Ranan          |
| Rance          |
| Randi          |
| Randy          |
| Ranga          |
| Rasiah         |
| Rasikan        |
| Ravishankar    |
| Rayond         |
| Reinhard       |
| Reinhold       |
| Remco          |
| Remko          |
| Remmert        |
| Remzi          |
| Renee          |
| Renny          |
| Reuven         |
| Richara        |
| Richard        |
| Rildo          |
| Rimli          |
| Rimon          |
| Roddy          |
| Roded          |
| Ronghao        |
| Ronnie         |
| Rosalie        |
| Rosalyn        |
| Rosella        |
| Roselyn        |
| Rosine         |
| Rosita         |
| Rosli          |
| Rutger         |
| Sachar         |
| Sachem         |
| Sachin         |
| Sachio         |
| Saddek         |
| Sadegh         |
| Sadok          |
| Sadun          |
| Saeed          |
| Saeko          |
| Sahrah         |
| Sailaja        |
| Sajjad         |
| Sajjan         |
| Sakthirel      |
| Salvador       |
| Sampalli       |
| Samphel        |
| Sandeepan      |
| Sangeeta       |
| Saniya         |
| Sanjai         |
| Sanjay         |
| Sanjeeva       |
| Sanjit         |
| Sanjiv         |
| Sanjoy         |
| Sariel         |
| Sarita         |
| Sasan          |
| Sashi          |
| Sastry         |
| Satoru         |
| Satosi         |
| Satyanarayana  |
| Sedat          |
| Selwyn         |
| Seongbae       |
| Seongbin       |
| Serap          |
| Serenella      |
| Serge          |
| Sergi          |
| Serif          |
| Seshu          |
| Shahab         |
| Shahaf         |
| Shahar         |
| Shahid         |
| Shai           |
| Shaibal        |
| Shakhar        |
| Shaleah        |
| Shalesh        |
| Sham           |
| Shan           |
| Shao           |
| Shaowei        |
| Shaowen        |
| Shaunak        |
| Shaw           |
| Shawna         |
| Shay           |
| Shaz           |
| Shem           |
| Shen           |
| Shichao        |
| Shietung       |
| Shigeaki       |
| Shigehiro      |
| Shigehito      |
| Shigeichiro    |
| Shigenori      |
| Shigeo         |
| Shigeu         |
| Shih           |
| Shim           |
| Shimshon       |
| Shin           |
| Shir           |
| Shirish        |
| Shiv           |
| Shmuel         |
| Shooichi       |
| Shounak        |
| Shridhar       |
| Shrikanth      |
| Shugo          |
| Shuho          |
| Shuichi        |
| Shuji          |
| Shuky          |
| Shunichi       |
| Shushma        |
| Shuzo          |
| Siamak         |
| Sibyl          |
| Siddarth       |
| Sigeru         |
| Sivanarayana   |
| Slavian        |
| Snehasis       |
| Soenke         |
| Somnath        |
| Sorina         |
| Souichi        |
| Spyrose        |
| Sreekrishna    |
| Sreenivas      |
| Srinidhi       |
| Stabislas      |
| Stafford       |
| Stamatina      |
| Steen          |
| Stein          |
| Stella         |
| Stepehn        |
| Steve          |
| Stevo          |
| Subbu          |
| Subhada        |
| Subhankar      |
| Subhash        |
| Subhrajyoti    |
| Subir          |
| Sudhanshu      |
| Sudharsan      |
| Suebskul       |
| Sugwoo         |
| Sukumar        |
| Sumali         |
| Sumant         |
| Sungwon        |
| Supot          |
| Surveyors      |
| Susanna        |
| Susanne        |
| Susanta        |
| Sushant        |
| Susuma         |
| Susumu         |
| Suvo           |
| Suzette        |
| Sven           |
| Sverrir        |
| Syozo          |
| Szabolcs       |
| Tadahiko       |
| Tadahiro       |
| Tadanori       |
| Taegyun        |
| Taiji          |
| Taisook        |
| Taizo          |
| Takahira       |
| Takahiro       |
| Takahito       |
| Takanari       |
| Takushi        |
| Tamiya         |
| Tayeb          |
| Teiji          |
| Temple         |
| Terresa        |
| Teruyuki       |
| Tesuro         |
| Tesuya         |
| Tetsurou       |
| Tetsushi       |
| Teunis         |
| Thanasis       |
| Theirry        |
| Theron         |
| Thodoros       |
| Tianruo        |
| Tiina          |
| Tokuyasu       |
| Tommaso        |
| Tomofumi       |
| Tomokazu       |
| Tomoyuki       |
| Toney          |
| Tonia          |
| Tonny          |
| Toong          |
| Tooru          |
| Torsten        |
| Toshiki        |
| Toshiko        |
| Toshimi        |
| Toshimitsu     |
| Toshimo        |
| Toshimori      |
| Tran           |
| Tremaine       |
| Tristan        |
| Troy           |
| Tru            |
| True           |
| Trygve         |
| Tse            |
| Tsuneo         |
| Tsutomu        |
| Tsvetan        |
| Tsz            |
| Tua            |
| Turgut         |
| Tuval          |
| Tze            |
| Tzu            |
| Tzvetan        |
| Udaiprakash    |
| Udi            |
| Udo            |
| Ugo            |
| Uinam          |
| Ulf            |
| Uli            |
| Ulises         |
| Ult            |
| Uma            |
| Unal           |
| Ung            |
| Uno            |
| Uri            |
| Uriel          |
| Urs            |
| Uta            |
| Ute            |
| Utpal          |
| Utz            |
| Uwe            |
| Uzi            |
| Val            |
| Valdiodio      |
| Valeri         |
| Valery         |
| Valeska        |
| Valter         |
| Van            |
| Vasilii        |
| Vasilis        |
| Vasiliy        |
| Vatsa          |
| Venkatesan     |
| Vesna          |
| Vidar          |
| Vidya          |
| Vincent        |
| Vishu          |
| Vishv          |
| Vishwani       |
| Visit          |
| Vitali         |
| Vitaly         |
| Vivian         |
| Vojin          |
| Volkmar        |
| Vugranam       |
| Waiman         |
| Wanqing        |
| Wayne          |
| Weicheng       |
| Weidon         |
| Weijing        |
| Weiru          |
| Weiwu          |
| Weiye          |
| Weiyi          |
| Werner         |
| Willard        |
| Wilmer         |
| Wojceich       |
| Wonhee         |
| Woody          |
| Wuxu           |
| Xiadong        |
| Xiahua         |
| Xianlong       |
| Xiaobin        |
| Xiaocheng      |
| Xiaoheng       |
| Xiaopeng       |
| Xiaoqiang      |
| Xiaoqiu        |
| Xiaoshan       |
| Xinan          |
| Xinglin        |
| Xinyu          |
| Xiong          |
| Xiping         |
| Xudong         |
| Xuedong        |
| Xuejia         |
| Xuejun         |
| Xumin          |
| Yaghout        |
| Yagil          |
| Yahiko         |
| Yakichi        |
| Yakkov         |
| Yannik         |
| Yannis         |
| Yechezkel      |
| Yechiam        |
| Yefim          |
| Yifei          |
| Yinghua        |
| Yinlin         |
| Yishai         |
| Yishay         |
| Ymte           |
| Yolla          |
| Yongdong       |
| Yonghoan       |
| Yonghong       |
| Yongmao        |
| Yongmin        |
| Yongqiao       |
| Yoshimitsu     |
| Yoshinari      |
| Youjian        |
| Youngkon       |
| Younwoo        |
| Youpyo         |
| Youssef        |
| Yucai          |
| Yucel          |
| Yuchang        |
| Yuguang        |
| Yuichiro       |
| Yunming        |
| Yuping         |
| Yuqun          |
| Yurii          |
| Yurij          |
| Yuriy          |
| Yuuichi        |
| Zdislav        |
| Zejun          |
| Zeljko         |
| Zengping       |
| Zeydy          |
| Zhanqiu        |
| Zhaofang       |
| Zhenbing       |
| Zhenhua        |
| Zhensheng      |
| Zhigen         |
| Zhiguo         |
| Zhilian        |
| Zhiwei         |
| Zhonghua       |
| Zhonghui       |
| Zhongwei       |
| Zijian         |
| Zine           |
| Zissis         |
| Zita           |
| Zito           |
| Ziva           |
| Ziya           |
| Ziyad          |
| Zongyan        |
| Zorica         |
| Zsolt          |
| Zvonko         |
+----------------+
1275 rows in set (0.29 sec) */

SELECT COUNT(DISTINCT `first_name`)
FROM `employees`;
/*
+------------------------------+
| COUNT(DISTINCT `first_name`) |
+------------------------------+
|                         1275 |
+------------------------------+
1 row in set (0.23 sec) */

#         GROUP BY  - Guruhlash
# GROUP BY - ko'proq SUM(), AVG(), MAX(), MIN() va COUNT() funksiyalari bilan ishlatiladi.
SELECT `first_name` -- first_name ustuni tanlanib
FROM `employees` -- employees jadvalidan
GROUP BY `first_name` -- ismi bo'yicha guruhlansin
ORDER BY `first_name`;
/* natija:
+----------------+
| first_name     |
+----------------+
| Aamer          |
| Aamod          |
| Abdelaziz      |
| Abdelghani     |
| Abdelkader     |
| Abdelwaheb     |
| Abdulah        |
| Abdulla        |
| Achilleas      |
| Adam           |
| Adamantios     |
| Adas           |
| Adel           |
| Adhemar        |
| Adib           |
| Adil           |
| Adin           |
| Adit           |
| Adly           |
| Aemilian       |
| Aiichiro       |
| Aiman          |
| Aimee          |
| Akeel          |
| Akemi          |
| Akeno          |
| Akhilish       |
| Aksel          |
| Alagu          |
| Alain          |
| Alair          |
| Alassane       |
| Alejandra      |
| Alejandro      |
| Aleksandar     |
| Aleksander     |
| Alenka         |
| Alexius        |
| Almudena       |
| Alois          |
| Aloke          |
| Along          |
| Aloys          |
| Alper          |
| Alselm         |
| Aluzio         |
| Amabile        |
| Amalendu       |
| Amstein        |
| Anestis        |
| Angel          |
| Angus          |
| Anneke         |
| Anneli         |
| Annemarie      |
| Anoosh         |
| Anwar          |
| Anyuan         |
| Apostol        |
| Aral           |
| Aram           |
| Aran           |
| Arch           |
| Arco           |
| Arfst          |
| Aria           |
| Arie           |
| Arif           |
| Aris           |
| Arlette        |
| Armond         |
| Arnd           |
| Arne           |
| Arno           |
| Arnould        |
| Aron           |
| Arra           |
| Arto           |
| Arumugam       |
| Arun           |
| Aruna          |
| Arunachalam    |
| Arunas         |
| Arup           |
| Arve           |
| Arvin          |
| Arvind         |
| Ashish         |
| Atilio         |
| Atreye         |
| Atreyi         |
| Augustine      |
| Avishai        |
| Ayakannu       |
| Ayonca         |
| Babette        |
| Bader          |
| Badri          |
| Bangqing       |
| Baocai         |
| Baoqiu         |
| Barna          |
| Barry          |
| Bartek         |
| Barton         |
| Baruch         |
| Barun          |
| Basant         |
| Basem          |
| Basil          |
| Basim          |
| Baziley        |
| Becky          |
| Bedir          |
| Bedrich        |
| Behnaam        |
| Berhard        |
| Berna          |
| Bernardo       |
| Bernd          |
| Berni          |
| Bernice        |
| Bernt          |
| Berry          |
| Berthier       |
| Berto          |
| Beshir         |
| Bezalel        |
| Bikash         |
| Bilhanan       |
| Billie         |
| Billur         |
| Bingning       |
| Bluma          |
| Boalin         |
| Boaz           |
| Bodh           |
| Bodo           |
| Bogdan         |
| Boguslaw       |
| Bojan          |
| Bokyung        |
| Boriana        |
| Bouchung       |
| Boutros        |
| Bowen          |
| Branimir       |
| Breannda       |
| Brendon        |
| Brewster       |
| Brigham        |
| Byong          |
| Candida        |
| Candido        |
| Caolyn         |
| Carrsten       |
| Cathie         |
| Cedric         |
| Chaitali       |
| Chandrasekaran |
| Changho        |
| Chanjung       |
| Chaosheng      |
| Chaoyi         |
| Charlene       |
| Charmane       |
| Chenxi         |
| Chenye         |
| Chenyi         |
| Cheong         |
| Chikako        |
| Chikara        |
| Chinho         |
| Chinhyun       |
| Chinya         |
| Chiradeep      |
| Chiranjit      |
| Chirstian      |
| Chrisa         |
| Chriss         |
| Christ         |
| Christfried    |
| Christoper     |
| Christoph      |
| Christophe     |
| Chuanti        |
| Chuanyi        |
| Claude         |
| Claudi         |
| Clyde          |
| Collette       |
| Conal          |
| Conor          |
| Conrado        |
| Constantijn    |
| Constantine    |
| Constantino    |
| Cordelia       |
| Cristinel      |
| Cullen         |
| DAIDA          |
| Danae          |
| Danai          |
| Danco          |
| Danel          |
| Danil          |
| Danny          |
| Dannz          |
| Dante          |
| Dayanand       |
| Debaprosad     |
| Debatosh       |
| Deborah        |
| DeForest       |
| Dekang         |
| Demin          |
| Demos          |
| Denis          |
| Deniz          |
| Denny          |
| Dharmaraja     |
| Dhritiman      |
| Diederik       |
| Dietrich       |
| Dinah          |
| Dines          |
| Dinkar         |
| Dipankar       |
| Dipayan        |
| Divier         |
| Divine         |
| Djelloul       |
| Djenana        |
| Dmitri         |
| Dmitry         |
| Domenick       |
| Domenico       |
| Doohun         |
| Doowon         |
| Douadi         |
| Duangkaew      |
| Duke           |
| Dulce          |
| Dung           |
| Duri           |
| Duro           |
| Dzung          |
| Ebbe           |
| Eben           |
| Eberhardt      |
| Ebru           |
| Eckart         |
| Edwin          |
| Eirik          |
| Eishiro        |
| Ekawit         |
| Eldridge       |
| Elgin          |
| Elliott        |
| Elrique        |
| Elvia          |
| Elvis          |
| Elzbieta       |
| Emdad          |
| Emran          |
| Ennio          |
| Eran           |
| Erez           |
| Eric           |
| Erzsebet       |
| Etsuo          |
| Evgueni        |
| Ewing          |
| Fabrizio       |
| Fai            |
| Faiza          |
| Falguni        |
| Fan            |
| Fatemeh        |
| Fay            |
| Fayez          |
| Fei            |
| Feipei         |
| Feixiong       |
| Feiyu          |
| Felicidad      |
| Fen            |
| Ferdinand      |
| Filipe         |
| Filipp         |
| Flemming       |
| Florian        |
| Florina        |
| Foong          |
| Fox            |
| Francesca      |
| Francoise      |
| Franziska      |
| Frazer         |
| Frederique     |
| Freyja         |
| Froduald       |
| Fumiko         |
| Fumino         |
| Fumitaka       |
| Fumitake       |
| Fumiya         |
| Fumiyo         |
| Fun            |
| Fuqing         |
| Fusako         |
| Gad            |
| Gadiel         |
| Gaetan         |
| Gal            |
| Gao            |
| Garnet         |
| Garnik         |
| Gaurav         |
| Gay            |
| Gen            |
| Genevieve      |
| Genki          |
| Gennadi        |
| Gennady        |
| Genta          |
| Geoff          |
| Geoffrey       |
| Geoffry        |
| Georg          |
| George         |
| Georgi         |
| Georgy         |
| Ger            |
| Geraldo        |
| Gererd         |
| Ghassan        |
| Gian           |
| Gianluca       |
| Giao           |
| Giap           |
| Gift           |
| Gil            |
| Gila           |
| Gilbert        |
| Gill           |
| Gina           |
| Gino           |
| Gio            |
| Giordano       |
| Giri           |
| Girolamo       |
| Gita           |
| Gladys         |
| Goa            |
| Godehard       |
| Goetz          |
| Goh            |
| Golgen         |
| Goncalo        |
| Gonzalo        |
| Goo            |
| Gopalakrishnan |
| Gor            |
| Gou            |
| Greger         |
| Gregory        |
| Gretta         |
| Gritta         |
| Gro            |
| Guadalupe      |
| Guangming      |
| Gudjon         |
| Guenter        |
| Guiseppe       |
| Gully          |
| Gunilla        |
| Guoxiang       |
| Guozhong       |
| Gurbir         |
| Guther         |
| Guttorm        |
| Hailing        |
| Hairong        |
| Haldon         |
| Haldun         |
| Halsur         |
| Harjit         |
| Harngdar       |
| Hatem          |
| Hatim          |
| Hatsukazu      |
| Hauke          |
| Hausi          |
| Heather        |
| Heejo          |
| Heeju          |
| Heekeun        |
| Hein           |
| Heng           |
| Henk           |
| Heon           |
| Heping         |
| Herb           |
| Herbert        |
| Hercules       |
| Hidde          |
| Hidefumi       |
| Hidekazu       |
| Hideo          |
| Hideyuki       |
| Hilari         |
| Hilary         |
| Hinrich        |
| Hirochika      |
| Hironobu       |
| Hironoby       |
| Hiroyasu       |
| Hisao          |
| Hitofumi       |
| Hitomi         |
| Holgard        |
| Honesty        |
| Honglan        |
| Hongzhu        |
| Hongzue        |
| Horward        |
| Houman         |
| Howell         |
| Hsiangchu      |
| Huai           |
| Huan           |
| Huei           |
| Hugh           |
| Hugo           |
| Huican         |
| Huiqun         |
| Hyuckchul      |
| Hyuncheol      |
| Iara           |
| Ibibia         |
| Idoia          |
| IEEE           |
| Inderjeet      |
| Indrajit       |
| Ingemar        |
| Ingmar         |
| Insup          |
| Ioana          |
| Ipke           |
| Irena          |
| Irene          |
| Isaac          |
| Isamu          |
| Ishfaq         |
| Itzchak        |
| Izaskun        |
| Jaana          |
| Jaber          |
| Jackson        |
| Jacopo         |
| Jacqueline     |
| Jaewon         |
| Jaewoo         |
| Jagoda         |
| Jahangir       |
| Jaideep        |
| Jaihie         |
| Jamaludin      |
| Janalee        |
| Janche         |
| Jaques         |
| Jaroslava      |
| Jasminko       |
| Jayesh         |
| Jayson         |
| Jeane          |
| Jeanna         |
| Jeanne         |
| Jenwei         |
| Jeong          |
| Jessie         |
| Jiafu          |
| Jiakeng        |
| Jiang          |
| Jianhao        |
| Jianhua        |
| Jianhui        |
| Jiann          |
| Jianwen        |
| Jingling       |
| Jinpo          |
| Jinxi          |
| Jinya          |
| Jiong          |
| Jixiang        |
| JiYoung        |
| JoAnna         |
| JoAnne         |
| Jolita         |
| Jongsuk        |
| Jordanka       |
| Josyula        |
| Jouko          |
| Jouni          |
| Jovan          |
| Joydip         |
| Juichirou      |
| Jungsoon       |
| Junichi        |
| Junsik         |
| Juyoung        |
| Kagan          |
| Kaijung        |
| Kamakshi       |
| Kamran         |
| Kankanahalli   |
| Kannan         |
| Karlis         |
| Karoline       |
| Karsten        |
| Kasidit        |
| Kasturi        |
| Katsuo         |
| Katsuyuki      |
| Kauko          |
| KayLiang       |
| Kayoko         |
| Kazuhide       |
| Kazuhiko       |
| Kazuhira       |
| Kazuhiro       |
| Kazuhisa       |
| Kazuhito       |
| Kazunori       |
| Kazuyasu       |
| Keiichiro      |
| Kellie         |
| Kellyn         |
| Kendra         |
| Kenroku        |
| Kensei         |
| Kensyu         |
| Kenton         |
| Kerhong        |
| Kerryn         |
| Kersti         |
| Keung          |
| Khaled         |
| Khalid         |
| Khalil         |
| Khatoun        |
| Khedija        |
| Khoa           |
| Khosrow        |
| Khue           |
| Khun           |
| Kiam           |
| Kien           |
| King           |
| Kinh           |
| Kirk           |
| Kish           |
| Kitty          |
| Kiyokazu       |
| Kiyomitsu      |
| Kiyotoshi      |
| Koichi         |
| Kokou          |
| Kolar          |
| Koldo          |
| Kotesh         |
| Kousuke        |
| Krassimir      |
| Krisda         |
| Kristen        |
| Krister        |
| Kristian       |
| Kristin        |
| Kristina       |
| Kristine       |
| Kristinn       |
| Kristof        |
| Kshitij        |
| Kwan           |
| Kwangho        |
| Kwangjo        |
| Kwangsub       |
| Kwangyoen      |
| Kwee           |
| Kwok           |
| Kwun           |
| Kyoichi        |
| Lakshmi        |
| Lalit          |
| Lansing        |
| Larisa         |
| Laurentiu      |
| Leaf           |
| Leah           |
| Leandro        |
| Lech           |
| Leen           |
| Leif           |
| Lein           |
| Lena           |
| Lene           |
| Leni           |
| Lenore         |
| Leon           |
| Leszek         |
| Leucio         |
| Licheng        |
| Lidong         |
| Lihong         |
| Lijia          |
| Lijie          |
| Lillian        |
| LiMin          |
| Limsoon        |
| Lobel          |
| Lokesh         |
| Lorien         |
| Lubomir        |
| Lucian         |
| Lucien         |
| Luerbio        |
| Luigi          |
| Luisa          |
| Luise          |
| Lunjin         |
| Mabhin         |
| Mabo           |
| Mabry          |
| Macha          |
| Mack           |
| Mads           |
| Magdalena      |
| Magy           |
| Maha           |
| Mahendra       |
| Mahmut         |
| Maia           |
| Maik           |
| Maja           |
| Makato         |
| Make           |
| Malu           |
| Mamdouh        |
| Mana           |
| Mandell        |
| Mang           |
| Mani           |
| Manibrata      |
| Manohar        |
| Mansur         |
| Mantis         |
| Manton         |
| Manu           |
| Mara           |
| Marc           |
| Marco          |
| Marek          |
| Maren          |
| Margareta      |
| Margo          |
| Mari           |
| Maria          |
| Mariangiola    |
| Marie          |
| Marin          |
| Mario          |
| Maris          |
| Marit          |
| Mariusz        |
| Marjo          |
| Mark           |
| Marke          |
| Marko          |
| Marl           |
| Marla          |
| Marlo          |
| Marsal         |
| Marsha         |
| Marsja         |
| Mart           |
| Martial        |
| Martien        |
| Martijn        |
| Martina        |
| Martine        |
| Martins        |
| Mary           |
| Masadi         |
| Masaki         |
| Masako         |
| Masali         |
| Masami         |
| Masamitsu      |
| Masanao        |
| Masaru         |
| Masasuke       |
| Masato         |
| Masoud         |
| Matk           |
| Mats           |
| Matt           |
| Maya           |
| Mayuko         |
| Mayumi         |
| Mayuri         |
| Mechthild      |
| Menkae         |
| Michaela       |
| Mihalis        |
| Mikhail        |
| Mingdong       |
| Minghong       |
| Mingsen        |
| Mingzeng       |
| Miomir         |
| Miquel         |
| Mircea         |
| Mitchel        |
| Mitsuyuki      |
| Miyeon         |
| Mizuhito       |
| Mohamadou      |
| Mohammad       |
| Mohammed       |
| Mohan          |
| Mohd           |
| Moheb          |
| Mohit          |
| Mohua          |
| Moie           |
| Mokhtar        |
| Mona           |
| Mong           |
| Moni           |
| Monique        |
| Mooi           |
| Moon           |
| Mori           |
| Moriyoshi      |
| Morrie         |
| Morris         |
| Moss           |
| Mostafa        |
| Moti           |
| Moto           |
| Mototsugu      |
| Moty           |
| Mountaz        |
| Mrinalini      |
| Munehiko       |
| Munehiro       |
| Munenori       |
| Muneo          |
| Munir          |
| Murthy         |
| Muzhong        |
| Nadjib         |
| Naftali        |
| Naftaly        |
| Nagui          |
| Nahid          |
| Nahla          |
| Nahum          |
| Nakhoon        |
| Nalini         |
| Naraig         |
| Narain         |
| Nathalie       |
| Nathan         |
| Navid          |
| Navin          |
| Nechama        |
| Nectarios      |
| Neelam         |
| Neven          |
| Nevin          |
| Nevio          |
| Niclas         |
| Nidapan        |
| Nigel          |
| Nikolaos       |
| Nikolaus       |
| Nimmagadda     |
| Niranjan       |
| Nirmal         |
| Nishit         |
| Niteen         |
| Nitsan         |
| Nobuyoshi      |
| Noritoshi      |
| Oddvar         |
| Odinaldo       |
| Odoardo        |
| Odysseas       |
| Oguz           |
| Ohad           |
| Oksana         |
| Oldrich        |
| Olivera        |
| Ortrud         |
| Ortrun         |
| Oscal          |
| Oscar          |
| Otilia         |
| Otmar          |
| Ottavia        |
| Owen           |
| Paddy          |
| Padma          |
| Palash         |
| Paloma         |
| Panayotis      |
| Pantung        |
| Paraskevi      |
| Paris          |
| Parke          |
| Parto          |
| Parviz         |
| Pascal         |
| Pasqua         |
| Patricia       |
| Patricio       |
| Peer           |
| Percy          |
| Perla          |
| Perry          |
| Persi          |
| Peternela      |
| Petter         |
| Phillip        |
| Phule          |
| Phuoc          |
| Pintsang       |
| Piyawadee      |
| Piyush         |
| Pohua          |
| Poorav         |
| Poornachandra  |
| Pradeep        |
| Pragnesh       |
| Pramod         |
| Pranas         |
| Pranav         |
| Pranay         |
| Pranjal        |
| Prasadram      |
| Premal         |
| Premsyl        |
| Prodip         |
| Przemyslawa    |
| Qingxiang      |
| Qiwen          |
| Quingbo        |
| Qunsheng       |
| Radhakrishnan  |
| Radhia         |
| Radhika        |
| Radoslaw       |
| Rafael         |
| Rafail         |
| Rafols         |
| Raimond        |
| Rajmohan       |
| Ramachenga     |
| Ramalingam     |
| Ramya          |
| Ramzi          |
| Ranan          |
| Rance          |
| Randi          |
| Randy          |
| Ranga          |
| Rasiah         |
| Rasikan        |
| Ravishankar    |
| Rayond         |
| Reinhard       |
| Reinhold       |
| Remco          |
| Remko          |
| Remmert        |
| Remzi          |
| Renee          |
| Renny          |
| Reuven         |
| Richara        |
| Richard        |
| Rildo          |
| Rimli          |
| Rimon          |
| Roddy          |
| Roded          |
| Ronghao        |
| Ronnie         |
| Rosalie        |
| Rosalyn        |
| Rosella        |
| Roselyn        |
| Rosine         |
| Rosita         |
| Rosli          |
| Rutger         |
| Sachar         |
| Sachem         |
| Sachin         |
| Sachio         |
| Saddek         |
| Sadegh         |
| Sadok          |
| Sadun          |
| Saeed          |
| Saeko          |
| Sahrah         |
| Sailaja        |
| Sajjad         |
| Sajjan         |
| Sakthirel      |
| Salvador       |
| Sampalli       |
| Samphel        |
| Sandeepan      |
| Sangeeta       |
| Saniya         |
| Sanjai         |
| Sanjay         |
| Sanjeeva       |
| Sanjit         |
| Sanjiv         |
| Sanjoy         |
| Sariel         |
| Sarita         |
| Sasan          |
| Sashi          |
| Sastry         |
| Satoru         |
| Satosi         |
| Satyanarayana  |
| Sedat          |
| Selwyn         |
| Seongbae       |
| Seongbin       |
| Serap          |
| Serenella      |
| Serge          |
| Sergi          |
| Serif          |
| Seshu          |
| Shahab         |
| Shahaf         |
| Shahar         |
| Shahid         |
| Shai           |
| Shaibal        |
| Shakhar        |
| Shaleah        |
| Shalesh        |
| Sham           |
| Shan           |
| Shao           |
| Shaowei        |
| Shaowen        |
| Shaunak        |
| Shaw           |
| Shawna         |
| Shay           |
| Shaz           |
| Shem           |
| Shen           |
| Shichao        |
| Shietung       |
| Shigeaki       |
| Shigehiro      |
| Shigehito      |
| Shigeichiro    |
| Shigenori      |
| Shigeo         |
| Shigeu         |
| Shih           |
| Shim           |
| Shimshon       |
| Shin           |
| Shir           |
| Shirish        |
| Shiv           |
| Shmuel         |
| Shooichi       |
| Shounak        |
| Shridhar       |
| Shrikanth      |
| Shugo          |
| Shuho          |
| Shuichi        |
| Shuji          |
| Shuky          |
| Shunichi       |
| Shushma        |
| Shuzo          |
| Siamak         |
| Sibyl          |
| Siddarth       |
| Sigeru         |
| Sivanarayana   |
| Slavian        |
| Snehasis       |
| Soenke         |
| Somnath        |
| Sorina         |
| Souichi        |
| Spyrose        |
| Sreekrishna    |
| Sreenivas      |
| Srinidhi       |
| Stabislas      |
| Stafford       |
| Stamatina      |
| Steen          |
| Stein          |
| Stella         |
| Stepehn        |
| Steve          |
| Stevo          |
| Subbu          |
| Subhada        |
| Subhankar      |
| Subhash        |
| Subhrajyoti    |
| Subir          |
| Sudhanshu      |
| Sudharsan      |
| Suebskul       |
| Sugwoo         |
| Sukumar        |
| Sumali         |
| Sumant         |
| Sungwon        |
| Supot          |
| Surveyors      |
| Susanna        |
| Susanne        |
| Susanta        |
| Sushant        |
| Susuma         |
| Susumu         |
| Suvo           |
| Suzette        |
| Sven           |
| Sverrir        |
| Syozo          |
| Szabolcs       |
| Tadahiko       |
| Tadahiro       |
| Tadanori       |
| Taegyun        |
| Taiji          |
| Taisook        |
| Taizo          |
| Takahira       |
| Takahiro       |
| Takahito       |
| Takanari       |
| Takushi        |
| Tamiya         |
| Tayeb          |
| Teiji          |
| Temple         |
| Terresa        |
| Teruyuki       |
| Tesuro         |
| Tesuya         |
| Tetsurou       |
| Tetsushi       |
| Teunis         |
| Thanasis       |
| Theirry        |
| Theron         |
| Thodoros       |
| Tianruo        |
| Tiina          |
| Tokuyasu       |
| Tommaso        |
| Tomofumi       |
| Tomokazu       |
| Tomoyuki       |
| Toney          |
| Tonia          |
| Tonny          |
| Toong          |
| Tooru          |
| Torsten        |
| Toshiki        |
| Toshiko        |
| Toshimi        |
| Toshimitsu     |
| Toshimo        |
| Toshimori      |
| Tran           |
| Tremaine       |
| Tristan        |
| Troy           |
| Tru            |
| True           |
| Trygve         |
| Tse            |
| Tsuneo         |
| Tsutomu        |
| Tsvetan        |
| Tsz            |
| Tua            |
| Turgut         |
| Tuval          |
| Tze            |
| Tzu            |
| Tzvetan        |
| Udaiprakash    |
| Udi            |
| Udo            |
| Ugo            |
| Uinam          |
| Ulf            |
| Uli            |
| Ulises         |
| Ult            |
| Uma            |
| Unal           |
| Ung            |
| Uno            |
| Uri            |
| Uriel          |
| Urs            |
| Uta            |
| Ute            |
| Utpal          |
| Utz            |
| Uwe            |
| Uzi            |
| Val            |
| Valdiodio      |
| Valeri         |
| Valery         |
| Valeska        |
| Valter         |
| Van            |
| Vasilii        |
| Vasilis        |
| Vasiliy        |
| Vatsa          |
| Venkatesan     |
| Vesna          |
| Vidar          |
| Vidya          |
| Vincent        |
| Vishu          |
| Vishv          |
| Vishwani       |
| Visit          |
| Vitali         |
| Vitaly         |
| Vivian         |
| Vojin          |
| Volkmar        |
| Vugranam       |
| Waiman         |
| Wanqing        |
| Wayne          |
| Weicheng       |
| Weidon         |
| Weijing        |
| Weiru          |
| Weiwu          |
| Weiye          |
| Weiyi          |
| Werner         |
| Willard        |
| Wilmer         |
| Wojceich       |
| Wonhee         |
| Woody          |
| Wuxu           |
| Xiadong        |
| Xiahua         |
| Xianlong       |
| Xiaobin        |
| Xiaocheng      |
| Xiaoheng       |
| Xiaopeng       |
| Xiaoqiang      |
| Xiaoqiu        |
| Xiaoshan       |
| Xinan          |
| Xinglin        |
| Xinyu          |
| Xiong          |
| Xiping         |
| Xudong         |
| Xuedong        |
| Xuejia         |
| Xuejun         |
| Xumin          |
| Yaghout        |
| Yagil          |
| Yahiko         |
| Yakichi        |
| Yakkov         |
| Yannik         |
| Yannis         |
| Yechezkel      |
| Yechiam        |
| Yefim          |
| Yifei          |
| Yinghua        |
| Yinlin         |
| Yishai         |
| Yishay         |
| Ymte           |
| Yolla          |
| Yongdong       |
| Yonghoan       |
| Yonghong       |
| Yongmao        |
| Yongmin        |
| Yongqiao       |
| Yoshimitsu     |
| Yoshinari      |
| Youjian        |
| Youngkon       |
| Younwoo        |
| Youpyo         |
| Youssef        |
| Yucai          |
| Yucel          |
| Yuchang        |
| Yuguang        |
| Yuichiro       |
| Yunming        |
| Yuping         |
| Yuqun          |
| Yurii          |
| Yurij          |
| Yuriy          |
| Yuuichi        |
| Zdislav        |
| Zejun          |
| Zeljko         |
| Zengping       |
| Zeydy          |
| Zhanqiu        |
| Zhaofang       |
| Zhenbing       |
| Zhenhua        |
| Zhensheng      |
| Zhigen         |
| Zhiguo         |
| Zhilian        |
| Zhiwei         |
| Zhonghua       |
| Zhonghui       |
| Zhongwei       |
| Zijian         |
| Zine           |
| Zissis         |
| Zita           |
| Zito           |
| Ziva           |
| Ziya           |
| Ziyad          |
| Zongyan        |
| Zorica         |
| Zsolt          |
| Zvonko         |
+----------------+
1275 rows in set (0.25 sec) */

#       O'rtacha oylikni AVG() hisoblaganda GROUP BY dan foydalanish
SELECT `emp_no`      AS 'Hodim ID',     -- emp_no ustuniga oid har bir  ( 3 )
       AVG(`salary`) AS 'Ortacha oylik' -- salary ustunlari o'rtachasini shu nomda chiqarsin ( 3 )
FROM `salaries` -- salaries jadvalidagi  ( 1 )
GROUP BY `Hodim ID` -- emp_no ustunini guruhlab ( 2 )
# ORDER BY `Ortacha oylik` DESC;   -- oylik ustunini kamayish tartibida saralasin ( 4 )
ORDER BY `Hodim ID`; -- hodim id  ustunini saralash ( 4 )

SELECT * -- Barcha ustunlarni tanlab ( 2 )
FROM `salaries` -- salaries jadvalidan ( 1 )
LIMIT 20; /*   -- 20 tasini ko'rsatish ( 3 )
+--------+--------+------------+------------+
| emp_no | salary | from_date  | to_date    |
+--------+--------+------------+------------+
|  10001 |  60117 | 1986-06-26 | 1987-06-26 |
|  10001 |  62102 | 1987-06-26 | 1988-06-25 |
|  10001 |  66074 | 1988-06-25 | 1989-06-25 |
|  10001 |  66596 | 1989-06-25 | 1990-06-25 |
|  10001 |  66961 | 1990-06-25 | 1991-06-25 |
|  10001 |  71046 | 1991-06-25 | 1992-06-24 |
|  10001 |  74333 | 1992-06-24 | 1993-06-24 |
|  10001 |  75286 | 1993-06-24 | 1994-06-24 |
|  10001 |  75994 | 1994-06-24 | 1995-06-24 |
|  10001 |  76884 | 1995-06-24 | 1996-06-23 |
|  10001 |  80013 | 1996-06-23 | 1997-06-23 |
|  10001 |  81025 | 1997-06-23 | 1998-06-23 |
|  10001 |  81097 | 1998-06-23 | 1999-06-23 |
|  10001 |  84917 | 1999-06-23 | 2000-06-22 |
|  10001 |  85112 | 2000-06-22 | 2001-06-22 |
|  10001 |  85097 | 2001-06-22 | 2002-06-22 |
|  10001 |  88958 | 2002-06-22 | 9999-01-01 |
|  10002 |  65828 | 1996-08-03 | 1997-08-03 |
|  10002 |  65909 | 1997-08-03 | 1998-08-03 |
|  10002 |  67534 | 1998-08-03 | 1999-08-03 |
+--------+--------+------------+------------+
20 rows in set (0.00 sec)   */

SELECT `emp_no`      AS 'Hodim ID',
       AVG(`salary`) AS 'Ortacha oylik'
FROM `salaries`
GROUP BY `Hodim ID`
ORDER BY `Hodim ID`
LIMIT 20;
/*
+----------+---------------+
| Hodim ID | Ortacha oylik |
+----------+---------------+
|    10001 |    75388.9412 |
|    10002 |    68854.5000 |
|    10003 |    43030.2857 |
|    10004 |    56512.2500 |
|    10005 |    87275.7692 |
|    10006 |    50514.9167 |
|    10007 |    70826.7143 |
|    10008 |    49307.6667 |
|    10009 |    78284.5556 |
|    10010 |    76723.0000 |
|    10011 |    49782.0000 |
|    10012 |    46902.8000 |
|    10013 |    52431.5882 |
|    10014 |    52990.3333 |
|    10015 |    40000.0000 |
|    10016 |    74995.4000 |
|    10017 |    87064.7000 |
|    10018 |    68640.0625 |
|    10019 |    47007.2500 |
|    10020 |    43278.2000 |
+----------+---------------+
20 rows in set (0.00 sec)   */

#         Hodimlarning MAX() - eng ko'p va MIN() - eng kam olgan oyliklarini chiqarish
# 20 ta hodimning (dastlabki, minimal) oyligi
SELECT DISTINCT `emp_no` AS `id`,
                `salary` AS 'oyligi'
FROM `salaries`
ORDER BY `emp_no`
LIMIT 20; /* natija:
+-------+--------+
| id    | oyligi |
+-------+--------+
| 10001 |  60117 |
| 10001 |  62102 |
| 10001 |  66074 |
| 10001 |  66596 |
| 10001 |  66961 |
| 10001 |  71046 |
| 10001 |  74333 |
| 10001 |  75286 |
| 10001 |  75994 |
| 10001 |  76884 |
| 10001 |  80013 |
| 10001 |  81025 |
| 10001 |  81097 |
| 10001 |  84917 |
| 10001 |  85112 |
| 10001 |  85097 |
| 10001 |  88958 |
| 10002 |  65828 |
| 10002 |  65909 |
| 10002 |  67534 |
+-------+--------+
20 rows in set (0.00 sec)             */

SELECT `emp_no`      AS 'id',            -- 3- 'emp_no' ustunini 'id' deb,
       MAX(`salary`) AS 'max oylik',     -- 4- har bir `emp_no` qatorlariga oid maximal `salary`ni 'max oylik' deb,
       AVG(`salary`) AS 'ortacha oylik', -- 5- har bir `emp_no` qatorlariga oid o'rtacha `salary`ni 'ortacha oylik' deb,
       MIN(`salary`) AS 'min oylik'      -- 6- va har bir `emp_no` qatorlariga oid minimal `salary`ni 'min oylik' deb
FROM `salaries` -- 1- salaries jadvalidagi
GROUP BY `emp_no` -- 2- emp_no ustunidagi bir xil elementlarni bir guruhga jamlab
ORDER BY `emp_no` -- 7- emp_no satrlarini tartiblab
LIMIT 20;
/* natija:             -- 8- 20 tasini chiqarsin
+-------+-----------+---------------+-----------+
| id    | max oylik | ortacha oylik | min oylik |
+-------+-----------+---------------+-----------+
| 10001 |     88958 |    75388.9412 |     60117 |
| 10002 |     72527 |    68854.5000 |     65828 |
| 10003 |     43699 |    43030.2857 |     40006 |
| 10004 |     74057 |    56512.2500 |     40054 |
| 10005 |     94692 |    87275.7692 |     78228 |
| 10006 |     60098 |    50514.9167 |     40000 |
| 10007 |     88070 |    70826.7143 |     56724 |
| 10008 |     52668 |    49307.6667 |     46671 |
| 10009 |     94443 |    78284.5556 |     60929 |
| 10010 |     80324 |    76723.0000 |     72488 |
| 10011 |     56753 |    49782.0000 |     42365 |
| 10012 |     54794 |    46902.8000 |     40000 |
| 10013 |     68901 |    52431.5882 |     40000 |
| 10014 |     60598 |    52990.3333 |     46168 |
| 10015 |     40000 |    40000.0000 |     40000 |
| 10016 |     77935 |    74995.4000 |     70889 |
| 10017 |     99651 |    87064.7000 |     71380 |
| 10018 |     84672 |    68640.0625 |     55881 |
| 10019 |     50032 |    47007.2500 |     44276 |
| 10020 |     47017 |    43278.2000 |     40000 |
+-------+-----------+---------------+-----------+
20 rows in set (0.00 sec)   */

#    Har bir hodimga necha marta oylik oshirilganini ko'rsatish
SELECT `emp_no` AS 'ID',
       COUNT(*) AS 'oyliklar oshirilish soni'
FROM `salaries`
GROUP BY `emp_no`
LIMIT 20;
/*
+-------+--------------------------+
| ID    | oyliklar oshirilish soni |
+-------+--------------------------+
| 10001 |                       17 |
| 10002 |                        6 |
| 10003 |                        7 |
| 10004 |                       16 |
| 10005 |                       13 |
| 10006 |                       12 |
| 10007 |                       14 |
| 10008 |                        3 |
| 10009 |                       18 |
| 10010 |                        6 |
| 10011 |                        7 |
| 10012 |                       10 |
| 10013 |                       17 |
| 10014 |                        9 |
| 10015 |                        1 |
| 10016 |                        5 |
| 10017 |                       10 |
| 10018 |                       16 |
| 10019 |                        4 |
| 10020 |                        5 |
+-------+--------------------------+
20 rows in set (0.00 sec)   */

#           HAVING - guruhlangan natijalarni filtrlash
# HAVING - GROUP BY ishlatilsagina ishlatsa bo'ladi.
SELECT `emp_no`      AS 'id',
       MAX(`salary`) AS '150 000 dan katta max oyliklar'
FROM `salaries`
GROUP BY `emp_no`
HAVING MAX(`salary`) > 150000;
/*
+--------+---------------------------------+
| id     | 150  000 dan katta max oyliklar |
+--------+---------------------------------+
|  43624 |                          158220 |
|  46439 |                          150345 |
|  47978 |                          155709 |
|  66793 |                          150052 |
|  80823 |                          154459 |
| 109334 |                          155377 |
| 205000 |                          153715 |
| 237542 |                          152687 |
| 238117 |                          152220 |
| 253939 |                          155513 |
| 254466 |                          156286 |
| 266526 |                          152710 |
| 276633 |                          152412 |
| 279776 |                          150740 |
| 493158 |                          154376 |
+--------+---------------------------------+
15 rows in set (2.18 sec)   */

# ROLLUP haqida qisqacha
USE `classicmodels`;

SELECT YEAR(`paymentDate`) AS `yil`,
       `customerNumber`    AS `cus`,
       SUM(`amount`)       AS `summa`
FROM `classicmodels`.`payments`
GROUP BY `cus`
       , `yil`
;
/* natija:
+------+-----+-----------+
| yil  | cus | summa     |
+------+-----+-----------+
| 2004 | 103 |   7742.92 |
| 2003 | 103 |  14571.44 |
| 2004 | 112 |  47539.00 |
| 2003 | 112 |  32641.98 |
| 2003 | 114 |  53429.11 |
| 2004 | 114 | 127155.96 |
| 2004 | 119 |  67426.01 |
| 2005 | 119 |  49523.67 |
| 2003 | 121 |  51710.33 |
| 2004 | 121 |  52514.46 |
| 2005 | 124 | 184842.63 |
| 2004 | 124 | 231562.53 |
| 2003 | 124 | 167783.08 |
| 2003 | 128 |  34650.82 |
| 2004 | 128 |  41286.94 |
| 2004 | 129 |  26248.78 |
| 2003 | 129 |  40461.78 |
| 2003 | 131 |  22292.62 |
| 2004 | 131 |  85347.32 |
| 2003 | 141 | 189840.15 |
| 2004 | 141 | 293765.51 |
| 2005 | 141 | 232133.32 |
| 2004 | 144 |  36005.71 |
| 2003 | 144 |   7674.94 |
| 2004 | 145 |  53487.29 |
| 2003 | 145 |  53959.21 |
| 2004 | 146 |  90593.25 |
| 2003 | 146 |  39712.10 |
| 2003 | 148 | 150123.15 |
| 2004 | 148 |   2611.84 |
| 2005 | 148 |   3516.04 |
| 2003 | 151 | 117634.88 |
| 2004 | 151 |  60279.07 |
| 2004 | 157 |  98509.25 |
| 2004 | 161 |   2434.25 |
| 2003 | 161 |  89418.78 |
| 2005 | 161 |  12692.19 |
| 2004 | 166 | 105420.57 |
| 2004 | 167 |  12538.01 |
| 2003 | 167 |  85024.46 |
| 2004 | 171 |  18997.89 |
| 2003 | 171 |  42783.81 |
| 2004 | 172 |  53170.38 |
| 2003 | 172 |  33383.14 |
| 2004 | 173 |  32198.69 |
| 2005 | 175 |  28500.78 |
| 2003 | 175 |  24879.08 |
| 2004 | 175 |  42044.77 |
| 2004 | 177 |  62361.22 |
| 2004 | 181 |  67002.86 |
| 2003 | 181 |   5494.78 |
| 2005 | 186 |  23602.90 |
| 2003 | 186 |  37602.48 |
| 2004 | 186 |  34341.08 |
| 2004 | 187 |  99984.40 |
| 2003 | 187 |  48425.69 |
| 2004 | 189 |  49898.27 |
| 2004 | 198 |  15517.30 |
| 2003 | 198 |   6036.96 |
| 2003 | 201 |  23908.24 |
| 2004 | 201 |  37258.94 |
| 2003 | 202 |  36527.61 |
| 2004 | 202 |  33594.58 |
| 2004 | 204 |  55577.26 |
| 2003 | 205 |  54222.70 |
| 2005 | 205 |  39580.60 |
| 2005 | 209 |  35157.75 |
| 2004 | 209 |  40701.57 |
| 2003 | 211 |  45480.79 |
| 2003 | 216 |  43575.26 |
| 2004 | 216 |  24945.21 |
| 2005 | 219 |   3452.75 |
| 2003 | 219 |   4465.85 |
| 2003 | 227 |  36164.46 |
| 2004 | 227 |  53745.34 |
| 2005 | 233 |  29070.38 |
| 2004 | 233 |  22997.45 |
| 2003 | 233 |  16909.84 |
| 2004 | 239 |  80375.24 |
| 2004 | 240 |  71783.75 |
| 2003 | 242 |  48051.04 |
| 2005 | 242 |  12432.32 |
| 2004 | 249 |  82223.23 |
| 2005 | 250 |  17928.09 |
| 2004 | 250 |  26311.63 |
| 2003 | 250 |  23419.47 |
| 2004 | 256 |  58876.41 |
| 2004 | 259 |  61234.67 |
| 2003 | 259 |  27988.47 |
| 2004 | 260 |  66812.00 |
| 2005 | 276 |  56932.30 |
| 2003 | 276 |  80101.92 |
| 2004 | 278 |  37654.09 |
| 2003 | 278 |  89875.60 |
| 2003 | 282 |  24013.52 |
| 2004 | 282 |  35806.73 |
| 2005 | 282 |  31835.36 |
| 2004 | 286 |  90545.37 |
| 2004 | 298 | 108777.92 |
| 2003 | 299 |  36798.88 |
| 2004 | 299 |  32260.16 |
| 2005 | 311 |  46770.52 |
| 2003 | 311 |  32723.04 |
| 2004 | 311 |  16212.59 |
| 2004 | 314 |  62253.85 |
| 2004 | 319 |  42339.76 |
| 2003 | 319 |  36092.40 |
| 2005 | 320 |   8307.28 |
| 2003 | 320 |  93565.24 |
| 2003 | 321 |  85559.12 |
| 2005 | 321 |  46781.66 |
| 2005 | 323 |  75020.13 |
| 2004 | 323 |  76721.95 |
| 2003 | 323 |   2880.00 |
| 2004 | 324 |  13671.82 |
| 2003 | 324 |  66884.91 |
| 2004 | 328 |  38281.51 |
| 2003 | 333 |  33757.85 |
| 2005 | 333 |  21432.31 |
| 2005 | 334 |  45785.34 |
| 2003 | 334 |  29716.86 |
| 2004 | 334 |  28394.54 |
| 2004 | 339 |  23333.06 |
| 2003 | 339 |  34606.28 |
| 2003 | 344 |  31428.21 |
| 2004 | 344 |  15322.93 |
| 2004 | 347 |  21053.69 |
| 2003 | 347 |  20452.50 |
| 2004 | 350 |  18888.31 |
| 2003 | 350 |  50824.66 |
| 2005 | 350 |   1834.56 |
| 2005 | 353 |  96362.46 |
| 2003 | 353 |  30620.73 |
| 2003 | 357 |  20220.04 |
| 2004 | 357 |  36442.34 |
| 2004 | 362 |  33533.47 |
| 2004 | 363 |  50799.69 |
| 2003 | 363 |  65649.60 |
| 2005 | 379 |  28322.83 |
| 2003 | 379 |  32680.31 |
| 2004 | 379 |  12530.51 |
| 2004 | 381 |  12081.52 |
| 2003 | 381 |   2755.76 |
| 2005 | 381 |  14379.90 |
| 2003 | 382 |  35826.33 |
| 2004 | 382 |  49233.67 |
| 2003 | 385 |  71645.46 |
| 2004 | 385 |  15822.84 |
| 2003 | 386 |  38524.29 |
| 2004 | 386 |  51619.02 |
| 2005 | 398 |  34583.18 |
| 2004 | 398 |  70965.55 |
| 2005 | 406 |  12190.85 |
| 2004 | 406 |  74246.12 |
| 2004 | 412 |  66704.94 |
| 2004 | 415 |  31310.09 |
| 2004 | 424 |  25505.98 |
| 2003 | 424 |  43708.35 |
| 2003 | 447 |  23663.65 |
| 2004 | 447 |  26304.13 |
| 2005 | 448 |  27966.54 |
| 2004 | 448 |  48809.90 |
| 2004 | 450 |  59551.38 |
| 2003 | 452 |  42252.87 |
| 2005 | 452 |   8807.12 |
| 2003 | 455 |  38139.18 |
| 2004 | 455 |  32239.47 |
| 2004 | 456 |  29230.43 |
| 2004 | 458 |  55308.17 |
| 2003 | 458 |  57131.92 |
| 2005 | 462 |  30293.77 |
| 2003 | 462 |   9977.85 |
| 2004 | 462 |  48355.87 |
| 2004 | 471 |   9415.13 |
| 2003 | 471 |  35505.63 |
| 2004 | 473 |   7612.06 |
| 2003 | 473 |  17746.26 |
| 2003 | 475 |   7678.25 |
| 2004 | 475 |  36070.47 |
| 2004 | 484 |   3474.66 |
| 2003 | 484 |  47513.19 |
| 2004 | 486 |  51893.45 |
| 2003 | 486 |  25833.14 |
| 2003 | 487 |  29997.09 |
| 2004 | 487 |  12573.28 |
| 2003 | 489 |  22275.73 |
| 2004 | 489 |   7310.42 |
| 2003 | 495 |  59265.14 |
| 2004 | 495 |   6276.60 |
| 2005 | 496 |  30253.75 |
| 2003 | 496 |  32077.44 |
| 2004 | 496 |  52166.00 |
+------+-----+-----------+
192 rows in set (0.00 sec)

 */

SELECT YEAR(`paymentDate`) AS `yil`,
       `customerNumber`    AS `cus`,
       SUM(`amount`)       AS `summa`
FROM `payments`
GROUP BY `cus`,
         `yil`
WITH ROLLUP;
/* natija:
+------+------+------------+
| yil  | cus  | summa      |
+------+------+------------+
| 2003 |  103 |   14571.44 |
| 2004 |  103 |    7742.92 |
| NULL |  103 |   22314.36 |
| 2003 |  112 |   32641.98 |
| 2004 |  112 |   47539.00 |
| NULL |  112 |   80180.98 |
| 2003 |  114 |   53429.11 |
| 2004 |  114 |  127155.96 |
| NULL |  114 |  180585.07 |
| 2004 |  119 |   67426.01 |
| 2005 |  119 |   49523.67 |
| NULL |  119 |  116949.68 |
| 2003 |  121 |   51710.33 |
| 2004 |  121 |   52514.46 |
| NULL |  121 |  104224.79 |
| 2003 |  124 |  167783.08 |
| 2004 |  124 |  231562.53 |
| 2005 |  124 |  184842.63 |
| NULL |  124 |  584188.24 |
| 2003 |  128 |   34650.82 |
| 2004 |  128 |   41286.94 |
| NULL |  128 |   75937.76 |
| 2003 |  129 |   40461.78 |
| 2004 |  129 |   26248.78 |
| NULL |  129 |   66710.56 |
| 2003 |  131 |   22292.62 |
| 2004 |  131 |   85347.32 |
| NULL |  131 |  107639.94 |
| 2003 |  141 |  189840.15 |
| 2004 |  141 |  293765.51 |
| 2005 |  141 |  232133.32 |
| NULL |  141 |  715738.98 |
| 2003 |  144 |    7674.94 |
| 2004 |  144 |   36005.71 |
| NULL |  144 |   43680.65 |
| 2003 |  145 |   53959.21 |
| 2004 |  145 |   53487.29 |
| NULL |  145 |  107446.50 |
| 2003 |  146 |   39712.10 |
| 2004 |  146 |   90593.25 |
| NULL |  146 |  130305.35 |
| 2003 |  148 |  150123.15 |
| 2004 |  148 |    2611.84 |
| 2005 |  148 |    3516.04 |
| NULL |  148 |  156251.03 |
| 2003 |  151 |  117634.88 |
| 2004 |  151 |   60279.07 |
| NULL |  151 |  177913.95 |
| 2004 |  157 |   98509.25 |
| NULL |  157 |   98509.25 |
| 2003 |  161 |   89418.78 |
| 2004 |  161 |    2434.25 |
| 2005 |  161 |   12692.19 |
| NULL |  161 |  104545.22 |
| 2004 |  166 |  105420.57 |
| NULL |  166 |  105420.57 |
| 2003 |  167 |   85024.46 |
| 2004 |  167 |   12538.01 |
| NULL |  167 |   97562.47 |
| 2003 |  171 |   42783.81 |
| 2004 |  171 |   18997.89 |
| NULL |  171 |   61781.70 |
| 2003 |  172 |   33383.14 |
| 2004 |  172 |   53170.38 |
| NULL |  172 |   86553.52 |
| 2004 |  173 |   32198.69 |
| NULL |  173 |   32198.69 |
| 2003 |  175 |   24879.08 |
| 2004 |  175 |   42044.77 |
| 2005 |  175 |   28500.78 |
| NULL |  175 |   95424.63 |
| 2004 |  177 |   62361.22 |
| NULL |  177 |   62361.22 |
| 2003 |  181 |    5494.78 |
| 2004 |  181 |   67002.86 |
| NULL |  181 |   72497.64 |
| 2003 |  186 |   37602.48 |
| 2004 |  186 |   34341.08 |
| 2005 |  186 |   23602.90 |
| NULL |  186 |   95546.46 |
| 2003 |  187 |   48425.69 |
| 2004 |  187 |   99984.40 |
| NULL |  187 |  148410.09 |
| 2004 |  189 |   49898.27 |
| NULL |  189 |   49898.27 |
| 2003 |  198 |    6036.96 |
| 2004 |  198 |   15517.30 |
| NULL |  198 |   21554.26 |
| 2003 |  201 |   23908.24 |
| 2004 |  201 |   37258.94 |
| NULL |  201 |   61167.18 |
| 2003 |  202 |   36527.61 |
| 2004 |  202 |   33594.58 |
| NULL |  202 |   70122.19 |
| 2004 |  204 |   55577.26 |
| NULL |  204 |   55577.26 |
| 2003 |  205 |   54222.70 |
| 2005 |  205 |   39580.60 |
| NULL |  205 |   93803.30 |
| 2004 |  209 |   40701.57 |
| 2005 |  209 |   35157.75 |
| NULL |  209 |   75859.32 |
| 2003 |  211 |   45480.79 |
| NULL |  211 |   45480.79 |
| 2003 |  216 |   43575.26 |
| 2004 |  216 |   24945.21 |
| NULL |  216 |   68520.47 |
| 2003 |  219 |    4465.85 |
| 2005 |  219 |    3452.75 |
| NULL |  219 |    7918.60 |
| 2003 |  227 |   36164.46 |
| 2004 |  227 |   53745.34 |
| NULL |  227 |   89909.80 |
| 2003 |  233 |   16909.84 |
| 2004 |  233 |   22997.45 |
| 2005 |  233 |   29070.38 |
| NULL |  233 |   68977.67 |
| 2004 |  239 |   80375.24 |
| NULL |  239 |   80375.24 |
| 2004 |  240 |   71783.75 |
| NULL |  240 |   71783.75 |
| 2003 |  242 |   48051.04 |
| 2005 |  242 |   12432.32 |
| NULL |  242 |   60483.36 |
| 2004 |  249 |   82223.23 |
| NULL |  249 |   82223.23 |
| 2003 |  250 |   23419.47 |
| 2004 |  250 |   26311.63 |
| 2005 |  250 |   17928.09 |
| NULL |  250 |   67659.19 |
| 2004 |  256 |   58876.41 |
| NULL |  256 |   58876.41 |
| 2003 |  259 |   27988.47 |
| 2004 |  259 |   61234.67 |
| NULL |  259 |   89223.14 |
| 2004 |  260 |   66812.00 |
| NULL |  260 |   66812.00 |
| 2003 |  276 |   80101.92 |
| 2005 |  276 |   56932.30 |
| NULL |  276 |  137034.22 |
| 2003 |  278 |   89875.60 |
| 2004 |  278 |   37654.09 |
| NULL |  278 |  127529.69 |
| 2003 |  282 |   24013.52 |
| 2004 |  282 |   35806.73 |
| 2005 |  282 |   31835.36 |
| NULL |  282 |   91655.61 |
| 2004 |  286 |   90545.37 |
| NULL |  286 |   90545.37 |
| 2004 |  298 |  108777.92 |
| NULL |  298 |  108777.92 |
| 2003 |  299 |   36798.88 |
| 2004 |  299 |   32260.16 |
| NULL |  299 |   69059.04 |
| 2003 |  311 |   32723.04 |
| 2004 |  311 |   16212.59 |
| 2005 |  311 |   46770.52 |
| NULL |  311 |   95706.15 |
| 2004 |  314 |   62253.85 |
| NULL |  314 |   62253.85 |
| 2003 |  319 |   36092.40 |
| 2004 |  319 |   42339.76 |
| NULL |  319 |   78432.16 |
| 2003 |  320 |   93565.24 |
| 2005 |  320 |    8307.28 |
| NULL |  320 |  101872.52 |
| 2003 |  321 |   85559.12 |
| 2005 |  321 |   46781.66 |
| NULL |  321 |  132340.78 |
| 2003 |  323 |    2880.00 |
| 2004 |  323 |   76721.95 |
| 2005 |  323 |   75020.13 |
| NULL |  323 |  154622.08 |
| 2003 |  324 |   66884.91 |
| 2004 |  324 |   13671.82 |
| NULL |  324 |   80556.73 |
| 2004 |  328 |   38281.51 |
| NULL |  328 |   38281.51 |
| 2003 |  333 |   33757.85 |
| 2005 |  333 |   21432.31 |
| NULL |  333 |   55190.16 |
| 2003 |  334 |   29716.86 |
| 2004 |  334 |   28394.54 |
| 2005 |  334 |   45785.34 |
| NULL |  334 |  103896.74 |
| 2003 |  339 |   34606.28 |
| 2004 |  339 |   23333.06 |
| NULL |  339 |   57939.34 |
| 2003 |  344 |   31428.21 |
| 2004 |  344 |   15322.93 |
| NULL |  344 |   46751.14 |
| 2003 |  347 |   20452.50 |
| 2004 |  347 |   21053.69 |
| NULL |  347 |   41506.19 |
| 2003 |  350 |   50824.66 |
| 2004 |  350 |   18888.31 |
| 2005 |  350 |    1834.56 |
| NULL |  350 |   71547.53 |
| 2003 |  353 |   30620.73 |
| 2005 |  353 |   96362.46 |
| NULL |  353 |  126983.19 |
| 2003 |  357 |   20220.04 |
| 2004 |  357 |   36442.34 |
| NULL |  357 |   56662.38 |
| 2004 |  362 |   33533.47 |
| NULL |  362 |   33533.47 |
| 2003 |  363 |   65649.60 |
| 2004 |  363 |   50799.69 |
| NULL |  363 |  116449.29 |
| 2003 |  379 |   32680.31 |
| 2004 |  379 |   12530.51 |
| 2005 |  379 |   28322.83 |
| NULL |  379 |   73533.65 |
| 2003 |  381 |    2755.76 |
| 2004 |  381 |   12081.52 |
| 2005 |  381 |   14379.90 |
| NULL |  381 |   29217.18 |
| 2003 |  382 |   35826.33 |
| 2004 |  382 |   49233.67 |
| NULL |  382 |   85060.00 |
| 2003 |  385 |   71645.46 |
| 2004 |  385 |   15822.84 |
| NULL |  385 |   87468.30 |
| 2003 |  386 |   38524.29 |
| 2004 |  386 |   51619.02 |
| NULL |  386 |   90143.31 |
| 2004 |  398 |   70965.55 |
| 2005 |  398 |   34583.18 |
| NULL |  398 |  105548.73 |
| 2004 |  406 |   74246.12 |
| 2005 |  406 |   12190.85 |
| NULL |  406 |   86436.97 |
| 2004 |  412 |   66704.94 |
| NULL |  412 |   66704.94 |
| 2004 |  415 |   31310.09 |
| NULL |  415 |   31310.09 |
| 2003 |  424 |   43708.35 |
| 2004 |  424 |   25505.98 |
| NULL |  424 |   69214.33 |
| 2003 |  447 |   23663.65 |
| 2004 |  447 |   26304.13 |
| NULL |  447 |   49967.78 |
| 2004 |  448 |   48809.90 |
| 2005 |  448 |   27966.54 |
| NULL |  448 |   76776.44 |
| 2004 |  450 |   59551.38 |
| NULL |  450 |   59551.38 |
| 2003 |  452 |   42252.87 |
| 2005 |  452 |    8807.12 |
| NULL |  452 |   51059.99 |
| 2003 |  455 |   38139.18 |
| 2004 |  455 |   32239.47 |
| NULL |  455 |   70378.65 |
| 2004 |  456 |   29230.43 |
| NULL |  456 |   29230.43 |
| 2003 |  458 |   57131.92 |
| 2004 |  458 |   55308.17 |
| NULL |  458 |  112440.09 |
| 2003 |  462 |    9977.85 |
| 2004 |  462 |   48355.87 |
| 2005 |  462 |   30293.77 |
| NULL |  462 |   88627.49 |
| 2003 |  471 |   35505.63 |
| 2004 |  471 |    9415.13 |
| NULL |  471 |   44920.76 |
| 2003 |  473 |   17746.26 |
| 2004 |  473 |    7612.06 |
| NULL |  473 |   25358.32 |
| 2003 |  475 |    7678.25 |
| 2004 |  475 |   36070.47 |
| NULL |  475 |   43748.72 |
| 2003 |  484 |   47513.19 |
| 2004 |  484 |    3474.66 |
| NULL |  484 |   50987.85 |
| 2003 |  486 |   25833.14 |
| 2004 |  486 |   51893.45 |
| NULL |  486 |   77726.59 |
| 2003 |  487 |   29997.09 |
| 2004 |  487 |   12573.28 |
| NULL |  487 |   42570.37 |
| 2003 |  489 |   22275.73 |
| 2004 |  489 |    7310.42 |
| NULL |  489 |   29586.15 |
| 2003 |  495 |   59265.14 |
| 2004 |  495 |    6276.60 |
| NULL |  495 |   65541.74 |
| 2003 |  496 |   32077.44 |
| 2004 |  496 |   52166.00 |
| 2005 |  496 |   30253.75 |
| NULL |  496 |  114497.19 |
| NULL | NULL | 8853839.23 |
+------+------+------------+
291 rows in set (0.00 sec)
 */

/*                               AMALLAR KETMA-KETLIGI:
1. SELECT                                   - tanlanadigan ustunlar
2. FROM                                     - qaysi jadvaldan
3. WHERE                                    - qaysiki ixtiyoriy shartlar asosida
4. GROUP BY                                 - bir xil qiymatli yozuvlarni bir guruhga olish
    4.1 HAVING  (GROUP BY  bo'lsa ishlaydi) - shu guruhni shartlar asosida filtrlash
5. ORDER BY                                 - ma'lum bir usutun(lar)ni saralash
6. LIMIT                                    - ma'lum bir miqdorda chegaralab chiqarish  */