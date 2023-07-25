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
SELECT a.noart,a.libelle,a.prixinvent
FROM articles a
WHERE a.prixinvent > 100 AND a.prixinvent < 300;

/*c) Liste des fournisseurs dont on ne connaît pas l'adresse ?*/
SELECT f.nofour,f.nomfour,f.adrfour AS adresse_inconnue
FROM fournisseurs f
WHERE f.adrfour IS null;

/*d) Liste des fournisseurs dont le nom commence par "STE" ?*/
SELECT f.nofour,f.nomfour AS ste_fournisseur
FROM fournisseurs f
WHERE f.nomfour LIKE "STE%";

/*e) Noms et adresses des fournisseurs qui proposent des articles pour lesquels le délai
d'approvisionnement est supérieur à 20 jours ?*/

SELECT f.nomfour,f.adrfour,a.delai
FROM fournisseurs f
INNER JOIN articles art
	ON f.nofour = art.noart
INNER JOIN acheter a
	ON f.nofour = a.nofour_id
WHERE a.delai > 20; 

/*f) Nombre d'articles référencés ?
*/
SELECT COUNT(a.noart) AS nombre_ref
FROM articles a;

/*g) Valeur du stock ?
*/
SELECT round(SUM(a.stock * a.prixinvent),2) AS valeur_stock 
FROM articles a;

/*h) Numéros et libellés des articles triés dans l'ordre décroissant des stocks ?
*/
SELECT a.noart,a.libelle,a.stock
FROM articles a
ORDER BY
	a.stock DESC;

/*i) Liste pour chaque article (numéro et libellé) du prix d'achat maximum, minimum et moyen
?
*/
SELECT art.noart, art.libelle,
		 MAX(a.prixachat) AS prix_max,MIN(a.prixachat) AS prix_min,round(AVG(a.prixachat),2) AS prix_moy
FROM articles art
INNER JOIN acheter a
	ON art.noart=a.noart_id
GROUP BY
	art.noart,
	art.libelle
ORDER BY 
	art.noart;

/*j) Délai moyen pour chaque fournisseur proposant au moins 2 articles ?*/
/*j) Délai moyen pour chaque fournisseur proposant au moins 2 articles ?*/
SELECT f.nomfour, AVG(a.delai) AS delai_moy
FROM acheter a
INNER JOIN fournisseurs f
	ON a.noart_id=f.nofour
GROUP BY f.nomfour
HAVING COUNT(a.noart_id) >= 2	
ORDER BY f.nomfour;



