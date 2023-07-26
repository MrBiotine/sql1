/*11. Combien existe-t-il de casques de chaque type et quel est leur coût total ? (classés par
nombre décroissant)*/
SELECT ec.nom_type_casque AS "Type de casque", COUNT(c.id_casque) AS "Nombre de casques",
       SUM(c.cout_casque) AS "Coût total"
FROM casque c
INNER JOIN type_casque ec ON c.id_type_casque = ec.id_type_casque
GROUP BY ec.nom_type_casque
ORDER BY COUNT(c.id_casque) DESC;

