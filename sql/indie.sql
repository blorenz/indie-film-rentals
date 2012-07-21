-- MySQL dump 10.13  Distrib 5.5.21, for Linux (i686)
--
-- Host: localhost    Database: indie
-- ------------------------------------------------------
-- Server version	5.5.21

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
-- Table structure for table `addressmodel_address`
--

DROP TABLE IF EXISTS `addressmodel_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addressmodel_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_shipping_id` int(11) DEFAULT NULL,
  `user_billing_id` int(11) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_shipping_id` (`user_shipping_id`),
  UNIQUE KEY `user_billing_id` (`user_billing_id`),
  KEY `addressmodel_address_534dd89` (`country_id`),
  CONSTRAINT `country_id_refs_id_4e98115d` FOREIGN KEY (`country_id`) REFERENCES `addressmodel_country` (`id`),
  CONSTRAINT `user_billing_id_refs_id_3c787c96` FOREIGN KEY (`user_billing_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `user_shipping_id_refs_id_3c787c96` FOREIGN KEY (`user_shipping_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addressmodel_address`
--

LOCK TABLES `addressmodel_address` WRITE;
/*!40000 ALTER TABLE `addressmodel_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `addressmodel_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addressmodel_country`
--

DROP TABLE IF EXISTS `addressmodel_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addressmodel_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addressmodel_country`
--

LOCK TABLES `addressmodel_country` WRITE;
/*!40000 ALTER TABLE `addressmodel_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `addressmodel_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add migration history',8,'add_migrationhistory'),(23,'Can change migration history',8,'change_migrationhistory'),(24,'Can delete migration history',8,'delete_migrationhistory'),(25,'Can add link',9,'add_link'),(26,'Can change link',9,'change_link'),(27,'Can delete link',9,'delete_link'),(28,'Can add Price Tier',10,'add_price_tier'),(29,'Can change Price Tier',10,'change_price_tier'),(30,'Can delete Price Tier',10,'delete_price_tier'),(31,'Can add Price Tier Package',11,'add_price_tier_package'),(32,'Can change Price Tier Package',11,'change_price_tier_package'),(33,'Can delete Price Tier Package',11,'delete_price_tier_package'),(34,'Can add base indie rental product',12,'add_baseindierentalproduct'),(35,'Can change base indie rental product',12,'change_baseindierentalproduct'),(36,'Can delete base indie rental product',12,'delete_baseindierentalproduct'),(37,'Can add lens',13,'add_lens'),(38,'Can change lens',13,'change_lens'),(39,'Can delete lens',13,'delete_lens'),(40,'Can add camera',14,'add_camera'),(41,'Can change camera',14,'change_camera'),(42,'Can delete camera',14,'delete_camera'),(43,'Can add lighting',15,'add_lighting'),(44,'Can change lighting',15,'change_lighting'),(45,'Can delete lighting',15,'delete_lighting'),(46,'Can add Cart',16,'add_cart'),(47,'Can change Cart',16,'change_cart'),(48,'Can delete Cart',16,'delete_cart'),(49,'Can add Cart item',17,'add_cartitem'),(50,'Can change Cart item',17,'change_cartitem'),(51,'Can delete Cart item',17,'delete_cartitem'),(52,'Can add Product',18,'add_product'),(53,'Can change Product',18,'change_product'),(54,'Can delete Product',18,'delete_product'),(55,'Can add Order',19,'add_order'),(56,'Can change Order',19,'change_order'),(57,'Can delete Order',19,'delete_order'),(58,'Can add Order item',20,'add_orderitem'),(59,'Can change Order item',20,'change_orderitem'),(60,'Can delete Order item',20,'delete_orderitem'),(61,'Can add Order extra info',21,'add_orderextrainfo'),(62,'Can change Order extra info',21,'change_orderextrainfo'),(63,'Can delete Order extra info',21,'delete_orderextrainfo'),(64,'Can add Extra order price field',22,'add_extraorderpricefield'),(65,'Can change Extra order price field',22,'change_extraorderpricefield'),(66,'Can delete Extra order price field',22,'delete_extraorderpricefield'),(67,'Can add Extra order item price field',23,'add_extraorderitempricefield'),(68,'Can change Extra order item price field',23,'change_extraorderitempricefield'),(69,'Can delete Extra order item price field',23,'delete_extraorderitempricefield'),(70,'Can add Order payment',24,'add_orderpayment'),(71,'Can change Order payment',24,'change_orderpayment'),(72,'Can delete Order payment',24,'delete_orderpayment'),(73,'Can add task meta',25,'add_taskmeta'),(74,'Can change task meta',25,'change_taskmeta'),(75,'Can delete task meta',25,'delete_taskmeta'),(76,'Can add taskset meta',26,'add_tasksetmeta'),(77,'Can change taskset meta',26,'change_tasksetmeta'),(78,'Can delete taskset meta',26,'delete_tasksetmeta'),(79,'Can add interval',27,'add_intervalschedule'),(80,'Can change interval',27,'change_intervalschedule'),(81,'Can delete interval',27,'delete_intervalschedule'),(82,'Can add crontab',28,'add_crontabschedule'),(83,'Can change crontab',28,'change_crontabschedule'),(84,'Can delete crontab',28,'delete_crontabschedule'),(85,'Can add periodic tasks',29,'add_periodictasks'),(86,'Can change periodic tasks',29,'change_periodictasks'),(87,'Can delete periodic tasks',29,'delete_periodictasks'),(88,'Can add periodic task',30,'add_periodictask'),(89,'Can change periodic task',30,'change_periodictask'),(90,'Can delete periodic task',30,'delete_periodictask'),(91,'Can add worker',31,'add_workerstate'),(92,'Can change worker',31,'change_workerstate'),(93,'Can delete worker',31,'delete_workerstate'),(94,'Can add task',32,'add_taskstate'),(95,'Can change task',32,'change_taskstate'),(96,'Can delete task',32,'delete_taskstate'),(97,'Can add Country',33,'add_country'),(98,'Can change Country',33,'change_country'),(99,'Can delete Country',33,'delete_country'),(100,'Can add Address',34,'add_address'),(101,'Can change Address',34,'change_address'),(102,'Can delete Address',34,'delete_address'),(103,'Can add PayPal IPN',35,'add_paypalipn'),(104,'Can change PayPal IPN',35,'change_paypalipn'),(105,'Can delete PayPal IPN',35,'delete_paypalipn');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'admin','','','dsafda@fdsfa.com','bcrypt$$2a$12$R/cYQzLYShDWFQ7lELNW0uUqgab3ZUVXKUEqlZP58mSgqVyf5gr0O',1,1,1,'2012-07-21 16:21:49','2012-05-03 11:30:18'),(2,'david.test.1','David','Test','david@ohiohdvideo.com','bcrypt$$2a$12$N5A59muJ8d/Hfprg.Z4Lne5NHsvsBybhJUW.NBQwlkja8U2Ak7w6K',0,1,0,'2012-07-17 22:13:24','2012-07-17 22:13:25');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`),
  CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,2,97),(2,2,100),(3,2,101),(4,2,102);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_link`
--

DROP TABLE IF EXISTS `base_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `anchor` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_link`
--

LOCK TABLES `base_link` WRITE;
/*!40000 ALTER TABLE `base_link` DISABLE KEYS */;
INSERT INTO `base_link` VALUES (1,'Test','http://test.com/');
/*!40000 ALTER TABLE `base_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_taskmeta`
--

DROP TABLE IF EXISTS `celery_taskmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_taskmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'PENDING',
  `result` longtext,
  `date_done` datetime NOT NULL,
  `traceback` longtext,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `celery_taskmeta_c91f1bf` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_taskmeta`
--

LOCK TABLES `celery_taskmeta` WRITE;
/*!40000 ALTER TABLE `celery_taskmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_taskmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_tasksetmeta`
--

DROP TABLE IF EXISTS `celery_tasksetmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_tasksetmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskset_id` varchar(255) NOT NULL,
  `result` longtext NOT NULL,
  `date_done` datetime NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskset_id` (`taskset_id`),
  KEY `celery_tasksetmeta_c91f1bf` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_tasksetmeta`
--

LOCK TABLES `celery_tasksetmeta` WRITE;
/*!40000 ALTER TABLE `celery_tasksetmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_tasksetmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2012-05-23 02:02:48',1,9,'1','Link object',1,''),(2,'2012-06-28 13:36:04',1,10,'1','Days: 1 - 4 : 100.0%',1,''),(3,'2012-07-17 18:15:41',1,11,'1','Tier Package: Day Rate 1-4',1,''),(4,'2012-07-17 18:16:02',1,11,'2','Tier Package: Teir 1',1,''),(5,'2012-07-17 18:16:37',1,13,'1','Angenieux Optimo DP 16-42',1,''),(6,'2012-07-17 18:17:45',1,13,'1','Angenieux Optimo DP 16-42',2,'Changed description.'),(7,'2012-07-17 18:18:44',1,13,'2','Angenieux Optimo DP 30-80mm',1,''),(8,'2012-07-17 18:18:53',1,13,'1','Angenieux Optimo DP 16-42',2,'Changed status.'),(9,'2012-07-17 18:19:18',1,11,'2','Tier Package: Teir 1',3,''),(10,'2012-07-17 18:19:59',1,10,'1','Days: 1 - 3 : 100.0%',2,'Changed end_day.'),(11,'2012-07-17 18:20:21',1,10,'2','Days: 3 - 7 : 90.0%',1,''),(12,'2012-07-17 18:20:34',1,10,'3','Days: 7 - 10 : 80.0%',1,''),(13,'2012-07-17 18:21:04',1,10,'4','Days: 10 - 14 : 75.0%',1,''),(14,'2012-07-17 18:22:10',1,11,'1','Tier Package: Lensing Day Rate Package',2,'Changed tier and name.'),(15,'2012-07-17 18:22:39',1,13,'1','Angenieux Optimo DP 16-42,,',2,'Changed name.'),(16,'2012-07-17 18:22:44',1,13,'1','Angenieux Optimo DP 16-42mm',2,'Changed name.'),(17,'2012-07-17 18:22:48',1,13,'1','Angenieux Optimo DP 16-42mm',2,'Changed slug.'),(18,'2012-07-17 18:24:47',1,13,'2','Angenieux Optimo DP 30-80mm',2,'Changed description and crossSell.'),(19,'2012-07-17 18:25:52',1,13,'3','Zeiss CP.2 Lens Set',1,''),(20,'2012-07-17 18:27:53',1,11,'3','Tier Package: Video Camera Rental Rate',1,''),(21,'2012-07-17 19:00:30',1,14,'4','Panasonic HMC150',1,''),(22,'2012-07-17 19:00:37',1,14,'4','Panasonic HMC150',2,'Changed description and price_tier.'),(23,'2012-07-17 19:12:00',1,3,'2','david.test.1',1,''),(24,'2012-07-17 19:13:59',1,3,'2','david.test.1',2,'Changed password, first_name, last_name, email, user_permissions, last_login and date_joined.'),(25,'2012-07-17 19:18:49',1,10,'5','Days: 1 - 2 : 100.0%',1,''),(26,'2012-07-17 19:18:59',1,10,'6','Days: 2 - 3 : 50.0%',1,''),(27,'2012-07-17 19:19:10',1,10,'7','Days: 3 - 4 : 95.0%',1,''),(28,'2012-07-17 19:19:26',1,11,'4','Tier Package: Crazy Stupid Deal',1,''),(29,'2012-07-17 19:19:35',1,14,'5','Panasonic HMC160',1,''),(30,'2012-07-17 19:19:51',1,14,'5','Panasonic HMC160',2,'Changed active and price_tier.'),(31,'2012-07-17 19:19:58',1,14,'4','Panasonic HMC150',2,'Changed active.'),(32,'2012-07-17 19:20:14',1,13,'1','Angenieux Optimo DP 16-42mm',2,'Changed active.'),(33,'2012-07-17 19:20:19',1,13,'2','Angenieux Optimo DP 30-80mm',2,'Changed active.'),(34,'2012-07-17 19:20:25',1,13,'3','Zeiss CP.2 Lens Set',2,'Changed active.'),(35,'2012-07-17 19:24:52',1,14,'6','Canon 7D',1,''),(36,'2012-07-17 19:26:38',1,14,'7','Canon C300',1,''),(37,'2012-07-17 19:27:42',1,13,'8','Canon 24-70 F/2.8 IS USM',1,''),(38,'2012-07-17 19:30:36',1,13,'3','Zeiss CP.2 Lens Set',2,'No fields changed.'),(39,'2012-07-17 19:30:53',1,14,'6','Canon 7D',2,'Changed crossSell.'),(40,'2012-07-17 19:31:05',1,14,'7','Canon C300',2,'Changed crossSell.'),(41,'2012-07-17 19:39:35',1,13,'9','Canon 16-35 F/2.8 L II USM',1,''),(42,'2012-07-17 19:40:33',1,13,'10','Canon 17-85mm F/4-5.6 IS USM',1,''),(43,'2012-07-17 19:41:34',1,13,'11','Canon 24-105 F/4 USM',1,''),(44,'2012-07-17 19:43:09',1,13,'13','Canon 70-200mm F/2.8 IS II',1,''),(45,'2012-07-17 19:47:20',1,13,'14','Nikon to Canon Mount Adapter',1,''),(46,'2012-07-17 19:49:53',1,13,'14','Nikon to Canon Mount Adapter',2,'Changed unit_price and description.'),(47,'2012-07-17 19:51:12',1,13,'15','Zeiss ZF ',1,''),(48,'2012-07-17 19:51:24',1,13,'15','Zeiss ZF Prime Lens Set',2,'Changed name.'),(49,'2012-07-17 19:51:31',1,13,'15','Zeiss ZF Prime Lens Set',2,'Changed slug.'),(50,'2012-07-17 19:52:58',1,13,'16','Zeiss ZF.2 Prime Lens Set',1,''),(51,'2012-07-17 19:57:50',1,13,'17','Canon 5D Mark II',1,''),(52,'2012-07-17 19:58:35',1,14,'18','Sony EX1R XDCAM EX',1,''),(53,'2012-07-17 20:01:54',1,11,'5','Tier Package: Full Price Always',1,''),(54,'2012-07-17 20:02:01',1,15,'19','Dedolight',1,''),(55,'2012-07-17 20:02:08',1,15,'19','Dedolight',2,'Changed price_tier.'),(56,'2012-07-17 20:02:35',1,15,'20','Kino Flo Kamio 6E System',1,''),(57,'2012-07-17 20:03:09',1,15,'21','Reflecmedia LiteRing',1,''),(58,'2012-07-17 20:03:53',1,15,'22','Sun Gun (Anton Bauer)',1,''),(59,'2012-07-17 20:09:07',1,14,'23','Sony HVR-Z7U HDV',1,''),(60,'2012-07-17 20:10:15',1,14,'24','Sony EX-3 XDCam',1,''),(61,'2012-07-17 20:12:04',1,14,'25','Sony FS-100 Shoot Packages',1,''),(62,'2012-07-17 20:13:07',1,14,'26','Sony FS-700',1,''),(63,'2012-07-17 20:14:56',1,14,'27','RED Scarlet Body Package',1,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'migration history','south','migrationhistory'),(9,'link','base','link'),(10,'Price Tier','products','price_tier'),(11,'Price Tier Package','products','price_tier_package'),(12,'base indie rental product','products','baseindierentalproduct'),(13,'lens','products','lens'),(14,'camera','products','camera'),(15,'lighting','products','lighting'),(16,'Cart','shop','cart'),(17,'Cart item','shop','cartitem'),(18,'Product','shop','product'),(19,'Order','shop','order'),(20,'Order item','shop','orderitem'),(21,'Order extra info','shop','orderextrainfo'),(22,'Extra order price field','shop','extraorderpricefield'),(23,'Extra order item price field','shop','extraorderitempricefield'),(24,'Order payment','shop','orderpayment'),(25,'task meta','djcelery','taskmeta'),(26,'taskset meta','djcelery','tasksetmeta'),(27,'interval','djcelery','intervalschedule'),(28,'crontab','djcelery','crontabschedule'),(29,'periodic tasks','djcelery','periodictasks'),(30,'periodic task','djcelery','periodictask'),(31,'worker','djcelery','workerstate'),(32,'task','djcelery','taskstate'),(33,'Country','addressmodel','country'),(34,'Address','addressmodel','address'),(35,'PayPal IPN','ipn','paypalipn');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0f89fed8453d8c09eabd6ba017894132','NzBhOGZkMTkyOGQ0YWM2NWVlMDA5ZGU3M2Y4OGQyNTU2OTMzMzk3MzqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgaWVMUGw1THl1ckpNMXVXc3hFOEN5T0o4VlFySmVjejlxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-05-29 03:14:43'),('0f95d3157670bbf8e2202da3a64cfdcb','OGMxYTg5MGY5OTZjNTM3ZjgxODllMTU1NjI4ODZiYjQ0YzUwYjVjYzqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgM2FRU1FpMHBkWkxIR0w1Z1RKemE5amZyaGFnd2F0VXlxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-06-07 14:27:47'),('182bc41e2dc5393532cc13f06fd6380d','YWE4ZTE1OGY3ZDJiZjY1M2Y2YjZlOWZmYzA3OThkNTEzNzcxNjdjODqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgUUJzaFlqaWJPN0R1ZEpSQ1o3bERaUjE2cEg3ZEZRZUFxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-07-12 13:28:37'),('208beded532ffeb8ac8e2dbafe40b824','ZGJhNDVlODFkMGZhODU4N2U1Mzg4MTkxYWMyNzAyODQwNTQ3NjM4MDqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgWjB4RmhGSTZHd2hNdXByVE9yQ3dBSld6M2l3dTQ0M0NxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-07-31 20:14:01'),('20f220d2cfc88adf18c667fd6620b421','NTgwMTg5YWRjYzM3YzAxMjZiZGViZDE4ODQwM2NkNjM0YjY2OTY0YzqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgVFZZRkoxaVl0a0VlaEZNN1JWZlZIelNyUWVqRHhPV3hxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-06-07 15:07:23'),('3d4833269fc51910d8cfc0a49c42bc8c','MzBjOTZiYTMyZDcyMTEyY2JmY2Y4M2VlMDJiMjI0NThiMGQwNzMyZTqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgVVZuRlJGdkk5UTJmRFlTdEd4cFN1emppRkg2MVZiTENxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-06-17 20:57:14'),('3fb0052582e5837caa68e5b3bac9983a','N2FiNjFhOGQ3MzlmZTU4Y2U5ZjNlMjc0MjlhYjA2YWMzOWUzYmEzYjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-06-13 16:54:33'),('466d52531a0e87ece88141f0e7409232','N2FiNjFhOGQ3MzlmZTU4Y2U5ZjNlMjc0MjlhYjA2YWMzOWUzYmEzYjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-07-31 18:05:14'),('4afedd83d6933a19adf118994a743a6d','N2VkYWQ1MjM2MjZmZGM4MzA3M2E0Y2EyN2IxNmM4NTY0NGJhODQ0ZTqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgVWJIYjVKN3NkdGNkdjB0TWdkTERxN1JzdDdKTWNpcTVxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-06-05 23:12:52'),('56601064f70226b3f5d9f0714019753c','ODkwMzMxYmEwNTMwNTI1ZWVlMTQ1MzAwZmE0OWE4ZjA2NWNiMmZhOTqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgSjhqQ1JXMTVWMDUyNkF1QUN0TG1lOElNaXRndVNLTTVxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-06-16 21:32:19'),('58f774614b0db85ff200fae6744b2db3','ODMzMDMwMDAxNmFhYWZmMDczZTQyY2Y5ZDhmMGZlMzNmODY2YzdmZDqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgZlpEeTdjNUIyRUJhclFCbE9HamxpTGFvczZMWHhDckFxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-05-17 11:31:16'),('619c110b3ba35b8a533329a624efa3a1','NTI0YWNmMWFhOTA3NzQ1YzQ3NDEwNDFjNmI2M2U5ZWIxYzZjNmRjNDqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgWWNaN3pvMmhZWWpsZkg4Z2o0OHdEcG5tTnhVZE05YWpxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-06-07 14:25:49'),('6643e0a881a3bd5612e0a8fa3d5bb502','MzBhZTUyODI4NjRhZjE5NmM5ZGRlNDc1ZWFhMzZiZjdmNGFjMmUzZDqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n','2012-07-10 20:06:38'),('6f1793b73083b087673e0994008e3660','NTRiODc5NzFhYzAzODY5Y2JmYjgzNjZkOTA2ZWQ5MzU3OGVlYmU1MTqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgVW8xWFFyZ1hKNkRwWWtSMzR5aWNmQXJReWdvQXJFbGVxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-07-12 13:29:25'),('8119f7d458e2e2ab6da672b9ff27a5d8','Y2VmYTRkN2Y1MzQzODQ1OTQ5N2E1MTFmYzQ4MjVjZWM4ZDM2YTUwYjqAAn1xAS4=\n','2012-06-02 17:13:06'),('8d7c2fdd765a6a8175edecae24769116','Y2VmYTRkN2Y1MzQzODQ1OTQ5N2E1MTFmYzQ4MjVjZWM4ZDM2YTUwYjqAAn1xAS4=\n','2012-06-29 19:48:21'),('b53b6fcdeafac047b33c422c0f34432c','NWEwMGRlYTczZWRhMDUyZDJlOTU0YTdiYzc3M2I0MjJjZDdhMzNlYzqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgVUNBUEtJb0NHVXBVS0NTY2VxQjlpUTFFdUZNQWZDZ09xA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-06-06 02:02:18'),('bc66f957fb6f9d9d6d275b865ebd3dae','Y2VmYTRkN2Y1MzQzODQ1OTQ5N2E1MTFmYzQ4MjVjZWM4ZDM2YTUwYjqAAn1xAS4=\n','2012-08-04 16:20:31'),('bf5de44497aead6f9b2379a1e5b10de2','NGFhYzJkZDg0YmIxNGI4NzU0MWJkMjFlZTQxN2EwODM1MmE4MDY3YzqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgb2h1NTVHNTB3VDhlTjhIakZDQWRqMGtPU09tNm54QWxxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-05-29 22:10:55'),('e5f3b9bd054999b1d549d32a4c296a53','Y2VmYTRkN2Y1MzQzODQ1OTQ5N2E1MTFmYzQ4MjVjZWM4ZDM2YTUwYjqAAn1xAS4=\n','2012-08-04 16:00:49'),('f358246c2144c4dac8e3e6ba0eabb02f','N2IzY2M0YWU0M2FlYTYxYTk2NTFmYjU1ZjdiZmQyMjE3ZDE2ZWY3NDqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgWlQzaEFLRnhFbFF0ZFpiRHRyNGxQeXRSR3ZuMDNvZHpxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-07-10 20:10:11'),('f576762042adf5e2a2c6b40e70d04b29','ZThjMWUxZTY0ZDk5NjFhMzYwM2MzZThmYTU1NTNhYTBlNGIwZDYyODqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgc2xCYkVZWW52QWtkcGk2VHRTSTA4cEhLSlZLMXNZekZxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-08-04 16:21:49');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_crontabschedule`
--

DROP TABLE IF EXISTS `djcelery_crontabschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_crontabschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(64) NOT NULL DEFAULT '*',
  `hour` varchar(64) NOT NULL DEFAULT '*',
  `day_of_week` varchar(64) NOT NULL DEFAULT '*',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_crontabschedule`
--

LOCK TABLES `djcelery_crontabschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_crontabschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_crontabschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_intervalschedule`
--

DROP TABLE IF EXISTS `djcelery_intervalschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_intervalschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_intervalschedule`
--

LOCK TABLES `djcelery_intervalschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_intervalschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_intervalschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictask`
--

DROP TABLE IF EXISTS `djcelery_periodictask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `interval_id` int(11) DEFAULT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `last_run_at` datetime DEFAULT NULL,
  `total_run_count` int(10) unsigned NOT NULL DEFAULT '0',
  `date_changed` datetime NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `djcelery_periodictask_17d2d99d` (`interval_id`),
  KEY `djcelery_periodictask_7aa5fda` (`crontab_id`),
  CONSTRAINT `crontab_id_refs_id_1400a18c` FOREIGN KEY (`crontab_id`) REFERENCES `djcelery_crontabschedule` (`id`),
  CONSTRAINT `interval_id_refs_id_dfabcb7` FOREIGN KEY (`interval_id`) REFERENCES `djcelery_intervalschedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictask`
--

LOCK TABLES `djcelery_periodictask` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictask` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictasks`
--

DROP TABLE IF EXISTS `djcelery_periodictasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictasks` (
  `ident` smallint(6) NOT NULL DEFAULT '1',
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictasks`
--

LOCK TABLES `djcelery_periodictasks` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_taskstate`
--

DROP TABLE IF EXISTS `djcelery_taskstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_taskstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(64) NOT NULL,
  `task_id` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `tstamp` datetime NOT NULL,
  `args` longtext,
  `kwargs` longtext,
  `eta` datetime DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `result` longtext,
  `traceback` longtext,
  `runtime` double DEFAULT NULL,
  `retries` int(11) NOT NULL DEFAULT '0',
  `worker_id` int(11) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `djcelery_taskstate_355bfc27` (`state`),
  KEY `djcelery_taskstate_52094d6e` (`name`),
  KEY `djcelery_taskstate_f459b00` (`tstamp`),
  KEY `djcelery_taskstate_20fc5b84` (`worker_id`),
  KEY `djcelery_taskstate_c91f1bf` (`hidden`),
  CONSTRAINT `worker_id_refs_id_4e3453a` FOREIGN KEY (`worker_id`) REFERENCES `djcelery_workerstate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_taskstate`
--

LOCK TABLES `djcelery_taskstate` WRITE;
/*!40000 ALTER TABLE `djcelery_taskstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_taskstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_workerstate`
--

DROP TABLE IF EXISTS `djcelery_workerstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_workerstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `last_heartbeat` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  KEY `djcelery_workerstate_1475381c` (`last_heartbeat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_workerstate`
--

LOCK TABLES `djcelery_workerstate` WRITE;
/*!40000 ALTER TABLE `djcelery_workerstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_workerstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_ipn`
--

DROP TABLE IF EXISTS `paypal_ipn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_ipn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business` varchar(127) NOT NULL,
  `charset` varchar(32) NOT NULL,
  `custom` varchar(255) NOT NULL,
  `notify_version` decimal(64,2) DEFAULT '0.00',
  `parent_txn_id` varchar(19) NOT NULL,
  `receiver_email` varchar(127) NOT NULL,
  `receiver_id` varchar(127) NOT NULL,
  `residence_country` varchar(2) NOT NULL,
  `test_ipn` tinyint(1) NOT NULL DEFAULT '0',
  `txn_id` varchar(19) NOT NULL,
  `txn_type` varchar(128) NOT NULL,
  `verify_sign` varchar(255) NOT NULL,
  `address_country` varchar(64) NOT NULL,
  `address_city` varchar(40) NOT NULL,
  `address_country_code` varchar(64) NOT NULL,
  `address_name` varchar(128) NOT NULL,
  `address_state` varchar(40) NOT NULL,
  `address_status` varchar(11) NOT NULL,
  `address_street` varchar(200) NOT NULL,
  `address_zip` varchar(20) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `payer_business_name` varchar(127) NOT NULL,
  `payer_email` varchar(127) NOT NULL,
  `payer_id` varchar(13) NOT NULL,
  `auth_amount` decimal(64,2) DEFAULT '0.00',
  `auth_exp` varchar(28) NOT NULL,
  `auth_id` varchar(19) NOT NULL,
  `auth_status` varchar(9) NOT NULL,
  `exchange_rate` decimal(64,16) DEFAULT '0.0000000000000000',
  `invoice` varchar(127) NOT NULL,
  `item_name` varchar(127) NOT NULL,
  `item_number` varchar(127) NOT NULL,
  `mc_currency` varchar(32) NOT NULL DEFAULT 'USD',
  `mc_fee` decimal(64,2) DEFAULT '0.00',
  `mc_gross` decimal(64,2) DEFAULT '0.00',
  `mc_handling` decimal(64,2) DEFAULT '0.00',
  `mc_shipping` decimal(64,2) DEFAULT '0.00',
  `memo` varchar(255) NOT NULL,
  `num_cart_items` int(11) DEFAULT '0',
  `option_name1` varchar(64) NOT NULL,
  `option_name2` varchar(64) NOT NULL,
  `payer_status` varchar(10) NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_gross` decimal(64,2) DEFAULT '0.00',
  `payment_status` varchar(9) NOT NULL,
  `payment_type` varchar(7) NOT NULL,
  `pending_reason` varchar(14) NOT NULL,
  `protection_eligibility` varchar(32) NOT NULL,
  `quantity` int(11) DEFAULT '1',
  `reason_code` varchar(15) NOT NULL,
  `remaining_settle` decimal(64,2) DEFAULT '0.00',
  `settle_amount` decimal(64,2) DEFAULT '0.00',
  `settle_currency` varchar(32) NOT NULL,
  `shipping` decimal(64,2) DEFAULT '0.00',
  `shipping_method` varchar(255) NOT NULL,
  `tax` decimal(64,2) DEFAULT '0.00',
  `transaction_entity` varchar(7) NOT NULL,
  `auction_buyer_id` varchar(64) NOT NULL,
  `auction_closing_date` datetime DEFAULT NULL,
  `auction_multi_item` int(11) DEFAULT '0',
  `for_auction` decimal(64,2) DEFAULT '0.00',
  `amount` decimal(64,2) DEFAULT '0.00',
  `amount_per_cycle` decimal(64,2) DEFAULT '0.00',
  `initial_payment_amount` decimal(64,2) DEFAULT '0.00',
  `next_payment_date` datetime DEFAULT NULL,
  `outstanding_balance` decimal(64,2) DEFAULT '0.00',
  `payment_cycle` varchar(32) NOT NULL,
  `period_type` varchar(32) NOT NULL,
  `product_name` varchar(128) NOT NULL,
  `product_type` varchar(128) NOT NULL,
  `profile_status` varchar(32) NOT NULL,
  `recurring_payment_id` varchar(128) NOT NULL,
  `rp_invoice_id` varchar(127) NOT NULL,
  `time_created` datetime DEFAULT NULL,
  `amount1` decimal(64,2) DEFAULT '0.00',
  `amount2` decimal(64,2) DEFAULT '0.00',
  `amount3` decimal(64,2) DEFAULT '0.00',
  `mc_amount1` decimal(64,2) DEFAULT '0.00',
  `mc_amount2` decimal(64,2) DEFAULT '0.00',
  `mc_amount3` decimal(64,2) DEFAULT '0.00',
  `password` varchar(24) NOT NULL,
  `period1` varchar(32) NOT NULL,
  `period2` varchar(32) NOT NULL,
  `period3` varchar(32) NOT NULL,
  `reattempt` varchar(1) NOT NULL,
  `recur_times` int(11) DEFAULT '0',
  `recurring` varchar(1) NOT NULL,
  `retry_at` datetime DEFAULT NULL,
  `subscr_date` datetime DEFAULT NULL,
  `subscr_effective` datetime DEFAULT NULL,
  `subscr_id` varchar(19) NOT NULL,
  `username` varchar(64) NOT NULL,
  `case_creation_date` datetime DEFAULT NULL,
  `case_id` varchar(14) NOT NULL,
  `case_type` varchar(24) NOT NULL,
  `receipt_id` varchar(64) NOT NULL,
  `currency_code` varchar(32) NOT NULL DEFAULT 'USD',
  `handling_amount` decimal(64,2) DEFAULT '0.00',
  `transaction_subject` varchar(255) NOT NULL,
  `ipaddress` char(15) NOT NULL,
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `flag_code` varchar(16) NOT NULL,
  `flag_info` longtext NOT NULL,
  `query` longtext NOT NULL,
  `response` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `from_view` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_ipn`
--

LOCK TABLES `paypal_ipn` WRITE;
/*!40000 ALTER TABLE `paypal_ipn` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_ipn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_baseindierentalproduct`
--

DROP TABLE IF EXISTS `products_baseindierentalproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_baseindierentalproduct` (
  `product_ptr_id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `description_html` longtext,
  `status` int(11) NOT NULL,
  `price_tier_id` int(11) NOT NULL,
  PRIMARY KEY (`product_ptr_id`),
  KEY `products_baseindierentalproduct_75f94198` (`price_tier_id`),
  CONSTRAINT `price_tier_id_refs_id_187717d7` FOREIGN KEY (`price_tier_id`) REFERENCES `products_price_tier_package` (`id`),
  CONSTRAINT `product_ptr_id_refs_id_51444e54` FOREIGN KEY (`product_ptr_id`) REFERENCES `shop_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_baseindierentalproduct`
--

LOCK TABLES `products_baseindierentalproduct` WRITE;
/*!40000 ALTER TABLE `products_baseindierentalproduct` DISABLE KEYS */;
INSERT INTO `products_baseindierentalproduct` VALUES (1,'<p><img src=\"http://ohiohdvideo.com/images/products/optimo16-42.jpg\" border=\"0\" width=\"174\" height=\"149\" />Optimo DP 16-42 with an aperture of T2.8 is a lightweight and compact PL mount zoom lens. He is designed for digital cameras. Optimo DP 16-42 delivers the superior zoom optics, functionality and ergonomics that DP&rsquo;s demand at an economical price. The ideal match for the Optimo DP 30-80mm.</p>','<p><img src=\"http://ohiohdvideo.com/images/products/optimo16-42.jpg\" border=\"0\" width=\"174\" height=\"149\" />Optimo DP 16-42 with an aperture of T2.8 is a lightweight and compact PL mount zoom lens. He is designed for digital cameras. Optimo DP 16-42 delivers the superior zoom optics, functionality and ergonomics that DP&rsquo;s demand at an economical price. The ideal match for the Optimo DP 30-80mm.</p>',1,1),(2,'<p><img src=\"http://www.ohiohdvideo.com/images/products/Optimo30_80.jpg\" border=\"0\" width=\"187\" height=\"124\" />Optimo DP 30-80 with an aperture of T2.8 is a lightweight and compact PL mount zoom lens. OPTIMO DP 30-80 zoom lens is designed for digital cameras. Optimo DP 30-80 brings the very best of film to the new world of large format digital production.<br /> <br /> Includes Duclos Zoom Motor Bracket and 32-pitch gear.</p>','<p><img src=\"http://www.ohiohdvideo.com/images/products/Optimo30_80.jpg\" border=\"0\" width=\"187\" height=\"124\" />Optimo DP 30-80 with an aperture of T2.8 is a lightweight and compact PL mount zoom lens. OPTIMO DP 30-80 zoom lens is designed for digital cameras. Optimo DP 30-80 brings the very best of film to the new world of large format digital production.<br /> <br /> Includes Duclos Zoom Motor Bracket and 32-pitch gear.</p>',1,1),(3,'<p>Zeiss Compact Prime T/2.1 Lenses.<br /> Internal Focus with 114mm Front OD<br /> PL mount<br /> <br /> 28mm T/2.1<br /> 35mm T/2.1<br /> 50mm T/2.1<br /> 85mm T/2.1<br /> 100mm T/2.1</p>\r\n<p><img src=\"http://www.ohiohdvideo.com/images/products/ZeissCP2_5lens.jpg\" border=\"0\" width=\"235\" height=\"141\" /></p>','<p>Zeiss Compact Prime T/2.1 Lenses.<br /> Internal Focus with 114mm Front OD<br /> PL mount<br /> <br /> 28mm T/2.1<br /> 35mm T/2.1<br /> 50mm T/2.1<br /> 85mm T/2.1<br /> 100mm T/2.1</p>\n\n<p><img src=\"http://www.ohiohdvideo.com/images/products/ZeissCP2_5lens.jpg\" border=\"0\" width=\"235\" height=\"141\" /></p>',1,1),(4,'<div style=\"width: 30%; clear: none; float: left;\">\r\n<div class=\"productCallout\" style=\"clear: none;\"><img src=\"http://www.ohiohdvideo.com/images/products/aghmc150.jpg\" border=\"0\" />\r\n<h3 style=\"padding-top: 7px;\"><a href=\"http://www.ohiohdvideo.com/shopping_cart.php?addProduct=429\" target=\"_blank\">Add to Quote</a></h3>\r\n</div>\r\n<div id=\"prices\" style=\"margin-top: 15px; clear: none;\">\r\n<h3>Prices</h3>\r\n<ul style=\"list-style: none outside none;\">\r\n<li id=\"p_daily\">$100.00 per day</li>\r\n<li id=\"p_weekly\">$300.00 per week</li>\r\n<li id=\"p_monthly\">$900.00 per month</li>\r\n</ul>\r\n</div>\r\n<div id=\"includes\">&nbsp;</div>\r\n<div>&nbsp;</div>\r\n</div>\r\n<p>&nbsp;</p>\r\n<div><strong>AVCCAM - the Industry\'s Next Generation Affordable HD</strong><br /> <br /> The AG-HMC150 handheld is Panasonic\'s exciting new introduction to the AVCCAM series. Representing a major step forward in affordable HD video capture, the HMC150 utilizes highly efficient AVCHD recording, the industry\'s new long GOP standard based on MPEG-4, to provide stunning image quality and longer record time.<br /> <br /> The new handheld incorporates three 1/3-inch progressive CCD imagers to produce stunning 1920 x 1080 resolution picture quality far exceeding older Long GOP formats like HDV. It\'s equipped with a high-performance wide-angle* Leica Dicomar&trade; 13x zoom lens and 24- and 30-frame progressive capture in a full range of HD formats, making it well suited for all types of projects. With an exciting range of professional video and audio features and a compact, well-balanced design, the HMC150 is a \"must have\" for video professionals and enthusiasts looking for the best in affordable HD.<br /> <br /> <strong>Extra-Long Solid-State Recording</strong><br /> <br /> Forget minutes! With AVCHD technology and high-capacity SD memory cards, the HMC150 provides hours of beautiful high definition recordings at professional bitrates up to 21Mbps. And it\'s as easy to use as a digital still camera, with simple playback on many consumer devices and players, from computers and video game consoles to Blu-ray players and flat panel displays with SD card slots. <br /> <br /> AVCHD is currently supported by variety of editing solutions including: Apple iMovie, Apple Final Cut Pro 6.0.1, Adobe Premier Pro CS3, Grass Valley Edius PRO v4.5, Pinnacle Studio Plus 11, Nero7 Premium Reloaded, Ulead Video Studio 11 plus and DVD Movie Factory 6 Plus.<br /> <br />\r\n<ul>\r\n<li>Stunning, full pixel HD resolution with these professional bitrate recording modes</li>\r\n<li>PH - 21 Mpbs (1920x1080) -- Highest Quality Setting</li>\r\n<li>HA - 17 Mpbs (1920x1080)</li>\r\n<li>HG - 13 Mpbs (1920x1080)</li>\r\n<li>HE - 6 Mpbs (1440x1280) - Perfect for Long-form Recording</li>\r\n</ul>\r\n</div>\r\n<p><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"17\" height=\"17\" /><br clear=\"all\" /> <img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/dotted_line.gif\" border=\"0\" alt=\"\" width=\"746\" height=\"7\" /><br clear=\"all\" /> <img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"7\" height=\"7\" /></p>\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr valign=\"top\">\r\n<td><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"20\" height=\"1\" /></td>\r\n<td class=\"words\" width=\"550\">\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Extra-long record times - one 32GB SDHC card can hold up to 3 hours in the PH mode mode, 4 hours HA, 5.3 hours at HG mode and 12 hours in the HE mode.</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Records in a full range of HD formats including 1080/60i, 1080/30p, 1080/24p; 720/60p, 720/30p, 720/24p</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">1/3\" 3-CCD progressive image system with excellent sensitivity, superb color reproduction and resolution</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Optical Image Stabilization (O.I.S.) that ensures stable images, critical to high definition video display</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">13X 28mm to 368mm (35mm equivalent) Leica Dicomar&trade; wide-angle zoom lens</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Superb Manual &amp; Auto focus</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">In-camera Waveform Monitor, Vectorscope and two Focus assist displays</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">A host of advanced video functions like Cinelike Gamma and Dynamic Range Stretch (DRS)</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Professional-level connections including HDMI out, Component Out (D Terminal), Composite Out and RCA Audio out jacks, XLR audio inputs, USB 2.0 for file transfer, remote control for Zoom, Iris, Focus, Start/Stop</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Features three neutral density filters and three user sets</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Two locking XLR inputs with switches for mic/line, +48V Phantom Power, Auto/Manual level, and internal/external assignment</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Useful time/date stamp feature for applications like legal depositions or surveillance</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Includes professional-level assist functions like waveform monitor, vectorscope and two focus displays</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Variety of editing solutions (Render files to almost any format or media) </span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Free downloadable AVCHD Transcoder for conversion to DVCPRO HD available at www.panasonic.com/avccam</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Built with a durable, die-cast magnesium chassis frame for reliable performance in tough environments</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Lightweight (under 6lbs.), handheld design similar to the popular AG-DVX100</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Three-year warranty program (One year + two year extension upon registration)*</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>','<div style=\"width: 30%; clear: none; float: left;\">\n<div class=\"productCallout\" style=\"clear: none;\"><img src=\"http://www.ohiohdvideo.com/images/products/aghmc150.jpg\" border=\"0\" />\n<h3 style=\"padding-top: 7px;\"><a href=\"http://www.ohiohdvideo.com/shopping_cart.php?addProduct=429\" target=\"_blank\">Add to Quote</a></h3>\n</div>\n<div id=\"prices\" style=\"margin-top: 15px; clear: none;\">\n<h3>Prices</h3>\n<ul style=\"list-style: none outside none;\">\n<li id=\"p_daily\">$100.00 per day</li>\n<li id=\"p_weekly\">$300.00 per week</li>\n<li id=\"p_monthly\">$900.00 per month</li>\n</ul>\n</div>\n<div id=\"includes\">&nbsp;</div>\n<div>&nbsp;</div>\n</div>\n\n<p>&nbsp;</p>\n\n<div><strong>AVCCAM - the Industry\'s Next Generation Affordable HD</strong><br /> <br /> The AG-HMC150 handheld is Panasonic\'s exciting new introduction to the AVCCAM series. Representing a major step forward in affordable HD video capture, the HMC150 utilizes highly efficient AVCHD recording, the industry\'s new long GOP standard based on MPEG-4, to provide stunning image quality and longer record time.<br /> <br /> The new handheld incorporates three 1/3-inch progressive CCD imagers to produce stunning 1920 x 1080 resolution picture quality far exceeding older Long GOP formats like HDV. It\'s equipped with a high-performance wide-angle* Leica Dicomar&trade; 13x zoom lens and 24- and 30-frame progressive capture in a full range of HD formats, making it well suited for all types of projects. With an exciting range of professional video and audio features and a compact, well-balanced design, the HMC150 is a \"must have\" for video professionals and enthusiasts looking for the best in affordable HD.<br /> <br /> <strong>Extra-Long Solid-State Recording</strong><br /> <br /> Forget minutes! With AVCHD technology and high-capacity SD memory cards, the HMC150 provides hours of beautiful high definition recordings at professional bitrates up to 21Mbps. And it\'s as easy to use as a digital still camera, with simple playback on many consumer devices and players, from computers and video game consoles to Blu-ray players and flat panel displays with SD card slots. <br /> <br /> AVCHD is currently supported by variety of editing solutions including: Apple iMovie, Apple Final Cut Pro 6.0.1, Adobe Premier Pro CS3, Grass Valley Edius PRO v4.5, Pinnacle Studio Plus 11, Nero7 Premium Reloaded, Ulead Video Studio 11 plus and DVD Movie Factory 6 Plus.<br /> <br />\n<ul>\n<li>Stunning, full pixel HD resolution with these professional bitrate recording modes</li>\n<li>PH - 21 Mpbs (1920x1080) -- Highest Quality Setting</li>\n<li>HA - 17 Mpbs (1920x1080)</li>\n<li>HG - 13 Mpbs (1920x1080)</li>\n<li>HE - 6 Mpbs (1440x1280) - Perfect for Long-form Recording</li>\n</ul>\n</div>\n\n<p><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"17\" height=\"17\" /><br clear=\"all\" /> <img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/dotted_line.gif\" border=\"0\" alt=\"\" width=\"746\" height=\"7\" /><br clear=\"all\" /> <img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"7\" height=\"7\" /></p>\n\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr valign=\"top\">\n<td><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"20\" height=\"1\" /></td>\n<td class=\"words\" width=\"550\">\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Extra-long record times - one 32GB SDHC card can hold up to 3 hours in the PH mode mode, 4 hours HA, 5.3 hours at HG mode and 12 hours in the HE mode.</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Records in a full range of HD formats including 1080/60i, 1080/30p, 1080/24p; 720/60p, 720/30p, 720/24p</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">1/3\" 3-CCD progressive image system with excellent sensitivity, superb color reproduction and resolution</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Optical Image Stabilization (O.I.S.) that ensures stable images, critical to high definition video display</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">13X 28mm to 368mm (35mm equivalent) Leica Dicomar&trade; wide-angle zoom lens</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Superb Manual &amp; Auto focus</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">In-camera Waveform Monitor, Vectorscope and two Focus assist displays</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">A host of advanced video functions like Cinelike Gamma and Dynamic Range Stretch (DRS)</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Professional-level connections including HDMI out, Component Out (D Terminal), Composite Out and RCA Audio out jacks, XLR audio inputs, USB 2.0 for file transfer, remote control for Zoom, Iris, Focus, Start/Stop</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Features three neutral density filters and three user sets</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Two locking XLR inputs with switches for mic/line, +48V Phantom Power, Auto/Manual level, and internal/external assignment</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Useful time/date stamp feature for applications like legal depositions or surveillance</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Includes professional-level assist functions like waveform monitor, vectorscope and two focus displays</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Variety of editing solutions (Render files to almost any format or media) </span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Free downloadable AVCHD Transcoder for conversion to DVCPRO HD available at www.panasonic.com/avccam</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Built with a durable, die-cast magnesium chassis frame for reliable performance in tough environments</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Lightweight (under 6lbs.), handheld design similar to the popular AG-DVX100</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Three-year warranty program (One year + two year extension upon registration)*</span></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>',1,3),(5,'<p>The AG-AC160 features cutting-edge technology with its improved lens, camera, and recorder sections. The newly developed 22x zoom lens (28mm to 616mm in 35mm equivalent), boasts a wide field of view and capabilities much like an interchangeable lens, via a mechanical (cam-driven) zoom ring, a focus ring, and an iris ring. High-quality full-HD 1920x1080 is achieved with a combination of a high-sensitivity, low-noise, high-resolution 1/3-type 2.2-megapixel U.L.T. (Ultra Luminance Technology) MOS image sensor and the professional AVCHD PH mode. Advanced functions like high-quality LPCM recording, HD slow/quick-motion recording, HD/SDI output compatibility, DV (SD) recording mode, and a switchable 59.94Hz/50Hz mode make this an ideal camera for almost any type of production. <br /> <br /> Inherited from the VariCam, the Variable Frame Rate (VFR) function, which is widely used for movie, television, and commercial production, creates a wide range of film-cameralike images, such as overcranking for slow-motion and undercranking for quick-motion effects, and supports full-HD (1920x1080) progressive mode.<br /> <br /> While the camera employs the AVCHD recording format, it also supports the high-image-quality PH mode, featuring a compression efficiency that is more than twice that of the MPEG-2 system (such as HDV), delivering superb image quality and low data rates. While in PH mode, it also supports uncompressed 16 bit LPCM 2-channel digital audio recording.<br /> <br /> Dual memory card slots allows Relay Recording, so you can seamlessly record images onto two SDXC/SDHC memory cards consecutively, while Simultaneous Recording records the same images onto two different memory cards to increase reliability. The slot to be used can be switched during normal recording, and clips can also be copied between the 2 slots.<br /> <br /> The color EVF uses a 11.43mm (0.45 inches), approximately 1,226,000 dot-equivalent (852 x 480 x 3 [RGB]) LCOS (liquid crystal on silicon) display panel. It delivers bright, detailed, high-resolution images and a high response speed. The LCD monitor is comprised of a 87.63mm (3.45 inches), approximately 921,000-dot (1920 x 480) high-resolution panel. <img src=\"http://www.ohiohdvideo.com/images/products/hmc160.jpg\" border=\"0\" width=\"140\" height=\"140\" /></p>','<p>The AG-AC160 features cutting-edge technology with its improved lens, camera, and recorder sections. The newly developed 22x zoom lens (28mm to 616mm in 35mm equivalent), boasts a wide field of view and capabilities much like an interchangeable lens, via a mechanical (cam-driven) zoom ring, a focus ring, and an iris ring. High-quality full-HD 1920x1080 is achieved with a combination of a high-sensitivity, low-noise, high-resolution 1/3-type 2.2-megapixel U.L.T. (Ultra Luminance Technology) MOS image sensor and the professional AVCHD PH mode. Advanced functions like high-quality LPCM recording, HD slow/quick-motion recording, HD/SDI output compatibility, DV (SD) recording mode, and a switchable 59.94Hz/50Hz mode make this an ideal camera for almost any type of production. <br /> <br /> Inherited from the VariCam, the Variable Frame Rate (VFR) function, which is widely used for movie, television, and commercial production, creates a wide range of film-cameralike images, such as overcranking for slow-motion and undercranking for quick-motion effects, and supports full-HD (1920x1080) progressive mode.<br /> <br /> While the camera employs the AVCHD recording format, it also supports the high-image-quality PH mode, featuring a compression efficiency that is more than twice that of the MPEG-2 system (such as HDV), delivering superb image quality and low data rates. While in PH mode, it also supports uncompressed 16 bit LPCM 2-channel digital audio recording.<br /> <br /> Dual memory card slots allows Relay Recording, so you can seamlessly record images onto two SDXC/SDHC memory cards consecutively, while Simultaneous Recording records the same images onto two different memory cards to increase reliability. The slot to be used can be switched during normal recording, and clips can also be copied between the 2 slots.<br /> <br /> The color EVF uses a 11.43mm (0.45 inches), approximately 1,226,000 dot-equivalent (852 x 480 x 3 [RGB]) LCOS (liquid crystal on silicon) display panel. It delivers bright, detailed, high-resolution images and a high response speed. The LCD monitor is comprised of a 87.63mm (3.45 inches), approximately 921,000-dot (1920 x 480) high-resolution panel. <img src=\"http://www.ohiohdvideo.com/images/products/hmc160.jpg\" border=\"0\" width=\"140\" height=\"140\" /></p>',2,4),(6,'<div style=\"width: 30%; clear: none; float: left;\">\r\n<div class=\"productCallout\" style=\"clear: none;\"><img src=\"http://www.ohiohdvideo.com/images/products/Canon7D.jpg\" border=\"0\" /></div>\r\n<div id=\"prices\" style=\"margin-top: 15px; clear: none;\">\r\n<h3>Prices</h3>\r\n<ul style=\"list-style: none outside none;\">\r\n<li id=\"p_daily\">$125.00 per day</li>\r\n<li id=\"p_weekly\">$375.00 per week</li>\r\n<li id=\"p_monthly\">$1125.00 per month</li>\r\n</ul>\r\n</div>\r\n<div id=\"includes\">&nbsp;</div>\r\n<div>\r\n<h3 style=\"margin-top: 15px;\">Related Products:</h3>\r\n</div>\r\n</div>\r\n<h1 class=\"irregualrHeader\">Canon EOS 7D SLR Digital Camera with 17-85mm f/4-5.6 Lens</h1>\r\n<ul class=\"horizMenuBullet\">\r\n<li>2x Batteries</li>\r\n<li>2x Chargers</li>\r\n<li>1x 16GB CF Card</li>\r\n<li>18.0 Megapixels</li>\r\n<li>3.0\" LCD</li>\r\n<li>HD Video Recording</li>\r\n<li>Selectable Video Exposure + Frame Rates</li>\r\n<li>Dust &amp; Weather Resistant</li>\r\n<li>100% Viewfinder</li>\r\n<li>Self Cleaning Sensor</li>\r\n<li>High Sensitivity (ISO 12800)</li>\r\n<li>8fps Burst Mode</li>\r\n<li>17-85mm f/4-5.6 IS USM Lens</li>\r\n</ul>','<div style=\"width: 30%; clear: none; float: left;\">\n<div class=\"productCallout\" style=\"clear: none;\"><img src=\"http://www.ohiohdvideo.com/images/products/Canon7D.jpg\" border=\"0\" /></div>\n<div id=\"prices\" style=\"margin-top: 15px; clear: none;\">\n<h3>Prices</h3>\n<ul style=\"list-style: none outside none;\">\n<li id=\"p_daily\">$125.00 per day</li>\n<li id=\"p_weekly\">$375.00 per week</li>\n<li id=\"p_monthly\">$1125.00 per month</li>\n</ul>\n</div>\n<div id=\"includes\">&nbsp;</div>\n<div>\n<h3 style=\"margin-top: 15px;\">Related Products:</h3>\n</div>\n</div>\n\n<h1 class=\"irregualrHeader\">Canon EOS 7D SLR Digital Camera with 17-85mm f/4-5.6 Lens</h1>\n\n<ul class=\"horizMenuBullet\">\n<li>2x Batteries</li>\n<li>2x Chargers</li>\n<li>1x 16GB CF Card</li>\n<li>18.0 Megapixels</li>\n<li>3.0\" LCD</li>\n<li>HD Video Recording</li>\n<li>Selectable Video Exposure + Frame Rates</li>\n<li>Dust &amp; Weather Resistant</li>\n<li>100% Viewfinder</li>\n<li>Self Cleaning Sensor</li>\n<li>High Sensitivity (ISO 12800)</li>\n<li>8fps Burst Mode</li>\n<li>17-85mm f/4-5.6 IS USM Lens</li>\n</ul>',1,4),(7,'<div style=\"width: 30%; clear: none; float: left;\">\r\n<div class=\"productCallout\" style=\"clear: none;\"><img src=\"http://www.ohiohdvideo.com/images/products/CanonC300.jpg\" border=\"0\" /></div>\r\n<div id=\"includes\">&nbsp;</div>\r\n<div>&nbsp;</div>\r\n</div>\r\n<p>Canon\'s C300 has everything that made DSLRs great but withouth the drawbacks. Features a super35 size sensor, XLR Inputs, SDI monitoring, and the same EOS lens mount as a 5D or 7D allowing canon\'s wide supply of still lenses to be utilized.</p>','<div style=\"width: 30%; clear: none; float: left;\">\n<div class=\"productCallout\" style=\"clear: none;\"><img src=\"http://www.ohiohdvideo.com/images/products/CanonC300.jpg\" border=\"0\" /></div>\n<div id=\"includes\">&nbsp;</div>\n<div>&nbsp;</div>\n</div>\n\n<p>Canon\'s C300 has everything that made DSLRs great but withouth the drawbacks. Features a super35 size sensor, XLR Inputs, SDI monitoring, and the same EOS lens mount as a 5D or 7D allowing canon\'s wide supply of still lenses to be utilized.</p>',1,3),(8,'<p>Canon 24-70mm L-Series zoom lens.</p>','<p>Canon 24-70mm L-Series zoom lens.</p>',1,1),(9,'<p><span class=\"Apple-style-span\" style=\"color: #333333; font-family: verdana,arial,helvetica,sans-serif; font-size: medium;\"><span class=\"Apple-style-span\" style=\"font-size: 12px;\"><strong><span class=\"Apple-style-span\" style=\"color: #999999; font-family: tahoma,arial,\'lucida grande\',geneva,sans-serif; font-size: 11px; font-weight: normal;\"><span class=\"Apple-style-span\" style=\"color: #000000; font-family: arial,helvetica,sans-serif;\"><span style=\"font-size: 10pt;\">The EF 16-35mm f/2.8L II USM is a high performance, and ultra wide-angle Canon L-series lens. It has been specifically designed for improved edge-to-edge image quality that will meet the strict requirements of professional and high-end amateur photographers. It features 3 high-precision aspherical lens elements, each of a different type: ground, replica and GMo for even better image quality than the original EF 16-35mm f/2.8L USM. The circular aperture produces a beautiful and natural background blur when shooting at wider apertures. Other features include internal focusing, a ring type USM (Ultra Sonic Monitor), and new AF algorithms for fast and quiet autofocusing.</span></span></span></strong></span></span></p>','<p><span class=\"Apple-style-span\" style=\"color: #333333; font-family: verdana,arial,helvetica,sans-serif; font-size: medium;\"><span class=\"Apple-style-span\" style=\"font-size: 12px;\"><strong><span class=\"Apple-style-span\" style=\"color: #999999; font-family: tahoma,arial,\'lucida grande\',geneva,sans-serif; font-size: 11px; font-weight: normal;\"><span class=\"Apple-style-span\" style=\"color: #000000; font-family: arial,helvetica,sans-serif;\"><span style=\"font-size: 10pt;\">The EF 16-35mm f/2.8L II USM is a high performance, and ultra wide-angle Canon L-series lens. It has been specifically designed for improved edge-to-edge image quality that will meet the strict requirements of professional and high-end amateur photographers. It features 3 high-precision aspherical lens elements, each of a different type: ground, replica and GMo for even better image quality than the original EF 16-35mm f/2.8L USM. The circular aperture produces a beautiful and natural background blur when shooting at wider apertures. Other features include internal focusing, a ring type USM (Ultra Sonic Monitor), and new AF algorithms for fast and quiet autofocusing.</span></span></span></strong></span></span></p>',1,1),(10,'<p>17-85mm Zoom Lens. Compatible with 7D, will not cover a full frame sensor.<img src=\"http://www.ohiohdvideo.com/images/products/canon17-85.jpg\" border=\"0\" /></p>','<p>17-85mm Zoom Lens. Compatible with 7D, will not cover a full frame sensor.<img src=\"http://www.ohiohdvideo.com/images/products/canon17-85.jpg\" border=\"0\" /></p>',1,1),(11,'<p>Canon 24-105mm zoom lens.<img src=\"http://www.ohiohdvideo.com/images/products/canon24-105.jpg\" border=\"0\" width=\"123\" height=\"123\" /></p>','<p>Canon 24-105mm zoom lens.<img src=\"http://www.ohiohdvideo.com/images/products/canon24-105.jpg\" border=\"0\" width=\"123\" height=\"123\" /></p>',1,1),(13,'<p>Canon 24-70mm L-Series zoom lens.</p>','<p>Canon 24-70mm L-Series zoom lens.</p>',1,1),(14,'<p>Nikon to Canon Mount Adapter</p>','<p>Nikon to Canon Mount Adapter</p>',1,1),(15,'<div id=\"TB_ajaxWindowTitle\">This Set of Zeiss ZF&nbsp;Lenses has Cine Mods by Duclos Lens and is available in Canon or Nikon Mounts<br /> <br /> The 6 Lens Set Includes:</div>\r\n<ul>\r\n<li>Zeiss Distagon 18mm f/3.5 ZF Lens</li>\r\n<li>Zeiss Distagon 25mm f/2.8 ZF Lens</li>\r\n<li>Zeiss Planar 50mm F/2 ZF Lens</li>\r\n<li>Zeiss Planar 85mm f/1.4 ZF Lens</li>\r\n<li>Zeiss Makro-Planar 100mm f/2 ZF Lens</li>\r\n</ul>','<div id=\"TB_ajaxWindowTitle\">This Set of Zeiss ZF&nbsp;Lenses has Cine Mods by Duclos Lens and is available in Canon or Nikon Mounts<br /> <br /> The 6 Lens Set Includes:</div>\n\n<ul>\n<li>Zeiss Distagon 18mm f/3.5 ZF Lens</li>\n<li>Zeiss Distagon 25mm f/2.8 ZF Lens</li>\n<li>Zeiss Planar 50mm F/2 ZF Lens</li>\n<li>Zeiss Planar 85mm f/1.4 ZF Lens</li>\n<li>Zeiss Makro-Planar 100mm f/2 ZF Lens</li>\n</ul>',1,1),(16,'<p>Set of 6 Zeiss ZF.2 lenses with Nikon mount.&nbsp; Adapters are available for EOS mount (as well as m4/3, e-mount, and more). These lenses house electronics allowing them to communicate lens data to DSLR cameras. <br /> <br /> 21mm Distagon f/2.8<br /> 28mm Distagon f/2<br /> 35mm Distagon f/2<br /> 50mm Planar f/1.4<br /> 85mm Planar f/1.4<br /> 100mm Makro-Planar f/2</p>','<p>Set of 6 Zeiss ZF.2 lenses with Nikon mount.&nbsp; Adapters are available for EOS mount (as well as m4/3, e-mount, and more). These lenses house electronics allowing them to communicate lens data to DSLR cameras. <br /> <br /> 21mm Distagon f/2.8<br /> 28mm Distagon f/2<br /> 35mm Distagon f/2<br /> 50mm Planar f/1.4<br /> 85mm Planar f/1.4<br /> 100mm Makro-Planar f/2</p>',2,1),(17,'<ul class=\"horizMenuBullet\">\r\n<li>21.1 Megapixel Full-Frame Sensor</li>\r\n<li>3.0\" High Resolution LCD Display</li>\r\n<li>Live View Mode</li>\r\n<li>1080p Movie Mode</li>\r\n<li>Dust &amp; Weather-Resistant</li>\r\n<li>Self Cleaning Sensor</li>\r\n<li>Broad ISO Range (50-25600)</li>\r\n<li>3.9 fps Burst Mode</li>\r\n</ul>','<ul class=\"horizMenuBullet\">\n<li>21.1 Megapixel Full-Frame Sensor</li>\n<li>3.0\" High Resolution LCD Display</li>\n<li>Live View Mode</li>\n<li>1080p Movie Mode</li>\n<li>Dust &amp; Weather-Resistant</li>\n<li>Self Cleaning Sensor</li>\n<li>Broad ISO Range (50-25600)</li>\n<li>3.9 fps Burst Mode</li>\n</ul>',2,3),(18,'<ul class=\"horizMenuBullet\">\r\n<li>3 1/2\"-type CMOS Sensors</li>\r\n<li>1080p, 720p, 1080i</li>\r\n<li>Native 23.98p</li>\r\n<li>Full HD 1920 x 1080</li>\r\n<li>Wide Angle 14x Fujinon Lens</li>\r\n<li>1.23MP Viewfinder</li>\r\n<li>Records to SxS Cards</li>\r\n<li>DVCAM SD Mode</li>\r\n<li>Cache Recording</li>\r\n<li>HDMI Output</li>\r\n</ul>','<ul class=\"horizMenuBullet\">\n<li>3 1/2\"-type CMOS Sensors</li>\n<li>1080p, 720p, 1080i</li>\n<li>Native 23.98p</li>\n<li>Full HD 1920 x 1080</li>\n<li>Wide Angle 14x Fujinon Lens</li>\n<li>1.23MP Viewfinder</li>\n<li>Records to SxS Cards</li>\n<li>DVCAM SD Mode</li>\n<li>Cache Recording</li>\n<li>HDMI Output</li>\n</ul>',1,3),(19,'<p>The DLH4 offers a wide range of powering options - from battery to AC power with color temperature control. <br /> <br /> The light head of the Dedolight system is extremely compact. With its dual-lens Aspherics2 optical system it provides astounding light output. <br /> <br /> In flood position, its light output is greater than a 300W Fresnel studio fixture. In spot position, its output equals or exceeds a 1000W Fresnel studio fixture.</p>','<p>The DLH4 offers a wide range of powering options - from battery to AC power with color temperature control. <br /> <br /> The light head of the Dedolight system is extremely compact. With its dual-lens Aspherics2 optical system it provides astounding light output. <br /> <br /> In flood position, its light output is greater than a 300W Fresnel studio fixture. In spot position, its output equals or exceeds a 1000W Fresnel studio fixture.</p>',1,5),(20,'<p><strong>K</strong>amio Ring-Lights provide a glamour lighting solution for close ups in film and video photography. The soft, cool Kamio light falls gracefully on the subject&rsquo;s face because it mounts on the lens, unlike conventional on-camera quartz lights that produce heat and shadows. Kamios also display daylight and tungsten quality light without filtration.<br /> <span class=\"style64\"><span style=\"font-size: small;\"><span style=\"font-family: Verdana;\"><br /> Kamio 6E System,<br /> (On-Camera/ENG)</span></span></span></p>','<p><strong>K</strong>amio Ring-Lights provide a glamour lighting solution for close ups in film and video photography. The soft, cool Kamio light falls gracefully on the subject&rsquo;s face because it mounts on the lens, unlike conventional on-camera quartz lights that produce heat and shadows. Kamios also display daylight and tungsten quality light without filtration.<br /> <span class=\"style64\"><span style=\"font-size: small;\"><span style=\"font-family: Verdana;\"><br /> Kamio 6E System,<br /> (On-Camera/ENG)</span></span></span></p>',1,5),(21,'<p>Reflectomedia\'s LiteRing system makes lighting a green screen setup quick and easy. The LiteRing LED attaches directly to the camera lens and the Chromatte background reflects back a perfectly lite chromakey background to the camera <img src=\"http://www.ohiohdvideo.com/images/products/liteRingGreen.jpg\" border=\"0\" width=\"160\" height=\"128\" /></p>','<p>Reflectomedia\'s LiteRing system makes lighting a green screen setup quick and easy. The LiteRing LED attaches directly to the camera lens and the Chromatte background reflects back a perfectly lite chromakey background to the camera <img src=\"http://www.ohiohdvideo.com/images/products/liteRingGreen.jpg\" border=\"0\" width=\"160\" height=\"128\" /></p>',1,5),(22,'<p>The original Ultralights are available in both single and dual head versions both with standard 5/8\" stud mounting which makes them ideal for a wide variety of applications in addition to camera mounting. The original Ultralights also feature a choice of power sources: 12-14 volt and 30 volt <br /> <br /> . The integral 4 pin connector accepts a variety of power cables including the D-Tap.</p>','<p>The original Ultralights are available in both single and dual head versions both with standard 5/8\" stud mounting which makes them ideal for a wide variety of applications in addition to camera mounting. The original Ultralights also feature a choice of power sources: 12-14 volt and 30 volt <br /> <br /> . The integral 4 pin connector accepts a variety of power cables including the D-Tap.</p>',2,5),(23,'<div style=\"width: 65%; clear: none; float: right; position: relative;\">\r\n<div id=\"fullDesc\" style=\"font-size: 120%; line-height: 140%;\">\r\n<p><img src=\"http://www.ohiohdvideo.com/images/products/z7ufront.jpg\" border=\"0\" width=\"246\" height=\"246\" />The <strong>Sony HVR-Z7U</strong> is an HDV handheld camcorder featuring a lens mount. Previously unheard of for such a compact unit, the HVR-Z7U incorporates the convenience of a handheld camcorder with the flexibility of larger ENG cameras. <br /> <br /> The camera can also record directly to compact flash cards, via the camera\'s supplied memory recording unit. Combined with Sony\'s entire family of HDV products, the HVR-Z7U is a great camcorder for almost any production, including documentaries, news, low-budget movies, music videos, and industrials.</p>\r\n<dl><dt>Interchangeable Lenses</dt><dd>Users get the best of both worlds with this innovative camcorder. The HVR-Z7U\'s unique design is the first of its kind; a handheld camera with the interchangeable lens capability. Whether you are filming a movie or shooting a documentary, the HVR-Z7U has it covered.</dd></dl><dl><dt>ClearVID 3CMOS Technology</dt><dd>Sony\'s ClearVID sensors are positioned at a 45&deg; angle. Since each pixel is positioned at this angle the result is far clearer diagonal lines. Images will appear crisper, without the apparent \"jaggies\" that often plague video signals.</dd></dl><dl><dt>Record to Compact Flash</dt><dd>The camera comes with an attachable recording unit, allowing users to record HDV and DV to CompactFlash cards. With cards getting larger and larger in capacity, the ability to take advantage of tapeless workflow while still using cheap media is a welcome addition.</dd></dl><dl><dt>High Definition on MiniDV Tapes with HDV</dt><dd>The HDV format, used in the HVR-Z7U allows high definition recording on standard MiniDV tapes. This is accomplished by using the very popular MPEG-2 compression technique used in many applications, including DVDs and satellite television.</dd></dl><dl><dt>24p Capability</dt><dd>In 24p mode, images from the CMOS can be 2:3 pulldown-converted and recorded onto tape in the standard 60i HDV format. The tape can then be played back or edited using an ordinary HDV system. True 24p editing can be achieved by uploading 2:3 pulldown-converted images via an i.LINK FireWire interface to a compatible non-linear editing system. The resultant images resemble the visual motion of film!</dd></dl><dl><dt>HDMI Output</dt><dd>Many consumer products are adopting High Definition Media Interface (HDMI) connections for transmitting uncompressed digital HD video signals. Sony has upped the ante by incorporating this into the already extensive array of video output choices on the HVR-Z7U. Connect the camera to any HDTV via this interface and view all your footage the way it was meant to be seen: purely digital!</dd></dl></div>\r\n</div>','<div style=\"width: 65%; clear: none; float: right; position: relative;\">\n<div id=\"fullDesc\" style=\"font-size: 120%; line-height: 140%;\">\n<p><img src=\"http://www.ohiohdvideo.com/images/products/z7ufront.jpg\" border=\"0\" width=\"246\" height=\"246\" />The <strong>Sony HVR-Z7U</strong> is an HDV handheld camcorder featuring a lens mount. Previously unheard of for such a compact unit, the HVR-Z7U incorporates the convenience of a handheld camcorder with the flexibility of larger ENG cameras. <br /> <br /> The camera can also record directly to compact flash cards, via the camera\'s supplied memory recording unit. Combined with Sony\'s entire family of HDV products, the HVR-Z7U is a great camcorder for almost any production, including documentaries, news, low-budget movies, music videos, and industrials.</p>\n<dl><dt>Interchangeable Lenses</dt><dd>Users get the best of both worlds with this innovative camcorder. The HVR-Z7U\'s unique design is the first of its kind; a handheld camera with the interchangeable lens capability. Whether you are filming a movie or shooting a documentary, the HVR-Z7U has it covered.</dd></dl><dl><dt>ClearVID 3CMOS Technology</dt><dd>Sony\'s ClearVID sensors are positioned at a 45&deg; angle. Since each pixel is positioned at this angle the result is far clearer diagonal lines. Images will appear crisper, without the apparent \"jaggies\" that often plague video signals.</dd></dl><dl><dt>Record to Compact Flash</dt><dd>The camera comes with an attachable recording unit, allowing users to record HDV and DV to CompactFlash cards. With cards getting larger and larger in capacity, the ability to take advantage of tapeless workflow while still using cheap media is a welcome addition.</dd></dl><dl><dt>High Definition on MiniDV Tapes with HDV</dt><dd>The HDV format, used in the HVR-Z7U allows high definition recording on standard MiniDV tapes. This is accomplished by using the very popular MPEG-2 compression technique used in many applications, including DVDs and satellite television.</dd></dl><dl><dt>24p Capability</dt><dd>In 24p mode, images from the CMOS can be 2:3 pulldown-converted and recorded onto tape in the standard 60i HDV format. The tape can then be played back or edited using an ordinary HDV system. True 24p editing can be achieved by uploading 2:3 pulldown-converted images via an i.LINK FireWire interface to a compatible non-linear editing system. The resultant images resemble the visual motion of film!</dd></dl><dl><dt>HDMI Output</dt><dd>Many consumer products are adopting High Definition Media Interface (HDMI) connections for transmitting uncompressed digital HD video signals. Sony has upped the ante by incorporating this into the already extensive array of video output choices on the HVR-Z7U. Connect the camera to any HDTV via this interface and view all your footage the way it was meant to be seen: purely digital!</dd></dl></div>\n</div>',2,3),(24,'<p>The PMW-EX3 combines a state-of-the-art, non-linear XDCAM workflow with simply the best HD quality yet seen in a semi-shoulder camcorder. It is also the first semi-shoulder camcorder to carry the legendary CineAlta 24P brand with multiple frame rate recording capability such as 59.94i, 50i, and native 23.98P, as well being 1080i/720P switchable.<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> There is also a choice of a 35Mb/s High Quality mode or a 25Mb/s, HDV 1080i compatible mode. To take advantage of this high performance recording capability, the PMW-EX3 uses the same imaging system as the PMW-EX1, consisting of three &frac12;-inch type CMOS sensors, each with an effective pixel count of 1920x1080. In addition, there\'s a purpose-built interchangeable Fujinon Professional HD &frac12;-inch 14x lens and a unique dual focus ring mechanism. Included in the package is a &frac12;-inch lens adaptor to allow use of other &frac12;-inch lenses, plus the ability to use other optional lens adaptors for 2/3rd-inch, cinema-style and digital SLR lenses.<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> To maximize recording time, the PMW-EX3 has two memory card slots which means with a pair of 16 GB SxS PRO memory cards, it can record up to 140 minutes of HD footage.<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> A wide variety of accessories are also available, including a USB Reader/Writer, a wide-conversion lens, battery and charger.<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> The PMW-EX3 HD compact camcorder is the ideal solution for a wide range of customers from broadcasters through to independent videographers and film makers who want exceptional HD picture quality and state-of-the-art workflow from an affordable semi-shoulder camcorder.<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> ABOUT THE &ldquo;SxS PRO&rdquo; FORMAT<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> SxS PRO (&ldquo;S-by-S&rdquo;) is a new nonlinear recording media.&nbsp;</p>\r\n<ul>\r\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Compatible with ExpressCard3/4 interface slot, which is common on modern Windows PCs and Macs</li>\r\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Uses PCI Express interface and achieves an extremely high \"read\" speed of up to 800 Mb/s</li>\r\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Large storage capacity: SBP-8 (8 GB) and SBP-16 (16 GB) memory cards are available. One SBP-8 (8 GB) memory card is supplied with the PMW-EX1</li>\r\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Can record up to 70 minutes of HD video and audio (using one 16-GB memory card)</li>\r\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Compact size: approx. 2.95&rdquo;x1.34\"x0.2&rdquo; (75&times;34&times;5mm) (excluding the projecting parts) - half the size of the older PC Card standard</li>\r\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Low power consumption</li>\r\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Highly reliable: can resist shocks (up to 1500 G) and vibrations (up to 15 G)</li>\r\n</ul>','<p>The PMW-EX3 combines a state-of-the-art, non-linear XDCAM workflow with simply the best HD quality yet seen in a semi-shoulder camcorder. It is also the first semi-shoulder camcorder to carry the legendary CineAlta 24P brand with multiple frame rate recording capability such as 59.94i, 50i, and native 23.98P, as well being 1080i/720P switchable.<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> There is also a choice of a 35Mb/s High Quality mode or a 25Mb/s, HDV 1080i compatible mode. To take advantage of this high performance recording capability, the PMW-EX3 uses the same imaging system as the PMW-EX1, consisting of three &frac12;-inch type CMOS sensors, each with an effective pixel count of 1920x1080. In addition, there\'s a purpose-built interchangeable Fujinon Professional HD &frac12;-inch 14x lens and a unique dual focus ring mechanism. Included in the package is a &frac12;-inch lens adaptor to allow use of other &frac12;-inch lenses, plus the ability to use other optional lens adaptors for 2/3rd-inch, cinema-style and digital SLR lenses.<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> To maximize recording time, the PMW-EX3 has two memory card slots which means with a pair of 16 GB SxS PRO memory cards, it can record up to 140 minutes of HD footage.<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> A wide variety of accessories are also available, including a USB Reader/Writer, a wide-conversion lens, battery and charger.<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> The PMW-EX3 HD compact camcorder is the ideal solution for a wide range of customers from broadcasters through to independent videographers and film makers who want exceptional HD picture quality and state-of-the-art workflow from an affordable semi-shoulder camcorder.<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> ABOUT THE &ldquo;SxS PRO&rdquo; FORMAT<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> SxS PRO (&ldquo;S-by-S&rdquo;) is a new nonlinear recording media.&nbsp;</p>\n\n<ul>\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Compatible with ExpressCard3/4 interface slot, which is common on modern Windows PCs and Macs</li>\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Uses PCI Express interface and achieves an extremely high \"read\" speed of up to 800 Mb/s</li>\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Large storage capacity: SBP-8 (8 GB) and SBP-16 (16 GB) memory cards are available. One SBP-8 (8 GB) memory card is supplied with the PMW-EX1</li>\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Can record up to 70 minutes of HD video and audio (using one 16-GB memory card)</li>\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Compact size: approx. 2.95&rdquo;x1.34\"x0.2&rdquo; (75&times;34&times;5mm) (excluding the projecting parts) - half the size of the older PC Card standard</li>\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Low power consumption</li>\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Highly reliable: can resist shocks (up to 1500 G) and vibrations (up to 15 G)</li>\n</ul>',2,3),(25,'<p>The Sony FS-100 offers the advantages of a large sensor (the same Super35 sized sensor as found in the Sony F3), records to SDHC cards in an AVCHD codec, and allows the use of interchangeable lenses via Sony\'s E-mount. The E-mount is adaptable to accomodate other lenses (check out our Zeiss ZF Nikon mount primes) or use our 18-55 E-mount zoom. Allows progressive slow and quick motion at full HD (1920x1080). Features a flip up LCD and offers HDMI or Component outputs for monitoring the uncompressed 4:2:2 signal.<br /> <br /> To help you get the right gear for your shoot, choose from our customizable package options.</p>','<p>The Sony FS-100 offers the advantages of a large sensor (the same Super35 sized sensor as found in the Sony F3), records to SDHC cards in an AVCHD codec, and allows the use of interchangeable lenses via Sony\'s E-mount. The E-mount is adaptable to accomodate other lenses (check out our Zeiss ZF Nikon mount primes) or use our 18-55 E-mount zoom. Allows progressive slow and quick motion at full HD (1920x1080). Features a flip up LCD and offers HDMI or Component outputs for monitoring the uncompressed 4:2:2 signal.<br /> <br /> To help you get the right gear for your shoot, choose from our customizable package options.</p>',2,3),(26,'<p>Sony\'s FS-700 features a Super 35 size CMOS sensor with excellent low light capabilities. The shallow NEX mount allows many other lens styles to be easily adapted to the camera. PL, Nikon, and Canon EOS (EF) adapters are available giving you the flexibility to use the glass that\'s right for your project and budget.<br /> <br /> The FS-700 offers a wide range of framerates and recording options. Record continuous AVCHD 1080p video at up to 60fps, or shoot bursts of 1080p video at 120 or 240fps. Lowering the resolution allows burst recording at up to 960fps. Footage is recorded to easy to find SDHC memory cards, or to Sony\'s optionalFMU (Flash Memory Unit not available from Ohio HD).<br /> <br /> The camera also features many pro industry standards, including both HDMI and 3G-HDSDI outputs, 2-XLR inputs, and built in switchable ND filters at 2, 4, and 8 stop increments.</p>','<p>Sony\'s FS-700 features a Super 35 size CMOS sensor with excellent low light capabilities. The shallow NEX mount allows many other lens styles to be easily adapted to the camera. PL, Nikon, and Canon EOS (EF) adapters are available giving you the flexibility to use the glass that\'s right for your project and budget.<br /> <br /> The FS-700 offers a wide range of framerates and recording options. Record continuous AVCHD 1080p video at up to 60fps, or shoot bursts of 1080p video at 120 or 240fps. Lowering the resolution allows burst recording at up to 960fps. Footage is recorded to easy to find SDHC memory cards, or to Sony\'s optionalFMU (Flash Memory Unit not available from Ohio HD).<br /> <br /> The camera also features many pro industry standards, including both HDMI and 3G-HDSDI outputs, 2-XLR inputs, and built in switchable ND filters at 2, 4, and 8 stop increments.</p>',1,3),(27,'<p>The RED&nbsp;Scarlet makes shooting 4K RAW possible on a smaller budget. Supports 5K RAW resolution for stills, and 4K RAW video recording at up to 30fps makes this a very robust, yet affordable camera. <br /> <br /> Available with PL or EF mount.</p>','<p>The RED&nbsp;Scarlet makes shooting 4K RAW possible on a smaller budget. Supports 5K RAW resolution for stills, and 4K RAW video recording at up to 30fps makes this a very robust, yet affordable camera. <br /> <br /> Available with PL or EF mount.</p>',1,5);
/*!40000 ALTER TABLE `products_baseindierentalproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_baseindierentalproduct_crossSell`
--

DROP TABLE IF EXISTS `products_baseindierentalproduct_crossSell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_baseindierentalproduct_crossSell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_baseindierentalproduct_id` int(11) NOT NULL,
  `to_baseindierentalproduct_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `from_baseindierentalproduct_id` (`from_baseindierentalproduct_id`,`to_baseindierentalproduct_id`),
  KEY `products_baseindierentalproduct_crossSell_4a43f4cb` (`from_baseindierentalproduct_id`),
  KEY `products_baseindierentalproduct_crossSell_3ae356fc` (`to_baseindierentalproduct_id`),
  CONSTRAINT `from_baseindierentalproduct_id_refs_product_ptr_id_3e0e0aca` FOREIGN KEY (`from_baseindierentalproduct_id`) REFERENCES `products_baseindierentalproduct` (`product_ptr_id`),
  CONSTRAINT `to_baseindierentalproduct_id_refs_product_ptr_id_3e0e0aca` FOREIGN KEY (`to_baseindierentalproduct_id`) REFERENCES `products_baseindierentalproduct` (`product_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_baseindierentalproduct_crossSell`
--

LOCK TABLES `products_baseindierentalproduct_crossSell` WRITE;
/*!40000 ALTER TABLE `products_baseindierentalproduct_crossSell` DISABLE KEYS */;
INSERT INTO `products_baseindierentalproduct_crossSell` VALUES (11,6,8),(17,6,9),(20,6,10),(23,6,11),(13,7,8),(18,7,9),(24,7,11),(12,8,6),(14,8,7),(15,9,6),(16,9,7),(19,10,6),(21,11,6),(22,11,7);
/*!40000 ALTER TABLE `products_baseindierentalproduct_crossSell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_baseindierentalproduct_links`
--

DROP TABLE IF EXISTS `products_baseindierentalproduct_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_baseindierentalproduct_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseindierentalproduct_id` int(11) NOT NULL,
  `link_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `baseindierentalproduct_id` (`baseindierentalproduct_id`,`link_id`),
  KEY `products_baseindierentalproduct_links_18d78745` (`baseindierentalproduct_id`),
  KEY `products_baseindierentalproduct_links_bb3ce60` (`link_id`),
  CONSTRAINT `baseindierentalproduct_id_refs_product_ptr_id_663ff1bb` FOREIGN KEY (`baseindierentalproduct_id`) REFERENCES `products_baseindierentalproduct` (`product_ptr_id`),
  CONSTRAINT `link_id_refs_id_1096e5d` FOREIGN KEY (`link_id`) REFERENCES `base_link` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_baseindierentalproduct_links`
--

LOCK TABLES `products_baseindierentalproduct_links` WRITE;
/*!40000 ALTER TABLE `products_baseindierentalproduct_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_baseindierentalproduct_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_camera`
--

DROP TABLE IF EXISTS `products_camera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_camera` (
  `baseindierentalproduct_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`baseindierentalproduct_ptr_id`),
  CONSTRAINT `baseindierentalproduct_ptr_id_refs_product_ptr_id_2bee5e63` FOREIGN KEY (`baseindierentalproduct_ptr_id`) REFERENCES `products_baseindierentalproduct` (`product_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_camera`
--

LOCK TABLES `products_camera` WRITE;
/*!40000 ALTER TABLE `products_camera` DISABLE KEYS */;
INSERT INTO `products_camera` VALUES (4),(5),(6),(7),(18),(23),(24),(25),(26),(27);
/*!40000 ALTER TABLE `products_camera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_lens`
--

DROP TABLE IF EXISTS `products_lens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_lens` (
  `baseindierentalproduct_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`baseindierentalproduct_ptr_id`),
  CONSTRAINT `baseindierentalproduct_ptr_id_refs_product_ptr_id_2d67dca0` FOREIGN KEY (`baseindierentalproduct_ptr_id`) REFERENCES `products_baseindierentalproduct` (`product_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_lens`
--

LOCK TABLES `products_lens` WRITE;
/*!40000 ALTER TABLE `products_lens` DISABLE KEYS */;
INSERT INTO `products_lens` VALUES (1),(2),(3),(8),(9),(10),(11),(13),(14),(15),(16),(17);
/*!40000 ALTER TABLE `products_lens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_lighting`
--

DROP TABLE IF EXISTS `products_lighting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_lighting` (
  `baseindierentalproduct_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`baseindierentalproduct_ptr_id`),
  CONSTRAINT `baseindierentalproduct_ptr_id_refs_product_ptr_id_45749ad8` FOREIGN KEY (`baseindierentalproduct_ptr_id`) REFERENCES `products_baseindierentalproduct` (`product_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_lighting`
--

LOCK TABLES `products_lighting` WRITE;
/*!40000 ALTER TABLE `products_lighting` DISABLE KEYS */;
INSERT INTO `products_lighting` VALUES (19),(20),(21),(22);
/*!40000 ALTER TABLE `products_lighting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_price_tier`
--

DROP TABLE IF EXISTS `products_price_tier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_price_tier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_day` int(11) NOT NULL,
  `end_day` int(11) NOT NULL,
  `percent` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_price_tier`
--

LOCK TABLES `products_price_tier` WRITE;
/*!40000 ALTER TABLE `products_price_tier` DISABLE KEYS */;
INSERT INTO `products_price_tier` VALUES (1,1,3,100),(2,3,7,90),(3,7,10,80),(4,10,14,75),(5,1,2,100),(6,2,3,50),(7,3,4,95);
/*!40000 ALTER TABLE `products_price_tier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_price_tier_package`
--

DROP TABLE IF EXISTS `products_price_tier_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_price_tier_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_price_tier_package`
--

LOCK TABLES `products_price_tier_package` WRITE;
/*!40000 ALTER TABLE `products_price_tier_package` DISABLE KEYS */;
INSERT INTO `products_price_tier_package` VALUES (1,'Lensing Day Rate Package'),(3,'Video Camera Rental Rate'),(4,'Crazy Stupid Deal'),(5,'Full Price Always');
/*!40000 ALTER TABLE `products_price_tier_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_price_tier_package_tier`
--

DROP TABLE IF EXISTS `products_price_tier_package_tier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_price_tier_package_tier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price_tier_package_id` int(11) NOT NULL,
  `price_tier_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `price_tier_package_id` (`price_tier_package_id`,`price_tier_id`),
  KEY `products_price_tier_package_tier_7c2ed60b` (`price_tier_package_id`),
  KEY `products_price_tier_package_tier_75f94198` (`price_tier_id`),
  CONSTRAINT `price_tier_id_refs_id_34757a1a` FOREIGN KEY (`price_tier_id`) REFERENCES `products_price_tier` (`id`),
  CONSTRAINT `price_tier_package_id_refs_id_594ce4ed` FOREIGN KEY (`price_tier_package_id`) REFERENCES `products_price_tier_package` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_price_tier_package_tier`
--

LOCK TABLES `products_price_tier_package_tier` WRITE;
/*!40000 ALTER TABLE `products_price_tier_package_tier` DISABLE KEYS */;
INSERT INTO `products_price_tier_package_tier` VALUES (3,1,1),(4,1,2),(5,1,3),(6,1,4),(7,3,1),(8,3,2),(9,3,3),(10,3,4),(11,4,5),(12,4,6),(13,4,7),(14,5,1);
/*!40000 ALTER TABLE `products_price_tier_package_tier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_cart`
--

DROP TABLE IF EXISTS `shop_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_id_refs_id_2c132858` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_cart`
--

LOCK TABLES `shop_cart` WRITE;
/*!40000 ALTER TABLE `shop_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_cartitem`
--

DROP TABLE IF EXISTS `shop_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_cartitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_cartitem_129fc6a` (`cart_id`),
  KEY `shop_cartitem_44bdf3ee` (`product_id`),
  CONSTRAINT `cart_id_refs_id_71757dfe` FOREIGN KEY (`cart_id`) REFERENCES `shop_cart` (`id`),
  CONSTRAINT `product_id_refs_id_7a51cb6` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_cartitem`
--

LOCK TABLES `shop_cartitem` WRITE;
/*!40000 ALTER TABLE `shop_cartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_extraorderitempricefield`
--

DROP TABLE IF EXISTS `shop_extraorderitempricefield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_extraorderitempricefield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_item_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `value` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_extraorderitempricefield_34e005d0` (`order_item_id`),
  CONSTRAINT `order_item_id_refs_id_13a0d22d` FOREIGN KEY (`order_item_id`) REFERENCES `shop_orderitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_extraorderitempricefield`
--

LOCK TABLES `shop_extraorderitempricefield` WRITE;
/*!40000 ALTER TABLE `shop_extraorderitempricefield` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_extraorderitempricefield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_extraorderpricefield`
--

DROP TABLE IF EXISTS `shop_extraorderpricefield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_extraorderpricefield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `value` decimal(12,2) NOT NULL,
  `is_shipping` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_extraorderpricefield_7cc8fcf5` (`order_id`),
  CONSTRAINT `order_id_refs_id_6f2bd4e7` FOREIGN KEY (`order_id`) REFERENCES `shop_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_extraorderpricefield`
--

LOCK TABLES `shop_extraorderpricefield` WRITE;
/*!40000 ALTER TABLE `shop_extraorderpricefield` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_extraorderpricefield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_order`
--

DROP TABLE IF EXISTS `shop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `order_subtotal` decimal(12,2) NOT NULL,
  `order_total` decimal(12,2) NOT NULL,
  `shipping_address_text` longtext,
  `billing_address_text` longtext,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_order_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_3696942d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_order`
--

LOCK TABLES `shop_order` WRITE;
/*!40000 ALTER TABLE `shop_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_orderextrainfo`
--

DROP TABLE IF EXISTS `shop_orderextrainfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_orderextrainfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_orderextrainfo_7cc8fcf5` (`order_id`),
  CONSTRAINT `order_id_refs_id_2b37d9f4` FOREIGN KEY (`order_id`) REFERENCES `shop_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_orderextrainfo`
--

LOCK TABLES `shop_orderextrainfo` WRITE;
/*!40000 ALTER TABLE `shop_orderextrainfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_orderextrainfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_orderitem`
--

DROP TABLE IF EXISTS `shop_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_reference` varchar(255) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `line_subtotal` decimal(12,2) NOT NULL,
  `line_total` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_orderitem_7cc8fcf5` (`order_id`),
  KEY `shop_orderitem_44bdf3ee` (`product_id`),
  CONSTRAINT `order_id_refs_id_2b1d437c` FOREIGN KEY (`order_id`) REFERENCES `shop_order` (`id`),
  CONSTRAINT `product_id_refs_id_97ce195` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_orderitem`
--

LOCK TABLES `shop_orderitem` WRITE;
/*!40000 ALTER TABLE `shop_orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_orderpayment`
--

DROP TABLE IF EXISTS `shop_orderpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_orderpayment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_orderpayment_7cc8fcf5` (`order_id`),
  CONSTRAINT `order_id_refs_id_792c8a16` FOREIGN KEY (`order_id`) REFERENCES `shop_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_orderpayment`
--

LOCK TABLES `shop_orderpayment` WRITE;
/*!40000 ALTER TABLE `shop_orderpayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_orderpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product`
--

DROP TABLE IF EXISTS `shop_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `polymorphic_ctype_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `shop_product_689fbb87` (`polymorphic_ctype_id`),
  CONSTRAINT `polymorphic_ctype_id_refs_id_726e4b78` FOREIGN KEY (`polymorphic_ctype_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product`
--

LOCK TABLES `shop_product` WRITE;
/*!40000 ALTER TABLE `shop_product` DISABLE KEYS */;
INSERT INTO `shop_product` VALUES (1,13,'Angenieux Optimo DP 16-42mm','angenieux-optimo-dp-16-42mm',1,'2012-07-17 18:16:37','2012-07-17 19:20:14',300.00),(2,13,'Angenieux Optimo DP 30-80mm','angenieux-optimo-dp-30-80mm',1,'2012-07-17 18:18:44','2012-07-17 19:20:19',300.00),(3,13,'Zeiss CP.2 Lens Set','zeiss-cp2-lens-set',1,'2012-07-17 18:25:52','2012-07-17 19:30:36',325.00),(4,14,'Panasonic HMC150','panasonic-hmc150',1,'2012-07-17 19:00:30','2012-07-17 19:19:58',100.00),(5,14,'Panasonic HMC160','panasonic-hmc160',1,'2012-07-17 19:19:35','2012-07-17 19:19:51',200.00),(6,14,'Canon 7D','canon-7d',0,'2012-07-17 19:24:52','2012-07-17 19:30:53',125.00),(7,14,'Canon C300','canon-c300',0,'2012-07-17 19:26:38','2012-07-17 19:31:05',550.00),(8,13,'Canon 24-70 F/2.8 IS USM','canon-24-70-f28-usm',0,'2012-07-17 19:27:42','2012-07-17 19:27:42',75.00),(9,13,'Canon 16-35 F/2.8 L II USM','canon-16-35-f28-l-ii-usm',0,'2012-07-17 19:39:35','2012-07-17 19:39:35',75.00),(10,13,'Canon 17-85mm F/4-5.6 IS USM','canon-17-85mm-f4-56-usm',0,'2012-07-17 19:40:33','2012-07-17 19:40:33',25.00),(11,13,'Canon 24-105 F/4 USM','canon-24-105-f4-usm',0,'2012-07-17 19:41:34','2012-07-17 19:41:34',25.00),(13,13,'Canon 70-200mm F/2.8 IS II','canon-70-200mm-f28-ii',0,'2012-07-17 19:43:09','2012-07-17 19:43:09',75.00),(14,13,'Nikon to Canon Mount Adapter','nikon-canon-mount-adapter',0,'2012-07-17 19:47:20','2012-07-17 19:49:52',25.00),(15,13,'Zeiss ZF Prime Lens Set','zeiss-zf-prime-lens-set',0,'2012-07-17 19:51:12','2012-07-17 19:51:31',250.00),(16,13,'Zeiss ZF.2 Prime Lens Set','zeiss-zf2-prime-lens-set',0,'2012-07-17 19:52:58','2012-07-17 19:52:58',300.00),(17,13,'Canon 5D Mark II','canon-5d-mark-ii',0,'2012-07-17 19:57:50','2012-07-17 19:57:50',150.00),(18,14,'Sony EX1R XDCAM EX','sony-ex1r-xdcam-ex',0,'2012-07-17 19:58:35','2012-07-17 19:58:35',350.00),(19,15,'Dedolight','dedolight',0,'2012-07-17 20:02:01','2012-07-17 20:02:07',45.00),(20,15,'Kino Flo Kamio 6E System','kino-flo-kamio-6e-system',0,'2012-07-17 20:02:35','2012-07-17 20:02:35',75.00),(21,15,'Reflecmedia LiteRing','reflecmedia-litering',0,'2012-07-17 20:03:09','2012-07-17 20:03:09',75.00),(22,15,'Sun Gun (Anton Bauer)','sun-gun-anton-bauer',0,'2012-07-17 20:03:53','2012-07-17 20:03:53',25.00),(23,14,'Sony HVR-Z7U HDV','sony-hvr-z7u-hdv',0,'2012-07-17 20:09:07','2012-07-17 20:09:07',300.00),(24,14,'Sony EX-3 XDCam','sony-ex-3-xdcam',0,'2012-07-17 20:10:15','2012-07-17 20:10:15',350.00),(25,14,'Sony FS-100 Shoot Packages','sony-fs-100-shoot-packages',0,'2012-07-17 20:12:04','2012-07-17 20:12:04',225.00),(26,14,'Sony FS-700','sony-fs-700',1,'2012-07-17 20:13:07','2012-07-17 20:13:07',350.00),(27,14,'RED Scarlet Body Package','red-scarlet-body-package',0,'2012-07-17 20:14:56','2012-07-17 20:14:56',450.00);
/*!40000 ALTER TABLE `shop_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'products','0001_initial','2012-05-03 11:30:33'),(2,'djcelery','0001_initial','2012-05-03 11:30:46'),(3,'djcelery','0002_v25_changes','2012-05-03 11:30:46'),(4,'addressmodel','0001_initial','2012-05-03 11:30:46'),(5,'addressmodel','0002_auto__add_field_address_name','2012-05-03 11:30:46'),(6,'ipn','0001_first_migration','2012-05-03 11:30:47');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-07-21 12:23:47
