-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para jobfitter
CREATE DATABASE IF NOT EXISTS `jobfitter` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jobfitter`;

-- Volcando estructura para tabla jobfitter.clusters
CREATE TABLE IF NOT EXISTS `clusters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cluster_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla jobfitter.clusters: ~4 rows (aproximadamente)
INSERT INTO `clusters` (`id`, `cluster_name`) VALUES
	(1, 'extrovertido'),
	(2, 'determinado'),
	(3, 'estructurado'),
	(4, 'creativo'),
	(5, 'racional');

-- Volcando estructura para tabla jobfitter.emotions
CREATE TABLE IF NOT EXISTS `emotions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emotion_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla jobfitter.emotions: ~8 rows (aproximadamente)
INSERT INTO `emotions` (`id`, `emotion_name`) VALUES
	(1, 'HAPPY'),
	(2, 'CONFUSED'),
	(3, 'ANGRY'),
	(4, 'CALM'),
	(5, 'SURPRISED'),
	(6, 'SAD'),
	(7, 'FEAR'),
	(8, 'DISGUSTED');

-- Volcando estructura para tabla jobfitter.cluster_params
CREATE TABLE IF NOT EXISTS `cluster_params` (
  `id` int DEFAULT NULL,
  `emotion` int NOT NULL,
  `cluster` int NOT NULL,
  `limit` int(10) unsigned zerofill DEFAULT NULL,
  `peaks` int(10) unsigned zerofill DEFAULT NULL,
  KEY `FK_cluster_params_clusters` (`cluster`),
  KEY `FK_cluster_params_emotions` (`emotion`),
  CONSTRAINT `FK_cluster_params_clusters` FOREIGN KEY (`cluster`) REFERENCES `clusters` (`id`),
  CONSTRAINT `FK_cluster_params_emotions` FOREIGN KEY (`emotion`) REFERENCES `emotions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla jobfitter.cluster_params: ~8 rows (aproximadamente)
INSERT INTO `cluster_params` (`id`, `emotion`, `cluster`, `limit`, `peaks`) VALUES
	(1, 1, 1, 0000000040, 0000000002),
	(2, 2, 2, 0000000060, 0000000002),
	(3, 3, 2, 0000000050, 0000000002),
	(4, 4, 3, 0000000080, 0000000005),
	(5, 6, 3, 0000000020, 0000000003),
	(6, 5, 4, 0000000020, 0000000001),
	(7, 4, 5, 0000000080, 0000000010),
	(8, 6, 5, 0000000050, 0000000003);


/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
