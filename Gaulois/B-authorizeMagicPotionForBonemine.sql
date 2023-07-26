/*Autorise Bonemine à boire de la potion magique*/

INSERT INTO autoriser_boire (id_personnage, id_potion)
VALUES (
  (SELECT id_personnage FROM personnage WHERE nom_personnage = 'Bonemine'),
  (SELECT id_potion FROM potion WHERE nom_potion = 'Magique')
);
