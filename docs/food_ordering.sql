-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: food_ordering
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Current Database: `food_ordering`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `food_ordering` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `food_ordering`;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Hoàng');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,24),(2,1,28),(3,1,44);
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add order',6,'add_order'),(22,'Can change order',6,'change_order'),(23,'Can delete order',6,'delete_order'),(24,'Can view order',6,'view_order'),(25,'Can add order item',7,'add_orderitem'),(26,'Can change order item',7,'change_orderitem'),(27,'Can delete order item',7,'delete_orderitem'),(28,'Can view order item',7,'view_orderitem'),(29,'Can add payment report',8,'add_paymentreport'),(30,'Can change payment report',8,'change_paymentreport'),(31,'Can delete payment report',8,'delete_paymentreport'),(32,'Can view payment report',8,'view_paymentreport'),(33,'Can add revenue report',9,'add_revenuereport'),(34,'Can change revenue report',9,'change_revenuereport'),(35,'Can delete revenue report',9,'delete_revenuereport'),(36,'Can view revenue report',9,'view_revenuereport'),(37,'Can add customer request',10,'add_customerrequest'),(38,'Can change customer request',10,'change_customerrequest'),(39,'Can delete customer request',10,'delete_customerrequest'),(40,'Can view customer request',10,'view_customerrequest'),(41,'Can add user',11,'add_user'),(42,'Can change user',11,'change_user'),(43,'Can delete user',11,'delete_user'),(44,'Can view user',11,'view_user'),(45,'Can add menu item',12,'add_menuitem'),(46,'Can change menu item',12,'change_menuitem'),(47,'Can delete menu item',12,'delete_menuitem'),(48,'Can view menu item',12,'view_menuitem');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_customerrequest`
--

