-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: schneider
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

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
-- Table structure for table `ansprechpartner`
--

DROP TABLE IF EXISTS `ansprechpartner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ansprechpartner` (
  `ansprechpartner_id` int(11) NOT NULL AUTO_INCREMENT,
  `vorname` varchar(50) NOT NULL,
  `nachname` varchar(50) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `lfa_id` int(11) NOT NULL,
  PRIMARY KEY (`ansprechpartner_id`),
  KEY `lfa_id` (`lfa_id`),
  CONSTRAINT `ansprechpartner_ibfk_1` FOREIGN KEY (`lfa_id`) REFERENCES `lieferant` (`lfa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ansprechpartner`
--

LOCK TABLES `ansprechpartner` WRITE;
/*!40000 ALTER TABLE `ansprechpartner` DISABLE KEYS */;
INSERT INTO `ansprechpartner` VALUES (1,'Jens','Scholz','2222330','Scholz@localhost',3),(2,'Ulrich','Schmidt','2222331','Schmidt@localhost',2),(3,'Erwin','schneider','2222332','schneider@localhost',1),(4,'Severin','Kleinert','2222333','kleinert@localhost',2),(5,'Hans','Buch','2222334','buch@localhost',1);
/*!40000 ALTER TABLE `ansprechpartner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artikel`
--

DROP TABLE IF EXISTS `artikel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artikel` (
  `art_id` int(11) NOT NULL AUTO_INCREMENT,
  `artikelbezeichung` varchar(100) NOT NULL,
  `ak_lagerbestand` int(11) NOT NULL,
  `max_lagerbestand` int(11) NOT NULL,
  `meldbestand` int(11) NOT NULL,
  `preis` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`art_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artikel`
--

LOCK TABLES `artikel` WRITE;
/*!40000 ALTER TABLE `artikel` DISABLE KEYS */;
INSERT INTO `artikel` VALUES (1,'Hose',100,300,40,NULL),(2,'T-Shirt',60,600,90,NULL),(3,'Jacke',50,150,15,NULL),(4,'Pullover',60,130,25,NULL);
/*!40000 ALTER TABLE `artikel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artikel_lieferant`
--

DROP TABLE IF EXISTS `artikel_lieferant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artikel_lieferant` (
  `art_id` int(11) NOT NULL,
  `lfa_id` int(11) NOT NULL,
  PRIMARY KEY (`art_id`,`lfa_id`),
  KEY `lfa_id` (`lfa_id`),
  CONSTRAINT `artikel_lieferant_ibfk_1` FOREIGN KEY (`art_id`) REFERENCES `artikel` (`art_id`),
  CONSTRAINT `artikel_lieferant_ibfk_2` FOREIGN KEY (`lfa_id`) REFERENCES `lieferant` (`lfa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artikel_lieferant`
--

LOCK TABLES `artikel_lieferant` WRITE;
/*!40000 ALTER TABLE `artikel_lieferant` DISABLE KEYS */;
INSERT INTO `artikel_lieferant` VALUES (1,1),(1,2),(1,3),(2,1),(2,2),(2,3);
/*!40000 ALTER TABLE `artikel_lieferant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lieferant`
--

DROP TABLE IF EXISTS `lieferant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lieferant` (
  `lfa_id` int(11) NOT NULL AUTO_INCREMENT,
  `firmename` varchar(200) NOT NULL,
  `strasse` varchar(50) NOT NULL,
  `plz` varchar(50) NOT NULL,
  `ort` varchar(50) NOT NULL,
  `land` varchar(50) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`lfa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lieferant`
--

LOCK TABLES `lieferant` WRITE;
/*!40000 ALTER TABLE `lieferant` DISABLE KEYS */;
INSERT INTO `lieferant` VALUES (1,'TOMMY HILFIGER EUROPE B.V','Danzigerkade 165','1013','AMSTERDAM','Niederlande','00800 - 86669445','tommy@localhost'),(2,'HUGO BOSS AG','Dieselstra?e 12','72555','Metzingen','Deutschland','+49(0)71231783981','boss@localhost'),(3,'Zara','M?nckebergstr. 11','20095','Hamburg','','0800 589 1603','zara@localhost');
/*!40000 ALTER TABLE `lieferant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'schneider'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-24 15:01:46
