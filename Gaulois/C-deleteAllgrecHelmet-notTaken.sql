/*C. Supprimez les casques grecs qui n'ont jamais été pris lors d'une bataille.*/

DELETE FROM casque 
WHERE id_type_casque = ( 
SELECT id_type_casque 
FROM type_casque 
WHERE nom_type_casque = 'Grec'
) 

AND id_casque NOT IN (
SELECT pc.id_casque
FROM prendre_casque pc ) 