DROP TABLE IF EXISTS `customer_customerrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_customerrequest` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `table_number` varchar(10) NOT NULL,
  `request_type` varchar(20) NOT NULL,
  `note` longtext,
  `created_at` datetime(6) NOT NULL,
  `is_handled` tinyint(1) NOT NULL,
  `customer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_customerrequest_customer_id_545b7ac8_fk_users_user_id` (`customer_id`),
  CONSTRAINT `customer_customerrequest_customer_id_545b7ac8_fk_users_user_id` FOREIGN KEY (`customer_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_customerrequest`
--

LOCK TABLES `customer_customerrequest` WRITE;
/*!40000 ALTER TABLE `customer_customerrequest` DISABLE KEYS */;
INSERT INTO `customer_customerrequest` VALUES (1,'1','towel','','2026-10-01 22:51:49.295000',1,2),(2,'1','towel','','2026-10-01 22:53:44.185000',1,2),(3,'1','towel','1','2026-10-02 02:32:10.771000',1,2),(4,'2','chopsticks','adsdcadca','2026-10-02 02:33:43.618000',1,2),(5,'2','chopsticks','adsdcadca','2026-10-02 02:33:53.456000',1,2),(6,'2','towel','','2026-10-02 02:37:42.581000',1,2),(7,'1','ice','','2026-10-02 02:43:54.912000',1,2),(8,'2','ice','','2026-10-02 03:00:58.757000',1,2),(9,'3','ice','','2026-10-18 04:31:48.911077',0,NULL);
/*!40000 ALTER TABLE `customer_customerrequest` ENABLE KEYS */;
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
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(10,'customer','customerrequest'),(12,'menu','menuitem'),(6,'orders','order'),(7,'orders','orderitem'),(8,'reports','paymentreport'),(9,'reports','revenuereport'),(5,'sessions','session'),(11,'users','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-10-02 03:40:10.228924'),(2,'contenttypes','0002_remove_content_type_name','2026-10-02 03:40:10.379336'),(3,'auth','0001_initial','2026-10-02 03:40:10.844837'),(4,'auth','0002_alter_permission_name_max_length','2026-10-02 03:40:10.935266'),(5,'auth','0003_alter_user_email_max_length','2026-10-02 03:40:10.943350'),(6,'auth','0004_alter_user_username_opts','2026-10-02 03:40:10.950760'),(7,'auth','0005_alter_user_last_login_null','2026-10-02 03:40:10.959381'),(8,'auth','0006_require_contenttypes_0002','2026-10-02 03:40:10.963652'),(9,'auth','0007_alter_validators_add_error_messages','2026-10-02 03:40:10.972033'),(10,'auth','0008_alter_user_username_max_length','2026-10-02 03:40:10.979811'),(11,'auth','0009_alter_user_last_name_max_length','2026-10-02 03:40:10.988133'),(12,'auth','0010_alter_group_name_max_length','2026-10-02 03:40:11.005955'),(13,'auth','0011_update_proxy_permissions','2026-10-02 03:40:11.018702'),(14,'auth','0012_alter_user_first_name_max_length','2026-10-02 03:40:11.025867'),(15,'users','0001_initial','2026-10-02 03:40:11.492729'),(16,'admin','0001_initial','2026-10-02 03:40:11.717948'),(17,'admin','0002_logentry_remove_auto_add','2026-10-02 03:40:11.727630'),(18,'admin','0003_logentry_add_action_flag_choices','2026-10-02 03:40:11.737153'),(19,'customer','0001_initial','2026-10-02 03:40:11.767042'),(20,'customer','0002_initial','2026-10-02 03:40:11.863560'),(21,'customer','0003_alter_customerrequest_customer','2026-10-02 03:40:12.047711'),(22,'menu','0001_initial','2026-10-02 03:40:12.077487'),(23,'menu','0002_menuitem_image_alter_menuitem_price','2026-10-02 03:40:12.127380'),(24,'orders','0001_initial','2026-10-02 03:40:12.175444'),(25,'orders','0002_initial','2026-10-02 03:40:12.469285'),(26,'orders','0003_order_table_number_alter_order_customer_and_more','2026-10-02 03:40:12.719291'),(27,'reports','0001_initial','2026-10-02 03:40:12.766846'),(28,'sessions','0001_initial','2026-10-02 03:40:12.809673'),(29,'users','0002_alter_user_role','2026-10-02 03:40:12.821094'),(30,'orders','0004_alter_order_status','2026-10-18 04:27:23.555138'),(31,'menu','0003_alter_menuitem_options_alter_menuitem_description_and_more','2026-11-13 01:49:48.694486'),(32,'orders','0005_alter_order_options_alter_orderitem_options_and_more','2026-11-13 01:49:48.758148'),(33,'orders','0006_order_is_paid_order_payment_notified','2026-11-13 01:49:48.875200');
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
INSERT INTO `django_session` VALUES ('1iq0pnhwoz5xkruvfyt1ebnfxb4wmqcd','eyJvcmRlcl9pZCI6MTh9:1xP8KR:nZsmpF1pTiplhAeZI4ylEDyXnYc2cp-o9Xmrr982HmU','2026-11-20 01:01:15.166366'),('3944mi5vdpcz2jp0rqf99ypzslf67rym','eyJvcmRlcl9pZCI6MTV9:1xExv5:KSOukIwXhO98lKWjm6nNDOlgq1cSGIlB2zcOJasqwJQ','2026-10-22 23:53:03.170676'),('4ut9jsw718ldxdxrddlym0sawl8oxuoo','eyJvcmRlcl9pZCI6MTZ9:1xP8KJ:3cW4e2HtGUWf8OR86VdNckBnXCuQmIAVxpzA_NqrVtE','2026-11-20 01:01:07.004448'),('busfvrwbmitozfhilec4xj51ydhac74e','.eJxVjMsOwiAQAP9lz4ZAeQg9eu83NAu7SNVAUtqT8d9Nkx70OjOZN8y4b2XeO6_zQjCCgssvi5ieXA9BD6z3JlKr27pEcSTitF1Mjfh1O9u_QcFeYASj7ZUTKUcSs09J6-hzlsxoLWtDQXubLWoOLkZvKBmUVqHnIQSTBwefLwJhOG8:1x4le5:C2WfZ8P8NAh0ogJf-rgBorHAOllnLJn30BrCkuXPr9c','2026-09-24 20:45:21.608000'),('cprfudyk3wyvlnghy34ytmvbngpbi350','eyJvcmRlcl9pZCI6MTd9:1xP8KM:B7ZHNNDBzLblfUOqmncHHFgZU1CYwcGA0IWn_h_lLew','2026-11-20 01:01:10.507996'),('lmn351inc07sfjfo4c6eqo1hxmcm7af6','eyJvcmRlcl9pZCI6MjB9:1xP8Ka:YNe-VQckv9ms9vSXh0b6zp-tCA3WzU_9DPJqIsLW79w','2026-11-20 01:01:24.754047'),('oupcigfgv9pzxxedwci2rk7raeb9z0cd','eyJvcmRlcl9pZCI6MjR9:1xP8Kw:QyTY4o96oD08ZHq3byvrH3JDDNK5efcLHWoNK2Uwek8','2026-11-20 01:01:46.914105'),('qm4v86hocxclrzgybwvgyhschx9fpjae','eyJvcmRlcl9pZCI6MjN9:1xP8Kg:h0je-2TiUYCbgsyO4gyNY_Px0q4KzZ8HpnFmWmY9p24','2026-11-20 01:01:30.535889'),('vywk3bvo9uznum3mwy1vminfjp1brz57','eyJvcmRlcl9pZCI6MTl9:1xP8KV:rujUUG2cCVxgMAdLZdjyI_y8KWYw6LcxQZhiEjFlb2c','2026-11-20 01:01:19.596662'),('wqgdkxrsblslqsizij5lqg7xqgsy34n9','eyJvcmRlcl9pZCI6MTN9:1xDti0:ygVKo8M5JVYfplU4cwHCEN4KDA12jWrCm5gWO1hcFU0','2026-10-20 01:11:08.389611'),('y6k7gip1zvflaofcv7frptmlcmnsn54e','.eJxVjjsOwjAQBe-ydWTFX-yU9JwhWnvXOIBsKU4qxN1RpBTQvhmN3htm3Lcy753XeSGYQMLwu0VMT64HoAfWexOp1W1dojgUcdIubo34dT3dv0DBXmACo-2FE0lHI2afktbR5zwyo7WsDQXtbbaoObgYvaFkcLQSPasQTFYOBmgrnSeV-nwBODA8xQ:1xP8Kg:VuTpECStrAXd-6sbAGwPRDzVhPIZb4F7RIDPVkALnIE','2026-11-20 01:01:30.520238');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_menuitem`
--

DROP TABLE IF EXISTS `menu_menuitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_menuitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_menuitem`
--

LOCK TABLES `menu_menuitem` WRITE;
/*!40000 ALTER TABLE `menu_menuitem` DISABLE KEYS */;
INSERT INTO `menu_menuitem` VALUES (1,'Phở','',30000.00,'menu_images/images.jpg'),(2,'Cơm chiên thập cẩm','',25000.00,'menu_images/images_1.jpg'),(3,'Cơm chiên dưa bò','',35000.00,'menu_images/images_2.jpg'),(4,'coca cola','',15000.00,'menu_images/images_3.jpg'),(5,'sprite','',15000.00,'menu_images/images_4.jpg');
/*!40000 ALTER TABLE `menu_menuitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_order`
--

DROP TABLE IF EXISTS `orders_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `customer_id` bigint DEFAULT NULL,
  `table_number` varchar(10) NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `payment_notified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_order_customer_id_0b76f6a4_fk_users_user_id` (`customer_id`),
  CONSTRAINT `orders_order_customer_id_0b76f6a4_fk_users_user_id` FOREIGN KEY (`customer_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_order`
--

LOCK TABLES `orders_order` WRITE;
/*!40000 ALTER TABLE `orders_order` DISABLE KEYS */;
INSERT INTO `orders_order` VALUES (1,'done','2026-10-01 22:03:27.927000',2,'',0,0),(2,'pending','2026-10-01 23:10:17.337000',2,'7',0,0),(3,'pending','2026-10-01 23:12:23.080000',2,'7',0,0),(4,'pending','2026-10-02 00:53:29.737000',2,'1',0,0),(5,'pending','2026-10-02 02:31:54.527000',2,'1',0,0),(6,'pending','2026-10-02 02:34:03.809000',2,'2',0,0),(7,'pending','2026-10-02 02:37:12.563000',2,'3',0,0),(8,'pending','2026-10-02 02:55:54.802000',2,'3',0,0),(9,'pending','2026-10-02 02:56:10.960000',2,'6',0,0),(10,'pending','2026-10-02 03:00:33.478000',2,'1',0,0),(11,'pending','2026-10-02 03:01:16.211000',2,'4',0,0),(12,'pending','2026-10-02 03:24:21.414000',NULL,'9',0,0),(13,'cart','2026-10-06 01:11:08.355283',NULL,'',0,0),(14,'pending','2026-10-06 01:14:11.929234',NULL,'7',0,0),(15,'cart','2026-10-08 23:53:03.089630',NULL,'',0,0),(16,'cart','2026-11-06 01:01:06.902550',NULL,'',0,0),(17,'cart','2026-11-06 01:01:10.483112',NULL,'',0,0),(18,'cart','2026-11-06 01:01:15.142793',NULL,'',0,0),(19,'cart','2026-11-06 01:01:19.570202',NULL,'',0,0),(20,'cart','2026-11-06 01:01:24.727585',NULL,'',0,0),(21,'pending','2026-11-06 01:01:24.961170',NULL,'1',0,0),(22,'cart','2026-11-06 01:01:30.474396',1,'',0,0),(23,'cart','2026-11-06 01:01:30.527675',NULL,'',0,0),(24,'cart','2026-11-06 01:01:46.885106',NULL,'',0,0);
/*!40000 ALTER TABLE `orders_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_orderitem`
--

DROP TABLE IF EXISTS `orders_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `note` longtext,
  `menu_item_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_orderitem_menu_item_id_72e84539_fk_menu_menuitem_id` (`menu_item_id`),
  KEY `orders_orderitem_order_id_fe61a34d_fk_orders_order_id` (`order_id`),
  CONSTRAINT `orders_orderitem_menu_item_id_72e84539_fk_menu_menuitem_id` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_menuitem` (`id`),
  CONSTRAINT `orders_orderitem_order_id_fe61a34d_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`),
  CONSTRAINT `orders_orderitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_orderitem`
--

LOCK TABLES `orders_orderitem` WRITE;
/*!40000 ALTER TABLE `orders_orderitem` DISABLE KEYS */;
INSERT INTO `orders_orderitem` VALUES (2,1,NULL,3,2),(3,1,NULL,4,2),(5,2,NULL,2,4),(6,1,NULL,4,4),(7,1,NULL,1,5),(8,1,NULL,2,5),(9,1,NULL,1,6),(10,1,NULL,4,6),(11,1,NULL,1,7),(12,1,NULL,1,8),(13,1,NULL,2,8),(14,1,NULL,1,9),(15,1,NULL,4,9),(16,1,NULL,1,10),(17,1,NULL,1,11),(18,2,NULL,1,12),(19,1,NULL,2,12),(20,1,NULL,2,14),(21,1,NULL,3,14),(22,1,NULL,1,14),(23,1,NULL,4,14),(24,1,NULL,1,16),(25,1,NULL,1,17),(26,1,NULL,1,18),(27,1,NULL,1,19),(30,1,NULL,1,20);
/*!40000 ALTER TABLE `orders_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_paymentreport`
--

DROP TABLE IF EXISTS `reports_paymentreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports_paymentreport` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `method` varchar(20) NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `total_transactions` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_paymentreport`
--

LOCK TABLES `reports_paymentreport` WRITE;
/*!40000 ALTER TABLE `reports_paymentreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_paymentreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_revenuereport`
--

DROP TABLE IF EXISTS `reports_revenuereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports_revenuereport` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_revenue` decimal(12,2) NOT NULL,
  `total_orders` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_revenuereport`
--

LOCK TABLES `reports_revenuereport` WRITE;
/*!40000 ALTER TABLE `reports_revenuereport` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_revenuereport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user`
--

DROP TABLE IF EXISTS `users_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user`
--

LOCK TABLES `users_user` WRITE;
/*!40000 ALTER TABLE `users_user` DISABLE KEYS */;
INSERT INTO `users_user` VALUES (1,'pbkdf2_sha256$1500000$q0Mcy7qCTWmvynBSAAGZAn$+LCXQWeJSBC4QblMbJZtxf6AphWQG773iWgm71Ak1FY=','2026-11-06 01:01:30.426273',1,'phuc2006','','','cybercy1234@gmail.com',1,1,'2026-09-10 20:42:26.290000','staff'),(2,'pbkdf2_sha256$1500000$VplYKSgtOi696cTLsynSA1$BaVHlbNOvrhBJC2DhWtGsi4hTfiChWVr4vi0GYnp2NU=','2026-10-02 03:06:04.566000',1,'phuc2006K','','','cybercy1234@gmail.com',1,1,'2026-10-01 21:05:38.530000','staff'),(3,'pbkdf2_sha256$1000000$TZG0fopWX7JCFaHZ6cnR34$Cdv+OVT08k3uEuaHVONF69dWhkbvD2xxxBzHVvj5LdQ=',NULL,1,'admin01','','','',1,1,'2026-11-13 01:13:46.752922','admin'),(4,'pbkdf2_sha256$1000000$NzTwkThzVAbrXJFLzOl5HI$sW1hLTxvKv0G/xILjZWywuImSsEoLZV95+XDmUiaurE=',NULL,0,'cashier01','','','',0,1,'2026-11-13 01:13:47.124997','cashier'),(5,'pbkdf2_sha256$1000000$rMGLhzQNisgmKSIxv1GVnV$QeepzT7pm0knoFPUT/yfmzWD+VQCGsLIVeNzKyPaWlc=',NULL,0,'cashier02','','','',0,1,'2026-11-13 01:13:47.430878','cashier'),(6,'pbkdf2_sha256$1000000$UR3rnK4d8qRVkMA2QrbG1c$SYVglf+e7OJPZqLVl0FSm7u8v4OkwG3e5itOFGE6XS4=',NULL,0,'chef01','','','',0,1,'2026-11-13 01:13:47.794995','chef'),(7,'pbkdf2_sha256$1000000$mcBlIPxIegUVdRWtcdFp9o$8sOL/2bsgYkwEFChCL1G347sD3he63U9NVKRoMS38j0=',NULL,0,'chef02','','','',0,1,'2026-11-13 01:13:48.099631','chef'),(8,'pbkdf2_sha256$1000000$dHbIiOgDgotcCpXCVwzOpt$y5cVfTUsCiQymTNKFKet/uPW7FMKZ3FE2C/8RoMj1so=',NULL,0,'chef03','','','',0,1,'2026-11-13 01:13:48.426807','chef'),(9,'pbkdf2_sha256$1000000$hKQbfHDkDvIYAznYAPNjtf$UX6VMgXcg5foOdox/8bQVio8HkuljhwIuWZeikP/wjY=',NULL,0,'customer01','','','',0,1,'2026-11-13 01:13:48.733138','customer'),(10,'pbkdf2_sha256$1000000$baKsafpu4fNSikFcDn0ATh$0TzeDV9x9C5EnuCMAeajs55lHjf6dDWVkex2weeyK7E=',NULL,0,'customer02','','','',0,1,'2026-11-13 01:13:49.044487','customer'),(11,'pbkdf2_sha256$1000000$253W6IhmpTd032LwehQqtE$8v0zA2ft5axFyjKNZ63wb/f4HlOTlV/sVOCd+5/uj2M=',NULL,0,'customer03','','','',0,1,'2026-11-13 01:13:49.400913','customer'),(12,'pbkdf2_sha256$1000000$6x4GvyxATVf41QwvpimCHm$wOqT7SMvJs10TM8/wh6FJ4XgfHPAnVrOro0OQ6ujYXg=',NULL,0,'customer04','','','',0,1,'2026-11-13 01:13:49.709961','customer');
/*!40000 ALTER TABLE `users_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_groups`
--

DROP TABLE IF EXISTS `users_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_groups_user_id_group_id_b88eab82_uniq` (`user_id`,`group_id`),
  KEY `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_user_groups_user_id_5f6f5a90_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_groups`
--

LOCK TABLES `users_user_groups` WRITE;
/*!40000 ALTER TABLE `users_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_user_permissions`
--

DROP TABLE IF EXISTS `users_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_user_permissions_user_id_permission_id_43338c45_uniq` (`user_id`,`permission_id`),
  KEY `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_user_permissions_user_id_20aca447_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_user_permissions`
--

LOCK TABLES `users_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'food_ordering'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-13  9:51:37
