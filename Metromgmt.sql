-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: Metromgmt
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add auth group',8,'add_authgroup'),(26,'Can change auth group',8,'change_authgroup'),(27,'Can delete auth group',8,'delete_authgroup'),(28,'Can view auth group',8,'view_authgroup'),(29,'Can add auth group permissions',9,'add_authgrouppermissions'),(30,'Can change auth group permissions',9,'change_authgrouppermissions'),(31,'Can delete auth group permissions',9,'delete_authgrouppermissions'),(32,'Can view auth group permissions',9,'view_authgrouppermissions'),(33,'Can add auth permission',10,'add_authpermission'),(34,'Can change auth permission',10,'change_authpermission'),(35,'Can delete auth permission',10,'delete_authpermission'),(36,'Can view auth permission',10,'view_authpermission'),(37,'Can add auth user',11,'add_authuser'),(38,'Can change auth user',11,'change_authuser'),(39,'Can delete auth user',11,'delete_authuser'),(40,'Can view auth user',11,'view_authuser'),(41,'Can add auth user groups',12,'add_authusergroups'),(42,'Can change auth user groups',12,'change_authusergroups'),(43,'Can delete auth user groups',12,'delete_authusergroups'),(44,'Can view auth user groups',12,'view_authusergroups'),(45,'Can add auth user user permissions',13,'add_authuseruserpermissions'),(46,'Can change auth user user permissions',13,'change_authuseruserpermissions'),(47,'Can delete auth user user permissions',13,'delete_authuseruserpermissions'),(48,'Can view auth user user permissions',13,'view_authuseruserpermissions'),(49,'Can add django admin log',14,'add_djangoadminlog'),(50,'Can change django admin log',14,'change_djangoadminlog'),(51,'Can delete django admin log',14,'delete_djangoadminlog'),(52,'Can view django admin log',14,'view_djangoadminlog'),(53,'Can add django content type',15,'add_djangocontenttype'),(54,'Can change django content type',15,'change_djangocontenttype'),(55,'Can delete django content type',15,'delete_djangocontenttype'),(56,'Can view django content type',15,'view_djangocontenttype'),(57,'Can add django migrations',16,'add_djangomigrations'),(58,'Can change django migrations',16,'change_djangomigrations'),(59,'Can delete django migrations',16,'delete_djangomigrations'),(60,'Can view django migrations',16,'view_djangomigrations'),(61,'Can add django session',17,'add_djangosession'),(62,'Can change django session',17,'change_djangosession'),(63,'Can delete django session',17,'delete_djangosession'),(64,'Can view django session',17,'view_djangosession'),(65,'Can add feedback',18,'add_feedback'),(66,'Can change feedback',18,'change_feedback'),(67,'Can delete feedback',18,'delete_feedback'),(68,'Can view feedback',18,'view_feedback'),(69,'Can add station',19,'add_station'),(70,'Can change station',19,'change_station'),(71,'Can delete station',19,'delete_station'),(72,'Can view station',19,'view_station'),(73,'Can add ticketdetails',20,'add_ticketdetails'),(74,'Can change ticketdetails',20,'change_ticketdetails'),(75,'Can delete ticketdetails',20,'delete_ticketdetails'),(76,'Can view ticketdetails',20,'view_ticketdetails'),(77,'Can add traindetails',21,'add_traindetails'),(78,'Can change traindetails',21,'change_traindetails'),(79,'Can delete traindetails',21,'delete_traindetails'),(80,'Can view traindetails',21,'view_traindetails'),(81,'Can add user',7,'add_user'),(82,'Can change user',7,'change_user'),(83,'Can delete user',7,'delete_user'),(84,'Can view user',7,'view_user'),(85,'Can add metrouser',22,'add_metrouser'),(86,'Can change metrouser',22,'change_metrouser'),(87,'Can delete metrouser',22,'delete_metrouser'),(88,'Can view metrouser',22,'view_metrouser'),(89,'Can add help',23,'add_help'),(90,'Can change help',23,'change_help'),(91,'Can delete help',23,'delete_help'),(92,'Can view help',23,'view_help');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$4HmwwxsmKBI1RrtGRuDiu5$AjKflfY1OP5tIdKE8f1GAZq+wVE16fa2PT7DgDt7eyc=','2023-01-29 11:01:07.713947',1,'admin','','','sanathnavada@gmail.com',1,1,'2023-01-03 17:36:53.075290'),(28,'pbkdf2_sha256$390000$yJOnnb4rr5KbgEEJDaQFys$Fca3TcgOd0dcmw5vt5IY5Na4d/8vLuSkuDaML7GlqGo=','2023-01-06 15:41:28.954190',0,'vivek','','','vivek@gmail.xom',0,1,'2023-01-06 15:41:18.318402'),(30,'pbkdf2_sha256$390000$Iyhl129eMdB19CNwnezpUa$ZaJyT5xkX3byU5wYNQCPJunv3FImLRMFNPOGvSn0QSA=','2023-01-24 13:01:08.530072',1,'SanketHegde','','','sankethegde85@gmail.com',1,1,'2023-01-20 17:38:37.360988'),(32,'pbkdf2_sha256$390000$TXX7P6jWUgtvuus0hA5drP$RVzK7qrV4M95b/j9FUW5KElCf0mkFELvAD/Rlyconl4=','2023-01-27 07:36:52.567342',0,'VivekS','','','sankethegde85@gmail.com',0,1,'2023-01-27 07:36:39.077593'),(33,'pbkdf2_sha256$390000$T6VLYwoeqYRsM0qtxeL6nm$o8SDnpioYI2AtIMj/63sj7JoML8048DZzbDKVvnTDVQ=','2023-01-29 09:43:13.430624',0,'ram','','','sankethegde85@gmail.com',0,1,'2023-01-29 09:42:58.155667'),(38,'pbkdf2_sha256$390000$BPMbZrGvcHlKl1gg1lrSYC$HJatg71CJgvbOLM2xN/L9I49aUm0BrfZdpBdpS5vYgE=','2023-01-30 17:14:04.534938',0,'Sanket','','','sankethegde85@gmail.com',0,1,'2023-01-29 12:04:22.161365'),(41,'pbkdf2_sha256$390000$MpoUUjvR0EBAP0OovZgjUS$ne70EPvFQLZazQWSCDTZqCKdJyLPlpcNo/IOEbxuVJo=','2023-01-30 17:26:12.457080',0,'Admin2','','','admin@gmail.com',0,1,'2023-01-29 12:19:33.290298'),(42,'pbkdf2_sha256$390000$g5FSgWWdwFCZXMBILe1VCN$j/Ns6EQn4Go0w8WfHv1qnWYMXLQelm12329ieLIScIA=',NULL,0,'Admin1','','','sankethegde85@gmail.com',0,1,'2023-01-29 12:25:11.617369'),(43,'pbkdf2_sha256$390000$KdHS2EYHpcpGCGeniDIyLN$Q2kcBP3sceNgvz5/WJbzZLsg5H5jbmejq7Fqm5eD6uQ=','2023-01-29 20:34:01.814548',0,'Sanath','','','sanathkumar@gmail.com',0,1,'2023-01-29 12:36:28.400048'),(46,'pbkdf2_sha256$390000$VJaEnrsy2P4PpGFmN3yPaX$T6yK359uvHGXzTCppf4kNuwYA4+4cosBqfCOd4XnPU4=','2023-01-29 12:54:56.900595',0,'Admin12','','','admin1@gmail.com',0,1,'2023-01-29 12:38:43.704214'),(47,'pbkdf2_sha256$390000$7GoWfdYNXzjDWAsvsZq2Ia$ChzeZFszyLbaPCchlMfMoN3F0AxWIUAalngZYkQduLI=','2023-01-29 13:02:18.982406',0,'Sandeep','','','sandeephegde@gmail.com',0,1,'2023-01-29 12:51:14.265384'),(48,'pbkdf2_sha256$390000$nWQ8oxeMIQ5xkEHcHrzan9$Voch4TlgpMUTAihKXb73rJPWRqsC7TozwuaB+QP+Rbs=','2023-01-29 13:03:58.296719',0,'Santosh','','','santu@gmail.com',0,1,'2023-01-29 12:56:37.109460');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-01-04 12:27:26.474843','sanath','User object (sanath)',1,'[{\"added\": {}}]',7,1),(2,'2023-01-06 15:31:51.585766','24','32312123',3,'',4,1),(3,'2023-01-06 15:31:51.590753','26','323121236565',3,'',4,1),(4,'2023-01-10 10:53:28.464633','1','Ticketdetails object (1)',1,'[{\"added\": {}}]',20,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'mm','authgroup'),(9,'mm','authgrouppermissions'),(10,'mm','authpermission'),(11,'mm','authuser'),(12,'mm','authusergroups'),(13,'mm','authuseruserpermissions'),(14,'mm','djangoadminlog'),(15,'mm','djangocontenttype'),(16,'mm','djangomigrations'),(17,'mm','djangosession'),(18,'mm','feedback'),(23,'mm','help'),(22,'mm','metrouser'),(19,'mm','station'),(20,'mm','ticketdetails'),(21,'mm','traindetails'),(7,'mm','user'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-01-03 17:11:23.930993'),(2,'auth','0001_initial','2023-01-03 17:11:24.501651'),(3,'admin','0001_initial','2023-01-03 17:11:24.637385'),(4,'admin','0002_logentry_remove_auto_add','2023-01-03 17:11:24.651320'),(5,'admin','0003_logentry_add_action_flag_choices','2023-01-03 17:11:24.660677'),(6,'contenttypes','0002_remove_content_type_name','2023-01-03 17:11:24.756571'),(7,'auth','0002_alter_permission_name_max_length','2023-01-03 17:11:24.870063'),(8,'auth','0003_alter_user_email_max_length','2023-01-03 17:11:24.907246'),(9,'auth','0004_alter_user_username_opts','2023-01-03 17:11:24.921267'),(10,'auth','0005_alter_user_last_login_null','2023-01-03 17:11:25.144779'),(11,'auth','0006_require_contenttypes_0002','2023-01-03 17:11:25.151835'),(12,'auth','0007_alter_validators_add_error_messages','2023-01-03 17:11:25.165409'),(13,'auth','0008_alter_user_username_max_length','2023-01-03 17:11:25.235041'),(14,'auth','0009_alter_user_last_name_max_length','2023-01-03 17:11:25.292842'),(15,'auth','0010_alter_group_name_max_length','2023-01-03 17:11:25.314302'),(16,'auth','0011_update_proxy_permissions','2023-01-03 17:11:25.325974'),(17,'auth','0012_alter_user_first_name_max_length','2023-01-03 17:11:25.383943'),(18,'music','0001_initial','2023-01-03 17:11:25.468856'),(19,'music','0002_alter_album_options_alter_songs_options','2023-01-03 17:11:25.477268'),(20,'music','0003_alter_album_table_alter_songs_table','2023-01-03 17:11:25.484395'),(21,'music','0004_alter_album_options_alter_songs_options','2023-01-03 17:11:25.493032'),(22,'sessions','0001_initial','2023-01-03 17:35:28.221188'),(23,'mm','0001_initial','2023-01-04 12:26:34.748612'),(24,'mm','0002_metrouser_delete_user','2023-01-10 10:48:46.000538'),(25,'mm','0003_alter_feedback_table','2023-01-24 11:16:24.495546'),(26,'mm','0004_alter_feedback_table','2023-01-24 11:16:24.500544'),(27,'mm','0005_help_delete_traindetails','2023-01-30 17:13:13.862554');
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
INSERT INTO `django_session` VALUES ('dvm32k0av4y3z4ke4ui76a2ns2d3dbn5','.eJxVjL0OwyAQg9-FuUIB8XN07N5nQAccJW0FUkimqO9eImVoPXjwZ3tnHre1-K3T4ufErkywy28WML6oHiA9sT4aj62uyxz4UeEn7fzeEr1vZ_fvoGAvYx2cA5WjVFHCcItRqykAGCUoA2irndWRSBiH0ibrgDIOTU6YnE1gny_XCDf6:1pITrG:fnhAzCKtlYCq8NonCYo3Mo3tMM3gMfnrH6RInQW50ts','2023-02-02 12:17:30.441754'),('h550fgrl4oquj65rjerex19899gphej7','.eJxVjMEKwyAQRP_FcxGjq6499p5vkFWXmrYYiMmp9N-bQA7taWDem3mLSNta49Z5iVMRV6GDuPyWifKT20HKg9p9lnlu6zIleSjypF2Oc-HX7XT_Dir1uq_ROzcoq2xIBoBU2rMo0J4zGSDDoIvDgYwHQp8DIxrUaIkga1ZGfL7dCjcU:1pIwtH:E1w6pkBiw1bo2sSuI-ldj6b34tB8dqgJgem94VPip40','2023-02-03 19:17:31.996306'),('iue334myzc0q61l08bzpc3irm73yaken','.eJxVjEEOwiAQRe_C2hBggBaX7j0DmRlAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xSuIsrBan35GQH7ntJN2x3WbJc1uXieSuyIN2eZ1Tfl4O9--gYq_fevSswTsqSMDG8ZhSyYzKBxgIgqKQvSIDJqgBWNuMRRnUTjF7D5bF-wMV8zgd:1pMXv2:-st3-EsbmycGEc0ZjuphYhkcBhW1kLeHPW04P82KtZ0','2023-02-13 17:26:12.465077'),('morljw8zw8rw9lszgp5otgdlujaaut3y','e30:1pKvIz:aVj1KdG5W8tfApFVt9pCksdL16niJ2gPFPaFgN00BsQ','2023-02-09 06:00:13.572546'),('pwy5gfh0l89jxbbrysfzgbqtopv1nyl7','.eJxVjMEOwiAQRP-FsyEUWQoevfsNZFkWqRqalPZk_Hdp0oMeZg7zZuYtAm5rCVvjJUxJXIR24vQbRqQn152kB9b7LGmu6zJFuVfkQZu8zYlf16P7d1Cwlb72enBeg8vobVTKDGi8dd1zPtsxQlRMYEBnIvTAQKxB0QgRsYtZfL7w_jhn:1pDoqW:jhyEKHllKnbkEOdV07LzBtW-0aVh5PzvvLCahkdflD0','2023-01-20 15:41:28.961172'),('skna6p44ql4rskny38dyduum6h4qppnx','.eJxVjMEKwyAQRP_FcxGjq6499p5vkFWXmrYYiMmp9N-bQA7taWDem3mLSNta49Z5iVMRV6GDuPyWifKT20HKg9p9lnlu6zIleSjypF2Oc-HX7XT_Dir1uq_ROzcoq2xIBoBU2rMo0J4zGSDDoIvDgYwHQp8DIxrUaIkga1ZGfL7dCjcU:1pFeo4:bI6N6aDvrf0xW5iUo59PKOKEhyTDmnGAjSLuSa5v_Nk','2023-01-25 17:22:32.725338'),('ur7vxj9delrtrbm9m09r7dbof1s0a6yv','.eJxVjDsOwjAQBe_iGlnrjZOsKek5Q7QfhwRQLOVTIe4OkVJA-2bmvVzH2zp025LnbjR3dhW50-8orI887cTuPN2K1zKt8yh-V_xBF38tlp-Xw_07GHgZvnVMJApqLSLUTRXBIFkbIXAgxCyazWoWTA2Eik0boFZ7xkBGUvfRvT_5ATfz:1pMDMb:PeCbb5aXKSFaUuLPWu1f402qCmxr_wsddBqC_IWnG1g','2023-02-12 19:29:17.656735');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `username` varchar(20) DEFAULT NULL,
  `rev_stars` int DEFAULT NULL,
  `message` varchar(5000) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES ('Sandeep',4,'A leading platform for booking bus tickets, redBus has driven the country\'s bus booking journey over the past 16+ years through thousands of bus operators and routes. Striving to reach new heights when it comes to online bus reservations in India, redBus has become the perfect tool to use to have a smooth bus ticket booking experience.','sandeephegde@gmail.com','0'),('Santosh',5,'Namma Metro, also known as Bengaluru Metro, is a rapid transit system serving the city of Bengaluru, India. Upon its inauguration, it became the first underground metro system in South India. ','santu@gmail.com','1');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help`
--

DROP TABLE IF EXISTS `help`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help` (
  `username` varchar(20) DEFAULT NULL,
  `id` varchar(20) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `image` longblob,
  `contact` varchar(20) DEFAULT NULL,
  `message` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help`
--

LOCK TABLES `help` WRITE;
/*!40000 ALTER TABLE `help` DISABLE KEYS */;
INSERT INTO `help` VALUES ('Sanket','0','sankethegde85@gmail.com',NULL,'8792389765','site is good but Gupta bus driver behaviour is too bad and rude specially today means on 25th jan 2023. Bus timing is 7:45 but he started bus half an hr late and in dinner time also he not stopped bus every bus passenger not comfortable with driver. I and most of the passenger starving and we have patent and we all are hungry. How you will manage or taking updates I don\'t know if this same rude behavior ofdriver will continue then everytime passenger will suffer.'),('Sanath','1','sanathkumar@gmail.com',NULL,'9448129800','I asked for Rescheduling ( I booked day time instead of night), But red bus not helped. I averagely spending more than 10000 Rs for traveling monthly in Supermetro. I asked help for first time in Supermetro regarding Rescheduling or cancellations but they didn\'t agree. I won\'t use this app furthermore for booking ticket.');
/*!40000 ALTER TABLE `help` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrouser`
--

DROP TABLE IF EXISTS `metrouser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrouser` (
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `mno` bigint DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrouser`
--

LOCK TABLES `metrouser` WRITE;
/*!40000 ALTER TABLE `metrouser` DISABLE KEYS */;
INSERT INTO `metrouser` VALUES ('Admin2','admin@123',8790000012,'admin@gmail.com',1),('Admin12','admin@123',9400000012,'admin1@gmail.com',1),('Sanath','sanath@123',9448129800,'sanathkumar@gmail.com',0),('Sandeep','sandeep@123',6361645866,'sandeephegde@gmail.com',0),('Sanket','sanket@123',9480250082,'sankethegde@gmail.com',0),('Santosh','santosh@123',9019956696,'santu@gmail.com',0);
/*!40000 ALTER TABLE `metrouser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station` (
  `s_name` varchar(80) DEFAULT NULL,
  `station_id` int NOT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES ('Kengeri',0),('Kengeri Bus Terminal',1),('Pattanagere',2),('Jnana',3),('Rajarajeshwari Nagar',4),('Nayandahalli',5),('Mysore Road',6),('Deepanjali Nagar ',7),('Attiguppe ',8),('Vijayanagar',9),('Sri Balaganagadharanatha Swami Stn, Hosahalli',10),('Magadi Road',11),('Krantiveera Sangolli Rayanna Railway Stn',12),('Nadaprabhu Kempegowda Station, Majestic',13),('Sir M Vishweshwaraya Stn, Central College ',14),('Dr B R Ambedkar Stn, Vidhana Soudha',15),('Cubbon Park',16),('Mahatma Gandhi Road ',17),('Trinity',18),('Halasuru',19),('Indira Nagar',20),('Swami Vivekananda Road',21),('Baiyyapanahalli',22);
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticketdetails`
--

DROP TABLE IF EXISTS `ticketdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticketdetails` (
  `ticket_id` int NOT NULL,
  `sourceid` int DEFAULT NULL,
  `destid` int DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `uname` varchar(30) DEFAULT NULL,
  `trip` varchar(30) DEFAULT NULL,
  `cost` int DEFAULT NULL,
  `time_slot` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `tktype` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `sourceid` (`sourceid`),
  KEY `destid` (`destid`),
  KEY `email` (`email`),
  CONSTRAINT `ticketdetails_ibfk_1` FOREIGN KEY (`sourceid`) REFERENCES `station` (`station_id`) ON DELETE CASCADE,
  CONSTRAINT `ticketdetails_ibfk_2` FOREIGN KEY (`destid`) REFERENCES `station` (`station_id`) ON DELETE CASCADE,
  CONSTRAINT `ticketdetails_ibfk_3` FOREIGN KEY (`email`) REFERENCES `metrouser` (`email`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticketdetails`
--

LOCK TABLES `ticketdetails` WRITE;
/*!40000 ALTER TABLE `ticketdetails` DISABLE KEYS */;
INSERT INTO `ticketdetails` VALUES (0,0,11,NULL,'Sanket','2',440,'12:00 PM - 3:00 PM','2023-01-18',NULL),(1,2,5,NULL,'Sanket','1',30,'12:00 PM - 3:00 PM','2023-02-01','General');
/*!40000 ALTER TABLE `ticketdetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-31  0:03:49
