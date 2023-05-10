-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: gostilna
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dostava`
--

DROP TABLE IF EXISTS `dostava`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dostava` (
  `dostavaID` int(11) NOT NULL AUTO_INCREMENT,
  `datum` date NOT NULL,
  PRIMARY KEY (`dostavaID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dostava`
--

LOCK TABLES `dostava` WRITE;
/*!40000 ALTER TABLE `dostava` DISABLE KEYS */;
INSERT INTO `dostava` VALUES (1,'2023-03-04'),(2,'2023-03-05'),(3,'2023-03-24'),(4,'2023-03-26'),(5,'2023-03-08'),(6,'2023-03-24'),(7,'2023-02-27'),(8,'2023-01-04'),(9,'2023-03-03'),(10,'2023-03-12');
/*!40000 ALTER TABLE `dostava` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dostavljalec`
--

DROP TABLE IF EXISTS `dostavljalec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dostavljalec` (
  `dostavljalecID` int(11) NOT NULL AUTO_INCREMENT,
  `firma` varchar(30) NOT NULL,
  `kontakt` varchar(30) NOT NULL,
  `dostavaID` int(11) NOT NULL,
  PRIMARY KEY (`dostavljalecID`),
  KEY `dostavljalec_dostavaID_fk` (`dostavaID`),
  CONSTRAINT `dostavljalec_dostavaID_fk` FOREIGN KEY (`dostavaID`) REFERENCES `dostava` (`dostavaID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dostavljalec`
--

LOCK TABLES `dostavljalec` WRITE;
/*!40000 ALTER TABLE `dostavljalec` DISABLE KEYS */;
INSERT INTO `dostavljalec` VALUES (1,'Fanny&Marry','4019234',1),(2,'Wolt','139468',2),(3,'Wolt','2354333',3),(4,'Wolt','5544331',4),(5,'Glovo','40197727',5),(6,'Glovo','35432345',6),(7,'Wolt','354454432',7),(8,'Wolt','999199929',8),(9,'Wolt','949495951',9),(10,'Glovo','134542344',10);
/*!40000 ALTER TABLE `dostavljalec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hrana`
--

DROP TABLE IF EXISTS `hrana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hrana` (
  `hranaID` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `cena` float(5,2) NOT NULL,
  PRIMARY KEY (`hranaID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hrana`
--

LOCK TABLES `hrana` WRITE;
/*!40000 ALTER TABLE `hrana` DISABLE KEYS */;
INSERT INTO `hrana` VALUES (1,'Pizza','1',5.00),(2,'Kruh','0',2.00),(3,'Pohan sir','1',7.60),(4,'Spageti','1',10.00),(5,'Spargli','1',25.00),(6,'Dunajski zrezek','1',14.00),(7,'Lasko','1',2.50),(8,'Union','1',2.50),(9,'Kozel','1',3.50),(10,'Kozel','1',3.50);
/*!40000 ALTER TABLE `hrana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `menuID` int(11) NOT NULL AUTO_INCREMENT,
  `Opis` varchar(20) NOT NULL,
  `hranaID` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuID`),
  KEY `menu_hranaID_fk` (`hranaID`),
  CONSTRAINT `menu_hranaID_fk` FOREIGN KEY (`hranaID`) REFERENCES `hrana` (`hranaID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Vegi',10),(2,'Pizza',1),(3,'Kruh',2),(4,'Otroski',3),(5,'Mesni',4),(6,'Laktoza',5),(7,'Dunajski zrezek',6),(8,'Pivski1',7),(9,'Pivski2',8),(10,'Pivski3',9);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `narocilo`
--

DROP TABLE IF EXISTS `narocilo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `narocilo` (
  `narociloID` int(11) NOT NULL AUTO_INCREMENT,
  `datum` date NOT NULL,
  `status` varchar(30) NOT NULL,
  `strankaID` int(11) DEFAULT NULL,
  `osebjeID` int(11) DEFAULT NULL,
  `hranaID` int(11) DEFAULT NULL,
  `menuID` int(11) DEFAULT NULL,
  PRIMARY KEY (`narociloID`),
  KEY `narocilo_strankaID_fk` (`strankaID`),
  KEY `narocilo_osebjeID_fk` (`osebjeID`),
  KEY `narocilo_hranaID_fk` (`hranaID`),
  KEY `narocilo_menuID_fk` (`menuID`),
  CONSTRAINT `narocilo_hranaID_fk` FOREIGN KEY (`hranaID`) REFERENCES `hrana` (`hranaID`),
  CONSTRAINT `narocilo_menuID_fk` FOREIGN KEY (`menuID`) REFERENCES `menu` (`menuID`),
  CONSTRAINT `narocilo_osebjeID_fk` FOREIGN KEY (`osebjeID`) REFERENCES `osebje` (`osebjeID`),
  CONSTRAINT `narocilo_strankaID_fk` FOREIGN KEY (`strankaID`) REFERENCES `stranka` (`strankaID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `narocilo`
--

LOCK TABLES `narocilo` WRITE;
/*!40000 ALTER TABLE `narocilo` DISABLE KEYS */;
INSERT INTO `narocilo` VALUES (1,'2023-03-10','1',10,10,1,3),(2,'2021-02-13','0',7,8,5,2),(3,'2023-03-05','1',2,1,5,4),(4,'2023-03-26','0',1,9,4,2),(5,'2023-03-31','1',9,2,3,2),(6,'2023-03-07','1',3,3,6,9),(7,'2023-03-26','1',5,4,2,1),(8,'2023-04-01','0',2,5,6,2),(9,'2023-02-28','1',6,5,9,7),(10,'2023-03-05','1',5,4,9,7);
/*!40000 ALTER TABLE `narocilo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osebje`
--

DROP TABLE IF EXISTS `osebje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osebje` (
  `osebjeID` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(30) NOT NULL,
  `priimek` varchar(30) NOT NULL,
  `naslov` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `placa` float(5,2) DEFAULT NULL,
  PRIMARY KEY (`osebjeID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osebje`
--

LOCK TABLES `osebje` WRITE;
/*!40000 ALTER TABLE `osebje` DISABLE KEYS */;
INSERT INTO `osebje` VALUES (1,'Aljaz','Marn','Soststro','Natakar63',6.00),(2,'Luka','Potrc','vic','Natakar69',4.00),(3,'Monika','Teran','Sostro','natakar',2.00),(4,'Kristjan','Lapanje','Dob','Natakar24',6.00),(5,'Nik','Hrovat','Gorjusa','natakar420',6.00),(6,'Manca','Capudr','Krtina','natakar23',7.00),(7,'Monika','Hrovat','Ljubljana','Natkar24',6.00),(8,'Andrew','Tate','Romunija','TopG',999.99),(9,'Luka','Kosir','Ljutomer','Natakar1',2.00),(10,'Bomba','Ratatuli','Spodnji Duplek','Normie',23.00);
/*!40000 ALTER TABLE `osebje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `placilo`
--

DROP TABLE IF EXISTS `placilo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `placilo` (
  `placiloID` int(11) NOT NULL AUTO_INCREMENT,
  `cena` float(5,2) DEFAULT NULL,
  `datum` date NOT NULL,
  `strankaID` int(11) DEFAULT NULL,
  `dostavaID` int(11) DEFAULT NULL,
  PRIMARY KEY (`placiloID`),
  KEY `placilo_strankaID_fk` (`strankaID`),
  KEY `placilo_dostavaID_fk` (`dostavaID`),
  CONSTRAINT `placilo_dostavaID_fk` FOREIGN KEY (`dostavaID`) REFERENCES `dostava` (`dostavaID`),
  CONSTRAINT `placilo_strankaID_fk` FOREIGN KEY (`strankaID`) REFERENCES `stranka` (`strankaID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `placilo`
--

LOCK TABLES `placilo` WRITE;
/*!40000 ALTER TABLE `placilo` DISABLE KEYS */;
INSERT INTO `placilo` VALUES (1,99.00,'2023-05-06',1,1),(2,10.00,'2023-02-04',9,10),(3,11.23,'2023-05-04',7,2),(4,9.99,'2022-02-01',8,4),(5,19.30,'2023-02-06',5,8),(6,10.10,'2023-06-02',5,9),(7,11.23,'2022-05-02',8,10),(8,5.10,'2023-05-05',2,3),(9,6.89,'2023-08-04',4,6),(10,999.99,'2023-10-10',10,10);
/*!40000 ALTER TABLE `placilo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stranka`
--

DROP TABLE IF EXISTS `stranka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stranka` (
  `strankaID` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(30) NOT NULL,
  `priimek` varchar(30) NOT NULL,
  `naslov` varchar(30) DEFAULT NULL,
  `telefonskaSt` varchar(30) NOT NULL,
  `stMize` int(11) NOT NULL,
  `davcna` varchar(30) NOT NULL,
  PRIMARY KEY (`strankaID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stranka`
--

LOCK TABLES `stranka` WRITE;
/*!40000 ALTER TABLE `stranka` DISABLE KEYS */;
INSERT INTO `stranka` VALUES (1,'Sandi','Stare','Ljutomer','123456789',1,'4567'),(2,'Mojir','Brus','Astro','309876568',2,'567 069'),(3,'Emin','Vidmar','Zgornji Duplek','679781434',2,'678 543'),(4,'Joso','Sajovic','Maribor','80984930',3,'9898 23'),(5,'Nedeljko','Ferk','Polje','542345666',2,'342 543'),(6,'Rene','Mernik','Zalog','346524556',39,'123 354'),(7,'Svetozar','Kukovic','Mlake','545423456',12,'345 966'),(8,'Ibro','Mihelcic','Nis','123543453',14,'543 342'),(9,'Tihomar','Dobrnik','Slovenj Gradec','542344533',23,'540 043'),(10,'Venceslav','Koncan','Zadobrova','678584636',16,'305 543');
/*!40000 ALTER TABLE `stranka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transakcija`
--

DROP TABLE IF EXISTS `transakcija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transakcija` (
  `transakcijaID` int(11) NOT NULL AUTO_INCREMENT,
  `datum` date NOT NULL,
  `strankaID` int(11) DEFAULT NULL,
  `osebjeID` int(11) DEFAULT NULL,
  `narociloID` int(11) DEFAULT NULL,
  PRIMARY KEY (`transakcijaID`),
  KEY `transakcija_strankaID_fk` (`strankaID`),
  KEY `transakcija_osebjeID_fk` (`osebjeID`),
  KEY `transakcija_narociloID_fk` (`narociloID`),
  CONSTRAINT `transakcija_narociloID_fk` FOREIGN KEY (`narociloID`) REFERENCES `narocilo` (`narociloID`),
  CONSTRAINT `transakcija_osebjeID_fk` FOREIGN KEY (`osebjeID`) REFERENCES `osebje` (`osebjeID`),
  CONSTRAINT `transakcija_strankaID_fk` FOREIGN KEY (`strankaID`) REFERENCES `stranka` (`strankaID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transakcija`
--

LOCK TABLES `transakcija` WRITE;
/*!40000 ALTER TABLE `transakcija` DISABLE KEYS */;
INSERT INTO `transakcija` VALUES (1,'2023-05-25',2,4,2),(2,'2023-04-04',4,2,1),(3,'2023-04-11',4,9,9),(4,'2023-05-05',2,10,8),(5,'2023-05-01',2,3,5),(6,'2023-05-06',2,8,7),(7,'2023-05-09',5,6,10),(8,'2023-05-05',2,1,8),(9,'2023-04-04',2,5,10),(10,'2023-05-06',9,9,9);
/*!40000 ALTER TABLE `transakcija` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-10 21:44:49
