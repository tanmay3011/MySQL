-- MySQL dump 10.13  Distrib 5.5.34, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: ckms
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
-- Table structure for table `project_techs`
--

DROP TABLE IF EXISTS `project_techs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_techs` (
  `id` bigint(20) DEFAULT NULL,
  `technology_id` bigint(20) DEFAULT NULL,
  KEY `technology_id` (`technology_id`),
  CONSTRAINT `project_techs_ibfk_1` FOREIGN KEY (`technology_id`) REFERENCES `technologies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_techs`
--

LOCK TABLES `project_techs` WRITE;
/*!40000 ALTER TABLE `project_techs` DISABLE KEYS */;
INSERT INTO `project_techs` VALUES (1,1),(1,2),(1,3),(1,4),(2,5),(3,6),(4,5),(4,6),(5,3),(5,4),(6,1),(6,2),(6,6),(7,6),(7,5),(8,1),(8,2),(8,3),(8,4),(8,6),(9,5);
/*!40000 ALTER TABLE `project_techs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Completed'),(2,'Completed'),(3,'Completed'),(4,'Completed'),(5,'Working'),(6,'Working'),(7,'Completed'),(8,'Completed'),(9,'Completed');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technologies`
--

DROP TABLE IF EXISTS `technologies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technologies` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technologies`
--

LOCK TABLES `technologies` WRITE;
/*!40000 ALTER TABLE `technologies` DISABLE KEYS */;
INSERT INTO `technologies` VALUES (1,'HTML'),(2,'Javascript'),(3,'Ruby'),(4,'Rails'),(5,'IOS'),(6,'Android');
/*!40000 ALTER TABLE `technologies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_projects`
--

DROP TABLE IF EXISTS `user_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_projects` (
  `user_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `user_projects_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_projects_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_projects`
--

LOCK TABLES `user_projects` WRITE;
/*!40000 ALTER TABLE `user_projects` DISABLE KEYS */;
INSERT INTO `user_projects` VALUES (1,1),(1,2),(1,3),(1,6),(2,1),(2,3),(2,7),(2,9),(3,1),(3,2),(3,8),(3,9),(4,1),(4,2),(4,4),(4,5),(4,6);
/*!40000 ALTER TABLE `user_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'UserA'),(2,'UserB'),(3,'UserC'),(4,'UserD');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-16  1:23:11
