-- MySQL dump 10.13  Distrib 5.5.34, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: exercise2
-- ------------------------------------------------------
-- Server version	5.5.34-0ubuntu0.13.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Branches`
--

DROP TABLE IF EXISTS `Branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Branches` (
  `BCode` varchar(3) NOT NULL DEFAULT '',
  `Librarian` varchar(20) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`BCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Branches`
--

LOCK TABLES `Branches` WRITE;
/*!40000 ALTER TABLE `Branches` DISABLE KEYS */;
INSERT INTO `Branches` VALUES ('B1','John Smith','2 Anglesa Rd'),('B2','Mary Jones','34 Pearse Rd'),('B3','Francis Owens','Grange X');
/*!40000 ALTER TABLE `Branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Holdings`
--

DROP TABLE IF EXISTS `Holdings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Holdings` (
  `Branch` varchar(3) DEFAULT NULL,
  `Title` varchar(20) DEFAULT NULL,
  `copies` int(11) DEFAULT NULL,
  KEY `Branch` (`Branch`),
  KEY `Title` (`Title`),
  CONSTRAINT `Holdings_ibfk_2` FOREIGN KEY (`Title`) REFERENCES `Titles` (`Title`),
  CONSTRAINT `Holdings_ibfk_1` FOREIGN KEY (`Branch`) REFERENCES `Branches` (`BCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Holdings`
--

LOCK TABLES `Holdings` WRITE;
/*!40000 ALTER TABLE `Holdings` DISABLE KEYS */;
INSERT INTO `Holdings` VALUES ('B1','Susannah',3),('B1','How to Fish',2),('B1','A History of Dublin',1),('B2','How to Fish',4),('B2','Computers',2),('B2','The Wife',3),('B3','A History of Dublin',1),('B3','Computers',4),('B3','Susannah',3),('B3','The Wife',1);
/*!40000 ALTER TABLE `Holdings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Locations`
--

DROP TABLE IF EXISTS `Locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Locations` (
  `lname` varchar(20) NOT NULL DEFAULT '',
  `phone` int(11) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`lname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Locations`
--

LOCK TABLES `Locations` WRITE;
/*!40000 ALTER TABLE `Locations` DISABLE KEYS */;
INSERT INTO `Locations` VALUES ('Buttery',7023421,'College St'),('Lincoln',6834523,'Lincoln Place'),('O\'Neill\'s',6742134,'Pearse St'),('Old Nag',7678132,'Dame St');
/*!40000 ALTER TABLE `Locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sandwiches`
--

DROP TABLE IF EXISTS `Sandwiches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sandwiches` (
  `location` varchar(20) NOT NULL DEFAULT '',
  `bread` varchar(20) NOT NULL DEFAULT '',
  `filling` varchar(20) NOT NULL DEFAULT '',
  `price` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`location`,`bread`,`filling`),
  CONSTRAINT `Sandwiches_ibfk_1` FOREIGN KEY (`location`) REFERENCES `Locations` (`lname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sandwiches`
--

LOCK TABLES `Sandwiches` WRITE;
/*!40000 ALTER TABLE `Sandwiches` DISABLE KEYS */;
INSERT INTO `Sandwiches` VALUES ('Buttery','White','Cheese',1.00),('Buttery','White','Ham',1.10),('Lincoln','Rye','Beef',1.35),('Lincoln','Rye','Ham',1.25),('Lincoln','White','Ham',1.30),('O\'Neill\'s','White','Cheese',1.20),('O\'Neill\'s','White','Turkey',1.35),('O\'Neill\'s','Whole','Ham',1.25),('Old Nag','Rye','Beef',1.35),('Old Nag','Rye','Ham',1.40);
/*!40000 ALTER TABLE `Sandwiches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tastes`
--

DROP TABLE IF EXISTS `Tastes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tastes` (
  `name` varchar(20) NOT NULL DEFAULT '',
  `filling` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`,`filling`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tastes`
--

LOCK TABLES `Tastes` WRITE;
/*!40000 ALTER TABLE `Tastes` DISABLE KEYS */;
INSERT INTO `Tastes` VALUES ('Brown','Beef'),('Brown','Ham'),('Brown','Turkey'),('Green','Beef'),('Green','Cheese'),('Green','Turkey'),('Jones','Cheese');
/*!40000 ALTER TABLE `Tastes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Titles`
--

DROP TABLE IF EXISTS `Titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Titles` (
  `Title` varchar(20) NOT NULL DEFAULT '',
  `Author` varchar(20) DEFAULT NULL,
  `Publisher` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Titles`
--

LOCK TABLES `Titles` WRITE;
/*!40000 ALTER TABLE `Titles` DISABLE KEYS */;
INSERT INTO `Titles` VALUES ('A History of Dublin','David Little','Wiley'),('Computers','Blaise Pascal','Applewoods'),('How to Fish','Amy Fly','Stop Press'),('Susannah','Ann Brown','Macmilan'),('The Wife','Ann Brown','Macmilan');
/*!40000 ALTER TABLE `Titles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-13 12:34:37
