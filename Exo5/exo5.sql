/* Soit la base relationnelle de données LIVRAISON de schéma : 
USINE ([NumU], NomU, VilleU) 
PRODUIT ([NumP], NomP, Couleur, Poids) 
FOURNISSEUR ([NumF], NomF, Statut, VilleF) 
LIVRAISON ([NumP], [NumU], [NumF], Quantité)*/

/*a) Ajouter un nouveau fournisseur avec les attributs de votre choix*/
INSERT INTO fournisseur (nomf, statut, villef)
VALUES (WebColor, sarl, Selestat); 

/*b) Supprimer tous les produits de couleur noire et de numéros compris entre 100 et 1999*/
DELETE 
FROM 
    produit p
    WHERE p.couleur = "noire" AND p.nump >= 100 AND p.nump <= 1999;

/*c) Changer la ville du fournisseur 3 par Mulhouse*/
UPDATE fournisseur f
SET villef = "Mulhouse"
WHERE f.numf = 3; 