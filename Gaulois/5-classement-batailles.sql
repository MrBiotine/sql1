/*Nom, date et lieu des batailles, classées de la plus récente à la plus ancienne (dates affichées
au format jj/mm/aaaa).*/

SELECT b.nom_bataille AS "nom de la bataille", DATE_FORMAT(b.date_bataille, '%d/%m/%Y') AS "Date en format fr", l.nom_lieu AS "lieu de la bataille"
FROM bataille b
INNER JOIN lieu l ON b.id_lieu = l.id_lieu
ORDER BY b.date_bataille DESC;
