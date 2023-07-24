CREATE VIEW notebymat as
SELECT e.nom, m.libellemat,ev.note
FROM
	evaluer ev
INNER JOIN	etudiant e 
	ON e.id_etudiant = ev.etudiant_id
INNER JOIN matiere m
	ON m.codemat = ev.codemat_id
ORDER BY e.nom;


