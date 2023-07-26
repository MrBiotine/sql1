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
WHERE n.note >= 10;

/*g) Liste des épreuves dont la date se situe entre le 1er janvier et le 30 juin 2014*/
SELECT e.numepreuve, e.datepreuve
FROM epreuve e
WHERE e.datepreuve >= "2014-01-01" AND e.datepreuve <= "2014-06-30";

/*h) Nom, prénom et ville des étudiants dont la ville contient la chaîne "ll" (LL)
*/
SELECT e.nom,e.prenom
FROM etudiant e
WHERE e.ville LIKE ("%ll%");

/*i) Prénoms des étudiants de nom Dupont, Durand ou Martin */
SELECT e.nom,e.prenom
FROM etudiant e
WHERE e.nom LIKE ("Dupont ") or e.nom LIKE ("Durant") or e.nom  LIKE ("Martin");

/*j) Somme des coefficients de toutes les matières */
SELECT SUM(m.coef) as somme_coef
FROM matiere m;

/*k) Nombre total d'épreuves*/
SELECT COUNT(numepreuve) AS "nombre d'épreuve"
FROM epreuve;
/*
i) Nombre de notes indéterminées (NULL)
*/
SELECT COUNT(n.note)
FROM notation n
HAVING n.note IS NULL ;

/*
m)  Liste des épreuves (numéro, date et lieu) incluant le libellé de la matière 
*/
SELECT e.numepreuve, m.libelle, e.datepreuve, e.lieu
FROM epreuve e
INNER JOIN matiere m
    ON e.numepreuve = m.codemat
ORDER BY e.numepreuve;

/*
n) Liste des notes en précisant pour chacune le nom et le prénom de l'étudiant qui l'a 
obtenue 
*/
SELECT n.note, e.nom, e.prenom
FROM notation n
INNER JOIN etudiant e
    ON n.numetu_id = e.numetu
ORDER BY e.note

/*
o) Liste des notes en précisant pour chacune le nom et le prénom de l'étudiant qui l'a 
obtenue et le libellé de la matière concernée 
*/

/*create a view from query m)*/
CREATE VIEW liste_epreuves
SELECT e.numepreuve, m.libelle, e.datepreuve, e.lieu
FROM epreuve e
INNER JOIN matiere m
    ON e.numepreuve = m.codemat;


/*then use it in the query below :*/
SELECT n.note, e.nom, e.prenom, libelle
FROM liste_epreuves, notation n
INNER JOIN etudiant e
    ON n.numetu_id = e.numetu
INNER JOIN epreuve ep
    ON n.numepreuve_id = ep.numepreuve
ORDER BY n.note

/*
p) Nom et prénom des étudiants qui ont obtenu au moins une note égale à 20 
*/
SELECT e.nom, e.prenom,COUNT(n.note) AS nb_notes
FROM notation n
INNER JOIN etudiant e
    ON n.numetu_id = e.numetu
GROUP BY e.nom, e.prenom
HAVING nb_notes >= 1 AND n.note >= 20
ORDER BY e.nom;

/*
q) Moyennes des notes de chaque étudiant (indiquer le nom et le prénom) 
*/
SELECT e.nom, e.prenom,AVG(n.note) AS "moyenne notes"
FROM notation n
INNER JOIN etudiant e
    ON n.numetu_id = e.numetu
GROUP BY e.nom, e.prenom
ORDER BY e.nom;

/*
r) Moyennes des notes de chaque étudiant (indiquer le nom et le prénom), classées de la 
meilleure à la moins bonne
*/
SELECT e.nom, e.prenom,AVG(n.note) AS "moyenne notes"
FROM notation n
INNER JOIN etudiant e
    ON n.numetu_id = e.numetu
GROUP BY e.nom, e.prenom
ORDER BY e.nom DESC;

/*
s) Moyennes des notes pour les matières (indiquer le libellé) comportant plus d'une épreuve 
*/
SELECT libelle, COUNT(numepreuve) AS nb_epreuves, AVG(n.note) AS "moyenne notes"
FROM liste_epreuves, notation n
INNER JOIN epreuve ep
    ON n.numepreuve_id = ep.numepreuve
GROUP BY libelle
HAVING nb_epreuves >= 1
ORDER BY libelle;
/*

t) Moyennes des notes obtenues aux épreuves (indiquer le numéro d'épreuve) où moins de 6 
étudiants ont été notés
*/
SELECT ep.numepreuve AS nr_epreuve, AVG(n.note) AS "moyenne épreuve", COUNT(e.numetu) AS "nombre d'étudiant" 
FROM notation n
INNER JOIN etudiant e
    ON n.numetu_id = e.numetu
INNER JOIN epreuve ep
    ON n.numepreuve_id = ep.numepreuve
GROUP BY nr_epreuve
HAVING "nombre d'étudiant" >= 6
ORDER BY nr_epreuve;





