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







