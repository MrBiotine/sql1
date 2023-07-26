/*A. Ajoutez le personnage suivant : Champdeblix, agriculteur résidant à la ferme Hantassion de
Rotomagus.*/
INSERT INTO personnage (nom_personnage, adresse_personnage, id_lieu, id_specialite)
VALUES ('Champdeblix', 'Ferme Hantassion', 
        (SELECT id_lieu FROM lieu WHERE nom_lieu = 'Rotomagus'),
        (SELECT id_specialite FROM specialite WHERE nom_specialite = 'Agriculteur'));
