/*10. Nom de la bataille où le nombre de casques pris a été le plus important.*/
SELECT b.nom_bataille AS "Nom de la bataille", SUM(pc.qte) AS "nombre de casques pris"
FROM bataille b
INNER JOIN prendre_casque pc ON b.id_bataille = pc.id_bataille
GROUP BY b.nom_bataille
HAVING SUM(pc.qte) = (
    SELECT MAX(total_casques)
    FROM (
        SELECT p.id_bataille, SUM(p.qte) AS total_casques
        FROM prendre_casque p
        GROUP BY p.id_bataille
    ) AS casque_taken
);
