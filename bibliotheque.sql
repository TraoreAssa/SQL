--------------------------------------------------- Creation ---------------------------------------------------
CREATE DATABASE IF NOT EXISTS  bibliotheque ;

USE bibliotheque ;

CREATE TABLE abonne (
 id_abonne INT(3) NOT NULL AUTO_INCREMENT,
 prenom VARCHAR(20) NOT NULL,
 PRIMARY KEY (id_abonne)
) ENGINE=InnoDB ;

CREATE TABLE emprunt (
 id_emprunt INT(3) NOT NULL AUTO_INCREMENT,
 id_livre INT(3) DEFAULT NULL,
 id_abonne INT(3) DEFAULT NULL,
 date_sortie DATE NOT NULL,
 date_rendu DATE DEFAULT NULL,
 PRIMARY KEY  (id_emprunt)
) ENGINE=InnoDB ;

CREATE TABLE livre (
 id_livre INT(3) NOT NULL AUTO_INCREMENT,
 auteur VARCHAR(30) NOT NULL,
 titre VARCHAR(30) NOT NULL,
 PRIMARY KEY (id_livre)
) ENGINE=InnoDB ;

INSERT INTO abonne (id_abonne, prenom) VALUES
(1, 'Guillaume'),
(2, 'Benoit'),
(3, 'Chloe'),
(4, 'Laura');

INSERT INTO livre (id_livre, auteur, titre) VALUES
(100, 'GUY DE MAUPASSANT', 'Une vie'),
(101, 'GUY DE MAUPASSANT', 'Bel-Ami '),
(102, 'HONORE DE BALZAC', 'Le père Goriot'),
(103, 'ALPHONSE DAUDET', 'Le Petit chose'),
(104, 'ALEXANDRE DUMAS', 'La Reine Margot'),
(105, 'ALEXANDRE DUMAS', 'Les Trois Mousquetaires');

INSERT INTO emprunt (id_emprunt, id_livre, id_abonne, date_sortie, date_rendu) VALUES
(1, 100, 1, '2014-12-17', '2014-12-18'),
(2, 101, 2, '2014-12-18', '2014-12-20'),
(3, 100, 3, '2014-12-19', '2014-12-22'),
(4, 103, 4, '2014-12-19', '2014-12-22'),
(5, 104, 1, '2014-12-19', '2014-12-28'),
(6, 105, 2, '2015-03-20', '2015-03-26'),
(7, 105, 3, '2015-06-13', NULL),
(8, 100, 2, '2015-06-15', NULL);

--------------------------------------------------- Application ---------------------------------------------------

SELECT a.prenom, e.date_sortie, e.date_rendu 
FROM abonne a, emprunt e 
WHERE a.id_abonne=e.id_abonne 
AND a.prenom="guillaume";
+-----------+-------------+------------+
| prenom    | date_sortie | date_rendu |
+-----------+-------------+------------+
| Guillaume | 2014-12-17  | 2014-12-18 |
| Guillaume | 2014-12-19  | 2014-12-28 |
+-----------+-------------+------------+
--Explications :
----
-- Ligne 1 - SELECT - Nous selectionnons les champs que nous souhaitons obtenir dans le résultat, c'est à dire : prenom, date_sortie, date_rendu
-- Sur cette même ligne, vous pourrez noter l'utilisation de préfixe a., e. Pour le moment ces préfixes ne correspondent à rien.

-- Ligne 2 - FROM - Nous annonçons les tables dont nous aurons besoin pour réussir notre requête, dans notre cas : abonne, emprunt.
-- Sur cette même ligne, vous pouvez constater la définition des préfixes "abonne a", "emprunt e", cela permet au système de comprendre que le "e" représente la table emprunt et que le "a" représente la table abonne.
-- L'avantage des préfixes est de pouvoir donner un nom plus court (1 ou plusieurs lettres) aux tables afin de les représenter, nous garderons à l'esprit que le format idéal c'est : bdd.table.champ.
-- Cela sera légérement plus long à écrire mais cela aura l'avantage d'être clair pour quelqu'un qui nous rejoindrait sans connaitre la modélisation par coeur (surtout dans le cas de modélisation complexe, ça aide).
-- Il faudra garder à l'esprit qu'on utilise d'abord les préfixes (sur la ligne n°1) avant de les définir (sur la ligne n°2)

