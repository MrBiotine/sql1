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


-- Listage de la structure de la base pour stocks
CREATE DATABASE IF NOT EXISTS `stocks` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `stocks`;

-- Listage de la structure de table stocks. acheter
CREATE TABLE IF NOT EXISTS `acheter` (
  `noart_id` int NOT NULL,
  `nofour_id` int NOT NULL,
  `prixachat` float DEFAULT NULL,
  `delai` float DEFAULT NULL,
  KEY `noart_id` (`noart_id`),
  KEY `nofour_id` (`nofour_id`),
  CONSTRAINT `FK_acheter_articles` FOREIGN KEY (`noart_id`) REFERENCES `articles` (`noart`),
  CONSTRAINT `FK_acheter_fournisseurs` FOREIGN KEY (`nofour_id`) REFERENCES `fournisseurs` (`nofour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table stocks.acheter : ~21 rows (environ)
INSERT INTO `acheter` (`noart_id`, `nofour_id`, `prixachat`, `delai`) VALUES
	(2, 1, 30, 2),
	(1, 2, 9.8, 2),
	(2, 5, 9.8, 2),
	(2, 2, 28, 4),
	(9, 4, 999, 5),
	(8, 2, 199.89, 11),
	(9, 2, 989, 10.5),
	(8, 5, 221, 5),
	(7, 3, 43.2, 4),
	(4, 5, 35, 4),
	(4, 3, 45, 4),
	(10, 6, 1.26, 5.5),
	(10, 8, 1.22, 6),
	(5, 8, 1.22, 6),
	(5, 1, 32.3, 4),
	(6, 1, 32.3, 4),
	(3, 5, 9.8, 2),
	(8, 2, 199.89, 11),
	(8, 2, 199.89, 11),
	(9, 5, 879, 6),
	(1, 4, 14.5, 3);

-- Listage de la structure de table stocks. articles
CREATE TABLE IF NOT EXISTS `articles` (
  `noart` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  `stock` int NOT NULL,
  `prixinvent` float NOT NULL,
  PRIMARY KEY (`noart`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table stocks.articles : ~10 rows (environ)
INSERT INTO `articles` (`noart`, `libelle`, `stock`, `prixinvent`) VALUES
	(1, 'gant', 10, 12.6),
	(2, 'spd-shim', 41, 35),
	(3, 'sram', 21, 36.5),
	(4, 'spl-s', 23, 36),
	(5, 'spd-spl-r', 8, 35),
	(6, 'casque', 8, 42),
	(7, 'veste-tec', 11, 62.5),
	(8, 'fixie', 9, 220),
	(9, 'road-race', 11, 998),
	(10, 'stickers', 105, 2.25);

-- Listage de la structure de table stocks. fournisseurs
CREATE TABLE IF NOT EXISTS `fournisseurs` (
  `nofour` int NOT NULL AUTO_INCREMENT,
  `nomfour` varchar(50) NOT NULL,
  `adrfour` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `villefour4` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`nofour`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table stocks.fournisseurs : ~8 rows (environ)
INSERT INTO `fournisseurs` (`nofour`, `nomfour`, `adrfour`, `villefour4`) VALUES
	(1, 'matvelo', 'rue beauvelo', 'lyon'),
	(2, 'dutouroue siege', 'avenue reineclaude', 'paris'),
	(3, 'dutouroue', 'avenue montjoie', 'villeneuf'),
	(4, 'probikes allemagne', 'grossestrasse', 'offfenbourg'),
	(5, 'probikes france', 'avenue du rhin', 'strasbourg'),
	(6, 'STE générale', NULL, 'paris'),
	(7, 'STEAM power', NULL, 'colmar'),
	(8, 'STE inconnu', NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
