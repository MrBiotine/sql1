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
SELECT e.nom, m.libellemat,m.coeffmat,ev.note
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

/*e) Quelle est la moyenne générale de chaque étudiant ? (utilisez CREATE VIEW + cf. question
3)
*/
SELECT nom, SUM(coeffmat*note)/SUM(coeffmat) AS moyenne_general
FROM notebymat
GROUP BY nom
ORDER BY nom;

/*f) Quelle est la moyenne générale de la promotion ? (cf. question e)
*/
/*creating a view from above*/
CREATE VIEW moy_gen as
SELECT nom, SUM(coeffmat*note)/SUM(coeffmat) AS moyenne_general
FROM notebymat
GROUP BY nom
ORDER BY nom;

/*then use it */

SELECT year(e.dateEval) AS promotion, AVG(moyenne_general)
FROM moy_gen, evaluer e
GROUP BY promotion;

/*g) Quels sont les étudiants qui ont une moyenne générale supérieure ou égale à la moyenne
générale de la promotion ? (cf. question e)*/


