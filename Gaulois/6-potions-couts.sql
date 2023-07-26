/*6.Nom des potions + coût de réalisation de la potion (trié par coût décroissant).*/

SELECT p.nom_potion AS "nom de la potion", SUM(i.cout_ingredient) AS "coût de la potion"
FROM potion p
INNER JOIN composer c ON p.id_potion = c.id_potion
INNER JOIN ingredient i ON c.id_ingredient = i.id_ingredient
GROUP BY p.id_potion, p.nom_potion
ORDER BY SUM(i.cout_ingredient) DESC;