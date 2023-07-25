/*a) Liste de tous les étudiants*/
SELECT e.numetu,e.nom,e.prenom
FROM etudiant e;

/*b) Liste de tous les étudiants, classée par ordre alphabétique inverse*/
SELECT e.numetu,e.nom,e.prenom
FROM etudiant e
ORDER BY e.nom DESC;

/*c) Libellé et coefficient (exprimé en pourcentage) de chaque matière*/
SELECT m.libelle, 100*MAX(m.coef)/m.coef as coef_pourcent
FROM matiere m
GROUP BY m.libelle;

/*d) Nom et prénom de chaque étudiant
*/
SELECT e.nom,e.prenom
FROM etudiant e;

/*e) Nom et prénom des étudiants domiciliés à Lyon*/
SELECT e.nom,e.prenom
FROM etudiant e
WHERE e.ville ="Lyon";

/*f) Liste des notes supérieures ou égales à 10
*/
SELECT n.note
FROM notation n
WHERE .note >= 10;

/*g) Liste des épreuves dont la date se situe entre le 1er janvier et le 30 juin 2014*/
SELECT e.numepreuve, e.datepreuve
FROM epreuve e
WHERE e.datepreuve >= "2014-01-01" AND e.datepreuve <= "2014-06-30";

/*h) Nom, prénom et ville des étudiants dont la ville contient la chaîne "ll" (LL)
*/
SELECT e.nom,e.prenom
FROM etudiant e
WHERE e.ville LIKE ("ll%" or "%ll" or "%ll%");

