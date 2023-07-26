/*4. Nom des spécialités avec nombre de personnages par spécialité (trié par nombre de
personnages décroissant).*/

SELECT s.nom_specialite, COUNT(p.id_personnage) AS nombre_personnages
FROM specialite s
INNER JOIN personnage p ON s.id_specialite = p.id_specialite
GROUP BY s.nom_specialite
ORDER BY COUNT(p.id_personnage) DESC;
