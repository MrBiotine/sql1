/*13. Nom du / des lieu(x) possédant le plus d'habitants, en dehors du village gaulois.*/
SELECT l.nom_lieu AS "Nom du lieu", COUNT(p.id_personnage) AS "Nombre de personnages"
FROM personnage p
INNER JOIN lieu l ON p.id_lieu = l.id_lieu
WHERE l.nom_lieu != 'Village gaulois'
GROUP BY l.nom_lieu
HAVING COUNT(p.id_personnage) = (
-- Sous-requête pour obtenir le nombre maximum de personnages en dehors du village gaulois
    SELECT COUNT(p.id_personnage) AS "Nombre de personnages"
    FROM personnage p
    INNER JOIN lieu l ON p.id_lieu = l.id_lieu
    WHERE l.nom_lieu != 'Village gaulois'
    GROUP BY l.nom_lieu
    ORDER BY COUNT(p.id_personnage) DESC
   LIMIT 1 
);



