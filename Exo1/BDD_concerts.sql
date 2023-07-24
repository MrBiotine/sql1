-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.7.33 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour concerts
CREATE DATABASE IF NOT EXISTS `concerts` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `concerts`;

-- Listage de la structure de la table concerts. musicien
CREATE TABLE IF NOT EXISTS `musicien` (
  `id_musicien` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `representation_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_musicien`) USING BTREE,
  KEY `FK_musicien_representation` (`representation_id`),
  CONSTRAINT `FK_musicien_representation` FOREIGN KEY (`representation_id`) REFERENCES `representation` (`id_representation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- Listage des données de la table concerts.musicien : ~2 rows (environ)
/*!40000 ALTER TABLE `musicien` DISABLE KEYS */;
INSERT INTO `musicien` (`id_musicien`, `nom`, `representation_id`) VALUES
	(1, 'vip1', 3),
	(2, 'casu1', 1),
	(3, 'vip2', 2);
/*!40000 ALTER TABLE `musicien` ENABLE KEYS */;

-- Listage de la structure de la table concerts. programmer
CREATE TABLE IF NOT EXISTS `programmer` (
  `id_programmer` int(11) NOT NULL,
  `tarif` decimal(20,6) DEFAULT NULL,
  `parution` date DEFAULT NULL,
  `representation_id` int(11) NOT NULL,
  PRIMARY KEY (`id_programmer`),
  KEY `FK_programmer_representation` (`representation_id`),
  CONSTRAINT `FK_programmer_representation` FOREIGN KEY (`representation_id`) REFERENCES `representation` (`id_representation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table concerts.programmer : ~0 rows (environ)
/*!40000 ALTER TABLE `programmer` DISABLE KEYS */;
INSERT INTO `programmer` (`id_programmer`, `tarif`, `parution`, `representation_id`) VALUES
	(1, 10.000000, '2023-07-20', 1),
	(2, 20.000000, '2023-07-20', 1);
/*!40000 ALTER TABLE `programmer` ENABLE KEYS */;

-- Listage de la structure de la table concerts. representation
CREATE TABLE IF NOT EXISTS `representation` (
  `id_representation` int(11) NOT NULL,
  `titre_representation` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lieu` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_representation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table concerts.representation : ~3 rows (environ)
/*!40000 ALTER TABLE `representation` DISABLE KEYS */;
INSERT INTO `representation` (`id_representation`, `titre_representation`, `lieu`) VALUES
	(1, 'concert1', 'lieu1'),
	(2, 'concert2', 'lieu2'),
	(3, 'concert3', 'lieu3'),
	(4, 'concert1bis', 'lieu1'),
	(5, 'concert3bis', 'lieu3');
/*!40000 ALTER TABLE `representation` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
