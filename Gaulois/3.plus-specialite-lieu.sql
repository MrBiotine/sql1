/*3. Nom des personnages + spécialité + adresse et lieu d'habitation, triés par lieu puis par nom
de personnage.*/

SELECT  l.nom_lieu, p.nom_personnage, s.nom_specialite, p.adresse_personnage
FROM personnage p
INNER JOIN specialite s ON p.id_specialite = s.id_specialite
INNER JOIN lieu l ON p.id_lieu = l.id_lieu
ORDER BY l.nom_lieu, p.nom_personnage;

