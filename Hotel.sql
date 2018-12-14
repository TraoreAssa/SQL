-- Exercice 2: 
-- 1-  Depuis votre termilal SHELL vous crée une BDD nommée "Hotel", 

-- 2-  Le modele des tables est le suivant:

MariaDB [hotel]> CREATE TABLE chambres(id INT(3) PRIMARY KEY AUTO_INCREMENT NOT NULL, num_chambre INT(3), prix FLOAT, nb_lit INT(3), nb_pers INT(3), confort VARCHAR(255), equipement VARCHAR(255));

MariaDB [hotel]> CREATE TABLE client(id INT(3) PRIMARY KEY AUTO_INCREMENT NOT NULL, num_client INT(3), nom VARCHAR(255), prenom VARCHAR(255), adresse VARCHAR(150));

MariaDB [hotel]>  CREATE TABLE reservation (id INT(3) PRIMARY KEY AUTO_INCREMENT NOT NULL, num_client INT(3), date_arrive DATETIME, date_depart DATETIME);

-- 3-   Dans ces 3 tables inserer les info suivantes:
    -- 3- a-- 5 chambres numérotées de 10 en 10, prix (80, 100, 150, 180, 250), nb_lit de 1 à 3(aléatoire), confort(wc/douche/bain/ect). équipement(TV/WIFI/ect)

    INSERT INTO chambres(num_chambre, prix, nb_lit, nb_pers, confort, equipement) VALUES (20, 115.00, 3, 4, 'wc,bain','TV,WIFI, mini bar, sauna');

    INSERT INTO chambres(num_chambre, prix, nb_lit, nb_pers, confort, equipement) VALUES (50, 39.00, 1, 1, 'douche,wc','TV,WIFI, mini bar');
    
    INSERT INTO chambres(num_chambre, prix, nb_lit, nb_pers, confort, equipement) VALUES (40, 79.00, 3, 6, 'douche,wc','TV,WIFI, mini bar');
    
    INSERT INTO chambres(num_chambre, prix, nb_lit, nb_pers, confort, equipement) VALUES (90, 179.00, 2, 3, 'bain,douche,wc, bain','TV,WIFI, mini bar, hammam, sauna');
    
    INSERT INTO chambres(num_chambre, prix, nb_lit, nb_pers, confort, equipement) VALUES (70, 89.00, 2, 2, 'bain,wc','TV,WIFI,mini bar');


    -- 3- b-- 5 Clients avec des numéros client a 4 chiffres (0001/1001), le reste des infos est a votre bon vouloir
    INSERT INTO client (num_client, nom, prenom, adresse) VALUES (2305, 'Diop', 'Ibrahim', "85 rue Lyautey 78300 Poissy");
    INSERT INTO client (num_client, nom, prenom, adresse) VALUES (1310, 'Traore', 'Mariatou', "69 Place corneille 78955 Carriere sous Poissy");
    INSERT INTO client (num_client, nom, prenom, adresse) VALUES (1003, 'Drame', 'Fatima', "34ter la bruyere 95200 Cergy");
    INSERT INTO client (num_client, nom, prenom, adresse) VALUES (1004, 'Sylla' , 'Aicha', "105 avenue de la croix Lyautey 75200 Paris");
    INSERT INTO client (num_client, nom, prenom, adresse) VALUES (0204, 'Toure' , 'Henda', "2 avenue de la croix Lyautey 77500 Mantes la Jolie");


    -- 3- c-- 5 Reservations date arbitraire.
    INSERT INTO reservation(num_client, date_arrive, date_depart) VALUES (2305, 2019-01-03, 2019-01-06);
    INSERT INTO reservation(num_client, date_arrive, date_depart) VALUES (1310,2018-12-23, 2019-01-02);
    INSERT INTO reservation(num_client, date_arrive, date_depart) VALUES (1003,2018-12-14, 2018-12-15);
    INSERT INTO reservation(num_client, date_arrive, date_depart) VALUES (1004, 2018-12-13, 2019-01-08);
    INSERT INTO reservation(num_client, date_arrive, date_depart) VALUES (0204, 2018-12-21, 2018-12-24);


    -- Le prix par personne des chambres avec TV
    SELECT prix, equipement, num_chambre FROM chambres WHERE equipement='TV';

    -- Les numéros de chambres avec TV.

    -- Les numéros de chambres et leurs capacités.
    select * FROM chambres;
+----+-------------+------+--------+---------+----------------------+----------------------------------+
| id | num_chambre | prix | nb_lit | nb_pers | confort              | equipement                       |
+----+-------------+------+--------+---------+----------------------+----------------------------------+
|  1 |          20 |  115 |    100 |       4 | wc,douche,bain       | tv,wifi, mini bar, sauna         |
|  2 |          50 |   39 |      1 |       1 | douche,wc            | TV,WIFI, mini bar                |
|  3 |          40 |   79 |      3 |       6 | douche,wc            | TV,WIFI, mini bar                |
|  4 |          90 |  179 |      2 |       3 | bain,douche,wc, bain | TV,WIFI, mini bar, hammam, sauna |
|  5 |          70 |   89 |      2 |       2 | bain,wc              | TV,WIFI,mini bar                 |
+----+-------------+------+--------+---------+----------------------+----------------------------------+
    -- La capacité théorique d'accueil de l'hôtel.
    
    -- Les numéros des chambres et le numéro des clients ayant réservé des chambres pour le 09/02/2004.
    -- Les numéros des chambres coûtant au maximum 80 Euro ou ayant un bain et vallant au maximum 120 Euro.

    -- Les Nom, Prénoms et adresses des clients dans le noms commencent par "D".
SELECT nom, prenom, adresse FROM client WHERE nom LIKE 'd%';
+-------+---------+------------------------------+
| nom   | prenom  | adresse                      |
+-------+---------+------------------------------+
| Diop  | Ibrahim | 85 rue Lyautey 78300 Poissy  |
| Drame | Fatima  | 34ter la bruyere 95200 Cergy |
+-------+---------+------------------------------+


    -- Le nombre de chambres dont le prix est entre 85 et 120 Euro.
    SELECT num_chambre, prix FROM chambres WHERE prix BETWEEN 85 AND 120;
    +-------------+------+
    | num_chambre | prix |
    +-------------+------+
    |          20 |  115 |
    |          70 |   89 |
    +-------------+------+
    -- Les noms des clients n'ayant pas fixé la date de départ.
    SELECT nom, prenom FROM client, reservation WHERE date_depart = IS NULL AND c.num_client = r.num_client;
