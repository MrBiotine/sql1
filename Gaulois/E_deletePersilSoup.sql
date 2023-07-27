/*E. La potion 'Soupe' ne doit plus contenir du persil.*/

DELETE FROM composer c
WHERE c.id_potion = (
SELECT p.id_potion 
FROM potion p 
WHERE p.nom_potion ='Soupe'
)
AND c.id_ingredient = (
SELECT i.id_ingredient
FROM ingredient i
WHERE LOWER(i.nom_ingredient) = 'persil'
) ;
