/*1. Nom des lieux qui finissent par 'um'.*/
SELECT nom_lieu as "lieux finissant par 'um' "
FROM lieu
WHERE nom_lieu LIKE '%um';
