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
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add migration history',8,'add_migrationhistory'),(23,'Can change migration history',8,'change_migrationhistory'),(24,'Can delete migration history',8,'delete_migrationhistory'),(25,'Can add link',9,'add_link'),(26,'Can change link',9,'change_link'),(27,'Can delete link',9,'delete_link'),(28,'Can add Price Tier',10,'add_price_tier'),(29,'Can change Price Tier',10,'change_price_tier'),(30,'Can delete Price Tier',10,'delete_price_tier'),(31,'Can add Price Tier Package',11,'add_price_tier_package'),(32,'Can change Price Tier Package',11,'change_price_tier_package'),(33,'Can delete Price Tier Package',11,'delete_price_tier_package'),(34,'Can add base indie rental product',12,'add_baseindierentalproduct'),(35,'Can change base indie rental product',12,'change_baseindierentalproduct'),(36,'Can delete base indie rental product',12,'delete_baseindierentalproduct'),(37,'Can add lens',13,'add_lens'),(38,'Can change lens',13,'change_lens'),(39,'Can delete lens',13,'delete_lens'),(40,'Can add camera',14,'add_camera'),(41,'Can change camera',14,'change_camera'),(42,'Can delete camera',14,'delete_camera'),(43,'Can add lighting',15,'add_lighting'),(44,'Can change lighting',15,'change_lighting'),(45,'Can delete lighting',15,'delete_lighting'),(46,'Can add Cart',16,'add_cart'),(47,'Can change Cart',16,'change_cart'),(48,'Can delete Cart',16,'delete_cart'),(49,'Can add Cart item',17,'add_cartitem'),(50,'Can change Cart item',17,'change_cartitem'),(51,'Can delete Cart item',17,'delete_cartitem'),(52,'Can add Product',18,'add_product'),(53,'Can change Product',18,'change_product'),(54,'Can delete Product',18,'delete_product'),(55,'Can add Order',19,'add_order'),(56,'Can change Order',19,'change_order'),(57,'Can delete Order',19,'delete_order'),(58,'Can add Order item',20,'add_orderitem'),(59,'Can change Order item',20,'change_orderitem'),(60,'Can delete Order item',20,'delete_orderitem'),(61,'Can add Order extra info',21,'add_orderextrainfo'),(62,'Can change Order extra info',21,'change_orderextrainfo'),(63,'Can delete Order extra info',21,'delete_orderextrainfo'),(64,'Can add Extra order price field',22,'add_extraorderpricefield'),(65,'Can change Extra order price field',22,'change_extraorderpricefield'),(66,'Can delete Extra order price field',22,'delete_extraorderpricefield'),(67,'Can add Extra order item price field',23,'add_extraorderitempricefield'),(68,'Can change Extra order item price field',23,'change_extraorderitempricefield'),(69,'Can delete Extra order item price field',23,'delete_extraorderitempricefield'),(70,'Can add Order payment',24,'add_orderpayment'),(71,'Can change Order payment',24,'change_orderpayment'),(72,'Can delete Order payment',24,'delete_orderpayment'),(73,'Can add task meta',25,'add_taskmeta'),(74,'Can change task meta',25,'change_taskmeta'),(75,'Can delete task meta',25,'delete_taskmeta'),(76,'Can add taskset meta',26,'add_tasksetmeta'),(77,'Can change taskset meta',26,'change_tasksetmeta'),(78,'Can delete taskset meta',26,'delete_tasksetmeta'),(79,'Can add interval',27,'add_intervalschedule'),(80,'Can change interval',27,'change_intervalschedule'),(81,'Can delete interval',27,'delete_intervalschedule'),(82,'Can add crontab',28,'add_crontabschedule'),(83,'Can change crontab',28,'change_crontabschedule'),(84,'Can delete crontab',28,'delete_crontabschedule'),(85,'Can add periodic tasks',29,'add_periodictasks'),(86,'Can change periodic tasks',29,'change_periodictasks'),(87,'Can delete periodic tasks',29,'delete_periodictasks'),(88,'Can add periodic task',30,'add_periodictask'),(89,'Can change periodic task',30,'change_periodictask'),(90,'Can delete periodic task',30,'delete_periodictask'),(91,'Can add worker',31,'add_workerstate'),(92,'Can change worker',31,'change_workerstate'),(93,'Can delete worker',31,'delete_workerstate'),(94,'Can add task',32,'add_taskstate'),(95,'Can change task',32,'change_taskstate'),(96,'Can delete task',32,'delete_taskstate'),(97,'Can add Country',33,'add_country'),(98,'Can change Country',33,'change_country'),(99,'Can delete Country',33,'delete_country'),(100,'Can add Address',34,'add_address'),(101,'Can change Address',34,'change_address'),(102,'Can delete Address',34,'delete_address'),(103,'Can add PayPal IPN',35,'add_paypalipn'),(104,'Can change PayPal IPN',35,'change_paypalipn'),(105,'Can delete PayPal IPN',35,'delete_paypalipn'),(106,'Can add brand',36,'add_brand'),(107,'Can change brand',36,'change_brand'),(108,'Can delete brand',36,'delete_brand'),(109,'Can add product image',37,'add_productimage'),(110,'Can change product image',37,'change_productimage'),(111,'Can delete product image',37,'delete_productimage'),(112,'Can add category',38,'add_category'),(113,'Can change category',38,'change_category'),(114,'Can delete category',38,'delete_category'),(115,'Can add audio',39,'add_audio'),(116,'Can change audio',39,'change_audio'),(117,'Can delete audio',39,'delete_audio'),(118,'Can add monitor',40,'add_monitor'),(119,'Can change monitor',40,'change_monitor'),(120,'Can delete monitor',40,'delete_monitor'),(121,'Can add support',41,'add_support'),(122,'Can change support',41,'change_support'),(123,'Can delete support',41,'delete_support'),(124,'Can add accessory',42,'add_accessory'),(125,'Can change accessory',42,'change_accessory'),(126,'Can delete accessory',42,'delete_accessory'),(127,'Can add registration profile',43,'add_registrationprofile'),(128,'Can change registration profile',43,'change_registrationprofile'),(129,'Can delete registration profile',43,'delete_registrationprofile'),(130,'Can add csv import',44,'add_csvimport'),(131,'Can change csv import',44,'change_csvimport'),(132,'Can delete csv import',44,'delete_csvimport'),(133,'Can add import model',45,'add_importmodel'),(134,'Can change import model',45,'change_importmodel'),(135,'Can delete import model',45,'delete_importmodel'),(136,'Can add battery and power',46,'add_batteryandpower'),(137,'Can change battery and power',46,'change_batteryandpower'),(138,'Can delete battery and power',46,'delete_batteryandpower'),(139,'Can add digital recorder media vtr',47,'add_digitalrecordermediavtr'),(140,'Can change digital recorder media vtr',47,'change_digitalrecordermediavtr'),(141,'Can delete digital recorder media vtr',47,'delete_digitalrecordermediavtr'),(142,'Can add edit and transfer system',48,'add_editandtransfersystem'),(143,'Can change edit and transfer system',48,'change_editandtransfersystem'),(144,'Can delete edit and transfer system',48,'delete_editandtransfersystem'),(145,'Can add grip',49,'add_grip'),(146,'Can change grip',49,'change_grip'),(147,'Can delete grip',49,'delete_grip'),(148,'Can add matte box follow focus filter',50,'add_matteboxfollowfocusfilter'),(149,'Can change matte box follow focus filter',50,'change_matteboxfollowfocusfilter'),(150,'Can delete matte box follow focus filter',50,'delete_matteboxfollowfocusfilter'),(151,'Can add multi camera switcher package',51,'add_multicameraswitcherpackage'),(152,'Can change multi camera switcher package',51,'change_multicameraswitcherpackage'),(153,'Can delete multi camera switcher package',51,'delete_multicameraswitcherpackage'),(154,'Can add other service',52,'add_otherservice'),(155,'Can change other service',52,'change_otherservice'),(156,'Can delete other service',52,'delete_otherservice'),(157,'Can add tape stock',53,'add_tapestock'),(158,'Can change tape stock',53,'change_tapestock'),(159,'Can delete tape stock',53,'delete_tapestock'),(160,'Can add teleprompter',54,'add_teleprompter'),(161,'Can change teleprompter',54,'change_teleprompter'),(162,'Can delete teleprompter',54,'delete_teleprompter'),(163,'Can add timecode and signal conversion',55,'add_timecodeandsignalconversion'),(164,'Can change timecode and signal conversion',55,'change_timecodeandsignalconversion'),(165,'Can delete timecode and signal conversion',55,'delete_timecodeandsignalconversion'),(166,'Can add tripod dolly support rig',56,'add_tripoddollysupportrig'),(167,'Can change tripod dolly support rig',56,'change_tripoddollysupportrig'),(168,'Can delete tripod dolly support rig',56,'delete_tripoddollysupportrig'),(169,'Can add video projection',57,'add_videoprojection'),(170,'Can change video projection',57,'change_videoprojection'),(171,'Can delete video projection',57,'delete_videoprojection');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvimport_csvimport`
--

