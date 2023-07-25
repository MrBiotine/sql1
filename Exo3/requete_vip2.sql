/*j) Délai moyen pour chaque fournisseur proposant au moins 2 articles ?*/
SELECT f.nomfour, AVG(a.delai) AS delai_moy
FROM acheter a
INNER JOIN fournisseurs f
	ON a.noart_id=f.nofour
GROUP BY f.nomfour
HAVING COUNT(a.noart_id) >= 2	
ORDER BY f.nomfour;
