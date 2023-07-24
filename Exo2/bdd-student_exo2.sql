-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour students
CREATE DATABASE IF NOT EXISTS `students` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `students`;

-- Listage de la structure de table students. etudiant
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id_etudiant` int NOT NULL,
  `nom` varchar(50) NOT NULL DEFAULT '',
  `prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_etudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table students.etudiant : ~5 rows (environ)
INSERT INTO `etudiant` (`id_etudiant`, `nom`, `prenom`) VALUES
	(1, 'Villaume', 'Denis'),
	(2, 'Mignot', 'Esteban'),
	(3, 'Lenoi', 'Mauranne'),
	(4, 'Milena', 'Delacotte'),
	(5, 'Doué', 'Bruno');

-- Listage de la structure de table students. evaluer
CREATE TABLE IF NOT EXISTS `evaluer` (
  `id_evaluer` int NOT NULL,
  `dateEval` date NOT NULL,
  `note` decimal(10,1) NOT NULL,
  `etudiant_id` int NOT NULL,
  `codemat_id` int NOT NULL,
  PRIMARY KEY (`id_evaluer`),
  KEY `FK_evaluer_etudiant` (`etudiant_id`),
  KEY `FK_evaluer_matiere` (`codemat_id`),
  CONSTRAINT `FK_evaluer_etudiant` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id_etudiant`),
  CONSTRAINT `FK_evaluer_matiere` FOREIGN KEY (`codemat_id`) REFERENCES `matiere` (`codemat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table students.evaluer : ~10 rows (environ)
INSERT INTO `evaluer` (`id_evaluer`, `dateEval`, `note`, `etudiant_id`, `codemat_id`) VALUES
	(1, '2023-07-24', 14.5, 1, 101163),
	(2, '2023-07-24', 15.0, 4, 101160),
	(3, '2023-07-26', 15.0, 4, 100152),
	(4, '2023-07-26', 13.5, 2, 100152),
	(5, '2023-07-28', 13.5, 5, 100151),
	(6, '2023-07-28', 16.0, 4, 100152),
	(7, '2024-07-28', 16.0, 4, 100152),
	(8, '2024-07-28', 12.5, 3, 100151),
	(9, '2024-07-28', 12.5, 3, 101163),
	(10, '2024-07-28', 17.0, 5, 101160);

-- Listage de la structure de table students. matiere
CREATE TABLE IF NOT EXISTS `matiere` (
  `codemat` int NOT NULL,
  `libellemat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `coeffmat` tinyint NOT NULL,
  PRIMARY KEY (`codemat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table students.matiere : ~5 rows (environ)
INSERT INTO `matiere` (`codemat`, `libellemat`, `coeffmat`) VALUES
	(100150, 'languages web', 1),
	(100151, 'PHP', 3),
	(100152, 'Javascript', 2),
	(101160, 'intro base de donnée relationnelle', 1),
	(101163, 'SQL', 2);

-- Listage de la structure de vue students. moynote_mat
-- Création d'une table temporaire pour palier aux erreurs de dépendances de VIEW
CREATE TABLE `moynote_mat` (
	`nom` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`libellemat` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`AVG(ev.note)` DECIMAL(14,5) NULL
) ENGINE=MyISAM;

-- Listage de la structure de vue students. moynote_mat
-- Suppression de la table temporaire et création finale de la structure d'une vue
DROP TABLE IF EXISTS `moynote_mat`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `moynote_mat` AS select `e`.`nom` AS `nom`,`m`.`libellemat` AS `libellemat`,avg(`ev`.`note`) AS `AVG(ev.note)` from ((`evaluer` `ev` join `etudiant` `e` on((`e`.`id_etudiant` = `ev`.`etudiant_id`))) join `matiere` `m` on((`m`.`codemat` = `ev`.`codemat_id`))) group by `e`.`nom`,`m`.`libellemat` order by `e`.`nom`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
