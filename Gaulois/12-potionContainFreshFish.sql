/*12.Nom des potions dont un des ingrédients est le poisson frais*/
SELECT p.nom_potion AS "Nom des potions contenant du poisson frais"
FROM potion p
INNER JOIN composer c ON p.id_potion = c.id_potion
INNER JOIN ingredient i ON c.id_ingredient = i.id_ingredient
WHERE LOWER(i.nom_ingredient) = 'poisson frais'
ORDER BY p.nom_potion;

