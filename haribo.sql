/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 
 */

/**
* Objectif : Créer dans PHPMyAdmin une base de données haribo dont la modélisation est ci-dessous, les étapes sont détaillées ensuite.
*/
MariaDB [(none)]> CREATE database haribo;
Query OK, 1 row affected (0.00 sec)
/**
+---------------+----------------+------+------+---------+----------------+
| Field         | Type           | Null | Key  | Default | Extra          |
+---------------+----------------+------+------+---------+----------------+
| id_stagiaire  | int(11)        | NO   | PRI  | NULL    | auto_increment |
| prenom        | varchar(100)   | NO   |      | NULL    |                |
| yeux          | varchar(30)    | NO   |      | NULL    |                |
| genre         | enum('h','f')  | NO   |      | NULL    |                |
+---------------+----------------+------+------+---------+----------------+

+---------------+----------------+------+------+---------+----------------+
| Field         | Type           | Null | Key  | Default | Extra          |
+---------------+----------------+------+------+---------+----------------+
| id_bonbon     | int(11)        | NO   | PRI  | NULL    | auto_increment |
| nom           | varchar(100)   | NO   |      | NULL    |                |
| saveur        | varchar(100)   | NO   |      | NULL    |                |

+---------------+----------------+------+------+---------+----------------+
| Field         | Type           | Null | Key  | Default | Extra          |
+---------------+----------------+------+------+---------+----------------+
| id_manger     | int(11)        | NO   | PRI  | NULL    | auto_increment |
| id_bonbon     | int(11)        | YES  |      | NULL    |                |
| id_stagiaire  | int(11)        | YES  |      | NULL    |                |
| date_manger   | date           | NO   |      | NULL    |                |
| quantite      | int(11)        | NO   |      | NULL    |                |
+---------------+----------------+------+------+---------+----------------+

* REQUETES A EFFECTUER dans PHPMyAdmin
*/

--1-- lister toutes les BDD de PHPMyAdmin
MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| assatraore         |
| bibliotheque       |
| cvwp               |
| entreprise         |
| haribo             |
| hotel              |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
11 rows in set (0.00 sec)


--2-- Créer une base de données SQL nommée HARIBO
MariaDB [(none)]> CREATE database haribo;
Query OK, 1 row affected (0.00 sec)

--3--
/**
* créer une table stagiaire
* qui comporte 3 champs :
* - id_stagiaire => nombre qui s'auto-incrémente, requis et clé primaire
* - prenom => 100 caractères, requis
* - couleur des yeux => 30 caractères, requis
* - genre => homme ou femme, requis
*/
CREATE TABLE stagiaires (id_stagiaire INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
prenom VARCHAR(100) NOT NULL, 
yeux VARCHAR(30) NOT NULL, 
genre ENUM('homme','femme') NOT NULL
);

--4--
/**
* insérer dans cette table les informations de votre groupe (faites un copier-coller des lignes ci-dessous) :
*/
INSERT INTO bonbons (nom, saveur) VALUES ('dragibus', 'cola');
INSERT INTO bonbons (nom, saveur) VALUES ('tagada', 'fraise');

--5--
/**
* créer une table bonbon
* qui comporte 3 champs :
* - id_bonbon => nombre qui s'auto-incrémente, requis et clé primaire
* - nom => 100 caractères, requis
* - saveur => 100 caractères, requis
*/
CREATE TABLE bonbons (id_bonbon INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom VARCHAR(100) NOT Null , 
saveur VARCHAR(100) NOT NULL
);
--6--
/**
* insérer dans cette table des bonbons haribo (faites un copier-coller des lignes ci-dessous) :
*/
INSERT INTO stagiaires (prenom, yeux, genre) VALUES ('jhordan', 'marron','h');
UPDATE stagiaires SET genre = 'homme' WHERE prenom = 'jhordan';
--7--
/**
* créer une table manger
* qui comporte 5 champs :
* - id_manger => nombre qui s'auto-incrémente, requis et clé primaire
* - id_stagiaire => champs de la table stagiaire
* - id_bonbon => champs de la table bonbon
* - date_manger => type date, requis
* - quantite => nombre, requis
*/
CREATE TABLE manger (id_manger INT(11) PRIMARY KEY AUTO_INCREMENT NULL,
id_stagiaire INT(11) DEFAULT NULL,
id_bonbon INT(11) DEFAULT NULL, 
date_manger DATE NOT NULL,
quantite INT(11) NOT NULL
);