LOCK TABLES `csvimport_csvimport` WRITE;
/*!40000 ALTER TABLE `csvimport_csvimport` DISABLE KEYS */;
INSERT INTO `csvimport_csvimport` VALUES (2,'products.Camera','','csv/ifr_cameras_1.csv','csv/ifr_cameras_1.csv','','manual','Using mapping from first row of CSV file\nException found... Column \'date_added\' cannot be null Instance 1 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 2 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 3 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 4 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 5 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 6 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 7 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 8 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 9 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 10 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 11 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 12 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 13 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 14 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 15 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 16 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 17 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 18 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 19 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 20 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 21 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 22 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 23 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 24 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 25 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 26 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 27 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 28 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 29 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 30 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 31 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 32 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 33 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 34 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 35 not saved.\nException found... (1062, \"Duplicate entry \'\' for key \'slug\'\") Instance 36 not saved.','2012-12-09','brandon'),(3,'products.ProductImage','','csv/ifr-pics.csv','csv/ifr-pics.csv','','manual','Using mapping from first row of CSV file','2012-12-13','brandon'),(4,'shop_simplecategories.Category','','csv/ifr-categories.csv','csv/ifr-categories.csv','','manual','Using mapping from first row of CSV file','2012-12-13','brandon');
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
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2012-05-23 02:02:48',1,9,'1','Link object',1,''),(2,'2012-06-28 13:36:04',1,10,'1','Days: 1 - 4 : 100.0%',1,''),(3,'2012-07-17 18:15:41',1,11,'1','Tier Package: Day Rate 1-4',1,''),(4,'2012-07-17 18:16:02',1,11,'2','Tier Package: Teir 1',1,''),(5,'2012-07-17 18:16:37',1,13,'1','Angenieux Optimo DP 16-42',1,''),(6,'2012-07-17 18:17:45',1,13,'1','Angenieux Optimo DP 16-42',2,'Changed description.'),(7,'2012-07-17 18:18:44',1,13,'2','Angenieux Optimo DP 30-80mm',1,''),(8,'2012-07-17 18:18:53',1,13,'1','Angenieux Optimo DP 16-42',2,'Changed status.'),(9,'2012-07-17 18:19:18',1,11,'2','Tier Package: Teir 1',3,''),(10,'2012-07-17 18:19:59',1,10,'1','Days: 1 - 3 : 100.0%',2,'Changed end_day.'),(11,'2012-07-17 18:20:21',1,10,'2','Days: 3 - 7 : 90.0%',1,''),(12,'2012-07-17 18:20:34',1,10,'3','Days: 7 - 10 : 80.0%',1,''),(13,'2012-07-17 18:21:04',1,10,'4','Days: 10 - 14 : 75.0%',1,''),(14,'2012-07-17 18:22:10',1,11,'1','Tier Package: Lensing Day Rate Package',2,'Changed tier and name.'),(15,'2012-07-17 18:22:39',1,13,'1','Angenieux Optimo DP 16-42,,',2,'Changed name.'),(16,'2012-07-17 18:22:44',1,13,'1','Angenieux Optimo DP 16-42mm',2,'Changed name.'),(17,'2012-07-17 18:22:48',1,13,'1','Angenieux Optimo DP 16-42mm',2,'Changed slug.'),(18,'2012-07-17 18:24:47',1,13,'2','Angenieux Optimo DP 30-80mm',2,'Changed description and crossSell.'),(19,'2012-07-17 18:25:52',1,13,'3','Zeiss CP.2 Lens Set',1,''),(20,'2012-07-17 18:27:53',1,11,'3','Tier Package: Video Camera Rental Rate',1,''),(21,'2012-07-17 19:00:30',1,14,'4','Panasonic HMC150',1,''),(22,'2012-07-17 19:00:37',1,14,'4','Panasonic HMC150',2,'Changed description and price_tier.'),(23,'2012-07-17 19:12:00',1,3,'2','david.test.1',1,''),(24,'2012-07-17 19:13:59',1,3,'2','david.test.1',2,'Changed password, first_name, last_name, email, user_permissions, last_login and date_joined.'),(25,'2012-07-17 19:18:49',1,10,'5','Days: 1 - 2 : 100.0%',1,''),(26,'2012-07-17 19:18:59',1,10,'6','Days: 2 - 3 : 50.0%',1,''),(27,'2012-07-17 19:19:10',1,10,'7','Days: 3 - 4 : 95.0%',1,''),(28,'2012-07-17 19:19:26',1,11,'4','Tier Package: Crazy Stupid Deal',1,''),(29,'2012-07-17 19:19:35',1,14,'5','Panasonic HMC160',1,''),(30,'2012-07-17 19:19:51',1,14,'5','Panasonic HMC160',2,'Changed active and price_tier.'),(31,'2012-07-17 19:19:58',1,14,'4','Panasonic HMC150',2,'Changed active.'),(32,'2012-07-17 19:20:14',1,13,'1','Angenieux Optimo DP 16-42mm',2,'Changed active.'),(33,'2012-07-17 19:20:19',1,13,'2','Angenieux Optimo DP 30-80mm',2,'Changed active.'),(34,'2012-07-17 19:20:25',1,13,'3','Zeiss CP.2 Lens Set',2,'Changed active.'),(35,'2012-07-17 19:24:52',1,14,'6','Canon 7D',1,''),(36,'2012-07-17 19:26:38',1,14,'7','Canon C300',1,''),(37,'2012-07-17 19:27:42',1,13,'8','Canon 24-70 F/2.8 IS USM',1,''),(38,'2012-07-17 19:30:36',1,13,'3','Zeiss CP.2 Lens Set',2,'No fields changed.'),(39,'2012-07-17 19:30:53',1,14,'6','Canon 7D',2,'Changed crossSell.'),(40,'2012-07-17 19:31:05',1,14,'7','Canon C300',2,'Changed crossSell.'),(41,'2012-07-17 19:39:35',1,13,'9','Canon 16-35 F/2.8 L II USM',1,''),(42,'2012-07-17 19:40:33',1,13,'10','Canon 17-85mm F/4-5.6 IS USM',1,''),(43,'2012-07-17 19:41:34',1,13,'11','Canon 24-105 F/4 USM',1,''),(44,'2012-07-17 19:43:09',1,13,'13','Canon 70-200mm F/2.8 IS II',1,''),(45,'2012-07-17 19:47:20',1,13,'14','Nikon to Canon Mount Adapter',1,''),(46,'2012-07-17 19:49:53',1,13,'14','Nikon to Canon Mount Adapter',2,'Changed unit_price and description.'),(47,'2012-07-17 19:51:12',1,13,'15','Zeiss ZF ',1,''),(48,'2012-07-17 19:51:24',1,13,'15','Zeiss ZF Prime Lens Set',2,'Changed name.'),(49,'2012-07-17 19:51:31',1,13,'15','Zeiss ZF Prime Lens Set',2,'Changed slug.'),(50,'2012-07-17 19:52:58',1,13,'16','Zeiss ZF.2 Prime Lens Set',1,''),(51,'2012-07-17 19:57:50',1,13,'17','Canon 5D Mark II',1,''),(52,'2012-07-17 19:58:35',1,14,'18','Sony EX1R XDCAM EX',1,''),(53,'2012-07-17 20:01:54',1,11,'5','Tier Package: Full Price Always',1,''),(54,'2012-07-17 20:02:01',1,15,'19','Dedolight',1,''),(55,'2012-07-17 20:02:08',1,15,'19','Dedolight',2,'Changed price_tier.'),(56,'2012-07-17 20:02:35',1,15,'20','Kino Flo Kamio 6E System',1,''),(57,'2012-07-17 20:03:09',1,15,'21','Reflecmedia LiteRing',1,''),(58,'2012-07-17 20:03:53',1,15,'22','Sun Gun (Anton Bauer)',1,''),(59,'2012-07-17 20:09:07',1,14,'23','Sony HVR-Z7U HDV',1,''),(60,'2012-07-17 20:10:15',1,14,'24','Sony EX-3 XDCam',1,''),(61,'2012-07-17 20:12:04',1,14,'25','Sony FS-100 Shoot Packages',1,''),(62,'2012-07-17 20:13:07',1,14,'26','Sony FS-700',1,''),(63,'2012-07-17 20:14:56',1,14,'27','RED Scarlet Body Package',1,''),(64,'2012-07-21 16:59:51',1,36,'1','Sony',1,''),(65,'2012-07-21 17:45:37',1,38,'1','cameras',1,''),(66,'2012-07-21 17:45:49',1,38,'2','Lighting',1,''),(67,'2012-07-21 17:47:30',1,38,'3','Lenses',1,''),(68,'2012-07-21 17:47:37',1,38,'1','Cameras',2,'Changed name.'),(69,'2012-07-21 17:47:49',1,38,'1','Cameras',2,'No fields changed.'),(70,'2012-07-21 17:51:39',1,14,'6','Canon 7D',2,'Changed categories.'),(71,'2012-07-21 17:52:22',1,38,'1','Cameras',2,'Changed products.'),(72,'2012-07-21 17:52:53',1,38,'1','Cameras',2,'Changed products.'),(73,'2012-07-23 16:36:33',1,14,'7','Canon C300',2,'Changed crossSell.'),(74,'2012-07-25 23:04:26',1,15,'19','Dedolight',2,'Changed categories.'),(75,'2012-07-25 23:11:50',1,15,'20','Kino Flo Kamio 6E System',2,'Changed categories.'),(76,'2012-07-25 23:42:42',1,15,'21','Reflecmedia LiteRing',2,'Changed categories.'),(77,'2012-07-25 23:42:54',1,15,'22','Sun Gun (Anton Bauer)',2,'Changed categories.'),(78,'2012-08-09 15:12:28',1,14,'4','Panasonic HMC150',2,'Changed description and categories. Added product image \"ProductImage object\".'),(79,'2012-08-09 15:15:01',1,36,'2','Panasonic',1,''),(80,'2012-08-09 15:15:31',1,14,'4','Panasonic HMC150',2,'Changed brand and categories.'),(81,'2012-08-09 15:20:50',1,14,'4','Panasonic HMC150',2,'Changed description and categories.'),(82,'2012-08-09 15:23:30',1,14,'5','Panasonic HMC160',2,'Changed description, status, price_tier and categories. Added product image \"ProductImage object\".'),(83,'2012-08-09 15:24:16',1,14,'5','Panasonic HMC160',2,'Changed active and categories.'),(84,'2012-08-09 15:25:24',1,14,'5','Panasonic HMC160',2,'Changed status and categories.'),(85,'2012-08-09 15:29:40',1,14,'7','Canon C300',2,'Changed categories. Added product image \"ProductImage object\".'),(86,'2012-08-09 15:31:06',1,38,'4','Audio',1,''),(87,'2012-08-09 15:31:32',1,38,'5','Monitors',1,''),(88,'2012-08-09 15:31:36',1,38,'5','Monitors',2,'No fields changed.'),(89,'2012-08-09 15:39:27',1,38,'6','Support',1,''),(90,'2012-08-09 15:39:41',1,38,'7','Accessories',1,''),(91,'2012-08-09 15:39:56',1,38,'5','Monitors',2,'Changed parent_category.'),(92,'2012-08-09 16:06:33',1,38,'1','Cameras',2,'Changed products.'),(93,'2012-08-09 16:12:08',1,36,'3','Arri',1,''),(94,'2012-08-09 18:28:29',1,14,'18','Sony EX1R',2,'Changed name, slug, active and categories. Added product image \"ProductImage object\".'),(95,'2012-08-09 18:28:59',1,14,'5','Panasonic HMC160',2,'Changed active and categories.'),(96,'2012-08-09 18:30:55',1,14,'26','Sony FS-700',2,'Changed categories. Added product image \"ProductImage object\".'),(97,'2012-08-09 18:35:19',1,14,'25','Sony FS-100',2,'Changed name, slug, active, status and categories. Added product image \"ProductImage object\".'),(98,'2012-08-09 18:36:30',1,36,'4','Canon',1,''),(99,'2012-08-09 18:37:06',1,14,'6','Canon 7D',2,'Changed active, brand, description and categories. Added product image \"ProductImage object\".'),(100,'2012-08-09 18:38:21',1,14,'7','Canon C300',2,'Changed active, brand, description and categories.'),(101,'2012-08-09 18:39:02',1,36,'4','Canon',2,'No fields changed.'),(102,'2012-08-09 18:39:23',1,38,'1','Cameras',2,'No fields changed.'),(103,'2012-08-09 18:40:35',1,14,'5','Panasonic HMC160',2,'Changed brand and categories.'),(104,'2012-08-09 18:40:46',1,14,'6','Canon 7D',2,'Changed categories.'),(105,'2012-08-09 18:40:56',1,14,'7','Canon C300',2,'Changed categories.'),(106,'2012-08-09 18:41:34',1,13,'17','Canon 5D Mark II',3,''),(107,'2012-08-09 18:41:53',1,14,'18','Sony EX1R',2,'Changed categories.'),(108,'2012-08-09 18:44:01',1,14,'23','Sony HVR-Z7U',2,'Changed name, slug, active, description, status and categories. Added product image \"ProductImage object\".'),(109,'2012-08-09 18:46:39',1,14,'24','Sony EX-3',2,'Changed name, slug, active, status and categories. Added product image \"ProductImage object\".'),(110,'2012-08-09 18:50:27',1,14,'25','Sony FS-100',2,'Changed categories.'),(111,'2012-08-09 18:51:59',1,36,'5','Red',1,''),(112,'2012-08-09 18:53:01',1,14,'27','RED Scarlet',2,'Changed name, slug, active, brand and categories. Added product image \"ProductImage object\".'),(113,'2012-08-09 18:55:18',1,14,'28','Canon 5D Mark II',1,''),(114,'2012-08-09 19:01:31',1,14,'28','Canon 5D Mark II',2,'No fields changed.'),(115,'2012-08-09 19:05:15',1,14,'28','Canon 5D Mark II',2,'Changed categories.'),(116,'2012-08-09 19:14:13',1,14,'29','Red Epic',1,''),(117,'2012-08-09 19:15:28',1,14,'29','Red Epic',2,'Changed categories.'),(118,'2012-08-09 19:25:56',1,36,'6','Arri',1,''),(119,'2012-08-09 19:39:43',1,14,'30','Arri Alexa',1,''),(120,'2012-08-09 19:48:22',1,11,'3','Tier Package: Video Camera Standard Rate',2,'Changed name.'),(121,'2012-08-09 19:48:54',1,10,'1','Days: 1 - 3 : 100.0%',2,'No fields changed.'),(122,'2012-08-09 19:49:14',1,10,'2','Days: 3 - 7 : 43.0%',2,'Changed percent.'),(123,'2012-08-09 20:03:17',1,10,'2','Days: 3 - 7 : 43.0%',2,'No fields changed.'),(124,'2012-08-09 20:04:07',1,11,'3','Tier Package: Video Camera Standard Rate',2,'Changed tier.'),(125,'2012-08-09 20:05:23',1,14,'4','Panasonic HMC150',2,'Changed categories.'),(126,'2012-08-09 20:17:15',1,14,'31','Sony F3',1,''),(127,'2012-08-09 20:27:37',1,14,'31','Sony F3',2,'Changed categories.'),(128,'2012-08-09 20:27:48',1,14,'30','Arri Alexa',2,'Changed categories.'),(129,'2012-08-09 20:29:46',1,36,'7','GoPro',1,''),(130,'2012-08-09 20:30:41',1,14,'32','(2) GoPro Hero Package',1,''),(131,'2012-08-09 20:33:01',1,14,'32','(2) GoPro Hero Package',2,'Changed description and categories.'),(132,'2012-08-09 20:40:27',1,14,'33','Panasonic HDX-900',1,''),(133,'2012-08-09 20:41:13',1,14,'33','Panasonic HDX-900',2,'Changed categories.'),(134,'2012-08-09 20:46:16',1,14,'34','Sony F800',1,''),(135,'2012-08-09 20:49:04',1,14,'35','Panasonic SDX-900',1,''),(136,'2012-08-09 20:49:26',1,14,'35','Panasonic SDX-900',2,'Changed categories.'),(137,'2012-08-09 20:49:40',1,14,'34','Sony F800',2,'Changed categories.'),(138,'2012-08-09 20:49:50',1,14,'33','Panasonic HDX-900',2,'Changed categories.'),(139,'2012-08-09 20:51:19',1,14,'36','Panasonic HPX-500',1,''),(140,'2012-08-09 20:55:03',1,14,'37','Panasonic Varicam HPX-2700',1,''),(141,'2012-08-09 20:56:16',1,14,'37','Panasonic Varicam HPX-2700',2,'Changed categories.'),(142,'2012-08-09 20:56:49',1,14,'36','Panasonic HPX-500',2,'Changed categories.'),(143,'2012-08-09 20:58:48',1,14,'38','Time-Lapse Package',1,''),(144,'2012-08-09 21:01:33',1,14,'38','Time-Lapse Package',2,'Changed categories.'),(145,'2012-08-09 21:02:10',1,36,'8','Other',1,''),(146,'2012-08-09 21:03:13',1,14,'39','Lytro Light Field Camera',1,''),(147,'2012-08-10 13:32:05',1,14,'40','Red One MX',1,''),(148,'2012-08-10 13:32:18',1,14,'40','Red One MX',2,'Changed categories.'),(149,'2012-08-10 13:36:50',1,14,'41','Panasonic AF-100',1,''),(150,'2012-08-10 13:37:56',1,14,'41','Panasonic AF-100',2,'Changed categories.'),(151,'2012-08-10 13:42:25',1,36,'9','Nikon',1,''),(152,'2012-08-10 13:45:17',1,13,'42','Nikon 200mm F2 (PL)',1,''),(153,'2012-08-10 13:45:48',1,13,'42','Nikon 200mm F2 (PL)',2,'Changed categories.'),(154,'2012-08-10 14:03:37',1,36,'10','Schneider',1,''),(155,'2012-08-10 14:04:36',1,13,'43','Schneider 35mm 2x Extender (PL)',1,''),(156,'2012-08-10 14:06:39',1,36,'11','Zeiss',1,''),(157,'2012-08-10 14:07:08',1,13,'44','Zeiss Standard Speed',1,''),(158,'2012-08-10 14:07:19',1,13,'44','Zeiss Standard Speed',2,'Changed categories.'),(159,'2012-08-10 14:07:28',1,13,'43','Schneider 35mm 2x Extender (PL)',2,'Changed categories.'),(160,'2012-08-10 14:07:48',1,13,'44','Zeiss Standard Speed (PL)',2,'Changed name, slug and categories.'),(161,'2012-08-10 14:11:31',1,13,'45','Zeiss Super Speeds (PL)',1,''),(162,'2012-08-10 14:11:48',1,13,'45','Zeiss Super Speeds (PL)',2,'Changed categories.'),(163,'2012-08-10 14:15:13',1,36,'12','Angenieux',1,''),(164,'2012-08-10 14:18:16',1,13,'46','Angenieux 25-250mm (PL)',1,''),(165,'2012-08-10 14:18:41',1,13,'46','Angenieux 25-250mm (PL)',2,'Changed categories.'),(166,'2012-08-10 14:24:47',1,13,'1','Angenieux Optimo DP 16-42mm',2,'Changed brand, description and categories. Added product image \"ProductImage object\".'),(167,'2012-08-10 14:25:38',1,13,'2','Angenieux Optimo DP 30-80mm',2,'Changed brand, description and categories. Added product image \"ProductImage object\".'),(168,'2012-08-10 14:29:42',1,13,'3','Zeiss CP.2 Lens Set',2,'Changed brand and categories.'),(169,'2012-08-10 14:32:25',1,13,'8','Canon 24-70 F/2.8 IS USM',2,'Changed active, brand and categories. Added product image \"ProductImage object\".'),(170,'2012-08-10 14:33:33',1,13,'3','Zeiss CP.2 Lens Set',2,'Changed description and categories. Added product image \"ProductImage object\".'),(171,'2012-08-10 14:34:08',1,13,'3','Zeiss CP.2 Lens Set (PL)',2,'Changed name, slug and categories.'),(172,'2012-08-10 14:35:58',1,13,'9','Canon 16-35 F/2.8 L II USM',2,'Changed active, brand, description and categories. Added product image \"ProductImage object\".'),(173,'2012-08-10 14:42:02',1,13,'10','Canon 17-85mm F/4-5.6 IS USM',2,'Changed active, description, crossSell and categories. Added product image \"ProductImage object\".'),(174,'2012-08-10 14:45:59',1,13,'11','Canon 24-105 F/4 USM',2,'Changed active, brand, description and categories. Added product image \"ProductImage object\".'),(175,'2012-08-10 14:46:12',1,13,'10','Canon 17-85mm F/4-5.6 IS USM',2,'Changed brand and categories.'),(176,'2012-08-10 14:47:50',1,13,'13','Canon 70-200mm F/2.8 IS II',2,'Changed active and categories. Added product image \"ProductImage object\".'),(177,'2012-08-10 14:48:49',1,13,'14','Nikon to Canon Mount Adapter',2,'Changed active, brand and categories.'),(178,'2012-08-10 14:49:23',1,13,'15','Zeiss ZF Prime Lens Set',2,'Changed active, brand and categories. Added product image \"ProductImage object\".'),(179,'2012-08-10 14:50:17',1,13,'16','Zeiss ZF.2 Prime Lens Set',2,'Changed active, brand, status and categories. Added product image \"ProductImage object\".'),(180,'2012-08-10 15:00:03',1,13,'47','Canon 30-300 (PL)',1,''),(181,'2012-08-10 15:00:46',1,13,'47','Canon 30-300 (PL)',2,'Changed status and categories. Added product image \"ProductImage object\".'),(182,'2012-08-10 15:09:33',1,13,'48','Duclos Tokina 11-16mm (PL)',1,''),(183,'2012-08-10 15:43:57',1,36,'13','Fujinon',1,''),(184,'2012-08-10 15:44:51',1,13,'49','Fujinon Cabrio 19-90 (PL)',1,''),(185,'2012-08-10 15:45:14',1,13,'49','Fujinon Cabrio 19-90 (PL)',2,'Changed categories.'),(186,'2012-08-10 15:47:13',1,13,'50','Canon 16x7.8 2/3\" HD',1,''),(187,'2012-08-10 15:47:50',1,13,'50','Canon 16x7.8 2/3\" HD',2,'Changed categories. Added product image \"ProductImage object\".'),(188,'2012-08-10 15:49:14',1,14,'51','Canon 11x4.7 2/3\" Zoom',1,''),(189,'2012-08-10 15:49:22',1,14,'51','Canon 11x4.7 2/3\" Zoom',2,'Changed categories.'),(190,'2012-08-10 15:49:44',1,14,'51','Canon 11x4.7 2/3\" Zoom',2,'Changed categories. Added product image \"ProductImage object\".'),(191,'2012-08-10 15:50:20',1,14,'51','Canon 11x4.7 2/3\" Zoom',3,''),(192,'2012-08-10 15:51:10',1,13,'52','Canon 11x4.7 2/3\" Zoom',1,''),(193,'2012-08-10 15:51:27',1,13,'52','Canon 11x4.7 2/3\" HD',2,'Changed name, slug and active.'),(194,'2012-08-10 16:24:35',1,13,'53','Fujinon 17X7.6 2/3\" HD',1,''),(195,'2012-08-10 16:25:08',1,13,'53','Fujinon 17X7.6 2/3\" HD',2,'Changed categories. Added product image \"ProductImage object\".'),(196,'2012-08-10 16:49:57',1,13,'54','Canon 9x5.2 2/3\" SD',1,''),(197,'2012-08-10 16:50:25',1,13,'54','Canon 9x5.2 2/3\" SD',2,'Changed categories.'),(198,'2012-08-10 16:51:58',1,13,'54','Canon 9x5.2 2/3\" SD',2,'Changed categories. Added product image \"ProductImage object\".'),(199,'2012-08-10 16:52:54',1,13,'52','Canon 11x4.7 2/3\" HD',2,'Changed categories.'),(200,'2012-08-10 16:54:13',1,13,'48','Duclos Tokina 11-16mm (PL)',2,'Changed categories.'),(201,'2012-08-10 17:02:00',1,13,'14','Nikon to Canon Mount Adapter',2,'Changed categories. Added product image \"ProductImage object\".'),(202,'2012-08-10 17:08:27',1,13,'55','HDx35 B4/PL Optical Adapter',1,''),(203,'2012-08-10 17:29:16',1,13,'55','HDx35 B4/PL Optical Adapter',2,'Changed categories. Added product image \"ProductImage object\".'),(204,'2012-08-10 17:31:37',1,13,'55','HDx35 B4/PL Optical Adapter',2,'Changed categories. Changed image for product image \"ProductImage object\".'),(205,'2012-08-10 17:35:29',1,13,'56','PL to EOS Adapter',1,''),(206,'2012-08-10 17:35:46',1,13,'56','PL to EOS Adapter',2,'Changed categories.'),(207,'2012-08-10 17:42:59',1,13,'57','PL to Micro 4/3\" Adapter',1,''),(208,'2012-08-10 17:43:09',1,13,'57','PL to Micro 4/3\" Adapter',2,'Changed categories.'),(209,'2012-08-10 18:01:34',1,13,'57','PL to Micro 4/3\" Adapter',2,'Changed categories. Added product image \"ProductImage object\".'),(210,'2012-08-10 18:08:14',1,13,'58','Nikon to Micro 4/3\" Adapter',1,''),(211,'2012-08-10 18:21:26',1,13,'59','EOS to Micro 4/3\" Adapter',1,''),(212,'2012-08-10 18:22:02',1,13,'59','EOS to Micro 4/3\" Adapter',2,'Changed categories. Added product image \"ProductImage object\".'),(213,'2012-08-10 18:26:52',1,13,'60','Nikon to E-Mount Adapter',1,''),(214,'2012-08-10 18:27:18',1,13,'60','Nikon to E-Mount Adapter',2,'Changed categories.'),(215,'2012-08-10 18:28:08',1,13,'60','Nikon to E-Mount Adapter',2,'Changed categories.'),(216,'2012-08-10 18:29:21',1,13,'61','EOS to E-Mount w/ Active Iris',1,''),(217,'2012-08-10 18:32:27',1,13,'61','EOS to E-Mount w/ Active Iris Adapter',2,'Changed name, slug, description and categories.'),(218,'2012-08-10 18:33:45',1,13,'61','EOS to E-Mount w/ Active Iris Adapter',2,'Changed categories. Added product image \"ProductImage object\".'),(219,'2012-08-10 18:41:30',1,13,'62','2/3\" Lens Adapter for Sony PMW-EX3 ',1,''),(220,'2012-08-10 18:41:53',1,13,'62','2/3\" Lens Adapter for Sony PMW-EX3 Adapter',2,'Changed name, slug and categories.'),(221,'2012-08-10 18:42:26',1,13,'62','2/3\" Lens Adapter for Sony PMW-EX3 Adapter',2,'Changed categories. Added product image \"ProductImage object\".'),(222,'2012-08-10 18:44:19',1,13,'63','.75x Aspheric Wide Angle Converter for Sony PMW-EX1 & EX3',1,''),(223,'2012-08-10 18:47:15',1,13,'63','.75x Aspheric Wide Angle Converter for Sony PMW-EX1 & EX3',2,'Changed categories. Added product image \"ProductImage object\".'),(224,'2012-08-10 18:47:39',1,13,'63','.75x Aspheric Wide Angle Converter for Sony PMW-EX1 & EX3',2,'Changed categories.'),(225,'2012-08-10 18:50:55',1,13,'63','.75x Aspheric Wide Angle Converter for Sony PMW-EX1 & EX3',2,'Changed categories. Changed image for product image \"ProductImage object\".'),(226,'2012-08-10 18:52:04',1,13,'64','Lensbaby Composer Kit',1,''),(227,'2012-08-10 18:52:22',1,13,'64','Lensbaby Composer Kit',2,'Changed categories.'),(228,'2012-08-10 18:53:15',1,13,'64','Lensbaby Composer Kit',2,'Changed categories. Added product image \"ProductImage object\".'),(229,'2012-08-10 18:54:34',1,13,'64','Lensbaby Composer Kit',2,'Changed categories.'),(230,'2012-08-10 18:59:36',1,15,'19','Dedolight',2,'Changed active, brand, price_tier and categories. Added product image \"ProductImage object\".'),(231,'2012-08-10 19:00:12',1,36,'14','Kino Flo',1,''),(232,'2012-08-10 19:00:57',1,15,'20','Kino Flo Kamio 6E System',2,'Changed brand and categories. Added product image \"ProductImage object\".'),(233,'2012-08-10 19:02:25',1,15,'20','Kino Flo Kamio 6E System',2,'Changed description and categories.'),(234,'2012-08-10 19:04:45',1,15,'21','Reflecmedia LiteRing',2,'Changed description and categories. Added product image \"ProductImage object\".'),(235,'2012-08-10 19:05:13',1,36,'15','Anton Bauer',1,''),(236,'2012-08-10 20:08:24',1,15,'22','Sun Gun (Anton Bauer)',2,'Changed brand and categories.'),(237,'2012-12-09 17:58:53',3,44,'2','csv/ifr_cameras_1.csv',1,''),(238,'2012-12-14 02:37:35',3,44,'3','csv/ifr-pics.csv',1,''),(239,'2012-12-14 02:51:11',3,44,'4','csv/ifr-categories.csv',1,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'migration history','south','migrationhistory'),(9,'link','base','link'),(10,'Price Tier','products','price_tier'),(11,'Price Tier Package','products','price_tier_package'),(12,'base indie rental product','products','baseindierentalproduct'),(13,'lens','products','lens'),(14,'camera','products','camera'),(15,'lighting','products','lighting'),(16,'Cart','shop','cart'),(17,'Cart item','shop','cartitem'),(18,'Product','shop','product'),(19,'Order','shop','order'),(20,'Order item','shop','orderitem'),(21,'Order extra info','shop','orderextrainfo'),(22,'Extra order price field','shop','extraorderpricefield'),(23,'Extra order item price field','shop','extraorderitempricefield'),(24,'Order payment','shop','orderpayment'),(25,'task meta','djcelery','taskmeta'),(26,'taskset meta','djcelery','tasksetmeta'),(27,'interval','djcelery','intervalschedule'),(28,'crontab','djcelery','crontabschedule'),(29,'periodic tasks','djcelery','periodictasks'),(30,'periodic task','djcelery','periodictask'),(31,'worker','djcelery','workerstate'),(32,'task','djcelery','taskstate'),(33,'Country','addressmodel','country'),(34,'Address','addressmodel','address'),(35,'PayPal IPN','ipn','paypalipn'),(36,'brand','products','brand'),(37,'product image','products','productimage'),(38,'category','shop_simplecategories','category'),(39,'audio','products','audio'),(40,'monitor','products','monitor'),(41,'support','products','support'),(42,'accessory','products','accessory'),(43,'registration profile','registration','registrationprofile'),(44,'csv import','csvimport','csvimport'),(45,'import model','csvimport','importmodel'),(46,'battery and power','products','batteryandpower'),(47,'digital recorder media vtr','products','digitalrecordermediavtr'),(48,'edit and transfer system','products','editandtransfersystem'),(49,'grip','products','grip'),(50,'matte box follow focus filter','products','matteboxfollowfocusfilter'),(51,'multi camera switcher package','products','multicameraswitcherpackage'),(52,'other service','products','otherservice'),(53,'tape stock','products','tapestock'),(54,'teleprompter','products','teleprompter'),(55,'timecode and signal conversion','products','timecodeandsignalconversion'),(56,'tripod dolly support rig','products','tripoddollysupportrig'),(57,'video projection','products','videoprojection');
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
-- Table structure for table `products_batteryandpower`
--

