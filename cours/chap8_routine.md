# Procdures stockées (stored procedure )

Lorsque vous avez une requête qui doit-être exécutée plusieurs fois par jour par différents utilisateurs, vous pouvez utiliser une procdéure stockée. Une procédure stockée est équivalent à la notion de fonction dans d'autres langages.

```sql
DELIMITER |
CREATE PROCEDURE pilots_compagny (IN comp CHAR(4))
BEGIN
    SELECT name, salary
    FROM pilots
    WHERE compagny = comp;
END |
DELIMITER ; 
```

Attention vous devez remettre le délimiteur par défaut à la fin de la procédure.

Vous commencerez une procédure stockée par BEGIN et la terminerée par END. Vous devez utiliser un délimiter différent de ";"

Le mot réservé IN indique un paramètre entrant dans la procédure. Vous avez également le mot réservé OUT ou INOUT pour les paramètres sortant ou entrant/sortant.

Notez que si vous ne précisez pas le paramètre entrant/sortant il sera par défaut entrant. Vous devez comme pour une fonction donnez un nom et un type.

Dans votre terminal vous pouvez maintenant appeler la procédure comme suit :

```sql
CALL pilots_compagny('AUS');
```

Pour supprimer votre procédure vous devez taper la ligne de code suivante :

```bash
DROP PROCEDURE pilots_compagny;
```

## Paramètre sortant

Voici la syntaxe pour un paramètre sortant, attention le paramètre sortant ne peut avoir qu'une seule valeur sortante. Vous créez plusieurs paramètres sortants.

```sql
DELIMITER |
CREATE PROCEDURE get_count (OUT nb INT) 
    BEGIN
        SELECT COUNT(*) INTO nb FROM pilots;
    END
    |
DELIMITER ; 
```

Dans MySQL sur la base db_aviation, vous devez tapez la ligne de commande suivante pour exécuter la procédure :

```sql
set @n = '';
CALL get_count(@n);
SELECT @n;
```

## Exercices

1. Créez une procédure qui affiche la liste des pilotes

2. Créez une procédure qui affiche les compagnies qui employent plus de 2 pilotes.

3. Créez une procédure qui affiche les compagnies qui n'ont pas de pilote.

4. Créez une procédure qui affiche la somme des heures de vols pour un pilote.

5. Créez une procédure qui affiche les pilotes d'une compagnie donnée.

6. Créez une procédure qui affiche les noms des pilotes avec leurs bonus ordonnées par ordre décroissant de bonus.

7. Créez une procédure permettant de calculer la moyenne des salaires des pilotes d'une compagnie donnée.

8. Créez une procédure qui retourne 1 ou 0 si la compagnie a respectivement des pilotes ou aucun pilote.

Voyez les indications en fin de documents

## Exercice algo

Créez une procédure afin de déterminer si on a un nombre pair ou impair de ligne dans la table pilots. 

## Indications

Pour compter le nombre de ligne(s) vous pouvez utiliser la commande suivante :

```sql
SELECT @row:=@row+1 as `row` 
FROM pilots , (SELECT @row:=0) AS r;
```

Vous pouvez également dans la procédure stockée utiliser des conditions voyez les syntaxes suivantes :

```sql
IF condition THEN
    -- TODO
ELSE
    -- TODO
END IF;
```

Et enfin vous pouvez définir des variables dans la procédures comme suit :

```sql
DECLARE s INT DEFAULT 0;
```