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
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `airport_id` int NOT NULL AUTO_INCREMENT,
  `airport_name` varchar(255) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  PRIMARY KEY (`airport_id`),
  KEY `FKf583ieaw0ttnwklqy222tfru0` (`city_id`),
  CONSTRAINT `FKf583ieaw0ttnwklqy222tfru0` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES (1,'Da Nang(DAD)',1),(2,'Tan Son Nhat(SGN)',2),(3,'Noi Bai(HAN)',3),(4,'Nha Trang(NHA)',4),(5,'Dalat(DAL)',5),(6,'Hue(HUI)',6),(7,'Suvarnabhumi(BKK)',7),(8,'Krabi(KBV)',8),(9,'Chiang Mai(CNX)',9),(10,'Koh Samui(USM)',10),(11,'Changi(SIN)',11),(12,'Hamad(DOH)',12),(13,'Attapeu(AOU)',13),(14,'Pakse(PKZ)',14),(15,'Luang Prabang(LPQ)',15),(16,'Savannakhet(ZVK)',16),(17,'Wattay(VTE)',17),(18,'Phnom Penh(PNH)',18),(19,'Svay Rieng(SVR)',19),(20,'Siem Reap(REP)',20),(21,'Sihanoukville(KOS)',21),(22,'Roxas(RXS)',22),(23,'Basco(BSO)',23),(24,'Ninoy Aquino(MNL)',24),(25,'Mactan(CEB)',25),(26,'Soekarno Hatta(CGK)',26),(27,'Ngurah Rai(DPS)',27),(28,'Ambon(AMQ)',28),(29,'Kupang(KOE)',29),(30,'Mingaladon(RGN)',30),(31,'Bagan(NYU)',31),(32,'Dawei(TVY)',32),(33,'Heho(HEH)',33);
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-15 18:27:50