--8--
/**
* insérer dans la table manger des informations sur qui a consommé quel bonbon, quand et dans quelles quantités (faites un copier-coller des lignes ci-dessous) :
*/
INSERT INTO manger (id_bonbon, id_stagiaire, date_manger, quantite) VALUES (4,7,'2018-09-20', 5);

--9-- Lister les tables de la BDD *haribo*
MariaDB [haribo]> show tables;
+------------------+
| Tables_in_haribo |
+------------------+
| bonbons          |
| manger           |
| stagiaires        |
+------------------+

--10-- voir les paramètres de la table *bonbon*
MariaDB [haribo]> desc bonbons;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| id_bonbon | int(11)      | NO   | PRI | NULL    | auto_increment |
| nom       | varchar(100) | NO   |     | NULL    |                |
| saveur    | varchar(100) | NO   |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
3 rows in set (0.01 sec)



--11-- Sélectionner tous les champs de tous les enregistrements de la table *stagiaire*
MariaDB [haribo]> SELECT * FROM stagiaires;
+--------------+---------+--------+-------+
| id_stagiaire | prenom  | yeux   | genre |
+--------------+---------+--------+-------+
|            1 | jhordan | marron |       |
+--------------+---------+--------+-------+
1 row in set (0.00 sec)


--12-- Rajouter un nouveau stagiaire *Patriiiick* en forçant la numérotation de l'id
INSERT INTO stagiaires (id_stagiaire, prenom) VALUES (100, 'Patriiiick');



INSERT INTO stagiaires (id_stagiaire, prenom, yeux, genre) VALUES (200,'sandra', 'marron', 'femme'), (20,'Pierre', 'marron', 'homme'),(98,'Jean', 'marron', 'homme'),(62,'Maro', 'marron', 'femme'), (75,'Demba', 'marron', 'homme');
INSERT INTO stagiaires (prenom, yeux, genre) VALUES ('houda', 'gris', 'femme'), ('brahima', 'vert', 'homme');

INSERT INTO stagiaires (id_stagiaire, prenom, yeux, genre) VALUES (5, 'Assa', 'bleu', 'femme');

--13-- Rajouter un nouveau stagiaire *Mila* SANS forcer la numérotation de l'id
INSERT INTO stagiaires (id_stagiaire, prenom) VALUES ('', 'Mila');

--14-- Changer le prénom du stagiaire qui a l'id 100 de *Patriiiick* à *Patrick*
UPDATE stagiaires SET prenom = 'Patrick' WHERE id_stagiaire = 100; 
MariaDB [haribo]> SELECT * FROM stagiaires;
+--------------+---------+--------+-------+
| id_stagiaire | prenom  | yeux   | genre |
+--------------+---------+--------+-------+
|            1 | jhordan | marron |       |
|          100 | Patrick |        | homme |
|          101 | Mila    |        | homme |
+--------------+---------+--------+-------+


--15-- Rajouter dans la table manger que Patrick a mangé 5 Tagada purpule le 15 septembre
INSERT INTO manger (id_bonbon, id_stagiaire, date_manger, quantite) VALUES (2,100,'2018-09-15', 5);
+-----------+--------------+-----------+-------------+----------+
| id_manger | id_stagiaire | id_bonbon | date_manger | quantite |
+-----------+--------------+-----------+-------------+----------+
|         3 |          100 |         2 | 2018-09-15  |        5 |
+-----------+--------------+-----------+-------------+----------+
1 row in set (0.00 sec)

--16-- Sélectionner tous les noms des bonbons
SELECT nom FROM bonbons;
+----------+
| nom      |
+----------+
| dragibus |
| tagada   |
+----------+

--17-- Sélectionner tous les noms des bonbons en enlevant les doublons
SELECT DISTINCT(nom) FROM bonbons;
+----------+
| nom      |
+----------+
| dragibus |
| tagada   |
+----------+

--18-- Récupérer les couleurs des yeux des stagiaires (Sélectionner plusieurs champs dans une table)
SELECT yeux FROM stagiaires;
MariaDB [haribo]> SELECT id_stagiaire, yeux, genre  FROM stagiaires;
+--------------+--------+-------+
| id_stagiaire | yeux   | genre |
+--------------+--------+-------+
|            1 | marron |       |
|          100 |        | homme |
|          101 |        | homme |
+--------------+--------+-------+
3 rows in set (0.00 sec)


--19-- Dédoublonner un résultat sur plusieurs champs

