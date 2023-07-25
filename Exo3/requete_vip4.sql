SELECT year(e.dateEval) AS promotion, AVG(moyenne_general)
FROM moy_gen, evaluer e
GROUP BY promotion;




