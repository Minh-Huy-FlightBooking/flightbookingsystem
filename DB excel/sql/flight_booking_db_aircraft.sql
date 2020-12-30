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
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft` (
  `aircraft_id` int NOT NULL AUTO_INCREMENT,
  `enabled` int DEFAULT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `total_business` int DEFAULT NULL,
  `total_economy` int DEFAULT NULL,
  `airport_id` int DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  PRIMARY KEY (`aircraft_id`),
  KEY `FK9ahwnfxn3fx9gi2m6523jl8cl` (`airport_id`),
  KEY `FK64wp6pj7j76iduaq9hgs6un3g` (`brand_id`),
  CONSTRAINT `FK64wp6pj7j76iduaq9hgs6un3g` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`),
  CONSTRAINT `FK9ahwnfxn3fx9gi2m6523jl8cl` FOREIGN KEY (`airport_id`) REFERENCES `airport` (`airport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES (2,0,'VJ-621',0,142,1,1),(3,0,'VJ-647',48,120,1,2),(4,0,'VJ-623',48,144,1,3),(5,0,'VN-115',32,152,1,4),(6,0,'VN-127',40,206,1,5),(7,0,'VN-7137',38,256,1,6),(8,0,'QH-155',52,198,1,7),(9,0,'QH-3728',68,136,1,8),(10,0,'QH-193',52,150,1,9),(11,0,'VJ-621',0,142,2,1),(12,0,'VJ-647',48,120,2,2),(13,0,'VJ-623',48,144,2,3),(14,0,'VN-115',32,152,2,4),(15,0,'VN-127',40,206,2,5),(16,0,'VN-7137',38,256,2,6),(17,0,'QH-155',52,198,2,7),(18,0,'QH-3728',68,136,2,8),(19,0,'QH-193',52,150,2,9),(20,0,'VJ-621',0,142,3,1),(21,0,'VJ-647',48,120,3,2),(22,0,'VJ-623',48,144,3,3),(23,0,'VN-115',32,152,3,4),(24,0,'VN-127',40,206,3,5),(25,0,'VN-7137',38,256,3,6),(26,0,'QH-155',52,198,3,7),(27,0,'QH-3728',68,136,3,8),(28,0,'QH-193',52,150,3,9),(29,0,'VJ-621',0,142,4,1),(30,0,'VJ-647',48,120,4,2),(31,0,'VJ-623',48,144,4,3),(32,0,'VN-115',32,152,4,4),(33,0,'VN-127',40,206,4,5),(34,0,'VN-7137',38,256,4,6),(35,0,'QH-155',52,198,4,7),(36,0,'QH-3728',68,136,4,8),(37,0,'QH-193',52,150,4,9),(38,0,'VJ-621',0,142,5,1),(39,0,'VJ-647',48,120,5,2),(40,0,'VJ-623',48,144,5,3),(41,0,'VN-115',32,152,5,4),(42,0,'VN-127',40,206,5,5),(43,0,'VN-7137',38,256,5,6),(44,0,'QH-155',52,198,5,7),(45,0,'QH-3728',68,136,5,8),(46,0,'QH-193',52,150,5,9),(47,0,'VJ-621',0,142,6,1),(48,0,'VJ-647',48,120,6,2),(49,0,'VJ-623',48,144,6,3),(50,0,'VN-115',32,152,6,4),(51,0,'VN-127',40,206,6,5),(52,0,'VN-7137',38,256,6,6),(53,0,'QH-155',52,198,6,7),(54,0,'QH-3728',68,136,6,8),(55,0,'QH-193',52,150,6,9);
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-30 15:40:15