--20-- Sélectionner le stagiaire qui a l'id 5
SELECT prenom FROM stagiaires WHERE id_stagiaire = 5;
+--------+
| prenom |
+--------+
| Assa   |
+--------+
1 row in set (0.00 sec)

--21-- Sélectionner tous les stagiaires qui ont les yeux marrons
SELECT prenom, yeux FROM stagiaires WHERE yeux = 'marron';
+---------+--------+
| prenom  | yeux   |
+---------+--------+
| jhordan | marron |
+---------+--------+
1 row in set (0.00 sec)

--22-- Sélectionner tous les stagiaires dont l'id est plus grand que 9
SELECT prenom, id_stagiaire FROM stagiaires WHERE id_stagiaire >= 9;
+---------+--------------+
| prenom  | id_stagiaire |
+---------+--------------+
| Patrick |          100 |
| Mila    |          101 |
+---------+--------------+
2 rows in set (0.00 sec)

--23-- Sélectionner tous les stagiaires SAUF celui dont l'id est 13 (soyons supersticieux !) :!\ il y a 2 façons de faire
SELECT id_stagiaire, prenom FROM stagiaires WHERE id_stagiaire <> 13;
+--------------+---------+
| id_stagiaire | prenom  |
+--------------+---------+
|            1 | jhordan |
|            5 | Assa    |
|          100 | Patrick |
|          101 | Mila    |
+--------------+---------+
4 rows in set (0.00 sec)

--24-- Sélectionner tous les stagiaires qui ont un id inférieur ou égal à 10
SELECT prenom, id_stagiaire FROM stagiaires WHERE id_stagiaire <= 10;
+---------+--------------+
| prenom  | id_stagiaire |
+---------+--------------+
| jhordan |            1 |
| Assa    |            5 |
+---------+--------------+
2 rows in set (0.00 sec)

--25-- Sélectionner tous les stagiaires dont l'id est compris entre 7 et 11
SELECT prenom, id_stagiaire FROM stagiaires WHERE id_stagiaire BETWEEN 7 AND 11;
+--------+--------------+
| prenom | id_stagiaire |
+--------+--------------+
| Sandra |           10 |
| Serge  |           11 |
+--------+--------------+
2 rows in set (0.00 sec)
--26-- Sélectionner les stagiaires dont le prénom commence par un *S*
INSERT INTO stagiaires (id_stagiaire, prenom, yeux, genre) VALUES (10, 'Sandra', 'vert', 'femme'),(11, 'Serge', 'marron', 'homme') ;

SELECT prenom FROM stagiaires WHERE prenom LIKE 's%';
+--------+
| prenom |
+--------+
| Sandra |
| Serge  |
+--------+

--27-- Trier les stagiaires femmes par id décroissant
SELECT prenom, id_stagiaire FROM stagiaires WHERE genre = "femme" ORDER BY id_stagiaire DESC;
+--------+--------------+
| prenom | id_stagiaire |
+--------+--------------+
| Sandra |           10 |
| Assa   |            5 |
+--------+--------------+
2 rows in set (0.00 sec)


--28-- Trier les stagiaires hommes par prénom dans l'ordre alphabétique
SELECT prenom, id_stagiaire FROM stagiaires WHERE genre = "homme" ORDER BY prenom;
+---------+--------------+
| prenom  | id_stagiaire |
+---------+--------------+
| Mila    |          101 |
| Patrick |          100 |
| Serge   |           11 |
+---------+--------------+
3 rows in set (0.00 sec)

--29-- Trier les stagiaires en affichant les femmes en premier et en classant les couleurs des yeux dans l'ordre alphabétique
UPDATE stagiaires SET genre = 'homme' WHERE prenom = 'jhordan';






SELECT prenom, id_stagiaire, genre, yeux FROM stagiaires ORDER BY genre AND yeux ASC;






--30-- Limiter l'affichage d'une requête de sélection de tous les stagiaires aux 3 premires résultats
SELECT prenom, id_stagiaire FROM stagiaires LIMIT 1,3;
+--------+--------------+
| prenom | id_stagiaire |
+--------+--------------+
| Assa   |            5 |
| Sandra |           10 |
| Serge  |           11 |
+--------+--------------+
3 rows in set (0.00 sec)

--31-- Limiter l'affichage d'une requête de sélection de tous les stagiaires à partir du 3ème résultat et des 5 suivants

SELECT prenom, id_stagiaire FROM stagiaires LIMIT 3,5;
+---------+--------------+
| prenom  | id_stagiaire |
+---------+--------------+
| Serge   |           11 |
| Patrick |          100 |
| Mila    |          101 |
| houda   |          102 |
| brahima |          103 |
+---------+--------------+
5 rows in set (0.00 sec)

