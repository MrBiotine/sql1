/*15. Nom du / des personnages qui n'ont pas le droit de boire de la potion 'Magique'.*/
SELECT DISTINCT p.nom_personnage AS "Les personnages non autorisés"
FROM personnage p
INNER JOIN autoriser_boire b ON p.id_personnage = b.id_personnage
WHERE b.id_potion NOT IN (
    SELECT id_potion
    FROM potion
    WHERE nom_potion = 'Magique'
)
ORDER BY p.nom_personnage;
