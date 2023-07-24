SELECT 
    r.titre_representation, r.lieu, p.tarif, p.parution
FROM 
    representation r
INNER JOIN programmer p
	ON r.id_representation = p.representation_id
WHERE
    p.parution = "2014-09-14"
ORDER BY r.titre_representation;