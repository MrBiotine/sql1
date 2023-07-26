/*14. Nom des personnages qui n'ont jamais bu aucune potion*/

/* jointure externe (LEFT JOIN) pour inclure tous les personnages de la table "personnage"
et une clause WHERE pour filtrer ceux qui n'ont pas de correspondance dans la table "boire"
(c'est-à-dire qui n'ont jamais bu de potion).*/

SELECT p.nom_personnage AS "Nom des personnages n'ayant bu aucune potion"
FROM personnage p
LEFT JOIN boire b ON p.id_personnage = b.id_personnage
WHERE b.id_personnage IS NULL;
