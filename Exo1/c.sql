SELECT 
    m.nom, r.titre_representation
FROM 
     musicien m
INNER JOIN representation r
	ON r.id_representation = m.representation_id	
ORDER BY 
	m.nom;