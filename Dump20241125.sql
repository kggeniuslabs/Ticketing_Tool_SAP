-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: sap
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `account_manager_types`
--

DROP TABLE IF EXISTS `account_manager_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_manager_types` (
  `am_id` varchar(10) NOT NULL,
  `am_name` varchar(255) NOT NULL,
  `designation_id` int NOT NULL,
  PRIMARY KEY (`am_id`),
  KEY `designation_id` (`designation_id`),
  CONSTRAINT `account_manager_types_ibfk_1` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`designation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_manager_types`
--

LOCK TABLES `account_manager_types` WRITE;
/*!40000 ALTER TABLE `account_manager_types` DISABLE KEYS */;
INSERT INTO `account_manager_types` VALUES ('DMH1','Digital Marketing Account Manager',2),('ITH1','IT Account Manager',2),('SAPH1','SAP Account Manager',2);
/*!40000 ALTER TABLE `account_manager_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `action_logs`
--

DROP TABLE IF EXISTS `action_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `action_logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `action_type` varchar(255) NOT NULL,
  `action_details` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ticket_id` varchar(255) DEFAULT NULL,
  `emp_id` int DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `action_logs_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `internal` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_logs`
--

LOCK TABLES `action_logs` WRITE;
/*!40000 ALTER TABLE `action_logs` DISABLE KEYS */;
INSERT INTO `action_logs` VALUES (4,'Ticket Created','Ticket KGGL1 created, Account_Manager_Id ITH1','2024-07-31 11:42:57','KGGL1',NULL,55),(5,'Email Sent to Account Manager','Email sent to johnpaul.j@kggeniuslabs.com regarding ticket KGGL1, Account_Manager_Id ITH1','2024-07-31 11:42:57','KGGL1',NULL,55),(6,'Email Sent to Client','Email sent to velayuthamsiva55@gmail.com regarding ticket KGGL1, Account_Manager_Id ITH1','2024-07-31 11:42:57','KGGL1',NULL,55),(7,'Ticket Assigned','Ticket KGGL1 assigned to consultant devika.eks@kggeniuslabs.com','2024-07-31 11:46:27','KGGL1',903617,NULL),(8,'Email Sent to Client','Email sent to client velayuthamsiva55@gmail.com about ticket KGGL1','2024-07-31 11:46:27','KGGL1',903617,NULL),(9,'Email Sent to Consultant','Email sent to consultant devika.eks@kggeniuslabs.com about ticket KGGL1','2024-07-31 11:46:27','KGGL1',903617,NULL),(10,'Ticket Correction Submitted','Correction submitted for ticket KGGL1 by consultant 903607','2024-07-31 11:55:46','KGGL1',903607,NULL),(11,'Email Sent to Account Manager','Email sent to account manager johnpaul.j@kggeniuslabs.com about correction for ticket KGGL1','2024-07-31 11:55:46','KGGL1',903607,NULL),(12,'Ticket Change Submitted','Account manager ITH1 submitted changes for ticket KGGL1 with remarks: Change the new one','2024-07-31 12:08:08','KGGL1',903617,NULL),(13,'Email Sent to Consultant','Email sent to consultant devika.eks@kggeniuslabs.com about changes for ticket KGGL1','2024-07-31 12:08:14','KGGL1',903617,NULL),(14,'Ticket Created','Ticket KGGL2 created, Account_Manager_Id ITH1','2024-07-31 12:15:18','KGGL2',NULL,55),(15,'Email Sent to Account Manager','Email sent to johnpaul.j@kggeniuslabs.com regarding ticket KGGL2, Account_Manager_Id ITH1','2024-07-31 12:15:18','KGGL2',NULL,55),(16,'Email Sent to Client','Email sent to velayuthamsiva55@gmail.com regarding ticket KGGL2, Account_Manager_Id ITH1','2024-07-31 12:15:18','KGGL2',NULL,55),(17,'Ticket Assigned','Ticket KGGL2 assigned to consultant devika.eks@kggeniuslabs.com','2024-07-31 12:17:30','KGGL2',903617,NULL),(18,'Email Sent to Client','Email sent to client velayuthamsiva55@gmail.com about ticket KGGL2','2024-07-31 12:17:30','KGGL2',903617,NULL),(19,'Email Sent to Consultant','Email sent to consultant devika.eks@kggeniuslabs.com about ticket KGGL2','2024-07-31 12:17:30','KGGL2',903617,NULL);
/*!40000 ALTER TABLE `action_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth` (
  `auth_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `designation_id` int NOT NULL,
  `client_id` int DEFAULT NULL,
  `emp_id` int DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`auth_id`),
  UNIQUE KEY `email` (`email`),
  KEY `designation_id` (`designation_id`),
  KEY `fk_client_id` (`client_id`),
  CONSTRAINT `auth_ibfk_1` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`designation_id`),
  CONSTRAINT `fk_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth`
--

LOCK TABLES `auth` WRITE;
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
INSERT INTO `auth` VALUES (1,'info@kggeniuslabs.com','$2b$10$QS79wT1Hu94oZz66IlJkGOddRSOjyy23.In6s9zew2H2AK49IPZ6G',1,NULL,NULL,'2024-07-24 04:47:11'),(10,'johnpaul.j@kggeniuslabs.com','$2b$10$QS79wT1Hu94oZz66IlJkGOddRSOjyy23.In6s9zew2H2AK49IPZ6G',2,NULL,903617,'2024-07-24 04:55:00'),(11,'devika.eks@kggeniuslabs.com','$2b$10$BTCG7uyiJ6v8jeNiQW8OHedhUS2vSZkQ5GLE9GoZGcpc0DZRQ2t3y',3,NULL,903607,'2024-07-24 05:08:00'),(12,'shivani.m@kggeniuslabs.com','$2b$10$ceUmdKUDj9IXd2u7fslDSeHBJYa.8yplwJUzMhrfLF2vfJC2o1kbG',3,NULL,904071,'2024-07-24 05:08:55'),(13,'devadharshini.k@kggeniuslabs.com','$2b$10$QE/TvW7sBVhbsB/j4E5Cm.51H73LuqMgJH9uwuuHxxBTY4rJneX/2',3,NULL,904394,'2024-07-24 05:09:46'),(14,'suresh.m@kggeniuslabs.com','$2b$10$788AETjXzsFAT/amlSdMhuDK5hdJdFqMskw3SH8.h8TAaieG6Z3Nq',2,NULL,902567,'2024-07-24 05:11:57'),(16,'velayuthamsiva55@gmail.com','$2b$10$GO/YSCntr75QS91T9qhhrej9WWtCtBsvaCt01mefozDy6LpNgkA8q',6,55,NULL,'2024-07-24 10:47:04');
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `company` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `VAT_number` varchar(50) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL,
  `group_name` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `gst_no` varchar(50) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `designation_id` int DEFAULT '6',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `company_short_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  KEY `fk_client_designation` (`designation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (55,'KG Genius Labs','Coimbatore, TN','','Coimbatore','6234567890','USA','www.kggeniuslabs.com','641030','KG','India','Ruppee','12345678','USA','$2b$10$GO/YSCntr75QS91T9qhhrej9WWtCtBsvaCt01mefozDy6LpNgkA8q','velayuthamsiva55@gmail.com',6,'2024-07-24 10:47:04','KGGL');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_services`
--

DROP TABLE IF EXISTS `client_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_services` (
  `client_service_id` int NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  `am_id` varchar(10) DEFAULT NULL,
  `subdivision_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`client_service_id`),
  KEY `client_id` (`client_id`),
  KEY `service_id` (`service_id`),
  KEY `am_id` (`am_id`),
  KEY `subdivision_id` (`subdivision_id`),
  CONSTRAINT `client_services_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  CONSTRAINT `client_services_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`),
  CONSTRAINT `client_services_ibfk_3` FOREIGN KEY (`am_id`) REFERENCES `account_manager_types` (`am_id`),
  CONSTRAINT `client_services_ibfk_4` FOREIGN KEY (`subdivision_id`) REFERENCES `subdivisions` (`subdivision_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_services`
--

LOCK TABLES `client_services` WRITE;
/*!40000 ALTER TABLE `client_services` DISABLE KEYS */;
INSERT INTO `client_services` VALUES (8,55,1,'ITH1',1,'2024-07-24 10:47:17'),(9,55,1,'ITH1',5,'2024-07-24 11:51:59'),(10,55,3,'DMH1',21,'2024-07-24 11:59:49'),(11,55,2,'SAPH1',11,'2024-07-26 12:11:02');
/*!40000 ALTER TABLE `client_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designation`
--

DROP TABLE IF EXISTS `designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `designation` (
  `designation_id` int NOT NULL AUTO_INCREMENT,
  `designation_name` varchar(100) NOT NULL,
  PRIMARY KEY (`designation_id`),
  UNIQUE KEY `unique_designation_name` (`designation_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designation`
--

LOCK TABLES `designation` WRITE;
/*!40000 ALTER TABLE `designation` DISABLE KEYS */;
INSERT INTO `designation` VALUES (2,'Account Manager'),(6,'Client'),(4,'Consultant'),(1,'Delivery Head'),(5,'Junior Consultant'),(3,'Senior Consultant'),(7,'Software Enginner');
/*!40000 ALTER TABLE `designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internal`
--

DROP TABLE IF EXISTS `internal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internal` (
  `int_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `designation_id` int DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `emp_id` int DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `am_id` varchar(10) DEFAULT NULL,
  `head_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`int_id`),
  UNIQUE KEY `unique_emp_id` (`emp_id`),
  KEY `designation_id` (`designation_id`),
  KEY `fk_am_id` (`am_id`),
  CONSTRAINT `fk_am_id` FOREIGN KEY (`am_id`) REFERENCES `account_manager_types` (`am_id`),
  CONSTRAINT `internal_ibfk_1` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`designation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internal`
--

LOCK TABLES `internal` WRITE;
/*!40000 ALTER TABLE `internal` DISABLE KEYS */;
INSERT INTO `internal` VALUES (1,'admin','info@kggeniuslabs.com','9500844445',1,'$2b$10$QS79wT1Hu94oZz66IlJkGOddRSOjyy23.In6s9zew2H2AK49IPZ6G',NULL,'2024-07-24 07:47:33',NULL,NULL),(6,'John Paul','johnpaul.j@kggeniuslabs.com','9994736580',2,'$2b$10$QS79wT1Hu94oZz66IlJkGOddRSOjyy23.In6s9zew2H2AK49IPZ6G',903617,'2024-07-24 04:55:00','ITH1','1'),(7,'Devika EKS','devika.eks@kggeniuslabs.com','8681995349',3,'$2b$10$BTCG7uyiJ6v8jeNiQW8OHedhUS2vSZkQ5GLE9GoZGcpc0DZRQ2t3y',903607,'2024-07-24 05:08:00',NULL,'ITH1'),(8,'Shivani M','shivani.m@kggeniuslabs.com','8122196801',3,'$2b$10$ceUmdKUDj9IXd2u7fslDSeHBJYa.8yplwJUzMhrfLF2vfJC2o1kbG',904071,'2024-07-24 05:08:55',NULL,'ITH1'),(9,'Deva Dharshini','devadharshini.k@kggeniuslabs.com','7358966560',3,'$2b$10$QE/TvW7sBVhbsB/j4E5Cm.51H73LuqMgJH9uwuuHxxBTY4rJneX/2',904394,'2024-07-24 05:09:46',NULL,'ITH1'),(10,'Suresh M','suresh.m@kggeniuslabs.com','8608053257',2,'$2b$10$788AETjXzsFAT/amlSdMhuDK5hdJdFqMskw3SH8.h8TAaieG6Z3Nq',902567,'2024-07-24 05:11:57','SAPH1','1');
/*!40000 ALTER TABLE `internal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priority_levels`
--

DROP TABLE IF EXISTS `priority_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `priority_levels` (
  `priority_id` int NOT NULL AUTO_INCREMENT,
  `priority_name` varchar(50) NOT NULL,
  PRIMARY KEY (`priority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priority_levels`
--

LOCK TABLES `priority_levels` WRITE;
/*!40000 ALTER TABLE `priority_levels` DISABLE KEYS */;
INSERT INTO `priority_levels` VALUES (1,'Low'),(2,'Medium'),(3,'High');
/*!40000 ALTER TABLE `priority_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `service_id` int NOT NULL AUTO_INCREMENT,
  `service_name` varchar(255) NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `am_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  KEY `fk_am_id_services` (`am_id`),
  CONSTRAINT `fk_am_id_services` FOREIGN KEY (`am_id`) REFERENCES `account_manager_types` (`am_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'IT Services','Building and maintaining websites','2024-07-03 11:36:53','2024-07-04 07:43:09','ITH1'),(2,'SAP','Enterprise resource planning software solutions','2024-07-03 11:36:53','2024-07-04 07:43:09','SAPH1'),(3,'Digital Marketing','Online marketing and advertising services','2024-07-03 11:36:53','2024-07-04 07:43:09','DMH1');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subdivisions`
--

DROP TABLE IF EXISTS `subdivisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subdivisions` (
  `subdivision_id` int NOT NULL AUTO_INCREMENT,
  `service_id` int DEFAULT NULL,
  `subdivision_name` varchar(255) NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `am_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`subdivision_id`),
  KEY `service_id` (`service_id`),
  KEY `fk_subdivision_am` (`am_id`),
  CONSTRAINT `fk_subdivision_am` FOREIGN KEY (`am_id`) REFERENCES `account_manager_types` (`am_id`),
  CONSTRAINT `subdivisions_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subdivisions`
--

LOCK TABLES `subdivisions` WRITE;
/*!40000 ALTER TABLE `subdivisions` DISABLE KEYS */;
INSERT INTO `subdivisions` VALUES (1,1,'UI/UX','Handling online billing systems','2024-07-03 11:37:55','2024-07-24 11:13:57','ITH1'),(2,1,'Web Development','Ongoing website maintenance and support','2024-07-03 11:37:55','2024-07-24 11:13:57','ITH1'),(3,1,'Mobile App Development','Setting up and configuring SAP systems','2024-07-03 11:37:55','2024-07-24 11:13:57','ITH1'),(4,1,'E-Commerce','Ongoing support for SAP systems','2024-07-03 11:37:55','2024-07-24 11:13:57','ITH1'),(5,1,'LMS','Search engine optimization services','2024-07-03 11:37:55','2024-07-24 11:13:57','ITH1'),(6,1,'CRM','Promoting businesses on social media','2024-07-03 11:37:55','2024-07-24 11:13:57','ITH1'),(7,1,'Whats App Bulk Messaging',NULL,'2024-07-24 11:17:05','2024-07-24 11:17:05','ITH1'),(8,1,'KPO',NULL,'2024-07-24 11:17:05','2024-07-24 11:17:05','ITH1'),(9,1,'BPO',NULL,'2024-07-24 11:17:05','2024-07-24 11:17:05','ITH1'),(10,2,'SAP Implementation And SAP Rollout',NULL,'2024-07-24 11:20:23','2024-07-24 11:20:23','SAPH1'),(11,2,'SAP Technical Services',NULL,'2024-07-24 11:20:23','2024-07-24 11:20:23','SAPH1'),(12,2,'SAP Migration',NULL,'2024-07-24 11:20:23','2024-07-24 11:20:23','SAPH1'),(13,2,'SAP AMS',NULL,'2024-07-24 11:20:23','2024-07-24 11:20:23','SAPH1'),(14,3,'Technical SEO',NULL,'2024-07-24 11:28:15','2024-07-24 11:28:15','DMH1'),(15,3,'Link Building',NULL,'2024-07-24 11:28:15','2024-07-24 11:28:15','DMH1'),(16,3,'Social Media Marketing',NULL,'2024-07-24 11:28:15','2024-07-24 11:28:15','DMH1'),(17,3,'Web Design & Development',NULL,'2024-07-24 11:28:15','2024-07-24 11:28:15','DMH1'),(18,3,'E-Commerce Marketing',NULL,'2024-07-24 11:28:15','2024-07-24 11:28:15','DMH1'),(19,3,'Conversion Rate Optimization',NULL,'2024-07-24 11:28:15','2024-07-24 11:28:15','DMH1'),(20,3,'Content Writing',NULL,'2024-07-24 11:28:15','2024-07-24 11:28:15','DMH1'),(21,3,'Email Marketing',NULL,'2024-07-24 11:28:15','2024-07-24 11:28:15','DMH1'),(22,3,'Online Reputation Management(ORM)',NULL,'2024-07-24 11:42:15','2024-07-24 11:42:15','DMH1'),(23,3,'Pay Per Click (PPC) Management',NULL,'2024-07-24 11:42:15','2024-07-24 11:42:15','DMH1');
/*!40000 ALTER TABLE `subdivisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_raising`
--

DROP TABLE IF EXISTS `ticket_raising`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_raising` (
  `ticket_id` varchar(50) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `ticket_body` text NOT NULL,
  `screenshot` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `client_id` int DEFAULT NULL,
  `priority_id` int DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  `am_id` varchar(10) DEFAULT NULL,
  `ticket_status_id` int DEFAULT NULL,
  `consultant_emp_id` varchar(255) DEFAULT NULL,
  `reminder_email_sent` tinyint(1) DEFAULT '0',
  `admin_email_sent` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ticket_id`),
  KEY `client_id` (`client_id`),
  KEY `priority_id` (`priority_id`),
  KEY `service_id` (`service_id`),
  KEY `fk_ticket_status` (`ticket_status_id`),
  CONSTRAINT `fk_ticket_status` FOREIGN KEY (`ticket_status_id`) REFERENCES `ticket_status` (`ticket_status_id`),
  CONSTRAINT `ticket_raising_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE,
  CONSTRAINT `ticket_raising_ibfk_2` FOREIGN KEY (`priority_id`) REFERENCES `priority_levels` (`priority_id`),
  CONSTRAINT `ticket_raising_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_raising`
--

LOCK TABLES `ticket_raising` WRITE;
/*!40000 ALTER TABLE `ticket_raising` DISABLE KEYS */;
INSERT INTO `ticket_raising` VALUES ('KGGL1','Final Check','This is the most Final check i think so.','\\uploads\\screenshot-1722426167857-21586391.jpg','2024-07-31 11:42:47',55,3,'KG Genius Labs',1,'ITH1',3,'903607',0,0),('KGGL2','Chart','This is for chart check','\\uploads\\screenshot-1722428109459-365387566.jpg','2024-07-31 12:15:09',55,2,'KG Genius Labs',1,'ITH1',2,'903607',0,0);
/*!40000 ALTER TABLE `ticket_raising` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_status`
--

DROP TABLE IF EXISTS `ticket_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_status` (
  `ticket_status_id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(50) NOT NULL,
  PRIMARY KEY (`ticket_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_status`
--

LOCK TABLES `ticket_status` WRITE;
/*!40000 ALTER TABLE `ticket_status` DISABLE KEYS */;
INSERT INTO `ticket_status` VALUES (1,'Raised'),(2,'Assigned'),(3,'In Progress'),(4,'Approval'),(5,'Completed');
/*!40000 ALTER TABLE `ticket_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_submission`
--

DROP TABLE IF EXISTS `ticket_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_submission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `ticket_body` text,
  `screenshot` varchar(255) DEFAULT NULL,
  `corrected_file` varchar(255) DEFAULT NULL,
  `am_id` varchar(10) DEFAULT NULL,
  `emp_id` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_submission`
--

LOCK TABLES `ticket_submission` WRITE;
/*!40000 ALTER TABLE `ticket_submission` DISABLE KEYS */;
INSERT INTO `ticket_submission` VALUES (8,'KGGL1','Final Check','This is the most Final check i think so.','uploads\\screenshot-1722426167857-21586391.jpg','uploads\\corrected_file-1722426938386-768289572.pdf','ITH1','903607','2024-07-31 11:55:38');
/*!40000 ALTER TABLE `ticket_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_submission_changes`
--

DROP TABLE IF EXISTS `ticket_submission_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_submission_changes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `am_id` varchar(50) DEFAULT NULL,
  `ticket_id` varchar(50) DEFAULT NULL,
  `consultant_email` varchar(255) NOT NULL,
  `remarks` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_submission_changes`
--

LOCK TABLES `ticket_submission_changes` WRITE;
/*!40000 ALTER TABLE `ticket_submission_changes` DISABLE KEYS */;
INSERT INTO `ticket_submission_changes` VALUES (16,'ITH1','KGGL1','devika.eks@kggeniuslabs.com','Change the new one','2024-07-31 12:08:08');
/*!40000 ALTER TABLE `ticket_submission_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_type` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` VALUES (1,'Client'),(2,'Internal');
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-25 16:41:11
