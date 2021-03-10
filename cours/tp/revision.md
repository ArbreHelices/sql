# Revision

## Exercice nouvelle colonne

1. Ajoutez la colonne salary, salaire annuel, dans la table pilots, définissez son type. Vous donnerez la requête SQL pour modifier la table. Puis faites une requête pour ajouter les salaires respectifs suivants :

```text
+--------+--------+
| name   | salary |
+--------+--------+
| Alan   |  2000  |
| Tom    |  1500  |
| Yi     |  1500  |
| Sophie |  2000  |
| Albert |  2000  |
| Yan    |  1500  |
| Benoit |  2000  |
| Jhon   |  3000  |
| Pierre |  3000  |
+--------+--------+
```

## Exercice 1

1. Quel est le salaire moyen.

2. Calculez le salaire moyen par compagnie.

3. Quels sont les pilots qui sont au-dessus du salaire moyen.

4. Calculez l'étendu des salaires.

5. Quels sont les noms des compagnies qui payent leurs pilotes au-dessus de la moyenne ?

6. Quels sont les pilotes qui par compagnie dépasse(nt) le salaire moyen ?

## Exercice 2

1. Faites une requête qui diminue de 40% le salaire des pilotes de la compagnie AUS.

2. Vérifiez que les salaires des pilotes australiens sont tous inférieurs aux autres salaires des pilotes des autres compagnies.

## Exercice 3

Reprendre la table pilots avec la nouvelle clé étrangère lead_pl. Répondez aux questions suivantes.

1. Sélectionnez tous les pilotes n'ayant pas de chef

2. Sélectionnez tous les pilotes ayant un chef

## Exercices de recherche 1/2

Pour chaque question ci-dessous créez la requête :

1. On aimerait savoir quels sont les types d'avions en commun que la compagnie AUS et FRE1 exploitent.

Indications : l'intersection de deux ensembles en MySQL s'implémente comme suit :

```sql
SELECT DISTINCT value FROM `table1`
WHERE value IN (
  SELECT value 
  FROM `table2`
);
```

2. Quels sont les types d'avion que ces deux compagnies AUS et FRE1 exploitent (c'est l'UNION ici) ?

Indications : Pensez à utiliser l'opérateur UNION.