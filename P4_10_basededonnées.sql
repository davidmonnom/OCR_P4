-- MySQL dump 10.16  Distrib 10.1.44-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: PROJET4
-- ------------------------------------------------------
-- Server version	10.1.44-MariaDB-0ubuntu0.18.04.1

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `address_id` int(10) NOT NULL AUTO_INCREMENT,
  `street` varchar(30) NOT NULL,
  `house_number` int(4) NOT NULL,
  `postcode` int(6) NOT NULL,
  `city` varchar(15) NOT NULL,
  `country` varchar(15) NOT NULL,
  `gps_coordonate` varchar(35) NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'Rue Samiette',1,1400,'Nivelles','Belgique','35.2565,25.6654'),(2,'Rue de Corsal',1,1450,'Chastre','Belgique','36.2565,55.6654'),(3,'Rue l\'ami',565,1320,'wavre','Belgique','37.2565,5.6654'),(4,'Rue alfred haulotte',565,1320,'wavre','Belgique','3.2565,2.6654'),(5,'Rue l\'ouies',3,1450,'chisgte','Belgique','8.2565,9.6654'),(6,'Rue l\'Estaux',4,4444,'Chance','Belgique','35.2565,25.6654');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `client_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` int(12) NOT NULL,
  `gender` varchar(3) NOT NULL DEFAULT 'Mr',
  `address_id` int(10) NOT NULL,
  `login_user` varchar(10) NOT NULL,
  `password_user` varchar(15) NOT NULL,
  PRIMARY KEY (`client_id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'théo','Monnom','theo@gmail.com',49565854,'Mr',1,'theo.monno','ez1d1z91c'),(2,'David','Monnom','david@gmail.com',41068489,'Mr',2,'david.mon','e4ezfze1f5'),(3,'Loic','Martin','loic@gmail.com',466885566,'Mr',3,'loic.mart','1d56z14d5'),(4,'Quentin','Houssonloge','quentin@gmail.com',477525654,'Mr',4,'quentin.h','ec84z42d8e'),(5,'francois','guielmment','fran@gmail.com',4565505,'Mr',5,'francois.g','efse88es4c'),(6,'Lucko','Gladoria','lukgla@gmail.com',496585652,'Mr',6,'luck.glo','c859ez482');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `command_details`
--

DROP TABLE IF EXISTS `command_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `command_details` (
  `detail_id` int(10) NOT NULL AUTO_INCREMENT,
  `meal_id` int(10) NOT NULL,
  `command_id` int(10) NOT NULL,
  `number_of` int(10) NOT NULL,
  PRIMARY KEY (`detail_id`),
  KEY `article_id` (`meal_id`),
  KEY `command_id` (`command_id`),
  CONSTRAINT `command_details_ibfk_1` FOREIGN KEY (`command_id`) REFERENCES `commands` (`id_command`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `command_details_ibfk_2` FOREIGN KEY (`meal_id`) REFERENCES `meals` (`meal_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `command_details`
--

LOCK TABLES `command_details` WRITE;
/*!40000 ALTER TABLE `command_details` DISABLE KEYS */;
INSERT INTO `command_details` VALUES (1,1,1,2),(2,2,1,1),(3,2,2,2),(4,3,2,25);
/*!40000 ALTER TABLE `command_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commands`
--

DROP TABLE IF EXISTS `commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commands` (
  `id_command` int(10) NOT NULL AUTO_INCREMENT,
  `client_id` int(10) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delivered_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `delivery_id` int(10) NOT NULL,
  `command_price` decimal(6,2) NOT NULL,
  `commands_status_id` int(10) NOT NULL,
  `payment_status_id` int(10) NOT NULL,
  PRIMARY KEY (`id_command`),
  KEY `client_id` (`client_id`),
  KEY `delivery_id` (`delivery_id`),
  KEY `commands_status_id` (`commands_status_id`),
  KEY `payment_status_id` (`payment_status_id`),
  CONSTRAINT `commands_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `commands_ibfk_2` FOREIGN KEY (`delivery_id`) REFERENCES `delivery_boy` (`delivery_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `commands_ibfk_3` FOREIGN KEY (`commands_status_id`) REFERENCES `commands_status` (`command_status_id`),
  CONSTRAINT `commands_ibfk_4` FOREIGN KEY (`payment_status_id`) REFERENCES `payment_status` (`id_payment_status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commands`
--

LOCK TABLES `commands` WRITE;
/*!40000 ALTER TABLE `commands` DISABLE KEYS */;
INSERT INTO `commands` VALUES (1,2,'2020-05-31 15:41:05','0000-00-00 00:00:00',1,25.60,1,1),(2,4,'2020-06-12 18:29:28','0000-00-00 00:00:00',1,33.65,2,2);
/*!40000 ALTER TABLE `commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commands_status`
--

DROP TABLE IF EXISTS `commands_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commands_status` (
  `command_status_id` int(10) NOT NULL AUTO_INCREMENT,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`command_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commands_status`
--

LOCK TABLES `commands_status` WRITE;
/*!40000 ALTER TABLE `commands_status` DISABLE KEYS */;
INSERT INTO `commands_status` VALUES (1,0),(2,1);
/*!40000 ALTER TABLE `commands_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_boy`
--

DROP TABLE IF EXISTS `delivery_boy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_boy` (
  `delivery_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'Free',
  `address_id` int(10) NOT NULL,
  `identification_number` int(5) NOT NULL,
  `gps_localisation` varchar(35) NOT NULL,
  `login_user` varchar(10) NOT NULL,
  `password_user` varchar(15) NOT NULL,
  PRIMARY KEY (`delivery_id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `delivery_boy_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_boy`
--

LOCK TABLES `delivery_boy` WRITE;
/*!40000 ALTER TABLE `delivery_boy` DISABLE KEYS */;
INSERT INTO `delivery_boy` VALUES (1,'Céline','De Bilde','Free',1,666,'50.880487, 4.295572','celine.db','e1ez6484d28'),(2,'Thomas','Monnom','Free',2,234,'50.880487, 4.295572','theo.mn','ez482c2e98');
/*!40000 ALTER TABLE `delivery_boy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_boy_stock`
--

DROP TABLE IF EXISTS `delivery_boy_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_boy_stock` (
  `boy_stock_id` int(10) NOT NULL AUTO_INCREMENT,
  `delivery_boy_id` int(10) NOT NULL,
  `meal_id` int(10) NOT NULL,
  `quantity` int(4) NOT NULL,
  PRIMARY KEY (`boy_stock_id`),
  KEY `delivery_boy_id` (`delivery_boy_id`),
  KEY `meal_id` (`meal_id`),
  CONSTRAINT `delivery_boy_stock_ibfk_1` FOREIGN KEY (`delivery_boy_id`) REFERENCES `delivery_boy` (`delivery_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `delivery_boy_stock_ibfk_2` FOREIGN KEY (`meal_id`) REFERENCES `meals` (`meal_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_boy_stock`
--

LOCK TABLES `delivery_boy_stock` WRITE;
/*!40000 ALTER TABLE `delivery_boy_stock` DISABLE KEYS */;
INSERT INTO `delivery_boy_stock` VALUES (1,1,1,5),(2,1,2,3),(3,2,1,10),(4,2,2,10),(5,2,3,52);
/*!40000 ALTER TABLE `delivery_boy_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal_type`
--

DROP TABLE IF EXISTS `meal_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meal_type` (
  `id_meal_type` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id_meal_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal_type`
--

LOCK TABLES `meal_type` WRITE;
/*!40000 ALTER TABLE `meal_type` DISABLE KEYS */;
INSERT INTO `meal_type` VALUES (1,'plat'),(2,'dessert');
/*!40000 ALTER TABLE `meal_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meals`
--

DROP TABLE IF EXISTS `meals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meals` (
  `meal_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `descritpion` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `meal_type_id` int(10) NOT NULL,
  PRIMARY KEY (`meal_id`),
  KEY `i_name` (`name`),
  KEY `name` (`name`),
  KEY `name_2` (`name`),
  KEY `meal_type_id` (`meal_type_id`),
  KEY `meal_type_id_2` (`meal_type_id`),
  CONSTRAINT `meals_ibfk_1` FOREIGN KEY (`meal_type_id`) REFERENCES `meal_type` (`id_meal_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meals`
--

LOCK TABLES `meals` WRITE;
/*!40000 ALTER TABLE `meals` DISABLE KEYS */;
INSERT INTO `meals` VALUES (1,'Spaghetti Bolo',13.00,'Pate à la sauce tomatte avec du haché de boeuf.','2020-05-31 15:50:02',1),(2,'Pâte carbonara',14.00,'Pate avec des oeufs et de la crème, ainsi que des lardons.','2020-05-31 15:50:02',1),(3,'Gateau au chocolat',14.50,'Chocolat fondant ','2020-06-12 18:26:48',2);
/*!40000 ALTER TABLE `meals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_status`
--

DROP TABLE IF EXISTS `payment_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_status` (
  `id_payment_status` int(10) NOT NULL AUTO_INCREMENT,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_payment_status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_status`
--

LOCK TABLES `payment_status` WRITE;
/*!40000 ALTER TABLE `payment_status` DISABLE KEYS */;
INSERT INTO `payment_status` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `payment_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_stock`
--

DROP TABLE IF EXISTS `restaurant_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant_stock` (
  `stock_id` int(10) NOT NULL AUTO_INCREMENT,
  `meal_id` int(10) NOT NULL,
  `quantity` int(4) NOT NULL,
  PRIMARY KEY (`stock_id`),
  KEY `meal_id` (`meal_id`),
  CONSTRAINT `restaurant_stock_ibfk_1` FOREIGN KEY (`meal_id`) REFERENCES `meals` (`meal_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_stock`
--

LOCK TABLES `restaurant_stock` WRITE;
/*!40000 ALTER TABLE `restaurant_stock` DISABLE KEYS */;
INSERT INTO `restaurant_stock` VALUES (1,1,50),(2,2,50);
/*!40000 ALTER TABLE `restaurant_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `today_meal`
--

DROP TABLE IF EXISTS `today_meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `today_meal` (
  `meal_today_id` int(10) NOT NULL AUTO_INCREMENT,
  `meal_id` int(10) NOT NULL,
  PRIMARY KEY (`meal_today_id`),
  KEY `meal_id` (`meal_id`),
  CONSTRAINT `today_meal_ibfk_1` FOREIGN KEY (`meal_id`) REFERENCES `meals` (`meal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `today_meal`
--

LOCK TABLES `today_meal` WRITE;
/*!40000 ALTER TABLE `today_meal` DISABLE KEYS */;
/*!40000 ALTER TABLE `today_meal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-14 12:09:14
