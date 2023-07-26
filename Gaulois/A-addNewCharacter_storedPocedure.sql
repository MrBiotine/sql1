DELIMITER //

CREATE PROCEDURE AjouterPersonnage(
    IN p_nom_personnage VARCHAR(80),
    IN p_adresse_personnage VARCHAR(255),
    IN p_nom_lieu VARCHAR(50),
    IN p_nom_specialite VARCHAR(50)
)
BEGIN
    DECLARE v_id_lieu INT;
    DECLARE v_id_specialite INT;
    
    -- Récupérer l'ID du lieu à partir de son nom
    SELECT id_lieu INTO v_id_lieu
    FROM lieu
    WHERE nom_lieu = p_nom_lieu;
    
    -- Récupérer l'ID de la spécialité à partir de son nom
    SELECT id_specialite INTO v_id_specialite
    FROM specialite
    WHERE nom_specialite = p_nom_specialite;
    
    -- Insérer le nouveau personnage dans la table "personnage"
    INSERT INTO personnage (nom_personnage, adresse_personnage, id_lieu, id_specialite)
    VALUES (p_nom_personnage, p_adresse_personnage, v_id_lieu, v_id_specialite);
    
    -- Afficher un message de réussite
    SELECT CONCAT('Le personnage ', p_nom_personnage, ' a été ajouté avec succès !') AS Message;
END //

DELIMITER ;

/*Call the procedure as below :
CALL AjouterPersonnage('Champdeblix', 'Ferme Hantassion', 'Rotomagus', 'Agriculteur');
*/


