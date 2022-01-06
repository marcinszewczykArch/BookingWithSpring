-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: booking
-- ------------------------------------------------------
-- Server version	8.0.26

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

use heroku_43c2ae01735a45e;

--
-- Table structure for table `apartment`
--

DROP TABLE IF EXISTS `apartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `apartment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `airbnb_link` varchar(255) DEFAULT NULL,
  `apartment_name` varchar(255) DEFAULT NULL,
  `guests_number` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `size` int NOT NULL,
  `owner_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7t1un6qju29sa9xgcoytdedhi` (`owner_id`),
  CONSTRAINT `FK7t1un6qju29sa9xgcoytdedhi` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartment`
--

LOCK TABLES `apartment` WRITE;
/*!40000 ALTER TABLE `apartment` DISABLE KEYS */;
INSERT INTO `apartment` VALUES (1,'Komuny Paryskiej 94/3','https://airbnb.com/h/slonecznakamienica','Słoneczna kamienica - apartament z lustrem',3,'https://a0.muscache.com/im/pictures/miso/Hosting-45055284/original/9e2b6df6-6b5f-48eb-80e1-d37cc68220a4.jpeg?im_w=1200',29,NULL),(2,'Komuny Paryskiej 94/3','https://airbnb.com/h/slonecznakamienica','Słoneczna kamienica - apartament z balkonem',3,'https://a0.muscache.com/im/pictures/miso/Hosting-44638934/original/ecc5b0d1-f95d-460a-a177-3001143f4bdc.jpeg?im_w=1200',29,NULL),(3,'Komuny Paryskiej 94/3','https://airbnb.com/h/slonecznakamienica','Słoneczna kamienica - CAŁE',3,'https://a0.muscache.com/im/pictures/miso/Hosting-45237021/original/6fc5378c-c2e2-4a5e-b448-9a421b6243fa.jpeg?im_w=1200',65,NULL),(4,'Aleksandra Hercena 34','https://www.airbnb.pl/rooms/45117982','Hercena Kołokoł - design apartment',2,'https://a0.muscache.com/im/pictures/miso/Hosting-45117982/original/1447b673-0d04-4c22-8ff1-0e71e9a2a9d6.jpeg?im_w=1200',34,NULL),(5,'Aleksandra Hercena 34','https://www.airbnb.pl/rooms/45255708','Hercena Polarnaja Zwiezda - design apartment',2,'https://a0.muscache.com/im/pictures/miso/Hosting-45255708/original/bf8fa553-281b-4751-a6f8-17ee1faf2bfa.jpeg?im_w=1200',31,NULL),(6,'Kniaziewicza 12','https://www.airbnb.pl/rooms/50165522','Kniaziewicza Sommeil - design apartment',2,'https://a0.muscache.com/im/pictures/miso/Hosting-50165522/original/52d48a49-a2c6-48c8-93d4-a32aed0bd619.jpeg?im_w=1200',31,NULL),(7,'Pomorska 64','https://www.airbnb.pl/rooms/50165522','Pomorska Boho - apartment with balcony',4,'https://a0.muscache.com/im/pictures/91960bc6-a769-44ce-ac8d-d219a66d0bd0.jpg?im_w=1440',62,NULL),(8,'Pomorska 64','https://www.airbnb.pl/rooms/38545880','Pomorska Modern - apartment with mirrors',2,'https://a0.muscache.com/im/pictures/dc9f876f-40c9-41b0-bb0d-f12a53296c86.jpg?im_w=1440',41,NULL);
/*!40000 ALTER TABLE `apartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apartment_reservations`
--

DROP TABLE IF EXISTS `apartment_reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `apartment_reservations` (
  `apartment_id` bigint NOT NULL,
  `reservations_id` bigint NOT NULL,
  UNIQUE KEY `UK_hdft0ue9aeas5iw3r5v23h6m5` (`reservations_id`),
  KEY `FKt87dh1wr4nxvt05d39uybnf1d` (`apartment_id`),
  CONSTRAINT `FKbfn435w5kfxgys75d12khkq7x` FOREIGN KEY (`reservations_id`) REFERENCES `reservation` (`id`),
  CONSTRAINT `FKt87dh1wr4nxvt05d39uybnf1d` FOREIGN KEY (`apartment_id`) REFERENCES `apartment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartment_reservations`
--

LOCK TABLES `apartment_reservations` WRITE;
/*!40000 ALTER TABLE `apartment_reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `apartment_reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cleaning`
--

DROP TABLE IF EXISTS `cleaning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `cleaning` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cleaning_date` date DEFAULT NULL,
  `extra_bedding` int NOT NULL,
  `is_done` bit(1) NOT NULL,
  `cleaning_person_id` bigint DEFAULT NULL,
  `reservation_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2xb7rvpojn1bmx9xb5qb6mk2l` (`cleaning_person_id`),
  KEY `FKsh3r9n7qhug2e3ybqh8i5tewq` (`reservation_id`),
  CONSTRAINT `FK2xb7rvpojn1bmx9xb5qb6mk2l` FOREIGN KEY (`cleaning_person_id`) REFERENCES `cleaning_person` (`id`),
  CONSTRAINT `FKsh3r9n7qhug2e3ybqh8i5tewq` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cleaning`
--

LOCK TABLES `cleaning` WRITE;
/*!40000 ALTER TABLE `cleaning` DISABLE KEYS */;
INSERT INTO `cleaning` VALUES (1,'2021-11-13',0,_binary '\0',2,1),(2,'2021-11-09',0,_binary '\0',2,2),(3,'2021-11-15',0,_binary '\0',2,3),(4,'2021-10-25',0,_binary '\0',1,4),(5,'2021-10-28',0,_binary '\0',2,5),(6,'2021-10-24',0,_binary '\0',1,6),(7,'2021-10-22',0,_binary '\0',2,7),(8,'2021-10-30',0,_binary '\0',3,8),(9,'2021-10-15',0,_binary '\0',1,9),(10,'2021-10-11',0,_binary '\0',2,10),(11,'2021-10-08',0,_binary '\0',2,11),(12,'2021-10-08',0,_binary '\0',2,12),(13,'2021-10-01',0,_binary '\0',1,13),(14,'2021-09-28',0,_binary '\0',2,14),(15,'2021-10-05',0,_binary '\0',3,15),(16,'2021-09-25',0,_binary '\0',1,16),(17,'2021-09-20',0,_binary '\0',2,17),(18,'2021-09-12',0,_binary '\0',1,18),(19,'2021-09-11',0,_binary '\0',3,19),(20,'2021-09-04',0,_binary '\0',1,20),(21,'2021-09-04',0,_binary '\0',2,21),(22,'2021-08-26',0,_binary '\0',3,22),(23,'2021-09-01',0,_binary '\0',3,23),(24,'2021-08-15',0,_binary '\0',2,24),(25,'2021-08-20',0,_binary '\0',2,25),(26,'2021-08-27',0,_binary '\0',2,26),(27,'2021-08-10',0,_binary '\0',1,27),(28,'2021-08-17',0,_binary '\0',3,28),(29,'2021-08-03',0,_binary '\0',1,29),(30,'2021-08-04',0,_binary '\0',1,30),(31,'2021-08-07',0,_binary '\0',2,31),(32,'2021-07-24',0,_binary '\0',1,32),(33,'2021-08-04',0,_binary '\0',1,33),(34,'2021-08-02',0,_binary '\0',2,34),(35,'2021-07-20',0,_binary '\0',1,35),(36,'2021-07-23',0,_binary '\0',3,36),(37,'2021-07-18',0,_binary '\0',1,37),(38,'2021-07-10',0,_binary '\0',1,38),(39,'2021-07-18',0,_binary '\0',3,39),(40,'2021-07-08',0,_binary '\0',2,40),(41,'2021-07-04',0,_binary '\0',2,41),(42,'2021-06-27',0,_binary '\0',2,42),(43,'2021-06-24',0,_binary '\0',1,43),(44,'2021-06-27',0,_binary '\0',2,44),(45,'2021-06-18',0,_binary '\0',1,45),(46,'2021-06-11',0,_binary '\0',2,46),(47,'2021-06-09',0,_binary '\0',2,47),(48,'2021-06-14',0,_binary '\0',2,48),(49,'2021-06-20',0,_binary '\0',1,49),(50,'2021-06-03',0,_binary '\0',1,50),(51,'2021-05-31',0,_binary '\0',1,51),(52,'2021-05-22',0,_binary '\0',1,52),(53,'2021-06-05',0,_binary '\0',2,53),(54,'2021-05-16',0,_binary '\0',1,54),(55,'2021-06-04',0,_binary '\0',1,55),(56,'2021-05-10',0,_binary '\0',2,56),(57,'2021-05-07',0,_binary '\0',1,57),(58,'2021-05-10',0,_binary '\0',1,58),(59,'2021-04-23',0,_binary '\0',1,59),(60,'2021-05-20',0,_binary '\0',2,60),(61,'2021-04-24',0,_binary '\0',1,61),(62,'2021-05-07',0,_binary '\0',3,62),(63,'2021-05-03',0,_binary '\0',2,63),(64,'2021-04-23',0,_binary '\0',3,64),(65,'2021-04-21',0,_binary '\0',1,65),(66,'2021-04-18',0,_binary '\0',1,66),(67,'2021-04-18',0,_binary '\0',1,67),(68,'2021-04-15',0,_binary '\0',1,68),(69,'2021-04-16',0,_binary '\0',2,69),(70,'2021-04-11',0,_binary '\0',1,70),(71,'2021-04-09',0,_binary '\0',1,71),(72,'2021-04-08',0,_binary '\0',1,72),(73,'2021-04-13',0,_binary '\0',3,73),(74,'2021-04-03',0,_binary '\0',1,74),(75,'2021-04-06',0,_binary '\0',2,75),(76,'2021-04-01',0,_binary '\0',1,76),(77,'2021-03-31',0,_binary '\0',1,77),(78,'2021-03-30',0,_binary '\0',1,78),(79,'2021-03-27',0,_binary '\0',1,79),(80,'2021-04-03',0,_binary '\0',3,80),(81,'2021-03-25',0,_binary '\0',1,81),(82,'2021-03-22',0,_binary '\0',2,82),(83,'2021-03-19',0,_binary '\0',1,83),(84,'2021-03-14',0,_binary '\0',2,84),(85,'2021-03-08',0,_binary '\0',2,85),(86,'2021-03-10',0,_binary '\0',1,86),(87,'2021-03-05',0,_binary '\0',2,87),(88,'2021-04-06',0,_binary '\0',1,88),(89,'2021-03-01',0,_binary '\0',1,89),(90,'2021-02-28',0,_binary '\0',1,90),(91,'2021-03-21',0,_binary '\0',1,91),(92,'2021-02-25',0,_binary '\0',1,92),(93,'2021-02-27',0,_binary '\0',1,93),(94,'2021-03-07',0,_binary '\0',3,94),(95,'2021-02-24',0,_binary '\0',1,95),(96,'2021-02-21',0,_binary '\0',1,96),(97,'2021-02-14',0,_binary '\0',1,97),(98,'2021-02-19',0,_binary '\0',3,98),(99,'2021-02-01',0,_binary '\0',1,99),(100,'2021-02-07',0,_binary '\0',3,100),(101,'2021-02-16',0,_binary '\0',1,101),(102,'2021-02-01',0,_binary '\0',2,102),(103,'2021-02-12',0,_binary '\0',3,103),(104,'2021-01-30',0,_binary '\0',2,104),(105,'2021-01-24',0,_binary '\0',1,105),(106,'2021-01-26',0,_binary '\0',3,106),(107,'2021-01-11',0,_binary '\0',1,107),(108,'2021-01-10',0,_binary '\0',1,108),(109,'2021-01-13',0,_binary '\0',1,109),(110,'2021-01-03',0,_binary '\0',1,110),(111,'2020-12-23',0,_binary '\0',3,111),(112,'2020-12-18',0,_binary '\0',1,112),(113,'2021-01-20',0,_binary '\0',1,113),(114,'2021-01-01',0,_binary '\0',2,114),(115,'2020-12-27',0,_binary '\0',2,115),(116,'2020-12-11',0,_binary '\0',3,116),(117,'2020-12-13',0,_binary '\0',1,117),(118,'2020-12-04',0,_binary '\0',1,118),(119,'2020-12-06',0,_binary '\0',1,119),(120,'2020-12-02',0,_binary '\0',1,120),(121,'2020-12-03',0,_binary '\0',3,121),(122,'2020-11-30',0,_binary '\0',3,122),(123,'2020-11-22',0,_binary '\0',1,123),(124,'2020-11-21',0,_binary '\0',2,124),(125,'2020-11-18',0,_binary '\0',3,125),(126,'2020-11-13',0,_binary '\0',1,126),(127,'2020-11-06',0,_binary '\0',1,127),(128,'2020-10-31',0,_binary '\0',3,128),(129,'2020-11-01',0,_binary '\0',1,129),(130,'2020-10-19',0,_binary '\0',2,130),(131,'2020-10-15',0,_binary '\0',1,131),(132,'2020-12-27',0,_binary '\0',3,132),(133,'2020-10-20',0,_binary '\0',2,133),(134,'2020-10-11',0,_binary '\0',1,134),(135,'2020-10-09',0,_binary '\0',1,135),(136,'2020-10-14',0,_binary '\0',2,136),(137,'2020-10-25',0,_binary '\0',3,137),(138,'2020-10-08',0,_binary '\0',1,138),(139,'2020-10-03',0,_binary '\0',1,139),(140,'2020-10-16',0,_binary '\0',1,140),(141,'2020-10-06',0,_binary '\0',1,141),(142,'2020-10-04',0,_binary '\0',1,142),(143,'2020-09-29',0,_binary '\0',1,143),(144,'2020-10-02',0,_binary '\0',2,144),(145,'2020-09-26',0,_binary '\0',1,145),(146,'2020-09-24',0,_binary '\0',1,146),(147,'2020-09-18',0,_binary '\0',2,147),(148,'2020-09-17',0,_binary '\0',1,148),(149,'2020-09-15',0,_binary '\0',1,149),(150,'2020-09-12',0,_binary '\0',2,150),(151,'2020-09-12',0,_binary '\0',1,151),(152,'2020-09-05',0,_binary '\0',1,152),(153,'2020-09-30',0,_binary '\0',3,153),(154,'2020-09-09',0,_binary '\0',1,154),(155,'2020-09-13',0,_binary '\0',1,155),(156,'2020-09-06',0,_binary '\0',1,156),(157,'2020-09-20',0,_binary '\0',2,157),(158,'2020-09-07',0,_binary '\0',3,158),(159,'2020-09-04',0,_binary '\0',2,159),(160,'2020-08-23',0,_binary '\0',1,160),(161,'2020-08-30',0,_binary '\0',1,161),(162,'2021-11-01',0,_binary '\0',2,162),(163,'2021-11-05',0,_binary '\0',1,163),(164,'2021-11-09',0,_binary '\0',2,164),(165,'2021-11-06',0,_binary '\0',1,165),(166,'2021-11-20',0,_binary '\0',2,166),(167,'2021-11-12',0,_binary '\0',1,167),(168,'2021-12-05',0,_binary '\0',2,168),(169,'2021-11-14',0,_binary '\0',1,169),(170,'2021-11-22',0,_binary '\0',1,170),(171,'2021-11-17',0,_binary '\0',1,171),(172,'2021-11-21',0,_binary '\0',1,172),(173,'2021-12-05',0,_binary '\0',1,173),(174,'2021-11-29',0,_binary '\0',2,174),(175,'2021-11-28',0,_binary '\0',1,175),(176,'2021-12-10',0,_binary '\0',2,176),(177,'2021-11-26',0,_binary '\0',1,177),(178,'2021-12-19',0,_binary '\0',1,178),(179,'2021-12-02',0,_binary '\0',2,179),(180,'2021-12-03',0,_binary '\0',1,180),(181,'2021-12-10',0,_binary '\0',1,181),(182,'2021-12-18',0,_binary '\0',1,182),(183,'2021-12-16',0,_binary '\0',2,183),(184,'2022-01-03',0,_binary '\0',2,184),(185,'2022-01-01',0,_binary '\0',3,185),(186,'2021-12-31',0,_binary '\0',2,186),(187,'2022-02-15',0,_binary '\0',1,187),(188,'2022-01-06',0,_binary '\0',2,188),(189,'2022-01-05',0,_binary '\0',1,189),(190,'2022-01-04',0,_binary '\0',3,190),(191,'2022-01-05',0,_binary '\0',3,191),(192,'2022-01-06',0,_binary '\0',3,192),(193,'2022-01-07',0,_binary '\0',3,193);
/*!40000 ALTER TABLE `cleaning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cleaning_person`
--

DROP TABLE IF EXISTS `cleaning_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `cleaning_person` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_availabe` bit(1) NOT NULL,
  `work_end` date DEFAULT NULL,
  `work_start` date DEFAULT NULL,
  `people_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs7yx2cg8qgkum5i5xcj2qviwt` (`people_id`),
  CONSTRAINT `FKs7yx2cg8qgkum5i5xcj2qviwt` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cleaning_person`
--

LOCK TABLES `cleaning_person` WRITE;
/*!40000 ALTER TABLE `cleaning_person` DISABLE KEYS */;
INSERT INTO `cleaning_person` VALUES (1,_binary '\0',NULL,NULL,1),(2,_binary '\0',NULL,NULL,2),(3,_binary '\0',NULL,NULL,3);
/*!40000 ALTER TABLE `cleaning_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `owner` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `people_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKeit3ulo9assa9hljh0lj5bv5f` (`people_id`),
  CONSTRAINT `FKeit3ulo9assa9hljh0lj5bv5f` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (1,1);
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner_apartments`
--

DROP TABLE IF EXISTS `owner_apartments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `owner_apartments` (
  `owner_id` bigint NOT NULL,
  `apartments_id` bigint NOT NULL,
  UNIQUE KEY `UK_6i0wxl4bjxrte5ge9fs40f4v7` (`apartments_id`),
  KEY `FK63bf6q4khtet6noem2bk7s1c6` (`owner_id`),
  CONSTRAINT `FK63bf6q4khtet6noem2bk7s1c6` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`id`),
  CONSTRAINT `FKxaxs1rkc9cvwlqtw0u7iahuf` FOREIGN KEY (`apartments_id`) REFERENCES `apartment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner_apartments`
--

LOCK TABLES `owner_apartments` WRITE;
/*!40000 ALTER TABLE `owner_apartments` DISABLE KEYS */;
INSERT INTO `owner_apartments` VALUES (1,1),(1,2),(1,3);
/*!40000 ALTER TABLE `owner_apartments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'kp94m3@gmail.com','Marcin','Szewczyk','602317995'),(2,'ko@gmail.com','Konrad','Onderko','666555444'),(3,'ko@gmail.com','Beata','Onderko','666555444');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `adults` int DEFAULT NULL,
  `check_in` date DEFAULT NULL,
  `check_out` date DEFAULT NULL,
  `children` int DEFAULT NULL,
  `guest_country` varchar(255) DEFAULT NULL,
  `guest_name` varchar(255) DEFAULT NULL,
  `money_transfer` double DEFAULT NULL,
  `reservation_code` varchar(255) DEFAULT NULL,
  `reservation_date` date DEFAULT NULL,
  `small_children` int DEFAULT NULL,
  `stay_duration` int DEFAULT NULL,
  `apartment_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdqvqcs183xelcc3daknjftlic` (`apartment_id`),
  CONSTRAINT `FKdqvqcs183xelcc3daknjftlic` FOREIGN KEY (`apartment_id`) REFERENCES `apartment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,2,'2021-11-10','2021-11-13',0,'Poland','Magdalena',837.9,'HMYKJ95JXN','2021-10-21',0,3,1),(2,2,'2021-11-06','2021-11-09',0,'Germany','Anna',693.45,'HMDDKAEFJP','2021-10-21',0,3,2),(3,2,'2021-11-12','2021-11-15',0,'Germany','Margarete',876.42,'HM3J4T8TXP','2021-10-21',0,3,2),(4,2,'2021-10-23','2021-10-25',0,'Canada','Negin',529.71,'HMEPFMFBAD','2021-10-19',1,2,1),(5,2,'2021-10-25','2021-10-28',0,'Germany','Stephanie',510.44,'HMSMX4TNPN','2021-10-17',0,3,1),(6,2,'2021-10-22','2021-10-24',0,'Germany','Charlotte',731.95,'HMD399EM8A','2021-10-17',0,2,2),(7,1,'2021-10-19','2021-10-22',0,'France','Daria',510.44,'HMYFRTZ45W','2021-10-15',0,3,2),(8,2,'2021-10-25','2021-10-30',0,'Germany','Alina',982.35,'HMJETAAKBK','2021-10-14',0,5,2),(9,2,'2021-10-13','2021-10-15',0,'Ireland','Weronika',365.99,'HMWS8SEZ9P','2021-10-07',0,2,1),(10,2,'2021-10-08','2021-10-11',2,'Kelly','Matt',1984,'HMQQE2CWMB','2021-10-06',0,3,3),(11,2,'2021-10-04','2021-10-08',0,'Germany','Michael',654.92,'HMDYMF3AZP','2021-10-02',0,4,2),(12,2,'2021-10-05','2021-10-08',0,'Switzerland','Mario',510.45,'HMFEYQK5XC','2021-10-01',0,3,1),(13,2,'2021-09-29','2021-10-01',0,'States','Aleksandra',423.77,'HMQHXRB2ZP','2021-09-28',1,2,2),(14,2,'2021-09-25','2021-09-28',0,'Poland','Michal',693.43,'HM4X9QEXBR','2021-09-22',0,3,2),(15,2,'2021-09-30','2021-10-05',0,'Poland','Mar',1117.2,'HMJ3S4MTTP','2021-09-21',0,5,1),(16,2,'2021-09-23','2021-09-25',0,'Poland','Stef',548.97,'HMNBJ2DHBX','2021-09-19',0,2,2),(17,1,'2021-09-17','2021-09-20',0,'Poland','Aleksandra',963.1,'HMWJDFDQP4','2021-09-13',0,3,2),(18,2,'2021-09-10','2021-09-12',0,'Poland','Arek',693.43,'HM5CAZXRCF','2021-09-08',0,2,1),(19,2,'2021-09-05','2021-09-11',0,'Poland','Karolina',1319.46,'HM8W3TWWM9','2021-09-03',0,6,2),(20,2,'2021-09-02','2021-09-04',0,'Germany','Michel',548.95,'HMYQJNM9EW','2021-09-01',1,2,1),(21,2,'2021-09-01','2021-09-04',0,'Germany','Fabian',789.73,'HM2AENJEAT','2021-08-29',0,3,2),(22,1,'2021-08-20','2021-08-26',0,'States','Olena',1540.97,'HMHYWPZAXC','2021-08-14',0,6,1),(23,3,'2021-08-27','2021-09-01',0,'Germany','Andreas',2947.08,'HMY8FMZ2S8','2021-08-10',0,5,3),(24,1,'2021-08-12','2021-08-15',0,'Germany','Anna',905.32,'HMFDEJXNMQ','2021-08-07',0,3,1),(25,2,'2021-08-16','2021-08-20',0,'Poland','Artem',924.58,'HMFS2JH48P','2021-08-05',0,4,1),(26,2,'2021-08-23','2021-08-27',0,'Germany','Greta',924.59,'HMJ55TA8MM','2021-08-03',0,4,2),(27,2,'2021-08-08','2021-08-10',0,'Poland','Sylwia',462.29,'HMER9JNPCW','2021-08-02',0,2,2),(28,2,'2021-08-10','2021-08-17',0,'Germany','Erwin',1540.95,'HMS4R3D9HW','2021-08-01',0,7,2),(29,2,'2021-08-01','2021-08-03',0,'Netherlands','Claudia',404.52,'HMANZ9C3JE','2021-07-31',0,2,1),(30,2,'2021-08-03','2021-08-04',0,'Poland','Daniel',260.03,'HMTWXP4B3C','2021-07-29',0,1,1),(31,2,'2021-08-04','2021-08-07',0,'Poland','Witek',683.8,'HMZMK89K8Y','2021-07-22',0,3,1),(32,2,'2021-07-23','2021-07-24',0,'Poland','Viktar',269.67,'HMFJ4YEREY','2021-07-21',0,1,2),(33,4,'2021-08-02','2021-08-04',0,'Germany','Yara',654.91,'HME8QNTTR8','2021-07-21',0,2,2),(34,1,'2021-07-30','2021-08-02',0,'Poland','Tomasz',805.15,'HM9N2APTNC','2021-07-21',0,3,2),(35,1,'2021-07-19','2021-07-20',0,'Germany','Cynthia',221.5,'HMM5HZN4KZ','2021-07-15',0,1,1),(36,2,'2021-07-18','2021-07-23',0,'Poland','Dorota',959.97,'HM8TJPHNR9','2021-07-12',0,5,2),(37,3,'2021-07-17','2021-07-18',0,'Poland','Teresa',313.01,'HMS9KAE9EY','2021-07-12',0,1,1),(38,1,'2021-07-08','2021-07-10',0,'Poland','Anastasiia',491.18,'HMD3WCDHTW','2021-07-04',0,2,1),(39,2,'2021-07-06','2021-07-18',2,'MaryiaBelarus','Maryia',2593.64,'HMWR49H9BJ','2021-07-03',0,12,2),(40,1,'2021-07-05','2021-07-08',0,'UK','Maria',654.93,'HMEXXZPD4C','2021-07-01',0,3,2),(41,2,'2021-06-30','2021-07-04',0,'Sweden','Andreas',1001.62,'HMAKJY83XC','2021-06-26',0,4,2),(42,2,'2021-06-23','2021-06-27',0,'Poland','Pawel',828.19,'HMPSFJ2BZW','2021-06-23',0,4,1),(43,2,'2021-06-23','2021-06-24',0,'Poland','Anna',202.25,'HMSA8D9W83','2021-06-22',0,1,2),(44,1,'2021-06-24','2021-06-27',0,'Poland','Grzegorz',819.59,'HMDEPHEB33','2021-06-16',0,3,2),(45,2,'2021-06-16','2021-06-18',0,'Poland','Rafal',310.99,'HM5XQN3W3Y','2021-06-11',0,2,2),(46,2,'2021-06-08','2021-06-11',0,'Poland','Asher',423.41,'HMMKJJSA9H','2021-06-07',0,3,1),(47,1,'2021-06-06','2021-06-09',0,'UK','Maciek',454.61,'HMK4KTKR4W','2021-06-06',0,3,2),(48,2,'2021-06-11','2021-06-14',0,'Poland','Jagoda',640.46,'HMX5YB8H95','2021-06-03',0,3,2),(49,3,'2021-06-18','2021-06-20',0,'OlaPL','Ola',548.97,'HMA2F8MFPQ','2021-06-01',0,2,2),(50,1,'2021-06-01','2021-06-03',0,'Poland','Pawel',300.47,'HMK4RNABK5','2021-05-31',0,2,2),(51,2,'2021-05-29','2021-05-31',0,'Poland','Maksym',329.4,'HMTZA3R4E3','2021-05-27',0,2,1),(52,2,'2021-05-20','2021-05-22',0,'Poland','Kamil',321.33,'HMJZHR4PCS','2021-05-17',0,2,1),(53,1,'2021-06-01','2021-06-05',0,'Poland','Katarzyna',822.49,'HMHYWKPMDN','2021-05-14',0,4,1),(54,1,'2021-05-14','2021-05-16',0,'States','Benoit',385.26,'HMMTNBB4HM','2021-05-14',0,2,2),(55,2,'2021-06-03','2021-06-04',0,'Poland','Paula',207.07,'HMPHH2ZKTA','2021-05-07',0,1,2),(56,2,'2021-05-07','2021-05-10',0,'France','Eva',629.17,'HMZSHFMJJ8','2021-05-06',0,3,1),(57,1,'2021-05-06','2021-05-07',0,'Spain','Kaya',192.62,'HM9TZWHBKY','2021-05-03',0,1,2),(58,2,'2021-05-09','2021-05-10',0,'Poland','Marcin',221.51,'HMCRSQADRH','2021-05-02',0,1,2),(59,1,'2021-04-22','2021-04-23',0,'Poland','Kewin',173.97,'HM85QDJN3R','2021-04-22',0,1,1),(60,2,'2021-05-16','2021-05-20',0,'Poland','Julia',654.91,'HM84ADSP43','2021-04-20',0,4,2),(61,5,'2021-04-23','2021-04-24',0,'Poland','Kasia',548.97,'HMWSMMF3AZ','2021-04-20',0,1,3),(62,2,'2021-04-30','2021-05-07',0,'Poland','Alicja',1229.86,'HM8CHHZJD8','2021-04-19',0,7,1),(63,2,'2021-04-30','2021-05-03',0,'Poland','Aleksander',768.16,'HMSQFZM4RZ','2021-04-17',0,3,2),(64,2,'2021-04-18','2021-04-23',0,'Poland','Bartlomiej',652.02,'HMRF5NDHQS','2021-04-16',0,5,2),(65,1,'2021-04-19','2021-04-21',0,'Poland','Daria',306.64,'HMPCMNDQJ9','2021-04-16',0,2,1),(66,3,'2021-04-16','2021-04-18',0,'Poland','Karina',499.27,'HMJB8YPRP9','2021-04-15',0,2,2),(67,3,'2021-04-17','2021-04-18',0,'Poland','Martyna',257.34,'HM82ETRHAD','2021-04-13',0,1,1),(68,1,'2021-04-13','2021-04-15',0,'Poland','Marysia',275.78,'HMD9XM5B4H','2021-04-13',0,2,1),(69,2,'2021-04-12','2021-04-16',0,'Poland','Jakub',471.92,'HMCXSR3J8M','2021-04-12',0,4,2),(70,2,'2021-04-09','2021-04-11',0,'Poland','Maciej',386.2,'HM5SZCKN44','2021-04-08',0,2,1),(71,1,'2021-04-08','2021-04-09',0,'Poland','Marta',179.22,'HMJCTYWPWY','2021-04-07',0,1,1),(72,1,'2021-04-07','2021-04-08',0,'Poland','Rafal',177.21,'HMH89DHATS','2021-04-07',0,1,2),(73,1,'2021-04-06','2021-04-13',0,'Poland','Kamil',1054.78,'HM38TEDXPM','2021-04-05',0,7,1),(74,1,'2021-04-02','2021-04-03',0,'Poland','Kewin',288.93,'HM4EYTPYDC','2021-04-01',0,1,2),(75,2,'2021-04-03','2021-04-06',0,'France','Aziliz',500.82,'HM48SPWAD2','2021-04-01',0,3,2),(76,1,'2021-03-31','2021-04-01',0,'Poland','Kewin',173.36,'HM4F33TKX3','2021-03-31',0,1,2),(77,1,'2021-03-30','2021-03-31',0,'Poland','Tytus',163.73,'HM4NZZTS2B','2021-03-30',0,1,2),(78,2,'2021-03-29','2021-03-30',0,'Poland','Daria',197.26,'HMDW4MZ3R4','2021-03-25',0,1,2),(79,2,'2021-03-25','2021-03-27',0,'Poland','Anna',366.7,'HM2HKRPFAF','2021-03-23',0,2,2),(80,1,'2021-03-22','2021-04-03',0,'Poland','Piotr',1616.46,'HM5BQ43AST','2021-03-20',0,12,1),(81,1,'2021-03-24','2021-03-25',0,'Poland','Ela',164.38,'HMQ4Q359A5','2021-03-19',0,1,2),(82,2,'2021-03-19','2021-03-22',0,'Poland','Dominika',573.53,'HMH4E3DSPK','2021-03-15',0,3,1),(83,1,'2021-03-17','2021-03-19',0,'Poland','Monika',272.37,'HMDC95KQFR','2021-03-14',0,2,1),(84,2,'2021-03-11','2021-03-14',0,'Poland','Marta',464.68,'HMP3CP49HE','2021-03-06',0,3,1),(85,2,'2021-03-05','2021-03-08',0,'Hungary','Hanna',505.43,'HMKNRQQYMY','2021-03-04',0,3,1),(86,2,'2021-03-08','2021-03-10',0,'Czechia','Pawel',312.84,'HMRYPRJXPZ','2021-03-04',0,2,1),(87,2,'2021-03-01','2021-03-05',0,'Poland','Weronika',481.55,'HMZPCZ8493','2021-03-01',1,4,2),(88,2,'2021-04-04','2021-04-06',0,'Poland','Annemarie',365.98,'HMXHMWR4DP','2021-02-28',0,2,1),(89,2,'2021-02-27','2021-03-01',0,'Ukraine','Lena',269.67,'HMZ258A4AB','2021-02-27',0,2,1),(90,1,'2021-02-26','2021-02-28',0,'States','Adam',337.08,'HMKXMPFPEB','2021-02-26',0,2,2),(91,2,'2021-03-19','2021-03-21',0,'Poland','Jakub',423.76,'HMR938AHAA','2021-02-24',0,2,2),(92,1,'2021-02-24','2021-02-25',0,'BartoszPoland','Bartosz',163.73,'HMPPCMNXXF','2021-02-24',0,1,1),(93,2,'2021-02-25','2021-02-27',0,'Poland','Wojtek',356.34,'HMERMH4TRW','2021-02-23',0,2,1),(94,2,'2021-03-01','2021-03-07',0,'Poland','Alicja',963.12,'HMWNJDK954','2021-02-23',0,6,2),(95,2,'2021-02-22','2021-02-24',0,'Poland','Danyah',234.98,'HMSS4MWPCF','2021-02-22',0,2,1),(96,2,'2021-02-19','2021-02-21',0,'Poland','Kamil',308.19,'HMXYM4XHZ5','2021-02-18',0,2,2),(97,2,'2021-02-12','2021-02-14',0,'Poland','Lukasz',441.1,'HMKX4ZTFD9','2021-02-06',0,2,2),(98,1,'2021-02-12','2021-02-19',0,'UK','Pawel',950.78,'HMXQ9JQBYY','2021-02-05',0,7,1),(99,2,'2021-01-31','2021-02-01',0,'Poland','Zbigniew',154.1,'HMWMWK3HD3','2021-01-31',0,1,2),(100,2,'2021-02-02','2021-02-07',0,'Ireland','Antonia',828.26,'HMMEMBTN3K','2021-01-30',0,5,2),(101,1,'2021-02-14','2021-02-16',0,'Poland','Pawel',380.42,'HMSZWJKP4J','2021-01-30',0,2,2),(102,1,'2021-01-29','2021-02-01',0,'Poland','Pawel',501.2,'HMRSAR55FP','2021-01-26',0,3,2),(103,2,'2021-02-01','2021-02-12',0,'Poland','Natalia',1067.79,'HMECDDNB94','2021-01-25',0,11,1),(104,2,'2021-01-27','2021-01-30',0,'Poland','Przemyslaw',385.24,'HM8BKD2ZQM','2021-01-23',0,3,1),(105,2,'2021-01-22','2021-01-24',0,'Poland','Bartek',313.97,'HMA2CPWW52','2021-01-22',0,2,1),(106,1,'2021-01-14','2021-01-26',0,'UK','Ma',1372.71,'HM85Y29DX8','2021-01-14',0,12,2),(107,1,'2021-01-09','2021-01-11',0,'Slovakia','Jakub',269.66,'HM4R8SRB3S','2021-01-08',0,2,1),(108,2,'2021-01-08','2021-01-10',0,'Poland','Magda',308.19,'HM8KFTCMFJ','2021-01-07',0,2,2),(109,2,'2021-01-11','2021-01-13',0,'Poland','Mateusz',250.41,'HMSZY93YYD','2021-01-04',0,2,2),(110,3,'2021-01-02','2021-01-03',3,'States','Zuzanna',414.12,'HMETCJMEF8','2021-01-01',0,1,3),(111,2,'2020-12-18','2020-12-23',0,'Switzerland','Puneet',385.13,'HMMYXW94AT','2020-12-18',0,5,1),(112,2,'2020-12-16','2020-12-18',0,'UK','Kinga',202.23,'HMPBNJFXSB','2020-12-16',0,2,2),(113,2,'2021-01-19','2021-01-20',0,'Poland','Katarzyna',192.62,'HM294W5J2N','2020-12-12',0,1,1),(114,4,'2020-12-29','2021-01-01',0,'Ireland','Krystain',1186.93,'HMRQZSWACR','2020-12-11',0,3,3),(115,5,'2020-12-24','2020-12-27',0,'Poland','Eliana',830.19,'HMRX44Q48H','2020-12-09',0,3,3),(116,2,'2020-12-06','2020-12-11',0,'Korea','지언',443.02,'HMX3ZAN4XJ','2020-12-06',0,5,2),(117,2,'2020-12-11','2020-12-13',0,'Poland','Wiktoria',285.1,'HMHMNDJRXX','2020-12-05',0,2,2),(118,2,'2020-12-03','2020-12-04',0,'Greece','George',144.47,'HMXZNQMXX4','2020-12-02',0,1,1),(119,2,'2020-12-04','2020-12-06',0,'Poland','Milena',231.14,'HM5QMXHA54','2020-12-02',0,2,1),(120,2,'2020-11-30','2020-12-02',0,'Singapore','Marek',198.39,'HM4MSWYHCP','2020-11-24',0,2,2),(121,2,'2020-11-25','2020-12-03',0,'Greece','George',675.14,'HM42E3P3QT','2020-11-24',0,8,1),(122,1,'2020-11-23','2020-11-30',0,'Poland','Wojciech',562.45,'HM59TRAWW3','2020-11-23',0,7,2),(123,2,'2020-11-20','2020-11-22',0,'Poland','Lukasz',250.41,'HMS25SK3ZM','2020-11-18',0,2,1),(124,2,'2020-11-18','2020-11-21',0,'France','Julie',260.02,'HM4SBTNJBH','2020-11-15',0,3,1),(125,2,'2020-11-11','2020-11-18',0,'15','Pavel',766.63,'HM3KTZ5PPB','2020-11-10',0,7,2),(126,2,'2020-11-11','2020-11-13',0,'Poland','Anna',231.14,'HM2E4NP9AB','2020-11-09',0,2,1),(127,3,'2020-11-04','2020-11-06',0,'Germany','Renata',217.47,'HMXX5TMFCP','2020-10-28',0,2,1),(128,1,'2020-10-25','2020-10-31',0,'Ukraine','Vladislav',548.96,'HMEC3ZKW9R','2020-10-23',0,6,2),(129,2,'2020-10-30','2020-11-01',0,'Poland','Влад ',264.27,'HMWWADQYX5','2020-10-23',0,2,1),(130,2,'2020-10-16','2020-10-19',0,'Poland','Artur',412.21,'HMS5B93NXC','2020-10-15',0,3,2),(131,2,'2020-10-13','2020-10-15',0,'UK','Peter',269.68,'HMEDJ9PTQ2','2020-10-11',0,2,1),(132,3,'2020-12-22','2020-12-27',0,'Germany','Anna',847.52,'HMEH9SMDZN','2020-10-11',0,5,1),(133,2,'2020-10-17','2020-10-20',0,'Germany','Marvin',432.44,'HMMNMFAZEK','2020-10-10',0,3,1),(134,1,'2020-10-10','2020-10-11',0,'Poland','Konrad',401.63,'HMJ92BHR98','2020-10-09',0,1,2),(135,2,'2020-10-08','2020-10-09',0,'Poland','Lika',183,'HMCREE5N53','2020-10-06',0,1,2),(136,2,'2020-10-11','2020-10-14',0,'Germany','Lena',363.08,'HMWDYST4YS','2020-10-06',0,3,2),(137,2,'2020-10-20','2020-10-25',0,'Germany','Karen',647.2,'HM44899QMF','2020-10-06',0,5,2),(138,2,'2020-10-06','2020-10-08',0,'Poland','Miroslaw',288.93,'HMCTQHFC9R','2020-10-04',0,2,2),(139,1,'2020-10-02','2020-10-03',0,'Poland','Weronika',190.69,'HMZR5239YE','2020-10-01',0,1,1),(140,2,'2020-10-14','2020-10-16',0,'Poland','Maciej',366.94,'HMWSRA8P4S','2020-09-28',0,2,2),(141,2,'2020-10-04','2020-10-06',0,'Germany','Carolina',317.83,'HMESECCKKN','2020-09-25',0,2,2),(142,2,'2020-10-02','2020-10-04',0,'Portugal','Joao',433.4,'HMRAAD5Q9P','2020-09-24',0,2,2),(143,3,'2020-09-27','2020-09-29',0,'Germany','Moritz',202.26,'HMHS3NWBPQ','2020-09-23',0,2,1),(144,2,'2020-09-29','2020-10-02',0,'Poland','Martyna',394.87,'HM4JTPYWYW','2020-09-22',0,3,1),(145,3,'2020-09-24','2020-09-26',0,'Poland','Sara',337.08,'HM5J988F4R','2020-09-16',0,2,1),(146,2,'2020-09-22','2020-09-24',0,'Poland','Martyna',337.08,'HMC2NCFSSA','2020-09-15',0,2,2),(147,2,'2020-09-14','2020-09-18',0,'Netherlands','Michael',443.97,'HMYS4WNKD5','2020-09-14',0,4,1),(148,1,'2020-09-15','2020-09-17',0,'Germany','Julio',260.03,'HM34QS958J','2020-09-12',0,2,2),(149,2,'2020-09-13','2020-09-15',0,'UK','Nicki',260.02,'HM2WXENNWB','2020-09-12',0,2,2),(150,2,'2020-09-09','2020-09-12',0,'Poland','Michal',394.87,'HMMR2QKRQW','2020-09-08',0,3,2),(151,1,'2020-09-11','2020-09-12',0,'Poland','Mikolaj',192.62,'HMNHYBED2B','2020-09-07',0,1,1),(152,2,'2020-09-04','2020-09-05',0,'Poland','Robert',192.62,'HMKCBKASM8','2020-09-03',0,1,1),(153,2,'2020-09-25','2020-09-30',0,'Poland','Sara',866.79,'HMZ3C2B852','2020-09-02',0,5,2),(154,2,'2020-09-08','2020-09-09',0,'Poland','Lukasz',192.62,'HMJZMN444N','2020-08-30',1,1,2),(155,2,'2020-09-12','2020-09-13',0,'Poland','Grzegorz',35.63,'HMAYTE9N4P','2020-08-30',0,1,2),(156,3,'2020-09-05','2020-09-06',0,'Poland','Natalia',192.62,'HMJ8DEW2AY','2020-08-30',0,1,1),(157,2,'2020-09-17','2020-09-20',0,'Poland','Pawel',577.89,'HMFX9KQZDP','2021-10-24',0,3,2),(158,1,'2020-08-28','2020-09-07',0,'Czechia','Eugen',1300.18,'HMRSAKMYWC','2021-10-24',0,10,2),(159,2,'2020-08-31','2020-09-04',0,'Poland','Natalia',423.76,'HMZM9SY2FJ','2021-10-24',0,4,1),(160,1,'2020-08-22','2020-08-23',0,'Poland','Gosia',38.52,'HMHSJF3YZ3','2021-10-24',0,1,1),(161,2,'2020-08-28','2020-08-30',0,'Poland','Dawid',337.08,'HMK9MX338Y','2021-10-24',0,2,1),(162,2,'2021-10-29','2021-11-01',0,'Germany','Krzysztof',914.95,'HM9SXTCSC2','2021-10-27',0,3,1),(163,1,'2021-11-03','2021-11-05',0,'Poland','Andrzej',308.19,'HMSDCS8Z2Y','2021-11-03',0,2,1),(164,1,'2021-11-05','2021-11-09',0,'Belarus','Yauhen',809.01,'HMT9MAFQZH','2021-11-04',0,4,1),(165,2,'2021-11-04','2021-11-06',0,'Russia','Svetlana',403.54,'HMX3SW9BRD','2021-11-04',0,2,2),(166,2,'2021-11-17','2021-11-20',0,'Germany','Emely',693.44,'HM9NYKCPYM','2021-11-05',0,3,2),(167,2,'2021-11-10','2021-11-12',0,'Poland','Paula',462.29,'HM2SA3ZSPJ','2021-11-06',0,2,2),(168,2,'2021-12-01','2021-12-05',0,'Poland','Marcin',982.36,'HM93RY8DDY','2021-11-07',0,4,1),(169,1,'2021-11-13','2021-11-14',0,'Ameryka','Maciej',288.93,'HMWCSHF3JJ','2021-11-12',0,1,1),(170,1,'2021-11-20','2021-11-22',0,'Poland','Anastasiia',414.13,'HMZREA9T3K','2021-11-15',0,2,2),(171,1,'2021-11-16','2021-11-17',0,'Germany','Olga',197.44,'HM3MPM9K94','2021-11-16',0,1,2),(172,1,'2021-11-19','2021-11-21',0,'Poland','Dardan',365.99,'HMD39EY5B8','2021-11-19',0,2,1),(173,4,'2021-12-03','2021-12-05',0,'Germany','Felix',924.58,'HM3D8HBDM3','2021-11-20',0,2,2),(174,2,'2021-11-26','2021-11-29',0,'UK','Sammie',635.66,'HMKC5S94FK','2021-11-24',0,3,1),(175,4,'2021-11-27','2021-11-28',0,'Poland','Wiktoria',500.81,'HMAXZYEBXF','2021-11-24',0,1,2),(176,2,'2021-12-06','2021-12-10',0,'UK','Adam',654.9,'HM5MK5JSFE','2021-11-24',0,4,2),(177,2,'2021-11-25','2021-11-26',0,'Poland','Asia',192.62,'HM3ZMAQX2H','2021-11-25',0,1,1),(178,2,'2021-12-17','2021-12-19',0,'Poland','Magdalena',693.43,'HMRZP8JSEH','2021-11-28',0,2,1),(179,1,'2021-11-29','2021-12-02',0,'Canada','Nykki',452.65,'HMZEADNNYF','2021-11-28',0,3,2),(180,1,'2021-12-02','2021-12-03',0,'Poland','Claudia',202.25,'HMAY4WW5FK','2021-12-02',0,1,2),(181,2,'2021-12-08','2021-12-10',0,'Germany','Rafal',288.93,'HMEW3CJRSR','2021-12-08',0,2,1),(182,2,'2021-12-16','2021-12-18',0,'MarcinPL','Marcin',548.97,'HMJ2YYYE4D','2021-12-11',0,2,2),(183,1,'2021-12-13','2021-12-16',0,'Poland','Zuzanna',510.47,'HMRDBXZY5B','2021-12-11',0,3,2),(184,1,'2021-12-31','2022-01-03',0,'States','Angela',1232.77,'HMHR8JRXFT','2021-12-15',0,3,1),(185,3,'2021-12-25','2022-01-01',0,'Germany','Ralf',2901.32,'HMSKTXYFX4','2021-12-18',0,7,2),(186,2,'2021-12-28','2021-12-31',0,'Poland','Michal',654.91,'HM33YP388N','2021-12-20',0,3,1),(187,2,'2022-02-13','2022-02-15',0,'Poland','Milosz',365.98,'HMMHMPSJYA','2021-12-22',0,2,2),(188,2,'2022-01-02','2022-01-06',0,'CarlaGermany','Carla',577.86,'HMREYQ4WMM','2021-12-30',0,4,2),(189,2,'2022-01-03','2022-01-05',0,'UK','Katarina',327.45,'HM5AHJXTK8','2022-01-02',0,2,1),(190,NULL,'2022-01-03','2022-01-04',NULL,NULL,NULL,NULL,NULL,'2022-12-22',NULL,NULL,1),(191,NULL,'2022-01-03','2022-01-05',NULL,NULL,NULL,NULL,NULL,'2022-12-22',NULL,NULL,2),(192,NULL,'2022-01-03','2022-01-06',NULL,NULL,NULL,NULL,NULL,'2022-12-22',NULL,NULL,3),(193,NULL,'2022-01-03','2022-01-07',NULL,NULL,NULL,NULL,NULL,'2022-12-22',NULL,NULL,1);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_role` int DEFAULT NULL,
  `people_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKk76xfob7y7e7bmis3cy5et4tv` (`people_id`),
  CONSTRAINT `FKk76xfob7y7e7bmis3cy5et4tv` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin',0,NULL),(2,'marcin','marcinPass',1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-05  6:50:23
