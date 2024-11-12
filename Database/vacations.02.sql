-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: vacations.02
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add countries model',6,'add_countriesmodel'),(22,'Can change countries model',6,'change_countriesmodel'),(23,'Can delete countries model',6,'delete_countriesmodel'),(24,'Can view countries model',6,'view_countriesmodel'),(25,'Can add vacations model',7,'add_vacationsmodel'),(26,'Can change vacations model',7,'change_vacationsmodel'),(27,'Can delete vacations model',7,'delete_vacationsmodel'),(28,'Can view vacations model',7,'view_vacationsmodel'),(29,'Can add likes model',8,'add_likesmodel'),(30,'Can change likes model',8,'change_likesmodel'),(31,'Can delete likes model',8,'delete_likesmodel'),(32,'Can view likes model',8,'view_likesmodel'),(33,'Can add role model',9,'add_rolemodel'),(34,'Can change role model',9,'change_rolemodel'),(35,'Can delete role model',9,'delete_rolemodel'),(36,'Can view role model',9,'view_rolemodel'),(37,'Can add user model',10,'add_usermodel'),(38,'Can change user model',10,'change_usermodel'),(39,'Can delete user model',10,'delete_usermodel'),(40,'Can view user model',10,'view_usermodel'),(41,'Can view user',10,'can_view_users');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `countryID` int NOT NULL AUTO_INCREMENT,
  `countryName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`countryID`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Japan'),(2,'Italy'),(3,'USA'),(4,'Switzerland'),(5,'Egypt'),(6,'Spain'),(7,'Brazil'),(8,'Germany'),(9,'UK'),(10,'Greece'),(11,'Afghanistan'),(12,'Albania'),(13,'Algeria'),(14,'Andorra'),(15,'Angola'),(16,'Antigua and Barbuda'),(17,'Argentina'),(18,'Armenia'),(19,'Australia'),(20,'Austria'),(21,'Azerbaijan'),(22,'Bahamas'),(23,'Bahrain'),(24,'Bangladesh'),(25,'Barbados'),(26,'Belarus'),(27,'Belgium'),(28,'Belize'),(29,'Benin'),(30,'Bhutan'),(31,'Bolivia'),(32,'Bosnia and Herzegovina'),(33,'Botswana'),(34,'Brazil'),(35,'Brunei'),(36,'Bulgaria'),(37,'Burkina Faso'),(38,'Burundi'),(39,'Cabo Verde'),(40,'Cambodia'),(41,'Cameroon'),(42,'Canada'),(43,'Central African Republic'),(44,'Chad'),(45,'Chile'),(46,'China'),(47,'Colombia'),(48,'Comoros'),(49,'Congo'),(50,'Congo, Democratic Republic of the'),(51,'Costa Rica'),(52,'Côte d\'Ivoire'),(53,'Croatia'),(54,'Cuba'),(55,'Cyprus'),(56,'Czechia'),(57,'Denmark'),(58,'Djibouti'),(59,'Dominica'),(60,'Dominican Republic'),(61,'Ecuador'),(62,'Egypt'),(63,'El Salvador'),(64,'Equatorial Guinea'),(65,'Eritrea'),(66,'Estonia'),(67,'Eswatini'),(68,'Ethiopia'),(69,'Fiji'),(70,'Finland'),(71,'France'),(72,'Gabon'),(73,'Gambia'),(74,'Georgia'),(75,'Germany'),(76,'Ghana'),(77,'Greece'),(78,'Grenada'),(79,'Guatemala'),(80,'Guinea'),(81,'Guinea-Bissau'),(82,'Guyana'),(83,'Haiti'),(84,'Honduras'),(85,'Hungary'),(86,'Iceland'),(87,'India'),(88,'Indonesia'),(89,'Iran'),(90,'Iraq'),(91,'Ireland'),(92,'Israel'),(93,'Italy'),(94,'Jamaica'),(95,'Japan'),(96,'Jordan'),(97,'Kazakhstan'),(98,'Kenya'),(99,'Kiribati'),(100,'Korea, Democratic People\'s Republic of'),(101,'Korea, Republic of'),(102,'Kuwait'),(103,'Kyrgyzstan'),(104,'Lao People\'s Democratic Republic'),(105,'Latvia'),(106,'Lebanon'),(107,'Lesotho'),(108,'Liberia'),(109,'Libya'),(110,'Liechtenstein'),(111,'Lithuania'),(112,'Luxembourg'),(113,'North Macedonia'),(114,'Madagascar'),(115,'Malawi'),(116,'Malaysia'),(117,'Maldives'),(118,'Mali'),(119,'Malta'),(120,'Marshall Islands'),(121,'Mauritania'),(122,'Mauritius'),(123,'Mexico'),(124,'Micronesia (Federated States of)'),(125,'Moldova'),(126,'Monaco'),(127,'Mongolia'),(128,'Myanmar'),(129,'Morocco'),(130,'Mozambique'),(131,'Namibia'),(132,'Nauru'),(133,'Nepal'),(134,'Netherlands'),(135,'New Zealand'),(136,'Nicaragua'),(137,'Niger'),(138,'Nigeria'),(139,'Niue'),(140,'Norfolk Island'),(141,'Northern Mariana Islands'),(142,'Norway'),(143,'Oman'),(144,'Pakistan'),(145,'Palau'),(146,'Panama'),(147,'Papua New Guinea'),(148,'Paraguay'),(149,'Peru'),(150,'Philippines'),(151,'Poland'),(152,'Portugal'),(153,'Puerto Rico'),(154,'Qatar'),(155,'Réunion'),(156,'Romania'),(157,'Russian Federation'),(158,'Rwanda'),(159,'Samoa'),(160,'San Marino'),(161,'São Tomé and Príncipe'),(162,'Saudi Arabia'),(163,'Senegal'),(164,'Serbia'),(165,'Seychelles'),(166,'Sierra Leone'),(167,'Singapore'),(168,'Sint Maarten'),(169,'Slovakia'),(170,'Slovenia'),(171,'Solomon Islands'),(172,'Somalia'),(173,'South Africa'),(174,'South Sudan'),(175,'Spain'),(176,'Sri Lanka'),(177,'Sudan'),(178,'Suriname'),(179,'Eswatini'),(180,'Sweden'),(181,'Switzerland'),(182,'Syrian Arab Republic'),(183,'Taiwan'),(184,'Tajikistan'),(185,'Tanzania'),(186,'Thailand'),(187,'Timor-Leste'),(188,'Togo'),(189,'Tokelau'),(190,'Tonga'),(191,'Trinidad and Tobago'),(192,'Tunisia'),(193,'Turkey'),(194,'Turkmenistan'),(195,'Tuvalu'),(196,'Uganda'),(197,'Ukraine'),(198,'United Arab Emirates'),(199,'United Kingdom'),(200,'United States of America'),(201,'Uruguay'),(202,'Uzbekistan'),(203,'Vanuatu'),(204,'Vatican City'),(205,'Venezuela'),(206,'Viet Nam'),(207,'Yemen'),(208,'Zambia'),(209,'Zimbabwe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userID` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userID` FOREIGN KEY (`user_id`) REFERENCES `users` (`userID`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-10-27 11:17:02.115534','1','Admin',1,'[{\"added\": {}}]',9,1),(2,'2024-10-27 11:17:08.412044','2','User',1,'[{\"added\": {}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(9,'users','rolemodel'),(10,'users','usermodel'),(6,'vacations','countriesmodel'),(8,'vacations','likesmodel'),(7,'vacations','vacationsmodel');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-10-27 10:48:32.321626'),(2,'contenttypes','0002_remove_content_type_name','2024-10-27 10:48:32.410972'),(3,'auth','0001_initial','2024-10-27 10:48:32.717395'),(4,'auth','0002_alter_permission_name_max_length','2024-10-27 10:48:32.800556'),(5,'auth','0003_alter_user_email_max_length','2024-10-27 10:48:32.807793'),(6,'auth','0004_alter_user_username_opts','2024-10-27 10:48:32.816468'),(7,'auth','0005_alter_user_last_login_null','2024-10-27 10:48:32.824294'),(8,'auth','0006_require_contenttypes_0002','2024-10-27 10:48:32.828526'),(9,'auth','0007_alter_validators_add_error_messages','2024-10-27 10:48:32.838830'),(10,'auth','0008_alter_user_username_max_length','2024-10-27 10:48:32.846704'),(11,'auth','0009_alter_user_last_name_max_length','2024-10-27 10:48:32.854599'),(12,'auth','0010_alter_group_name_max_length','2024-10-27 10:48:32.878983'),(13,'auth','0011_update_proxy_permissions','2024-10-27 10:48:32.889379'),(14,'auth','0012_alter_user_first_name_max_length','2024-10-27 10:48:32.901089'),(15,'users','0001_initial','2024-10-27 10:48:33.339532'),(16,'admin','0001_initial','2024-10-27 10:48:33.502923'),(17,'admin','0002_logentry_remove_auto_add','2024-10-27 10:48:33.514977'),(18,'admin','0003_logentry_add_action_flag_choices','2024-10-27 10:48:33.528826'),(19,'sessions','0001_initial','2024-10-27 10:48:33.581088'),(20,'users','0002_usermodel_favorite_pet','2024-10-27 10:52:33.852547'),(21,'users','0003_remove_usermodel_favorite_pet_alter_usermodel_email','2024-10-27 11:05:38.313070'),(22,'vacations','0001_initial','2024-10-27 11:24:46.161113'),(23,'users','0004_alter_usermodel_managers_and_more','2024-10-27 12:28:44.128163'),(24,'users','0005_alter_usermodel_is_superuser_and_more','2024-10-27 12:34:48.105075'),(25,'users','0006_alter_usermodel_is_active_alter_usermodel_is_staff_and_more','2024-10-27 12:36:40.245267');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('06ecpegj8pt6g541e0jgq8lvbhntgg2l','.eJxVjDkOwjAUBe_iGlm2Y8c_lPScIfpbSADZUpYKcXeIlALaNzPvZXrc1rHfFp37SczZeHP63Qj5oWUHcsdyq5ZrWeeJ7K7Ygy72WkWfl8P9OxhxGb81e2kbp8gxutimFDh1qkMA8QChiRh48DmDI-c70IHJMSaSQCqUIZv3B9vyOCk:1t5SDn:zTPdBWf6vnhBjUgw74aqcUOS_8Vn3Jdpmz382w8EzXA','2024-11-11 16:03:59.019349'),('25rqjirdugk1ujd9n9ec46cewnbmpgrc','.eJxVjDsOwjAQBe_iGll2_Kek5wzWOruLA8iR4qRC3B0ipYD2zcx7iQzbWvPWackTirPQ4vS7FRgf1HaAd2i3WY5zW5epyF2RB-3yOiM9L4f7d1Ch12_trFIGtCsWCIBSJDMAeR2cYR8iFk7MECBqRB1JJZN4oMCBIKK3Vrw_8Oo4dA:1t5S3q:ewlabvNPGjJAyC163KPp7fkC5Zb3SxVv3kF1SPwl8Rs','2024-11-11 15:53:42.748855'),('2x7pke50ou0qkhephod4dhfoy63z9rhi','.eJxVjDkOwjAUBe_iGlm2Y8c_lPScIfpbSADZUpYKcXeIlALaNzPvZXrc1rHfFp37SczZeHP63Qj5oWUHcsdyq5ZrWeeJ7K7Ygy72WkWfl8P9OxhxGb81e2kbp8gxutimFDh1qkMA8QChiRh48DmDI-c70IHJMSaSQCqUIZv3B9vyOCk:1t5SCh:V5ivw3P4jcy3xXWStrT7VNdPKb63Pr-mrXqVUV6KEgo','2024-11-11 16:02:51.749991'),('3n3t8z8c51g4xvgb58pst5wk4e0l3ikm','e30:1t5SBH:se8GXJvOQ0NxpzTyCb0crDrgKs2R5V9MP-1X8JgFqps','2024-11-11 16:01:23.522929'),('8b3oq5ix5q6ikbyy48qnw24evnohb5y2','e30:1t5S7V:W6gHYz9mrDJG2qrretVHfqVUwdIywrE4397EsS2cDs8','2024-11-11 15:57:29.923021'),('iuah2g8z9pybz7oj2tu0uuxa4n93aj9s','.eJxVjDsOwjAQBe_iGll2_Kek5wzWOruLA8iR4qRC3B0ipYD2zcx7iQzbWvPWackTirPQ4vS7FRgf1HaAd2i3WY5zW5epyF2RB-3yOiM9L4f7d1Ch12_trFIGtCsWCIBSJDMAeR2cYR8iFk7MECBqRB1JJZN4oMCBIKK3Vrw_8Oo4dA:1t5SR3:kkwDblXsSfIJHKm6avXDEMsKSvbychJ58IGj7lzva8M','2024-11-11 16:17:41.883509'),('o8fsfnojbdm6lb6icx723wf2rs8oxniu','.eJxVjDkOwjAUBe_iGlm2Y8c_lPScIfpbSADZUpYKcXeIlALaNzPvZXrc1rHfFp37SczZeHP63Qj5oWUHcsdyq5ZrWeeJ7K7Ygy72WkWfl8P9OxhxGb81e2kbp8gxutimFDh1qkMA8QChiRh48DmDI-c70IHJMSaSQCqUIZv3B9vyOCk:1t5SKj:soRIiVnqT2BKBhvqPy6doTqPkQbaY3plqOyn19uABy4','2024-11-11 16:11:09.292902'),('rxdw7khi5az6gftaq7ze3pzz26ai50tz','.eJxVjDkOwjAUBe_iGlm2Y8c_lPScIfpbSADZUpYKcXeIlALaNzPvZXrc1rHfFp37SczZeHP63Qj5oWUHcsdyq5ZrWeeJ7K7Ygy72WkWfl8P9OxhxGb81e2kbp8gxutimFDh1qkMA8QChiRh48DmDI-c70IHJMSaSQCqUIZv3B9vyOCk:1t5SCn:ttoaWfewRww52mrqCYQSmv4S2tPfw6P1Q4CRfX49c_Q','2024-11-11 16:02:57.811746'),('tluwntnjr9ejpn90dypt9k91xs47wh0w','.eJxVjDsOwjAQBe_iGll2_Kek5wzWOruLA8iR4qRC3B0ipYD2zcx7iQzbWvPWackTirPQ4vS7FRgf1HaAd2i3WY5zW5epyF2RB-3yOiM9L4f7d1Ch12_trFIGtCsWCIBSJDMAeR2cYR8iFk7MECBqRB1JJZN4oMCBIKK3Vrw_8Oo4dA:1t5S3m:55EUOXX224k6pmflrqd4lkUAp9pgTNjmFEp23p9aKAk','2024-11-11 15:53:38.273002'),('tusviny2n25hor9liklfolklhvzoieuy','.eJxVjDsOwjAQBe_iGll2_Kek5wzWOruLA8iR4qRC3B0ipYD2zcx7iQzbWvPWackTirPQ4vS7FRgf1HaAd2i3WY5zW5epyF2RB-3yOiM9L4f7d1Ch12_trFIGtCsWCIBSJDMAeR2cYR8iFk7MECBqRB1JJZN4oMCBIKK3Vrw_8Oo4dA:1t5SRC:RWWv7l5Joj_qZp5bpQXcdvr5LS7taVHUMZ5wZnN_w1Q','2024-11-11 16:17:50.361513'),('wchv8hfaldf6ey1mx1kyck6st7h70n01','.eJxVjDsOwjAQBe_iGll2_Kek5wzWOruLA8iR4qRC3B0ipYD2zcx7iQzbWvPWackTirPQ4vS7FRgf1HaAd2i3WY5zW5epyF2RB-3yOiM9L4f7d1Ch12_trFIGtCsWCIBSJDMAeR2cYR8iFk7MECBqRB1JJZN4oMCBIKK3Vrw_8Oo4dA:1t5SZc:J9EjZReolMZrCDOdu58ddZjpPTxilIJaFIp_9rqHAvQ','2024-11-11 16:26:32.039373'),('xsnhl6vme9iv3eac9p0tjogneihx92dc','e30:1t5SBJ:rCiHh4V-djlmCPO6sJpUuRYMNgH4rTChGubuJclD4_A','2024-11-11 16:01:25.981615');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `likesID` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `vacationID` int NOT NULL,
  PRIMARY KEY (`likesID`),
  KEY `likes_vacationID_592a72bf_fk_vacations_vacationID` (`vacationID`),
  KEY `likes_userID_id_8f53165f_fk_users_userID` (`userID`),
  CONSTRAINT `likes_userID_id_8f53165f_fk_users_userID` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
  CONSTRAINT `likes_vacationID_592a72bf_fk_vacations_vacationID` FOREIGN KEY (`vacationID`) REFERENCES `vacations` (`vacationID`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (111,35,9),(112,35,7),(126,35,10),(135,35,44),(148,35,8),(152,35,4),(159,35,52),(162,34,12),(163,34,44),(164,34,5),(165,34,3),(166,34,4),(168,34,52),(177,34,9),(179,34,2),(183,35,5),(186,35,12),(192,35,3),(193,35,1),(255,35,2);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `roleID` int NOT NULL AUTO_INCREMENT,
  `roleName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin'),(2,'User');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(150) DEFAULT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `date_joined` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `users_email_0ea73cca_uniq` (`email`),
  UNIQUE KEY `username` (`username`),
  KEY `users_role_id_1900a745_fk_roles_roleID` (`role_id`),
  CONSTRAINT `users_role_id_1900a745_fk_roles_roleID` FOREIGN KEY (`role_id`) REFERENCES `roles` (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('pbkdf2_sha256$870000$pLJQwdmZu4tAeiizO8dU8O$OkhgHEWVUktKNcaqOS+jvYEA6MWVYefAPgyEiYD3vIE=','2024-11-02 11:52:47.859671',1,'','john','smith','john@mail.com',1,1,'2024-10-27 11:10:56',1,1),('8020825a9d01368b38ae785ae140635ca981563be51be3631aab311460c89e7dfab1951b62c725fb30cb55b1e4cef1db8b155d370426298f4aba1abe730dcf7e',NULL,0,NULL,'bali ','boli','bali@mail.com',0,1,'2024-10-27 14:40:31',31,2),('8020825a9d01368b38ae785ae140635ca981563be51be3631aab311460c89e7dfab1951b62c725fb30cb55b1e4cef1db8b155d370426298f4aba1abe730dcf7e',NULL,0,NULL,'luna','muna','luna@mail.com',0,1,'2024-10-27 14:40:31',32,2),('8020825a9d01368b38ae785ae140635ca981563be51be3631aab311460c89e7dfab1951b62c725fb30cb55b1e4cef1db8b155d370426298f4aba1abe730dcf7e',NULL,0,NULL,'harry','potter','harry@mail.com',0,1,'2024-10-27 14:40:31',33,2),('8020825a9d01368b38ae785ae140635ca981563be51be3631aab311460c89e7dfab1951b62c725fb30cb55b1e4cef1db8b155d370426298f4aba1abe730dcf7e',NULL,0,NULL,'boby','sim','bob@mail.com',0,1,'2024-10-27 14:40:31',34,2),('8020825a9d01368b38ae785ae140635ca981563be51be3631aab311460c89e7dfab1951b62c725fb30cb55b1e4cef1db8b155d370426298f4aba1abe730dcf7e',NULL,0,NULL,'flyo','rio','rio@mail.com',0,1,'2024-10-27 14:40:31',35,2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usermodel_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_groups_usermodel_id_group_id_a61c11e3_uniq` (`usermodel_id`,`group_id`),
  KEY `users_groups_group_id_2f3517aa_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_groups_group_id_2f3517aa_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_groups_usermodel_id_50be6985_fk_users_userID` FOREIGN KEY (`usermodel_id`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_permissions`
--

DROP TABLE IF EXISTS `users_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usermodel_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_permissions_usermodel_id_permission_id_084eb3fa_uniq` (`usermodel_id`,`permission_id`),
  KEY `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_permissions_usermodel_id_6b298a0c_fk_users_userID` FOREIGN KEY (`usermodel_id`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_permissions`
--

LOCK TABLES `users_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacations`
--

DROP TABLE IF EXISTS `vacations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacations` (
  `vacationID` int NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `vacationImage` varchar(100) DEFAULT NULL,
  `countryID` int DEFAULT NULL,
  PRIMARY KEY (`vacationID`),
  KEY `vacations_countryID_d949c242_fk_countries_countryID` (`countryID`),
  CONSTRAINT `vacations_countryID_d949c242_fk_countries_countryID` FOREIGN KEY (`countryID`) REFERENCES `countries` (`countryID`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacations`
--

LOCK TABLES `vacations` WRITE;
/*!40000 ALTER TABLE `vacations` DISABLE KEYS */;
INSERT INTO `vacations` VALUES (1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2024-05-01','2024-05-10',1499.99,'2738e484-521a-484b-9912-dcc2fceb65fa.jpg',1),(2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2024-06-15','2024-06-25',1699.99,'10640686-2c5e-44c9-9b85-db07e233d334.jpg',2),(3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2024-07-10','2024-07-20',2000.00,'c9797503-09bf-4ae9-ab23-024433f5f40e.webp',3),(4,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2024-08-05','2024-08-15',2200.00,'switzerland.webp',4),(5,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2024-09-01','2024-09-10',1700.00,'egypt.jpg',5),(7,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2024-11-10','2024-11-20',2100.00,'brazil.jpg',7),(8,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2024-12-05','2024-12-15',2300.00,'ee126555-b7a4-4ade-a233-dd1c1b4e61a8.jpg',8),(9,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2025-01-01','2025-01-10',1600.00,'d1b9cf4e-be98-4105-82e5-7bb9cec14e5d.jpg',9),(10,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2025-02-15','2025-02-25',1850.00,'75bd8bb2-7d83-4419-bf82-817886175029.webp',10),(12,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2025-04-05','2025-04-15',1750.00,'70200bdf-160c-43b9-abec-16b224b43610.jpg',2),(44,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2025-01-03','2025-01-10',2750.00,'42f73ace-23ba-44fb-b238-6affc020ba8f.avif',3),(52,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2025-07-03','2025-07-20',2699.99,'51ab3196-ec5a-44dd-9a20-383659de28df.jpg',3);
/*!40000 ALTER TABLE `vacations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-05 13:46:55
