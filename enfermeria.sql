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

-- Volcando estructura para tabla enfermeria.enfermeras
CREATE TABLE IF NOT EXISTS `enfermeras` (
  `Matricula` varchar(20) NOT NULL,
  `Nombres` varchar(40) NOT NULL,
  `Apellido_M` varchar(40) NOT NULL,
  `Apellido_P` varchar(40) NOT NULL,
  `Tipo_Enfermera` varchar(5) NOT NULL,
  `Sexo` char(20) NOT NULL DEFAULT '',
  `Jornada` varchar(10) NOT NULL,
  `Horario_Labores` varchar(15) NOT NULL,
  `Descanso` varchar(25) NOT NULL,
  `Fecha_Nacimiento` varchar(12) NOT NULL DEFAULT '',
  `Lugar_Nacimiento` varchar(30) NOT NULL,
  `Curp` varchar(40) NOT NULL,
  `Telefono` varchar(30) NOT NULL,
  PRIMARY KEY (`Matricula`) USING BTREE,
  KEY `Tipo_Enfermera` (`Tipo_Enfermera`),
  CONSTRAINT `FK_enfermeras_tipo_enfermera` FOREIGN KEY (`Tipo_Enfermera`) REFERENCES `tipo_enfermera` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla enfermeria.enfermeras: ~2 rows (aproximadamente)
DELETE FROM `enfermeras`;
/*!40000 ALTER TABLE `enfermeras` DISABLE KEYS */;
INSERT INTO `enfermeras` (`Matricula`, `Nombres`, `Apellido_M`, `Apellido_P`, `Tipo_Enfermera`, `Sexo`, `Jornada`, `Horario_Labores`, `Descanso`, `Fecha_Nacimiento`, `Lugar_Nacimiento`, `Curp`, `Telefono`) VALUES
	('0001', 'Paola Itzel', 'Valerio', 'Torres', 'CUH', 'M', '8hrs', 'Matutino', 'Domingo-Lunes', '2020-12-09', 'CDMX', 'JASD201217MASRNNA3', '44-44-11-23-24'),
	('0002', 'Julieta', 'Romero', 'Alvarez', 'AEG', 'F', '8hrs', 'Matutino', 'Lunes-Martes', '2020-12-01', 'CDMX', 'EITL970KJHKHU', '55-33-22-12-12');
/*!40000 ALTER TABLE `enfermeras` ENABLE KEYS */;

-- Volcando estructura para tabla enfermeria.estudios
CREATE TABLE IF NOT EXISTS `estudios` (
  `Id_Enfermera` varchar(20) DEFAULT NULL,
  `Id_Estudio` int(11) NOT NULL AUTO_INCREMENT,
  `Nivel` varchar(20) DEFAULT NULL,
  `Titulo` varchar(20) DEFAULT NULL,
  `Institucion` varchar(50) DEFAULT NULL,
  `Tipo_Escuela` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id_Estudio`) USING BTREE,
  KEY `Id_Enfermera` (`Id_Enfermera`),
  CONSTRAINT `FK_estudios_enfermeras` FOREIGN KEY (`Id_Enfermera`) REFERENCES `enfermeras` (`Matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla enfermeria.estudios: ~4 rows (aproximadamente)
DELETE FROM `estudios`;
/*!40000 ALTER TABLE `estudios` DISABLE KEYS */;
INSERT INTO `estudios` (`Id_Enfermera`, `Id_Estudio`, `Nivel`, `Titulo`, `Institucion`, `Tipo_Escuela`) VALUES
	('0001', 7, 'Tecnico', 'Diploma', 'CETIS', 'Publica'),
	('0001', 8, 'Licenciatura', 'Diploma', 'IPN', 'Publica'),
	('0002', 9, 'Licenciatura', 'Constancia', 'IPN', 'Publica'),
	('0002', 10, 'Tecnico', 'Constancia', 'CCH SUR', 'Publica');
/*!40000 ALTER TABLE `estudios` ENABLE KEYS */;

-- Volcando estructura para tabla enfermeria.familia
CREATE TABLE IF NOT EXISTS `familia` (
  `Id_Enfermera` varchar(20) NOT NULL,
  `Id_Familia` int(11) NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(50) NOT NULL,
  `Apellido_M` varchar(50) NOT NULL,
  `Apellido_P` varchar(50) NOT NULL,
  `Parentesco` varchar(50) NOT NULL,
  `Edad` int(11) NOT NULL,
  PRIMARY KEY (`Id_Familia`),
  KEY `Id_Enfermera` (`Id_Enfermera`),
  CONSTRAINT `FK_familia_enfermeras` FOREIGN KEY (`Id_Enfermera`) REFERENCES `enfermeras` (`Matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla enfermeria.familia: ~3 rows (aproximadamente)
DELETE FROM `familia`;
/*!40000 ALTER TABLE `familia` DISABLE KEYS */;
INSERT INTO `familia` (`Id_Enfermera`, `Id_Familia`, `Nombres`, `Apellido_M`, `Apellido_P`, `Parentesco`, `Edad`) VALUES
	('0001', 4, 'Alan', 'Emiliano', 'Torres', 'Hermano', 22),
	('0001', 5, 'Anabel', 'Torres', 'Sosa', 'Madre', 45),
	('0002', 6, 'Luis ', 'Rangel', 'Dominguez', 'Tio', 45);
/*!40000 ALTER TABLE `familia` ENABLE KEYS */;

-- Volcando estructura para tabla enfermeria.tipo_enfermera
CREATE TABLE IF NOT EXISTS `tipo_enfermera` (
  `Id` varchar(5) NOT NULL,
  `Descripcion` varchar(40) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla enfermeria.tipo_enfermera: ~11 rows (aproximadamente)
DELETE FROM `tipo_enfermera`;
/*!40000 ALTER TABLE `tipo_enfermera` DISABLE KEYS */;
INSERT INTO `tipo_enfermera` (`Id`, `Descripcion`) VALUES
	('AEG', 'Auxiliar de Enfermeria General'),
	('CUH', 'Camillero de Unidad Hospitalaria'),
	('DE', 'Directora de Enfermeria'),
	('EEI', 'Enfermera Especialista Intensiva'),
	('EEP', 'Enfermera Especialista Pediatra'),
	('EESP', 'Enfermera Especialista Salud Publica'),
	('EG', 'Enfermera General'),
	('EJP', 'Enfermera Jefa de Piso'),
	('EPH', 'Enfermera Perinatal Hospitalaria'),
	('EQX', 'Enfermera Especialista Quirurgica'),
	('SJE', 'Sub-Jefa de Enfermeria');
/*!40000 ALTER TABLE `tipo_enfermera` ENABLE KEYS */;

-- Volcando estructura para tabla enfermeria.vivienda
CREATE TABLE IF NOT EXISTS `vivienda` (
  `Id_Enfermera` varchar(20) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `Delegacion` varchar(50) DEFAULT NULL,
  `Colonia` varchar(50) DEFAULT NULL,
  `Calle` varchar(50) DEFAULT NULL,
  `CP` varchar(10) DEFAULT NULL,
  `Num_Ext` int(11) DEFAULT NULL,
  `Num_Int` int(11) DEFAULT NULL,
  KEY `Id_Enfermera` (`Id_Enfermera`),
  CONSTRAINT `FK_vivienda_enfermeras` FOREIGN KEY (`Id_Enfermera`) REFERENCES `enfermeras` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla enfermeria.vivienda: ~2 rows (aproximadamente)
DELETE FROM `vivienda`;
/*!40000 ALTER TABLE `vivienda` DISABLE KEYS */;
INSERT INTO `vivienda` (`Id_Enfermera`, `Estado`, `Delegacion`, `Colonia`, `Calle`, `CP`, `Num_Ext`, `Num_Int`) VALUES
	('0001', 'CDMX', 'Tlalpan', 'Pedregal de Sn Nicolas', 'Conkal ', '14100', 380, 102),
	('0002', 'Estado deMexico', 'Alvaro Obregon', 'Anzures', 'Pitagora', '507', 12, 1);
/*!40000 ALTER TABLE `vivienda` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
