delimiter //

CREATE PROCEDURE autoriser_boire_potion(
  IN p_nom_personnage VARCHAR(255),
  IN p_nom_potion VARCHAR(255)
)
BEGIN
  -- Insérer l'autorisation pour le personnage donné pour boire la potion donnée
  INSERT INTO autoriser_boire (id_personnage, id_potion)
  VALUES (
    (SELECT id_personnage FROM personnage WHERE nom_personnage = p_nom_personnage),
    (SELECT id_potion FROM potion WHERE nom_potion = p_nom_potion)
  );
END //

delimiter ;
