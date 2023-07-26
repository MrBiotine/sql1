/*7. Nom des ingrédients + coût + quantité de chaque ingrédient qui composent la potion 'Santé'.*/
SELECT i.nom_ingredient AS "Nom des ingrédients", i.cout_ingredient AS "Coût", c.qte AS "Quantité"
FROM ingredient AS i
INNER JOIN composer AS c ON i.id_ingredient = c.id_ingredient
INNER JOIN potion AS p ON c.id_potion = p.id_potion
WHERE p.nom_potion = 'Santé';
