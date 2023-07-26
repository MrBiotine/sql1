/*8. Nom du ou des personnages qui ont pris le plus de casques dans la bataille 'Bataille du village
gaulois'*/
SELECT p.nom_personnage AS "Nom du personnage", SUM(pc.qte) AS "Quantité de casques pris"
FROM personnage p
INNER JOIN prendre_casque pc ON p.id_personnage = pc.id_personnage
INNER JOIN bataille b ON pc.id_bataille = b.id_bataille
WHERE b.nom_bataille = 'Bataille du village gaulois'
GROUP BY p.nom_personnage
ORDER BY SUM(pc.qte) DESC 
LIMIT 1;

/*
HAVING COUNT(pc.id_casque) = (
    SELECT MAX(cpt)
    FROM (
        SELECT COUNT(id_casque) AS cpt
        FROM prendre_casque
        INNER JOIN bataille ON prendre_casque.id_bataille = bataille.id_bataille
        WHERE bataille.nom_bataille = 'Bataille du village gaulois'
        GROUP BY id_personnage
    ) AS counts
);
*/