-- Ligne 3 - WHERE - La condition WHERE permet d'assurer le croisement des données entre la table abonne et la table emprunt.
-- Nous passons par notre champ commun id_abonne. C'est précisément ce qui permet d'effectuer notre jointure.

-- Ligne 4 - AND - La condition AND permet d'appliquer une condition complémentaire, dans notre cas nous souhaitions connaitre les dates de passages de Guillaume.

SELECT date_sortie, date_rendu FROM emprunt WHERE id_abonne =(SELECT id_abonne FROM abonne WHERE prenom="guillaume");
+-------------+------------+
| date_sortie | date_rendu |
+-------------+------------+
| 2014-12-17  | 2014-12-18 |
| 2014-12-19  | 2014-12-28 |
+-------------+------------+
--/!\
-- nous pouvons tout faire avec une jointure, ce qui n'est pas le cas de la requête imbriquée.
-- nous utiliserons quand même la requete imbriquée si nous visons uniquement des colonnes d'une seule table dans le résultat final (plus optimisé)

SELECT e.date_sortie, e.date_rendu FROM emprunt e, livre l WHERE l.id_livre=e.id_livre AND l.auteur='Alphonse Daudet';
+-------------+------------+
| date_sortie | date_rendu |
+-------------+------------+
| 2014-12-19  | 2014-12-22 |
+-------------+------------+

SELECT date_sortie, date_rendu FROM emprunt WHERE id_livre=(select id_livre from livre where auteur ='Alphonse Daudet');
+-------------+------------+
| date_sortie | date_rendu |
+-------------+------------+
| 2014-12-19  | 2014-12-22 |
+-------------+------------+

-- Qui a emprunté le livre 'Une Vie' sur l'année 2014 ?
SELECT a.prenom, e.date_sortie, l.titre
FROM abonne a, livre l, emprunt e
WHERE l.id_livre=e.id_livre
AND a.id_abonne=e.id_abonne
AND l.titre="Une Vie"
AND e.date_sortie>"2014-01-01"
AND e.date_sortie<"2014-12-31";
+-----------+-------------+---------+
| prenom    | date_sortie | titre   |
+-----------+-------------+---------+
| Guillaume | 2014-12-17  | Une vie |
| Chloe     | 2014-12-19  | Une vie |
+-----------+-------------+---------+
SELECT a.prenom
FROM abonne a, emprunt e, livre l
WHERE l.id_livre = e.id_livre
AND e.id_abonne = a.id_abonne
AND l.titre = 'Une vie'
AND e.date_sortie LIKE '2014%';
+-----------+
| prenom    |
+-----------+
| Guillaume |
| Chloe     |
+-----------+
--Explications :
----
--Ligne 1 - SELECT - Nous selectionnons les champs que nous souhaitons obtenir dans le résultat : prenom (nous utilisons des préfixes)
--Ligne 2 - FROM - Nous annonçons les tables dont nous aurons besoin pour réussir notre requête, dans notre cas : abonne, livre, emprunt. (nous définissons les préfixes)
--Ligne 3 - WHERE - La condition WHERE permet d'assurer le croisement des données entre la table livre et la table emprunt. Nous passons par notre champ commun id_livre.
--Ligne 4 - AND - La condition AND permet également d'effectuer une jointure, cette fois-ci entre la table abonne et la table emprunt. Nous passons par notre champ commun id_abonne.
--Ligne 5 - AND - La condition AND permet de cibler le livre ayant pour titre "Une vie" (conformément à la demande de départ).
--Ligne 6 - AND - La condition AND permet de cibler la date de sortie à l'année 2014 (conformément à la demande de départ).