--32-- Afficher les 4 premiers stagiaires qui ont les yeux marron
SELECT prenom, id_stagiaire, yeux FROM stagiaires WHERE yeux = 'marron' LIMIT 1,4;
+--------+--------------+--------+
| prenom | id_stagiaire | yeux   |
+--------+--------------+--------+
| Serge  |           11 | marron |
| Pierre |           20 | marron |
| Maro   |           62 | marron |
| Demba  |           75 | marron |
+--------+--------------+--------+
4 rows in set (0.00 sec)




--33-- Pareil mais en triant les prénoms dans l'ordre alphabétique
SELECT prenom, id_stagiaire, yeux FROM stagiaires WHERE yeux='marron' ORDER BY premon ASC LIMIT 1,4;




--34-- Compter le nombre de stagiaires
SELECT COUNT(*) FROM stagiaires;
+----------+
| COUNT(*) |
+----------+
|       13 |
+----------+
1 row in set (0.00 sec)

--35-- Compter le nombre de stagiaires hommes mais en changeant le nom de la colonne de résultat par *nb_stagiaires_H*
SELECT COUNT(*) AS 'nb_stagiaires_H' FROM stagiaires WHERE genre='homme';
+-----------------+
| nb_stagiaires_H |
+-----------------+
|               8 |
+-----------------+

--36-- Compter le nombre de couleurs d'yeux différentes
SELECT yeux, COUNT(yeux) FROM stagiaires GROUP BY yeux;
+--------+-------------+
| yeux   | COUNT(yeux) |
+--------+-------------+
|        |           2 |
| bleu   |           1 |
| gris   |           1 |
| marron |           7 |
| vert   |           2 |
+--------+-------------+

--37-- Afficher le prénom et les yeux du stagiaire qui a l'id le plus petit
SELECT prenom, yeux, id_stagiaire FROM stagiaires WHERE id_stagiaire = (SELECT MIN(id_stagiaire)FROM stagiaires);
+---------+--------+--------------+
| prenom  | yeux   | id_stagiaire |
+---------+--------+--------------+
| jhordan | marron |            1 |
+---------+--------+--------------+

--38-- Afficher le prénom et les yeux du stagiaire qui a l'id le plus grand /!\ c'est une requête imbriquée qu'il faut faire (requête sur le résultat d'une autre requête)
SELECT prenom, yeux, id_stagiaire FROM stagiaires WHERE id_stagiaire = (SELECT MAX(id_stagiaire)FROM stagiaires);
+--------+--------+--------------+
| prenom | yeux   | id_stagiaire |
+--------+--------+--------------+
| sandra | marron |          200 |
+--------+--------+--------------+
1 row in set (0.00 sec)

--39-- Afficher les stagiaires qui ont les yeux bleu et vert
SELECT premon, yeux FROM stagiaires WHERE yeux IN ('bleu','vert');




--40-- A l'inverse maintenant, afficher les stagiaires qui n'ont pas les yeux bleu ni vert
SELECT prenom, yeux FROM stagiaires WHERE yeux NOT IN ('vert', 'bleu');
+---------+--------+
| prenom  | yeux   |
+---------+--------+
| jhordan | marron |
| Serge   | marron |
| Pierre  | marron |
| Maro    | marron |
| Demba   | marron |
| Jean    | marron |
| Patrick |        |
| Mila    |        |
| houda   | gris   |
| sandra  | marron |
+---------+--------+


19 29 33
--41-- récupérer tous les stagiaires qui ont mangé des bonbons, avec le détail de leurs consommations


--42-- récupérer que les stagiaires qui ont mangé des bonbons, avec le détail de leurs consommations

--43-- prénom du stagiaire, le nom du bonbon, la date de consommation pour tous les stagiaires qui ont mangé au moins une fois


--44-- Afficher les quantités consommées par les stagiaires (uniquement ceux qui ont mangé !)

--45-- Calculer combien de bonbons ont été mangés au total par chaque stagiaire et afficher le nombre de fois où ils ont mangé

--46-- Afficher combien de bonbons ont été consommés au total

--47-- Afficher le total de *Tagada* consommées

--48-- Afficher les prénoms des stagiaires qui n'ont rien mangé

--49-- Afficher les saveurs des bonbons (sans doublons)

--50-- Afficher le prénom du stagiaire qui a mangé le plus de bonbons