/*Soit le schéma relationnel suivant :

ARTICLES (NOART, LIBELLE, STOCK, PRIXINVENT)
FOURNISSEURS (NOFOUR, NOMFOUR, ADRFOUR, VILLEFOUR)
ACHETER (NOFOUR#, NOART#, PRIXACHAT, DELAI)

Affichez les résultats suivants avec une solution SQL :
a) Numéros et libellés des articles dont le stock est inférieur à 10 ?
*/
SELECT a.noart,a.libelle,a.stock
FROM articles a
WHERE a.stock < 10;

/*b) Liste des articles dont le prix d'inventaire est compris entre 100 et 300 ?*/

