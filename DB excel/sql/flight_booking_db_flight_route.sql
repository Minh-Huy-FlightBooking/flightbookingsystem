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
-- Table structure for table `flight_route`
--

DROP TABLE IF EXISTS `flight_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight_route` (
  `route_id` int NOT NULL AUTO_INCREMENT,
  `destination_airport_id` int DEFAULT NULL,
  `origin_airport_id` int DEFAULT NULL,
  PRIMARY KEY (`route_id`),
  KEY `FK62kea04claotge75lb66sn7to` (`destination_airport_id`),
  KEY `FK28ocbsujqoqwn7wlepf6fhxqx` (`origin_airport_id`),
  CONSTRAINT `FK28ocbsujqoqwn7wlepf6fhxqx` FOREIGN KEY (`origin_airport_id`) REFERENCES `airport` (`airport_id`),
  CONSTRAINT `FK62kea04claotge75lb66sn7to` FOREIGN KEY (`destination_airport_id`) REFERENCES `airport` (`airport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_route`
--

LOCK TABLES `flight_route` WRITE;
/*!40000 ALTER TABLE `flight_route` DISABLE KEYS */;
INSERT INTO `flight_route` VALUES (1,2,1),(2,3,1),(3,4,1),(4,5,1),(5,6,1),(6,7,1),(7,8,1),(8,9,1),(9,10,1),(10,11,1),(11,12,1),(12,13,1),(13,14,1),(14,15,1),(15,16,1),(16,17,1),(17,18,1),(18,19,1),(19,20,1),(20,21,1),(21,22,1),(22,23,1),(23,24,1),(24,25,1),(25,26,1),(26,27,1),(27,28,1),(28,29,1),(29,30,1),(30,31,1),(31,32,1),(32,33,1),(33,1,2),(34,3,2),(35,4,2),(36,5,2),(37,6,2),(38,7,2),(39,8,2),(40,9,2),(41,10,2),(42,11,2),(43,12,2),(44,13,2),(45,14,2),(46,15,2),(47,16,2),(48,17,2),(49,18,2),(50,19,2),(51,20,2),(52,21,2),(53,22,2),(54,23,2),(55,24,2),(56,25,2),(57,26,2),(58,27,2),(59,28,2),(60,29,2),(61,30,2),(62,31,2),(63,32,2),(64,33,2),(65,1,3),(66,2,3),(67,4,3),(68,5,3),(69,6,3),(70,7,3),(71,8,3),(72,9,3),(73,10,3),(74,11,3),(75,12,3),(76,13,3),(77,14,3),(78,15,3),(79,16,3),(80,17,3),(81,18,3),(82,19,3),(83,20,3),(84,21,3),(85,22,3),(86,23,3),(87,24,3),(88,25,3),(89,26,3),(90,27,3),(91,28,3),(92,29,3),(93,30,3),(94,31,3),(95,32,3),(96,33,3),(97,1,4),(98,2,4),(99,3,4),(100,5,4),(101,6,4),(102,7,4),(103,8,4),(104,9,4),(105,10,4),(106,11,4),(107,12,4),(108,13,4),(109,14,4),(110,15,4),(111,16,4),(112,17,4),(113,18,4),(114,19,4),(115,20,4),(116,21,4),(117,22,4),(118,23,4),(119,24,4),(120,25,4),(121,26,4),(122,27,4),(123,28,4),(124,29,4),(125,30,4),(126,31,4),(127,32,4),(128,33,4),(129,1,5),(130,2,5),(131,3,5),(132,4,5),(133,6,5),(134,7,5),(135,8,5),(136,9,5),(137,10,5),(138,11,5),(139,12,5),(140,13,5),(141,14,5),(142,15,5),(143,16,5),(144,17,5),(145,18,5),(146,19,5),(147,20,5),(148,21,5),(149,22,5),(150,23,5),(151,24,5),(152,25,5),(153,26,5),(154,27,5),(155,28,5),(156,29,5),(157,30,5),(158,31,5),(159,32,5),(160,33,5),(161,1,6),(162,2,6),(163,3,6),(164,4,6),(165,5,6),(166,7,6),(167,8,6),(168,9,6),(169,10,6),(170,11,6),(171,12,6),(172,13,6),(173,14,6),(174,15,6),(175,16,6),(176,17,6),(177,18,6),(178,19,6),(179,20,6),(180,21,6),(181,22,6),(182,23,6),(183,24,6),(184,25,6),(185,26,6),(186,27,6),(187,28,6),(188,29,6),(189,30,6),(190,31,6),(191,32,6),(192,33,6);
/*!40000 ALTER TABLE `flight_route` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-16 20:42:27
