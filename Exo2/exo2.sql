/*  Soit  le  modèle  relationnel  suivant  relatif  à  la  gestion  des  notes  annuelles  d'une  promotion 
d'étudiants : */

/*ETUDIANT (ID_ETUDIANT, NOM, PRENOM)  
MATIERE (CODEMAT, LIBELLEMAT, COEFFMAT)  
EVALUER (ID_EVALUER, DATE, NOTE, #ETUDIANT_ID, #CODEMAT)*/

/*a) Quel est le nombre total d'étudiants ?*/
SELECT COUNT(id_etudiant) FROM etudiant;

/*b) Quelles sont, parmi l'ensemble des notes, la note la plus haute et la note la plus basse ?*/
SELECT MAX(e.note), MIN(e.note)
FROM evaluer e;

/*c) Quelles  sont  les  moyennes  de  chaque  étudiant  dans  chacune  des  matières  ?  (utilisez 
CREATE VIEW)*/

/*without view*/ 
SELECT e.nom, m.libellemat,AVG(ev.note)
FROM
	evaluer ev
INNER JOIN	etudiant e 
	ON e.id_etudiant = ev.etudiant_id
INNER JOIN matiere m
	ON m.codemat = ev.codemat_id
GROUP BY
	e.nom,
	m.libellemat
ORDER BY e.nom;

/*by creating a view*/
CREATE VIEW notebymat as
SELECT e.nom, m.libellemat,ev.note
FROM
	evaluer ev
INNER JOIN	etudiant e 
	ON e.id_etudiant = ev.etudiant_id
INNER JOIN matiere m
	ON m.codemat = ev.codemat_id
ORDER BY e.nom;

/*Query all the view above */
SELECT * FROM notebymat;

/*Query the avg note by matiere for each student* (question c)*/
SELECT nom, libellemat, AVG(note) 
FROM notebymat
GROUP BY nom, libellemat
ORDER BY nom;

/*d) Quelles sont les moyennes par matière ? (cf. question c) */
SELECT libellemat, AVG(note) 
FROM notebymat
GROUP BY libellemat
ORDER BY libellemat;

/*equivalent to*/
SELECT m.libellemat,AVG(ev.note)
FROM
	evaluer ev
INNER JOIN matiere m
	ON m.codemat = ev.codemat_id
GROUP BY
	m.libellemat
ORDER BY m.libellemat;
