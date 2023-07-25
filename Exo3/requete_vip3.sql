CREATE VIEW moy_gen AS 
SELECT nom, SUM(coeffmat*note)/SUM(coeffmat) AS moyenne_general
FROM notebymat
GROUP BY nom
ORDER BY nom;