SELECT prenom FROM abonne WHERE id_abonne IN (SELECT id_abonne FROM emprunt WHERE date_sortie LIKE '2014%' AND id_livre = (SELECT id_livre FROM livre WHERE titre='une vie'));
+-----------+
| prenom    |
+-----------+
| Guillaume |
| Chloe     |
+-----------+

-- Afficher le nombre de livres empruntés par chaque abonné
-- e = table emprunt et a = table abonne !

SELECT a.prenom, COUNT(e.id_livre) AS 'nombre de livre emprunte'
FROM emprunt e, abonne a -- e et a nous définissons des préfixe pour les appeler a la 
WHERE e.id_abonne=a.id_abonne 
GROUP BY a.id_abonne;
+-----------+--------------------------+
| prenom    | nombre de livre emprunte |
+-----------+--------------------------+
| Guillaume |                        2 |
| Benoit    |                        3 |
| Chloe     |                        2 |
| Laura     |                        1 |
+-----------+--------------------------+
--Explications :
----
--Ligne 1 - SELECT - Nous selectionnons le champ prenom et comptons le nombre de références id_livre dans la table emprunt (nous aurions pu choisir n'importe quel champ de la table emprunt pour ce calcul). Nous utilisons des préfixes.

--Ligne 2 - FROM - Nous annonçons les tables dont nous aurons besoin pour réussir notre requête, dans notre cas : abonne, emprunt. (nous définissons les préfixes)

--Ligne 3 - WHERE - La condition WHERE permet d'assurer le croisement des données entre la table abonne et la table emprunt. Nous passons par notre champ commun id_abonne.

--Ligne 4 - GROUP BY - Cette ligne nous permet de faire des regroupements pour répartir le calcul pour chacun des abonnés.

-- Ajout d'un nouvelle Abonnes
INSERT INTO abonne (prenom) VALUES
('Alex');
SELECT * FROM abonne;
+-----------+-----------+
| id_abonne | prenom    |
+-----------+-----------+
|         1 | Guillaume |
|         2 | Benoit    |
|         3 | Chloe     |
|         4 | Laura     |
|         5 | Alex      |
+-----------+-----------+

--  Afficher le prenom des abonnés avec le numéro des livres qu'ils ont emprunté. 
 
SELECT ab.prenom, em.id_livre
FROM emprunt em, abonne ab
WHERE ab.id_abonne=em.id_abonne;
+-----------+----------+
| prenom    | id_livre |
+-----------+----------+
| Guillaume |      100 |
| Guillaume |      104 |
| Benoit    |      101 |
| Benoit    |      105 |
| Benoit    |      100 |
| Chloe     |      100 |
| Chloe     |      105 |
| Laura     |      103 |
+-----------+----------+

--*********************************** Jointure EXTERNE ***********************************--

-- Afficher le prenom des abonnés avec le numéro des livres qu'ils ont emprunté. 
SELECT abonne.prenom, emprunt.id_livre
FROM abonne LEFT JOIN emprunt -- FROM- LEFT JOIN la table placée à gauche rapatriés (sans correspondance exigée dans l'autre table)
ON abonne.id_abonne=emprunt.id_abonne; -- ON- la condition se fait par le mot clé ON et non plus WHERE dans le cadre d'une requête externe type LEFT JOIN RIGH JOIN (FULL n'etant pas valable sous MySQL).
+-----------+----------+
| prenom    | id_livre |
+-----------+----------+
| Guillaume |      100 |
| Benoit    |      101 |
| Chloe     |      100 |
| Laura     |      103 |
| Guillaume |      104 |
| Benoit    |      105 |
| Chloe     |      105 |
| Benoit    |      100 |
| Alex      |     NULL |
+-----------+----------+

-- UNION
SELECT auteur AS 'Liste personne physique' FROM livre UNION SELECT prenom FROM abonne;
+-------------------------+
| Liste personne physique |
+-------------------------+
| GUY DE MAUPASSANT       |
| HONORE DE BALZAC        |
| ALPHONSE DAUDET         |
| ALEXANDRE DUMAS         |
| Guillaume               |
| Benoit                  |
| Chloe                   |
| Laura                   |
| Alex                    |
+-------------------------+

---LES FONCTIONS
-- Les fonctions prédéfinie;
SELECT CURDATE(); -- Affiche la date courante
SELECT CURDATE() + 0; -- Affiche la date sans tirets
SELECT CURTIME(); -- Affiche l'heure 
SELECT NOW(); -- Affiche la date et l'heure
SELECT DATE_ADD('2018-12-13', INTERVAL 31 DAY); -- Affiche la date  future avec 31 jours de plus
SELECT DATE_FORMAT('2018-12-13 17:02:00', '%d/%m/%Y - %H:%i:%s'); -- Changer le format heure et date

SELECT *, DATE_FORMAT(date_rendu,'le %d/%m/%Y')FROM emprunt; -- Changer le format de la date dans ma table emprunt
+------------+----------+-----------+-------------+------------+---------------------------------------+
| id_emprunt | id_livre | id_abonne | date_sortie | date_rendu | DATE_FORMAT(date_rendu,'le %d/%m/%Y') |
+------------+----------+-----------+-------------+------------+---------------------------------------+
|          1 |      100 |         1 | 2014-12-17  | 2014-12-18 | le 18/12/2014                         |
|          2 |      101 |         2 | 2014-12-18  | 2014-12-20 | le 20/12/2014                         |
|          3 |      100 |         3 | 2014-12-19  | 2014-12-22 | le 22/12/2014                         |
|          4 |      103 |         4 | 2014-12-19  | 2014-12-22 | le 22/12/2014                         |
|          5 |      104 |         1 | 2014-12-19  | 2014-12-28 | le 28/12/2014                         |
|          6 |      105 |         2 | 2015-03-20  | 2015-03-26 | le 26/03/2015                         |
|          7 |      105 |         3 | 2015-06-13  | NULL       | NULL                                  |
|          8 |      100 |         2 | 2015-06-15  | NULL       | NULL                                  |
+------------+----------+-----------+-------------+------------+---------------------------------------+

SELECT CONCAT ('a', 'b', 'c');
+------------------------+
| CONCAT ('a', 'b', 'c') |
+------------------------+
| abc                    |
+------------------------+

SELECT CONCAT_WS ('-','a', 'b', 'c');
+-------------------------------+
| CONCAT_WS ('-','a', 'b', 'c') |
+-------------------------------+
| a-b-c                         |
+-------------------------------+

SELECT LENGTH('Assa');
+----------------+
| LENGTH('Assa') |
+----------------+
|              4 |
+----------------+

SELECT SUBSTRING('Bonjour', 4);
+-------------------------+
| SUBSTRING('Bonjour', 4) |
+-------------------------+
| jour                    |
+-------------------------+

SELECT TRIM('       Bonjour'); --Supprime les espaces en debut et fin de caracteres
+------------------------+
| TRIM('       Bonjour') |
+------------------------+
| Bonjour                |
+------------------------+

SELECT DATABASE(); -- indique quel BDD est encoure

SELECT LAST_INSERT_ID(); -- Indique quel est le dernier identifiant généré par une base de données (après une requete INSERT)

SELECT PASSWORD('mypass');
+-------------------------------------------+
| PASSWORD('mypass')                        |
+-------------------------------------------+
| *6C8989366EAF75BB670AD8EA7A7FC1176A95CEF4 |
+-------------------------------------------+



--------------------- FONCTIONS UTILISATEURS ---------------------












