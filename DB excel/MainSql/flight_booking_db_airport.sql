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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES (1,'Phung-Duc Airport (BMV)',1),(2,'Ca Mau Airport (CAH)',2),(3,'Can Tho Airport (VCA)',3),(4,'Cape St Jacques Airport (CSJ)',4),(5,'Coong Airport (VCS)',5),(6,'Da Nang Airport (DAD)',6),(7,'Lienkhang Airport (DLI)',7),(8,'Dien Bien Airport (DIN)',8),(9,'Catbi Airport (HPH)',9),(10,'Noibai Airport (HAN)',10),(11,'Tan Son Nhat International Airport (SGN)',11),(12,'Phu Bai Airport (HUI)',12),(13,'Kontum Airport (KON)',13),(14,'Long Xuyen Airport (XLO)',14),(15,'Cam Ranh Airport (CXR)',15),(16,'Nha Trang Airport (NHA)',16),(17,'Phan Rang Airport (PHA)',17),(18,'Phan Thiet Airport (PHH)',18),(19,'Duong Dang Airport (PQC)',19),(20,'Phu Vinh Airport (PHU)',20),(21,'Phu-bon Airport (HBN)',21),(22,'Phuoclong Airport (VSO)',22),(23,'Pleiku Airport (PXU)',23),(24,'Nhon Co Airport (HOO)',24),(25,'Quang Ngai Airport (XNG)',25),(26,'Qui Nhon Airport (UIH)',26),(27,'Rach Gia Airport (VKG)',27),(28,'Soc Trang Airport (SOA)',28),(29,'Na-San Airport (SQH)',29),(30,'Chulai Airport (VCL)',30),(31,'Tamky Airport (TMK)',31),(32,'Tuy Hoa Airport (TBB)',32),(33,'Vinh City Airport (VII)',33),(34,'Vinh Long Airport (XVL)',34),(35,'Vung Tau Airport (VTG)',35);
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

-- Dump completed on 2021-01-04  2:37:23
