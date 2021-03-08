
/* Sélectionnez tous les pilotes de la compagnie AUS */

SELECT name FROM pilots WHERE compagny = 'AUS';


/* Sélectionnez les noms des pilotes de la compagnie FRE1 ayant fait plus de 15 heures de vols.  */


SELECT name FROM pilots WHERE compagny = 'FRE1' AND numFlying > 15;

/* Sélectionnez les noms des pilotes de la compagnie FRE1 ayant fait plus de 20 heures de vols.  */

SELECT name FROM pilots WHERE compagny = 'FRE1' AND numFlying > 20;

/*
sélectionnez les pilotes de la compagnie FRE1 ou FRE2 
ayant fait plus de 20 heures de vols.
*/

SELECT name FROM pilots
WHERE (compagny = 'FRE1' OR compagny = 'FRE2' ) AND numFlying > 20;

/*
Sélectionnez les pilotes de la compagnie FRE1 ou FRE2 ayant fait plus de 20 de vols
*/

SELECT name FROM pilots
WHERE compagny = 'FRE1' OR compagny =   'FRE2'  AND numFlying > 20;

/*

Sélectionnez les pilotes ayant fait entre 190 et 200 heures de vols. 
*/

SELECT name 
FROM pilots
WHERE numFlying BETWEEN 190 AND 200;

/*
- Sélectionnez tous les pilotes qui sont dans les compagnies : AUS et FRE1.
*/

SELECT * 
FROM pilots 
WHERE compagny IN ('AUS', 'FRE1');

/*
- Sélectionnez tous les pilotes dont le nom de la compagnie contient un A.
*/

SELECT * 
FROM pilots
WHERE compagny LIKE '%a%';

/*
- Sélectionnez tous les pilotes dont le nom de la compagnie commence par un F.
*/

SELECT * 
FROM pilots
WHERE compagny LIKE 'F%';

/*
- Sélectionnez tous les pilotes dont le nom de la compagnie contient un I 
suivi d'un caractère.
*/

SELECT *  
FROM pilots 
WHERE compagny LIKE '%I_';

/*
Exercice supplémentaire avec une Regex ceci permet d'extraire des sous-chaînes
Tous les pilotes dont le nom de la compagnie se termine par I suivi de 2 caractères exactement
*/

SELECT * FROM 
pilots WHERE 
-- . désigne n'importe quel caractère * en nombre quelconque {2} deux exactement
-- ^ et $ respectivement commence et se termine
compagny REGEXP '^.*I.{2}$';

/*
Ajoutez une colonne bonus à la table pilots, puis ajoutez le bonus 1000
pour les certificats 'ct-1', 'ct-11', 'ct-12' et les autres 500.
*/

ALTER TABLE pilots ADD COLUMN bonus DECIMAL(5,1) AFTER name;

UPDATE pilots
SET bonus = 1000
WHERE certificate IN ('ct-1', 'ct-11', 'ct-12');

UPDATE pilots
SET bonus = 500
WHERE certificate NOT IN ('ct-1', 'ct-11', 'ct-12', 'ct-56');

UPDATE pilots
SET bonus = 2000
WHERE certificate = 'ct-56';

/*
Faites une requête permettant de sélectionner le pilote ayant eu le meilleur bonus.
*/

SELECT name
FROM pilots
WHERE bonus = (SELECT max(bonus) FROM pilots);

--- Dates
-- Sélectionnez les noms des pilotes qui sont nés après 1978.

SELECT name, birth_date FROM pilots WHERE birth_date > '1979';

-- Sélectionnez les noms des pilotes qui sont nés avant 1978.

SELECT name, birth_date FROM pilots WHERE birth_date < '1978';

--  Sélectionnez les noms des pilotes qui sont nés entre 1978 et 2000.

SELECT name, birth_date FROM pilots WHERE birth_date < '2001' AND birth_date > '1978' ;



--  Quels sont les pilotes qui ont un vol programmé après 2020-05-08 ?
-- SELECT DATE_ADD('2020-05-08 23:59:59', INTERVAL 1 SECOND);
SELECT name, next_flight FROM pilots WHERE next_flight > '2020-05-08 23:59:59';

/* Commande équivalente */

SELECT name, next_flight FROM pilots WHERE next_flight > '2020-05-09';
