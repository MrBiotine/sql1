/*F. Obélix s'est trompé : ce sont 42 casques Weisenau, et non Ostrogoths, qu'il a pris lors de la
bataille 'Attaque de la banque postale'. Corrigez son erreur !*/

UPDATE prendre_casque pc
SET pc.qte = 42, pc.id_casque = (
	SELECT c.id_casque
	FROM casque c
	WHERE c.nom_casque = 'Weisenau'
	)
 
WHERE pc.id_personnage = (
	SELECT p.id_personnage
	FROM personnage p
	WHERE p.nom_personnage = 'Obélix'
	)
	AND pc.id_bataille = (
	SELECT b.id_bataille
	FROM bataille b
	WHERE b.nom_bataille = 'Attaque de la banque postale'
	) ;