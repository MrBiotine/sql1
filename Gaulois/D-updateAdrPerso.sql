/*D. Modifiez l'adresse de Zérozérosix : il a été mis en prison à Condate.*/
UPDATE personnage p 
SET adresse_personnage = 'prison', id_lieu =
	(SELECT id_lieu FROM lieu WHERE nom_lieu = 'Condate')
WHERE p.nom_personnage ='Zérozérosix';
        