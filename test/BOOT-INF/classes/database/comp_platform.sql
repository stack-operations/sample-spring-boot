CREATE DATABASE  IF NOT EXISTS `comp_platform` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `comp_platform`;
-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: comp_platform
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
-- Table structure for table `client_cache_tracker`
--

DROP TABLE IF EXISTS `client_cache_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_cache_tracker` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int unsigned NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` enum('STARTED','IN_PROGRESS','FAILED','SUCCESSFUL') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `client_cache_tracker_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_config` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_cache_tracker`
--

LOCK TABLES `client_cache_tracker` WRITE;
/*!40000 ALTER TABLE `client_cache_tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_cache_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_config`
--

CREATE TABLE `client_resource` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100),
  `key` varchar(100),
  `value` varchar(500),
  `status` enum('IN_USE','AVAILABLE', 'LIMIT_REACHED') NOT NULL default 'AVAILABLE',
  `created_on` timestamp NOT NULL DEFAULT current_timestamp,
  `updated_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `client_id` int unsigned,
  PRIMARY KEY (`id`)
);

CREATE TABLE `client_resource` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100),
  `resource_key` varchar(100),
  `resource_value` varchar(500),
  `status` enum('IN_USE','AVAILABLE', 'LIMIT_REACHED') NOT NULL default 'AVAILABLE',
  `created_on` timestamp NOT NULL DEFAULT current_timestamp,
  `updated_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `client_id` int unsigned,
  PRIMARY KEY (`id`)
);

insert into client_resource(name,resource_key,resource_value) values ('database','host', 'jdbc:mysql://localhost:3306');
insert into client_resource(name,resource_key,resource_value) values ('redis','host', '127.0.0.1:0');
insert into client_resource(name,resource_key,resource_value) values ('redis','host', '127.0.0.1:1');
insert into client_resource(name,resource_key,resource_value) values ('redis','host', '127.0.0.1:2');
insert into client_resource(name,resource_key,resource_value) values ('redis','host', '127.0.0.1:3');
insert into client_resource(name,resource_key,resource_value) values ('redis','host', '127.0.0.1:4');
insert into client_resource(name,resource_key,resource_value) values ('redis','host', '127.0.0.1:5');


DROP TABLE IF EXISTS `client_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100),
  `config` json DEFAULT NULL,
  `status` enum('ACTIVE','IN_ACTIVE') NOT NULL default 'ACTIVE',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_config`
--

LOCK TABLES `client_config` WRITE;
/*!40000 ALTER TABLE `client_config` DISABLE KEYS */;
INSERT INTO `client_config` VALUES (4,'hg','{\"redis\": {\"host\": \"127.0.0.1\", \"db_index\": 0}, \"database\": {\"host\": \"jdbc:mysql://localhost:3306\", \"name\": \"compcloud\"}}'),(5,'tobii','{\"redis\": {\"host\": \"127.0.0.1\", \"db_index\": 1}, \"database\": {\"host\": \"jdbc:mysql://localhost:3306\", \"name\": \"compcloud_second\"}}'),(6,'univison','{\"redis\": {\"host\": \"127.0.0.1\", \"db_index\": 2}, \"database\": {\"host\": \"jdbc:mysql://localhost:3306\", \"name\": \"compcloud_third\"}}');
/*!40000 ALTER TABLE `client_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-09 17:14:58
