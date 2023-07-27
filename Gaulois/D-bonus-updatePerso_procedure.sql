DELIMITER //
CREATE PROCEDURE mettre_a_jour_personnage(
    IN nom_perso VARCHAR(255),
    IN nouvelle_adresse VARCHAR(255)
    IN nouveau_lieu varchar(80)
)
BEGIN
    DECLARE id_lieu_update INT;

    -- Récupérer l'id du lieu correspondant au nom 'Condate'
    SELECT id_lieu INTO id_lieu_update FROM lieu WHERE nom_lieu = nouveau_lieu;

    -- Mettre à jour l'adresse et l'id du lieu du personnage avec les valeurs fournies
    UPDATE personnage
    SET adresse_personnage = nouvelle_adresse, id_lieu = id_lieu_update
    WHERE nom_personnage = nom_perso;
END//
DELIMITER ;

CALL mettre_a_jour_personnage('Zérozérosix', 'prison', 'Condate');