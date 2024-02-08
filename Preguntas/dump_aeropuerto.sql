-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: localhost    Database: aeropuerto
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aerolinea`
--
CREATE DATABASE IF NOT EXISTS aeropuerto;
USE aeropuerto;

DROP TABLE IF EXISTS `aerolinea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aerolinea` (
  `id_aerolinea` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`id_aerolinea`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aerolinea`
--

LOCK TABLES `aerolinea` WRITE;
/*!40000 ALTER TABLE `aerolinea` DISABLE KEYS */;
INSERT INTO `aerolinea` VALUES (1,'Iberia'),(2,'Vueling'),(3,'Eazy Jet'),(4,'Air Europa'),(5,'Sky Airline'),(6,'Air Frnace'),(7,'America Airline'),(8,'Delta Air Lines'),(9,'Emirates Airline');
/*!40000 ALTER TABLE `aerolinea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avion`
--

DROP TABLE IF EXISTS `avion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avion` (
  `matricula` varchar(10) NOT NULL,
  `marca` varchar(31) NOT NULL,
  `modelo` varchar(63) NOT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avion`
--

LOCK TABLES `avion` WRITE;
/*!40000 ALTER TABLE `avion` DISABLE KEYS */;
INSERT INTO `avion` VALUES ('4K','Boeing','Boeing 737-400'),('7T','Airbus','Airbus A318'),('8P','Boeing','Boeing 737-800'),('9U','Embraer','Embraer EMB 145'),('A2','Embraer','Embraer EMB 120 Brasilia'),('A5','Boeing','Boeing 737 MAX 10'),('A9C','Boeing','Boeing 737-600'),('C','Boeing','Boeing 747-200'),('C3','Airbus','Airbus A319'),('C6','Boeing','Boeing 737-500'),('CC','Boeing','Boeing 747-8'),('CP','Embraer','ERJ 135'),('D','Airbus','Airbus A380'),('D2','Airbus','Airbus A320'),('D4','Boeing','Boeing 747-300'),('EK','Airbus','Airbus A300'),('EW','Boeing','Boeing 737-100'),('F-OG','Airbus','Airbus A330-300'),('HZ','Airbus','Airbus A350-1000'),('LQ','Airbus','Airbus A380'),('LZ','Embraer','Embraer E-Jet E190'),('OE','Boeing','Boeing 737-300'),('OO','Boeing','Boeing 737-900'),('P4','Airbus','Airbus A310'),('PJ','Airbus','Airbus A350-900'),('PP','Embraer','Embraer E-Jet E170'),('S2','Boeing','Boeing 737-700'),('T9','Embraer','Embraer EMB 110 Bandeirante'),('TJ','Embraer','Embraer Praetor 600'),('TT','Boeing','Boeing 747-400'),('TY','Boeing','Boeing 737 MAX 8'),('V2','Airbus','Airbus A330-200'),('V3','Boeing','Boeing 737 MAX 7'),('V8','Embraer','Embraer E-Jet E175'),('VH','Boeing','Boeing 737-200'),('VP-A','Airbus','Airbus A321'),('VP-B','Boeing','Boeing 737 MAX 9'),('XT','Embraer','Embraer E-Jet E195'),('XU','Embraer','Embraer Praetor 500'),('YA','Airbus','Airbus A320'),('ZA','Embraer','E-Jet');
/*!40000 ALTER TABLE `avion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billete`
--

DROP TABLE IF EXISTS `billete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billete` (
  `id_billete` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `numero_asiento` varchar(4) DEFAULT NULL,
  `coste` decimal(7,2) NOT NULL,
  `tipo` enum('ida','ida_vuelta') NOT NULL,
  PRIMARY KEY (`id_billete`),
  CONSTRAINT `billete_chk_1` CHECK ((length(`numero_asiento`) > 3))
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billete`
--

LOCK TABLES `billete` WRITE;
/*!40000 ALTER TABLE `billete` DISABLE KEYS */;
INSERT INTO `billete` VALUES (1,'2000-12-23','15AF',120.96,'ida'),(2,'2015-04-30','98BA',1800.95,'ida_vuelta'),(3,'2004-01-27','55AR',1200.98,'ida'),(4,'2002-08-12','90AV',240.96,'ida'),(5,'2018-11-09','71AS',2400.86,'ida_vuelta'),(6,'2009-07-20','82AB',3000.89,'ida_vuelta'),(7,'2008-12-05','29FB',100.99,'ida'),(8,'2011-06-18','42DA',1000.98,'ida'),(9,'2002-12-12','31A8',930.32,'ida_vuelta'),(10,'2002-12-12','31A9',930.32,'ida_vuelta'),(11,'2015-08-21','A412',880.01,'ida'),(12,'2022-07-09','A413',550.60,'ida'),(13,'2019-12-04','31B0',749.03,'ida_vuelta'),(14,'2017-05-17','A412',120.50,'ida_vuelta'),(15,'2014-09-30','E101',140.90,'ida'),(16,'2011-10-14','E111',240.10,'ida_vuelta'),(17,'2009-11-12','31A8',930.32,'ida_vuelta'),(18,'2009-11-12','31A9',930.32,'ida_vuelta'),(19,'2020-06-10','A412',880.01,'ida'),(20,'2020-06-12','A413',550.60,'ida'),(21,'2021-08-19','31B0',749.03,'ida_vuelta'),(22,'2017-08-22','A412',120.50,'ida_vuelta'),(23,'2019-09-23','E101',140.90,'ida'),(24,'2016-03-24','E111',240.10,'ida_vuelta'),(25,'2010-11-13','31A8',300.32,'ida_vuelta'),(26,'2011-11-12','31A9',300.32,'ida_vuelta'),(27,'2021-06-10','A412',880.01,'ida'),(28,'2020-06-12','A413',550.60,'ida'),(29,'2021-08-19','31B0',801.03,'ida_vuelta'),(30,'2021-08-22','A412',129.50,'ida_vuelta'),(31,'2020-06-10','E101',142.90,'ida'),(32,'2016-03-24','E111',242.10,'ida_vuelta');
/*!40000 ALTER TABLE `billete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `dni_cliente` varchar(9) NOT NULL,
  PRIMARY KEY (`dni_cliente`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`dni_cliente`) REFERENCES `persona` (`dni`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('16917725Y'),('17778073Q'),('23188871H'),('25579646N'),('27715253T'),('29410835E'),('30715198D'),('33360699G'),('42799486M'),('44985796G'),('48006290T'),('50832138E'),('51807164D'),('52955438P'),('63318845Y'),('66592600X'),('68649360H'),('69125738C'),('69131212C'),('72636918C'),('73860331V'),('75618098D'),('77152963S'),('79003488Y'),('80970054A'),('86654559N'),('86873434L'),('90095416T'),('92860136M'),('93690258B');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `id_billete` int NOT NULL,
  `dni_cliente` varchar(9) DEFAULT NULL,
  `fecha_compra` datetime NOT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `dni_cliente` (`dni_cliente`),
  KEY `id_billete` (`id_billete`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`dni_cliente`) REFERENCES `cliente` (`dni_cliente`),
  CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`id_billete`) REFERENCES `billete` (`id_billete`),
  CONSTRAINT `compra_chk_1` CHECK ((length(`dni_cliente`) > 8))
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (31,1,'16917725Y','2020-04-03 14:23:28'),(32,1,'17778073Q','2021-01-04 01:39:34'),(33,2,'23188871H','2020-08-18 20:09:15'),(34,2,'25579646N','2022-12-02 10:00:17'),(35,3,'27715253T','2021-01-02 13:07:40'),(36,4,'29410835E','2020-12-16 09:19:24'),(37,5,'30715198D','2021-01-12 15:04:21'),(38,5,'33360699G','2022-11-14 18:33:04'),(39,5,'42799486M','2020-07-14 16:12:15'),(40,6,'44985796G','2020-08-07 04:47:33'),(41,6,'48006290T','2022-07-05 18:15:45'),(42,6,'50832138E','2021-08-19 02:12:32'),(43,7,'51807164D','2020-04-15 23:41:16'),(44,7,'52955438P','2023-01-01 11:05:33'),(45,8,'63318845Y','2021-08-02 07:01:36'),(46,8,'66592600X','2023-02-09 01:40:58'),(47,9,'68649360H','2020-01-24 06:07:21'),(48,9,'69125738C','2021-09-06 01:57:01'),(49,9,'69131212C','2022-11-28 01:12:13'),(50,10,'72636918C','2023-07-15 06:38:12'),(51,10,'73860331V','2020-05-09 13:36:55'),(52,10,'75618098D','2023-05-12 07:43:43'),(53,11,'77152963S','2023-09-30 12:47:56'),(54,11,'79003488Y','2020-04-19 23:58:39'),(55,12,'80970054A','2020-06-10 11:08:49'),(56,12,'86654559N','2021-08-14 17:02:27'),(57,13,'86873434L','2022-06-01 03:39:57'),(58,14,'90095416T','2022-11-04 21:32:10'),(59,15,'92860136M','2023-11-06 13:26:32'),(60,15,'93690258B','2022-10-24 08:57:54');
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `dni` varchar(9) NOT NULL,
  `n_pasaporte` varchar(9) DEFAULT NULL,
  `nombre` varchar(26) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `n_pasaporte` (`n_pasaporte`),
  CONSTRAINT `persona_chk_1` CHECK ((length(`dni`) > 8)),
  CONSTRAINT `persona_chk_2` CHECK ((length(`n_pasaporte`) > 8))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES ('10499607S','10499607S','alejandro','del olmo cerrada','1965-06-27'),('10938076N','10938076N','marcela','sanchez canfran','2001-06-10'),('16917725Y','16917725Y','sergio','ramos arguelles','2001-12-12'),('17778073Q','17778073Q','lola','martinez camacho','1980-09-13'),('18864924W','18864924W','alejandro','del olmo fraile','1987-05-03'),('23188871H','23188871H','jessica maritza','lalaleo guangasi','2002-02-11'),('23242379M','23242379M','kilyan','mbappe','1970-02-15'),('23639747W','23639747W','jezabel','perez martin','1977-04-16'),('24507959X','24507959X','alejandro','olmos pereda','2002-08-16'),('25579646N','25579646N','lidia','ruiz martinez','2001-02-09'),('27715253T','27715253T','leonardo','di caprio','1997-05-20'),('27813318Q','27813318Q','jose juan','lopez canfran','1986-07-04'),('28894815F','28894815F','sergio','ramos reverte','1999-01-09'),('28930562N','28930562N','lucio','reverte olmos','2001-03-23'),('29410835E','29410835E','gonzalo','lozano palomo','1967-04-18'),('30715198D','30715198D','estrella','de la muerte','1998-12-17'),('32768983D','32768983D','leonardo','da vinci','1976-04-06'),('33360699G','33360699G','maria jose','zambrano fernandez','2002-10-19'),('34507510N','34507510N','alejandro','del olmo ferraz','1993-09-12'),('35371322J','35371322J','jose juan','macias prada','1990-01-31'),('36915547H','36915547H','alejandro jose','lopez seisdedos','2002-02-05'),('39355567Z','39355567Z','alegria','mefferts macias','1994-07-09'),('42799486M','42799486M','jose','cela olmos','1965-09-07'),('43979761N','43979761N','lucia','fraile canfran','1975-02-01'),('44985796G','44985796G','alejandro','fraile del olmo','2003-03-05'),('45777194H','45777194H','alegria','guangasi quevedo','1997-09-21'),('48006290T','48006290T','angel','almache cuadrado','2004-04-24'),('50832138E','50832138E','aitor','tilla menganito','1967-10-30'),('51454163N','51454163N','juan','del sol','1976-01-24'),('51807164D','51807164D','helen','chufe de valencia','1976-10-21'),('52955438P','52955438P','victoria','estrada alicante','2003-11-02'),('63318845Y','63318845Y','agustin','aguilera martin','1986-02-10'),('66592600X','66592600X','jose luis','de leon','1999-03-03'),('68120808Y','68120808Y','alejandro','reverte canfran','1998-10-18'),('68649360H','68649360H','pepito','grillo xdniano','1975-07-08'),('69125738C','69125738C','alfonso','fraile del olmo','1998-03-31'),('69131212C','69131212C','alex','lozano martin','2000-01-01'),('72636918C','72636918C','iker','casillas fernandez','1981-05-20'),('73860331V','73860331V','carlos','villarroel gonzalez','1983-03-01'),('75618098D','75618098D','erling','braut haaland','2000-07-21'),('76120144B','76120144B','luz camila','fernandez sanchez','2002-10-12'),('77152963S','77152963S','jorge','campos navarrete','1966-10-15'),('78673028X','78673028X','bartolome','cosito ferran','1967-11-23'),('79003488Y','79003488Y','ana maria','zamora del olmo','2002-01-19'),('80970054A','80970054A','felix','sanchez martin','2004-03-17'),('81295686R','81295686R','oscar','mefferts frutos','1998-03-31'),('84936356R','84936356R','alfonso','fraile sanchez','1964-10-20'),('85665738F','85665738F','alejandro','tolome perez','1999-09-19'),('86191694E','86191694E','jesus','seisdedos fernandez','1980-09-18'),('86654559N','86654559N','angel','caido turin','1992-08-19'),('86873434L','86873434L','jesus','valenzuela santana','2004-04-12'),('87442081Z','87442081Z','saul','sanchez da silva','1987-10-02'),('88132520Q','88132520Q','marcelo','santana olmos','1976-12-13'),('90095416T','90095416T','victoria','lopez canfran','1998-03-11'),('90539327B','90539327B','roberto jose','leal guillen','1979-06-28'),('92860136M','92860136M','clara','campoamor galicia','1989-04-09'),('93219482E','93219482E','alejandro','da silva','1998-10-12'),('93690258B','93690258B','angel','zamora sanchez','2000-12-05'),('96065902P','96065902P','eugenio','da silva','1980-02-01'),('97393760F','97393760F','estrella','villaroel zamora','2000-01-09');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilota`
--

DROP TABLE IF EXISTS `pilota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pilota` (
  `vuelo` int NOT NULL,
  `avion` varchar(10) NOT NULL,
  `piloto` int NOT NULL,
  KEY `vuelo` (`vuelo`),
  KEY `avion` (`avion`),
  KEY `piloto` (`piloto`),
  CONSTRAINT `pilota_ibfk_1` FOREIGN KEY (`vuelo`) REFERENCES `vuelo` (`id_vuelo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pilota_ibfk_2` FOREIGN KEY (`avion`) REFERENCES `avion` (`matricula`) ON DELETE CASCADE,
  CONSTRAINT `pilota_ibfk_3` FOREIGN KEY (`piloto`) REFERENCES `piloto` (`id_piloto`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilota`
--

LOCK TABLES `pilota` WRITE;
/*!40000 ALTER TABLE `pilota` DISABLE KEYS */;
/*!40000 ALTER TABLE `pilota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piloto`
--

DROP TABLE IF EXISTS `piloto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `piloto` (
  `id_piloto` int NOT NULL AUTO_INCREMENT,
  `num_galones` decimal(1,0) NOT NULL,
  `antiguedad` varchar(20) DEFAULT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `id_copiloto` int NOT NULL,
  `aerolinea` int NOT NULL,
  PRIMARY KEY (`id_piloto`),
  KEY `id_copiloto` (`id_copiloto`),
  KEY `aerolinea` (`aerolinea`),
  CONSTRAINT `piloto_ibfk_1` FOREIGN KEY (`id_copiloto`) REFERENCES `piloto` (`id_piloto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `piloto_ibfk_2` FOREIGN KEY (`aerolinea`) REFERENCES `aerolinea` (`id_aerolinea`) ON DELETE RESTRICT,
  CONSTRAINT `piloto_chk_1` CHECK ((length(`num_galones`) < 5))
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piloto`
--

LOCK TABLES `piloto` WRITE;
/*!40000 ALTER TABLE `piloto` DISABLE KEYS */;
INSERT INTO `piloto` VALUES (1,1,'2012-01-01','Cristian','Florico Vilcu',1,3),(2,2,'2013-02-15','Marcos','Gutierrez Planas',1,2),(3,2,'2010-04-14','Francisco','Fernandez Brañas',1,3),(4,2,'2017-01-07','Pilar','Sanguino Ampuero',2,4),(5,3,'2016-02-15','Carlos','Sanchez Puero',2,5),(6,3,'2017-09-15','Jose','Moreno Sanguino',3,5),(7,1,'2010-09-01','Martin','Pinto Castillo',3,6),(8,3,'2019-01-04','Felix','Izquierdo Bejarano',4,5),(9,3,'2012-11-15','Brian','Novillo Gracia',4,4),(10,3,'2014-02-18','Oliver','Delgado Montejo',5,4),(11,3,'2014-02-18','Mario','Rimon Ruiz',5,1),(12,3,'2014-02-18','Antonio','Colmenarejo Delgado',6,1),(13,1,'2013-10-03','Franco','Heredia Navarro',6,5),(14,4,'2013-10-13','Manuel','Peña Gonzalez',7,6),(15,4,'2013-10-30','Sergio','Ramos Garcia',7,2),(16,4,'2013-10-30','Roman','Esteban Romanillos',8,5),(17,4,'2015-01-12','Mateo','Moreno Fernandez',8,3),(18,2,'2012-10-01','Marco','Martin Granda',9,2),(19,2,'2012-01-01','Alex','Ferrandez Cacho',10,3),(20,2,'2012-01-19','Carlos','Sanchez Ramirez',10,4),(21,4,'2018-12-10','Manuel','Mingo Sanchez',11,4),(22,3,'2018-12-10','Victor','Hernando Jimenez',11,3),(23,3,'2018-12-10','Israel','Vega dominguez',12,5),(24,4,'2014-02-25','Ismael','Fresno Fernandez',12,4),(25,3,'2014-02-25','Ariel','Garcia Cabrera',13,1),(26,3,'2014-02-25','Angel','Gallego Largo',13,4),(27,4,'2017-09-15','Daniel','Gallego Largo',14,5),(28,2,'2010-09-01','Luis','Martin Largo',14,2),(29,3,'2017-09-15','Javier','Moreno Heredia',15,5),(30,4,'2019-01-04','Antonio','Peña Colmenajero',15,5),(31,2,'2017-09-15','Jorge','Torreadrado Boal',16,3),(32,2,'2019-01-04','David','Delgado Buitrago',16,4),(33,2,'2013-10-13','Edwin','Polo Pina',17,5),(34,2,'2017-09-15','Jofre','Martinez Iturriaga',17,5),(35,4,'2013-10-13','Luisa','Urkia Odriozola',18,6),(36,3,'2023-09-15','Isabel','Villanueva Castro',18,5),(37,3,'2020-09-15','Anibal','Llamas Salas',19,6),(38,2,'2019-09-15','Lucas','Diment Waingorpin',19,6),(39,3,'2013-09-15','Owen','Mata Caseres',20,4),(40,3,'2016-09-15','Dario','Heras Fraga',20,6),(41,2,'2017-09-15','Miquel','Navarro Gonzalez',30,2);
/*!40000 ALTER TABLE `piloto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puerta`
--

DROP TABLE IF EXISTS `puerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puerta` (
  `id_puerta` int NOT NULL AUTO_INCREMENT,
  `terminal` int NOT NULL,
  `vuelo` int NOT NULL,
  PRIMARY KEY (`id_puerta`,`terminal`),
  KEY `terminal` (`terminal`),
  KEY `vuelo` (`vuelo`),
  CONSTRAINT `puerta_ibfk_1` FOREIGN KEY (`terminal`) REFERENCES `terminal` (`id_terminal`),
  CONSTRAINT `puerta_ibfk_2` FOREIGN KEY (`vuelo`) REFERENCES `vuelo` (`id_vuelo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puerta`
--

LOCK TABLES `puerta` WRITE;
/*!40000 ALTER TABLE `puerta` DISABLE KEYS */;
INSERT INTO `puerta` VALUES (3,3,3),(2,10,4),(6,9,4),(13,6,5),(14,10,9),(8,7,13),(7,6,14),(12,3,20),(5,1,21),(4,5,23),(10,8,25),(15,2,33),(1,1,34),(9,2,39),(11,10,40);
/*!40000 ALTER TABLE `puerta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal`
--

DROP TABLE IF EXISTS `terminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal` (
  `id_terminal` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`id_terminal`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal`
--

LOCK TABLES `terminal` WRITE;
/*!40000 ALTER TABLE `terminal` DISABLE KEYS */;
INSERT INTO `terminal` VALUES (1,'Terminal1'),(2,'Terminal2'),(3,'Terminal3'),(4,'Terminal4'),(5,'Terminal5'),(6,'Terminal6'),(7,'Terminal7'),(8,'Terminal8'),(9,'Terminal9'),(10,'Terminal10');
/*!40000 ALTER TABLE `terminal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viajero`
--

DROP TABLE IF EXISTS `viajero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viajero` (
  `dni_viajero` varchar(9) NOT NULL,
  `billete` int NOT NULL,
  `vuelo` int NOT NULL,
  PRIMARY KEY (`dni_viajero`),
  KEY `billete` (`billete`),
  KEY `vuelo` (`vuelo`),
  CONSTRAINT `viajero_ibfk_1` FOREIGN KEY (`dni_viajero`) REFERENCES `persona` (`dni`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `viajero_ibfk_2` FOREIGN KEY (`billete`) REFERENCES `billete` (`id_billete`),
  CONSTRAINT `viajero_ibfk_3` FOREIGN KEY (`vuelo`) REFERENCES `vuelo` (`id_vuelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viajero`
--

LOCK TABLES `viajero` WRITE;
/*!40000 ALTER TABLE `viajero` DISABLE KEYS */;
INSERT INTO `viajero` VALUES ('10499607S',7,7),('10938076N',11,11),('18864924W',12,12),('23242379M',10,10),('23639747W',4,4),('24507959X',8,8),('27813318Q',6,8),('28894815F',15,15),('28930562N',8,8),('32768983D',1,1),('34507510N',5,5),('35371322J',7,7),('36915547H',5,5),('39355567Z',6,6),('43979761N',15,15),('45777194H',10,10),('51454163N',5,4),('68120808Y',6,6),('76120144B',10,10),('78673028X',12,12),('81295686R',11,11),('84936356R',1,1),('85665738F',9,9),('86191694E',14,14),('87442081Z',2,2),('88132520Q',13,13),('90539327B',3,6),('93219482E',9,9),('96065902P',2,2),('97393760F',9,9);
/*!40000 ALTER TABLE `viajero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelo`
--

DROP TABLE IF EXISTS `vuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuelo` (
  `id_vuelo` int NOT NULL AUTO_INCREMENT,
  `duracion` double NOT NULL,
  `fecha_hora_vuelo` datetime NOT NULL,
  PRIMARY KEY (`id_vuelo`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo`
--

LOCK TABLES `vuelo` WRITE;
/*!40000 ALTER TABLE `vuelo` DISABLE KEYS */;
INSERT INTO `vuelo` VALUES (1,8.15,'2013-04-22 07:30:00'),(2,7.3,'2013-04-22 08:00:00'),(3,8.4,'2013-04-21 08:00:00'),(4,8.1,'2013-04-23 08:15:00'),(5,6,'2013-04-24 08:15:00'),(6,7,'2013-04-25 08:20:00'),(7,7,'2013-04-26 08:25:00'),(8,2.3,'2013-04-27 08:30:00'),(9,4,'2013-04-28 08:45:00'),(10,6.9,'2013-04-29 08:50:00'),(11,1,'2023-01-07 09:00:00'),(12,4,'2022-02-12 09:02:00'),(13,7.3,'2010-07-15 09:05:10'),(14,3.2,'2011-08-30 09:10:00'),(15,2.6,'2012-02-03 09:15:00'),(16,5,'2011-07-08 09:30:00'),(17,6,'2008-06-13 10:00:00'),(18,8.5,'2007-07-14 10:05:00'),(19,16,'2003-09-17 10:10:00'),(20,10,'2007-05-23 10:15:00'),(21,11.6,'2007-06-17 10:20:00'),(22,14,'2022-08-26 10:25:30'),(23,3.2,'2022-09-12 10:30:00'),(24,2.1,'2021-04-13 10:35:30'),(25,4.5,'2020-02-17 10:40:00'),(26,8,'2024-05-14 10:45:00'),(27,13,'2013-04-25 17:15:00'),(28,7,'2012-09-18 18:00:00'),(29,6.3,'2009-03-01 18:04:00'),(30,7,'2009-03-02 18:13:40'),(31,5,'2007-06-28 18:30:00'),(32,4,'2006-06-28 19:00:07'),(33,2,'2002-11-15 14:00:00'),(34,3.3,'2006-06-22 16:28:00'),(35,4,'2009-05-27 16:30:00'),(36,6,'2010-09-04 16:35:00'),(37,2,'2011-02-14 09:00:00'),(38,21,'2014-05-23 10:00:00'),(39,9,'2017-09-24 21:05:00'),(40,6,'2014-05-09 21:40:00'),(41,4,'2012-09-21 21:45:00'),(42,6,'2023-03-07 22:00:00');
/*!40000 ALTER TABLE `vuelo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-05 13:49:30
