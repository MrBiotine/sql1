/*9. Nom des personnages et leur quantité de potion bue (en les classant du plus grand buveur
au plus petit).*/
SELECT p.nom_personnage AS "Nom du personnage", SUM(bp.dose_boire) AS "Quantité de potion bue"
FROM personnage p
INNER JOIN BOIRE bp ON p.id_personnage = bp.id_personnage
GROUP BY p.nom_personnage
ORDER BY SUM(bp.dose_boire) DESC;
