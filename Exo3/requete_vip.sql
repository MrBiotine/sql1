/*j) Délai moyen pour chaque fournisseur proposant au moins 2 articles ?*/
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
	
