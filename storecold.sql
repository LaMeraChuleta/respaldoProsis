-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.5.4-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla nuxtstoredb.artistas
CREATE TABLE IF NOT EXISTS `artistas` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `pais` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla nuxtstoredb.artistas: ~14 rows (aproximadamente)
DELETE FROM `artistas`;
/*!40000 ALTER TABLE `artistas` DISABLE KEYS */;
INSERT INTO `artistas` (`id`, `nombre`, `pais`) VALUES
	(3, 'Hombres G', 'España'),
	(4, 'Hector Lavoe', 'Puerto Rico'),
	(5, 'Madonna', 'EUA'),
	(6, 'Queen', 'Inglaterra'),
	(7, 'Flans', 'Mexico'),
	(8, 'Luis Miguel', 'Mexico'),
	(9, 'Lucero', 'Mexico'),
	(10, 'Jesse & Joy', 'Mexico'),
	(11, 'Coldplay', 'EUA'),
	(12, 'Diana King', 'Jamaica'),
	(13, 'All 4 One', 'EUA'),
	(14, 'U2', 'EUA'),
	(15, 'Willie Colom', 'EUA'),
	(16, 'Caifanes', 'Mexico');
/*!40000 ALTER TABLE `artistas` ENABLE KEYS */;

-- Volcando estructura para tabla nuxtstoredb.catalogo
CREATE TABLE IF NOT EXISTS `catalogo` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `id_artista` mediumint(9) NOT NULL,
  `id_genero` mediumint(9) NOT NULL,
  `id_formato` mediumint(9) NOT NULL,
  `id_presentacion` mediumint(9) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `origen` varchar(30) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `estado_portada` int(11) DEFAULT NULL,
  `estado_disco` int(11) DEFAULT NULL,
  `dir_imagenes` varchar(100) DEFAULT NULL,
  `año` int(11) DEFAULT NULL,
  `sello` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_artista` (`id_artista`),
  KEY `id_genero` (`id_genero`),
  KEY `id_formato` (`id_formato`),
  KEY `id_presentacion` (`id_presentacion`),
  CONSTRAINT `catalogo_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artistas` (`id`),
  CONSTRAINT `catalogo_ibfk_2` FOREIGN KEY (`id_genero`) REFERENCES `generos` (`id`),
  CONSTRAINT `catalogo_ibfk_3` FOREIGN KEY (`id_formato`) REFERENCES `formato` (`id`),
  CONSTRAINT `catalogo_ibfk_4` FOREIGN KEY (`id_presentacion`) REFERENCES `presentacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla nuxtstoredb.catalogo: ~0 rows (aproximadamente)
DELETE FROM `catalogo`;
/*!40000 ALTER TABLE `catalogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogo` ENABLE KEYS */;

-- Volcando estructura para tabla nuxtstoredb.formato
CREATE TABLE IF NOT EXISTS `formato` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla nuxtstoredb.formato: ~4 rows (aproximadamente)
DELETE FROM `formato`;
/*!40000 ALTER TABLE `formato` DISABLE KEYS */;
INSERT INTO `formato` (`id`, `nombre`) VALUES
	(1, 'CD'),
	(2, 'Vinil'),
	(3, 'Cassette'),
	(4, 'DVD');
/*!40000 ALTER TABLE `formato` ENABLE KEYS */;

-- Volcando estructura para tabla nuxtstoredb.generos
CREATE TABLE IF NOT EXISTS `generos` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla nuxtstoredb.generos: ~3 rows (aproximadamente)
DELETE FROM `generos`;
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` (`id`, `nombre`) VALUES
	(1, 'Salsa'),
	(2, 'Pop'),
	(3, 'Rock');
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;

-- Volcando estructura para tabla nuxtstoredb.presentacion
CREATE TABLE IF NOT EXISTS `presentacion` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla nuxtstoredb.presentacion: ~4 rows (aproximadamente)
DELETE FROM `presentacion`;
/*!40000 ALTER TABLE `presentacion` DISABLE KEYS */;
INSERT INTO `presentacion` (`id`, `nombre`) VALUES
	(1, 'BoxSet'),
	(2, 'Vinil 7´'),
	(3, 'Vinil 12´'),
	(4, 'Vinil 10´');
/*!40000 ALTER TABLE `presentacion` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
