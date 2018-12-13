-- Une base de donnée (Database en anglais) est utile dans le cadre d'un projet informatique pour consever des information en mémoire. A l'interieur de la base, les informations sont classée, structurées et regroupées généralement  par sujet. Dans la grande majorité des cas une BDD est gérée par logiciel moteur qui manipule : un SGBD (Systéme de Gestion de Base de Données).
-- MCD = Model conceptuel de Données.
-- Le Modele conceptuel de donnée, nous permet de nous fournir un plan de notre base de données avant de la créer .

-- SGBD = Systeme de Gestion de Base de Données.
-- Le SGBD permet d'acceuillir, d'exploiter et de faire fonctionner les bases de données (moteur)
-- Nous utiserons Mysql (d'autre SGDB existe : Oracle, Sql server, PostgreSQL, ect...).

-- BDD = Base De Données
-- la base de donnée représente l'emplacement des données sauvegardées.

-- SQL = Structured Query Langage
-- le langage de requête SQL nous permet d'echanger des informations avec la base de donnée
--  Une fois que les informations ont été enrgistrées, il est important de pouvoir les gérer( ajout, modification, suppression, consultation)
--/!\ Toutes ces actions de gestion et manipulation passeront par une requete SQL.

-- MODELE MCD
-- avant de créer un BDD, il est essenciel de se poser et reflechir sur la modélisation
-- En effet, une base de donnée va servir de support a une application informatique.
-- Comment modéliser une BDD ?
-- Nous pouvons modéliser sur papier si celle-ci n'est pas complexe mais da,ns la plupart des ces nous aurons besoin d'un logiciel pour accompagner et avoir une vue d'ensemble.
-- unlogiciel connu permet de modéliser une BDD : Mysql WorkBesnch

-- la modélisation se compose de différentes tables (table = sujet)
-- Exemple, si nous vendons des produits sur notre site, nous auront 1 table produits et 1 table comande.

-- LES TABLES
-- 1 sujet représente 1 table dans un BDD, 1 table est un emplacement de sauvegarde.
-- Il faut réfléchir au sujet  et à ses conséquences. Si nous vendons des produit nous aurons certainement des membres. 1 table membre sera donc nécessaire.


--LES TYPES DE COLONNES / CHAMPS
--VARCHAR --> Chaine de caractères pouvont aller jusqu'a 256 --> pour enregistrer un pseudo, email, titre produit ou d'un blog ect...,

-- TEXT --> Chaine de caractères ilimité --> pour enregistrer le texte d'un article de blog.

-- INT --> Numérique --> pour enregistrer les numeros d'un champ servant d'identification, un prix, un code postal, le nombre de produit en stock ect...

-- DATE --> Date --> pour enregistrer la date d'enregistrement d'une commande, d'un article de blog ect...

-- Les identifiants (Clé Primaire - PK Primay Key)
-- Les identifiants sont des champs systématiquement présent dans chaque table et ce en PREMIERE POSITION ---->>> clé primaire (PK).
-- Pour eviter de choisir le numéro et faire des eurreurs nous demanderons a le générer automatiquement avec l'Auto-Increment.

--AUTO-INCREMENT
-- est une option permettant de générer un numéro unique dans une colone (Champ) de type clé primaire (identifiant).
-- /!\ le 1er champ de chaque table sera systematiquement un "ID" qui sera PK(Primay Key) et AI(Auto-Increment).


-- Null /NOT NUll
-- dans chaque champ nous pourrons indiquer si nous acceptons les valeurs NULL ou non (NOT NULL)
-- NULL est un type de valeur en informatique évitant de laisser un champ vide si nous n'avons pas d'information à y déposer.

-- LES RELATIONS
-- exemple 1 membre commande 1 produit ( ou 1 produit est commandé par 1 membre)
-- nous devrons enregistrer l'information dans 1 table commande
-- pour cela, intéréssons nous aux cardinalités!!!!

-- LES CARDINALITES
-- permettent de connaitre les chiffre minimum et maximum d'enregistrement pour une relation.

--TABLE DE JOINTURE
-- une tables de jointure permet de faire le lien entre 2 tables.
-- exemple: site de taxi qui posséderait des conducteurs ( table conducteur) et des vehicules (tables vehicule).

-- 1 conducteur peut conduire 0 ou plusieurs vehicules
-- relation (0,n),
-- 1 vehicule peut etre conduit 0 ou plusieurs conducteurs
-- relation (0,n),

-- Comment savoir quel conducteur conduit quel vehicule ? ou dans l'autre sens : quel vehicule est conduit par quel conducteur ?

-- Une table de jointure nommée : conducteur_vehicule sera donc créer avec les champs suivants:
-- id_conducteur_vehicule 
-- id_conducteur
-- id_vehicule

-- LES REQUETES 
-- Comment formuler une requête SQL ? ---> Formulation --->Exécution --->Résultat
-- Il y a 4 grands type de requêtes possibles
-- 1-  Requete de selection 
-- (requête question / reponse, Nous faisons une demande via question et nous abtenons une repose)
-- 2-   Requete d'insertion
-- (requête d'action, impact sur les données)
-- 3-   Requete de modification
-- (requête d'action, impact sur les données)
-- 4-   Requete de suppression
-- (requête d'action, impact sur les données) 

--  /!\TOUJOURS UN POINT VIRGULE A LA FIN!!!

-- CREATION DE MA TABLE EMPLOYE 

CREATE TABLE IF NOT EXISTS employes(
	id_employes int(3) NOT NULL AUTO_INCREMENT,
	prenom varchar(20) DEFAULT NULL,
	nom varchar(20) DEFAULT NULL,
	sex enum('m','f') NOT NULL,
	service varchar(30) DEFAULT NULL,
	data_embauche date DEFAULT NULL,
	salaire float DEFAULT NULL,
	PRIMARY KEY(id_employes)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO employes (id_employes, prenom, nom, sex, service, data_embauche, salaire)
VALUES
(350, 'Jean-Pierre', 'Laborde', 'm', 'direction', '1999-12-09', 5000),
(388,'Clement', 'Gallet', 'm', 'commercial', '2000-01-15', 2300),
(415, 'Thomas', 'Winter', 'm', 'commercial', '2000-05-03', 3350),
(417, 'Cloe', 'Dubar', 'f', 'production', '2001-09-05', 1900),
(491, 'Elodie', 'Fellier', 'f', 'secretariat', '2002-02-22', 1600),
(509, 'Celine', 'Perrin', 'f', 'commercial', '2006-09-10', 2700),
(690, 'Mathieu', 'Vignal', 'm', 'informatique', '2008-11-17', 1500),
(739, 'Thierry', 'Deprez', 'm', 'secretariat', '2009-11-17', 1900),
(900, 'Benoit', 'Lagarde', 'm', 'production', '2013-01-03', 2550),
(933, 'Emilie', 'Sennard', 'f', 'commercial', '2014-09-11', 1900),
(990, 'Stephanie', 'Lafaye', 'f', 'assistant', '2015-06-02', 1775);


--> Créer une base de données.
CREATE DATABASE [nomdelabase]; /!\ Sans les [] !!!

--> Utiliser une base de données
USE [nomdelabase]; /!\ Sans les [] !!!

--> Lister les bases de données
SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| assatraore         |
| cvwp               |
| entreprise         |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+

--> Supprimer une BDD //  Supprimer une TABLE
DROP [nomdelabase] // DROP [nomdelatable]; /!\ Sans les [] !!!

--> Vider le contenu d'une table d'une BDD
TRUNCATE [nomdelatable]; /!\ Sans les [] !!!

--> Créer une table (dirigant)
create table [dirigeant]; /!\ Sans les [] !!!

--> Observer la structure d'une table
DESH [nomdelatable]; /!\ Sans les [] !!!

--> Pour afficher les nom et prénom ou ... dans l'entreprise 
SELECT nom, prenom FROM employes;
+----------+-------------+
| nom      | prenom      |
+----------+-------------+
| Laborde  | Jean-Pierre |
| Gallet   | Clement     |
| Winter   | Thomas      |
| Dubar    | Cloe        |
| Fellier  | Elodie      |
| Perrin   | Celine      |
| Jaadar   | Houda       |
| Herisson | Sandra      |
| Vignal   | Mathieu     |
| Deprez   | Thierry     |
| Lagarde  | Benoit      |
| Sennard  | Emilie      |
| Lafaye   | Stephanie   |
| Traore   | Assa        |
+----------+-------------+

--> Pour afficher les services occupés dans l'entreprise (en evitant les doublants)
SELECT DISTINCT(service) FROM employes;
+--------------+
| service      |
+--------------+
| direction    |
| commercial   |
| production   |
| secretariat  |
| formation    |
| informatique |
| assistant    |
| develloppeur |
+--------------+

--> Pour afficher toutes les colonnes dans employes 
SELECT * FROM employes;
+-------------+-------------+----------+-----+--------------+---------------+---------+
| id_employes | prenom      | nom      | sex | service      | data_embauche | salaire |
+-------------+-------------+----------+-----+--------------+---------------+---------+
|         350 | Jean-Pierre | Laborde  | m   | direction    | 1999-12-09    |    5000 |
|         388 | Clement     | Gallet   | m   | commercial   | 2000-01-15    |    2300 |
|         415 | Thomas      | Winter   | m   | commercial   | 2000-05-03    |    3350 |
|         417 | Cloe        | Dubar    | f   | production   | 2001-09-05    |    1900 |
|         491 | Elodie      | Fellier  | f   | secretariat  | 2002-02-22    |    1600 |
|         509 | Celine      | Perrin   | f   | commercial   | 2006-09-10    |    2700 |
|         630 | Houda       | Jaadar   | f   | formation    | 2017-01-20    |    2500 |
|         650 | Sandra      | Herisson | f   | formation    | 2018-09-24    |    1900 |
|         690 | Mathieu     | Vignal   | m   | informatique | 2008-11-17    |    1500 |
|         739 | Thierry     | Deprez   | m   | secretariat  | 2009-11-17    |    1900 |
|         900 | Benoit      | Lagarde  | m   | production   | 2013-01-03    |    2550 |
|         933 | Emilie      | Sennard  | f   | commercial   | 2014-09-11    |    1900 |
|         990 | Stephanie   | Lafaye   | f   | assistant    | 2015-06-02    |    1775 |
|         991 | Assa        | Traore   | f   | develloppeur | 2018-10-01    |    1100 |
+-------------+-------------+----------+-----+--------------+---------------+---------+

--> Pour afficher seulement les employes du service informatique,
SELECT nom, prenom FROM employes WHERE service='informatique';
+--------+---------+
| nom    | prenom  |
+--------+---------+
| Vignal | Mathieu |
+--------+---------+

--> Pour afficher seulement les employes embauches de 2006 a 2010
SELECT nom, prenom, data_embauche FROM employes WHERE data_embauche BETWEEN '2006-01-01' AND '2010-12-31';
+--------+---------+---------------+
| nom    | prenom  | data_embauche |
+--------+---------+---------------+
| Perrin | Celine  | 2006-09-10    |
| Vignal | Mathieu | 2008-11-17    |
| Deprez | Thierry | 2009-11-17    |
+--------+---------+---------------+

--> Pour ajouter une nouvelle embauche
INSERT INTO employes (id_employes, prenom, nom, sex, service, data_embauche, salaire)VALUES('', 'idir', 'igoudgir', 'm', 'coordinateur', '2018-12-12', 5000);

---------------- EXPLICATION ----------------
--> LIKE nous permet d'annoncer une valeur approchante sans avoir autant la valeur exacte.
--> Le signe % nous permet d'annocer une suite de caractere quelconques.
--> Dans notre cas, 'c%' veut dire qui commence par la lettre c.
--> Nous aurons également pu inscrire '%c' qui veux dire qui termine par la lettre c

--> Pour afficher tout les prenoms qui commence par c
SELECT prenom FROM employes WHERE prenom LIKE 'c%';
+---------+
| prenom  |
+---------+
| Clement |
| Cloe    |
| Celine  |
+---------+

--> Pour afficher tout les prenoms qui termine par e
SELECT prenom FROM employes WHERE prenom LIKE '%e';
+-------------+
| prenom      |
+-------------+
| Jean-Pierre |
| Cloe        |
| Elodie      |
| Celine      |
| Emilie      |
| Stephanie   |
+-------------+

------- OPARATEUR DE COMPARAISONS -------
-- = 'est égal'
-- > 'strictement superieur'
-- < 'strictement inférieur'
-- >= 'supérieur ou égal'
-- <= 'inférieur ou égal'
-- <> ou != 'différent de'.

-- Tous les salaires > 3000€
SELECT nom, prenom, salaire FROM employes WHERE salaire > 3000;
+----------+-------------+---------+
| nom      | prenom      | salaire |
+----------+-------------+---------+
| Laborde  | Jean-Pierre |    5000 |
| Winter   | Thomas      |    3350 |
| igoudgir | idir        |    5000 |
+----------+-------------+---------+

-- Tous les services sauf informatique
SELECT nom, prenom, service FROM employes WHERE service <> 'informatique';
+----------+-------------+--------------+
| nom      | prenom      | service      |
+----------+-------------+--------------+
| Laborde  | Jean-Pierre | direction    |
| Gallet   | Clement     | commercial   |
| Winter   | Thomas      | commercial   |
| Dubar    | Cloe        | production   |
| Fellier  | Elodie      | secretariat  |
| Perrin   | Celine      | commercial   |
| Jaadar   | Houda       | formation    |
| Herisson | Sandra      | formation    |
| Deprez   | Thierry     | secretariat  |
| Lagarde  | Benoit      | production   |
| Sennard  | Emilie      | commercial   |
| Lafaye   | Stephanie   | assistant    |
| Traore   | Assa        | develloppeur |
| igoudgir | idir        | coordinateur |
+----------+-------------+--------------+

-- CLASSEMENT des Nom PAR ORDRE ALPHA
SELECT nom FROM employes ORDER BY nom ;
SELECT nom FROM employes ORDER BY nom ASC;
SELECT nom FROM employes ORDER BY nom DESC;
+----------+
| nom      |
+----------+
| Deprez   |
| Dubar    |
| Fellier  |
| Gallet   |
| Herisson |
| igoudgir |
| Jaadar   |
| Laborde  |
| Lafaye   |
| Lagarde  |
| Perrin   |
| Sennard  |
| Traore   |
| Vignal   |
| Winter   |
+----------+

-- Classement par salaire 
SELECT nom, prenom, service, salaire FROM employes ORDER BY salaire DESC;
+----------+-------------+--------------+---------+
| nom      | prenom      | service      | salaire |
+----------+-------------+--------------+---------+
| Laborde  | Jean-Pierre | direction    |    5000 |
| igoudgir | idir        | coordinateur |    5000 |
| Winter   | Thomas      | commercial   |    3350 |
| Perrin   | Celine      | commercial   |    2700 |
| Lagarde  | Benoit      | production   |    2550 |
| Jaadar   | Houda       | formation    |    2500 |
| Gallet   | Clement     | commercial   |    2300 |
| Sennard  | Emilie      | commercial   |    1900 |
| Deprez   | Thierry     | secretariat  |    1900 |
| Herisson | Sandra      | formation    |    1900 |
| Dubar    | Cloe        | production   |    1900 |
| Lafaye   | Stephanie   | assistant    |    1775 |
| Fellier  | Elodie      | secretariat  |    1600 |
| Vignal   | Mathieu     | informatique |    1500 |
| Traore   | Assa        | develloppeur |    1100 |
+----------+-------------+--------------+---------+

-- Classement par salaire de la ligne 3 et seulement 3 (LIMIT 3,3)
SELECT nom, prenom, service, salaire FROM employes ORDER BY salaire DESC LIMIT 3,3;
+---------+--------+------------+---------+
| nom     | prenom | service    | salaire |
+---------+--------+------------+---------+
| Perrin  | Celine | commercial |    2700 |
| Lagarde | Benoit | production |    2550 |
| Jaadar  | Houda  | formation  |    2500 |
+---------+--------+------------+---------+

-----------------CALCULS DANS NOS REQUETES-----------------
-- Afficher le salaire annuel de chaque employés
SELECT nom, prenom, salaire*12 FROM employes;
+----------+-------------+------------+
| nom      | prenom      | salaire*12 |
+----------+-------------+------------+
| Laborde  | Jean-Pierre |      60000 |
| Gallet   | Clement     |      27600 |
| Winter   | Thomas      |      40200 |
| Dubar    | Cloe        |      22800 |
| Fellier  | Elodie      |      19200 |
| Perrin   | Celine      |      32400 |
| Jaadar   | Houda       |      30000 |
| Herisson | Sandra      |      22800 |
| Vignal   | Mathieu     |      18000 |
| Deprez   | Thierry     |      22800 |
| Lagarde  | Benoit      |      30600 |
| Sennard  | Emilie      |      22800 |
| Lafaye   | Stephanie   |      21300 |
| Traore   | Assa        |      13200 |
| igoudgir | idir        |      60000 |
+----------+-------------+------------+

-- pour modifier salaire*12 
SELECT nom, prenom, salaire*12 AS salaire_annuel  FROM employes;
+----------+-------------+----------------+
| nom      | prenom      | salaire_annuel |
+----------+-------------+----------------+

-- Afficher la somme des salaire de tous les employes
SELECT SUM(salaire*12) FROM employes;
+-----------------+
| SUM(salaire*12) |
+-----------------+
|          443700 |
+-----------------+

-- Afficher la moyenne
-- AVG est une fonction prédéfinie prenant comme argument( entre parenthese) le nom de la colone sur laquelle nous souhaitons calculer une moyenne
SELECT AVG(salaire) FROM employes;
+--------------+
| AVG(salaire) |
+--------------+
|         2465 |
+--------------+

-- ROUND est une fonction prédéfinie prenant comme argument( entre parenthese) le nombre à arrondir.
SELECT ROUND(AVG(salaire)) FROM employes;
+---------------------+
| ROUND(AVG(salaire)) |
+---------------------+
|                2465 |
+---------------------+


-- COUNT est une fonction qui permet de compter
SELECT COUNT(*) FROM employes WHERE sex='f';
+----------+
| COUNT(*) |
+----------+
|        8 |
+----------+

-- Isoler une valeur min ou max avec MIN/MAX
SELECT MAX(salaire) FROM employes;
+--------------+
| MAX(salaire) |
+--------------+
|         5000 |
+--------------+

SELECT MIN(salaire) FROM employes;
+--------------+
| MIN(salaire) |
+--------------+
|         1100 |
+--------------+

-- Pour avoir le salaire min et le nom de la personne 
SELECT prenom, salaire FROM employes WHERE salaire = (SELECT MIN(salaire)FROM employes);
+--------+---------+
| prenom | salaire |
+--------+---------+
| Assa   |    1100 |
+--------+---------+

-- Salaire égal a 5000
SELECT prenom, salaire FROM employes WHERE salaire = 5000;
+-------------+---------+
| prenom      | salaire |
+-------------+---------+
| Jean-Pierre |    5000 |
| idir        |    5000 |
+-------------+---------+

Tous les postes sauf (/!\ le = attend un seul information)
SELECT prenom, service FROM employes WHERE service NOT IN ('informatique', 'direction');
+-----------+--------------+
| prenom    | service      |
+-----------+--------------+
| Clement   | commercial   |
| Thomas    | commercial   |
| Cloe      | production   |
| Elodie    | secretariat  |
| Celine    | commercial   |
| Houda     | formation    |
| Sandra    | formation    |
| Thierry   | secretariat  |
| Benoit    | production   |
| Emilie    | commercial   |
| Stephanie | assistant    |
| Assa      | develloppeur |
| idir      | coordinateur |
+-----------+--------------+

SELECT prenom, nom, service, salaire FROM employes WHERE service='production' AND salaire=1900 OR salaire=2300; 
+---------+--------+------------+---------+
| prenom  | nom    | service    | salaire |
+---------+--------+------------+---------+
| Clement | Gallet | commercial |    2300 |
| Cloe    | Dubar  | production |    1900 |
+---------+--------+------------+---------+

SELECT prenom, nom, service, salaire FROM employes WHERE service='production' AND (salaire=1900 OR salaire=2300); 
+--------+-------+------------+---------+
| prenom | nom   | service    | salaire |
+--------+-------+------------+---------+
| Cloe   | Dubar | production |    1900 |
+--------+-------+------------+---------+

-- Compte les personne par service
 SELECT service, COUNT(*) AS nombre FROM employes GROUP BY service;
+--------------+--------+
| service      | nombre |
+--------------+--------+
| assistant    |      1 |
| commercial   |      4 |
| coordinateur |      1 |
| develloppeur |      1 |
| direction    |      1 |
| formation    |      2 |
| informatique |      1 |
| production   |      2 |
| secretariat  |      2 |
+--------------+--------+

-- Service avec plus de 1 employes 
SELECT service, COUNT(*) AS nombre FROM employes GROUP BY service HAVING COUNT(*) >1;
+-------------+--------+
| service     | nombre |
+-------------+--------+
| commercial  |      4 |
| formation   |      2 |
| production  |      2 |
| secretariat |      2 |
+-------------+--------+

-- Pour insertion
INSERT INTO employes (prenom, nom, sex, service, data_embauche, salaire) VALUES('Mariam', 'Camara', 'f', 'informatique', '1994-11-16', 9000);

INSERT INTO employes VALUES ('','Hatou-Massa', 'Traore', 'f', 'informatique', '1993-11-27', 8900);

-- Modifier salaire
UPDATE employes SET salaire = 2500 WHERE prenom = 'Hatou-Massa'; 

+-------------+-------------+----------+-----+--------------+---------------+---------+
| id_employes | prenom      | nom      | sex | service      | data_embauche | salaire |
+-------------+-------------+----------+-----+--------------+---------------+---------+
|         993 | Mariam      | Camara   | f   | informatique | 1994-11-16    |    9000 |
|         994 | Hatou-Massa | Traore   | f   | informatique | 1993-11-27    |    2500 |
+-------------+-------------+----------+-----+--------------+---------------+---------+

-- Supprimer par ID
DELETE FROM employes WHERE id_employes = 933;

-- Supprimer par services
DELETE FROM employes WHERE service = 'informatique';
+-------------+-------------+----------+-----+--------------+---------------+---------+
| id_employes | prenom      | nom      | sex | service      | data_embauche | salaire |
+-------------+-------------+----------+-----+--------------+---------------+---------+
|         350 | Jean-Pierre | Laborde  | m   | direction    | 1999-12-09    |    5000 |
|         388 | Clement     | Gallet   | m   | commercial   | 2000-01-15    |    2300 |
|         415 | Thomas      | Winter   | m   | commercial   | 2000-05-03    |    3350 |
|         417 | Cloe        | Dubar    | f   | production   | 2001-09-05    |    1900 |
|         491 | Elodie      | Fellier  | f   | secretariat  | 2002-02-22    |    1600 |
|         509 | Celine      | Perrin   | f   | commercial   | 2006-09-10    |    2700 |
|         630 | Houda       | Jaadar   | f   | formation    | 2017-01-20    |    2500 |
|         650 | Sandra      | Herisson | f   | formation    | 2018-09-24    |    1900 |
|         739 | Thierry     | Deprez   | m   | secretariat  | 2009-11-17    |    1900 |
|         900 | Benoit      | Lagarde  | m   | production   | 2013-01-03    |    2550 |
|         990 | Stephanie   | Lafaye   | f   | assistant    | 2015-06-02    |    1775 |
|         991 | Assa        | Traore   | f   | develloppeur | 2018-10-01    |    1100 |
|         992 | idir        | igoudgir | m   | coordinateur | 2018-12-12    |    5000 |
+-------------+-------------+----------+-----+--------------+---------------+---------+


-- --EXERCICE-- --
    --1 Afficher la profession de l'employé 547.
    --2 Afficher la date d'embauche de : Amandine.
    --3 Afficher le nombre de commerciaux.
    --4 Afficher le coût des commerciaux sur 1 année.
    --5 Afficher le salaire moyen par service.
    --6 Afficher le nombre de recrutements sur l'année 2010.
    --7 Augmenter le salaire pour chaque employé de 100€.
    --8 Afficher le nombre de services (différents).
    --9 Afficher les informations de l'employé du service commercial gagnant le salaire le plus élevé
    --10 Afficher l'employé ayant été embauché en dernier.


-- MEMO SUR LES REQUETES DE SELECTION SELECT
    -- SELECT / FROM / DISTINCT / WHERE / BETWEEN / CURDATE / LIKE / % / OPERATEUR DE COMPARAISON / ORDER BY / ASC / DESC / LIMIT / AS pour l'alias / SUM / AVG / ROUND / COUNT / MIN / MAX / IN / NOT IN / CONDITION MULTIPLE / HAVING /
-- MEMO SUR LES REQUETES DE SELECTION INSERT
    -- INSERT IN .... VALUES
-- MEMO SUR LES REQUETES DE SELECTION UPDATE
    --UPDATE..... SET....WHERE
-- MEMO SUR LES REQUETES DE SELECTION DELETE
    --DELETE FROM...WHERE....
-- EXERCICE REQUETES IMBRIQUEES
-- LES JOINTURES SQL
    -- Tout comme les requêtes imbriquées, les jointures SQL permettent d'effectuer des requêtes sur plusieurs tables.
    --l'avantage des jointures est que l'on peut obtenir dans le résulat final des colonnes/champ issue de plusieur tables différentes.



