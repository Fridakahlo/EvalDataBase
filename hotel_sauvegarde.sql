-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: hotel
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Table structure for table `bathrooms`
--

DROP TABLE IF EXISTS `bathrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bathrooms` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bathrooms`
--

LOCK TABLES `bathrooms` WRITE;
/*!40000 ALTER TABLE `bathrooms` DISABLE KEYS */;
INSERT INTO `bathrooms` VALUES (1,'douche'),(2,'baignoire'),(3,'douche et baignoire');
/*!40000 ALTER TABLE `bathrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beds`
--

DROP TABLE IF EXISTS `beds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beds` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beds`
--

LOCK TABLES `beds` WRITE;
/*!40000 ALTER TABLE `beds` DISABLE KEYS */;
INSERT INTO `beds` VALUES (1,'simple'),(2,'double queen'),(3,'double king');
/*!40000 ALTER TABLE `beds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `arrival_date` date NOT NULL,
  `departure_date` date NOT NULL,
  `guest` smallint(5) unsigned NOT NULL,
  `state` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_guest` (`guest`),
  KEY `fk_state` (`state`),
  CONSTRAINT `fk_guest` FOREIGN KEY (`guest`) REFERENCES `guests` (`id`),
  CONSTRAINT `fk_state` FOREIGN KEY (`state`) REFERENCES `states` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'2018-08-25','2018-09-05',3,2),(2,'2018-08-25','2018-10-05',3,2),(3,'2018-07-12','2018-07-18',2,3),(4,'2018-05-23','2018-05-30',1,1),(5,'2018-06-01','2018-06-15',4,4),(6,'2018-06-04','2018-09-06',5,2),(7,'2018-07-22','2018-07-28',2,4),(8,'2018-08-05','2018-08-12',5,1),(9,'2018-09-09','2018-09-14',4,2);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings_rooms`
--

DROP TABLE IF EXISTS `bookings_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings_rooms` (
  `booking` smallint(5) unsigned NOT NULL,
  `room` smallint(5) unsigned NOT NULL,
  KEY `fk_booking__rooms` (`booking`),
  KEY `fk_room` (`room`),
  CONSTRAINT `fk_booking__rooms` FOREIGN KEY (`booking`) REFERENCES `bookings` (`id`),
  CONSTRAINT `fk_room` FOREIGN KEY (`room`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings_rooms`
--

LOCK TABLES `bookings_rooms` WRITE;
/*!40000 ALTER TABLE `bookings_rooms` DISABLE KEYS */;
INSERT INTO `bookings_rooms` VALUES (1,2),(2,6),(3,3),(5,4),(6,1),(8,5),(9,3),(3,2),(1,6),(3,1),(6,4);
/*!40000 ALTER TABLE `bookings_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings_services`
--

DROP TABLE IF EXISTS `bookings_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings_services` (
  `booking` smallint(5) unsigned NOT NULL,
  `service` smallint(5) unsigned NOT NULL,
  KEY `fk_booking` (`booking`),
  KEY `fk_service` (`service`),
  CONSTRAINT `fk_booking` FOREIGN KEY (`booking`) REFERENCES `bookings` (`id`),
  CONSTRAINT `fk_service` FOREIGN KEY (`service`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings_services`
--

LOCK TABLES `bookings_services` WRITE;
/*!40000 ALTER TABLE `bookings_services` DISABLE KEYS */;
INSERT INTO `bookings_services` VALUES (1,2),(2,6),(3,3),(5,4),(6,1),(8,5),(9,7),(3,2),(1,6),(3,7),(6,4);
/*!40000 ALTER TABLE `bookings_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'matériel'),(2,'bien être'),(3,'repas'),(4,'spécial');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guests`
--

DROP TABLE IF EXISTS `guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guests` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guests`
--

LOCK TABLES `guests` WRITE;
/*!40000 ALTER TABLE `guests` DISABLE KEYS */;
INSERT INTO `guests` VALUES (1,'Pedro','Sanchez','05.35.24.23.65','pedrosanchez@gmail.com','21 Place de la Fontaine 12345 Golinhac, France','pedroparamo'),(2,'Maria','Krotz','04.45.24.33.66','mariakrotz@aol.com','35 Loet Av 67456 Munich, Alemagne','ilovihi'),(3,'Itoki','Chen','55.34.67.99.27','itokichen@yuyuzu.com','89 Avazuni St 36866 Sichuan, Chine','kakunitzu'),(4,'Laurence','Lapierre','06.35.24.23.65','laurencelapierre@gmail.com','46 Av. Fleuri 34567 Metz','loloveutpas'),(5,'Selena','Williams','01.96.37.67.90','selenawilliams@yahoo.com','1 Malibu avenue 56789 California','iamthebest');
/*!40000 ALTER TABLE `guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `area` float NOT NULL,
  `kind_room` tinyint(1) NOT NULL,
  `floor` smallint(6) NOT NULL,
  `view` varchar(45) NOT NULL,
  `accessibility` tinyint(1) NOT NULL,
  `cost` float NOT NULL,
  `bathroom` smallint(5) unsigned NOT NULL,
  `bed` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bathroom` (`bathroom`),
  KEY `fk_bed` (`bed`),
  CONSTRAINT `fk_bathroom` FOREIGN KEY (`bathroom`) REFERENCES `bathrooms` (`id`),
  CONSTRAINT `fk_bed` FOREIGN KEY (`bed`) REFERENCES `beds` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'Moscou',28.5,0,1,'Mer',1,225,3,3),(2,'Paris',18.5,1,1,'Montagne',0,180.5,1,1),(3,'Rio',22.5,0,2,'Mer',1,200,2,2),(4,'Tokio',15.7,1,2,'Montagne',0,165.6,1,2),(5,'Dublin',25,0,3,'Mer',0,215,2,3),(6,'Oslo',19.5,1,3,'Montagne',1,190,3,1);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `cost` float NOT NULL,
  `availability` tinyint(1) NOT NULL,
  `category` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category` (`category`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Petit Déjeuner en chambre','PDJ Continental',25,1,3),(2,'Minibar','2 paquets de snacks, eau plate et petillant, chocolat, vin blanc et mousseaux, gin et vodka',85,0,3),(3,'Bouteille de Champagne','Roederer Brut 75 cl et corbeille de fraises',140,1,3),(4,'Pret ordinateur portable','HP 234 avec connexion internet et programmes de base',20,1,1),(5,'Massage','45 min realisé au wellness',75,1,2),(6,'Scort Boy','Mission de 2 hr',245,0,4),(7,'Resevation de voiture','Categorie a choisir par le client',25,0,4);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'en cours'),(2,'paiement effectué'),(3,'annulé'),(4,'a attente de confimation');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-25 12:14:11
