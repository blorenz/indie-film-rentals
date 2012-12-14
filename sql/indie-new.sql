-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: indie
-- ------------------------------------------------------
-- Server version	5.5.24-7

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add migration history',8,'add_migrationhistory'),(23,'Can change migration history',8,'change_migrationhistory'),(24,'Can delete migration history',8,'delete_migrationhistory'),(25,'Can add link',9,'add_link'),(26,'Can change link',9,'change_link'),(27,'Can delete link',9,'delete_link'),(28,'Can add Price Tier',10,'add_price_tier'),(29,'Can change Price Tier',10,'change_price_tier'),(30,'Can delete Price Tier',10,'delete_price_tier'),(31,'Can add Price Tier Package',11,'add_price_tier_package'),(32,'Can change Price Tier Package',11,'change_price_tier_package'),(33,'Can delete Price Tier Package',11,'delete_price_tier_package'),(34,'Can add base indie rental product',12,'add_baseindierentalproduct'),(35,'Can change base indie rental product',12,'change_baseindierentalproduct'),(36,'Can delete base indie rental product',12,'delete_baseindierentalproduct'),(37,'Can add lens',13,'add_lens'),(38,'Can change lens',13,'change_lens'),(39,'Can delete lens',13,'delete_lens'),(40,'Can add camera',14,'add_camera'),(41,'Can change camera',14,'change_camera'),(42,'Can delete camera',14,'delete_camera'),(43,'Can add lighting',15,'add_lighting'),(44,'Can change lighting',15,'change_lighting'),(45,'Can delete lighting',15,'delete_lighting'),(46,'Can add Cart',16,'add_cart'),(47,'Can change Cart',16,'change_cart'),(48,'Can delete Cart',16,'delete_cart'),(49,'Can add Cart item',17,'add_cartitem'),(50,'Can change Cart item',17,'change_cartitem'),(51,'Can delete Cart item',17,'delete_cartitem'),(52,'Can add Product',18,'add_product'),(53,'Can change Product',18,'change_product'),(54,'Can delete Product',18,'delete_product'),(55,'Can add Order',19,'add_order'),(56,'Can change Order',19,'change_order'),(57,'Can delete Order',19,'delete_order'),(58,'Can add Order item',20,'add_orderitem'),(59,'Can change Order item',20,'change_orderitem'),(60,'Can delete Order item',20,'delete_orderitem'),(61,'Can add Order extra info',21,'add_orderextrainfo'),(62,'Can change Order extra info',21,'change_orderextrainfo'),(63,'Can delete Order extra info',21,'delete_orderextrainfo'),(64,'Can add Extra order price field',22,'add_extraorderpricefield'),(65,'Can change Extra order price field',22,'change_extraorderpricefield'),(66,'Can delete Extra order price field',22,'delete_extraorderpricefield'),(67,'Can add Extra order item price field',23,'add_extraorderitempricefield'),(68,'Can change Extra order item price field',23,'change_extraorderitempricefield'),(69,'Can delete Extra order item price field',23,'delete_extraorderitempricefield'),(70,'Can add Order payment',24,'add_orderpayment'),(71,'Can change Order payment',24,'change_orderpayment'),(72,'Can delete Order payment',24,'delete_orderpayment'),(73,'Can add task meta',25,'add_taskmeta'),(74,'Can change task meta',25,'change_taskmeta'),(75,'Can delete task meta',25,'delete_taskmeta'),(76,'Can add taskset meta',26,'add_tasksetmeta'),(77,'Can change taskset meta',26,'change_tasksetmeta'),(78,'Can delete taskset meta',26,'delete_tasksetmeta'),(79,'Can add interval',27,'add_intervalschedule'),(80,'Can change interval',27,'change_intervalschedule'),(81,'Can delete interval',27,'delete_intervalschedule'),(82,'Can add crontab',28,'add_crontabschedule'),(83,'Can change crontab',28,'change_crontabschedule'),(84,'Can delete crontab',28,'delete_crontabschedule'),(85,'Can add periodic tasks',29,'add_periodictasks'),(86,'Can change periodic tasks',29,'change_periodictasks'),(87,'Can delete periodic tasks',29,'delete_periodictasks'),(88,'Can add periodic task',30,'add_periodictask'),(89,'Can change periodic task',30,'change_periodictask'),(90,'Can delete periodic task',30,'delete_periodictask'),(91,'Can add worker',31,'add_workerstate'),(92,'Can change worker',31,'change_workerstate'),(93,'Can delete worker',31,'delete_workerstate'),(94,'Can add task',32,'add_taskstate'),(95,'Can change task',32,'change_taskstate'),(96,'Can delete task',32,'delete_taskstate'),(97,'Can add Country',33,'add_country'),(98,'Can change Country',33,'change_country'),(99,'Can delete Country',33,'delete_country'),(100,'Can add Address',34,'add_address'),(101,'Can change Address',34,'change_address'),(102,'Can delete Address',34,'delete_address'),(103,'Can add PayPal IPN',35,'add_paypalipn'),(104,'Can change PayPal IPN',35,'change_paypalipn'),(105,'Can delete PayPal IPN',35,'delete_paypalipn'),(106,'Can add brand',36,'add_brand'),(107,'Can change brand',36,'change_brand'),(108,'Can delete brand',36,'delete_brand'),(109,'Can add product image',37,'add_productimage'),(110,'Can change product image',37,'change_productimage'),(111,'Can delete product image',37,'delete_productimage'),(112,'Can add category',38,'add_category'),(113,'Can change category',38,'change_category'),(114,'Can delete category',38,'delete_category'),(115,'Can add audio',39,'add_audio'),(116,'Can change audio',39,'change_audio'),(117,'Can delete audio',39,'delete_audio'),(118,'Can add monitor',40,'add_monitor'),(119,'Can change monitor',40,'change_monitor'),(120,'Can delete monitor',40,'delete_monitor'),(121,'Can add support',41,'add_support'),(122,'Can change support',41,'change_support'),(123,'Can delete support',41,'delete_support'),(124,'Can add accessory',42,'add_accessory'),(125,'Can change accessory',42,'change_accessory'),(126,'Can delete accessory',42,'delete_accessory'),(127,'Can add registration profile',43,'add_registrationprofile'),(128,'Can change registration profile',43,'change_registrationprofile'),(129,'Can delete registration profile',43,'delete_registrationprofile'),(130,'Can add csv import',44,'add_csvimport'),(131,'Can change csv import',44,'change_csvimport'),(132,'Can delete csv import',44,'delete_csvimport'),(133,'Can add import model',45,'add_importmodel'),(134,'Can change import model',45,'change_importmodel'),(135,'Can delete import model',45,'delete_importmodel');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'admin','','','dsafda@fdsfa.com','bcrypt$$2a$12$R/cYQzLYShDWFQ7lELNW0uUqgab3ZUVXKUEqlZP58mSgqVyf5gr0O',1,1,1,'2012-08-14 23:13:10','2012-05-03 11:30:18'),(2,'david.test.1','David','Test','david@ohiohdvideo.com','bcrypt$$2a$12$N5A59muJ8d/Hfprg.Z4Lne5NHsvsBybhJUW.NBQwlkja8U2Ak7w6K',0,1,0,'2012-07-17 22:13:24','2012-07-17 22:13:25'),(3,'brandon','','','blorenz@gmail.com','bcrypt$$2a$12$mq0xrkeM/4K9xTJ1roXF9eGLroHk4s.D5exsLT9dItr0cD3NBlzJO',1,1,1,'2012-12-09 17:46:48','2012-12-09 17:46:38');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_tasksetmeta`
--