DROP TABLE IF EXISTS `products_batteryandpower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_batteryandpower` (
  `baseindierentalproduct_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`baseindierentalproduct_ptr_id`),
  CONSTRAINT `baseindierentalproduct_ptr_id_refs_product_ptr_id_5cc051e25ec11b` FOREIGN KEY (`baseindierentalproduct_ptr_id`) REFERENCES `products_baseindierentalproduct` (`product_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_batteryandpower`
--

LOCK TABLES `products_batteryandpower` WRITE;
/*!40000 ALTER TABLE `products_batteryandpower` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_batteryandpower` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `products_camera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_digitalrecordermediavtr`
--

DROP TABLE IF EXISTS `products_digitalrecordermediavtr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_digitalrecordermediavtr` (
  `baseindierentalproduct_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`baseindierentalproduct_ptr_id`),
  CONSTRAINT `baseindierentalproduct_ptr_id_refs_product_ptr_id_6d3326b7c37db1` FOREIGN KEY (`baseindierentalproduct_ptr_id`) REFERENCES `products_baseindierentalproduct` (`product_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_digitalrecordermediavtr`
--

LOCK TABLES `products_digitalrecordermediavtr` WRITE;
/*!40000 ALTER TABLE `products_digitalrecordermediavtr` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_digitalrecordermediavtr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_editandtransfersystem`
--

DROP TABLE IF EXISTS `products_editandtransfersystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_editandtransfersystem` (
  `baseindierentalproduct_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`baseindierentalproduct_ptr_id`),
  CONSTRAINT `baseindierentalproduct_ptr_id_refs_product_ptr_id_8bafcc7a038a44` FOREIGN KEY (`baseindierentalproduct_ptr_id`) REFERENCES `products_baseindierentalproduct` (`product_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_editandtransfersystem`
--

LOCK TABLES `products_editandtransfersystem` WRITE;
/*!40000 ALTER TABLE `products_editandtransfersystem` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_editandtransfersystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_grip`
--

DROP TABLE IF EXISTS `products_grip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_grip` (
  `baseindierentalproduct_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`baseindierentalproduct_ptr_id`),
  CONSTRAINT `baseindierentalproduct_ptr_id_refs_product_ptr_id_a41b9c899272f1` FOREIGN KEY (`baseindierentalproduct_ptr_id`) REFERENCES `products_baseindierentalproduct` (`product_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_grip`
--

LOCK TABLES `products_grip` WRITE;
/*!40000 ALTER TABLE `products_grip` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_grip` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `products_lighting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_matteboxfollowfocusfilter`
--

DROP TABLE IF EXISTS `products_matteboxfollowfocusfilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_matteboxfollowfocusfilter` (
  `baseindierentalproduct_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`baseindierentalproduct_ptr_id`),
  CONSTRAINT `baseindierentalproduct_ptr_id_refs_product_ptr_id_68f8e73de5d235` FOREIGN KEY (`baseindierentalproduct_ptr_id`) REFERENCES `products_baseindierentalproduct` (`product_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_matteboxfollowfocusfilter`
--

LOCK TABLES `products_matteboxfollowfocusfilter` WRITE;
/*!40000 ALTER TABLE `products_matteboxfollowfocusfilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_matteboxfollowfocusfilter` ENABLE KEYS */;
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
-- Table structure for table `products_multicameraswitcherpackage`
--

DROP TABLE IF EXISTS `products_multicameraswitcherpackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_multicameraswitcherpackage` (
  `baseindierentalproduct_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`baseindierentalproduct_ptr_id`),
  CONSTRAINT `baseindierentalproduct_ptr_id_refs_product_ptr_id_6407350fefd9c0` FOREIGN KEY (`baseindierentalproduct_ptr_id`) REFERENCES `products_baseindierentalproduct` (`product_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_multicameraswitcherpackage`
--

LOCK TABLES `products_multicameraswitcherpackage` WRITE;
/*!40000 ALTER TABLE `products_multicameraswitcherpackage` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_multicameraswitcherpackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_otherservice`
--

DROP TABLE IF EXISTS `products_otherservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_otherservice` (
  `baseindierentalproduct_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`baseindierentalproduct_ptr_id`),
  CONSTRAINT `baseindierentalproduct_ptr_id_refs_product_ptr_id_3fe61752e5b536` FOREIGN KEY (`baseindierentalproduct_ptr_id`) REFERENCES `products_baseindierentalproduct` (`product_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_otherservice`
--

LOCK TABLES `products_otherservice` WRITE;
/*!40000 ALTER TABLE `products_otherservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_otherservice` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_productimage`
--

LOCK TABLES `products_productimage` WRITE;
/*!40000 ALTER TABLE `products_productimage` DISABLE KEYS */;
INSERT INTO `products_productimage` VALUES (1,'products/AudioPackage2.jpg',NULL,'products/AudioPackage2.jpg'),(2,'products/AudioPackage1.jpg',NULL,'products/AudioPackage1.jpg'),(3,'products/AudioPackage1.jpg',NULL,'products/AudioPackage1.jpg'),(4,'products/shotgun.gif',NULL,'products/shotgun.gif'),(5,'products/552Sounddevices.jpg',NULL,'products/552Sounddevices.jpg'),(6,'products/mackie-cfx12-mkii.jpg',NULL,'products/mackie-cfx12-mkii.jpg'),(7,'products/psc_m4mkii.jpg',NULL,'products/psc_m4mkii.jpg'),(8,'products/Promix 3.jpg',NULL,'products/Promix 3.jpg'),(9,'products/sd302.jpg',NULL,'products/sd302.jpg'),(10,'products/lec211tramsm.jpg',NULL,'products/lec211tramsm.jpg'),(11,'products/lec211tramsm.jpg',NULL,'products/lec211tramsm.jpg'),(12,'products/Lectro-SR.jpg',NULL,'products/Lectro-SR.jpg'),(13,'products/Lectro.jpg',NULL,'products/Lectro.jpg'),(14,'products/Electro-Voice-RE50-B.jpg',NULL,'products/Electro-Voice-RE50-B.jpg'),(15,'products/countryman.jpg',NULL,'products/countryman.jpg'),(16,'products/rodemic.jpg',NULL,'products/rodemic.jpg'),(17,'products/Sanken-CS1.jpg',NULL,'products/Sanken-CS1.jpg'),(18,'products/Sennheiser-MKH-60.jpg',NULL,'products/Sennheiser-MKH-60.jpg'),(19,'products/KRAMER-VM1110xl.jpg',NULL,'products/KRAMER-VM1110xl.jpg'),(20,'products/Betasnake.jpg',NULL,'products/Betasnake.jpg'),(21,'products/compack_01.gif',NULL,'products/compack_01.gif'),(22,'products/TCslate.jpg',NULL,'products/TCslate.jpg'),(23,'products/Samson-EXL250.jpg',NULL,'products/Samson-EXL250.jpg'),(24,'products/samson_speakers.jpg',NULL,'products/samson_speakers.jpg'),(25,'products/Headphones.jpg',NULL,'products/Headphones.jpg'),(26,'products/8-8-07-olympus_1.jpg',NULL,'products/8-8-07-olympus_1.jpg'),(27,'products/rycote_kit-4.jpg',NULL,'products/rycote_kit-4.jpg'),(28,'products/hytron.jpg',NULL,'products/hytron.jpg'),(29,'products/AB 4 pin.gif',NULL,'products/AB 4 pin.gif'),(30,'products/Anton Bauer Quad 2702 PowerCharger.jpg',NULL,'products/Anton Bauer Quad 2702 PowerCharger.jpg'),(31,'products/idx_power_supply.jpg',NULL,'products/idx_power_supply.jpg'),(32,'products/jl2plus.jpg',NULL,'products/jl2plus.jpg'),(33,'products/vmount4pin.jpg',NULL,'products/vmount4pin.jpg'),(34,'products/idx_vl-2.jpg',NULL,'products/idx_vl-2.jpg'),(35,'products/IDX-400-NP1.jpg',NULL,'products/IDX-400-NP1.jpg'),(36,'products/gmountliion.jpg',NULL,'products/gmountliion.jpg'),(37,'products/np1.jpg',NULL,'products/np1.jpg'),(38,'products/vmountliion.jpg',NULL,'products/vmountliion.jpg'),(39,'products/Alexa-product-shot.jpg',NULL,'products/Alexa-product-shot.jpg'),(40,'products/CanonC300.jpg',NULL,'products/CanonC300.jpg'),(41,'products/ag-af100_le.jpg',NULL,'products/ag-af100_le.jpg'),(42,'products/provgm.jpg',NULL,'products/provgm.jpg'),(43,'products/epic_package.png',NULL,'products/epic_package.png'),(44,'products/redone-camera.jpg',NULL,'products/redone-camera.jpg'),(45,'products/REDScarletX.jpg',NULL,'products/REDScarletX.jpg'),(46,'products/SonyF3.jpeg',NULL,'products/SonyF3.jpeg'),(47,'products/SonyNEX-FS100.jpg',NULL,'products/SonyNEX-FS100.jpg'),(48,'products/SonyFS700.jpg',NULL,'products/SonyFS700.jpg'),(49,'products/gopro_peices.jpg',NULL,'products/gopro_peices.jpg'),(50,'products/gopro_peices.jpg',NULL,'products/gopro_peices.jpg'),(51,'products/HDX900banner.gif',NULL,'products/HDX900banner.gif'),(52,'products/aj-hpx2700g.jpg',NULL,'products/aj-hpx2700g.jpg'),(53,'products/aghpx500.jpg',NULL,'products/aghpx500.jpg'),(54,'products/i007025.png',NULL,'products/i007025.png'),(55,'products/aghmc150.jpg',NULL,'products/aghmc150.jpg'),(56,'products/hmc160.jpg',NULL,'products/hmc160.jpg'),(57,'products/sanyo_waterproof_camera.jpg',NULL,'products/sanyo_waterproof_camera.jpg'),(58,'products/Sdx900.jpg',NULL,'products/Sdx900.jpg'),(59,'products/sony_ex3.jpg',NULL,'products/sony_ex3.jpg'),(60,'products/SonyEX1R.jpg',NULL,'products/SonyEX1R.jpg'),(61,'products/SonyPDWF800.jpg',NULL,'products/SonyPDWF800.jpg'),(62,'products/z7ufront.jpg',NULL,'products/z7ufront.jpg'),(63,'products/Canon7D.jpg',NULL,'products/Canon7D.jpg'),(64,'products/Canon-5D-Mark-II-web.jpg',NULL,'products/Canon-5D-Mark-II-web.jpg'),(65,'products/5drig.jpg',NULL,'products/5drig.jpg'),(66,'products/Chrosziel_lightweight_DSLR.jpg',NULL,'products/Chrosziel_lightweight_DSLR.jpg'),(67,'products/Blackmagic.png',NULL,'products/Blackmagic.png'),(68,'products/droppedImage.png',NULL,'products/droppedImage.png'),(69,'products/arri353_0.png',NULL,'products/arri353_0.png'),(70,'products/ARRI_SR3.jpg',NULL,'products/ARRI_SR3.jpg'),(71,'products/gopro_peices.jpg',NULL,'products/gopro_peices.jpg'),(72,'products/gopro_peices.jpg',NULL,'products/gopro_peices.jpg'),(73,'products/lytro-2-graphite.jpg',NULL,'products/lytro-2-graphite.jpg'),(74,'products/Timelapse.jpg',NULL,'products/Timelapse.jpg'),(75,'products/sd93.jpg',NULL,'products/sd93.jpg'),(76,'products/45dvcam.jpg',NULL,'products/45dvcam.jpg'),(77,'products/hd1400.jpg',NULL,'products/hd1400.jpg'),(78,'products/PANASONIC.jpg',NULL,'products/PANASONIC.jpg'),(79,'products/P264.jpg',NULL,'products/P264.jpg'),(80,'products/P2reader.jpeg',NULL,'products/P2reader.jpeg'),(81,'products/pix240_main-300x226.jpg',NULL,'products/pix240_main-300x226.jpg'),(82,'products/SxS64.jpg',NULL,'products/SxS64.jpg'),(83,'products/UVW1800.jpg',NULL,'products/UVW1800.jpg'),(84,'products/applecore8.jpg',NULL,'products/applecore8.jpg'),(85,'products/macbook.jpg',NULL,'products/macbook.jpg'),(86,'products/mxo.jpg',NULL,'products/mxo.jpg'),(87,'products/NextoDI backup storage.jpg',NULL,'products/NextoDI backup storage.jpg'),(88,'products/aj-pcd2gpj.jpg',NULL,'products/aj-pcd2gpj.jpg'),(89,'products/gdrive.jpg',NULL,'products/gdrive.jpg'),(90,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(91,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(92,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(93,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(94,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(95,'products/Geminijunior.jpg',NULL,'products/Geminijunior.jpg'),(96,'products/Geminisenior.jpg',NULL,'products/Geminisenior.jpg'),(97,'products/roadflags.jpg',NULL,'products/roadflags.jpg'),(98,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(99,'products/12x12BreakDownFrame.jpg',NULL,'products/12x12BreakDownFrame.jpg'),(100,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(101,'products/12x12double.jpg',NULL,'products/12x12double.jpg'),(102,'products/12x12silk.jpg',NULL,'products/12x12silk.jpg'),(103,'products/12x12single.jpg',NULL,'products/12x12single.jpg'),(104,'products/12x12solid.jpg',NULL,'products/12x12solid.jpg'),(105,'products/20x30_solid.jpg',NULL,'products/20x30_solid.jpg'),(106,'products/6x6quarterSilk.jpg',NULL,'products/6x6quarterSilk.jpg'),(107,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(108,'products/12x12double.jpg',NULL,'products/12x12double.jpg'),(109,'products/6x6 frame.jpg',NULL,'products/6x6 frame.jpg'),(110,'products/12x12silk.jpg',NULL,'products/12x12silk.jpg'),(111,'products/12x12single.jpg',NULL,'products/12x12single.jpg'),(112,'products/12x12solid.jpg',NULL,'products/12x12solid.jpg'),(113,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(114,'products/12x12double.jpg',NULL,'products/12x12double.jpg'),(115,'products/12x12BreakDownFrame.jpg',NULL,'products/12x12BreakDownFrame.jpg'),(116,'products/12x12silk.jpg',NULL,'products/12x12silk.jpg'),(117,'products/12x12single.jpg',NULL,'products/12x12single.jpg'),(118,'products/12x12solid.jpg',NULL,'products/12x12solid.jpg'),(119,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(120,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(121,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(122,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(123,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(124,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(125,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(126,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(127,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(128,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(129,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(130,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(131,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(132,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(133,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(134,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(135,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(136,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(137,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(138,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(139,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(140,'products/roadrags.jpg',NULL,'products/roadrags.jpg'),(141,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(142,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(143,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(144,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(145,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(146,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(147,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(148,'products/AppleBoxStack.jpg',NULL,'products/AppleBoxStack.jpg'),(149,'products/clamp1.jpg',NULL,'products/clamp1.jpg'),(150,'products/clamp2.jpg',NULL,'products/clamp2.jpg'),(151,'products/extension ladder.jpg',NULL,'products/extension ladder.jpg'),(152,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(153,'products/Matthews_gaffer_grip.jpg',NULL,'products/Matthews_gaffer_grip.jpg'),(154,'products/ponyclamp.jpg',NULL,'products/ponyclamp.jpg'),(155,'products/socket_adapter.jpeg',NULL,'products/socket_adapter.jpeg'),(156,'products/clamp3.jpg',NULL,'products/clamp3.jpg'),(157,'products/supermafer.jpg',NULL,'products/supermafer.jpg'),(158,'products/sandBag.jpg',NULL,'products/sandBag.jpg'),(159,'products/shot bag.jpg',NULL,'products/shot bag.jpg'),(160,'products/sound_blanket.jpg',NULL,'products/sound_blanket.jpg'),(161,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(162,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(163,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(164,'products/babyroller.jpg',NULL,'products/babyroller.jpg'),(165,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(166,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(167,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(168,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(169,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(170,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(171,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(172,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(173,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(174,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(175,'products/SeamlessBlueJean.jpg',NULL,'products/SeamlessBlueJean.jpg'),(176,'products/SeamlessCrimson.jpg',NULL,'products/SeamlessCrimson.jpg'),(177,'products/SeamlessDeepYellow.jpg',NULL,'products/SeamlessDeepYellow.jpg'),(178,'products/SeamlessSuperWhite.jpg',NULL,'products/SeamlessSuperWhite.jpg'),(179,'products/10x12Grey.jpg',NULL,'products/10x12Grey.jpg'),(180,'products/10x12WhiteMuslin.jpg',NULL,'products/10x12WhiteMuslin.jpg'),(181,'products/greenScreen.jpg',NULL,'products/greenScreen.jpg'),(182,'products/10x12Charcoal.jpg',NULL,'products/10x12Charcoal.jpg'),(183,'products/greenScreen.jpg',NULL,'products/greenScreen.jpg'),(184,'products/20x30_solid.jpg',NULL,'products/20x30_solid.jpg'),(185,'products/20x30TanRose.jpg',NULL,'products/20x30TanRose.jpg'),(186,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(187,'products/8x8BW.jpg',NULL,'products/8x8BW.jpg'),(188,'products/LiteRingSetup.jpg',NULL,'products/LiteRingSetup.jpg'),(189,'products/UltraPrimes.jpg',NULL,'products/UltraPrimes.jpg'),(190,'products/nikon200.jpg',NULL,'products/nikon200.jpg'),(191,'products/nikon300.jpg',NULL,'products/nikon300.jpg'),(192,'products/Schneider2xExtender.jpg',NULL,'products/Schneider2xExtender.jpg'),(193,'products/superspeeds.jpg',NULL,'products/superspeeds.jpg'),(194,'products/superspeeds.jpg',NULL,'products/superspeeds.jpg'),(195,'products/zeiss135.jpg',NULL,'products/zeiss135.jpg'),(196,'products/ZeissCP2_5lens.jpg',NULL,'products/ZeissCP2_5lens.jpg'),(197,'products/ZeissCP2SuperSpeeds.jpg',NULL,'products/ZeissCP2SuperSpeeds.jpg'),(198,'products/ZeissZE.png',NULL,'products/ZeissZE.png'),(199,'products/droppedImage.png',NULL,'products/droppedImage.png'),(200,'products/zf2.png',NULL,'products/zf2.png'),(201,'products/Angenieux.jpg',NULL,'products/Angenieux.jpg'),(202,'products/Optimo30_80.jpg',NULL,'products/Optimo30_80.jpg'),(203,'products/Canon30_300PL.jpg',NULL,'products/Canon30_300PL.jpg'),(204,'products/Tokina_11-16.jpg',NULL,'products/Tokina_11-16.jpg'),(205,'products/FujiCabrio_19-90.jpg',NULL,'products/FujiCabrio_19-90.jpg'),(206,'products/Lomo_ana_37-140.jpg',NULL,'products/Lomo_ana_37-140.jpg'),(207,'products/optimo16-42.jpg',NULL,'products/optimo16-42.jpg'),(208,'products/Schneider2xExtender.jpg',NULL,'products/Schneider2xExtender.jpg'),(209,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(210,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(211,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(212,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(213,'products/canon16x8HD.gif',NULL,'products/canon16x8HD.gif'),(214,'products/hj11x47bcanonlens.jpg',NULL,'products/hj11x47bcanonlens.jpg'),(215,'products/fugilens.jpg',NULL,'products/fugilens.jpg'),(216,'products/wideangle.jpg',NULL,'products/wideangle.jpg'),(217,'products/canon16_35.jpg',NULL,'products/canon16_35.jpg'),(218,'products/canon17-85.jpg',NULL,'products/canon17-85.jpg'),(219,'products/canon24-105.jpg',NULL,'products/canon24-105.jpg'),(220,'products/Canon24-70.jpg',NULL,'products/Canon24-70.jpg'),(221,'products/canon70-200.jpg',NULL,'products/canon70-200.jpg'),(222,'products/ZeissZE.png',NULL,'products/ZeissZE.png'),(223,'products/droppedImage.png',NULL,'products/droppedImage.png'),(224,'products/zf2.png',NULL,'products/zf2.png'),(225,'products/acm21LensAdapterEX3.jpg',NULL,'products/acm21LensAdapterEX3.jpg'),(226,'products/EOS_NIK_Adapter_Novoflex.jpg',NULL,'products/EOS_NIK_Adapter_Novoflex.jpg'),(227,'products/EOS_PL_Adapter.jpeg',NULL,'products/EOS_PL_Adapter.jpeg'),(228,'products/HDx35_B4-PL.jpg',NULL,'products/HDx35_B4-PL.jpg'),(229,'products/MFT_EOS_Adapter.jpg',NULL,'products/MFT_EOS_Adapter.jpg'),(230,'products/MFT_NIK_adapter.jpg',NULL,'products/MFT_NIK_adapter.jpg'),(231,'products/MFT_PL_Adapter.jpg',NULL,'products/MFT_PL_Adapter.jpg'),(232,'products/EX3Wide.jpg',NULL,'products/EX3Wide.jpg'),(233,'products/Lensbaby.jpg',NULL,'products/Lensbaby.jpg'),(234,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(235,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(236,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(237,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(238,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(239,'products/micro-force-zoom.jpg',NULL,'products/micro-force-zoom.jpg'),(240,'products/OppHandle_noMF.jpg',NULL,'products/OppHandle_noMF.jpg'),(241,'products/VarizoomHMC160.jpg',NULL,'products/VarizoomHMC160.jpg'),(242,'products/VarizoomEX.jpg',NULL,'products/VarizoomEX.jpg'),(243,'products/arri1200.jpg',NULL,'products/arri1200.jpg'),(244,'products/Bron800.jpg',NULL,'products/Bron800.jpg'),(245,'products/arri400PocketPAR.jpg',NULL,'products/arri400PocketPAR.jpg'),(246,'products/large_1484.jpg',NULL,'products/large_1484.jpg'),(247,'products/1000wDimmer.jpg',NULL,'products/1000wDimmer.jpg'),(248,'products/arri150.jpg',NULL,'products/arri150.jpg'),(249,'products/arri300.jpg',NULL,'products/arri300.jpg'),(250,'products/arri4.jpg',NULL,'products/arri4.jpg'),(251,'products/arri600.jpg',NULL,'products/arri600.jpg'),(252,'products/arri.jpg',NULL,'products/arri.jpg'),(253,'products/arri1000.jpg',NULL,'products/arri1000.jpg'),(254,'products/sourcefour.jpg',NULL,'products/sourcefour.jpg'),(255,'products/kino400.jpg',NULL,'products/kino400.jpg'),(256,'products/KIT-2GF-S120-New_2009.gif',NULL,'products/KIT-2GF-S120-New_2009.gif'),(257,'products/kino400.jpg',NULL,'products/kino400.jpg'),(258,'products/Barfly100.gif',NULL,'products/Barfly100.gif'),(259,'products/litepanel.jpg',NULL,'products/litepanel.jpg'),(260,'products/litepanel.jpg',NULL,'products/litepanel.jpg'),(261,'products/LightP2x1-fa-m.jpg',NULL,'products/LightP2x1-fa-m.jpg'),(262,'products/lightpanels kit.jpg',NULL,'products/lightpanels kit.jpg'),(263,'products/Litepanels_Micropro.JPG',NULL,'products/Litepanels_Micropro.JPG'),(264,'products/litepanels_mini500.jpg',NULL,'products/litepanels_mini500.jpg'),(265,'products/dedolight.jpg',NULL,'products/dedolight.jpg'),(266,'products/kamio-system.jpg',NULL,'products/kamio-system.jpg'),(267,'products/liteRingGreen.jpg',NULL,'products/liteRingGreen.jpg'),(268,'products/ABULS.jpg',NULL,'products/ABULS.jpg'),(269,'products/hmifrezzi.jpg',NULL,'products/hmifrezzi.jpg'),(270,'products/Frezzi.jpg',NULL,'products/Frezzi.jpg'),(271,'products/swingmatte-3.jpg',NULL,'products/swingmatte-3.jpg'),(272,'products/arriLMB5weyebrow.jpg',NULL,'products/arriLMB5weyebrow.jpg'),(273,'products/ArriMB-14MaskSet.jpg',NULL,'products/ArriMB-14MaskSet.jpg'),(274,'products/arri_mb20ii.jpeg',NULL,'products/arri_mb20ii.jpeg'),(275,'products/Chrosziel4x4MB.jpg',NULL,'products/Chrosziel4x4MB.jpg'),(276,'products/Chrosziel_5.65MB.jpg',NULL,'products/Chrosziel_5.65MB.jpg'),(277,'products/petroff442mb.jpg',NULL,'products/petroff442mb.jpg'),(278,'products/Arri_FF4.jpg',NULL,'products/Arri_FF4.jpg'),(279,'products/ArriFF5.jpg',NULL,'products/ArriFF5.jpg'),(280,'products/Arri_MFF1.jpg',NULL,'products/Arri_MFF1.jpg'),(281,'products/BartecWFF.jpg',NULL,'products/BartecWFF.jpg'),(282,'products/CFF-1-010_02.jpg',NULL,'products/CFF-1-010_02.jpg'),(283,'products/Petroff_lw_ff.jpg',NULL,'products/Petroff_lw_ff.jpg'),(284,'products/138Diopter.jpg',NULL,'products/138Diopter.jpg'),(285,'products/138Diopter.jpg',NULL,'products/138Diopter.jpg'),(286,'products/138Diopter.jpg',NULL,'products/138Diopter.jpg'),(287,'products/RotaPola.jpeg',NULL,'products/RotaPola.jpeg'),(288,'products/TIF44BPM12.jpg',NULL,'products/TIF44BPM12.jpg'),(289,'products/TIF44BPM14.jpg',NULL,'products/TIF44BPM14.jpg'),(290,'products/4pointstar.jpg',NULL,'products/4pointstar.jpg'),(291,'products/TIF44812.jpg',NULL,'products/TIF44812.jpg'),(292,'products/44CirclePola.jpg',NULL,'products/44CirclePola.jpg'),(293,'products/TIF44Clr.jpg',NULL,'products/TIF44Clr.jpg'),(294,'products/cgb3.jpg',NULL,'products/cgb3.jpg'),(295,'products/44choc2clr.jpg',NULL,'products/44choc2clr.jpg'),(296,'products/gradSEND6.jpg',NULL,'products/gradSEND6.jpg'),(297,'products/44cgsun2.jpg',NULL,'products/44cgsun2.jpg'),(298,'products/TIFPM3.jpg',NULL,'products/TIFPM3.jpg'),(299,'products/4x4_soft_net_black_2_tiffen.jpg',NULL,'products/4x4_soft_net_black_2_tiffen.jpg'),(300,'products/4x5.65DayforNight.jpg',NULL,'products/4x5.65DayforNight.jpg'),(301,'products/4x5.65ND3.jpg',NULL,'products/4x5.65ND3.jpg'),(302,'products/4x5.65ND6.jpg',NULL,'products/4x5.65ND6.jpg'),(303,'products/4x5.65nd9.jpg',NULL,'products/4x5.65nd9.jpg'),(304,'products/4x5.65Pola.jpg',NULL,'products/4x5.65Pola.jpg'),(305,'products/4x5.65IR.jpg',NULL,'products/4x5.65IR.jpg'),(306,'products/5.65x5.65ND9.jpg',NULL,'products/5.65x5.65ND9.jpg'),(307,'products/565IR.jpg',NULL,'products/565IR.jpg'),(308,'products/565ND3.jpg',NULL,'products/565ND3.jpg'),(309,'products/565ND6.jpg',NULL,'products/565ND6.jpg'),(310,'products/565IRND12.jpg',NULL,'products/565IRND12.jpg'),(311,'products/565pola.jpg',NULL,'products/565pola.jpg'),(312,'products/TIF44Clr.jpg',NULL,'products/TIF44Clr.jpg'),(313,'products/565pola.jpg',NULL,'products/565pola.jpg'),(314,'products/565IR.jpg',NULL,'products/565IR.jpg'),(315,'products/565ND3.jpg',NULL,'products/565ND3.jpg'),(316,'products/565ND6.jpg',NULL,'products/565ND6.jpg'),(317,'products/5.65x5.65ND9.jpg',NULL,'products/5.65x5.65ND9.jpg'),(318,'products/565pola.jpg',NULL,'products/565pola.jpg'),(319,'products/82mmCircularFilterPack.jpg',NULL,'products/82mmCircularFilterPack.jpg'),(320,'products/FLanders17.jpeg',NULL,'products/FLanders17.jpeg'),(321,'products/Flanders-LM-0950W.jpg',NULL,'products/Flanders-LM-0950W.jpg'),(322,'products/Panansonic17.bmp',NULL,'products/Panansonic17.bmp'),(323,'products/bhlh900a.jpg',NULL,'products/bhlh900a.jpg'),(324,'products/Panasonic26_monitor.jpg',NULL,'products/Panasonic26_monitor.jpg'),(325,'products/panasonicbt.jpg',NULL,'products/panasonicbt.jpg'),(326,'products/BTLH1700WANGLE.jpg',NULL,'products/BTLH1700WANGLE.jpg'),(327,'products/DP4.jpg',NULL,'products/DP4.jpg'),(328,'products/DP6.JPG',NULL,'products/DP6.JPG'),(329,'products/sony13.jpg',NULL,'products/sony13.jpg'),(330,'products/sony19.jpg',NULL,'products/sony19.jpg'),(331,'products/TeradekPackage.png',NULL,'products/TeradekPackage.png'),(332,'products/tvlogic_vfm5.6.jpg',NULL,'products/tvlogic_vfm5.6.jpg'),(333,'products/TVLogicAlphatron.jpg',NULL,'products/TVLogicAlphatron.jpg'),(334,'products/clearcom.jpg',NULL,'products/clearcom.jpg'),(335,'products/HPXflypack2.jpg',NULL,'products/HPXflypack2.jpg'),(336,'products/EX3flypack2.jpg',NULL,'products/EX3flypack2.jpg'),(337,'products/HPXflypack3.jpg',NULL,'products/HPXflypack3.jpg'),(338,'products/EX3flypack3.jpg',NULL,'products/EX3flypack3.jpg'),(339,'products/HUM-1.JPG',NULL,'products/HUM-1.JPG'),(340,'products/av-hs400n.gif',NULL,'products/av-hs400n.gif'),(341,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(342,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(343,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(344,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(345,'products/duplicate.jpg',NULL,'products/duplicate.jpg'),(346,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(347,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(348,'products/dvcam.jpg',NULL,'products/dvcam.jpg'),(349,'products/dvcpro.jpg',NULL,'products/dvcpro.jpg'),(350,'products/hdv.jpg',NULL,'products/hdv.jpg'),(351,'products/minidv.jpg',NULL,'products/minidv.jpg'),(352,'products/HiBriteTeleprompter.jpg',NULL,'products/HiBriteTeleprompter.jpg'),(353,'products/Prompter.jpg',NULL,'products/Prompter.jpg'),(354,'products/Ambient_clockit.jpg',NULL,'products/Ambient_clockit.jpg'),(355,'products/Blackmagic.png',NULL,'products/Blackmagic.png'),(356,'products/pix240_main-300x226.jpg',NULL,'products/pix240_main-300x226.jpg'),(357,'products/tvlogic_vfm5.6.jpg',NULL,'products/tvlogic_vfm5.6.jpg'),(358,'products/ArriHead.JPG',NULL,'products/ArriHead.JPG'),(359,'products/CartoniDutchHead.jpg',NULL,'products/CartoniDutchHead.jpg'),(360,'products/lambda.jpg',NULL,'products/lambda.jpg'),(361,'products/high-hat.gif',NULL,'products/high-hat.gif'),(362,'products/manfrotto755xb.jpeg',NULL,'products/manfrotto755xb.jpeg'),(363,'products/o-connor-2065.jpg',NULL,'products/o-connor-2065.jpg'),(364,'products/oconner2575.jpg',NULL,'products/oconner2575.jpg'),(365,'products/OConnorBabyLegs.jpg',NULL,'products/OConnorBabyLegs.jpg'),(366,'products/OConnorStandardLegs.jpg',NULL,'products/OConnorStandardLegs.jpg'),(367,'products/babylegs.jpg',NULL,'products/babylegs.jpg'),(368,'products/ronford.jpg',NULL,'products/ronford.jpg'),(369,'products/satchler11.jpg',NULL,'products/satchler11.jpg'),(370,'products/Sachtler18S1.jpg',NULL,'products/Sachtler18S1.jpg'),(371,'products/sachtler-video-20-11-tb.jpg',NULL,'products/sachtler-video-20-11-tb.jpg'),(372,'products/dv4.jpg',NULL,'products/dv4.jpg'),(373,'products/SachtlerDV6.jpg',NULL,'products/SachtlerDV6.jpg'),(374,'products/Sachtler System 15.jpg',NULL,'products/Sachtler System 15.jpg'),(375,'products/Sachtler_FSB8.JPG',NULL,'products/Sachtler_FSB8.JPG'),(376,'products/Dana Dolly.jpeg',NULL,'products/Dana Dolly.jpeg'),(377,'products/logo_noimage.gif',NULL,'products/logo_noimage.gif'),(378,'products/PHANTOM.gif',NULL,'products/PHANTOM.gif'),(379,'products/roundydolly.jpg',NULL,'products/roundydolly.jpg'),(380,'products/Platform-Dolly-410.jpg',NULL,'products/Platform-Dolly-410.jpg'),(381,'products/2050.jpg',NULL,'products/2050.jpg'),(382,'products/2050.jpg',NULL,'products/2050.jpg'),(383,'products/jib2.jpg',NULL,'products/jib2.jpg'),(384,'products/Dana Dolly.jpeg',NULL,'products/Dana Dolly.jpeg'),(385,'products/MyTSkate.jpg',NULL,'products/MyTSkate.jpg'),(386,'products/MYT_GLIDE_M_8.jpg',NULL,'products/MYT_GLIDE_M_8.jpg'),(387,'products/MYT_GLIDE_M_6.jpg',NULL,'products/MYT_GLIDE_M_6.jpg'),(388,'products/blackbirdBalPos.jpg',NULL,'products/blackbirdBalPos.jpg'),(389,'products/steadicamMerlin.jpg',NULL,'products/steadicamMerlin.jpg'),(390,'products/blackbirdBalPos.jpg',NULL,'products/blackbirdBalPos.jpg'),(391,'products/EasyRig3.jpg',NULL,'products/EasyRig3.jpg'),(392,'products/GenusHeavyDutyPad.jpg',NULL,'products/GenusHeavyDutyPad.jpg'),(393,'products/GenusPad.jpg',NULL,'products/GenusPad.jpg'),(394,'products/Ogrips1.jpeg',NULL,'products/Ogrips1.jpeg'),(395,'products/steadicamMerlin.jpg',NULL,'products/steadicamMerlin.jpg'),(396,'products/Zacuto_Double_Barrel.jpg',NULL,'products/Zacuto_Double_Barrel.jpg'),(397,'products/carmount.jpg',NULL,'products/carmount.jpg'),(398,'products/cinesaddle.jpg',NULL,'products/cinesaddle.jpg'),(399,'products/EasyRig3.jpg',NULL,'products/EasyRig3.jpg'),(400,'products/dalite.jpg',NULL,'products/dalite.jpg'),(401,'products/sanyo.jpg',NULL,'products/sanyo.jpg');
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
-- Table structure for table `products_tapestock`
--

DROP TABLE IF EXISTS `products_tapestock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_tapestock` (
  `baseindierentalproduct_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`baseindierentalproduct_ptr_id`),
  CONSTRAINT `baseindierentalproduct_ptr_id_refs_product_ptr_id_75a9281dcc5e9c` FOREIGN KEY (`baseindierentalproduct_ptr_id`) REFERENCES `products_baseindierentalproduct` (`product_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_tapestock`
--

LOCK TABLES `products_tapestock` WRITE;
/*!40000 ALTER TABLE `products_tapestock` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_tapestock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_teleprompter`
--

DROP TABLE IF EXISTS `products_teleprompter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_teleprompter` (
  `baseindierentalproduct_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`baseindierentalproduct_ptr_id`),
  CONSTRAINT `baseindierentalproduct_ptr_id_refs_product_ptr_id_3e4bab9741ccec` FOREIGN KEY (`baseindierentalproduct_ptr_id`) REFERENCES `products_baseindierentalproduct` (`product_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_teleprompter`
--

LOCK TABLES `products_teleprompter` WRITE;
/*!40000 ALTER TABLE `products_teleprompter` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_teleprompter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_timecodeandsignalconversion`
--

DROP TABLE IF EXISTS `products_timecodeandsignalconversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_timecodeandsignalconversion` (
  `baseindierentalproduct_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`baseindierentalproduct_ptr_id`),
  CONSTRAINT `baseindierentalproduct_ptr_id_refs_product_ptr_id_9b36f213d49f34` FOREIGN KEY (`baseindierentalproduct_ptr_id`) REFERENCES `products_baseindierentalproduct` (`product_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_timecodeandsignalconversion`
--

LOCK TABLES `products_timecodeandsignalconversion` WRITE;
/*!40000 ALTER TABLE `products_timecodeandsignalconversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_timecodeandsignalconversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_tripoddollysupportrig`
--

DROP TABLE IF EXISTS `products_tripoddollysupportrig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_tripoddollysupportrig` (
  `baseindierentalproduct_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`baseindierentalproduct_ptr_id`),
  CONSTRAINT `baseindierentalproduct_ptr_id_refs_product_ptr_id_4017dcb4b7a1b5` FOREIGN KEY (`baseindierentalproduct_ptr_id`) REFERENCES `products_baseindierentalproduct` (`product_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_tripoddollysupportrig`
--

LOCK TABLES `products_tripoddollysupportrig` WRITE;
/*!40000 ALTER TABLE `products_tripoddollysupportrig` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_tripoddollysupportrig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_videoprojection`
--

DROP TABLE IF EXISTS `products_videoprojection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_videoprojection` (
  `baseindierentalproduct_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`baseindierentalproduct_ptr_id`),
  CONSTRAINT `baseindierentalproduct_ptr_id_refs_product_ptr_id_1012f94a56c83f` FOREIGN KEY (`baseindierentalproduct_ptr_id`) REFERENCES `products_baseindierentalproduct` (`product_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_videoprojection`
--

LOCK TABLES `products_videoprojection` WRITE;
/*!40000 ALTER TABLE `products_videoprojection` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_videoprojection` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_simplecategories_category`
--

LOCK TABLES `shop_simplecategories_category` WRITE;
/*!40000 ALTER TABLE `shop_simplecategories_category` DISABLE KEYS */;
INSERT INTO `shop_simplecategories_category` VALUES (1,'Audio','audio',NULL,0),(2,'Batteries & Power','batteries-power',NULL,0),(3,'Cameras','cameras',NULL,0),(4,'Digital Recorders, Media, VTRs','digital-recorders-media-vtrs',NULL,0),(5,'Edit & Transfer Systems','edit-transfer-systems',NULL,0),(6,'Grip','grip',NULL,0),(7,'Lenses and Accessories','lenses-and-accessories',NULL,0),(8,'Lighting','lighting',NULL,0),(9,'Matte Box, Follow Focus, Filters','matte-box-follow-focus-filters',NULL,0),(10,'Monitors','monitors',NULL,0),(11,'Multi-Camera Switcher Packages','multi-camera-switcher-packages',NULL,0),(12,'Other Services','other-services',NULL,0),(13,'Tape Stock','tape-stock',NULL,0),(14,'Teleprompter','teleprompter',NULL,0),(15,'Timecode and Signal Conversion','timecode-and-signal-conversion',NULL,0),(16,'Tripods, Dollies, Support Rigs','tripods-dollies-support-rigs',NULL,0),(17,'Video Projection','video-projection',NULL,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'products','0001_initial','2012-11-30 00:27:36'),(2,'products','0002_auto__add_field_baseindierentalproduct_quantity','2012-11-30 00:28:50'),(3,'products','0003_auto__add_field_baseindierentalproduct_short_description__add_field_ba','2012-12-09 17:44:51'),(4,'products','0004_auto__del_field_productimage_product__chg_field_productimage_descripti','2012-12-14 02:28:27'),(5,'products','0005_auto__add_videoprojection__add_tapestock__add_matteboxfollowfocusfilte','2012-12-14 03:15:17');
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

-- Dump completed on 2012-12-13 22:15:28
