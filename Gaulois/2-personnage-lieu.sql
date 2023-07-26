/*2. Nombre de personnages par lieu (trié par nombre de personnages décroissant)*/

SELECT lieu.nom_lieu, COUNT(personnage.id_personnage) AS nombre_personnages
FROM lieu
LEFT JOIN personnage ON lieu.id_lieu = personnage.id_lieu
GROUP BY lieu.nom
ORDER BY nombre_personnages DESC;
