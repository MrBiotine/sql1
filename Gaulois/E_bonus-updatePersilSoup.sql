/*E. La potion 'Soupe' doit contenir 22 persil.*/

UPDATE composer c
SET c.qte = 22 
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
	