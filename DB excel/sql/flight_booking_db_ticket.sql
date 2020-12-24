-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: flight_booking_db
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `enabled` tinyint DEFAULT NULL,
  `booking_id` int DEFAULT NULL,
  `flight_id` int DEFAULT NULL,
  `passenger_id` int DEFAULT NULL,
  `ticket_type_id` int DEFAULT NULL,
  `travel_class` int DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `FKrg7x158t96nucwslhq2bad6qm` (`booking_id`),
  KEY `FKfju27cbcbl1w16qeora1r636q` (`flight_id`),
  KEY `FK3y0nr3g8pk6ygc173mjaaumgh` (`passenger_id`),
  KEY `FKicdt7jp8dniw1fw6y8y0u9gcr` (`ticket_type_id`),
  KEY `FKa6aaya0oldr9o77wr6bna2rnt` (`travel_class`),
  CONSTRAINT `FK3y0nr3g8pk6ygc173mjaaumgh` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`),
  CONSTRAINT `FKa6aaya0oldr9o77wr6bna2rnt` FOREIGN KEY (`travel_class`) REFERENCES `travel_class` (`class_id`),
  CONSTRAINT `FKfju27cbcbl1w16qeora1r636q` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`),
  CONSTRAINT `FKicdt7jp8dniw1fw6y8y0u9gcr` FOREIGN KEY (`ticket_type_id`) REFERENCES `ticket_type` (`ticket_type_id`),
  CONSTRAINT `FKrg7x158t96nucwslhq2bad6qm` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,1,1,3,1,NULL,NULL),(2,1,1,4,1,NULL,NULL),(3,1,1,3,1,NULL,NULL),(4,1,1,4,1,NULL,NULL),(5,1,1,4,1,NULL,NULL),(6,1,1,6,1,NULL,NULL),(7,1,1,6,1,NULL,NULL),(8,1,1,7,1,NULL,NULL),(9,1,1,7,1,NULL,NULL),(10,1,1,8,1,NULL,NULL),(11,1,1,8,1,NULL,NULL);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-24 14:22:27