LOCK TABLES `celery_tasksetmeta` WRITE;
/*!40000 ALTER TABLE `celery_tasksetmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_tasksetmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvimport_csvimport`
--

DROP TABLE IF EXISTS `csvimport_csvimport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvimport_csvimport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_name` varchar(255) NOT NULL,
  `field_list` varchar(255) NOT NULL,
  `upload_file` varchar(100) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `encoding` varchar(32) NOT NULL,
  `upload_method` varchar(50) NOT NULL,
  `error_log` longtext NOT NULL,
  `import_date` date NOT NULL,
  `import_user` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvimport_csvimport`
--

LOCK TABLES `csvimport_csvimport` WRITE;
/*!40000 ALTER TABLE `csvimport_csvimport` DISABLE KEYS */;
INSERT INTO `csvimport_csvimport` VALUES (2,'products.Camera','','csv/ifr_cameras_1.csv','csv/ifr_cameras_1.csv','','manual','Using mapping from first row of CSV file\nException found... Column \'date_added\' cannot be null Instance 1 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 2 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 3 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 4 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 5 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 6 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 7 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 8 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 9 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 10 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 11 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 12 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 13 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 14 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 15 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 16 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 17 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 18 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 19 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 20 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 21 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 22 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 23 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 24 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 25 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 26 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 27 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 28 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 29 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 30 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 31 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 32 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 33 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 34 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 35 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 36 not saved.','2012-12-09','brandon');
/*!40000 ALTER TABLE `csvimport_csvimport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvimport_importmodel`
--

DROP TABLE IF EXISTS `csvimport_importmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvimport_importmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `csvimport_id` int(11) NOT NULL,
  `numeric_id` int(10) unsigned NOT NULL,
  `natural_key` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `csvimport_importmodel_fe08e486` (`csvimport_id`),
  CONSTRAINT `csvimport_id_refs_id_8d3261cc` FOREIGN KEY (`csvimport_id`) REFERENCES `csvimport_csvimport` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvimport_importmodel`
--

LOCK TABLES `csvimport_importmodel` WRITE;
/*!40000 ALTER TABLE `csvimport_importmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvimport_importmodel` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2012-05-23 02:02:48',1,9,'1','Link object',1,''),(2,'2012-06-28 13:36:04',1,10,'1','Days: 1 - 4 : 100.0%',1,''),(3,'2012-07-17 18:15:41',1,11,'1','Tier Package: Day Rate 1-4',1,''),(4,'2012-07-17 18:16:02',1,11,'2','Tier Package: Teir 1',1,''),(5,'2012-07-17 18:16:37',1,13,'1','Angenieux Optimo DP 16-42',1,''),(6,'2012-07-17 18:17:45',1,13,'1','Angenieux Optimo DP 16-42',2,'Changed description.'),(7,'2012-07-17 18:18:44',1,13,'2','Angenieux Optimo DP 30-80mm',1,''),(8,'2012-07-17 18:18:53',1,13,'1','Angenieux Optimo DP 16-42',2,'Changed status.'),(9,'2012-07-17 18:19:18',1,11,'2','Tier Package: Teir 1',3,''),(10,'2012-07-17 18:19:59',1,10,'1','Days: 1 - 3 : 100.0%',2,'Changed end_day.'),(11,'2012-07-17 18:20:21',1,10,'2','Days: 3 - 7 : 90.0%',1,''),(12,'2012-07-17 18:20:34',1,10,'3','Days: 7 - 10 : 80.0%',1,''),(13,'2012-07-17 18:21:04',1,10,'4','Days: 10 - 14 : 75.0%',1,''),(14,'2012-07-17 18:22:10',1,11,'1','Tier Package: Lensing Day Rate Package',2,'Changed tier and name.'),(15,'2012-07-17 18:22:39',1,13,'1','Angenieux Optimo DP 16-42,,',2,'Changed name.'),(16,'2012-07-17 18:22:44',1,13,'1','Angenieux Optimo DP 16-42mm',2,'Changed name.'),(17,'2012-07-17 18:22:48',1,13,'1','Angenieux Optimo DP 16-42mm',2,'Changed slug.'),(18,'2012-07-17 18:24:47',1,13,'2','Angenieux Optimo DP 30-80mm',2,'Changed description and crossSell.'),(19,'2012-07-17 18:25:52',1,13,'3','Zeiss CP.2 Lens Set',1,''),(20,'2012-07-17 18:27:53',1,11,'3','Tier Package: Video Camera Rental Rate',1,''),(21,'2012-07-17 19:00:30',1,14,'4','Panasonic HMC150',1,''),(22,'2012-07-17 19:00:37',1,14,'4','Panasonic HMC150',2,'Changed description and price_tier.'),(23,'2012-07-17 19:12:00',1,3,'2','david.test.1',1,''),(24,'2012-07-17 19:13:59',1,3,'2','david.test.1',2,'Changed password, first_name, last_name, email, user_permissions, last_login and date_joined.'),(25,'2012-07-17 19:18:49',1,10,'5','Days: 1 - 2 : 100.0%',1,''),(26,'2012-07-17 19:18:59',1,10,'6','Days: 2 - 3 : 50.0%',1,''),(27,'2012-07-17 19:19:10',1,10,'7','Days: 3 - 4 : 95.0%',1,''),(28,'2012-07-17 19:19:26',1,11,'4','Tier Package: Crazy Stupid Deal',1,''),(29,'2012-07-17 19:19:35',1,14,'5','Panasonic HMC160',1,''),(30,'2012-07-17 19:19:51',1,14,'5','Panasonic HMC160',2,'Changed active and price_tier.'),(31,'2012-07-17 19:19:58',1,14,'4','Panasonic HMC150',2,'Changed active.'),(32,'2012-07-17 19:20:14',1,13,'1','Angenieux Optimo DP 16-42mm',2,'Changed active.'),(33,'2012-07-17 19:20:19',1,13,'2','Angenieux Optimo DP 30-80mm',2,'Changed active.'),(34,'2012-07-17 19:20:25',1,13,'3','Zeiss CP.2 Lens Set',2,'Changed active.'),(35,'2012-07-17 19:24:52',1,14,'6','Canon 7D',1,''),(36,'2012-07-17 19:26:38',1,14,'7','Canon C300',1,''),(37,'2012-07-17 19:27:42',1,13,'8','Canon 24-70 F/2.8 IS USM',1,''),(38,'2012-07-17 19:30:36',1,13,'3','Zeiss CP.2 Lens Set',2,'No fields changed.'),(39,'2012-07-17 19:30:53',1,14,'6','Canon 7D',2,'Changed crossSell.'),(40,'2012-07-17 19:31:05',1,14,'7','Canon C300',2,'Changed crossSell.'),(41,'2012-07-17 19:39:35',1,13,'9','Canon 16-35 F/2.8 L II USM',1,''),(42,'2012-07-17 19:40:33',1,13,'10','Canon 17-85mm F/4-5.6 IS USM',1,''),(43,'2012-07-17 19:41:34',1,13,'11','Canon 24-105 F/4 USM',1,''),(44,'2012-07-17 19:43:09',1,13,'13','Canon 70-200mm F/2.8 IS II',1,''),(45,'2012-07-17 19:47:20',1,13,'14','Nikon to Canon Mount Adapter',1,''),(46,'2012-07-17 19:49:53',1,13,'14','Nikon to Canon Mount Adapter',2,'Changed unit_price and description.'),(47,'2012-07-17 19:51:12',1,13,'15','Zeiss ZF ',1,''),(48,'2012-07-17 19:51:24',1,13,'15','Zeiss ZF Prime Lens Set',2,'Changed name.'),(49,'2012-07-17 19:51:31',1,13,'15','Zeiss ZF Prime Lens Set',2,'Changed slug.'),(50,'2012-07-17 19:52:58',1,13,'16','Zeiss ZF.2 Prime Lens Set',1,''),(51,'2012-07-17 19:57:50',1,13,'17','Canon 5D Mark II',1,''),(52,'2012-07-17 19:58:35',1,14,'18','Sony EX1R XDCAM EX',1,''),(53,'2012-07-17 20:01:54',1,11,'5','Tier Package: Full Price Always',1,''),(54,'2012-07-17 20:02:01',1,15,'19','Dedolight',1,''),(55,'2012-07-17 20:02:08',1,15,'19','Dedolight',2,'Changed price_tier.'),(56,'2012-07-17 20:02:35',1,15,'20','Kino Flo Kamio 6E System',1,''),(57,'2012-07-17 20:03:09',1,15,'21','Reflecmedia LiteRing',1,''),(58,'2012-07-17 20:03:53',1,15,'22','Sun Gun (Anton Bauer)',1,''),(59,'2012-07-17 20:09:07',1,14,'23','Sony HVR-Z7U HDV',1,''),(60,'2012-07-17 20:10:15',1,14,'24','Sony EX-3 XDCam',1,''),(61,'2012-07-17 20:12:04',1,14,'25','Sony FS-100 Shoot Packages',1,''),(62,'2012-07-17 20:13:07',1,14,'26','Sony FS-700',1,''),(63,'2012-07-17 20:14:56',1,14,'27','RED Scarlet Body Package',1,''),(64,'2012-07-21 16:59:51',1,36,'1','Sony',1,''),(65,'2012-07-21 17:45:37',1,38,'1','cameras',1,''),(66,'2012-07-21 17:45:49',1,38,'2','Lighting',1,''),(67,'2012-07-21 17:47:30',1,38,'3','Lenses',1,''),(68,'2012-07-21 17:47:37',1,38,'1','Cameras',2,'Changed name.'),(69,'2012-07-21 17:47:49',1,38,'1','Cameras',2,'No fields changed.'),(70,'2012-07-21 17:51:39',1,14,'6','Canon 7D',2,'Changed categories.'),(71,'2012-07-21 17:52:22',1,38,'1','Cameras',2,'Changed products.'),(72,'2012-07-21 17:52:53',1,38,'1','Cameras',2,'Changed products.'),(73,'2012-07-23 16:36:33',1,14,'7','Canon C300',2,'Changed crossSell.'),(74,'2012-07-25 23:04:26',1,15,'19','Dedolight',2,'Changed categories.'),(75,'2012-07-25 23:11:50',1,15,'20','Kino Flo Kamio 6E System',2,'Changed categories.'),(76,'2012-07-25 23:42:42',1,15,'21','Reflecmedia LiteRing',2,'Changed categories.'),(77,'2012-07-25 23:42:54',1,15,'22','Sun Gun (Anton Bauer)',2,'Changed categories.'),(78,'2012-08-09 15:12:28',1,14,'4','Panasonic HMC150',2,'Changed description and categories. Added product image \"ProductImage object\".'),(79,'2012-08-09 15:15:01',1,36,'2','Panasonic',1,''),(80,'2012-08-09 15:15:31',1,14,'4','Panasonic HMC150',2,'Changed brand and categories.'),(81,'2012-08-09 15:20:50',1,14,'4','Panasonic HMC150',2,'Changed description and categories.'),(82,'2012-08-09 15:23:30',1,14,'5','Panasonic HMC160',2,'Changed description, status, price_tier and categories. Added product image \"ProductImage object\".'),(83,'2012-08-09 15:24:16',1,14,'5','Panasonic HMC160',2,'Changed active and categories.'),(84,'2012-08-09 15:25:24',1,14,'5','Panasonic HMC160',2,'Changed status and categories.'),(85,'2012-08-09 15:29:40',1,14,'7','Canon C300',2,'Changed categories. Added product image \"ProductImage object\".'),(86,'2012-08-09 15:31:06',1,38,'4','Audio',1,''),(87,'2012-08-09 15:31:32',1,38,'5','Monitors',1,''),(88,'2012-08-09 15:31:36',1,38,'5','Monitors',2,'No fields changed.'),(89,'2012-08-09 15:39:27',1,38,'6','Support',1,''),(90,'2012-08-09 15:39:41',1,38,'7','Accessories',1,''),(91,'2012-08-09 15:39:56',1,38,'5','Monitors',2,'Changed parent_category.'),(92,'2012-08-09 16:06:33',1,38,'1','Cameras',2,'Changed products.'),(93,'2012-08-09 16:12:08',1,36,'3','Arri',1,''),(94,'2012-08-09 18:28:29',1,14,'18','Sony EX1R',2,'Changed name, slug, active and categories. Added product image \"ProductImage object\".'),(95,'2012-08-09 18:28:59',1,14,'5','Panasonic HMC160',2,'Changed active and categories.'),(96,'2012-08-09 18:30:55',1,14,'26','Sony FS-700',2,'Changed categories. Added product image \"ProductImage object\".'),(97,'2012-08-09 18:35:19',1,14,'25','Sony FS-100',2,'Changed name, slug, active, status and categories. Added product image \"ProductImage object\".'),(98,'2012-08-09 18:36:30',1,36,'4','Canon',1,''),(99,'2012-08-09 18:37:06',1,14,'6','Canon 7D',2,'Changed active, brand, description and categories. Added product image \"ProductImage object\".'),(100,'2012-08-09 18:38:21',1,14,'7','Canon C300',2,'Changed active, brand, description and categories.'),(101,'2012-08-09 18:39:02',1,36,'4','Canon',2,'No fields changed.'),(102,'2012-08-09 18:39:23',1,38,'1','Cameras',2,'No fields changed.'),(103,'2012-08-09 18:40:35',1,14,'5','Panasonic HMC160',2,'Changed brand and categories.'),(104,'2012-08-09 18:40:46',1,14,'6','Canon 7D',2,'Changed categories.'),(105,'2012-08-09 18:40:56',1,14,'7','Canon C300',2,'Changed categories.'),(106,'2012-08-09 18:41:34',1,13,'17','Canon 5D Mark II',3,''),(107,'2012-08-09 18:41:53',1,14,'18','Sony EX1R',2,'Changed categories.'),(108,'2012-08-09 18:44:01',1,14,'23','Sony HVR-Z7U',2,'Changed name, slug, active, description, status and categories. Added product image \"ProductImage object\".'),(109,'2012-08-09 18:46:39',1,14,'24','Sony EX-3',2,'Changed name, slug, active, status and categories. Added product image \"ProductImage object\".'),(110,'2012-08-09 18:50:27',1,14,'25','Sony FS-100',2,'Changed categories.'),(111,'2012-08-09 18:51:59',1,36,'5','Red',1,''),(112,'2012-08-09 18:53:01',1,14,'27','RED Scarlet',2,'Changed name, slug, active, brand and categories. Added product image \"ProductImage object\".'),(113,'2012-08-09 18:55:18',1,14,'28','Canon 5D Mark II',1,''),(114,'2012-08-09 19:01:31',1,14,'28','Canon 5D Mark II',2,'No fields changed.'),(115,'2012-08-09 19:05:15',1,14,'28','Canon 5D Mark II',2,'Changed categories.'),(116,'2012-08-09 19:14:13',1,14,'29','Red Epic',1,''),(117,'2012-08-09 19:15:28',1,14,'29','Red Epic',2,'Changed categories.'),(118,'2012-08-09 19:25:56',1,36,'6','Arri',1,''),(119,'2012-08-09 19:39:43',1,14,'30','Arri Alexa',1,''),(120,'2012-08-09 19:48:22',1,11,'3','Tier Package: Video Camera Standard Rate',2,'Changed name.'),(121,'2012-08-09 19:48:54',1,10,'1','Days: 1 - 3 : 100.0%',2,'No fields changed.'),(122,'2012-08-09 19:49:14',1,10,'2','Days: 3 - 7 : 43.0%',2,'Changed percent.'),(123,'2012-08-09 20:03:17',1,10,'2','Days: 3 - 7 : 43.0%',2,'No fields changed.'),(124,'2012-08-09 20:04:07',1,11,'3','Tier Package: Video Camera Standard Rate',2,'Changed tier.'),(125,'2012-08-09 20:05:23',1,14,'4','Panasonic HMC150',2,'Changed categories.'),(126,'2012-08-09 20:17:15',1,14,'31','Sony F3',1,''),(127,'2012-08-09 20:27:37',1,14,'31','Sony F3',2,'Changed categories.'),(128,'2012-08-09 20:27:48',1,14,'30','Arri Alexa',2,'Changed categories.'),(129,'2012-08-09 20:29:46',1,36,'7','GoPro',1,''),(130,'2012-08-09 20:30:41',1,14,'32','(2) GoPro Hero Package',1,''),(131,'2012-08-09 20:33:01',1,14,'32','(2) GoPro Hero Package',2,'Changed description and categories.'),(132,'2012-08-09 20:40:27',1,14,'33','Panasonic HDX-900',1,''),(133,'2012-08-09 20:41:13',1,14,'33','Panasonic HDX-900',2,'Changed categories.'),(134,'2012-08-09 20:46:16',1,14,'34','Sony F800',1,''),(135,'2012-08-09 20:49:04',1,14,'35','Panasonic SDX-900',1,''),(136,'2012-08-09 20:49:26',1,14,'35','Panasonic SDX-900',2,'Changed categories.'),(137,'2012-08-09 20:49:40',1,14,'34','Sony F800',2,'Changed categories.'),(138,'2012-08-09 20:49:50',1,14,'33','Panasonic HDX-900',2,'Changed categories.'),(139,'2012-08-09 20:51:19',1,14,'36','Panasonic HPX-500',1,''),(140,'2012-08-09 20:55:03',1,14,'37','Panasonic Varicam HPX-2700',1,''),(141,'2012-08-09 20:56:16',1,14,'37','Panasonic Varicam HPX-2700',2,'Changed categories.'),(142,'2012-08-09 20:56:49',1,14,'36','Panasonic HPX-500',2,'Changed categories.'),(143,'2012-08-09 20:58:48',1,14,'38','Time-Lapse Package',1,''),(144,'2012-08-09 21:01:33',1,14,'38','Time-Lapse Package',2,'Changed categories.'),(145,'2012-08-09 21:02:10',1,36,'8','Other',1,''),(146,'2012-08-09 21:03:13',1,14,'39','Lytro Light Field Camera',1,''),(147,'2012-08-10 13:32:05',1,14,'40','Red One MX',1,''),(148,'2012-08-10 13:32:18',1,14,'40','Red One MX',2,'Changed categories.'),(149,'2012-08-10 13:36:50',1,14,'41','Panasonic AF-100',1,''),(150,'2012-08-10 13:37:56',1,14,'41','Panasonic AF-100',2,'Changed categories.'),(151,'2012-08-10 13:42:25',1,36,'9','Nikon',1,''),(152,'2012-08-10 13:45:17',1,13,'42','Nikon 200mm F2 (PL)',1,''),(153,'2012-08-10 13:45:48',1,13,'42','Nikon 200mm F2 (PL)',2,'Changed categories.'),(154,'2012-08-10 14:03:37',1,36,'10','Schneider',1,''),(155,'2012-08-10 14:04:36',1,13,'43','Schneider 35mm 2x Extender (PL)',1,''),(156,'2012-08-10 14:06:39',1,36,'11','Zeiss',1,''),(157,'2012-08-10 14:07:08',1,13,'44','Zeiss Standard Speed',1,''),(158,'2012-08-10 14:07:19',1,13,'44','Zeiss Standard Speed',2,'Changed categories.'),(159,'2012-08-10 14:07:28',1,13,'43','Schneider 35mm 2x Extender (PL)',2,'Changed categories.'),(160,'2012-08-10 14:07:48',1,13,'44','Zeiss Standard Speed (PL)',2,'Changed name, slug and categories.'),(161,'2012-08-10 14:11:31',1,13,'45','Zeiss Super Speeds (PL)',1,''),(162,'2012-08-10 14:11:48',1,13,'45','Zeiss Super Speeds (PL)',2,'Changed categories.'),(163,'2012-08-10 14:15:13',1,36,'12','Angenieux',1,''),(164,'2012-08-10 14:18:16',1,13,'46','Angenieux 25-250mm (PL)',1,''),(165,'2012-08-10 14:18:41',1,13,'46','Angenieux 25-250mm (PL)',2,'Changed categories.'),(166,'2012-08-10 14:24:47',1,13,'1','Angenieux Optimo DP 16-42mm',2,'Changed brand, description and categories. Added product image \"ProductImage object\".'),(167,'2012-08-10 14:25:38',1,13,'2','Angenieux Optimo DP 30-80mm',2,'Changed brand, description and categories. Added product image \"ProductImage object\".'),(168,'2012-08-10 14:29:42',1,13,'3','Zeiss CP.2 Lens Set',2,'Changed brand and categories.'),(169,'2012-08-10 14:32:25',1,13,'8','Canon 24-70 F/2.8 IS USM',2,'Changed active, brand and categories. Added product image \"ProductImage object\".'),(170,'2012-08-10 14:33:33',1,13,'3','Zeiss CP.2 Lens Set',2,'Changed description and categories. Added product image \"ProductImage object\".'),(171,'2012-08-10 14:34:08',1,13,'3','Zeiss CP.2 Lens Set (PL)',2,'Changed name, slug and categories.'),(172,'2012-08-10 14:35:58',1,13,'9','Canon 16-35 F/2.8 L II USM',2,'Changed active, brand, description and categories. Added product image \"ProductImage object\".'),(173,'2012-08-10 14:42:02',1,13,'10','Canon 17-85mm F/4-5.6 IS USM',2,'Changed active, description, crossSell and categories. Added product image \"ProductImage object\".'),(174,'2012-08-10 14:45:59',1,13,'11','Canon 24-105 F/4 USM',2,'Changed active, brand, description and categories. Added product image \"ProductImage object\".'),(175,'2012-08-10 14:46:12',1,13,'10','Canon 17-85mm F/4-5.6 IS USM',2,'Changed brand and categories.'),(176,'2012-08-10 14:47:50',1,13,'13','Canon 70-200mm F/2.8 IS II',2,'Changed active and categories. Added product image \"ProductImage object\".'),(177,'2012-08-10 14:48:49',1,13,'14','Nikon to Canon Mount Adapter',2,'Changed active, brand and categories.'),(178,'2012-08-10 14:49:23',1,13,'15','Zeiss ZF Prime Lens Set',2,'Changed active, brand and categories. Added product image \"ProductImage object\".'),(179,'2012-08-10 14:50:17',1,13,'16','Zeiss ZF.2 Prime Lens Set',2,'Changed active, brand, status and categories. Added product image \"ProductImage object\".'),(180,'2012-08-10 15:00:03',1,13,'47','Canon 30-300 (PL)',1,''),(181,'2012-08-10 15:00:46',1,13,'47','Canon 30-300 (PL)',2,'Changed status and categories. Added product image \"ProductImage object\".'),(182,'2012-08-10 15:09:33',1,13,'48','Duclos Tokina 11-16mm (PL)',1,''),(183,'2012-08-10 15:43:57',1,36,'13','Fujinon',1,''),(184,'2012-08-10 15:44:51',1,13,'49','Fujinon Cabrio 19-90 (PL)',1,''),(185,'2012-08-10 15:45:14',1,13,'49','Fujinon Cabrio 19-90 (PL)',2,'Changed categories.'),(186,'2012-08-10 15:47:13',1,13,'50','Canon 16x7.8 2/3\" HD',1,''),(187,'2012-08-10 15:47:50',1,13,'50','Canon 16x7.8 2/3\" HD',2,'Changed categories. Added product image \"ProductImage object\".'),(188,'2012-08-10 15:49:14',1,14,'51','Canon 11x4.7 2/3\" Zoom',1,''),(189,'2012-08-10 15:49:22',1,14,'51','Canon 11x4.7 2/3\" Zoom',2,'Changed categories.'),(190,'2012-08-10 15:49:44',1,14,'51','Canon 11x4.7 2/3\" Zoom',2,'Changed categories. Added product image \"ProductImage object\".'),(191,'2012-08-10 15:50:20',1,14,'51','Canon 11x4.7 2/3\" Zoom',3,''),(192,'2012-08-10 15:51:10',1,13,'52','Canon 11x4.7 2/3\" Zoom',1,''),(193,'2012-08-10 15:51:27',1,13,'52','Canon 11x4.7 2/3\" HD',2,'Changed name, slug and active.'),(194,'2012-08-10 16:24:35',1,13,'53','Fujinon 17X7.6 2/3\" HD',1,''),(195,'2012-08-10 16:25:08',1,13,'53','Fujinon 17X7.6 2/3\" HD',2,'Changed categories. Added product image \"ProductImage object\".'),(196,'2012-08-10 16:49:57',1,13,'54','Canon 9x5.2 2/3\" SD',1,''),(197,'2012-08-10 16:50:25',1,13,'54','Canon 9x5.2 2/3\" SD',2,'Changed categories.'),(198,'2012-08-10 16:51:58',1,13,'54','Canon 9x5.2 2/3\" SD',2,'Changed categories. Added product image \"ProductImage object\".'),(199,'2012-08-10 16:52:54',1,13,'52','Canon 11x4.7 2/3\" HD',2,'Changed categories.'),(200,'2012-08-10 16:54:13',1,13,'48','Duclos Tokina 11-16mm (PL)',2,'Changed categories.'),(201,'2012-08-10 17:02:00',1,13,'14','Nikon to Canon Mount Adapter',2,'Changed categories. Added product image \"ProductImage object\".'),(202,'2012-08-10 17:08:27',1,13,'55','HDx35 B4/PL Optical Adapter',1,''),(203,'2012-08-10 17:29:16',1,13,'55','HDx35 B4/PL Optical Adapter',2,'Changed categories. Added product image \"ProductImage object\".'),(204,'2012-08-10 17:31:37',1,13,'55','HDx35 B4/PL Optical Adapter',2,'Changed categories. Changed image for product image \"ProductImage object\".'),(205,'2012-08-10 17:35:29',1,13,'56','PL to EOS Adapter',1,''),(206,'2012-08-10 17:35:46',1,13,'56','PL to EOS Adapter',2,'Changed categories.'),(207,'2012-08-10 17:42:59',1,13,'57','PL to Micro 4/3\" Adapter',1,''),(208,'2012-08-10 17:43:09',1,13,'57','PL to Micro 4/3\" Adapter',2,'Changed categories.'),(209,'2012-08-10 18:01:34',1,13,'57','PL to Micro 4/3\" Adapter',2,'Changed categories. Added product image \"ProductImage object\".'),(210,'2012-08-10 18:08:14',1,13,'58','Nikon to Micro 4/3\" Adapter',1,''),(211,'2012-08-10 18:21:26',1,13,'59','EOS to Micro 4/3\" Adapter',1,''),(212,'2012-08-10 18:22:02',1,13,'59','EOS to Micro 4/3\" Adapter',2,'Changed categories. Added product image \"ProductImage object\".'),(213,'2012-08-10 18:26:52',1,13,'60','Nikon to E-Mount Adapter',1,''),(214,'2012-08-10 18:27:18',1,13,'60','Nikon to E-Mount Adapter',2,'Changed categories.'),(215,'2012-08-10 18:28:08',1,13,'60','Nikon to E-Mount Adapter',2,'Changed categories.'),(216,'2012-08-10 18:29:21',1,13,'61','EOS to E-Mount w/ Active Iris',1,''),(217,'2012-08-10 18:32:27',1,13,'61','EOS to E-Mount w/ Active Iris Adapter',2,'Changed name, slug, description and categories.'),(218,'2012-08-10 18:33:45',1,13,'61','EOS to E-Mount w/ Active Iris Adapter',2,'Changed categories. Added product image \"ProductImage object\".'),(219,'2012-08-10 18:41:30',1,13,'62','2/3\" Lens Adapter for Sony PMW-EX3 ',1,''),(220,'2012-08-10 18:41:53',1,13,'62','2/3\" Lens Adapter for Sony PMW-EX3 Adapter',2,'Changed name, slug and categories.'),(221,'2012-08-10 18:42:26',1,13,'62','2/3\" Lens Adapter for Sony PMW-EX3 Adapter',2,'Changed categories. Added product image \"ProductImage object\".'),(222,'2012-08-10 18:44:19',1,13,'63','.75x Aspheric Wide Angle Converter for Sony PMW-EX1 & EX3',1,''),(223,'2012-08-10 18:47:15',1,13,'63','.75x Aspheric Wide Angle Converter for Sony PMW-EX1 & EX3',2,'Changed categories. Added product image \"ProductImage object\".'),(224,'2012-08-10 18:47:39',1,13,'63','.75x Aspheric Wide Angle Converter for Sony PMW-EX1 & EX3',2,'Changed categories.'),(225,'2012-08-10 18:50:55',1,13,'63','.75x Aspheric Wide Angle Converter for Sony PMW-EX1 & EX3',2,'Changed categories. Changed image for product image \"ProductImage object\".'),(226,'2012-08-10 18:52:04',1,13,'64','Lensbaby Composer Kit',1,''),(227,'2012-08-10 18:52:22',1,13,'64','Lensbaby Composer Kit',2,'Changed categories.'),(228,'2012-08-10 18:53:15',1,13,'64','Lensbaby Composer Kit',2,'Changed categories. Added product image \"ProductImage object\".'),(229,'2012-08-10 18:54:34',1,13,'64','Lensbaby Composer Kit',2,'Changed categories.'),(230,'2012-08-10 18:59:36',1,15,'19','Dedolight',2,'Changed active, brand, price_tier and categories. Added product image \"ProductImage object\".'),(231,'2012-08-10 19:00:12',1,36,'14','Kino Flo',1,''),(232,'2012-08-10 19:00:57',1,15,'20','Kino Flo Kamio 6E System',2,'Changed brand and categories. Added product image \"ProductImage object\".'),(233,'2012-08-10 19:02:25',1,15,'20','Kino Flo Kamio 6E System',2,'Changed description and categories.'),(234,'2012-08-10 19:04:45',1,15,'21','Reflecmedia LiteRing',2,'Changed description and categories. Added product image \"ProductImage object\".'),(235,'2012-08-10 19:05:13',1,36,'15','Anton Bauer',1,''),(236,'2012-08-10 20:08:24',1,15,'22','Sun Gun (Anton Bauer)',2,'Changed brand and categories.'),(237,'2012-12-09 17:58:53',3,44,'2','csv/ifr_cameras_1.csv',1,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'migration history','south','migrationhistory'),(9,'link','base','link'),(10,'Price Tier','products','price_tier'),(11,'Price Tier Package','products','price_tier_package'),(12,'base indie rental product','products','baseindierentalproduct'),(13,'lens','products','lens'),(14,'camera','products','camera'),(15,'lighting','products','lighting'),(16,'Cart','shop','cart'),(17,'Cart item','shop','cartitem'),(18,'Product','shop','product'),(19,'Order','shop','order'),(20,'Order item','shop','orderitem'),(21,'Order extra info','shop','orderextrainfo'),(22,'Extra order price field','shop','extraorderpricefield'),(23,'Extra order item price field','shop','extraorderitempricefield'),(24,'Order payment','shop','orderpayment'),(25,'task meta','djcelery','taskmeta'),(26,'taskset meta','djcelery','tasksetmeta'),(27,'interval','djcelery','intervalschedule'),(28,'crontab','djcelery','crontabschedule'),(29,'periodic tasks','djcelery','periodictasks'),(30,'periodic task','djcelery','periodictask'),(31,'worker','djcelery','workerstate'),(32,'task','djcelery','taskstate'),(33,'Country','addressmodel','country'),(34,'Address','addressmodel','address'),(35,'PayPal IPN','ipn','paypalipn'),(36,'brand','products','brand'),(37,'product image','products','productimage'),(38,'category','shop_simplecategories','category'),(39,'audio','products','audio'),(40,'monitor','products','monitor'),(41,'support','products','support'),(42,'accessory','products','accessory'),(43,'registration profile','registration','registrationprofile'),(44,'csv import','csvimport','csvimport'),(45,'import model','csvimport','importmodel');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('036a48235b4b64abc8035a85d39cd480','ZjFhMmI1ZTA1NjFkMzgxNWRmODZmYzljNzhjMzkwMjIyNTllYzVjMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-08-08 23:03:04'),('0f89fed8453d8c09eabd6ba017894132','NzBhOGZkMTkyOGQ0YWM2NWVlMDA5ZGU3M2Y4OGQyNTU2OTMzMzk3MzqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgaWVMUGw1THl1ckpNMXVXc3hFOEN5T0o4VlFySmVjejlxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-05-29 03:14:43'),('0f95d3157670bbf8e2202da3a64cfdcb','OGMxYTg5MGY5OTZjNTM3ZjgxODllMTU1NjI4ODZiYjQ0YzUwYjVjYzqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgM2FRU1FpMHBkWkxIR0w1Z1RKemE5amZyaGFnd2F0VXlxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-06-07 14:27:47'),('182bc41e2dc5393532cc13f06fd6380d','YWE4ZTE1OGY3ZDJiZjY1M2Y2YjZlOWZmYzA3OThkNTEzNzcxNjdjODqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgUUJzaFlqaWJPN0R1ZEpSQ1o3bERaUjE2cEg3ZEZRZUFxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-07-12 13:28:37'),('1c7ddb9f085039c6305ddc9dbd267fa7','Y2VmYTRkN2Y1MzQzODQ1OTQ5N2E1MTFmYzQ4MjVjZWM4ZDM2YTUwYjqAAn1xAS4=\n','2012-08-08 23:02:49'),('208beded532ffeb8ac8e2dbafe40b824','ZGJhNDVlODFkMGZhODU4N2U1Mzg4MTkxYWMyNzAyODQwNTQ3NjM4MDqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgWjB4RmhGSTZHd2hNdXByVE9yQ3dBSld6M2l3dTQ0M0NxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-07-31 20:14:01'),('20f220d2cfc88adf18c667fd6620b421','NTgwMTg5YWRjYzM3YzAxMjZiZGViZDE4ODQwM2NkNjM0YjY2OTY0YzqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgVFZZRkoxaVl0a0VlaEZNN1JWZlZIelNyUWVqRHhPV3hxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-06-07 15:07:23'),('2e4259f80a6a07e6e361a8ed5078b161','ZjFhMmI1ZTA1NjFkMzgxNWRmODZmYzljNzhjMzkwMjIyNTllYzVjMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-08-24 13:27:52'),('378e68c71bfe3c5da018086e064939f7','Zjk2Zjk4NDE4MDA1OTUzMTVhNjI4ZDFiZmU1NmZmODQwMzQyODQ0ZTqAAn1xAVUHY2FydF9pZHEC\nigECcy4=\n','2012-08-05 19:19:32'),('3978390dced4ef21a04c4f8343a7b74b','ZjFhMmI1ZTA1NjFkMzgxNWRmODZmYzljNzhjMzkwMjIyNTllYzVjMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-08-23 15:25:24'),('3d4833269fc51910d8cfc0a49c42bc8c','MzBjOTZiYTMyZDcyMTEyY2JmY2Y4M2VlMDJiMjI0NThiMGQwNzMyZTqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgVVZuRlJGdkk5UTJmRFlTdEd4cFN1emppRkg2MVZiTENxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-06-17 20:57:14'),('3e49269db6cc4b10aea9c5a868cc3487','ZTJjNDlhNGI4MTIwNGUzMDY0MTMyNWIzNWI1Njc1YmFjNTJiYTBjNzqAAn1xAVUHY2FydF9pZHEC\nigEEcy4=\n','2012-08-08 02:16:47'),('3fb0052582e5837caa68e5b3bac9983a','N2FiNjFhOGQ3MzlmZTU4Y2U5ZjNlMjc0MjlhYjA2YWMzOWUzYmEzYjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-06-13 16:54:33'),('43f78863da16f05355c0ac219cd3d05e','Y2VmYTRkN2Y1MzQzODQ1OTQ5N2E1MTFmYzQ4MjVjZWM4ZDM2YTUwYjqAAn1xAS4=\n','2012-08-22 21:57:04'),('466d52531a0e87ece88141f0e7409232','N2FiNjFhOGQ3MzlmZTU4Y2U5ZjNlMjc0MjlhYjA2YWMzOWUzYmEzYjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-07-31 18:05:14'),('4afedd83d6933a19adf118994a743a6d','N2VkYWQ1MjM2MjZmZGM4MzA3M2E0Y2EyN2IxNmM4NTY0NGJhODQ0ZTqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgVWJIYjVKN3NkdGNkdjB0TWdkTERxN1JzdDdKTWNpcTVxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-06-05 23:12:52'),('4dc071d94e44bb39df26e002e2b5df7a','YTgzZGM0MDkwZGI1Y2U0YTkwMjFkYTQ0MTgyN2MyZjUzMWY4NTFmOTqAAn1xAVUHY2FydF9pZHEC\nigEDcy4=\n','2012-08-08 01:52:56'),('55bdc1ddb44a2ffd4950ebceb52c80bf','MzBhZTUyODI4NjRhZjE5NmM5ZGRlNDc1ZWFhMzZiZjdmNGFjMmUzZDqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n','2012-08-26 15:06:08'),('56601064f70226b3f5d9f0714019753c','ODkwMzMxYmEwNTMwNTI1ZWVlMTQ1MzAwZmE0OWE4ZjA2NWNiMmZhOTqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgSjhqQ1JXMTVWMDUyNkF1QUN0TG1lOElNaXRndVNLTTVxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-06-16 21:32:19'),('58f774614b0db85ff200fae6744b2db3','ODMzMDMwMDAxNmFhYWZmMDczZTQyY2Y5ZDhmMGZlMzNmODY2YzdmZDqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgZlpEeTdjNUIyRUJhclFCbE9HamxpTGFvczZMWHhDckFxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-05-17 11:31:16'),('5c3152bbf3a420bf5ae4299888041ffd','ZjFhMmI1ZTA1NjFkMzgxNWRmODZmYzljNzhjMzkwMjIyNTllYzVjMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-08-20 19:51:31'),('619c110b3ba35b8a533329a624efa3a1','NTI0YWNmMWFhOTA3NzQ1YzQ3NDEwNDFjNmI2M2U5ZWIxYzZjNmRjNDqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgWWNaN3pvMmhZWWpsZkg4Z2o0OHdEcG5tTnhVZE05YWpxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-06-07 14:25:49'),('6643e0a881a3bd5612e0a8fa3d5bb502','MzBhZTUyODI4NjRhZjE5NmM5ZGRlNDc1ZWFhMzZiZjdmNGFjMmUzZDqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n','2012-07-10 20:06:38'),('6f1793b73083b087673e0994008e3660','NTRiODc5NzFhYzAzODY5Y2JmYjgzNjZkOTA2ZWQ5MzU3OGVlYmU1MTqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgVW8xWFFyZ1hKNkRwWWtSMzR5aWNmQXJReWdvQXJFbGVxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-07-12 13:29:25'),('7890a6c644820de35be61eb818f900a1','NDdjY2U1MWNjN2U0ZGQ4MDY0MGY4NDIzMzFmYjgxZmQzNmRlMWU1OTqAAn1xAVUHY2FydF9pZHEC\nigEHcy4=\n','2012-08-20 11:08:23'),('7e097dd7f4e53163faf991bc0b081b90','OGI1MDQ3NWE3NTUyNTMyNTc1YmU4YjExMzY5MzZmZGJmMWRjOWI2MTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQN1Lg==\n','2012-12-23 17:46:48'),('8079d1ce00d114194b433121369e9acf','Y2VmYTRkN2Y1MzQzODQ1OTQ5N2E1MTFmYzQ4MjVjZWM4ZDM2YTUwYjqAAn1xAS4=\n','2012-08-26 15:20:31'),('8119f7d458e2e2ab6da672b9ff27a5d8','Y2VmYTRkN2Y1MzQzODQ1OTQ5N2E1MTFmYzQ4MjVjZWM4ZDM2YTUwYjqAAn1xAS4=\n','2012-06-02 17:13:06'),('8d7c2fdd765a6a8175edecae24769116','Y2VmYTRkN2Y1MzQzODQ1OTQ5N2E1MTFmYzQ4MjVjZWM4ZDM2YTUwYjqAAn1xAS4=\n','2012-06-29 19:48:21'),('975c99c9221fecc3bbed209de8494b1a','MTg2MDJkZmZjYmYyYzU5MTlmZjgxNjAyNWYxODRhNjY2YzgyOTlkYzqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgUEU4U3NlTnRtZ3dGa0pvWFJybVZMM3ZuanZYMXhBeHlxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-08-04 17:37:14'),('9aab338e77c5ec8b8accf4f47a418735','ZjFhMmI1ZTA1NjFkMzgxNWRmODZmYzljNzhjMzkwMjIyNTllYzVjMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-08-10 01:18:29'),('a7b78f9a0294766fd4a1c83313413a39','ZjFhMmI1ZTA1NjFkMzgxNWRmODZmYzljNzhjMzkwMjIyNTllYzVjMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-08-10 01:46:53'),('a809cb909325b196de77577f70c54ced','N2FiNjFhOGQ3MzlmZTU4Y2U5ZjNlMjc0MjlhYjA2YWMzOWUzYmEzYjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-08-04 19:37:50'),('a824a2054e1ee02129f9ecb7993ce799','ZjFhMmI1ZTA1NjFkMzgxNWRmODZmYzljNzhjMzkwMjIyNTllYzVjMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-08-28 23:11:11'),('b53b6fcdeafac047b33c422c0f34432c','NWEwMGRlYTczZWRhMDUyZDJlOTU0YTdiYzc3M2I0MjJjZDdhMzNlYzqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgVUNBUEtJb0NHVXBVS0NTY2VxQjlpUTFFdUZNQWZDZ09xA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-06-06 02:02:18'),('b8f8ac7601cdf3e995f98a7cb82e8060','Y2VmYTRkN2Y1MzQzODQ1OTQ5N2E1MTFmYzQ4MjVjZWM4ZDM2YTUwYjqAAn1xAS4=\n','2012-08-20 01:53:31'),('bc66f957fb6f9d9d6d275b865ebd3dae','Y2VmYTRkN2Y1MzQzODQ1OTQ5N2E1MTFmYzQ4MjVjZWM4ZDM2YTUwYjqAAn1xAS4=\n','2012-08-04 16:20:31'),('bf5de44497aead6f9b2379a1e5b10de2','NGFhYzJkZDg0YmIxNGI4NzU0MWJkMjFlZTQxN2EwODM1MmE4MDY3YzqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgb2h1NTVHNTB3VDhlTjhIakZDQWRqMGtPU09tNm54QWxxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-05-29 22:10:55'),('c697a581a28c10fa6157f925778bd725','Yzk5MWY1MjAzZTBlNGVlNmM4YmQ4NzA1NmQzYTBkOGJlN2JkNGU2MjqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgUzVWOUVDOVkxUkR0VVRmYVNTemxxbVA3VlgwcVVYdTNxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-08-06 17:50:35'),('d9cf3b17b3d4b0ddfe954359af3f42c7','OGI4YmJiNDUwMDJhN2U3OTg1MjQ1YjU0YTFkNDdiNmIyZjdiNTEwOTqAAn1xAVUHY2FydF9pZHEC\nigEBcy4=\n','2012-08-04 21:40:03'),('e5f3b9bd054999b1d549d32a4c296a53','Y2VmYTRkN2Y1MzQzODQ1OTQ5N2E1MTFmYzQ4MjVjZWM4ZDM2YTUwYjqAAn1xAS4=\n','2012-08-04 16:00:49'),('e8dbd0998e318ecfbbe17168be81315d','Y2VmYTRkN2Y1MzQzODQ1OTQ5N2E1MTFmYzQ4MjVjZWM4ZDM2YTUwYjqAAn1xAS4=\n','2012-08-05 20:03:55'),('edbd8bd6c28d6a0c58b419b4a90c5120','Y2VmYTRkN2Y1MzQzODQ1OTQ5N2E1MTFmYzQ4MjVjZWM4ZDM2YTUwYjqAAn1xAS4=\n','2012-08-04 20:08:40'),('f333015885727aaf255845187bc9a9cd','N2FiNjFhOGQ3MzlmZTU4Y2U5ZjNlMjc0MjlhYjA2YWMzOWUzYmEzYjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-08-20 19:23:17'),('f358246c2144c4dac8e3e6ba0eabb02f','N2IzY2M0YWU0M2FlYTYxYTk2NTFmYjU1ZjdiZmQyMjE3ZDE2ZWY3NDqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgWlQzaEFLRnhFbFF0ZFpiRHRyNGxQeXRSR3ZuMDNvZHpxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-07-10 20:10:11'),('f576762042adf5e2a2c6b40e70d04b29','ZThjMWUxZTY0ZDk5NjFhMzYwM2MzZThmYTU1NTNhYTBlNGIwZDYyODqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgc2xCYkVZWW52QWtkcGk2VHRTSTA4cEhLSlZLMXNZekZxA1UNX2F1dGhfdXNlcl9pZIoB\nAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVs\nQmFja2VuZHUu\n','2012-08-04 16:21:49'),('f6e1bf4792dfd098d05f857ac3ba47ac','ZjFhMmI1ZTA1NjFkMzgxNWRmODZmYzljNzhjMzkwMjIyNTllYzVjMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-08-28 23:13:10');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_ipn`
--

LOCK TABLES `paypal_ipn` WRITE;
/*!40000 ALTER TABLE `paypal_ipn` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_ipn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_accessory`
--

DROP TABLE IF EXISTS `products_accessory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_accessory` (
  `baseindierentalproduct_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`baseindierentalproduct_ptr_id`),
  CONSTRAINT `baseindierentalproduct_ptr_id_refs_product_ptr_id_9c0c7997` FOREIGN KEY (`baseindierentalproduct_ptr_id`) REFERENCES `products_baseindierentalproduct` (`product_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_accessory`
--

LOCK TABLES `products_accessory` WRITE;
/*!40000 ALTER TABLE `products_accessory` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_accessory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_audio`
--

DROP TABLE IF EXISTS `products_audio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_audio` (
  `baseindierentalproduct_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`baseindierentalproduct_ptr_id`),
  CONSTRAINT `baseindierentalproduct_ptr_id_refs_product_ptr_id_6ab5dd9b` FOREIGN KEY (`baseindierentalproduct_ptr_id`) REFERENCES `products_baseindierentalproduct` (`product_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_audio`
--

LOCK TABLES `products_audio` WRITE;
/*!40000 ALTER TABLE `products_audio` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_audio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_baseindierentalproduct`
--

DROP TABLE IF EXISTS `products_baseindierentalproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_baseindierentalproduct` (
  `product_ptr_id` int(11) NOT NULL,
  `description` longtext,
  `description_html` longtext,
  `status` int(11) NOT NULL,
  `price_tier_id` int(11),
  `brand_id` int(11),
  `quantity` int(11) NOT NULL,
  `short_description` longtext,
  `ohd_daily` varchar(100),
  `ohd_weekly` varchar(100),
  `ohd_monthly` varchar(100),
  `image_id` int(11),
  PRIMARY KEY (`product_ptr_id`),
  KEY `products_baseindierentalproduct_75f94198` (`price_tier_id`),
  KEY `products_baseindierentalproduct_74876276` (`brand_id`),
  KEY `products_baseindierentalproduct_6682136` (`image_id`),
  CONSTRAINT `image_id_refs_id_6a9da399a957156` FOREIGN KEY (`image_id`) REFERENCES `products_productimage` (`id`),
  CONSTRAINT `brand_id_refs_id_3eeba2e5915f4288` FOREIGN KEY (`brand_id`) REFERENCES `products_brand` (`id`),
  CONSTRAINT `price_tier_id_refs_id_31c7e329e788e829` FOREIGN KEY (`price_tier_id`) REFERENCES `products_price_tier_package` (`id`),
  CONSTRAINT `product_ptr_id_refs_id_51444e54` FOREIGN KEY (`product_ptr_id`) REFERENCES `shop_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_baseindierentalproduct`
--

LOCK TABLES `products_baseindierentalproduct` WRITE;
/*!40000 ALTER TABLE `products_baseindierentalproduct` DISABLE KEYS */;
INSERT INTO `products_baseindierentalproduct` VALUES (1,'<p>Optimo DP 16-42 with an aperture of T2.8 is a lightweight and compact PL mount zoom lens. He is designed for digital cameras. Optimo DP 16-42 delivers the superior zoom optics, functionality and ergonomics that DP&rsquo;s demand at an economical price. The ideal match for the Optimo DP 30-80mm.</p>','<p>Optimo DP 16-42 with an aperture of T2.8 is a lightweight and compact PL mount zoom lens. He is designed for digital cameras. Optimo DP 16-42 delivers the superior zoom optics, functionality and ergonomics that DP&rsquo;s demand at an economical price. The ideal match for the Optimo DP 30-80mm.</p>',1,1,12,0,NULL,NULL,NULL,NULL,NULL),(2,'<p>Optimo DP 30-80 with an aperture of T2.8 is a lightweight and compact PL mount zoom lens. OPTIMO DP 30-80 zoom lens is designed for digital cameras. Optimo DP 30-80 brings the very best of film to the new world of large format digital production.<br /> <br /> Includes Duclos Zoom Motor Bracket and 32-pitch gear.</p>','<p>Optimo DP 30-80 with an aperture of T2.8 is a lightweight and compact PL mount zoom lens. OPTIMO DP 30-80 zoom lens is designed for digital cameras. Optimo DP 30-80 brings the very best of film to the new world of large format digital production.<br /> <br /> Includes Duclos Zoom Motor Bracket and 32-pitch gear.</p>',1,1,12,0,NULL,NULL,NULL,NULL,NULL),(3,'<p>Zeiss Compact Prime T/2.1 Lenses.<br /> Internal Focus with 114mm Front OD PL mount</p>\r\n<p><br /> 28mm T/2.1<br /> 35mm T/2.1<br /> 50mm T/2.1<br /> 85mm T/2.1<br />100mm T/2.1</p>','<p>Zeiss Compact Prime T/2.1 Lenses.<br /> Internal Focus with 114mm Front OD PL mount</p>\n\n<p><br /> 28mm T/2.1<br /> 35mm T/2.1<br /> 50mm T/2.1<br /> 85mm T/2.1<br />100mm T/2.1</p>',1,1,11,0,NULL,NULL,NULL,NULL,NULL),(4,'<div style=\"width: 30%; clear: none; float: left;\">\r\n<div class=\"productCallout\" style=\"clear: none;\">AVCCAM - the Industry\'s Next Generation Affordable HD<br /><br /></div>\r\n</div>\r\n<div><br /> The AG-HMC150 handheld is Panasonic\'s exciting new introduction to the AVCCAM series. Representing a major step forward in affordable HD video capture, the HMC150 utilizes highly efficient AVCHD recording, the industry\'s new long GOP standard based on MPEG-4, to provide stunning image quality and longer record time.<br /> <br /> The new handheld incorporates three 1/3-inch progressive CCD imagers to produce stunning 1920 x 1080 resolution picture quality far exceeding older Long GOP formats like HDV. It\'s equipped with a high-performance wide-angle* Leica Dicomar&trade; 13x zoom lens and 24- and 30-frame progressive capture in a full range of HD formats, making it well suited for all types of projects. With an exciting range of professional video and audio features and a compact, well-balanced design, the HMC150 is a \"must have\" for video professionals and enthusiasts looking for the best in affordable HD.<br /> <br /> <strong>Extra-Long Solid-State Recording</strong><br /> <br /> Forget minutes! With AVCHD technology and high-capacity SD memory cards, the HMC150 provides hours of beautiful high definition recordings at professional bitrates up to 21Mbps. And it\'s as easy to use as a digital still camera, with simple playback on many consumer devices and players, from computers and video game consoles to Blu-ray players and flat panel displays with SD card slots. <br /> <br /> AVCHD is currently supported by variety of editing solutions including: Apple iMovie, Apple Final Cut Pro 6.0.1, Adobe Premier Pro CS3, Grass Valley Edius PRO v4.5, Pinnacle Studio Plus 11, Nero7 Premium Reloaded, Ulead Video Studio 11 plus and DVD Movie Factory 6 Plus.<br /> <br />\r\n<ul>\r\n<li>Stunning, full pixel HD resolution with these professional bitrate recording modes</li>\r\n<li>PH - 21 Mpbs (1920x1080) -- Highest Quality Setting</li>\r\n<li>HA - 17 Mpbs (1920x1080)</li>\r\n<li>HG - 13 Mpbs (1920x1080)</li>\r\n<li>HE - 6 Mpbs (1440x1280) - Perfect for Long-form Recording</li>\r\n</ul>\r\n</div>\r\n<p><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"17\" height=\"17\" /></p>','<div style=\"width: 30%; clear: none; float: left;\">\n<div class=\"productCallout\" style=\"clear: none;\">AVCCAM - the Industry\'s Next Generation Affordable HD<br /><br /></div>\n</div>\n\n<div><br /> The AG-HMC150 handheld is Panasonic\'s exciting new introduction to the AVCCAM series. Representing a major step forward in affordable HD video capture, the HMC150 utilizes highly efficient AVCHD recording, the industry\'s new long GOP standard based on MPEG-4, to provide stunning image quality and longer record time.<br /> <br /> The new handheld incorporates three 1/3-inch progressive CCD imagers to produce stunning 1920 x 1080 resolution picture quality far exceeding older Long GOP formats like HDV. It\'s equipped with a high-performance wide-angle* Leica Dicomar&trade; 13x zoom lens and 24- and 30-frame progressive capture in a full range of HD formats, making it well suited for all types of projects. With an exciting range of professional video and audio features and a compact, well-balanced design, the HMC150 is a \"must have\" for video professionals and enthusiasts looking for the best in affordable HD.<br /> <br /> <strong>Extra-Long Solid-State Recording</strong><br /> <br /> Forget minutes! With AVCHD technology and high-capacity SD memory cards, the HMC150 provides hours of beautiful high definition recordings at professional bitrates up to 21Mbps. And it\'s as easy to use as a digital still camera, with simple playback on many consumer devices and players, from computers and video game consoles to Blu-ray players and flat panel displays with SD card slots. <br /> <br /> AVCHD is currently supported by variety of editing solutions including: Apple iMovie, Apple Final Cut Pro 6.0.1, Adobe Premier Pro CS3, Grass Valley Edius PRO v4.5, Pinnacle Studio Plus 11, Nero7 Premium Reloaded, Ulead Video Studio 11 plus and DVD Movie Factory 6 Plus.<br /> <br />\n<ul>\n<li>Stunning, full pixel HD resolution with these professional bitrate recording modes</li>\n<li>PH - 21 Mpbs (1920x1080) -- Highest Quality Setting</li>\n<li>HA - 17 Mpbs (1920x1080)</li>\n<li>HG - 13 Mpbs (1920x1080)</li>\n<li>HE - 6 Mpbs (1440x1280) - Perfect for Long-form Recording</li>\n</ul>\n</div>\n\n<p><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"17\" height=\"17\" /></p>',1,3,2,0,NULL,NULL,NULL,NULL,NULL),(5,'<p>The AG-AC160 features cutting-edge technology with its improved lens, camera, and recorder sections. The newly developed 22x zoom lens (28mm to 616mm in 35mm equivalent), boasts a wide field of view and capabilities much like an interchangeable lens, via a mechanical (cam-driven) zoom ring, a focus ring, and an iris ring. High-quality full-HD 1920x1080 is achieved with a combination of a high-sensitivity, low-noise, high-resolution 1/3-type 2.2-megapixel U.L.T. (Ultra Luminance Technology) MOS image sensor and the professional AVCHD PH mode. Advanced functions like high-quality LPCM recording, HD slow/quick-motion recording, HD/SDI output compatibility, DV (SD) recording mode, and a switchable 59.94Hz/50Hz mode make this an ideal camera for almost any type of production. <br /> <br /> Inherited from the VariCam, the Variable Frame Rate (VFR) function, which is widely used for movie, television, and commercial production, creates a wide range of film-cameralike images, such as overcranking for slow-motion and undercranking for quick-motion effects, and supports full-HD (1920x1080) progressive mode.<br /> <br /> While the camera employs the AVCHD recording format, it also supports the high-image-quality PH mode, featuring a compression efficiency that is more than twice that of the MPEG-2 system (such as HDV), delivering superb image quality and low data rates. While in PH mode, it also supports uncompressed 16 bit LPCM 2-channel digital audio recording.<br /> <br /> Dual memory card slots allows Relay Recording, so you can seamlessly record images onto two SDXC/SDHC memory cards consecutively, while Simultaneous Recording records the same images onto two different memory cards to increase reliability. The slot to be used can be switched during normal recording, and clips can also be copied between the 2 slots.<br /> <br /> The color EVF uses a 11.43mm (0.45 inches), approximately 1,226,000 dot-equivalent (852 x 480 x 3 [RGB]) LCOS (liquid crystal on silicon) display panel. It delivers bright, detailed, high-resolution images and a high response speed. The LCD monitor is comprised of a 87.63mm (3.45 inches), approximately 921,000-dot (1920 x 480) high-resolution panel.&nbsp;</p>','<p>The AG-AC160 features cutting-edge technology with its improved lens, camera, and recorder sections. The newly developed 22x zoom lens (28mm to 616mm in 35mm equivalent), boasts a wide field of view and capabilities much like an interchangeable lens, via a mechanical (cam-driven) zoom ring, a focus ring, and an iris ring. High-quality full-HD 1920x1080 is achieved with a combination of a high-sensitivity, low-noise, high-resolution 1/3-type 2.2-megapixel U.L.T. (Ultra Luminance Technology) MOS image sensor and the professional AVCHD PH mode. Advanced functions like high-quality LPCM recording, HD slow/quick-motion recording, HD/SDI output compatibility, DV (SD) recording mode, and a switchable 59.94Hz/50Hz mode make this an ideal camera for almost any type of production. <br /> <br /> Inherited from the VariCam, the Variable Frame Rate (VFR) function, which is widely used for movie, television, and commercial production, creates a wide range of film-cameralike images, such as overcranking for slow-motion and undercranking for quick-motion effects, and supports full-HD (1920x1080) progressive mode.<br /> <br /> While the camera employs the AVCHD recording format, it also supports the high-image-quality PH mode, featuring a compression efficiency that is more than twice that of the MPEG-2 system (such as HDV), delivering superb image quality and low data rates. While in PH mode, it also supports uncompressed 16 bit LPCM 2-channel digital audio recording.<br /> <br /> Dual memory card slots allows Relay Recording, so you can seamlessly record images onto two SDXC/SDHC memory cards consecutively, while Simultaneous Recording records the same images onto two different memory cards to increase reliability. The slot to be used can be switched during normal recording, and clips can also be copied between the 2 slots.<br /> <br /> The color EVF uses a 11.43mm (0.45 inches), approximately 1,226,000 dot-equivalent (852 x 480 x 3 [RGB]) LCOS (liquid crystal on silicon) display panel. It delivers bright, detailed, high-resolution images and a high response speed. The LCD monitor is comprised of a 87.63mm (3.45 inches), approximately 921,000-dot (1920 x 480) high-resolution panel.&nbsp;</p>',2,3,2,0,NULL,NULL,NULL,NULL,NULL),(6,'<ul class=\"horizMenuBullet\">\r\n<li>2x Batteries</li>\r\n<li>2x Chargers</li>\r\n<li>1x 16GB CF Card</li>\r\n<li>18.0 Megapixels</li>\r\n<li>3.0\" LCD</li>\r\n<li>HD Video Recording</li>\r\n<li>Selectable Video Exposure + Frame Rates</li>\r\n<li>Dust &amp; Weather Resistant</li>\r\n<li>100% Viewfinder</li>\r\n<li>Self Cleaning Sensor</li>\r\n<li>High Sensitivity (ISO 12800)</li>\r\n<li>8fps Burst Mode</li>\r\n<li>17-85mm f/4-5.6 IS USM Lens</li>\r\n</ul>','<ul class=\"horizMenuBullet\">\n<li>2x Batteries</li>\n<li>2x Chargers</li>\n<li>1x 16GB CF Card</li>\n<li>18.0 Megapixels</li>\n<li>3.0\" LCD</li>\n<li>HD Video Recording</li>\n<li>Selectable Video Exposure + Frame Rates</li>\n<li>Dust &amp; Weather Resistant</li>\n<li>100% Viewfinder</li>\n<li>Self Cleaning Sensor</li>\n<li>High Sensitivity (ISO 12800)</li>\n<li>8fps Burst Mode</li>\n<li>17-85mm f/4-5.6 IS USM Lens</li>\n</ul>',1,4,4,0,NULL,NULL,NULL,NULL,NULL),(7,'<p>Canon\'s C300 has everything that made DSLRs great but withouth the drawbacks. Features a super35 size sensor, XLR Inputs, SDI monitoring, and the same EOS lens mount as a 5D or 7D allowing canon\'s wide supply of still lenses to be utilized.</p>','<p>Canon\'s C300 has everything that made DSLRs great but withouth the drawbacks. Features a super35 size sensor, XLR Inputs, SDI monitoring, and the same EOS lens mount as a 5D or 7D allowing canon\'s wide supply of still lenses to be utilized.</p>',1,3,4,0,NULL,NULL,NULL,NULL,NULL),(8,'<p>Canon 24-70mm L-Series zoom lens.</p>','<p>Canon 24-70mm L-Series zoom lens.</p>',1,1,4,0,NULL,NULL,NULL,NULL,NULL),(9,'<p>The EF 16-35mm f/2.8L II USM is a high performance, and ultra wide-angle Canon L-series lens. It has been specifically designed for improved edge-to-edge image quality that will meet the strict requirements of professional and high-end amateur photographers. It features 3 high-precision aspherical lens elements, each of a different type: ground, replica and GMo for even better image quality than the original EF 16-35mm f/2.8L USM. The circular aperture produces a beautiful and natural background blur when shooting at wider apertures. Other features include internal focusing, a ring type USM (Ultra Sonic Monitor), and new AF algorithms for fast and quiet autofocusing.</p>','<p>The EF 16-35mm f/2.8L II USM is a high performance, and ultra wide-angle Canon L-series lens. It has been specifically designed for improved edge-to-edge image quality that will meet the strict requirements of professional and high-end amateur photographers. It features 3 high-precision aspherical lens elements, each of a different type: ground, replica and GMo for even better image quality than the original EF 16-35mm f/2.8L USM. The circular aperture produces a beautiful and natural background blur when shooting at wider apertures. Other features include internal focusing, a ring type USM (Ultra Sonic Monitor), and new AF algorithms for fast and quiet autofocusing.</p>',1,1,4,0,NULL,NULL,NULL,NULL,NULL),(10,'<p>17-85mm Zoom Lens. Compatible with 7D, will not cover a full frame sensor.</p>','<p>17-85mm Zoom Lens. Compatible with 7D, will not cover a full frame sensor.</p>',1,1,4,0,NULL,NULL,NULL,NULL,NULL),(11,'<p>Canon 24-105mm zoom lens.</p>','<p>Canon 24-105mm zoom lens.</p>',1,1,4,0,NULL,NULL,NULL,NULL,NULL),(13,'<p>Canon 24-70mm L-Series zoom lens.</p>','<p>Canon 24-70mm L-Series zoom lens.</p>',1,1,1,0,NULL,NULL,NULL,NULL,NULL),(14,'<p>Nikon to Canon Mount Adapter</p>','<p>Nikon to Canon Mount Adapter</p>',1,1,8,0,NULL,NULL,NULL,NULL,NULL),(15,'<div id=\"TB_ajaxWindowTitle\">This Set of Zeiss ZF&nbsp;Lenses has Cine Mods by Duclos Lens and is available in Canon or Nikon Mounts<br /> <br /> The 6 Lens Set Includes:</div>\r\n<ul>\r\n<li>Zeiss Distagon 18mm f/3.5 ZF Lens</li>\r\n<li>Zeiss Distagon 25mm f/2.8 ZF Lens</li>\r\n<li>Zeiss Planar 50mm F/2 ZF Lens</li>\r\n<li>Zeiss Planar 85mm f/1.4 ZF Lens</li>\r\n<li>Zeiss Makro-Planar 100mm f/2 ZF Lens</li>\r\n</ul>','<div id=\"TB_ajaxWindowTitle\">This Set of Zeiss ZF&nbsp;Lenses has Cine Mods by Duclos Lens and is available in Canon or Nikon Mounts<br /> <br /> The 6 Lens Set Includes:</div>\n\n<ul>\n<li>Zeiss Distagon 18mm f/3.5 ZF Lens</li>\n<li>Zeiss Distagon 25mm f/2.8 ZF Lens</li>\n<li>Zeiss Planar 50mm F/2 ZF Lens</li>\n<li>Zeiss Planar 85mm f/1.4 ZF Lens</li>\n<li>Zeiss Makro-Planar 100mm f/2 ZF Lens</li>\n</ul>',1,1,11,0,NULL,NULL,NULL,NULL,NULL),(16,'<p>Set of 6 Zeiss ZF.2 lenses with Nikon mount.&nbsp; Adapters are available for EOS mount (as well as m4/3, e-mount, and more). These lenses house electronics allowing them to communicate lens data to DSLR cameras. <br /> <br /> 21mm Distagon f/2.8<br /> 28mm Distagon f/2<br /> 35mm Distagon f/2<br /> 50mm Planar f/1.4<br /> 85mm Planar f/1.4<br /> 100mm Makro-Planar f/2</p>','<p>Set of 6 Zeiss ZF.2 lenses with Nikon mount.&nbsp; Adapters are available for EOS mount (as well as m4/3, e-mount, and more). These lenses house electronics allowing them to communicate lens data to DSLR cameras. <br /> <br /> 21mm Distagon f/2.8<br /> 28mm Distagon f/2<br /> 35mm Distagon f/2<br /> 50mm Planar f/1.4<br /> 85mm Planar f/1.4<br /> 100mm Makro-Planar f/2</p>',1,1,11,0,NULL,NULL,NULL,NULL,NULL),(18,'<ul class=\"horizMenuBullet\">\r\n<li>3 1/2\"-type CMOS Sensors</li>\r\n<li>1080p, 720p, 1080i</li>\r\n<li>Native 23.98p</li>\r\n<li>Full HD 1920 x 1080</li>\r\n<li>Wide Angle 14x Fujinon Lens</li>\r\n<li>1.23MP Viewfinder</li>\r\n<li>Records to SxS Cards</li>\r\n<li>DVCAM SD Mode</li>\r\n<li>Cache Recording</li>\r\n<li>HDMI Output</li>\r\n</ul>','<ul class=\"horizMenuBullet\">\n<li>3 1/2\"-type CMOS Sensors</li>\n<li>1080p, 720p, 1080i</li>\n<li>Native 23.98p</li>\n<li>Full HD 1920 x 1080</li>\n<li>Wide Angle 14x Fujinon Lens</li>\n<li>1.23MP Viewfinder</li>\n<li>Records to SxS Cards</li>\n<li>DVCAM SD Mode</li>\n<li>Cache Recording</li>\n<li>HDMI Output</li>\n</ul>',1,3,1,0,NULL,NULL,NULL,NULL,NULL),(19,'<p>The DLH4 offers a wide range of powering options - from battery to AC power with color temperature control. <br /> <br /> The light head of the Dedolight system is extremely compact. With its dual-lens Aspherics2 optical system it provides astounding light output. <br /> <br /> In flood position, its light output is greater than a 300W Fresnel studio fixture. In spot position, its output equals or exceeds a 1000W Fresnel studio fixture.</p>','<p>The DLH4 offers a wide range of powering options - from battery to AC power with color temperature control. <br /> <br /> The light head of the Dedolight system is extremely compact. With its dual-lens Aspherics2 optical system it provides astounding light output. <br /> <br /> In flood position, its light output is greater than a 300W Fresnel studio fixture. In spot position, its output equals or exceeds a 1000W Fresnel studio fixture.</p>',1,3,8,0,NULL,NULL,NULL,NULL,NULL),(20,'<p>Kamio Ring-Lights provide a glamour lighting solution for close ups in film and video photography. The soft, cool Kamio light falls gracefully on the subject&rsquo;s face because it mounts on the lens, unlike conventional on-camera quartz lights that produce heat and shadows. Kamios also display daylight and tungsten quality light without filtration.<br /> <span class=\"style64\"><span style=\"font-size: small;\"><span style=\"font-family: Verdana;\"><br /> Kamio 6E System,<br /> (On-Camera/ENG)</span></span></span></p>','<p>Kamio Ring-Lights provide a glamour lighting solution for close ups in film and video photography. The soft, cool Kamio light falls gracefully on the subject&rsquo;s face because it mounts on the lens, unlike conventional on-camera quartz lights that produce heat and shadows. Kamios also display daylight and tungsten quality light without filtration.<br /> <span class=\"style64\"><span style=\"font-size: small;\"><span style=\"font-family: Verdana;\"><br /> Kamio 6E System,<br /> (On-Camera/ENG)</span></span></span></p>',1,5,14,0,NULL,NULL,NULL,NULL,NULL),(21,'<p>Reflectomedia\'s LiteRing system makes lighting a green screen setup quick and easy. The LiteRing LED attaches directly to the camera lens and the Chromatte background reflects back a perfectly lite chromakey background to the camera.</p>','<p>Reflectomedia\'s LiteRing system makes lighting a green screen setup quick and easy. The LiteRing LED attaches directly to the camera lens and the Chromatte background reflects back a perfectly lite chromakey background to the camera.</p>',1,5,1,0,NULL,NULL,NULL,NULL,NULL),(22,'<p>The original Ultralights are available in both single and dual head versions both with standard 5/8\" stud mounting which makes them ideal for a wide variety of applications in addition to camera mounting. The original Ultralights also feature a choice of power sources: 12-14 volt and 30 volt <br /> <br /> . The integral 4 pin connector accepts a variety of power cables including the D-Tap.</p>','<p>The original Ultralights are available in both single and dual head versions both with standard 5/8\" stud mounting which makes them ideal for a wide variety of applications in addition to camera mounting. The original Ultralights also feature a choice of power sources: 12-14 volt and 30 volt <br /> <br /> . The integral 4 pin connector accepts a variety of power cables including the D-Tap.</p>',2,5,15,0,NULL,NULL,NULL,NULL,NULL),(23,'<p>The Sony HVR-Z7U is an HDV handheld camcorder featuring a lens mount. Previously unheard of for such a compact unit, the HVR-Z7U incorporates the convenience of a handheld camcorder with the flexibility of larger ENG cameras. The camera can also record directly to compact flash cards, via the camera\'s supplied memory recording unit. Combined with Sony\'s entire family of HDV products, the HVR-Z7U is a great camcorder for almost any production, including documentaries, news, low-budget movies, music videos, and industrials. Interchangeable LensesUsers get the best of both worlds with this innovative camcorder. The HVR-Z7U\'s unique design is the first of its kind; a handheld camera with the interchangeable lens capability. Whether you are filming a movie or shooting a documentary, the HVR-Z7U has it covered.ClearVID 3CMOS TechnologySony\'s ClearVID sensors are positioned at a 45&deg; angle. Since each pixel is positioned at this angle the result is far clearer diagonal lines. Images will appear crisper, without the apparent \"jaggies\" that often plague video signals.Record to Compact FlashThe camera comes with an attachable recording unit, allowing users to record HDV and DV to CompactFlash cards. With cards getting larger and larger in capacity, the ability to take advantage of tapeless workflow while still using cheap media is a welcome addition.High Definition on MiniDV Tapes with HDVThe HDV format, used in the HVR-Z7U allows high definition recording on standard MiniDV tapes. This is accomplished by using the very popular MPEG-2 compression technique used in many applications, including DVDs and satellite television.24p CapabilityIn 24p mode, images from the CMOS can be 2:3 pulldown-converted and recorded onto tape in the standard 60i HDV format. The tape can then be played back or edited using an ordinary HDV system. True 24p editing can be achieved by uploading 2:3 pulldown-converted images via an i.LINK FireWire interface to a compatible non-linear editing system. The resultant images resemble the visual motion of film!HDMI OutputMany consumer products are adopting High Definition Media Interface (HDMI) connections for transmitting uncompressed digital HD video signals. Sony has upped the ante by incorporating this into the already extensive array of video output choices on the HVR-Z7U. Connect the camera to any HDTV via this interface and view all your footage the way it was meant to be seen: purely digital!</p>','<p>The Sony HVR-Z7U is an HDV handheld camcorder featuring a lens mount. Previously unheard of for such a compact unit, the HVR-Z7U incorporates the convenience of a handheld camcorder with the flexibility of larger ENG cameras. The camera can also record directly to compact flash cards, via the camera\'s supplied memory recording unit. Combined with Sony\'s entire family of HDV products, the HVR-Z7U is a great camcorder for almost any production, including documentaries, news, low-budget movies, music videos, and industrials. Interchangeable LensesUsers get the best of both worlds with this innovative camcorder. The HVR-Z7U\'s unique design is the first of its kind; a handheld camera with the interchangeable lens capability. Whether you are filming a movie or shooting a documentary, the HVR-Z7U has it covered.ClearVID 3CMOS TechnologySony\'s ClearVID sensors are positioned at a 45&deg; angle. Since each pixel is positioned at this angle the result is far clearer diagonal lines. Images will appear crisper, without the apparent \"jaggies\" that often plague video signals.Record to Compact FlashThe camera comes with an attachable recording unit, allowing users to record HDV and DV to CompactFlash cards. With cards getting larger and larger in capacity, the ability to take advantage of tapeless workflow while still using cheap media is a welcome addition.High Definition on MiniDV Tapes with HDVThe HDV format, used in the HVR-Z7U allows high definition recording on standard MiniDV tapes. This is accomplished by using the very popular MPEG-2 compression technique used in many applications, including DVDs and satellite television.24p CapabilityIn 24p mode, images from the CMOS can be 2:3 pulldown-converted and recorded onto tape in the standard 60i HDV format. The tape can then be played back or edited using an ordinary HDV system. True 24p editing can be achieved by uploading 2:3 pulldown-converted images via an i.LINK FireWire interface to a compatible non-linear editing system. The resultant images resemble the visual motion of film!HDMI OutputMany consumer products are adopting High Definition Media Interface (HDMI) connections for transmitting uncompressed digital HD video signals. Sony has upped the ante by incorporating this into the already extensive array of video output choices on the HVR-Z7U. Connect the camera to any HDTV via this interface and view all your footage the way it was meant to be seen: purely digital!</p>',1,3,1,0,NULL,NULL,NULL,NULL,NULL),(24,'<p>The PMW-EX3 combines a state-of-the-art, non-linear XDCAM workflow with simply the best HD quality yet seen in a semi-shoulder camcorder. It is also the first semi-shoulder camcorder to carry the legendary CineAlta 24P brand with multiple frame rate recording capability such as 59.94i, 50i, and native 23.98P, as well being 1080i/720P switchable.<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> There is also a choice of a 35Mb/s High Quality mode or a 25Mb/s, HDV 1080i compatible mode. To take advantage of this high performance recording capability, the PMW-EX3 uses the same imaging system as the PMW-EX1, consisting of three &frac12;-inch type CMOS sensors, each with an effective pixel count of 1920x1080. In addition, there\'s a purpose-built interchangeable Fujinon Professional HD &frac12;-inch 14x lens and a unique dual focus ring mechanism. Included in the package is a &frac12;-inch lens adaptor to allow use of other &frac12;-inch lenses, plus the ability to use other optional lens adaptors for 2/3rd-inch, cinema-style and digital SLR lenses.<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> To maximize recording time, the PMW-EX3 has two memory card slots which means with a pair of 16 GB SxS PRO memory cards, it can record up to 140 minutes of HD footage.<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> A wide variety of accessories are also available, including a USB Reader/Writer, a wide-conversion lens, battery and charger.<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> The PMW-EX3 HD compact camcorder is the ideal solution for a wide range of customers from broadcasters through to independent videographers and film makers who want exceptional HD picture quality and state-of-the-art workflow from an affordable semi-shoulder camcorder.<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> ABOUT THE &ldquo;SxS PRO&rdquo; FORMAT<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> SxS PRO (&ldquo;S-by-S&rdquo;) is a new nonlinear recording media.&nbsp;</p>\r\n<ul>\r\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Compatible with ExpressCard3/4 interface slot, which is common on modern Windows PCs and Macs</li>\r\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Uses PCI Express interface and achieves an extremely high \"read\" speed of up to 800 Mb/s</li>\r\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Large storage capacity: SBP-8 (8 GB) and SBP-16 (16 GB) memory cards are available. One SBP-8 (8 GB) memory card is supplied with the PMW-EX1</li>\r\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Can record up to 70 minutes of HD video and audio (using one 16-GB memory card)</li>\r\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Compact size: approx. 2.95&rdquo;x1.34\"x0.2&rdquo; (75&times;34&times;5mm) (excluding the projecting parts) - half the size of the older PC Card standard</li>\r\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Low power consumption</li>\r\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Highly reliable: can resist shocks (up to 1500 G) and vibrations (up to 15 G)</li>\r\n</ul>','<p>The PMW-EX3 combines a state-of-the-art, non-linear XDCAM workflow with simply the best HD quality yet seen in a semi-shoulder camcorder. It is also the first semi-shoulder camcorder to carry the legendary CineAlta 24P brand with multiple frame rate recording capability such as 59.94i, 50i, and native 23.98P, as well being 1080i/720P switchable.<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> There is also a choice of a 35Mb/s High Quality mode or a 25Mb/s, HDV 1080i compatible mode. To take advantage of this high performance recording capability, the PMW-EX3 uses the same imaging system as the PMW-EX1, consisting of three &frac12;-inch type CMOS sensors, each with an effective pixel count of 1920x1080. In addition, there\'s a purpose-built interchangeable Fujinon Professional HD &frac12;-inch 14x lens and a unique dual focus ring mechanism. Included in the package is a &frac12;-inch lens adaptor to allow use of other &frac12;-inch lenses, plus the ability to use other optional lens adaptors for 2/3rd-inch, cinema-style and digital SLR lenses.<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> To maximize recording time, the PMW-EX3 has two memory card slots which means with a pair of 16 GB SxS PRO memory cards, it can record up to 140 minutes of HD footage.<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> A wide variety of accessories are also available, including a USB Reader/Writer, a wide-conversion lens, battery and charger.<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> The PMW-EX3 HD compact camcorder is the ideal solution for a wide range of customers from broadcasters through to independent videographers and film makers who want exceptional HD picture quality and state-of-the-art workflow from an affordable semi-shoulder camcorder.<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> ABOUT THE &ldquo;SxS PRO&rdquo; FORMAT<br style=\"margin: 0px; padding: 0px;\" /> <br style=\"margin: 0px; padding: 0px;\" /> SxS PRO (&ldquo;S-by-S&rdquo;) is a new nonlinear recording media.&nbsp;</p>\n\n<ul>\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Compatible with ExpressCard3/4 interface slot, which is common on modern Windows PCs and Macs</li>\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Uses PCI Express interface and achieves an extremely high \"read\" speed of up to 800 Mb/s</li>\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Large storage capacity: SBP-8 (8 GB) and SBP-16 (16 GB) memory cards are available. One SBP-8 (8 GB) memory card is supplied with the PMW-EX1</li>\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Can record up to 70 minutes of HD video and audio (using one 16-GB memory card)</li>\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Compact size: approx. 2.95&rdquo;x1.34\"x0.2&rdquo; (75&times;34&times;5mm) (excluding the projecting parts) - half the size of the older PC Card standard</li>\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Low power consumption</li>\n<li style=\"margin: 0px; padding: 0px;\">&nbsp;Highly reliable: can resist shocks (up to 1500 G) and vibrations (up to 15 G)</li>\n</ul>',1,3,1,0,NULL,NULL,NULL,NULL,NULL),(25,'<p>The Sony FS-100 offers the advantages of a large sensor (the same Super35 sized sensor as found in the Sony F3), records to SDHC cards in an AVCHD codec, and allows the use of interchangeable lenses via Sony\'s E-mount. The E-mount is adaptable to accomodate other lenses (check out our Zeiss ZF Nikon mount primes) or use our 18-55 E-mount zoom. Allows progressive slow and quick motion at full HD (1920x1080). Features a flip up LCD and offers HDMI or Component outputs for monitoring the uncompressed 4:2:2 signal.<br /> <br /> To help you get the right gear for your shoot, choose from our customizable package options.</p>','<p>The Sony FS-100 offers the advantages of a large sensor (the same Super35 sized sensor as found in the Sony F3), records to SDHC cards in an AVCHD codec, and allows the use of interchangeable lenses via Sony\'s E-mount. The E-mount is adaptable to accomodate other lenses (check out our Zeiss ZF Nikon mount primes) or use our 18-55 E-mount zoom. Allows progressive slow and quick motion at full HD (1920x1080). Features a flip up LCD and offers HDMI or Component outputs for monitoring the uncompressed 4:2:2 signal.<br /> <br /> To help you get the right gear for your shoot, choose from our customizable package options.</p>',1,3,1,0,NULL,NULL,NULL,NULL,NULL),(26,'<p>Sony\'s FS-700 features a Super 35 size CMOS sensor with excellent low light capabilities. The shallow NEX mount allows many other lens styles to be easily adapted to the camera. PL, Nikon, and Canon EOS (EF) adapters are available giving you the flexibility to use the glass that\'s right for your project and budget.<br /> <br /> The FS-700 offers a wide range of framerates and recording options. Record continuous AVCHD 1080p video at up to 60fps, or shoot bursts of 1080p video at 120 or 240fps. Lowering the resolution allows burst recording at up to 960fps. Footage is recorded to easy to find SDHC memory cards, or to Sony\'s optionalFMU (Flash Memory Unit not available from Ohio HD).<br /> <br /> The camera also features many pro industry standards, including both HDMI and 3G-HDSDI outputs, 2-XLR inputs, and built in switchable ND filters at 2, 4, and 8 stop increments.</p>','<p>Sony\'s FS-700 features a Super 35 size CMOS sensor with excellent low light capabilities. The shallow NEX mount allows many other lens styles to be easily adapted to the camera. PL, Nikon, and Canon EOS (EF) adapters are available giving you the flexibility to use the glass that\'s right for your project and budget.<br /> <br /> The FS-700 offers a wide range of framerates and recording options. Record continuous AVCHD 1080p video at up to 60fps, or shoot bursts of 1080p video at 120 or 240fps. Lowering the resolution allows burst recording at up to 960fps. Footage is recorded to easy to find SDHC memory cards, or to Sony\'s optionalFMU (Flash Memory Unit not available from Ohio HD).<br /> <br /> The camera also features many pro industry standards, including both HDMI and 3G-HDSDI outputs, 2-XLR inputs, and built in switchable ND filters at 2, 4, and 8 stop increments.</p>',1,3,1,0,NULL,NULL,NULL,NULL,NULL),(27,'<p>The RED&nbsp;Scarlet makes shooting 4K RAW possible on a smaller budget. Supports 5K RAW resolution for stills, and 4K RAW video recording at up to 30fps makes this a very robust, yet affordable camera. <br /> <br /> Available with PL or EF mount.</p>','<p>The RED&nbsp;Scarlet makes shooting 4K RAW possible on a smaller budget. Supports 5K RAW resolution for stills, and 4K RAW video recording at up to 30fps makes this a very robust, yet affordable camera. <br /> <br /> Available with PL or EF mount.</p>',1,5,5,0,NULL,NULL,NULL,NULL,NULL),(28,'<p>The Canon 5D Mk II, the DSLR that changed the industry.</p>','<p>The Canon 5D Mk II, the DSLR that changed the industry.</p>',1,3,4,0,NULL,NULL,NULL,NULL,NULL),(29,'<p>RED\'s new Epic camera introduces a ton of new features that you can utilize on your shoots. The large 5K sensor provides amazing resolution and leaves plenty of room for shot recomposition and image stabilization in post. Will shoot up to 300fps and can achieve high dynamic range with it\'s HDRx capabilities.<br /> <br /> Available in PL&nbsp;or EF&nbsp;mount.</p>','<p>RED\'s new Epic camera introduces a ton of new features that you can utilize on your shoots. The large 5K sensor provides amazing resolution and leaves plenty of room for shot recomposition and image stabilization in post. Will shoot up to 300fps and can achieve high dynamic range with it\'s HDRx capabilities.<br /> <br /> Available in PL&nbsp;or EF&nbsp;mount.</p>',1,3,5,0,NULL,NULL,NULL,NULL,NULL),(30,'<p>Simply the best. Alexa.</p>','<p>Simply the best. Alexa.</p>',3,3,6,0,NULL,NULL,NULL,NULL,NULL),(31,'<p>The Sony F3 inherits DNA from the F35, which has been used for years in high-end digital cinematography, as well as most of the features and file-based workflow capabilities of PMW-EX1R and EX3 XDCAM EX solid-state memory camcorders.The PMW-F3 is equipped with the newly developed Exmor&trade; Super 35 CMOS image sensor, PL lens mount, and SxS card for 1920 x 1080 full-HD recording.The PMW-F3 features future expandability, including RGB 4:4:4 baseband output with S-LOG gamma for external recording which means it can be used in an HDCAM-SR&trade; workflow. It also offers a 3D-LINK option, which allows two camcorders to be controlled simultaneously for 3D stereoscopic shooting.</p>','<p>The Sony F3 inherits DNA from the F35, which has been used for years in high-end digital cinematography, as well as most of the features and file-based workflow capabilities of PMW-EX1R and EX3 XDCAM EX solid-state memory camcorders.The PMW-F3 is equipped with the newly developed Exmor&trade; Super 35 CMOS image sensor, PL lens mount, and SxS card for 1920 x 1080 full-HD recording.The PMW-F3 features future expandability, including RGB 4:4:4 baseband output with S-LOG gamma for external recording which means it can be used in an HDCAM-SR&trade; workflow. It also offers a 3D-LINK option, which allows two camcorders to be controlled simultaneously for 3D stereoscopic shooting.</p>',1,3,1,0,NULL,NULL,NULL,NULL,NULL),(32,'<p>(2) GoProHD Hero Cameras<br /> (2) Water Resitant Housings<br /> (2) 16GB HCSD Cards<br /> USB , Composite, Component Cables<br /> Helmet, Roll Bar, Handle Bar, &amp; Suction Cup Mounts</p>\r\n<p>GoPro&rsquo;s HD Motorsports HERO is the world&rsquo;s highest performance 1080p HD on-board video and still photo camera. Professional quality 1080p, 960p, and 720p HD resolutions record at 30 frames per second (60 fps in 720p). &nbsp;The HD Motorsports HERO easily mounts to any helmet, motorcycle, ATV, car, plane, jet ski, boat, snowmobile or other vehicle. The camera&rsquo;s quick-release mounting design makes it easy to re-position the camera around your vehicle for professional quality HD video from several angles.</p>\r\n<p>Record up to 2.5 hours on a single charge and up to 4.5 hours total on a 16GB SD card.</p>\r\n<p>Included are mounts for two helmets and three vehicles, as well as a suction cup for maximum versatility and convenience. The housing is waterproof to 180&rsquo; / 60m.</p>\r\n<p>GoPro\'s obsession with sound has conquered the wind.&nbsp;At 85 mph on a motorcycle, you&rsquo;ll enjoy the throaty sound of your motor, not the wind. Inside even the quietest street cars, hear the pull of your motor...not the drone of the wind and road.</p>\r\n<p>Included is a 1100mAh rechargeable lithium-ion battery that lasts for up to 2.5 hours of constant recording. With optional accessories, you can also plug the camera into a wall outlet, cigarette lighter, or with any USB-compatible power adapter, wire it directly to your vehicle&rsquo;s electrical system. The battery will charge while you record.&nbsp;</p>\r\n<p>The camera can also shoot automatic 5MP photos at 2/5/10/30 and 60 second intervals during your drive or ride, hands free. Press the shutter button once and record up to 2.5 hours of poster-print quality photos.</p>\r\n<p>Waterproof to 180&rsquo; / 60m and protected from rocks and other hazards thanks to its removable polycarbonate housing.</p>\r\n<h2>Tech Specs:</h2>\r\n<p>&nbsp;</p>\r\n<h3>Camera Optics</h3>\r\n<ul>\r\n<li>Lens Type: Fixed Focus (2ft/.6m &ndash; &infin;), glass</li>\r\n<li>Aperture: f/2.8 (high performance in low-light situations)</li>\r\n<li>Angle of View: 170&ordm; ultra wide angle in WVGA, 720p, or 960p mode</li>\r\n<li>Angle of View: 127&ordm; wide angle in 1080p mode</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<h3>Video</h3>\r\n<ul>\r\n<li>HD Video Resolution Modes: (subject to change, pending final firmware release)<br />\r\n<ul>\r\n<li><strong>1080p</strong> = 1920x1080 pixels (16:9), 30 fps, 15 Mbit/s data rate</li>\r\n<li><strong>960p</strong> = 1280x960 pixels (4:3), 30 fps, 12 Mbit/s data rate</li>\r\n<li><strong>720p</strong> = 1280x720 pixels (16:9), 60 fps, 15 Mbit/s data rate</li>\r\n<li><strong>720p</strong> = 1280x720 pixels (16:9), 30 fps, 8 Mbit/s data rate</li>\r\n<li><strong>WVGA</strong> = 848x480 pixels (16:9), 60 fps, 8 Mbit/s data rate</li>\r\n</ul>\r\n</li>\r\n<li>Sensor Type: 1/2.5\" HD CMOS, 2.2&micro;m-sized pixels</li>\r\n<li>Light Sensitivity: Super low-light sensitivity (&gt;1.4 V/lux-sec)</li>\r\n<li>Video Format: H.264 compression, saved as Windows- &amp; Mac-compatible MPEG4 (.mp4) file</li>\r\n<li>Exposure Control: Auto with user selectable center weighted average and spot metering settings</li>\r\n<li>White Balance: Auto</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<h3>Audio</h3>\r\n<ul>\r\n<li>Microphone: Built-in, mono with AGC (automatic gain control)</li>\r\n<li>Audio Format: 48 kHz, AAC audio compression</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<h3>Photo</h3>\r\n<ul>\r\n<li>Resolution: 5 megapixel</li>\r\n<li>Capture Modes: Single shot, photo every 2, 5, 10, 30 or 60 secs.; 3 photo burst; self-timer</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<h3>Storage</h3>\r\n<ul>\r\n<li>Memory: SD card, up to 32GB capacity (SDHC)</li>\r\n<li>Average recording times (using 32GB SD card):\r\n<ul>\r\n<li>1080p (30 fps): 4h 21m</li>\r\n<li>960p (30 fps): 5h 26m</li>\r\n<li>720p (60 fps): 4h 21</li>\r\n<li>720p (30 fps): 8h 09m</li>\r\n<li>WVGA (60 fps): 8h 09m</li>\r\n</ul>\r\n</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<h3>Camera Connectors &amp; Cables</h3>\r\n<ul>\r\n<li>PC Connection: USB 2.0 (data connection and battery charging)</li>\r\n<li>HDTV Out: HD NTSC &amp; PAL (component cable incl.)</li>\r\n<li>Audio Out: Combo 2.5mm jack with stereo audio and composite video out</li>\r\n<li>PC Compatibility: Windows&reg; Vista or Windows&reg; 7; Mac OS&reg; X 10.4.11 and later</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<h3>Power &amp; Battery</h3>\r\n<ul>\r\n<li>Battery Type: Rechargeable 1100 mAh lithium-ion</li>\r\n<li>Battery Life: Approx. 2.5 hrs</li>\r\n<li>Charging: via USB to computer or optional power adapter</li>\r\n<li>Charge Time: 80% capacity after 1 hour with optional power adapter; or 2 hours with a computer&rsquo;s USB port</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<h3>Waterproof Camera Housing</h3>\r\n<ul>\r\n<li>Depth Rating: Up to 180 feet / 60 meters</li>\r\n<li>Construction: Polycarbonate and stainless steel</li>\r\n<li>Hardware: Stainless steel</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<h3>Size &amp; Weight</h3>\r\n<ul>\r\n<li>Dimensions (H x W x D): 1.6&rdquo; x 2.4&rdquo; x 1.2&rdquo; (42mm x 60mm x 30mm)</li>\r\n<li>Weight: 3.3oz (94g) incl. battery, 5.9oz (167g) incl. housing</li>\r\n</ul>','<p>(2) GoProHD Hero Cameras<br /> (2) Water Resitant Housings<br /> (2) 16GB HCSD Cards<br /> USB , Composite, Component Cables<br /> Helmet, Roll Bar, Handle Bar, &amp; Suction Cup Mounts</p>\n\n<p>GoPro&rsquo;s HD Motorsports HERO is the world&rsquo;s highest performance 1080p HD on-board video and still photo camera. Professional quality 1080p, 960p, and 720p HD resolutions record at 30 frames per second (60 fps in 720p). &nbsp;The HD Motorsports HERO easily mounts to any helmet, motorcycle, ATV, car, plane, jet ski, boat, snowmobile or other vehicle. The camera&rsquo;s quick-release mounting design makes it easy to re-position the camera around your vehicle for professional quality HD video from several angles.</p>\n\n<p>Record up to 2.5 hours on a single charge and up to 4.5 hours total on a 16GB SD card.</p>\n\n<p>Included are mounts for two helmets and three vehicles, as well as a suction cup for maximum versatility and convenience. The housing is waterproof to 180&rsquo; / 60m.</p>\n\n<p>GoPro\'s obsession with sound has conquered the wind.&nbsp;At 85 mph on a motorcycle, you&rsquo;ll enjoy the throaty sound of your motor, not the wind. Inside even the quietest street cars, hear the pull of your motor...not the drone of the wind and road.</p>\n\n<p>Included is a 1100mAh rechargeable lithium-ion battery that lasts for up to 2.5 hours of constant recording. With optional accessories, you can also plug the camera into a wall outlet, cigarette lighter, or with any USB-compatible power adapter, wire it directly to your vehicle&rsquo;s electrical system. The battery will charge while you record.&nbsp;</p>\n\n<p>The camera can also shoot automatic 5MP photos at 2/5/10/30 and 60 second intervals during your drive or ride, hands free. Press the shutter button once and record up to 2.5 hours of poster-print quality photos.</p>\n\n<p>Waterproof to 180&rsquo; / 60m and protected from rocks and other hazards thanks to its removable polycarbonate housing.</p>\n\n<h2>Tech Specs:</h2>\n\n<p>&nbsp;</p>\n\n<h3>Camera Optics</h3>\n\n<ul>\n<li>Lens Type: Fixed Focus (2ft/.6m &ndash; &infin;), glass</li>\n<li>Aperture: f/2.8 (high performance in low-light situations)</li>\n<li>Angle of View: 170&ordm; ultra wide angle in WVGA, 720p, or 960p mode</li>\n<li>Angle of View: 127&ordm; wide angle in 1080p mode</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<h3>Video</h3>\n\n<ul>\n<li>HD Video Resolution Modes: (subject to change, pending final firmware release)<br />\n<ul>\n<li><strong>1080p</strong> = 1920x1080 pixels (16:9), 30 fps, 15 Mbit/s data rate</li>\n<li><strong>960p</strong> = 1280x960 pixels (4:3), 30 fps, 12 Mbit/s data rate</li>\n<li><strong>720p</strong> = 1280x720 pixels (16:9), 60 fps, 15 Mbit/s data rate</li>\n<li><strong>720p</strong> = 1280x720 pixels (16:9), 30 fps, 8 Mbit/s data rate</li>\n<li><strong>WVGA</strong> = 848x480 pixels (16:9), 60 fps, 8 Mbit/s data rate</li>\n</ul>\n</li>\n<li>Sensor Type: 1/2.5\" HD CMOS, 2.2&micro;m-sized pixels</li>\n<li>Light Sensitivity: Super low-light sensitivity (&gt;1.4 V/lux-sec)</li>\n<li>Video Format: H.264 compression, saved as Windows- &amp; Mac-compatible MPEG4 (.mp4) file</li>\n<li>Exposure Control: Auto with user selectable center weighted average and spot metering settings</li>\n<li>White Balance: Auto</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<h3>Audio</h3>\n\n<ul>\n<li>Microphone: Built-in, mono with AGC (automatic gain control)</li>\n<li>Audio Format: 48 kHz, AAC audio compression</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<h3>Photo</h3>\n\n<ul>\n<li>Resolution: 5 megapixel</li>\n<li>Capture Modes: Single shot, photo every 2, 5, 10, 30 or 60 secs.; 3 photo burst; self-timer</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<h3>Storage</h3>\n\n<ul>\n<li>Memory: SD card, up to 32GB capacity (SDHC)</li>\n<li>Average recording times (using 32GB SD card):\n<ul>\n<li>1080p (30 fps): 4h 21m</li>\n<li>960p (30 fps): 5h 26m</li>\n<li>720p (60 fps): 4h 21</li>\n<li>720p (30 fps): 8h 09m</li>\n<li>WVGA (60 fps): 8h 09m</li>\n</ul>\n</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<h3>Camera Connectors &amp; Cables</h3>\n\n<ul>\n<li>PC Connection: USB 2.0 (data connection and battery charging)</li>\n<li>HDTV Out: HD NTSC &amp; PAL (component cable incl.)</li>\n<li>Audio Out: Combo 2.5mm jack with stereo audio and composite video out</li>\n<li>PC Compatibility: Windows&reg; Vista or Windows&reg; 7; Mac OS&reg; X 10.4.11 and later</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<h3>Power &amp; Battery</h3>\n\n<ul>\n<li>Battery Type: Rechargeable 1100 mAh lithium-ion</li>\n<li>Battery Life: Approx. 2.5 hrs</li>\n<li>Charging: via USB to computer or optional power adapter</li>\n<li>Charge Time: 80% capacity after 1 hour with optional power adapter; or 2 hours with a computer&rsquo;s USB port</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<h3>Waterproof Camera Housing</h3>\n\n<ul>\n<li>Depth Rating: Up to 180 feet / 60 meters</li>\n<li>Construction: Polycarbonate and stainless steel</li>\n<li>Hardware: Stainless steel</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<h3>Size &amp; Weight</h3>\n\n<ul>\n<li>Dimensions (H x W x D): 1.6&rdquo; x 2.4&rdquo; x 1.2&rdquo; (42mm x 60mm x 30mm)</li>\n<li>Weight: 3.3oz (94g) incl. battery, 5.9oz (167g) incl. housing</li>\n</ul>',1,3,7,0,NULL,NULL,NULL,NULL,NULL),(33,'<ul>\r\n<li>This full 2/3\" DVCPRO HD camcorder records pristine 100Mbps HD images in any of 11 video formats, encompassing 60Hz and 50Hz production.</li>\r\n<li>Full-size 2/3\" CCD block provides superb low-light performance and compatibility with all manufacturers 2/3\" lenses for ENG, EFP and digital cinema production</li>\r\n<li>Multi-format recording system that supports 1080 at 59.94i, 50i, 29.97p, 25p, 23.98p, 23.98pA and 720 at 59.94p, 50p, 29.97p, 25p, 23.98p</li>\r\n<li>14-bit A/D DSP circuits that provide optimum picture quality, color reproduction and luminance gradation.</li>\r\n<li>Superior 4:2:2 color sampling and independent frame compression.</li>\r\n<li>Records for 33 minutes on a DVCPRO medium-size cassette with 48kHz/16-bit digital audio on all four channels.</li>\r\n<li>Three CineGammaTM modes to replicate the look and feel of film.</li>\r\n<li>Built-in IEEE 1394 digital output for firestore recording.</li>\r\n<li>Standard HD SDI output is included for monitoring and line recording.</li>\r\n<li>Built-in downconverter produces a SD output, allowing the use of low-cost SDI accessories.</li>\r\n<li>Two 4-position optical filters (ND: clear, 1/4, 1/16, 1/64; CC: Cross, 3200K, 4300k and 6300K)</li>\r\n<li>Electronic shutter (1/100 to 1/2000 sec.) with synchro scan shutter (1/60.3 to 1/249.8 sec.)</li>\r\n<li>Teams with Panasonic\'s new AJ-HD1400 compact DVCPRO HD VTR to form at high-performance, mobile acquisition-through-editing system.</li>\r\n</ul>\r\n<p>&nbsp;</p>','<ul>\n<li>This full 2/3\" DVCPRO HD camcorder records pristine 100Mbps HD images in any of 11 video formats, encompassing 60Hz and 50Hz production.</li>\n<li>Full-size 2/3\" CCD block provides superb low-light performance and compatibility with all manufacturers 2/3\" lenses for ENG, EFP and digital cinema production</li>\n<li>Multi-format recording system that supports 1080 at 59.94i, 50i, 29.97p, 25p, 23.98p, 23.98pA and 720 at 59.94p, 50p, 29.97p, 25p, 23.98p</li>\n<li>14-bit A/D DSP circuits that provide optimum picture quality, color reproduction and luminance gradation.</li>\n<li>Superior 4:2:2 color sampling and independent frame compression.</li>\n<li>Records for 33 minutes on a DVCPRO medium-size cassette with 48kHz/16-bit digital audio on all four channels.</li>\n<li>Three CineGammaTM modes to replicate the look and feel of film.</li>\n<li>Built-in IEEE 1394 digital output for firestore recording.</li>\n<li>Standard HD SDI output is included for monitoring and line recording.</li>\n<li>Built-in downconverter produces a SD output, allowing the use of low-cost SDI accessories.</li>\n<li>Two 4-position optical filters (ND: clear, 1/4, 1/16, 1/64; CC: Cross, 3200K, 4300k and 6300K)</li>\n<li>Electronic shutter (1/100 to 1/2000 sec.) with synchro scan shutter (1/60.3 to 1/249.8 sec.)</li>\n<li>Teams with Panasonic\'s new AJ-HD1400 compact DVCPRO HD VTR to form at high-performance, mobile acquisition-through-editing system.</li>\n</ul>\n\n<p>&nbsp;</p>',3,3,2,0,NULL,NULL,NULL,NULL,NULL),(34,'<p>The PDW-F800 camcorder is the newest member of the XDCAM family. It offers multi-format recording flexibility as standard - including SD recording and a frame rate of 23.98P in 1080 mode. It is equipped with three 2/3-inch type CCDs and a &ldquo;Power HAD FX&rdquo; progressive CCD with 1920 x 1080 effective pixels. Stunning-quality HD images can be captured by this high-resolution CCD and advanced digital signal. On top of the exceptional technology, the PDW-F800 offers very high quality HD recording at a data rate of up to 50Mbps using the MPEG-2 4:2:2P@HL compression. It also provides multi-format recording flexibility including 1080i, 720P and SD, which comes with HD/SD conversion and cross conversion between 1080i and 720P. With features such as Slow &amp; Quick Motion (over-crank and under-crank recording) make the PDW-F800 ideal for cinema and TV drama productions, as wel as ENG applications.</p>','<p>The PDW-F800 camcorder is the newest member of the XDCAM family. It offers multi-format recording flexibility as standard - including SD recording and a frame rate of 23.98P in 1080 mode. It is equipped with three 2/3-inch type CCDs and a &ldquo;Power HAD FX&rdquo; progressive CCD with 1920 x 1080 effective pixels. Stunning-quality HD images can be captured by this high-resolution CCD and advanced digital signal. On top of the exceptional technology, the PDW-F800 offers very high quality HD recording at a data rate of up to 50Mbps using the MPEG-2 4:2:2P@HL compression. It also provides multi-format recording flexibility including 1080i, 720P and SD, which comes with HD/SD conversion and cross conversion between 1080i and 720P. With features such as Slow &amp; Quick Motion (over-crank and under-crank recording) make the PDW-F800 ideal for cinema and TV drama productions, as wel as ENG applications.</p>',3,3,1,0,NULL,NULL,NULL,NULL,NULL),(35,'<p>Panasonic introduces an entirely new breed of DVCPRO50 camera-recorder. The AJ-SDX900 combines advanced DVCPRO and DVCPRO50 imaging technology &amp;emdash; acclaimed by ENG and other video professionals all over the world &amp;emdash; with a compact, lightweight body designed for easy mobility. In designing the AJ-SDX900, Panasonic solicited a host of feedback from video professionals. The result is a fully mobile unit that is ideally balanced, easy to maneuver, and rugged enough for the field. Image quality is excellent thanks to a 2/3\" 520,000-pixel 3CCD imaging system with progressive scanning capability and a new 12-bit DSP circuit. A full-fledged DVCPRO50 recorder, the AJ-SDX900 offers high sensitivity, superb 4:2:2 video recording, and four audio channels. Operation is intuitive. A new digital super gain function (in cumulative mode) raises sensitivity even higher. A 24p or 30p progressive shooting mode combines with a cine-like gamma curve to create video that closely replicates the appearance and quality of film. The AJ-SDX900 is an outstanding solution in a wide range of applications, from production of TV programs, commercials,news gathering to music video clips.</p>','<p>Panasonic introduces an entirely new breed of DVCPRO50 camera-recorder. The AJ-SDX900 combines advanced DVCPRO and DVCPRO50 imaging technology &amp;emdash; acclaimed by ENG and other video professionals all over the world &amp;emdash; with a compact, lightweight body designed for easy mobility. In designing the AJ-SDX900, Panasonic solicited a host of feedback from video professionals. The result is a fully mobile unit that is ideally balanced, easy to maneuver, and rugged enough for the field. Image quality is excellent thanks to a 2/3\" 520,000-pixel 3CCD imaging system with progressive scanning capability and a new 12-bit DSP circuit. A full-fledged DVCPRO50 recorder, the AJ-SDX900 offers high sensitivity, superb 4:2:2 video recording, and four audio channels. Operation is intuitive. A new digital super gain function (in cumulative mode) raises sensitivity even higher. A 24p or 30p progressive shooting mode combines with a cine-like gamma curve to create video that closely replicates the appearance and quality of film. The AJ-SDX900 is an outstanding solution in a wide range of applications, from production of TV programs, commercials,news gathering to music video clips.</p>',3,3,2,0,NULL,NULL,NULL,NULL,NULL),(36,'<p>The AG-HPX500 P2 HD shoulder-mount camcorder delivers a unique combination of high-end features never offered in a camcorder in this genre, including production-quality 2/3\" progressive 3-CCDs, DVCPRO HD quality, multi HD and SD formats, variable frame rates, and four independent audio channels. In addition, the HPX500 offers the outstanding benefits of P2 solid state recording including ultra-fast IT workflow and no-moving-parts reliability, which makes the camera ideal for use in harsh environments.<br /> <br /> At only 8.2 pounds, the HPX500 features a high-performance digital signal processor (DSP) with 14-bit A/D conversion and 19-bit processing that handles HD/SD format conversion simultaneously -- ensuring spectacular images in all video formats for applications ranging from news acquisition, independent filmmaking, corporate video, sports and much more. To give your productions tremendous flexibility, the HPX500 records in over 32 HD and SD formats. The camcorder records on re-usable, removable P2 cards. With Panasonic\'s new 16GB P2 card and HPX500\'s four P2 slots, the camera records for 68 minutes of DVCPRO HD; 136 minutes of DVCPRO 50; and 272 minutes of DVCPRO.</p>','<p>The AG-HPX500 P2 HD shoulder-mount camcorder delivers a unique combination of high-end features never offered in a camcorder in this genre, including production-quality 2/3\" progressive 3-CCDs, DVCPRO HD quality, multi HD and SD formats, variable frame rates, and four independent audio channels. In addition, the HPX500 offers the outstanding benefits of P2 solid state recording including ultra-fast IT workflow and no-moving-parts reliability, which makes the camera ideal for use in harsh environments.<br /> <br /> At only 8.2 pounds, the HPX500 features a high-performance digital signal processor (DSP) with 14-bit A/D conversion and 19-bit processing that handles HD/SD format conversion simultaneously -- ensuring spectacular images in all video formats for applications ranging from news acquisition, independent filmmaking, corporate video, sports and much more. To give your productions tremendous flexibility, the HPX500 records in over 32 HD and SD formats. The camcorder records on re-usable, removable P2 cards. With Panasonic\'s new 16GB P2 card and HPX500\'s four P2 slots, the camera records for 68 minutes of DVCPRO HD; 136 minutes of DVCPRO 50; and 272 minutes of DVCPRO.</p>',3,3,2,0,NULL,NULL,NULL,NULL,NULL),(37,'<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">720p / 1080p switchable</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">AVC-Intra 100, AVC-Intra 50 and DVCPRO HD codecs</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">AVC-Intra 100 provides master-quality, 4:2:2, 10-bit recording</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Offers choice of progressive/interlace HD video formats including 720 23.98p/24.00p/25p/29.97p / 50p / 59.94p, as well as 1080 23.98p/24.00p/25p/29.97p / 50i / 59.94i</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Variable frames (1 to 60fps) and 1080 23.98/24psf HD-SDI output (when in 1080 mode)</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">AVC-Intra compatibility with leading NLEs, including Apple Final Cut Pro 6, Autodesk, Avid Media Composer Family Version 3.0, Avid NewsCutter Family version 7.0 and Quantel</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">5-year limited warranty (1-year regular, plus 4 years extended upon registration)</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Scan reverse allows for anamorphic lens adapter use (to create a 2.35:1 aspect image for wide-screen cinematic shooting) or for use with an HD lens adaptor for 35mm lenses</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Dynamic Range Stretch to automatically suppress blocked shadows and blown highlights</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Chromatic Aberration Correction compensates for the inherent color deficiencies found in some lenses</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Advanced gamma settings including Film-Rec </span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">14-Bit Digital Processing with 12-Axis Color Correction</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">High F10 sensitivity at 2,000 lx, Minimum illumination of 0.021 lx (at 1 fps VFR and +30-dB gain-up)</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Electronic shutter that offers seven shutter speeds up to a maximum 1/2000 second (plus a Half mode) and unique angle settings (similar to a film camera)</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Proxy data recording available (with the optional AJ-YAX800G board)</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Newly-designed grip handle with five threaded holes for mounting accessories and a 3-point locking viewfinder mount for precise adjustment (color viewfinder compatible)</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">48-kHz/16-bit, four-channel digital audio recording</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Multiple system Interfaces, including three HD-SDI Outputs, USB 2.0 and down-converted SD video output and IEEE 1394 output (DVCPRO HD codec recording only)</span></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\r\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\r\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">A new color viewfinder, model AJ-CVF100, designed for both P2 HD VariCam camcorders is planned for release in early 2009</span></td>\r\n</tr>\r\n</tbody>\r\n</table>','<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">720p / 1080p switchable</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">AVC-Intra 100, AVC-Intra 50 and DVCPRO HD codecs</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">AVC-Intra 100 provides master-quality, 4:2:2, 10-bit recording</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Offers choice of progressive/interlace HD video formats including 720 23.98p/24.00p/25p/29.97p / 50p / 59.94p, as well as 1080 23.98p/24.00p/25p/29.97p / 50i / 59.94i</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Variable frames (1 to 60fps) and 1080 23.98/24psf HD-SDI output (when in 1080 mode)</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">AVC-Intra compatibility with leading NLEs, including Apple Final Cut Pro 6, Autodesk, Avid Media Composer Family Version 3.0, Avid NewsCutter Family version 7.0 and Quantel</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">5-year limited warranty (1-year regular, plus 4 years extended upon registration)</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Scan reverse allows for anamorphic lens adapter use (to create a 2.35:1 aspect image for wide-screen cinematic shooting) or for use with an HD lens adaptor for 35mm lenses</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Dynamic Range Stretch to automatically suppress blocked shadows and blown highlights</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Chromatic Aberration Correction compensates for the inherent color deficiencies found in some lenses</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Advanced gamma settings including Film-Rec </span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">14-Bit Digital Processing with 12-Axis Color Correction</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">High F10 sensitivity at 2,000 lx, Minimum illumination of 0.021 lx (at 1 fps VFR and +30-dB gain-up)</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Electronic shutter that offers seven shutter speeds up to a maximum 1/2000 second (plus a Half mode) and unique angle settings (similar to a film camera)</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Proxy data recording available (with the optional AJ-YAX800G board)</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Newly-designed grip handle with five threaded holes for mounting accessories and a 3-point locking viewfinder mount for precise adjustment (color viewfinder compatible)</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">48-kHz/16-bit, four-channel digital audio recording</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">Multiple system Interfaces, including three HD-SDI Outputs, USB 2.0 and down-converted SD video output and IEEE 1394 output (DVCPRO HD codec recording only)</span></td>\n</tr>\n<tr>\n<td class=\"words\" colspan=\"3\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"1\" height=\"3\" /></td>\n</tr>\n<tr>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">&bull;</span></td>\n<td class=\"words\" valign=\"top\"><img src=\"http://catalog2.panasonic.com/webapp/wcs/stores/wwwsystems/images/template/spacer.gif\" border=\"0\" alt=\"\" width=\"8\" height=\"1\" /></td>\n<td class=\"words\" valign=\"top\"><span style=\"font-size: small;\">A new color viewfinder, model AJ-CVF100, designed for both P2 HD VariCam camcorders is planned for release in early 2009</span></td>\n</tr>\n</tbody>\n</table>',3,3,2,0,NULL,NULL,NULL,NULL,NULL),(38,'<p>This is a complete outdoor timelapse package built by Harbortronics. Contains a Canon Rebel XS, Digisnap Intervelometer, and large battery contained inside a weatherproof housing. An attached solar panel can recharge the battery throughout the day making it a great option for long-term projects.</p>','<p>This is a complete outdoor timelapse package built by Harbortronics. Contains a Canon Rebel XS, Digisnap Intervelometer, and large battery contained inside a weatherproof housing. An attached solar panel can recharge the battery throughout the day making it a great option for long-term projects.</p>',3,3,4,0,NULL,NULL,NULL,NULL,NULL),(39,'<p>This innovative new camera utilizes light field technology to revolutionize the way pictures are taken. The lytro allows you to snap a photo, and worry about focusing later. With the Lytro software you can load the stills you\'ve taken and click on the area of the image you\'d like to have in focus, and it refocuses before your eyes.<br /> <br /> The 8x zoom lens is rated at an F2.0 throughout the zoom range, allowing plenty of light through. The images are a square format, 1080x1080 resolution.&nbsp; Upload your images to lytro.com or your favorite social media network in an interactive format, allowing users to refocus where they like.<br /> <br /> Click on the image to try it out.<br /> <iframe src=\"http://pictures.lytro.com/lyt-11492186788871/pictures/49388/embed?token=7d793818-71fa-11e1-b767-12313922cd53\" frameborder=\"0\" width=\"400\" height=\"415\"></iframe> <br /> </p>','<p>This innovative new camera utilizes light field technology to revolutionize the way pictures are taken. The lytro allows you to snap a photo, and worry about focusing later. With the Lytro software you can load the stills you\'ve taken and click on the area of the image you\'d like to have in focus, and it refocuses before your eyes.<br /> <br /> The 8x zoom lens is rated at an F2.0 throughout the zoom range, allowing plenty of light through. The images are a square format, 1080x1080 resolution.&nbsp; Upload your images to lytro.com or your favorite social media network in an interactive format, allowing users to refocus where they like.<br /> <br /> Click on the image to try it out.<br /> <iframe src=\"http://pictures.lytro.com/lyt-11492186788871/pictures/49388/embed?token=7d793818-71fa-11e1-b767-12313922cd53\" frameborder=\"0\" width=\"400\" height=\"415\"></iframe> <br /> </p>',1,3,8,0,NULL,NULL,NULL,NULL,NULL),(40,'<p>The RED ONE redefined digital cinema upon its arrival, democratizing 4K&nbsp;capture and challenging the status quo.&nbsp;Utilizing an S35mm image plane, the RED ONE displays a natural depth of field from 2K to 4.5K resolutions. Seize every moment with the&nbsp;ability to capture anywhere from 1-120 fps onto&nbsp;high-speed RED CF or SSD media. Interchangeable lens mounts and free firmware updates keep the RED ONE versatile, letting you and your equipment thrive on the cutting edge. A revolution always starts with ONE.</p>','<p>The RED ONE redefined digital cinema upon its arrival, democratizing 4K&nbsp;capture and challenging the status quo.&nbsp;Utilizing an S35mm image plane, the RED ONE displays a natural depth of field from 2K to 4.5K resolutions. Seize every moment with the&nbsp;ability to capture anywhere from 1-120 fps onto&nbsp;high-speed RED CF or SSD media. Interchangeable lens mounts and free firmware updates keep the RED ONE versatile, letting you and your equipment thrive on the cutting edge. A revolution always starts with ONE.</p>',3,3,5,0,NULL,NULL,NULL,NULL,NULL),(41,'<p><span style=\"font-size: small;\">The AG-AF100 is the first professional 4/3\" large image video camcorder optimized for high-definition video recording. Targeted at the video and film production communities, the AF100 delivers the shallow depth of field and wider field of view of a large imager, with the flexibility and cost advantages of a handheld camcorder. The AF100 has the ability to use virtually any professional quality lens with the addition of an easily obtainable adapter.<br /> <br /> The AF-100 records to SDHC cards utiliing the AVCCAM codec.&nbsp; Uncompressed 4:2:2, 8-bit video is availalable through the HD-SDI and HDMI outputs and can be captured with NanoFlash or similar recorder.&nbsp; Variable framerates are available allowing for slow and fast motion effects.</span></p>','<p><span style=\"font-size: small;\">The AG-AF100 is the first professional 4/3\" large image video camcorder optimized for high-definition video recording. Targeted at the video and film production communities, the AF100 delivers the shallow depth of field and wider field of view of a large imager, with the flexibility and cost advantages of a handheld camcorder. The AF100 has the ability to use virtually any professional quality lens with the addition of an easily obtainable adapter.<br /> <br /> The AF-100 records to SDHC cards utiliing the AVCCAM codec.&nbsp; Uncompressed 4:2:2, 8-bit video is availalable through the HD-SDI and HDMI outputs and can be captured with NanoFlash or similar recorder.&nbsp; Variable framerates are available allowing for slow and fast motion effects.</span></p>',1,3,2,0,NULL,NULL,NULL,NULL,NULL),(42,'<p>The AF-S VR Nikon 200mm f/2G IF-ED offers a large aperture, superb clarity and immense potential with VR technology for shooting in low light conditions or from moving platforms. The 200mm f/2G VR IF-ED incorporates Super ED glass - more resilient than typical fluorite lenses, offering higher optical quality with exceptional consistency even at large apertures. With a maximum aperture of f/2 and Nikon\'s advanced VR technology, image blur caused by camera shake is eliminated, particularly when shooting in low-light conditions. This allows for shutter speeds up to three stops slower (8x), obtaining sharp, well exposed images.</p>','<p>The AF-S VR Nikon 200mm f/2G IF-ED offers a large aperture, superb clarity and immense potential with VR technology for shooting in low light conditions or from moving platforms. The 200mm f/2G VR IF-ED incorporates Super ED glass - more resilient than typical fluorite lenses, offering higher optical quality with exceptional consistency even at large apertures. With a maximum aperture of f/2 and Nikon\'s advanced VR technology, image blur caused by camera shake is eliminated, particularly when shooting in low-light conditions. This allows for shutter speeds up to three stops slower (8x), obtaining sharp, well exposed images.</p>',1,1,9,0,NULL,NULL,NULL,NULL,NULL),(43,'<p>Double the focal length of your PL lenses. Two stop loss of light.</p>','<p>Double the focal length of your PL lenses. Two stop loss of light.</p>',1,1,10,0,NULL,NULL,NULL,NULL,NULL),(44,'<h3>5 Lens Set Includes:</h3>\r\n<ul>\r\n<li>16mm T2.1 Close Focus</li>\r\n<li>24mm T2.1 Close Focus</li>\r\n<li>32mm T2.1 Close Focus</li>\r\n<li>50mm T2.1</li>\r\n<li>85mm T2.1</li>\r\n</ul>','<h3>5 Lens Set Includes:</h3>\n\n<ul>\n<li>16mm T2.1 Close Focus</li>\n<li>24mm T2.1 Close Focus</li>\n<li>32mm T2.1 Close Focus</li>\n<li>50mm T2.1</li>\n<li>85mm T2.1</li>\n</ul>',2,1,11,0,NULL,NULL,NULL,NULL,NULL),(45,'<h3>5 Lens Set Includes:</h3>\r\n<ul>\r\n<li>18mm T1.4 (MKII in ft.)</li>\r\n<li>25mm T1.4 (MKII in ft.)</li>\r\n<li>35mm T1.4 (MKII in ft.)</li>\r\n<li>50mm T1.4 (MKII in ft.)</li>\r\n<li>85mm T1.4 (MKII in ft.)</li>\r\n</ul>','<h3>5 Lens Set Includes:</h3>\n\n<ul>\n<li>18mm T1.4 (MKII in ft.)</li>\n<li>25mm T1.4 (MKII in ft.)</li>\n<li>35mm T1.4 (MKII in ft.)</li>\n<li>50mm T1.4 (MKII in ft.)</li>\n<li>85mm T1.4 (MKII in ft.)</li>\n</ul>',2,4,11,0,NULL,NULL,NULL,NULL,NULL),(46,'<ul>\r\n<li><span style=\"font-size: small;\">A lens incorporating Angenieux\'s latest optical and mechanical advances - destined to be the standard of the industry.<br /> </span></li>\r\n<li><span style=\"font-size: small;\">Demonstrates higher image quality in its class at all focal lengths<br /> </span></li>\r\n<li><span style=\"font-size: small;\">Highest aperture T3.5<br /> </span></li>\r\n<li><span style=\"font-size: small;\">Internal focus allows standard matte boxes and all front attachments<br /> </span></li>\r\n<li><span style=\"font-size: small;\">Large calibrated focus engraving availble in meters, feet, or both.<br /> </span></li>\r\n<li><span style=\"font-size: small;\">Eliminates&nbsp;camera noise<br /> </span></li>\r\n</ul>','<ul>\n<li><span style=\"font-size: small;\">A lens incorporating Angenieux\'s latest optical and mechanical advances - destined to be the standard of the industry.<br /> </span></li>\n<li><span style=\"font-size: small;\">Demonstrates higher image quality in its class at all focal lengths<br /> </span></li>\n<li><span style=\"font-size: small;\">Highest aperture T3.5<br /> </span></li>\n<li><span style=\"font-size: small;\">Internal focus allows standard matte boxes and all front attachments<br /> </span></li>\n<li><span style=\"font-size: small;\">Large calibrated focus engraving availble in meters, feet, or both.<br /> </span></li>\n<li><span style=\"font-size: small;\">Eliminates&nbsp;camera noise<br /> </span></li>\n</ul>',3,4,12,0,NULL,NULL,NULL,NULL,NULL),(47,'<p>The <strong>Canon CN-E 30-300mm T2.95-3.7 L SP PL Mount Cinema Zoom Lens</strong> is designed expressly for digital cinematography with cameras that have an APS-C or Super 35-equivalent sensor and a PL mount, including Canon\'s EOS C300&nbsp;PL. Featuring advanced optical technology designed by Canon, the lens is suitable for any capturing any size HD image up to and including 4K resolution.</p>\r\n<p>With a focal length range of 30-300mm, the 10x cinema zoom lens is designed to cover the longer end of the focal lengths typically required by cinematic productions, and its maximum telephoto length of 300mm puts it among the best in its class. (The other zoom lens in the line, the CN-E 14.5-60mm T2.6 L SP, covers the wider end.) Maximum aperture is a relatively fast T2.95 throughout much of its range, and the 11-blade iris enables a smooth bokeh for out-of-focus areas of the frame.</p>\r\n<p>The lens was designed with working professionals in mind, with easy-to-read focus, zoom, and iris markings engraved into angled surfaces on both sides of the lens, so you can read the setting from either side of a camera &ndash; or from behind it. Depending on the production\'s needs, focus markings can be switched from standard to metric. The lens facilitates manual operation that\'s subtle, smooth, precise, and repeatable. Control rings are designed to provide and maintain the proper amount of resistance so you can operate with a consistent torque. The focus rotation angle is about 300&deg;; for zoom, it\'s approximately 160&deg;.</p>\r\n<p>The CN-E 30-300mm T2.95-3.7 L SP lens complements the other lens in the line in more ways than just focal length range: Their shared 136mm front diameter, gear positions, and rotation angle make them almost \"hot-swappable\" when they\'re used with a shared matte box or follow focus.</p>','<p>The <strong>Canon CN-E 30-300mm T2.95-3.7 L SP PL Mount Cinema Zoom Lens</strong> is designed expressly for digital cinematography with cameras that have an APS-C or Super 35-equivalent sensor and a PL mount, including Canon\'s EOS C300&nbsp;PL. Featuring advanced optical technology designed by Canon, the lens is suitable for any capturing any size HD image up to and including 4K resolution.</p>\n\n<p>With a focal length range of 30-300mm, the 10x cinema zoom lens is designed to cover the longer end of the focal lengths typically required by cinematic productions, and its maximum telephoto length of 300mm puts it among the best in its class. (The other zoom lens in the line, the CN-E 14.5-60mm T2.6 L SP, covers the wider end.) Maximum aperture is a relatively fast T2.95 throughout much of its range, and the 11-blade iris enables a smooth bokeh for out-of-focus areas of the frame.</p>\n\n<p>The lens was designed with working professionals in mind, with easy-to-read focus, zoom, and iris markings engraved into angled surfaces on both sides of the lens, so you can read the setting from either side of a camera &ndash; or from behind it. Depending on the production\'s needs, focus markings can be switched from standard to metric. The lens facilitates manual operation that\'s subtle, smooth, precise, and repeatable. Control rings are designed to provide and maintain the proper amount of resistance so you can operate with a consistent torque. The focus rotation angle is about 300&deg;; for zoom, it\'s approximately 160&deg;.</p>\n\n<p>The CN-E 30-300mm T2.95-3.7 L SP lens complements the other lens in the line in more ways than just focal length range: Their shared 136mm front diameter, gear positions, and rotation angle make them almost \"hot-swappable\" when they\'re used with a shared matte box or follow focus.</p>',1,1,4,0,NULL,NULL,NULL,NULL,NULL),(48,'<p>Duclos Lenses has developed a conversion process for the Tokina 11-16mm ultra-wide angle lens. Most obvious is the PL mount that interfaces with any PL mount camera including the RED One. More subtle yet most important is the activated manual aperture control. Lubricated, geared, and marked, the new aperture ring allows precise control for the user. The outer shell of the lens has been replaced with black anodized aluminum. Internal components are refined and reenforced. The final product is a small, lightweight lens perfectly capable of holding it&rsquo;s own against the likes of other motion picture optics.<span class=\"style_1\"><br /> <br /> Specs</span>:<br /> Focal Length:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11-16mm<br /> Max. Aperture:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; T2.8<br /> Min. Aperture:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; T32<br /> Angle of View:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 104&deg;-82&deg;<br /> Min. Focus Dist:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.3m / 1ft<br /> Image Circle:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 38-32mm<span class=\"style_1\" style=\"line-height: 12.8566px;\"><br /> <br /> Features</span>:<br /> Aluminum housing<br /> Stainless steel PL mount<br /> Geared zoom focus and iris<br /> 80mm front diameter<br /> 77mm filter thread<br /> Compact/lightweigh</p>','<p>Duclos Lenses has developed a conversion process for the Tokina 11-16mm ultra-wide angle lens. Most obvious is the PL mount that interfaces with any PL mount camera including the RED One. More subtle yet most important is the activated manual aperture control. Lubricated, geared, and marked, the new aperture ring allows precise control for the user. The outer shell of the lens has been replaced with black anodized aluminum. Internal components are refined and reenforced. The final product is a small, lightweight lens perfectly capable of holding it&rsquo;s own against the likes of other motion picture optics.<span class=\"style_1\"><br /> <br /> Specs</span>:<br /> Focal Length:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11-16mm<br /> Max. Aperture:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; T2.8<br /> Min. Aperture:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; T32<br /> Angle of View:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 104&deg;-82&deg;<br /> Min. Focus Dist:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.3m / 1ft<br /> Image Circle:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 38-32mm<span class=\"style_1\" style=\"line-height: 12.8566px;\"><br /> <br /> Features</span>:<br /> Aluminum housing<br /> Stainless steel PL mount<br /> Geared zoom focus and iris<br /> 80mm front diameter<br /> 77mm filter thread<br /> Compact/lightweigh</p>',1,1,8,0,NULL,NULL,NULL,NULL,NULL),(49,'<p>Fujinon\'s Cabrio 19-90 PL T/2.8 zoom brings ENG style shooting to the world of large sensor digital video. Its light weight and detachable powered zoom rocker lets you comfortable shoulder a camera like the ARRI Alexa or Sony F3 with the control of a zoom rocker at your fingertips. Back focus adjustment is available on the lens to ensure proper lens calibration throughout your shoot. A 95mm front allows the use of many of the same lens accessories (clip-on sunshades / ring lights / etc) as standard ENG lenses.</p>\r\n<p>Remove the zoom rocker and you have a full featured cine zoom that covers the RED Epic\'s full frame 5K sensor. The .08 focus gearing and 200-degree focus rotation means you\'ll have precise focus marks with any cine follow focus. LDS and i/data connection pins will relay communicate with supporting cameras as well.</p>\r\n<p>Whether you\'re shooting handheld in a run and gun situation, or performing intricate dolly moves in a studio, the Cabrio 19-90 will keep up to the challenge.</p>','<p>Fujinon\'s Cabrio 19-90 PL T/2.8 zoom brings ENG style shooting to the world of large sensor digital video. Its light weight and detachable powered zoom rocker lets you comfortable shoulder a camera like the ARRI Alexa or Sony F3 with the control of a zoom rocker at your fingertips. Back focus adjustment is available on the lens to ensure proper lens calibration throughout your shoot. A 95mm front allows the use of many of the same lens accessories (clip-on sunshades / ring lights / etc) as standard ENG lenses.</p>\n\n<p>Remove the zoom rocker and you have a full featured cine zoom that covers the RED Epic\'s full frame 5K sensor. The .08 focus gearing and 200-degree focus rotation means you\'ll have precise focus marks with any cine follow focus. LDS and i/data connection pins will relay communicate with supporting cameras as well.</p>\n\n<p>Whether you\'re shooting handheld in a run and gun situation, or performing intricate dolly moves in a studio, the Cabrio 19-90 will keep up to the challenge.</p>',1,1,13,0,NULL,NULL,NULL,NULL,NULL),(50,'<ul>\r\n<li>Canon HJ16x8 BIASD</li>\r\n<li>High Definition lens with 2x extender.</li>\r\n<li>Built-in servo focus motor</li>\r\n</ul>','<ul>\n<li>Canon HJ16x8 BIASD</li>\n<li>High Definition lens with 2x extender.</li>\n<li>Built-in servo focus motor</li>\n</ul>',1,1,4,0,NULL,NULL,NULL,NULL,NULL),(52,'<ul>\r\n<li>HJ11ex4.7B IRSE/IASE</li>\r\n<li>Super Wide.</li>\r\n<li>Widest HDTV lens available.</li>\r\n<li>2x Extender</li>\r\n<li>Digital Drive Unit.</li>\r\n<li>X-Element &amp; Power Optical System.</li>\r\n<li>Equipped with Canon\'s original Rotary Encoder Device.</li>\r\n</ul>','<ul>\n<li>HJ11ex4.7B IRSE/IASE</li>\n<li>Super Wide.</li>\n<li>Widest HDTV lens available.</li>\n<li>2x Extender</li>\n<li>Digital Drive Unit.</li>\n<li>X-Element &amp; Power Optical System.</li>\n<li>Equipped with Canon\'s original Rotary Encoder Device.</li>\n</ul>',1,1,4,0,NULL,NULL,NULL,NULL,NULL),(53,'<p>Fujinon XA17X7.6BERM-M58B w/2X extender CAC lens</p>','<p>Fujinon XA17X7.6BERM-M58B w/2X extender CAC lens</p>',1,1,13,0,NULL,NULL,NULL,NULL,NULL),(54,'<p>Canon Wide Angle Lens 9x5.2 W/ 2X Extender</p>','<p>Canon Wide Angle Lens 9x5.2 W/ 2X Extender</p>',1,1,4,0,NULL,NULL,NULL,NULL,NULL),(55,'<p>The HDx Optical Adapter turns the B4 lens into a longer focal length lens, so that the relative depth of field expected for the larger sensor is achieved, while the usual field of view when the lens is mounted to a 2/3&rdquo; camera is maintained.<br /> <br /> All HDx Optical Adapters also optically correct for the different spectral alignments between three-chip prism block sensors, for which the B4-mount lenses were designed, and the single sensor of the large sensor cameras. HDx Optical Adapters are highly telecentric in design, delivering a bright, sharp image across the entire frame, with excellent color and contrast.</p>','<p>The HDx Optical Adapter turns the B4 lens into a longer focal length lens, so that the relative depth of field expected for the larger sensor is achieved, while the usual field of view when the lens is mounted to a 2/3&rdquo; camera is maintained.<br /> <br /> All HDx Optical Adapters also optically correct for the different spectral alignments between three-chip prism block sensors, for which the B4-mount lenses were designed, and the single sensor of the large sensor cameras. HDx Optical Adapters are highly telecentric in design, delivering a bright, sharp image across the entire frame, with excellent color and contrast.</p>',1,1,8,0,NULL,NULL,NULL,NULL,NULL),(56,'<p>Allows PL mount lenses to mount on Canon EOS&nbsp;bodies.</p>','<p>Allows PL mount lenses to mount on Canon EOS&nbsp;bodies.</p>',1,1,8,0,NULL,NULL,NULL,NULL,NULL),(57,'<p>Allows PL&nbsp;mount Lenses to be mounted to cameras with Micro 4/3rds lens mounts.&nbsp; Attached support bracket accepts 1/4\"-20 or 3/8\"-16 threaded bolts.</p>','<p>Allows PL&nbsp;mount Lenses to be mounted to cameras with Micro 4/3rds lens mounts.&nbsp; Attached support bracket accepts 1/4\"-20 or 3/8\"-16 threaded bolts.</p>',1,1,8,0,NULL,NULL,NULL,NULL,NULL),(58,'<p>Adapts Nikon mount lenses to be used with Micro 4/3rds mount bodies. Includes Iris Ring allowing for iris control on lenses that lack an iris ring. <br /> <br /> NOTE: Lenses which have a manual iris ring when mounted with this adapter must be mounted with Adapters iris ring set to O. Once mounted move the adapter\'s iris control from the O to o position. Otherwise full iris range won\'t be accessible via the lenses iris contro</p>','<p>Adapts Nikon mount lenses to be used with Micro 4/3rds mount bodies. Includes Iris Ring allowing for iris control on lenses that lack an iris ring. <br /> <br /> NOTE: Lenses which have a manual iris ring when mounted with this adapter must be mounted with Adapters iris ring set to O. Once mounted move the adapter\'s iris control from the O to o position. Otherwise full iris range won\'t be accessible via the lenses iris contro</p>',1,1,8,0,NULL,NULL,NULL,NULL,NULL),(59,'<p>Allows EOS&nbsp;style lenses to be mounted on Micro Four-Thirds camera bodies</p>','<p>Allows EOS&nbsp;style lenses to be mounted on Micro Four-Thirds camera bodies</p>',1,1,8,0,NULL,NULL,NULL,NULL,NULL),(60,'<p>Connects Nikon lenses to Sony E-Mount Cameras</p>','<p>Connects Nikon lenses to Sony E-Mount Cameras</p>',1,1,8,0,NULL,NULL,NULL,NULL,NULL),(61,'<p>Metabones active irisc controlling EOS to E-Mount. Electronic aperture, EXIF, image stabilization</p>','<p>Metabones active irisc controlling EOS to E-Mount. Electronic aperture, EXIF, image stabilization</p>',1,1,8,0,NULL,NULL,NULL,NULL,NULL),(62,'<p>The <strong>Fujinon ACM-21</strong> is a lens adapter for the 1/2\" CMOS chip PMW-EX3 camcorder. This adapter allows the 1/2\" chip camera to utilize high quality 2/3\" Fujinon lenses using the B-Mount.</p>\r\n<dl><dt>This adapter will work with the Sony PMW-EX3 with 1/2\" CMOS chips.Broadcast Lenses Broadcast lenses used with 2/3\" HD cameras feature optics and image depth that is at a much higher quality than lenses designed for 1/2\" camcorders. The upgrade in lens quality will upgrade the image to levels unprecedented in the 1/2\" chip realm.</dt></dl>','<p>The <strong>Fujinon ACM-21</strong> is a lens adapter for the 1/2\" CMOS chip PMW-EX3 camcorder. This adapter allows the 1/2\" chip camera to utilize high quality 2/3\" Fujinon lenses using the B-Mount.</p>\n\n<dl><dt>This adapter will work with the Sony PMW-EX3 with 1/2\" CMOS chips.Broadcast Lenses Broadcast lenses used with 2/3\" HD cameras feature optics and image depth that is at a much higher quality than lenses designed for 1/2\" camcorders. The upgrade in lens quality will upgrade the image to levels unprecedented in the 1/2\" chip realm.</dt></dl>',1,1,8,0,NULL,NULL,NULL,NULL,NULL),(63,'<div id=\"prodtab1\" style=\"display: block;\">\r\n<p><strong>EX 0.75X Aspheric Wide Converter</strong></p>\r\n<p>16x9 Inc. introduces the EX 0.75 Aspheric Wide Converter&mdash;<strong>the first wide converter to bring the benefits of aspheric technology to DV and HDV cameras.</strong> The top-quality optical solution for getting wider angle images from Sony\'s popular new PMW-EX1 and EX3 camcorders, <strong>the EX 0.75X provides a 25% greater angle of view while maintaining full zoom capability.</strong></p>\r\n<p><strong>Aspheric Technology<br /> </strong>The EX 0.75\'s innovative, advanced technical design employs a state-of-the-art aspheric lens element to more effectively reduce geometric distortion and chromatic aberrations and improve off-axis wide angle performance. Utilization of the aspheric lens surface allows the other elements of the converter to be smaller and lighter&mdash;without it, the spheric elements would have to be larger to achieve the same level of performance. This helps keep the unit\'s size and weight at a minimum, making it especially well suited for handheld work. The EX 0.75X contains a total of four multi-coated optical glass elements&mdash;including the asphere lens&mdash;that combine to yield clean and vivid, high definition images.</p>\r\n<p><strong>Bayonet Mount<br /> </strong>This lightweight, compact optical accessory attaches securely to the front of the EX1 and EX3 via a convenient bayonet mount. Installation and removal is quick and easy. For professional shading and light control, the Aspheric Wide Converter is fully compatible with the HU-104 Rubber Lens Shade. Attaching firmly to the front of the converter through a handy quick-lock mechanism, 16x9 Inc.\'s rugged, broadcast-style shade is designed to hold a 105mm round filter. In addition, the EX 0.75X interfaces beautifully with popular mattebox and sunshade systems such as those from Chrosziel.</p>\r\n<p><strong>Meticulous &amp; Detailed Craftsmanship</strong><br /> Like all of 16x9 Inc.\'s 16x9 Inc.\'s HD-quality EX lens accessories, the new EX 0.75X is precision engineered and manufactured for optimum optical performance. Craftsmanship is meticulous and detailed, using only the finest grade materials.</p>\r\n</div>','<div id=\"prodtab1\" style=\"display: block;\">\n<p><strong>EX 0.75X Aspheric Wide Converter</strong></p>\n<p>16x9 Inc. introduces the EX 0.75 Aspheric Wide Converter&mdash;<strong>the first wide converter to bring the benefits of aspheric technology to DV and HDV cameras.</strong> The top-quality optical solution for getting wider angle images from Sony\'s popular new PMW-EX1 and EX3 camcorders, <strong>the EX 0.75X provides a 25% greater angle of view while maintaining full zoom capability.</strong></p>\n<p><strong>Aspheric Technology<br /> </strong>The EX 0.75\'s innovative, advanced technical design employs a state-of-the-art aspheric lens element to more effectively reduce geometric distortion and chromatic aberrations and improve off-axis wide angle performance. Utilization of the aspheric lens surface allows the other elements of the converter to be smaller and lighter&mdash;without it, the spheric elements would have to be larger to achieve the same level of performance. This helps keep the unit\'s size and weight at a minimum, making it especially well suited for handheld work. The EX 0.75X contains a total of four multi-coated optical glass elements&mdash;including the asphere lens&mdash;that combine to yield clean and vivid, high definition images.</p>\n<p><strong>Bayonet Mount<br /> </strong>This lightweight, compact optical accessory attaches securely to the front of the EX1 and EX3 via a convenient bayonet mount. Installation and removal is quick and easy. For professional shading and light control, the Aspheric Wide Converter is fully compatible with the HU-104 Rubber Lens Shade. Attaching firmly to the front of the converter through a handy quick-lock mechanism, 16x9 Inc.\'s rugged, broadcast-style shade is designed to hold a 105mm round filter. In addition, the EX 0.75X interfaces beautifully with popular mattebox and sunshade systems such as those from Chrosziel.</p>\n<p><strong>Meticulous &amp; Detailed Craftsmanship</strong><br /> Like all of 16x9 Inc.\'s 16x9 Inc.\'s HD-quality EX lens accessories, the new EX 0.75X is precision engineered and manufactured for optimum optical performance. Craftsmanship is meticulous and detailed, using only the finest grade materials.</p>\n</div>',1,1,8,0,NULL,NULL,NULL,NULL,NULL),(64,'<p>Lens Baby Composer with Aperture Disc Tool, Aperture Discs(2.8,4f,5.6f,8f,11f,16f,22f), Pinhole Zone Plate, Single Glass, Double Glass, Plastic, .42x Super Wide Lens, .6x Wide Lens, 1.6x Telephoto Lens, +4 Macro,+10 Macro, Creative Aperture Kit</p>','<p>Lens Baby Composer with Aperture Disc Tool, Aperture Discs(2.8,4f,5.6f,8f,11f,16f,22f), Pinhole Zone Plate, Single Glass, Double Glass, Plastic, .42x Super Wide Lens, .6x Wide Lens, 1.6x Telephoto Lens, +4 Macro,+10 Macro, Creative Aperture Kit</p>',1,1,8,0,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=397 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_baseindierentalproduct_crossSell`
--

LOCK TABLES `products_baseindierentalproduct_crossSell` WRITE;
/*!40000 ALTER TABLE `products_baseindierentalproduct_crossSell` DISABLE KEYS */;
INSERT INTO `products_baseindierentalproduct_crossSell` VALUES (284,1,29),(285,1,30),(283,1,40),(296,2,29),(297,2,30),(295,2,40),(338,3,29),(337,3,40),(323,6,8),(355,6,9),(380,6,10),(375,6,11),(324,7,8),(356,7,9),(376,7,11),(319,8,6),(320,8,7),(317,8,28),(318,8,29),(351,9,6),(352,9,7),(349,9,28),(350,9,29),(379,10,6),(371,11,6),(372,11,7),(369,11,28),(370,11,29),(385,13,28),(386,13,29),(391,15,41),(395,16,41),(321,28,8),(353,28,9),(373,28,11),(387,28,13),(287,29,1),(299,29,2),(340,29,3),(322,29,8),(354,29,9),(374,29,11),(388,29,13),(288,30,1),(300,30,2),(286,40,1),(298,40,2),(339,40,3),(392,41,15),(396,41,16);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_baseindierentalproduct_links`
--

LOCK TABLES `products_baseindierentalproduct_links` WRITE;
/*!40000 ALTER TABLE `products_baseindierentalproduct_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_baseindierentalproduct_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_brand`
--

DROP TABLE IF EXISTS `products_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_brand`
--

LOCK TABLES `products_brand` WRITE;
/*!40000 ALTER TABLE `products_brand` DISABLE KEYS */;
INSERT INTO `products_brand` VALUES (1,'Sony'),(2,'Panasonic'),(3,'Arri'),(4,'Canon'),(5,'Red'),(6,'Arri'),(7,'GoPro'),(8,'Other'),(9,'Nikon'),(10,'Schneider'),(11,'Zeiss'),(12,'Angenieux'),(13,'Fujinon'),(14,'Kino Flo'),(15,'Anton Bauer'),(16,'');
/*!40000 ALTER TABLE `products_brand` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_camera`
--

LOCK TABLES `products_camera` WRITE;
/*!40000 ALTER TABLE `products_camera` DISABLE KEYS */;
INSERT INTO `products_camera` VALUES (4),(5),(6),(7),(18),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_lens`
--

LOCK TABLES `products_lens` WRITE;
/*!40000 ALTER TABLE `products_lens` DISABLE KEYS */;
INSERT INTO `products_lens` VALUES (1),(2),(3),(8),(9),(10),(11),(13),(14),(15),(16),(42),(43),(44),(45),(46),(47),(48),(49),(50),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
-- Table structure for table `products_monitor`
--

DROP TABLE IF EXISTS `products_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_monitor` (
  `baseindierentalproduct_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`baseindierentalproduct_ptr_id`),
  CONSTRAINT `baseindierentalproduct_ptr_id_refs_product_ptr_id_525eb981` FOREIGN KEY (`baseindierentalproduct_ptr_id`) REFERENCES `products_baseindierentalproduct` (`product_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_monitor`
--

LOCK TABLES `products_monitor` WRITE;
/*!40000 ALTER TABLE `products_monitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_monitor` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_price_tier`
--

LOCK TABLES `products_price_tier` WRITE;
/*!40000 ALTER TABLE `products_price_tier` DISABLE KEYS */;
INSERT INTO `products_price_tier` VALUES (1,1,3,100),(2,3,7,43),(3,7,10,80),(4,10,14,75),(5,1,2,100),(6,2,3,50),(7,3,4,95);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_price_tier_package`
--

LOCK TABLES `products_price_tier_package` WRITE;
/*!40000 ALTER TABLE `products_price_tier_package` DISABLE KEYS */;
INSERT INTO `products_price_tier_package` VALUES (1,'Lensing Day Rate Package'),(3,'Video Camera Standard Rate'),(4,'Crazy Stupid Deal'),(5,'Full Price Always');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_price_tier_package_tier`
--

LOCK TABLES `products_price_tier_package_tier` WRITE;
/*!40000 ALTER TABLE `products_price_tier_package_tier` DISABLE KEYS */;
INSERT INTO `products_price_tier_package_tier` VALUES (3,1,1),(4,1,2),(5,1,3),(6,1,4),(19,3,1),(20,3,2),(11,4,5),(12,4,6),(13,4,7),(14,5,1);
/*!40000 ALTER TABLE `products_price_tier_package_tier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_productimage`
--

DROP TABLE IF EXISTS `products_productimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_productimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_productimage`
--

LOCK TABLES `products_productimage` WRITE;
/*!40000 ALTER TABLE `products_productimage` DISABLE KEYS */;
INSERT INTO `products_productimage` VALUES (1,'Panasonic AG-HMC150','<p>Side View</p>','products/bc69779c1680327327f2f2c5ae0b1dc5-aghmc150.jpg'),(2,'HMC 160','<p>Side View</p>','products/61e1450ee80cee1896648f9ff1d1861f-hmc160.jpg'),(3,'Front_Back','<p>Front and back 3/4 view of Canon C300</p>','products/454ede02d63ea86d47a92cff322be3ed-Canon-C300-Cinema-camera.jpg'),(4,'EX1-R','<p>Side view.</p>','products/af6a0237ef4d597b1ce7c60bc78a7463-SonyEX1R.jpg'),(5,'FS700','<p>Side view of the FS700</p>','products/5dc711fb5416c1db9e32cf888867017b-SonyFS700.jpg'),(6,'Sony FS100','<p>Side view of the FS100</p>','products/6546bdbb916e63ad74a6a065440dec4d-SonyNEX-FS100.jpg'),(7,'Canon 7D','<p>Front view of the Canon 7D.</p>','products/b1fbaf28796807bde48a07bccbff5863-Canon7D.jpg'),(8,'Sony Z7U Front','<p>Font view of the Sony Z7U</p>','products/6a7618090e3e55b569cc75930ccaff59-z7ufront.jpg'),(9,'Sony EX-3','<p>Side view of the Sony EX-3</p>','products/2559c3a54034bf65561813c3fa7a68f7-sony_ex3.jpg'),(10,'Red Scarlet Body','<p>Red Body</p>','products/976e6620f92463c658bce2d7f7939c3e-REDScarletX.jpg'),(11,'5D MkII','<p>Side view</p>','products/f336f81aac6898ce48f417f0a8f3edb0-Canon-5D-Mark-II-web.jpg'),(12,'Red Epic Body','<p>Epic Body Shot</p>','products/7a75708fd029d18992aa089b29194d3c-epic_package.png'),(13,'Alexa','<p>Beauty shot of the Alexa.</p>','products/ddf44291e449af00f6ca29e00e6847c1-Alexa-product-shot.jpg'),(14,'Sony F3','<p>Side View</p>','products/0ad9bb0dbc5b62f34ba79ab2a3c215fd-SonyF3.jpg'),(15,'GoPro','<p>GoPro Package</p>','products/384d903280016bffd119283d64c65852-gopro_peices.jpg'),(16,'HDX900','<p>Product shot of HDX900</p>','products/25919b4ac7473277a5a090f6c570da4d-HDX900banner.gif'),(17,'F800','<p>F800 Product shot.</p>','products/a0dbd728f8632dafdcd111b07f1e8e79-SonyPDWF800.jpg'),(18,'SDX900','<p>SDX900 Product Shot.</p>','products/3624187568153e665b9ed1ee9ff22ef6-Sdx900.jpg'),(19,'HPX500','<p>HPX500 Product Shot</p>','products/94556f65b26fdab65595f723d27c469d-aghpx500.jpg'),(20,'HPX2700','<p>HPX2700 Product Shot</p>','products/1ed4db974f26c6a7cc1f6d70b6ac3a3d-aj-hpx2700g.jpg'),(21,'Timelapse','<p>Timelapse Product Shot</p>','products/7b41817c46dd04caa3d970d86517e23c-Timelapse.jpg'),(22,'Lytro','<p>Light Field Camera Image</p>','products/be2a718eceacd332a3cc4f641b44c992-lytro-2-graphite.jpg'),(23,'Red One Body','<p>Red One Body Shot</p>','products/8413b7f0f68bbd07f93289982d835812-redone-camera.jpg'),(24,'Red One Rear','<p>Rear shot of the Red One</p>','products/79a38101337c994e50c7806d3a08da09-gallery_fullsize_7-1.png'),(25,'Af-100','<p>Af100 Product Shot</p>','products/b43252d874cf5ae08d6bd8076131258f-ag-af100_le.jpg'),(26,'Nikon 200mm','<p>Nikon 200mm F2 (PL)</p>','products/6ffb1e630a7f67007a2613a1dc34c5d7-nikon200.jpg'),(27,'2x Extender','<p>Schineider 2x Entender</p>','products/882806fe85d8bb43a9ccf6ee9771ce28-Schneider2xExtender.jpg'),(28,'Standard Speeds','<p>Zeiss Standard Speeds</p>','products/96e25077c334f339b8369ae37cb1bfad-superspeeds.jpg'),(29,'Super Speeds','<p>Zeiss Super Speeds</p>','products/ca64c472de773b11eb6a2cf80d101fc3-superspeeds.jpg'),(30,'Angenieux 25-250','<p>Angenieux 25-250</p>','products/9644e23922816fab4a7b520a195b7e2f-Angenieux.jpg'),(31,'Optimo 16-42','<p>Optimo 16-24 Product Shot</p>','products/000d0ac4f6c3a19487ca3a11534e6afc-optimo16-42.jpg'),(32,'Optimo 30-80','<p>Optimo 30-80</p>','products/e8d2eb80dea0b95116f7b957eaac136d-Optimo30_80-1.jpg'),(33,'24-70','<p>24-70</p>','products/a5fb3df4e003a2755224098c540e5f74-Canon24-70.jpg'),(34,'CP2','<p>CP2</p>','products/7c2788d2b5fb552e32833f36210ad9d3-ZeissCP2_5lens.jpg'),(35,'16-35','<p>16-35</p>','products/e68382cdf9e54811690e1a121c5d8e0b-canon16_35.jpg'),(36,'17-85','<p>17-85</p>','products/b88826ba2484538218f95dda023d71f4-canon17-85.jpg'),(37,'24-105','<p>24-105</p>','products/deb6c0c2ff91c5697f3fb0d5ddcac0eb-canon24-105.jpg'),(38,'70-200','<p>70-200</p>','products/60984a1f6848da849de4f1ea7a1161cd-canon70-200.jpg'),(39,'Zeiss ZF','<p>ZF</p>','products/6fd7ff1251ae032731d20951f1e1278c-droppedImage.png'),(40,'ZF2','<p>ZF2</p>','products/a2f781c67ad308ee7e9c7c4f97178133-zf2.png'),(41,'30-300','<p>30-300</p>','products/b9fda3a622e45e2b043d679f73ae24ae-Canon30_300PL.jpg'),(42,'11-16','<p>11-16</p>','products/0086c036d8fe362909ad17d4b5002641-Tokina_11-16.jpg'),(43,'19-90','<p>19-90</p>','products/ddbd193ad99178be28cf0eb1edcb52d0-FujiCabrio_19-90.jpg'),(44,'CanonHD Long','<p>Canon HD Long Lens</p>','products/cb9a9f48e732b818edeb9bd9ec4305f6-canon16x8HD-1.gif'),(46,'Canon HD Wide','<p>Canon HD Wide</p>','products/1ecb4b6b43f64491aae0590076a9d242-hj11x47bcanonlens.jpg'),(47,'17x7.6','<p>17x7.6</p>','products/c794487fa484b45b154db46f33b1c925-fugilens.jpg'),(48,'canon-9x52-23-sd','<p>Canon 9x5.2 2/3\" SD</p>','products/cea3dd0e7763871bca3f95a92762623f-wideangle.jpg'),(49,'Nikon to Canon','<p>Nikon to Canon Mount Adapter</p>','products/9744df86fa0256d3267374d337b87380-EOS_NIK_Adapter_Novoflex.jpg'),(50,'2x Extender','<p>2x Extender</p>','products/e3fb0baf54b2075d5a215a5f62d2e87a-HDx35_B4-PL.jpg'),(51,'PL to EOS','<p>PL to EOS</p>','products/9ade6c7c85c18f55c342fdcc563b0ad8-EOS_PL_Adapter.jpg'),(52,'PL to Micro','<p>PL to Micro</p>','products/9f8d5aea88690922da0ff93de1967cb5-MFT_PL_Adapter.jpg'),(53,'Nikon to 4/3','<p>Nikon to 4/3</p>','products/895e8745a2c804aae5a65cc0baf64eb0-MFT_NIK_adapter.jpg'),(54,'EOS to Micro 4/3\"','<p>EOS to Micro 4/3\"</p>','products/7185c3e7afdc8bb630b3b233a43e8dc3-MFT_EOS_Adapter.jpg'),(55,'Metabones Adapter','<p>Metabones Adapter</p>','products/0ec84a5d227b5e20436df16a6add02f4-EFII-a1.jpg'),(56,'2/3\" Lens Adapter for Sony PMW-EX3 Adapter','<p>2/3\" Lens Adapter for Sony PMW-EX3 Adapter</p>','products/7f3fb904134ecb5864d80b75f695b60c-acm21LensAdapterEX3.jpg'),(57,'EX1/EX3 Wide Angle Adapter','<p>EX1/EX3 Wide Angle Adapter</p>','products/41b2ea7d5c5659be5c26fe8e7eced6b0-EX3Wide.jpg'),(58,'Lensbaby Composer Kit','<p>Lensbaby Composer Kit</p>','products/5c83cc075d0a9a3fe4a20d55252aa68d-Lensbaby.jpg'),(59,'Dedolight','<p>Dedolight</p>','products/a78827d71d417ed841b210c8c6ef97aa-dedolight.jpg'),(60,'Kino Flo Kamio','<p>Kino Flo Kamio</p>','products/87301e3491d2a5224740f5fe56e0aa2e-kamio-system.jpg'),(61,'Reflecmedia LiteRing','<p>Reflecmedia LiteRing</p>','products/2510b61719dc1ac1ad3f4935fd981ccd-liteRingGreen.jpg');
/*!40000 ALTER TABLE `products_productimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_support`
--

DROP TABLE IF EXISTS `products_support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_support` (
  `baseindierentalproduct_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`baseindierentalproduct_ptr_id`),
  CONSTRAINT `baseindierentalproduct_ptr_id_refs_product_ptr_id_51a881c2` FOREIGN KEY (`baseindierentalproduct_ptr_id`) REFERENCES `products_baseindierentalproduct` (`product_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_support`
--

LOCK TABLES `products_support` WRITE;
/*!40000 ALTER TABLE `products_support` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_registrationprofile`
--

DROP TABLE IF EXISTS `registration_registrationprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_registrationprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `activation_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_id_refs_id_cecd7f3c` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_registrationprofile`
--

LOCK TABLES `registration_registrationprofile` WRITE;
/*!40000 ALTER TABLE `registration_registrationprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_registrationprofile` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_cart`
--

LOCK TABLES `shop_cart` WRITE;
/*!40000 ALTER TABLE `shop_cart` DISABLE KEYS */;
INSERT INTO `shop_cart` VALUES (1,NULL,'2012-07-21 21:40:03','2012-07-21 21:42:13'),(2,NULL,'2012-07-22 19:19:32','2012-07-22 19:19:32'),(3,NULL,'2012-07-25 01:52:56','2012-07-25 01:52:56'),(4,NULL,'2012-07-25 02:16:47','2012-07-25 03:18:19'),(6,1,'2012-07-27 01:57:36','2012-08-09 20:04:46'),(7,NULL,'2012-08-06 11:08:23','2012-08-06 11:08:23'),(8,NULL,'2012-08-09 15:25:44','2012-08-09 15:25:44');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_cartitem`
--

LOCK TABLES `shop_cartitem` WRITE;
/*!40000 ALTER TABLE `shop_cartitem` DISABLE KEYS */;
INSERT INTO `shop_cartitem` VALUES (1,1,4,6),(2,1,1,8),(3,2,1,6),(4,3,1,6),(5,4,4,6),(6,4,1,7),(9,8,1,5),(10,6,4,4);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product`
--

LOCK TABLES `shop_product` WRITE;
/*!40000 ALTER TABLE `shop_product` DISABLE KEYS */;
INSERT INTO `shop_product` VALUES (1,13,'Angenieux Optimo DP 16-42mm','angenieux-optimo-dp-16-42mm',1,'2012-07-17 18:16:37','2012-08-10 14:24:47',300.00),(2,13,'Angenieux Optimo DP 30-80mm','angenieux-optimo-dp-30-80mm',1,'2012-07-17 18:18:44','2012-08-10 14:25:37',300.00),(3,13,'Zeiss CP.2 Lens Set (PL)','zeiss-cp2-lens-set-pl',1,'2012-07-17 18:25:52','2012-08-10 14:34:07',325.00),(4,14,'Panasonic HMC150','panasonic-hmc150',1,'2012-07-17 19:00:30','2012-08-09 20:05:23',100.00),(5,14,'Panasonic HMC160','panasonic-hmc160',1,'2012-07-17 19:19:35','2012-08-09 18:40:35',200.00),(6,14,'Canon 7D','canon-7d',1,'2012-07-17 19:24:52','2012-08-09 18:40:46',125.00),(7,14,'Canon C300','canon-c300',1,'2012-07-17 19:26:38','2012-08-09 18:40:56',550.00),(8,13,'Canon 24-70 F/2.8 IS USM','canon-24-70-f28-usm',1,'2012-07-17 19:27:42','2012-08-10 14:32:25',75.00),(9,13,'Canon 16-35 F/2.8 L II USM','canon-16-35-f28-l-ii-usm',1,'2012-07-17 19:39:35','2012-08-10 14:35:58',75.00),(10,13,'Canon 17-85mm F/4-5.6 IS USM','canon-17-85mm-f4-56-usm',1,'2012-07-17 19:40:33','2012-08-10 14:46:12',25.00),(11,13,'Canon 24-105 F/4 USM','canon-24-105-f4-usm',1,'2012-07-17 19:41:34','2012-08-10 14:45:59',25.00),(13,13,'Canon 70-200mm F/2.8 IS II','canon-70-200mm-f28-ii',1,'2012-07-17 19:43:09','2012-08-10 14:47:50',75.00),(14,13,'Nikon to Canon Mount Adapter','nikon-canon-mount-adapter',1,'2012-07-17 19:47:20','2012-08-10 17:02:00',25.00),(15,13,'Zeiss ZF Prime Lens Set','zeiss-zf-prime-lens-set',1,'2012-07-17 19:51:12','2012-08-10 14:49:23',250.00),(16,13,'Zeiss ZF.2 Prime Lens Set','zeiss-zf2-prime-lens-set',1,'2012-07-17 19:52:58','2012-08-10 14:50:17',300.00),(18,14,'Sony EX1R','sony-ex1r',1,'2012-07-17 19:58:35','2012-08-09 18:41:53',350.00),(19,15,'Dedolight','dedolight',1,'2012-07-17 20:02:01','2012-08-10 18:59:36',45.00),(20,15,'Kino Flo Kamio 6E System','kino-flo-kamio-6e-system',0,'2012-07-17 20:02:35','2012-08-10 19:02:25',75.00),(21,15,'Reflecmedia LiteRing','reflecmedia-litering',0,'2012-07-17 20:03:09','2012-08-10 19:04:45',75.00),(22,15,'Sun Gun (Anton Bauer)','sun-gun-anton-bauer',0,'2012-07-17 20:03:53','2012-08-10 20:08:24',25.00),(23,14,'Sony HVR-Z7U','sony-hvr-z7u',1,'2012-07-17 20:09:07','2012-08-09 18:44:01',300.00),(24,14,'Sony EX-3','sony-ex-3',1,'2012-07-17 20:10:15','2012-08-09 18:46:39',350.00),(25,14,'Sony FS-100','sony-fs-100',1,'2012-07-17 20:12:04','2012-08-09 18:50:27',225.00),(26,14,'Sony FS-700','sony-fs-700',1,'2012-07-17 20:13:07','2012-08-09 18:30:55',350.00),(27,14,'RED Scarlet','red-scarlet',1,'2012-07-17 20:14:56','2012-08-09 18:53:01',450.00),(28,14,'Canon 5D Mark II','canon-5d-mark-ii',1,'2012-08-09 18:55:18','2012-08-09 19:05:15',150.00),(29,14,'Red Epic','red-epic',1,'2012-08-09 19:14:13','2012-08-09 19:15:28',1000.00),(30,14,'Arri Alexa','arri-alexa',1,'2012-08-09 19:39:43','2012-08-09 20:27:48',1500.00),(31,14,'Sony F3','sony-f3',1,'2012-08-09 20:17:15','2012-08-09 20:27:37',550.00),(32,14,'(2) GoPro Hero Package','2-gopro-hero-package',1,'2012-08-09 20:30:41','2012-08-09 20:33:01',50.00),(33,14,'Panasonic HDX-900','panasonic-hdx-900',1,'2012-08-09 20:40:27','2012-08-09 20:49:50',650.00),(34,14,'Sony F800','sony-f800',1,'2012-08-09 20:46:16','2012-08-09 20:49:40',850.00),(35,14,'Panasonic SDX-900','panasonic-sdx-900',1,'2012-08-09 20:49:04','2012-08-09 20:49:26',550.00),(36,14,'Panasonic HPX-500','panasonic-hpx-500',1,'2012-08-09 20:51:19','2012-08-09 20:56:49',500.00),(37,14,'Panasonic Varicam HPX-2700','panasonic-varicam-hpx-2700',1,'2012-08-09 20:55:02','2012-08-09 20:56:16',750.00),(38,14,'Time-Lapse Package','time-lapse-package',1,'2012-08-09 20:58:48','2012-08-09 21:01:33',125.00),(39,14,'ARRI ALEXA Packages','',0,'0000-00-00 00:00:00','2012-12-09 17:58:49',0.00),(40,14,'Red One MX','red-one-mx',1,'2012-08-10 13:32:05','2012-08-10 13:32:18',600.00),(41,14,'Panasonic AF-100','panasonic-af-100',1,'2012-08-10 13:36:50','2012-08-10 13:37:56',175.00),(42,13,'Nikon 200mm F2 (PL)','nikon-200mm-f2-pl',1,'2012-08-10 13:45:17','2012-08-10 13:45:48',150.00),(43,13,'Schneider 35mm 2x Extender (PL)','schneider-35mm-2x-extender-pl',1,'2012-08-10 14:04:36','2012-08-10 14:07:27',75.00),(44,13,'Zeiss Standard Speed (PL)','zeiss-standard-speed-pl',1,'2012-08-10 14:07:07','2012-08-10 14:07:48',300.00),(45,13,'Zeiss Super Speeds (PL)','zeiss-super-speeds-pl',1,'2012-08-10 14:11:31','2012-08-10 14:11:48',325.00),(46,13,'Angenieux 25-250mm (PL)','angenieux-25-250mm-pl',1,'2012-08-10 14:18:16','2012-08-10 14:18:41',250.00),(47,13,'Canon 30-300 (PL)','canon-30-300-pl',1,'2012-08-10 15:00:03','2012-08-10 15:00:46',500.00),(48,13,'Duclos Tokina 11-16mm (PL)','duclos-tokina-11-16mm-pl',1,'2012-08-10 15:09:33','2012-08-10 16:54:13',75.00),(49,13,'Fujinon Cabrio 19-90 (PL)','fujinon-cabrio-19-90-pl',1,'2012-08-10 15:44:51','2012-08-10 15:45:14',500.00),(50,13,'Canon 16x7.8 2/3\" HD','canon-16x78-23-hd',1,'2012-08-10 15:47:13','2012-08-10 15:47:49',250.00),(52,13,'Canon 11x4.7 2/3\" HD','canon-11x47-23-HD',1,'2012-08-10 15:51:10','2012-08-10 16:52:54',350.00),(53,13,'Fujinon 17X7.6 2/3\" HD','fujinon-17x76-23-hd',1,'2012-08-10 16:24:35','2012-08-10 16:25:07',225.00),(54,13,'Canon 9x5.2 2/3\" SD','canon-9x52-23-sd',1,'2012-08-10 16:49:57','2012-08-10 16:51:58',250.00),(55,13,'HDx35 B4/PL Optical Adapter','hdx35-b4pl-optical-adapter',1,'2012-08-10 17:08:27','2012-08-10 17:31:37',250.00),(56,13,'PL to EOS Adapter','pl-eos-adapter',1,'2012-08-10 17:35:29','2012-08-10 17:35:46',25.00),(57,13,'PL to Micro 4/3\" Adapter','pl-micro-43-adapter',1,'2012-08-10 17:42:59','2012-08-10 18:01:33',25.00),(58,13,'Nikon to Micro 4/3\" Adapter','nikon-micro-43-adapter',1,'2012-08-10 18:08:14','2012-08-10 18:08:14',25.00),(59,13,'EOS to Micro 4/3\" Adapter','eos-micro-43-adapter',1,'2012-08-10 18:21:26','2012-08-10 18:22:01',25.00),(60,13,'Nikon to E-Mount Adapter','nikon-e-mount-adapter',1,'2012-08-10 18:26:52','2012-08-10 18:28:07',50.00),(61,13,'EOS to E-Mount w/ Active Iris Adapter','eos-e-mount-active-iris-adapter',1,'2012-08-10 18:29:21','2012-08-10 18:33:45',50.00),(62,13,'2/3\" Lens Adapter for Sony PMW-EX3 Adapter','23-lens-adapter-sony-pmw-ex3-Adapter',1,'2012-08-10 18:41:30','2012-08-10 18:42:26',50.00),(63,13,'.75x Aspheric Wide Angle Converter for Sony PMW-EX1 & EX3','75x-aspheric-wide-angle-converter-sony-pmw-ex1-ex3',1,'2012-08-10 18:44:19','2012-08-10 18:50:55',50.00),(64,13,'Lensbaby Composer Kit','lensbaby-composer-kit',1,'2012-08-10 18:52:04','2012-08-10 18:54:34',50.00);
/*!40000 ALTER TABLE `shop_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_simplecategories_category`
--

DROP TABLE IF EXISTS `shop_simplecategories_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_simplecategories_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_simplecategories_category_56ae2a2a` (`slug`),
  KEY `shop_simplecategories_category_6bb36718` (`parent_category_id`),
  CONSTRAINT `parent_category_id_refs_id_79149249` FOREIGN KEY (`parent_category_id`) REFERENCES `shop_simplecategories_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_simplecategories_category`
--

LOCK TABLES `shop_simplecategories_category` WRITE;
/*!40000 ALTER TABLE `shop_simplecategories_category` DISABLE KEYS */;
INSERT INTO `shop_simplecategories_category` VALUES (1,'Cameras','cameras',NULL,0),(2,'Lighting','lighting',NULL,0),(3,'Lenses','lenses',NULL,0),(4,'Audio','audio',NULL,0),(5,'Monitors','monitors',7,0),(6,'Support','support',NULL,0),(7,'Accessories','accessories',NULL,0);
/*!40000 ALTER TABLE `shop_simplecategories_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_simplecategories_category_products`
--

DROP TABLE IF EXISTS `shop_simplecategories_category_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_simplecategories_category_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_simplecategories_category_produc_category_id_5b2a3ec4_uniq` (`category_id`,`product_id`),
  KEY `shop_simplecategories_category_products_42dc49bc` (`category_id`),
  KEY `shop_simplecategories_category_products_44bdf3ee` (`product_id`),
  CONSTRAINT `category_id_refs_id_6a05a367` FOREIGN KEY (`category_id`) REFERENCES `shop_simplecategories_category` (`id`),
  CONSTRAINT `product_id_refs_id_41325047` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_simplecategories_category_products`
--

LOCK TABLES `shop_simplecategories_category_products` WRITE;
/*!40000 ALTER TABLE `shop_simplecategories_category_products` DISABLE KEYS */;
INSERT INTO `shop_simplecategories_category_products` VALUES (83,1,4),(73,1,5),(74,1,6),(75,1,7),(76,1,18),(77,1,23),(78,1,24),(79,1,25),(71,1,26),(80,1,27),(81,1,28),(82,1,29),(85,1,30),(84,1,31),(86,1,32),(90,1,33),(89,1,34),(88,1,35),(92,1,36),(91,1,37),(93,1,38),(94,1,40),(95,1,41),(147,2,19),(149,2,20),(150,2,21),(151,2,22),(102,3,1),(103,3,2),(107,3,3),(105,3,8),(108,3,9),(111,3,10),(110,3,11),(112,3,13),(127,3,14),(115,3,15),(116,3,16),(96,3,42),(98,3,43),(99,3,44),(100,3,45),(101,3,46),(117,3,47),(126,3,48),(118,3,49),(119,3,50),(125,3,52),(122,3,53),(124,3,54),(130,3,55),(131,3,56),(133,3,57),(134,3,59),(136,3,60),(138,3,61),(140,3,62),(143,3,63),(146,3,64);
/*!40000 ALTER TABLE `shop_simplecategories_category_products` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'products','0001_initial','2012-11-30 00:27:36'),(2,'products','0002_auto__add_field_baseindierentalproduct_quantity','2012-11-30 00:28:50'),(3,'products','0003_auto__add_field_baseindierentalproduct_short_description__add_field_ba','2012-12-09 17:44:51'),(4,'products','0004_auto__del_field_productimage_product__chg_field_productimage_descripti','2012-12-14 02:28:27');
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

-- Dump completed on 2012-12-13 21:31:21
