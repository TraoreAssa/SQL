-- Exercice 2: 
-- 1-  Depuis votre termilal SHELL vous crée une BDD nommée "Hotel", 

-- 2-  Le modele des tables est le suivant:

CREATE TABLE chambre(id INT(3) PRIMARY KEY 
AUTO_INCREMENT NOT NULL, 
num_chambre INT(4),
prix FLOAT, nb_lit INT(3), 
nb_pers INT(3), 
confort VARCHAR(255),
equipement VARCHAR(255));

CREATE TABLE client(
id INT(3) PRIMARY KEY AUTO_INCREMENT NOT NULL, 
num_client INT(3), 
nom VARCHAR(255), 
prenom VARCHAR(255), 
adresse VARCHAR(150));

CREATE TABLE reservation (id INT(3) PRIMARY KEY AUTO_INCREMENT NOT NULL,
num_client INT(3),
date_arrive DATETIME, 
date_depart DATETIME,
num_chambre INT (3));


INSERT INTO chambre(num_chambre, prix, nb_lit, nb_pers, confort, equipement) VALUES (100, 80.00, 01,01, 'Aucun', 'TV'), 
(110, 100.00, 01, 01, 'Douche', 'TV'), 
(120, 150, 02, 02, 'Douche/WC', 'TV/WIFI'),
(130, 180.00, 02, 03, 'WC/Bain', 'TV/WIFI/Frigo'), 
(140, 250.00, 03, 04, 'WC/Bain/Jacuzzi/Massage', 'TV/WIFI/Frigo/Cuisine/Bar');

INSERT INTO client(num_client, nom, prenom, adresse) VALUES 
(0001, 'Dupont', 'Jean-Paul', '1 rue de la fossee'), 
(0002, 'Minouch', 'Zina', '2 Bis Chemin de la traversière'), 
(0003, 'Paris', 'Julian', 'Jsais pas ou il habite'), 
(0004, 'Plus', 'Dinspi', 'Pour le reste des clients'), 
(0005, 'Le Dernier', 'Enfin', '5 cest encore trop');

INSERT INTO reservation(num_client, num_chambre, date_arrive, date_depart) VALUES (1001, 100, '2018-09-19 19:36:23', '2018-09-20 19:36:23'), 
(102, 110, '2018-08-19 12:00:54', '2018-09-21 12:00:54'), 
(103, 120, '2018-08-19 15:55:03', '2018-09-23 15:55:03'), 
(104, 130, '2018-08-19 22:59:13', '2018-08-20 22:59:13'), 
(105, 140, '2018-08-19 11:55:41', '2018-09-20 11:55:41');

*-- Exprimer les requêtes suivantes en SQL :
-- Les numéros de chambres avec TV.
SELECT num_chambre FROM chambre WHERE equipement LIKE '%TV%';

-- Les numéros de chambres et leurs capacités.
SELECT num_chambre, nb_pers FROM chambre;

-- La capacité théorique d'accueil de l'hôtel.
SELECT SUM(nb_pers) FROM chambre;

-- Le prix par personne des chambres avec TV.
SELECT AVG(prix/nb_pers) FROM chambre WHERE equipement LIKE '%tv%';
SELECT prix/nb_pers FROM chambre WHERE equipement LIKE '%tv%';

-- Les numéros des chambres et le numéro des clients ayant réservé des chambres pour le 09/02/2004.
SELECT num_chambre, num_client FROM reservation WHERE date_arrive = 'yyyy-mm-dd hh:mm:ss';

-- Les numéros des chambres coûtant au maximum 80 Euro ou ayant un bain et vallant au maximum 120 Euro.
SELECT num_chambre FROM chambre WHERE confort LIKE '%bain%' AND prix BETWEEN 80 AND 120;

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
    SELECT nom, prenom FROM client, reservation WHERE date_depart = IS NULL;






 -- Le prix par personne des chambres avec TV
    SELECT AVG(prix/nb_pers) FROM chambre WHERE equipement LIKE '%tv%';
    SELECT prix/nb_pers FROM chambre WHERE equipement LIKE '%tv%';

    -- Les numéros de chambres avec TV.
    SELECT num_chambre FROM chambre WHERE equipement LIKE '%tv%';

    -- Les numéros de chambres et leurs capacités.
    SELECT num_chambre, nb_pers FROM chambre;

    -- La capacité théorique d'accueil de l'hôtel.
    SELECT SUM(nb_pers) FROM chambre;
    
    -- Les numéros des chambres et le numéro des clients ayant réservé des chambres pour le 09/02/2004.
    SELECT num_chambre, num_client FROM reservation WHERE date_arrive = '2004-02-09';

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
    SELECT nom, prenom FROM client, reservation WHERE date_depart = IS NULL;