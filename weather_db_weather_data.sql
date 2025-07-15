-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: weather_db
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.20.04.1

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
-- Table structure for table `weather_data`
--

DROP TABLE IF EXISTS `weather_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `response` text,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_data`
--

LOCK TABLES `weather_data` WRITE;
/*!40000 ALTER TABLE `weather_data` DISABLE KEYS */;
INSERT INTO `weather_data` VALUES (1,'Alwar','{\"coord\":{\"lon\":\"76.6\",\"lat\":\"27.5667\"},\"weather\":[{\"id\":\"804\",\"main\":\"Clouds\",\"description\":\"overcast clouds\",\"icon\":\"04n\"}],\"base\":\"stations\",\"main\":{\"temp\":\"26.52\",\"feels_like\":\"26.52\",\"temp_min\":\"26.52\",\"temp_max\":\"26.52\",\"pressure\":\"998\",\"humidity\":\"82\",\"sea_level\":\"998\",\"grnd_level\":\"958\"},\"visibility\":\"10000\",\"wind\":{\"speed\":\"5.8\",\"deg\":\"136\",\"gust\":\"9.58\"},\"clouds\":{\"all\":\"100\"},\"dt\":\"1752506411\",\"sys\":{\"country\":\"IN\",\"sunrise\":\"1752451631\",\"sunset\":\"1752501077\"},\"timezone\":\"19800\",\"id\":\"1278946\",\"name\":\"Alwar\",\"cod\":\"200\"}','2025-07-14 20:53:59'),(2,'Jaipur','{\"coord\":{\"lon\":\"75.8167\",\"lat\":\"26.9167\"},\"weather\":[{\"id\":\"804\",\"main\":\"Clouds\",\"description\":\"overcast clouds\",\"icon\":\"04n\"}],\"base\":\"stations\",\"main\":{\"temp\":\"25.91\",\"feels_like\":\"27.06\",\"temp_min\":\"25.91\",\"temp_max\":\"25.91\",\"pressure\":\"998\",\"humidity\":\"96\",\"sea_level\":\"998\",\"grnd_level\":\"950\"},\"visibility\":\"3441\",\"wind\":{\"speed\":\"4.6\",\"deg\":\"164\",\"gust\":\"7.55\"},\"clouds\":{\"all\":\"100\"},\"dt\":\"1752506041\",\"sys\":{\"country\":\"IN\",\"sunrise\":\"1752451901\",\"sunset\":\"1752501183\"},\"timezone\":\"19800\",\"id\":\"1269515\",\"name\":\"Jaipur\",\"cod\":\"200\"}','2025-07-14 20:55:08'),(3,'Alwar','{\"coord\":{\"lon\":\"76.6\",\"lat\":\"27.5667\"},\"weather\":[{\"id\":\"804\",\"main\":\"Clouds\",\"description\":\"overcast clouds\",\"icon\":\"04n\"}],\"base\":\"stations\",\"main\":{\"temp\":\"26.52\",\"feels_like\":\"26.52\",\"temp_min\":\"26.52\",\"temp_max\":\"26.52\",\"pressure\":\"998\",\"humidity\":\"82\",\"sea_level\":\"998\",\"grnd_level\":\"958\"},\"visibility\":\"10000\",\"wind\":{\"speed\":\"5.8\",\"deg\":\"136\",\"gust\":\"9.58\"},\"clouds\":{\"all\":\"100\"},\"dt\":\"1752506820\",\"sys\":{\"country\":\"IN\",\"sunrise\":\"1752451631\",\"sunset\":\"1752501077\"},\"timezone\":\"19800\",\"id\":\"1278946\",\"name\":\"Alwar\",\"cod\":\"200\"}','2025-07-14 21:00:37'),(4,'London','{\"coord\":{\"lon\":\"-0.1257\",\"lat\":\"51.5085\"},\"weather\":[{\"id\":\"804\",\"main\":\"Clouds\",\"description\":\"overcast clouds\",\"icon\":\"04d\"}],\"base\":\"stations\",\"main\":{\"temp\":\"23.75\",\"feels_like\":\"23.25\",\"temp_min\":\"23.75\",\"temp_max\":\"23.75\",\"pressure\":\"1013\",\"humidity\":\"41\",\"sea_level\":\"1013\",\"grnd_level\":\"1008\"},\"visibility\":\"10000\",\"wind\":{\"speed\":\"7.69\",\"deg\":\"219\",\"gust\":\"10.43\"},\"clouds\":{\"all\":\"87\"},\"dt\":\"1752507458\",\"sys\":{\"country\":\"GB\",\"sunrise\":\"1752465581\",\"sunset\":\"1752523958\"},\"timezone\":\"3600\",\"id\":\"2643743\",\"name\":\"London\",\"cod\":\"200\"}','2025-07-14 21:13:49'),(5,'Mexico','{\"coord\":{\"lon\":\"120.7198\",\"lat\":\"15.0646\"},\"weather\":[{\"id\":\"802\",\"main\":\"Clouds\",\"description\":\"scattered clouds\",\"icon\":\"03n\"}],\"base\":\"stations\",\"main\":{\"temp\":\"27.46\",\"feels_like\":\"32.08\",\"temp_min\":\"27.46\",\"temp_max\":\"27.46\",\"pressure\":\"1008\",\"humidity\":\"90\",\"sea_level\":\"1008\",\"grnd_level\":\"1002\"},\"visibility\":\"10000\",\"wind\":{\"speed\":\"0.77\",\"deg\":\"296\",\"gust\":\"1.14\"},\"clouds\":{\"all\":\"26\"},\"dt\":\"1752509183\",\"sys\":{\"country\":\"PH\",\"sunrise\":\"1752528883\",\"sunset\":\"1752575458\"},\"timezone\":\"28800\",\"id\":\"1699805\",\"name\":\"Mexico\",\"cod\":\"200\"}','2025-07-14 21:37:53'),(6,'Pune','{\"coord\":{\"lon\":\"73.8553\",\"lat\":\"18.5196\"},\"weather\":[{\"id\":\"804\",\"main\":\"Clouds\",\"description\":\"overcast clouds\",\"icon\":\"04n\"}],\"base\":\"stations\",\"main\":{\"temp\":\"23.36\",\"feels_like\":\"24\",\"temp_min\":\"23.36\",\"temp_max\":\"23.36\",\"pressure\":\"1007\",\"humidity\":\"86\",\"sea_level\":\"1007\",\"grnd_level\":\"935\"},\"visibility\":\"10000\",\"wind\":{\"speed\":\"4.29\",\"deg\":\"245\",\"gust\":\"10.73\"},\"clouds\":{\"all\":\"95\"},\"dt\":\"1752508911\",\"sys\":{\"country\":\"IN\",\"sunrise\":\"1752453347\",\"sunset\":\"1752500678\"},\"timezone\":\"19800\",\"id\":\"1259229\",\"name\":\"Pune\",\"cod\":\"200\"}','2025-07-14 21:38:04'),(7,'Nursery circle vaishali nagar jaipur','{\"coord\":{\"lon\":\"75.7385\",\"lat\":\"26.911\"},\"weather\":[{\"id\":\"804\",\"main\":\"Clouds\",\"description\":\"overcast clouds\",\"icon\":\"04n\"}],\"base\":\"stations\",\"main\":{\"temp\":\"26.28\",\"feels_like\":\"26.28\",\"temp_min\":\"26.28\",\"temp_max\":\"26.28\",\"pressure\":\"998\",\"humidity\":\"96\",\"sea_level\":\"998\",\"grnd_level\":\"951\"},\"visibility\":\"10000\",\"wind\":{\"speed\":\"6.2\",\"deg\":\"196\",\"gust\":\"8.24\"},\"clouds\":{\"all\":\"100\"},\"dt\":\"1752509768\",\"sys\":{\"country\":\"IN\",\"sunrise\":\"1752451920\",\"sunset\":\"1752501201\"},\"timezone\":\"19800\",\"id\":\"8199371\",\"name\":\"Rambagh\",\"cod\":\"200\"}','2025-07-14 21:46:18');
/*!40000 ALTER TABLE `weather_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-14 21:47:04
