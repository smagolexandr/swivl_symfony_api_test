# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.30-33)
# Database: classroom
# Generation Time: 2020-09-11 12:26:40 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table class_room
# ------------------------------------------------------------

DROP TABLE IF EXISTS `class_room`;

CREATE TABLE `class_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C6E266D45E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `class_room` WRITE;
/*!40000 ALTER TABLE `class_room` DISABLE KEYS */;

INSERT INTO `class_room` (`id`, `name`, `enabled`, `created_at`, `updated_at`)
VALUES
	(4,'room 0',0,'2020-09-11 12:10:31','2020-09-11 12:10:31'),
	(5,'room 1',1,'2020-09-11 12:10:31','2020-09-11 12:10:31'),
	(6,'room 2',1,'2020-09-11 12:10:31','2020-09-11 12:10:31'),
	(7,'room 3',0,'2020-09-11 12:10:31','2020-09-11 12:10:31'),
	(8,'room 4',1,'2020-09-11 12:10:31','2020-09-11 12:10:31'),
	(9,'room 5',1,'2020-09-11 12:10:31','2020-09-11 12:10:31'),
	(10,'room 6',0,'2020-09-11 12:10:31','2020-09-11 12:10:31'),
	(11,'room 7',0,'2020-09-11 12:10:31','2020-09-11 12:10:31'),
	(12,'room 8',1,'2020-09-11 12:10:31','2020-09-11 12:10:31'),
	(13,'room 9',0,'2020-09-11 12:10:31','2020-09-11 12:10:31'),
	(14,'room 10',1,'2020-09-11 12:10:31','2020-09-11 12:10:31'),
	(15,'room 11',1,'2020-09-11 12:10:31','2020-09-11 12:10:31'),
	(16,'room 12',0,'2020-09-11 12:10:31','2020-09-11 12:10:31'),
	(17,'room 13',1,'2020-09-11 12:10:31','2020-09-11 12:10:31'),
	(18,'room 14',0,'2020-09-11 12:10:31','2020-09-11 12:10:31'),
	(19,'room 15',0,'2020-09-11 12:10:31','2020-09-11 12:10:31'),
	(20,'room 16',1,'2020-09-11 12:10:31','2020-09-11 12:10:31'),
	(21,'room 17',0,'2020-09-11 12:10:31','2020-09-11 12:10:31'),
	(22,'room 18',0,'2020-09-11 12:10:31','2020-09-11 12:10:31'),
	(23,'room 19',0,'2020-09-11 12:10:31','2020-09-11 12:10:31');

/*!40000 ALTER TABLE `class_room` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table doctrine_migration_versions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `doctrine_migration_versions`;

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`)
VALUES
	('DoctrineMigrations\\Version20200911120239','2020-09-11 12:05:13',44);

/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
