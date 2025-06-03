-- MySQL dump 10.13  Distrib 8.4.5, for Linux (x86_64)
--
-- Host: localhost    Database: Ecommerce
-- ------------------------------------------------------
-- Server version	8.4.5

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
-- Table structure for table `ab_permission`
--

DROP TABLE IF EXISTS `ab_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ab_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ab_permission_name_uq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_permission`
--

LOCK TABLES `ab_permission` WRITE;
/*!40000 ALTER TABLE `ab_permission` DISABLE KEYS */;
INSERT INTO `ab_permission` VALUES (3,'can_create'),(4,'can_delete'),(1,'can_edit'),(2,'can_read'),(5,'menu_access');
/*!40000 ALTER TABLE `ab_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_permission_view`
--

DROP TABLE IF EXISTS `ab_permission_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ab_permission_view` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permission_id` int DEFAULT NULL,
  `view_menu_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ab_permission_view_permission_id_view_menu_id_uq` (`permission_id`,`view_menu_id`),
  KEY `ab_permission_view_view_menu_id_fkey` (`view_menu_id`),
  CONSTRAINT `ab_permission_view_permission_id_fkey` FOREIGN KEY (`permission_id`) REFERENCES `ab_permission` (`id`),
  CONSTRAINT `ab_permission_view_view_menu_id_fkey` FOREIGN KEY (`view_menu_id`) REFERENCES `ab_view_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_permission_view`
--

LOCK TABLES `ab_permission_view` WRITE;
/*!40000 ALTER TABLE `ab_permission_view` DISABLE KEYS */;
INSERT INTO `ab_permission_view` VALUES (1,1,4),(3,1,5),(5,1,6),(9,1,8),(15,1,11),(28,1,23),(38,1,27),(44,1,29),(55,1,33),(61,1,34),(68,1,37),(83,1,44),(81,1,49),(2,2,4),(4,2,5),(6,2,6),(8,2,8),(14,2,11),(18,2,13),(20,2,15),(22,2,17),(24,2,19),(27,2,23),(32,2,25),(34,2,26),(37,2,27),(43,2,29),(47,2,30),(49,2,31),(51,2,32),(54,2,33),(58,2,34),(62,2,35),(64,2,36),(67,2,37),(71,2,38),(86,2,40),(84,2,44),(89,2,45),(88,2,46),(80,2,49),(87,2,50),(90,2,51),(91,2,52),(92,2,53),(93,2,54),(7,3,8),(13,3,11),(26,3,23),(36,3,27),(42,3,29),(53,3,33),(66,3,37),(94,3,46),(10,4,8),(16,4,11),(29,4,23),(39,4,27),(45,4,29),(56,4,33),(60,4,34),(69,4,37),(72,4,38),(85,4,44),(95,4,46),(82,4,49),(11,5,9),(12,5,10),(17,5,12),(19,5,14),(21,5,16),(23,5,18),(25,5,20),(30,5,23),(31,5,24),(33,5,25),(35,5,26),(40,5,27),(41,5,28),(46,5,29),(48,5,30),(50,5,31),(52,5,32),(57,5,33),(59,5,34),(63,5,35),(65,5,36),(70,5,37),(73,5,38),(74,5,40),(75,5,44),(76,5,45),(77,5,46),(78,5,47),(79,5,48);
/*!40000 ALTER TABLE `ab_permission_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_permission_view_role`
--

DROP TABLE IF EXISTS `ab_permission_view_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ab_permission_view_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permission_view_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ab_permission_view_role_permission_view_id_role_id_uq` (`permission_view_id`,`role_id`),
  KEY `ab_permission_view_role_role_id_fkey` (`role_id`),
  CONSTRAINT `ab_permission_view_role_permission_view_id_fkey` FOREIGN KEY (`permission_view_id`) REFERENCES `ab_permission_view` (`id`),
  CONSTRAINT `ab_permission_view_role_role_id_fkey` FOREIGN KEY (`role_id`) REFERENCES `ab_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_permission_view_role`
--

LOCK TABLES `ab_permission_view_role` WRITE;
/*!40000 ALTER TABLE `ab_permission_view_role` DISABLE KEYS */;
INSERT INTO `ab_permission_view_role` VALUES (1,1,1),(2,2,1),(3,3,1),(91,3,3),(123,3,4),(164,3,5),(4,4,1),(90,4,3),(122,4,4),(163,4,5),(5,5,1),(93,5,3),(125,5,4),(166,5,5),(6,6,1),(92,6,3),(124,6,4),(165,6,5),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,21,1),(22,22,1),(23,23,1),(24,24,1),(25,25,1),(26,26,1),(149,26,4),(190,26,5),(27,27,1),(83,27,3),(115,27,4),(156,27,5),(28,28,1),(150,28,4),(191,28,5),(29,29,1),(151,29,4),(192,29,5),(30,30,1),(103,30,3),(135,30,4),(176,30,5),(31,31,1),(100,31,3),(132,31,4),(173,31,5),(32,32,1),(89,32,3),(121,32,4),(162,32,5),(33,33,1),(108,33,3),(140,33,4),(181,33,5),(34,34,1),(35,35,1),(36,36,1),(210,36,5),(37,37,1),(211,37,5),(38,38,1),(212,38,5),(39,39,1),(213,39,5),(40,40,1),(199,40,5),(41,41,1),(195,41,5),(42,42,1),(146,42,4),(187,42,5),(43,43,1),(96,43,3),(128,43,4),(169,43,5),(44,44,1),(147,44,4),(188,44,5),(45,45,1),(148,45,4),(189,45,5),(46,46,1),(111,46,3),(143,46,4),(184,46,5),(47,47,1),(48,48,1),(49,49,1),(50,50,1),(51,51,1),(194,51,5),(52,52,1),(196,52,5),(53,53,1),(202,53,5),(54,54,1),(203,54,5),(55,55,1),(204,55,5),(56,56,1),(205,56,5),(57,57,1),(197,57,5),(58,58,1),(95,58,3),(127,58,4),(168,58,5),(59,59,1),(110,59,3),(142,59,4),(183,59,5),(60,60,1),(61,61,1),(62,62,1),(94,62,3),(126,62,4),(167,62,5),(63,63,1),(109,63,3),(141,63,4),(182,63,5),(64,64,1),(209,64,5),(65,65,1),(200,65,5),(66,66,1),(206,66,5),(67,67,1),(86,67,3),(118,67,4),(159,67,5),(68,68,1),(207,68,5),(69,69,1),(208,69,5),(70,70,1),(198,70,5),(71,71,1),(98,71,3),(130,71,4),(171,71,5),(72,72,1),(214,72,5),(73,73,1),(201,73,5),(74,74,1),(102,74,3),(134,74,4),(175,74,5),(75,75,1),(101,75,3),(133,75,4),(174,75,5),(76,76,1),(105,76,3),(137,76,4),(178,76,5),(77,77,1),(104,77,3),(136,77,4),(177,77,5),(78,78,1),(106,78,3),(138,78,4),(179,78,5),(79,79,1),(107,79,3),(139,79,4),(180,79,5),(225,83,1),(144,83,4),(185,83,5),(216,84,1),(80,84,3),(112,84,4),(153,84,5),(226,85,1),(145,85,4),(186,85,5),(217,86,1),(81,86,3),(113,86,4),(154,86,5),(218,87,1),(82,87,3),(114,87,4),(155,87,5),(219,88,1),(84,88,3),(116,88,4),(157,88,5),(220,89,1),(85,89,3),(117,89,4),(158,89,5),(221,90,1),(87,90,3),(119,90,4),(160,90,5),(222,91,1),(88,91,3),(120,91,4),(161,91,5),(223,92,1),(97,92,3),(129,92,4),(170,92,5),(224,93,1),(99,93,3),(131,93,4),(172,93,5),(227,94,1),(152,94,4),(193,94,5),(228,95,1),(215,95,5);
/*!40000 ALTER TABLE `ab_permission_view_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_register_user`
--

DROP TABLE IF EXISTS `ab_register_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ab_register_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(256) NOT NULL,
  `last_name` varchar(256) NOT NULL,
  `username` varchar(512) NOT NULL,
  `password` varchar(256) DEFAULT NULL,
  `email` varchar(512) NOT NULL,
  `registration_date` datetime DEFAULT NULL,
  `registration_hash` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ab_register_user_username_uq` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_register_user`
--

LOCK TABLES `ab_register_user` WRITE;
/*!40000 ALTER TABLE `ab_register_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `ab_register_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_role`
--

DROP TABLE IF EXISTS `ab_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ab_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ab_role_name_uq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_role`
--

LOCK TABLES `ab_role` WRITE;
/*!40000 ALTER TABLE `ab_role` DISABLE KEYS */;
INSERT INTO `ab_role` VALUES (1,'Admin'),(5,'Op'),(2,'Public'),(4,'User'),(3,'Viewer');
/*!40000 ALTER TABLE `ab_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_user`
--

DROP TABLE IF EXISTS `ab_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ab_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(256) NOT NULL,
  `last_name` varchar(256) NOT NULL,
  `username` varchar(512) NOT NULL,
  `password` varchar(256) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `email` varchar(512) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `login_count` int DEFAULT NULL,
  `fail_login_count` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `changed_on` datetime DEFAULT NULL,
  `created_by_fk` int DEFAULT NULL,
  `changed_by_fk` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ab_user_username_uq` (`username`),
  UNIQUE KEY `ab_user_email_uq` (`email`),
  KEY `ab_user_created_by_fk_fkey` (`created_by_fk`),
  KEY `ab_user_changed_by_fk_fkey` (`changed_by_fk`),
  CONSTRAINT `ab_user_changed_by_fk_fkey` FOREIGN KEY (`changed_by_fk`) REFERENCES `ab_user` (`id`),
  CONSTRAINT `ab_user_created_by_fk_fkey` FOREIGN KEY (`created_by_fk`) REFERENCES `ab_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_user`
--

LOCK TABLES `ab_user` WRITE;
/*!40000 ALTER TABLE `ab_user` DISABLE KEYS */;
INSERT INTO `ab_user` VALUES (1,'Air','Flow','admin','pbkdf2:sha256:260000$TUy5NvwZZjZyfFEr$5793eec08d75ca38a524d70e4ec8cc0a956a2d2584452fd440a5eb0ea53b7239',1,'admin@example.com','2025-05-23 13:39:20',1,0,'2025-05-23 13:37:37','2025-05-23 13:37:37',NULL,NULL);
/*!40000 ALTER TABLE `ab_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_user_role`
--

DROP TABLE IF EXISTS `ab_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ab_user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ab_user_role_user_id_role_id_uq` (`user_id`,`role_id`),
  KEY `ab_user_role_role_id_fkey` (`role_id`),
  CONSTRAINT `ab_user_role_role_id_fkey` FOREIGN KEY (`role_id`) REFERENCES `ab_role` (`id`),
  CONSTRAINT `ab_user_role_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `ab_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_user_role`
--

LOCK TABLES `ab_user_role` WRITE;
/*!40000 ALTER TABLE `ab_user_role` DISABLE KEYS */;
INSERT INTO `ab_user_role` VALUES (1,1,1);
/*!40000 ALTER TABLE `ab_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_view_menu`
--

DROP TABLE IF EXISTS `ab_view_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ab_view_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ab_view_menu_name_uq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_view_menu`
--

LOCK TABLES `ab_view_menu` WRITE;
/*!40000 ALTER TABLE `ab_view_menu` DISABLE KEYS */;
INSERT INTO `ab_view_menu` VALUES (16,'Actions'),(28,'Admin'),(22,'Airflow'),(26,'Audit Logs'),(7,'AuthDBView'),(21,'AutocompleteView'),(24,'Browse'),(45,'Cluster Activity'),(32,'Configurations'),(33,'Connections'),(50,'DAG Code'),(40,'DAG Dependencies'),(23,'DAG Runs'),(52,'DAG Warnings'),(49,'DAG:incremental_etl_dag'),(39,'DagDependenciesView'),(44,'DAGs'),(46,'Datasets'),(42,'DevView'),(48,'Docs'),(43,'DocsView'),(47,'Documentation'),(51,'ImportError'),(1,'IndexView'),(25,'Jobs'),(12,'List Roles'),(9,'List Users'),(3,'LocaleView'),(5,'My Password'),(6,'My Profile'),(4,'Passwords'),(20,'Permission Pairs'),(19,'Permission Views'),(15,'Permissions'),(35,'Plugins'),(37,'Pools'),(36,'Providers'),(41,'RedocView'),(18,'Resources'),(11,'Roles'),(10,'Security'),(34,'SLA Misses'),(29,'Task Instances'),(53,'Task Logs'),(30,'Task Reschedules'),(31,'Triggers'),(13,'User Stats Chart'),(14,'User\'s Statistics'),(8,'Users'),(2,'UtilView'),(27,'Variables'),(17,'View Menus'),(54,'Website'),(38,'XComs');
/*!40000 ALTER TABLE `ab_view_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('1949afb29106');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `callback_request`
--

DROP TABLE IF EXISTS `callback_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `callback_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(6) NOT NULL,
  `priority_weight` int NOT NULL,
  `callback_data` json NOT NULL,
  `callback_type` varchar(20) NOT NULL,
  `processor_subdir` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `callback_request`
--

LOCK TABLES `callback_request` WRITE;
/*!40000 ALTER TABLE `callback_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `callback_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connection`
--

DROP TABLE IF EXISTS `connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connection` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conn_id` varchar(250) NOT NULL,
  `conn_type` varchar(500) NOT NULL,
  `description` text,
  `host` varchar(500) DEFAULT NULL,
  `schema` varchar(500) DEFAULT NULL,
  `login` text,
  `password` text,
  `port` int DEFAULT NULL,
  `is_encrypted` tinyint(1) DEFAULT NULL,
  `is_extra_encrypted` tinyint(1) DEFAULT NULL,
  `extra` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `connection_conn_id_uq` (`conn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connection`
--

LOCK TABLES `connection` WRITE;
/*!40000 ALTER TABLE `connection` DISABLE KEYS */;
INSERT INTO `connection` VALUES (1,'airflow_db','mysql',NULL,'mysql','airflow','root',NULL,NULL,0,0,NULL),(2,'athena_default','athena',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL),(3,'aws_default','aws',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL),(4,'azure_batch_default','azure_batch',NULL,NULL,NULL,'<ACCOUNT_NAME>',NULL,NULL,0,0,'{\"account_url\": \"<ACCOUNT_URL>\"}'),(5,'azure_cosmos_default','azure_cosmos',NULL,NULL,NULL,NULL,NULL,NULL,0,0,'{\"database_name\": \"<DATABASE_NAME>\", \"collection_name\": \"<COLLECTION_NAME>\" }'),(6,'azure_data_explorer_default','azure_data_explorer',NULL,'https://<CLUSTER>.kusto.windows.net',NULL,NULL,NULL,NULL,0,0,'{\"auth_method\": \"<AAD_APP | AAD_APP_CERT | AAD_CREDS | AAD_DEVICE>\",\n                    \"tenant\": \"<TENANT ID>\", \"certificate\": \"<APPLICATION PEM CERTIFICATE>\",\n                    \"thumbprint\": \"<APPLICATION CERTIFICATE THUMBPRINT>\"}'),(7,'azure_data_lake_default','azure_data_lake',NULL,NULL,NULL,NULL,NULL,NULL,0,0,'{\"tenant\": \"<TENANT>\", \"account_name\": \"<ACCOUNTNAME>\" }'),(8,'azure_default','azure',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL),(9,'cassandra_default','cassandra',NULL,'cassandra',NULL,NULL,NULL,9042,0,0,NULL),(10,'databricks_default','databricks',NULL,'localhost',NULL,NULL,NULL,NULL,0,0,NULL),(11,'dingding_default','http',NULL,'',NULL,NULL,NULL,NULL,0,0,NULL),(12,'drill_default','drill',NULL,'localhost',NULL,NULL,NULL,8047,0,0,'{\"dialect_driver\": \"drill+sadrill\", \"storage_plugin\": \"dfs\"}'),(13,'druid_broker_default','druid',NULL,'druid-broker',NULL,NULL,NULL,8082,0,0,'{\"endpoint\": \"druid/v2/sql\"}'),(14,'druid_ingest_default','druid',NULL,'druid-overlord',NULL,NULL,NULL,8081,0,0,'{\"endpoint\": \"druid/indexer/v1/task\"}'),(15,'elasticsearch_default','elasticsearch',NULL,'localhost','http',NULL,NULL,9200,0,0,NULL),(16,'emr_default','emr',NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\n                {   \"Name\": \"default_job_flow_name\",\n                    \"LogUri\": \"s3://my-emr-log-bucket/default_job_flow_location\",\n                    \"ReleaseLabel\": \"emr-4.6.0\",\n                    \"Instances\": {\n                        \"Ec2KeyName\": \"mykey\",\n                        \"Ec2SubnetId\": \"somesubnet\",\n                        \"InstanceGroups\": [\n                            {\n                                \"Name\": \"Master nodes\",\n                                \"Market\": \"ON_DEMAND\",\n                                \"InstanceRole\": \"MASTER\",\n                                \"InstanceType\": \"r3.2xlarge\",\n                                \"InstanceCount\": 1\n                            },\n                            {\n                                \"Name\": \"Core nodes\",\n                                \"Market\": \"ON_DEMAND\",\n                                \"InstanceRole\": \"CORE\",\n                                \"InstanceType\": \"r3.2xlarge\",\n                                \"InstanceCount\": 1\n                            }\n                        ],\n                        \"TerminationProtected\": false,\n                        \"KeepJobFlowAliveWhenNoSteps\": false\n                    },\n                    \"Applications\":[\n                        { \"Name\": \"Spark\" }\n                    ],\n                    \"VisibleToAllUsers\": true,\n                    \"JobFlowRole\": \"EMR_EC2_DefaultRole\",\n                    \"ServiceRole\": \"EMR_DefaultRole\",\n                    \"Tags\": [\n                        {\n                            \"Key\": \"app\",\n                            \"Value\": \"analytics\"\n                        },\n                        {\n                            \"Key\": \"environment\",\n                            \"Value\": \"development\"\n                        }\n                    ]\n                }\n            '),(17,'facebook_default','facebook_social',NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\n                {   \"account_id\": \"<AD_ACCOUNT_ID>\",\n                    \"app_id\": \"<FACEBOOK_APP_ID>\",\n                    \"app_secret\": \"<FACEBOOK_APP_SECRET>\",\n                    \"access_token\": \"<FACEBOOK_AD_ACCESS_TOKEN>\"\n                }\n            '),(18,'fs_default','fs',NULL,NULL,NULL,NULL,NULL,NULL,0,0,'{\"path\": \"/\"}'),(19,'ftp_default','ftp',NULL,'localhost',NULL,'airflow','airflow',21,0,0,'{\"key_file\": \"~/.ssh/id_rsa\", \"no_host_key_check\": true}'),(20,'google_cloud_default','google_cloud_platform',NULL,NULL,'default',NULL,NULL,NULL,0,0,NULL),(21,'hive_cli_default','hive_cli',NULL,'localhost','default',NULL,NULL,10000,0,0,'{\"use_beeline\": true, \"auth\": \"\"}'),(22,'hiveserver2_default','hiveserver2',NULL,'localhost','default',NULL,NULL,10000,0,0,NULL),(23,'http_default','http',NULL,'https://www.httpbin.org/',NULL,NULL,NULL,NULL,0,0,NULL),(24,'impala_default','impala',NULL,'localhost',NULL,NULL,NULL,21050,0,0,NULL),(25,'kafka_default','kafka',NULL,NULL,NULL,NULL,NULL,NULL,0,0,'{\"bootstrap.servers\": \"broker:29092\"}'),(26,'kubernetes_default','kubernetes',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL),(27,'kylin_default','kylin',NULL,'localhost',NULL,'ADMIN','KYLIN',7070,0,0,NULL),(28,'leveldb_default','leveldb',NULL,'localhost',NULL,NULL,NULL,NULL,0,0,NULL),(29,'livy_default','livy',NULL,'livy',NULL,NULL,NULL,8998,0,0,NULL),(30,'local_mysql','mysql',NULL,'localhost','airflow','airflow','airflow',NULL,0,0,NULL),(31,'metastore_default','hive_metastore',NULL,'localhost',NULL,NULL,NULL,9083,0,0,'{\"authMechanism\": \"PLAIN\"}'),(32,'mongo_default','mongo',NULL,'mongo',NULL,NULL,NULL,27017,0,0,NULL),(33,'mssql_default','mssql',NULL,'localhost',NULL,NULL,NULL,1433,0,0,NULL),(34,'mysql_default','mysql',NULL,'mysql','airflow','root',NULL,NULL,0,0,NULL),(35,'opsgenie_default','http',NULL,'',NULL,NULL,NULL,NULL,0,0,NULL),(36,'oracle_default','oracle',NULL,'localhost','schema','root','password',1521,0,0,NULL),(37,'oss_default','oss',NULL,NULL,NULL,NULL,NULL,NULL,0,0,'{\n                \"auth_type\": \"AK\",\n                \"access_key_id\": \"<ACCESS_KEY_ID>\",\n                \"access_key_secret\": \"<ACCESS_KEY_SECRET>\",\n                \"region\": \"<YOUR_OSS_REGION>\"}\n                '),(38,'pig_cli_default','pig_cli',NULL,NULL,'default',NULL,NULL,NULL,0,0,NULL),(39,'pinot_admin_default','pinot',NULL,'localhost',NULL,NULL,NULL,9000,0,0,NULL),(40,'pinot_broker_default','pinot',NULL,'localhost',NULL,NULL,NULL,9000,0,0,'{\"endpoint\": \"/query\", \"schema\": \"http\"}'),(41,'postgres_default','postgres',NULL,'postgres','airflow','postgres','airflow',NULL,0,0,NULL),(42,'presto_default','presto',NULL,'localhost','hive',NULL,NULL,3400,0,0,NULL),(43,'qdrant_default','qdrant',NULL,'qdrant',NULL,NULL,NULL,6333,0,0,NULL),(44,'redis_default','redis',NULL,'redis',NULL,NULL,NULL,6379,0,0,'{\"db\": 0}'),(45,'redshift_default','redshift',NULL,NULL,NULL,NULL,NULL,NULL,0,0,'{\n    \"iam\": true,\n    \"cluster_identifier\": \"<REDSHIFT_CLUSTER_IDENTIFIER>\",\n    \"port\": 5439,\n    \"profile\": \"default\",\n    \"db_user\": \"awsuser\",\n    \"database\": \"dev\",\n    \"region\": \"\"\n}'),(46,'salesforce_default','salesforce',NULL,NULL,NULL,'username','password',NULL,0,0,'{\"security_token\": \"security_token\"}'),(47,'segment_default','segment',NULL,NULL,NULL,NULL,NULL,NULL,0,0,'{\"write_key\": \"my-segment-write-key\"}'),(48,'sftp_default','sftp',NULL,'localhost',NULL,'airflow',NULL,22,0,0,'{\"key_file\": \"~/.ssh/id_rsa\", \"no_host_key_check\": true}'),(49,'spark_default','spark',NULL,'yarn',NULL,NULL,NULL,NULL,0,0,'{\"queue\": \"root.default\"}'),(50,'sqlite_default','sqlite',NULL,'/tmp/sqlite_default.db',NULL,NULL,NULL,NULL,0,0,NULL),(51,'ssh_default','ssh',NULL,'localhost',NULL,NULL,NULL,NULL,0,0,NULL),(52,'tableau_default','tableau',NULL,'https://tableau.server.url',NULL,'user','password',NULL,0,0,'{\"site_id\": \"my_site\"}'),(53,'tabular_default','tabular',NULL,'https://api.tabulardata.io/ws/v1',NULL,NULL,NULL,NULL,0,0,NULL),(54,'teradata_default','teradata',NULL,'localhost','schema','user','password',NULL,0,0,NULL),(55,'trino_default','trino',NULL,'localhost','hive',NULL,NULL,3400,0,0,NULL),(56,'vertica_default','vertica',NULL,'localhost',NULL,NULL,NULL,5433,0,0,NULL),(57,'wasb_default','wasb',NULL,NULL,NULL,NULL,NULL,NULL,0,0,'{\"sas_token\": null}'),(58,'webhdfs_default','hdfs',NULL,'localhost',NULL,NULL,NULL,50070,0,0,NULL),(59,'yandexcloud_default','yandexcloud',NULL,NULL,'default',NULL,NULL,NULL,0,0,NULL);
/*!40000 ALTER TABLE `connection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dag`
--

DROP TABLE IF EXISTS `dag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dag` (
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `root_dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `is_paused` tinyint(1) DEFAULT NULL,
  `is_subdag` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `last_parsed_time` timestamp(6) NULL DEFAULT NULL,
  `last_pickled` timestamp(6) NULL DEFAULT NULL,
  `last_expired` timestamp(6) NULL DEFAULT NULL,
  `scheduler_lock` tinyint(1) DEFAULT NULL,
  `pickle_id` int DEFAULT NULL,
  `fileloc` varchar(2000) DEFAULT NULL,
  `processor_subdir` varchar(2000) DEFAULT NULL,
  `owners` varchar(2000) DEFAULT NULL,
  `dag_display_name` varchar(2000) DEFAULT NULL,
  `description` text,
  `default_view` varchar(25) DEFAULT NULL,
  `schedule_interval` text,
  `timetable_description` varchar(1000) DEFAULT NULL,
  `dataset_expression` json DEFAULT NULL,
  `max_active_tasks` int NOT NULL,
  `max_active_runs` int DEFAULT NULL,
  `max_consecutive_failed_dag_runs` int NOT NULL,
  `has_task_concurrency_limits` tinyint(1) NOT NULL,
  `has_import_errors` tinyint(1) DEFAULT '0',
  `next_dagrun` timestamp(6) NULL DEFAULT NULL,
  `next_dagrun_data_interval_start` timestamp(6) NULL DEFAULT NULL,
  `next_dagrun_data_interval_end` timestamp(6) NULL DEFAULT NULL,
  `next_dagrun_create_after` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`dag_id`),
  KEY `idx_root_dag_id` (`root_dag_id`),
  KEY `idx_next_dagrun_create_after` (`next_dagrun_create_after`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dag`
--

LOCK TABLES `dag` WRITE;
/*!40000 ALTER TABLE `dag` DISABLE KEYS */;
INSERT INTO `dag` VALUES ('incremental_etl_dag',NULL,0,0,1,'2025-05-23 09:43:09.808927',NULL,NULL,NULL,NULL,'/opt/airflow/dags/incremental_etl_dag.py','/opt/airflow/dags','airflow',NULL,NULL,'grid','\"@hourly\"','Every hour','null',16,16,0,0,0,'2025-05-23 09:30:00.000000','2025-05-23 09:30:00.000000','2025-05-23 10:30:00.000000','2025-05-23 10:30:00.000000');
/*!40000 ALTER TABLE `dag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dag_code`
--

DROP TABLE IF EXISTS `dag_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dag_code` (
  `fileloc_hash` bigint NOT NULL,
  `fileloc` varchar(2000) NOT NULL,
  `last_updated` timestamp(6) NOT NULL,
  `source_code` mediumtext NOT NULL,
  PRIMARY KEY (`fileloc_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dag_code`
--

LOCK TABLES `dag_code` WRITE;
/*!40000 ALTER TABLE `dag_code` DISABLE KEYS */;
INSERT INTO `dag_code` VALUES (40036800307039991,'/opt/airflow/dags/incremental_etl_dag.py','2025-05-23 09:15:50.150430','from airflow import DAG\nfrom airflow.operators.python import PythonOperator\nfrom airflow.models import Variable\nfrom datetime import datetime, timedelta\nimport extract, api_fetch, transform_load\n\ndefault_args = {\n    \'owner\': \'airflow\',\n    \'retries\': 1,\n    \'retry_delay\': timedelta(minutes=1),\n}\n\ndef etl_db():\n    last_id = int(Variable.get(\"last_db_id\", default_var=\"0\"))\n    data = extract.fetch_from_db(last_id)\n    if not data.empty:\n        max_id = data[\'id\'].max()\n        transform_load.process_and_save(data.to_dict(orient=\'records\'), \'/opt/airflow/data/db_data\')\n        Variable.set(\"last_db_id\", max_id)\n\ndef etl_api():\n    last_time = Variable.get(\"last_api_ts\", default_var=\"2024-01-01T00:00:00Z\")\n    data = api_fetch.fetch_from_api(last_time)\n    if data:\n        new_time = max(item[\'updated_at\'] for item in data)\n        transform_load.process_and_save(data, \'/opt/airflow/data/api_data\')\n        Variable.set(\"last_api_ts\", new_time)\n\nwith DAG(\"incremental_etl_dag\", start_date=datetime(2024, 1, 1),\n         schedule_interval=\"@hourly\", catchup=False, default_args=default_args) as dag:\n\n    db_task = PythonOperator(task_id=\"db_incremental\", python_callable=etl_db)\n    api_task = PythonOperator(task_id=\"api_incremental\", python_callable=etl_api)\n\ndb_task >> api_task\n');
/*!40000 ALTER TABLE `dag_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dag_owner_attributes`
--

DROP TABLE IF EXISTS `dag_owner_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dag_owner_attributes` (
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `owner` varchar(500) NOT NULL,
  `link` varchar(500) NOT NULL,
  PRIMARY KEY (`dag_id`,`owner`),
  CONSTRAINT `dag.dag_id` FOREIGN KEY (`dag_id`) REFERENCES `dag` (`dag_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dag_owner_attributes`
--

LOCK TABLES `dag_owner_attributes` WRITE;
/*!40000 ALTER TABLE `dag_owner_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `dag_owner_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dag_pickle`
--

DROP TABLE IF EXISTS `dag_pickle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dag_pickle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pickle` blob,
  `created_dttm` timestamp(6) NULL DEFAULT NULL,
  `pickle_hash` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dag_pickle`
--

LOCK TABLES `dag_pickle` WRITE;
/*!40000 ALTER TABLE `dag_pickle` DISABLE KEYS */;
/*!40000 ALTER TABLE `dag_pickle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dag_run`
--

DROP TABLE IF EXISTS `dag_run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dag_run` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `queued_at` timestamp(6) NULL DEFAULT NULL,
  `execution_date` timestamp(6) NOT NULL,
  `start_date` timestamp(6) NULL DEFAULT NULL,
  `end_date` timestamp(6) NULL DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `run_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `creating_job_id` int DEFAULT NULL,
  `external_trigger` tinyint(1) DEFAULT NULL,
  `run_type` varchar(50) NOT NULL,
  `conf` blob,
  `data_interval_start` timestamp(6) NULL DEFAULT NULL,
  `data_interval_end` timestamp(6) NULL DEFAULT NULL,
  `last_scheduling_decision` timestamp(6) NULL DEFAULT NULL,
  `dag_hash` varchar(32) DEFAULT NULL,
  `log_template_id` int DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `clear_number` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dag_run_dag_id_execution_date_key` (`dag_id`,`execution_date`),
  UNIQUE KEY `dag_run_dag_id_run_id_key` (`dag_id`,`run_id`),
  KEY `task_instance_log_template_id_fkey` (`log_template_id`),
  KEY `idx_dag_run_dag_id` (`dag_id`),
  KEY `idx_dag_run_running_dags` (`state`,`dag_id`),
  KEY `idx_last_scheduling_decision` (`last_scheduling_decision`),
  KEY `idx_dag_run_queued_dags` (`state`,`dag_id`),
  KEY `dag_id_state` (`dag_id`,`state`),
  CONSTRAINT `task_instance_log_template_id_fkey` FOREIGN KEY (`log_template_id`) REFERENCES `log_template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dag_run`
--

LOCK TABLES `dag_run` WRITE;
/*!40000 ALTER TABLE `dag_run` DISABLE KEYS */;
INSERT INTO `dag_run` VALUES (1,'incremental_etl_dag','2025-05-23 08:09:27.632148','2025-05-23 08:09:27.576488','2025-05-23 08:09:28.218199','2025-05-23 09:00:44.222241','failed','manual__2025-05-23T08:09:27.576488+00:00',NULL,1,'manual',_binary '€}”.','2025-05-23 06:30:00.000000','2025-05-23 07:30:00.000000','2025-05-23 09:00:44.212986','b581b3eb4c2290a386902558f4e88a3f',2,'2025-05-23 09:00:44.224534',0),(2,'incremental_etl_dag','2025-05-23 08:09:28.165208','2025-05-23 06:30:00.000000','2025-05-23 08:09:28.217818','2025-05-23 09:00:44.241047','failed','scheduled__2025-05-23T06:30:00+00:00',1,0,'scheduled',_binary '€}”.','2025-05-23 06:30:00.000000','2025-05-23 07:30:00.000000','2025-05-23 09:00:44.235448','b581b3eb4c2290a386902558f4e88a3f',2,'2025-05-23 09:00:44.242208',0),(3,'incremental_etl_dag','2025-05-23 09:00:41.614455','2025-05-23 07:30:00.000000','2025-05-23 09:00:41.643411','2025-05-23 09:01:45.465343','failed','scheduled__2025-05-23T07:30:00+00:00',1,0,'scheduled',_binary '€}”.','2025-05-23 07:30:00.000000','2025-05-23 08:30:00.000000','2025-05-23 09:01:45.461237','b581b3eb4c2290a386902558f4e88a3f',2,'2025-05-23 09:01:45.466331',0),(4,'incremental_etl_dag','2025-05-23 09:20:40.942222','2025-05-23 09:20:40.924123','2025-05-23 09:20:42.055612','2025-05-23 09:21:46.231420','failed','manual__2025-05-23T09:20:40.924123+00:00',NULL,1,'manual',_binary '€}”.','2025-05-23 07:30:00.000000','2025-05-23 08:30:00.000000','2025-05-23 09:21:46.227181','b581b3eb4c2290a386902558f4e88a3f',2,'2025-05-23 09:21:46.232290',0),(5,'incremental_etl_dag','2025-05-23 09:28:33.862999','2025-05-23 09:28:33.825533','2025-05-23 09:28:34.554984','2025-05-23 09:29:39.986945','failed','manual__2025-05-23T09:28:33.825533+00:00',NULL,1,'manual',_binary '€}”.','2025-05-23 07:30:00.000000','2025-05-23 08:30:00.000000','2025-05-23 09:29:39.982284','b581b3eb4c2290a386902558f4e88a3f',2,'2025-05-23 09:29:39.988586',0),(6,'incremental_etl_dag','2025-05-23 09:30:00.371301','2025-05-23 08:30:00.000000','2025-05-23 09:30:00.425497','2025-05-23 09:31:03.724677','failed','scheduled__2025-05-23T08:30:00+00:00',10,0,'scheduled',_binary '€}”.','2025-05-23 08:30:00.000000','2025-05-23 09:30:00.000000','2025-05-23 09:31:03.718905','b581b3eb4c2290a386902558f4e88a3f',2,'2025-05-23 09:31:03.725747',0);
/*!40000 ALTER TABLE `dag_run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dag_run_note`
--

DROP TABLE IF EXISTS `dag_run_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dag_run_note` (
  `user_id` int DEFAULT NULL,
  `dag_run_id` int NOT NULL,
  `content` text,
  `created_at` timestamp(6) NOT NULL,
  `updated_at` timestamp(6) NOT NULL,
  PRIMARY KEY (`dag_run_id`),
  KEY `dag_run_note_user_fkey` (`user_id`),
  CONSTRAINT `dag_run_note_dr_fkey` FOREIGN KEY (`dag_run_id`) REFERENCES `dag_run` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dag_run_note_user_fkey` FOREIGN KEY (`user_id`) REFERENCES `ab_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dag_run_note`
--

LOCK TABLES `dag_run_note` WRITE;
/*!40000 ALTER TABLE `dag_run_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `dag_run_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dag_schedule_dataset_reference`
--

DROP TABLE IF EXISTS `dag_schedule_dataset_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dag_schedule_dataset_reference` (
  `dataset_id` int NOT NULL,
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `created_at` timestamp(6) NOT NULL,
  `updated_at` timestamp(6) NOT NULL,
  PRIMARY KEY (`dataset_id`,`dag_id`),
  KEY `dsdr_dag_id_fkey` (`dag_id`),
  CONSTRAINT `dsdr_dag_id_fkey` FOREIGN KEY (`dag_id`) REFERENCES `dag` (`dag_id`) ON DELETE CASCADE,
  CONSTRAINT `dsdr_dataset_fkey` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dag_schedule_dataset_reference`
--

LOCK TABLES `dag_schedule_dataset_reference` WRITE;
/*!40000 ALTER TABLE `dag_schedule_dataset_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `dag_schedule_dataset_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dag_tag`
--

DROP TABLE IF EXISTS `dag_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dag_tag` (
  `name` varchar(100) NOT NULL,
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`name`,`dag_id`),
  KEY `dag_tag_dag_id_fkey` (`dag_id`),
  CONSTRAINT `dag_tag_dag_id_fkey` FOREIGN KEY (`dag_id`) REFERENCES `dag` (`dag_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dag_tag`
--

LOCK TABLES `dag_tag` WRITE;
/*!40000 ALTER TABLE `dag_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `dag_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dag_warning`
--

DROP TABLE IF EXISTS `dag_warning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dag_warning` (
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `warning_type` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `timestamp` timestamp(6) NOT NULL,
  PRIMARY KEY (`dag_id`,`warning_type`),
  CONSTRAINT `dcw_dag_id_fkey` FOREIGN KEY (`dag_id`) REFERENCES `dag` (`dag_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dag_warning`
--

LOCK TABLES `dag_warning` WRITE;
/*!40000 ALTER TABLE `dag_warning` DISABLE KEYS */;
/*!40000 ALTER TABLE `dag_warning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dagrun_dataset_event`
--

DROP TABLE IF EXISTS `dagrun_dataset_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dagrun_dataset_event` (
  `dag_run_id` int NOT NULL,
  `event_id` int NOT NULL,
  PRIMARY KEY (`dag_run_id`,`event_id`),
  KEY `idx_dagrun_dataset_events_event_id` (`event_id`),
  KEY `idx_dagrun_dataset_events_dag_run_id` (`dag_run_id`),
  CONSTRAINT `dagrun_dataset_event_dag_run_id_fkey` FOREIGN KEY (`dag_run_id`) REFERENCES `dag_run` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dagrun_dataset_event_event_id_fkey` FOREIGN KEY (`event_id`) REFERENCES `dataset_event` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dagrun_dataset_event`
--

LOCK TABLES `dagrun_dataset_event` WRITE;
/*!40000 ALTER TABLE `dagrun_dataset_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `dagrun_dataset_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataset`
--

DROP TABLE IF EXISTS `dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dataset` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uri` varchar(3000) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `extra` json NOT NULL,
  `created_at` timestamp(6) NOT NULL,
  `updated_at` timestamp(6) NOT NULL,
  `is_orphaned` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uri_unique` (`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataset`
--

LOCK TABLES `dataset` WRITE;
/*!40000 ALTER TABLE `dataset` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataset_dag_run_queue`
--

DROP TABLE IF EXISTS `dataset_dag_run_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dataset_dag_run_queue` (
  `dataset_id` int NOT NULL,
  `target_dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `created_at` timestamp(6) NOT NULL,
  PRIMARY KEY (`dataset_id`,`target_dag_id`),
  KEY `ddrq_dag_fkey` (`target_dag_id`),
  CONSTRAINT `ddrq_dag_fkey` FOREIGN KEY (`target_dag_id`) REFERENCES `dag` (`dag_id`) ON DELETE CASCADE,
  CONSTRAINT `ddrq_dataset_fkey` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataset_dag_run_queue`
--

LOCK TABLES `dataset_dag_run_queue` WRITE;
/*!40000 ALTER TABLE `dataset_dag_run_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataset_dag_run_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataset_event`
--

DROP TABLE IF EXISTS `dataset_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dataset_event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dataset_id` int NOT NULL,
  `extra` json NOT NULL,
  `source_task_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `source_dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `source_run_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `source_map_index` int DEFAULT '-1',
  `timestamp` timestamp(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_dataset_id_timestamp` (`dataset_id`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataset_event`
--

LOCK TABLES `dataset_event` WRITE;
/*!40000 ALTER TABLE `dataset_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataset_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_error`
--

DROP TABLE IF EXISTS `import_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_error` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp(6) NULL DEFAULT NULL,
  `filename` varchar(1024) DEFAULT NULL,
  `stacktrace` text,
  `processor_subdir` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_error`
--

LOCK TABLES `import_error` WRITE;
/*!40000 ALTER TABLE `import_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dag_id` varchar(250) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `job_type` varchar(30) DEFAULT NULL,
  `start_date` timestamp(6) NULL DEFAULT NULL,
  `end_date` timestamp(6) NULL DEFAULT NULL,
  `latest_heartbeat` timestamp(6) NULL DEFAULT NULL,
  `executor_class` varchar(500) DEFAULT NULL,
  `hostname` varchar(500) DEFAULT NULL,
  `unixname` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_job_state_heartbeat` (`state`,`latest_heartbeat`),
  KEY `idx_job_dag_id` (`dag_id`),
  KEY `job_type_heart` (`job_type`,`latest_heartbeat`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,NULL,'success','SchedulerJob','2025-05-23 08:08:49.366234','2025-05-23 09:27:04.125192','2025-05-23 09:26:55.671907',NULL,'51c7d41eaea9','airflow'),(2,'incremental_etl_dag','success','LocalTaskJob','2025-05-23 08:09:29.800812','2025-05-23 08:09:30.700070','2025-05-23 08:09:29.778488',NULL,'51c7d41eaea9','airflow'),(3,'incremental_etl_dag','success','LocalTaskJob','2025-05-23 08:09:29.803926','2025-05-23 08:09:30.718023','2025-05-23 08:09:29.778826',NULL,'51c7d41eaea9','airflow'),(4,'incremental_etl_dag','success','LocalTaskJob','2025-05-23 09:00:42.718984','2025-05-23 09:00:43.662480','2025-05-23 09:00:42.686516',NULL,'51c7d41eaea9','airflow'),(5,'incremental_etl_dag','success','LocalTaskJob','2025-05-23 09:00:42.986776','2025-05-23 09:00:43.782818','2025-05-23 09:00:42.948754',NULL,'51c7d41eaea9','airflow'),(6,'incremental_etl_dag','success','LocalTaskJob','2025-05-23 09:00:43.016549','2025-05-23 09:00:43.840197','2025-05-23 09:00:42.976034',NULL,'51c7d41eaea9','airflow'),(7,'incremental_etl_dag','success','LocalTaskJob','2025-05-23 09:01:44.680378','2025-05-23 09:01:45.235713','2025-05-23 09:01:44.661753',NULL,'51c7d41eaea9','airflow'),(8,'incremental_etl_dag','success','LocalTaskJob','2025-05-23 09:20:43.206243','2025-05-23 09:20:43.756384','2025-05-23 09:20:43.190161',NULL,'51c7d41eaea9','airflow'),(9,'incremental_etl_dag','success','LocalTaskJob','2025-05-23 09:21:45.389955','2025-05-23 09:21:45.905938','2025-05-23 09:21:45.369709',NULL,'51c7d41eaea9','airflow'),(10,NULL,'running','SchedulerJob','2025-05-23 09:28:00.331218',NULL,'2025-05-23 09:43:27.631763',NULL,'5b251e7b28d9','airflow'),(11,'incremental_etl_dag','success','LocalTaskJob','2025-05-23 09:28:36.585713','2025-05-23 09:28:37.140140','2025-05-23 09:28:36.564574',NULL,'5b251e7b28d9','airflow'),(12,'incremental_etl_dag','success','LocalTaskJob','2025-05-23 09:29:38.284813','2025-05-23 09:29:38.924053','2025-05-23 09:29:38.261820',NULL,'5b251e7b28d9','airflow'),(13,'incremental_etl_dag','success','LocalTaskJob','2025-05-23 09:30:01.216494','2025-05-23 09:30:01.783040','2025-05-23 09:30:01.189689',NULL,'5b251e7b28d9','airflow'),(14,'incremental_etl_dag','success','LocalTaskJob','2025-05-23 09:31:03.021738','2025-05-23 09:31:03.706974','2025-05-23 09:31:03.002785',NULL,'5b251e7b28d9','airflow');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dttm` timestamp(6) NULL DEFAULT NULL,
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `task_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `map_index` int DEFAULT NULL,
  `event` varchar(60) DEFAULT NULL,
  `execution_date` timestamp(6) NULL DEFAULT NULL,
  `run_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `owner` varchar(500) DEFAULT NULL,
  `owner_display_name` varchar(500) DEFAULT NULL,
  `extra` text,
  PRIMARY KEY (`id`),
  KEY `idx_log_dttm` (`dttm`),
  KEY `idx_log_dag` (`dag_id`),
  KEY `idx_log_event` (`event`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'2025-05-23 08:07:29.268422',NULL,NULL,NULL,'cli_scheduler',NULL,NULL,'airflow',NULL,'{\"host_name\": \"51c7d41eaea9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(2,'2025-05-23 08:07:34.209256',NULL,NULL,NULL,'cli_users_create',NULL,NULL,'airflow',NULL,'{\"host_name\": \"e66f21763600\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'users\', \'create\', \'--username\', \'admin\', \'--password\', \'********\', \'--firstname\', \'Air\', \'--lastname\', \'Flow\', \'--role\', \'Admin\', \'--email\', \'admin@example.com\']\"}'),(3,'2025-05-23 08:08:39.371286',NULL,NULL,NULL,'cli_check',NULL,NULL,'airflow',NULL,'{\"host_name\": \"0657253a767f\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'db\', \'check\']\"}'),(4,'2025-05-23 08:08:39.643590',NULL,NULL,NULL,'cli_check',NULL,NULL,'airflow',NULL,'{\"host_name\": \"51c7d41eaea9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'db\', \'check\']\"}'),(5,'2025-05-23 08:08:44.184064',NULL,NULL,NULL,'cli_webserver',NULL,NULL,'airflow',NULL,'{\"host_name\": \"0657253a767f\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'webserver\']\"}'),(6,'2025-05-23 08:08:47.856207',NULL,NULL,NULL,'cli_scheduler',NULL,NULL,'airflow',NULL,'{\"host_name\": \"51c7d41eaea9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(7,'2025-05-23 08:08:57.270647',NULL,NULL,NULL,'cli_users_create',NULL,NULL,'airflow',NULL,'{\"host_name\": \"0657253a767f\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'users\', \'create\', \'--username\', \'airflow\', \'--firstname\', \'Airflow\', \'--lastname\', \'user\', \'--role\', \'Admin\', \'--email\', \'admin@example.com\', \'--password\', \'********\']\"}'),(8,'2025-05-23 08:08:57.416452',NULL,NULL,NULL,'cli_users_create',NULL,NULL,'airflow',NULL,'{\"host_name\": \"e66f21763600\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'users\', \'create\', \'--username\', \'admin\', \'--password\', \'********\', \'--firstname\', \'Air\', \'--lastname\', \'Flow\', \'--role\', \'Admin\', \'--email\', \'admin@example.com\']\"}'),(9,'2025-05-23 08:09:23.742435',NULL,NULL,NULL,'blocked',NULL,NULL,'admin','Air Flow','{\"dag_ids\": \"incremental_etl_dag\"}'),(10,'2025-05-23 08:09:27.569186','incremental_etl_dag',NULL,NULL,'trigger',NULL,NULL,'admin','Air Flow','{\"redirect_url\": \"/home\"}'),(11,'2025-05-23 08:09:28.649660',NULL,NULL,NULL,'blocked',NULL,NULL,'admin','Air Flow','{\"dag_ids\": \"incremental_etl_dag\"}'),(12,'2025-05-23 08:09:28.673267','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"51c7d41eaea9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(13,'2025-05-23 08:09:28.672249','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"51c7d41eaea9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(14,'2025-05-23 08:09:30.104943','incremental_etl_dag','db_incremental',-1,'running','2025-05-23 08:09:27.576488','manual__2025-05-23T08:09:27.576488+00:00','airflow',NULL,NULL),(15,'2025-05-23 08:09:30.110376','incremental_etl_dag','db_incremental',-1,'running','2025-05-23 06:30:00.000000','scheduled__2025-05-23T06:30:00+00:00','airflow',NULL,NULL),(16,'2025-05-23 08:09:30.143107','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"51c7d41eaea9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(17,'2025-05-23 08:09:30.153304','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"51c7d41eaea9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(18,'2025-05-23 08:09:30.612329','incremental_etl_dag','db_incremental',-1,'failed','2025-05-23 06:30:00.000000','scheduled__2025-05-23T06:30:00+00:00','airflow',NULL,NULL),(19,'2025-05-23 08:09:30.612329','incremental_etl_dag','db_incremental',-1,'failed','2025-05-23 08:09:27.576488','manual__2025-05-23T08:09:27.576488+00:00','airflow',NULL,NULL),(20,'2025-05-23 09:00:41.823839','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"51c7d41eaea9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(21,'2025-05-23 09:00:41.830674','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"51c7d41eaea9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(22,'2025-05-23 09:00:41.824587','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"51c7d41eaea9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(23,'2025-05-23 09:00:43.040290','incremental_etl_dag','db_incremental',-1,'running','2025-05-23 06:30:00.000000','scheduled__2025-05-23T06:30:00+00:00','airflow',NULL,NULL),(24,'2025-05-23 09:00:43.093867','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"51c7d41eaea9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(25,'2025-05-23 09:00:43.305356','incremental_etl_dag','db_incremental',-1,'running','2025-05-23 07:30:00.000000','scheduled__2025-05-23T07:30:00+00:00','airflow',NULL,NULL),(26,'2025-05-23 09:00:43.345698','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"51c7d41eaea9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(27,'2025-05-23 09:00:43.358025','incremental_etl_dag','db_incremental',-1,'running','2025-05-23 08:09:27.576488','manual__2025-05-23T08:09:27.576488+00:00','airflow',NULL,NULL),(28,'2025-05-23 09:00:43.398429','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"51c7d41eaea9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(29,'2025-05-23 09:00:43.547139','incremental_etl_dag','db_incremental',-1,'failed','2025-05-23 06:30:00.000000','scheduled__2025-05-23T06:30:00+00:00','airflow',NULL,NULL),(30,'2025-05-23 09:00:43.722391','incremental_etl_dag','db_incremental',-1,'failed','2025-05-23 07:30:00.000000','scheduled__2025-05-23T07:30:00+00:00','airflow',NULL,NULL),(31,'2025-05-23 09:00:43.749916','incremental_etl_dag','db_incremental',-1,'failed','2025-05-23 08:09:27.576488','manual__2025-05-23T08:09:27.576488+00:00','airflow',NULL,NULL),(32,'2025-05-23 09:01:44.074201','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"51c7d41eaea9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(33,'2025-05-23 09:01:44.886101','incremental_etl_dag','db_incremental',-1,'running','2025-05-23 07:30:00.000000','scheduled__2025-05-23T07:30:00+00:00','airflow',NULL,NULL),(34,'2025-05-23 09:01:44.917947','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"51c7d41eaea9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(35,'2025-05-23 09:01:45.181356','incremental_etl_dag','db_incremental',-1,'failed','2025-05-23 07:30:00.000000','scheduled__2025-05-23T07:30:00+00:00','airflow',NULL,NULL),(36,'2025-05-23 09:19:17.996005',NULL,NULL,NULL,'variable.create',NULL,NULL,'admin','Air Flow','{}'),(37,'2025-05-23 09:19:29.295471',NULL,NULL,NULL,'variable.create',NULL,NULL,'admin','Air Flow','{\"key\": \"last_db_id\", \"val\": \"\\\"0\\\"\", \"description\": \"\"}'),(38,'2025-05-23 09:19:47.094888',NULL,NULL,NULL,'variable.create',NULL,NULL,'admin','Air Flow','{}'),(39,'2025-05-23 09:19:57.511733',NULL,NULL,NULL,'variable.create',NULL,NULL,'admin','Air Flow','{\"key\": \"last_api_ts\", \"val\": \"2024-01-01T00:00:00Z\", \"description\": \"\"}'),(40,'2025-05-23 09:20:37.832659',NULL,NULL,NULL,'blocked',NULL,NULL,'admin','Air Flow','{\"dag_ids\": \"incremental_etl_dag\"}'),(41,'2025-05-23 09:20:40.918537','incremental_etl_dag',NULL,NULL,'trigger',NULL,NULL,'admin','Air Flow','{\"redirect_url\": \"/home\"}'),(42,'2025-05-23 09:20:41.817612',NULL,NULL,NULL,'blocked',NULL,NULL,'admin','Air Flow','{\"dag_ids\": \"incremental_etl_dag\"}'),(43,'2025-05-23 09:20:42.289365','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"51c7d41eaea9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(44,'2025-05-23 09:20:43.451025','incremental_etl_dag','db_incremental',-1,'running','2025-05-23 09:20:40.924123','manual__2025-05-23T09:20:40.924123+00:00','airflow',NULL,NULL),(45,'2025-05-23 09:20:43.482687','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"51c7d41eaea9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(46,'2025-05-23 09:20:43.662107','incremental_etl_dag','db_incremental',-1,'failed','2025-05-23 09:20:40.924123','manual__2025-05-23T09:20:40.924123+00:00','airflow',NULL,NULL),(47,'2025-05-23 09:20:50.509232',NULL,NULL,NULL,'cli_users_create',NULL,NULL,'airflow',NULL,'{\"host_name\": \"e66f21763600\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'users\', \'create\', \'--username\', \'admin\', \'--password\', \'********\', \'--firstname\', \'Air\', \'--lastname\', \'Flow\', \'--role\', \'Admin\', \'--email\', \'admin@example.com\']\"}'),(48,'2025-05-23 09:21:44.824711','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"51c7d41eaea9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(49,'2025-05-23 09:21:45.599559','incremental_etl_dag','db_incremental',-1,'running','2025-05-23 09:20:40.924123','manual__2025-05-23T09:20:40.924123+00:00','airflow',NULL,NULL),(50,'2025-05-23 09:21:45.631120','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"51c7d41eaea9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(51,'2025-05-23 09:21:45.784133','incremental_etl_dag','db_incremental',-1,'failed','2025-05-23 09:20:40.924123','manual__2025-05-23T09:20:40.924123+00:00','airflow',NULL,NULL),(52,'2025-05-23 09:27:48.619081',NULL,NULL,NULL,'cli_check',NULL,NULL,'airflow',NULL,'{\"host_name\": \"5b251e7b28d9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'db\', \'check\']\"}'),(53,'2025-05-23 09:27:48.746269',NULL,NULL,NULL,'cli_check',NULL,NULL,'airflow',NULL,'{\"host_name\": \"8f32f3bbd4a3\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'db\', \'check\']\"}'),(54,'2025-05-23 09:27:53.422708',NULL,NULL,NULL,'cli_webserver',NULL,NULL,'airflow',NULL,'{\"host_name\": \"8f32f3bbd4a3\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'webserver\']\"}'),(55,'2025-05-23 09:27:58.219557',NULL,NULL,NULL,'cli_scheduler',NULL,NULL,'airflow',NULL,'{\"host_name\": \"5b251e7b28d9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(56,'2025-05-23 09:28:05.133164',NULL,NULL,NULL,'cli_users_create',NULL,NULL,'airflow',NULL,'{\"host_name\": \"d53eb88b091f\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'users\', \'create\', \'--username\', \'admin\', \'--password\', \'********\', \'--firstname\', \'Air\', \'--lastname\', \'Flow\', \'--role\', \'Admin\', \'--email\', \'admin@example.com\']\"}'),(57,'2025-05-23 09:28:20.963286',NULL,NULL,NULL,'blocked',NULL,NULL,'admin','Air Flow','{\"dag_ids\": \"incremental_etl_dag\"}'),(58,'2025-05-23 09:28:31.545422',NULL,NULL,NULL,'blocked',NULL,NULL,'admin','Air Flow','{\"dag_ids\": \"incremental_etl_dag\"}'),(59,'2025-05-23 09:28:33.816814','incremental_etl_dag',NULL,NULL,'trigger',NULL,NULL,'admin','Air Flow','{\"redirect_url\": \"/home\"}'),(60,'2025-05-23 09:28:35.195278',NULL,NULL,NULL,'blocked',NULL,NULL,'admin','Air Flow','{\"dag_ids\": \"incremental_etl_dag\"}'),(61,'2025-05-23 09:28:35.134715','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"5b251e7b28d9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(62,'2025-05-23 09:28:36.823582','incremental_etl_dag','db_incremental',-1,'running','2025-05-23 09:28:33.825533','manual__2025-05-23T09:28:33.825533+00:00','airflow',NULL,NULL),(63,'2025-05-23 09:28:36.860668','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"5b251e7b28d9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(64,'2025-05-23 09:28:37.051469','incremental_etl_dag','db_incremental',-1,'failed','2025-05-23 09:28:33.825533','manual__2025-05-23T09:28:33.825533+00:00','airflow',NULL,NULL),(65,'2025-05-23 09:29:02.651849',NULL,NULL,NULL,'blocked',NULL,NULL,'admin','Air Flow','{\"dag_ids\": \"incremental_etl_dag\"}'),(66,'2025-05-23 09:29:37.392556','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"5b251e7b28d9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(67,'2025-05-23 09:29:38.619226','incremental_etl_dag','db_incremental',-1,'running','2025-05-23 09:28:33.825533','manual__2025-05-23T09:28:33.825533+00:00','airflow',NULL,NULL),(68,'2025-05-23 09:29:38.664189','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"5b251e7b28d9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(69,'2025-05-23 09:29:38.858259','incremental_etl_dag','db_incremental',-1,'failed','2025-05-23 09:28:33.825533','manual__2025-05-23T09:28:33.825533+00:00','airflow',NULL,NULL),(70,'2025-05-23 09:29:47.060173',NULL,NULL,NULL,'blocked',NULL,NULL,'admin','Air Flow','{\"dag_ids\": \"incremental_etl_dag\"}'),(71,'2025-05-23 09:30:00.497933','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"5b251e7b28d9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(72,'2025-05-23 09:30:01.500181','incremental_etl_dag','db_incremental',-1,'running','2025-05-23 08:30:00.000000','scheduled__2025-05-23T08:30:00+00:00','airflow',NULL,NULL),(73,'2025-05-23 09:30:01.531806','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"5b251e7b28d9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(74,'2025-05-23 09:30:01.702389','incremental_etl_dag','db_incremental',-1,'failed','2025-05-23 08:30:00.000000','scheduled__2025-05-23T08:30:00+00:00','airflow',NULL,NULL),(75,'2025-05-23 09:30:35.232545',NULL,NULL,NULL,'variable.edit',NULL,NULL,'admin','Air Flow','{\"pk\": \"1\"}'),(76,'2025-05-23 09:30:41.011769',NULL,NULL,NULL,'variable.edit',NULL,NULL,'admin','Air Flow','{\"key\": \"last_db_id\", \"val\": \"0\", \"description\": \"\", \"pk\": \"1\"}'),(77,'2025-05-23 09:30:44.419153',NULL,NULL,NULL,'blocked',NULL,NULL,'admin','Air Flow','{\"dag_ids\": \"incremental_etl_dag\"}'),(78,'2025-05-23 09:30:49.451049',NULL,NULL,NULL,'blocked',NULL,NULL,'admin','Air Flow','{\"dag_ids\": \"incremental_etl_dag\"}'),(79,'2025-05-23 09:31:02.098574','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"5b251e7b28d9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(80,'2025-05-23 09:31:03.238896','incremental_etl_dag','db_incremental',-1,'running','2025-05-23 08:30:00.000000','scheduled__2025-05-23T08:30:00+00:00','airflow',NULL,NULL),(81,'2025-05-23 09:31:03.268897','incremental_etl_dag','db_incremental',NULL,'cli_task_run',NULL,NULL,'airflow',NULL,'{\"host_name\": \"5b251e7b28d9\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(82,'2025-05-23 09:31:03.641928','incremental_etl_dag','db_incremental',-1,'failed','2025-05-23 08:30:00.000000','scheduled__2025-05-23T08:30:00+00:00','airflow',NULL,NULL),(83,'2025-05-23 09:33:52.360164',NULL,NULL,NULL,'variable.edit',NULL,NULL,'admin','Air Flow','{\"pk\": \"1\"}'),(84,'2025-05-23 09:33:57.767759',NULL,NULL,NULL,'variable.edit',NULL,NULL,'admin','Air Flow','{\"key\": \"last_db_id\", \"val\": \"2\", \"description\": \"\", \"pk\": \"1\"}');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_template`
--

DROP TABLE IF EXISTS `log_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` text NOT NULL,
  `elasticsearch_id` text NOT NULL,
  `created_at` timestamp(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_template`
--

LOCK TABLES `log_template` WRITE;
/*!40000 ALTER TABLE `log_template` DISABLE KEYS */;
INSERT INTO `log_template` VALUES (1,'{{ ti.dag_id }}/{{ ti.task_id }}/{{ ts }}/{{ try_number }}.log','{dag_id}-{task_id}-{execution_date}-{try_number}','2025-05-23 08:07:31.546519'),(2,'dag_id={{ ti.dag_id }}/run_id={{ ti.run_id }}/task_id={{ ti.task_id }}/{% if ti.map_index >= 0 %}map_index={{ ti.map_index }}/{% endif %}attempt={{ try_number }}.log','{dag_id}-{task_id}-{run_id}-{map_index}-{try_number}','2025-05-23 08:07:31.547060');
/*!40000 ALTER TABLE `log_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rendered_task_instance_fields`
--

DROP TABLE IF EXISTS `rendered_task_instance_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rendered_task_instance_fields` (
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `task_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `run_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `map_index` int NOT NULL DEFAULT '-1',
  `rendered_fields` json NOT NULL,
  `k8s_pod_yaml` json DEFAULT NULL,
  PRIMARY KEY (`dag_id`,`task_id`,`run_id`,`map_index`),
  CONSTRAINT `rtif_ti_fkey` FOREIGN KEY (`dag_id`, `task_id`, `run_id`, `map_index`) REFERENCES `task_instance` (`dag_id`, `task_id`, `run_id`, `map_index`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rendered_task_instance_fields`
--

LOCK TABLES `rendered_task_instance_fields` WRITE;
/*!40000 ALTER TABLE `rendered_task_instance_fields` DISABLE KEYS */;
INSERT INTO `rendered_task_instance_fields` VALUES ('incremental_etl_dag','db_incremental','manual__2025-05-23T08:09:27.576488+00:00',-1,'{\"op_args\": [], \"op_kwargs\": {}, \"templates_dict\": null}','null'),('incremental_etl_dag','db_incremental','manual__2025-05-23T09:20:40.924123+00:00',-1,'{\"op_args\": [], \"op_kwargs\": {}, \"templates_dict\": null}','null'),('incremental_etl_dag','db_incremental','manual__2025-05-23T09:28:33.825533+00:00',-1,'{\"op_args\": [], \"op_kwargs\": {}, \"templates_dict\": null}','null'),('incremental_etl_dag','db_incremental','scheduled__2025-05-23T06:30:00+00:00',-1,'{\"op_args\": [], \"op_kwargs\": {}, \"templates_dict\": null}','null'),('incremental_etl_dag','db_incremental','scheduled__2025-05-23T07:30:00+00:00',-1,'{\"op_args\": [], \"op_kwargs\": {}, \"templates_dict\": null}','null'),('incremental_etl_dag','db_incremental','scheduled__2025-05-23T08:30:00+00:00',-1,'{\"op_args\": [], \"op_kwargs\": {}, \"templates_dict\": null}','null');
/*!40000 ALTER TABLE `rendered_task_instance_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serialized_dag`
--

DROP TABLE IF EXISTS `serialized_dag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serialized_dag` (
  `dag_id` varchar(250) NOT NULL,
  `fileloc` varchar(2000) NOT NULL,
  `fileloc_hash` bigint NOT NULL,
  `data` json DEFAULT NULL,
  `data_compressed` blob,
  `last_updated` timestamp(6) NOT NULL,
  `dag_hash` varchar(32) NOT NULL,
  `processor_subdir` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`dag_id`),
  KEY `idx_fileloc_hash` (`fileloc_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serialized_dag`
--

LOCK TABLES `serialized_dag` WRITE;
/*!40000 ALTER TABLE `serialized_dag` DISABLE KEYS */;
INSERT INTO `serialized_dag` VALUES ('incremental_etl_dag','/opt/airflow/dags/incremental_etl_dag.py',40036800307039991,'{\"dag\": {\"tasks\": [{\"pool\": \"default_pool\", \"owner\": \"airflow\", \"op_args\": [], \"retries\": 1, \"task_id\": \"db_incremental\", \"is_setup\": false, \"ui_color\": \"#ffefeb\", \"_is_empty\": false, \"op_kwargs\": {}, \"_task_type\": \"PythonOperator\", \"ui_fgcolor\": \"#000\", \"is_teardown\": false, \"retry_delay\": 60.0, \"weight_rule\": \"downstream\", \"_task_module\": \"airflow.operators.python\", \"template_ext\": [], \"template_fields\": [\"templates_dict\", \"op_args\", \"op_kwargs\"], \"downstream_task_ids\": [\"api_incremental\"], \"on_failure_fail_dagrun\": false, \"_log_config_logger_name\": \"airflow.task.operators\", \"template_fields_renderers\": {\"op_args\": \"py\", \"op_kwargs\": \"py\", \"templates_dict\": \"json\"}}, {\"pool\": \"default_pool\", \"owner\": \"airflow\", \"op_args\": [], \"retries\": 1, \"task_id\": \"api_incremental\", \"is_setup\": false, \"ui_color\": \"#ffefeb\", \"_is_empty\": false, \"op_kwargs\": {}, \"_task_type\": \"PythonOperator\", \"ui_fgcolor\": \"#000\", \"is_teardown\": false, \"retry_delay\": 60.0, \"weight_rule\": \"downstream\", \"_task_module\": \"airflow.operators.python\", \"template_ext\": [], \"template_fields\": [\"templates_dict\", \"op_args\", \"op_kwargs\"], \"downstream_task_ids\": [], \"on_failure_fail_dagrun\": false, \"_log_config_logger_name\": \"airflow.task.operators\", \"template_fields_renderers\": {\"op_args\": \"py\", \"op_kwargs\": \"py\", \"templates_dict\": \"json\"}}], \"params\": {}, \"_dag_id\": \"incremental_etl_dag\", \"catchup\": false, \"fileloc\": \"/opt/airflow/dags/incremental_etl_dag.py\", \"timezone\": \"Asia/Kolkata\", \"edge_info\": {}, \"start_date\": 1704047400.0, \"_task_group\": {\"tooltip\": \"\", \"children\": {\"db_incremental\": [\"operator\", \"db_incremental\"], \"api_incremental\": [\"operator\", \"api_incremental\"]}, \"ui_color\": \"CornflowerBlue\", \"_group_id\": null, \"ui_fgcolor\": \"#000\", \"prefix_group_id\": true, \"upstream_task_ids\": [], \"upstream_group_ids\": [], \"downstream_task_ids\": [], \"downstream_group_ids\": []}, \"default_args\": {\"__var\": {\"owner\": \"airflow\", \"retries\": 1, \"retry_delay\": {\"__var\": 60.0, \"__type\": \"timedelta\"}}, \"__type\": \"dict\"}, \"dag_dependencies\": [], \"schedule_interval\": \"@hourly\", \"_processor_dags_folder\": \"/opt/airflow/dags\"}, \"__version\": 1}',NULL,'2025-05-23 09:28:35.349619','b581b3eb4c2290a386902558f4e88a3f','/opt/airflow/dags');
/*!40000 ALTER TABLE `serialized_dag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) DEFAULT NULL,
  `data` blob,
  `expiry` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES (1,'53ddf808-f228-49f3-90b0-5031977e851f',_binary '€•c\0\0\0\0\0\0\0}”(Œ\n_permanent”ˆŒ_fresh”‰Œ\ncsrf_token”Œ(fc84b426324a2b42f8a268343a5a22f3e9642e25”Œlocale”Œen”u.','2025-06-22 08:09:18'),(2,'430a1ef9-b3fe-4834-803f-46ea1823b3d6',_binary '€•+\0\0\0\0\0\0}”(Œ\n_permanent”ˆŒ_fresh”ˆŒ\ncsrf_token”Œ(fc84b426324a2b42f8a268343a5a22f3e9642e25”Œlocale”Œen”Œ_user_id”KŒ_id”Œ€ceea7b444ae23264633ad0556b4abbecf488671dfbb5f9e53f40eb57376b8ea75881b0bff046907a7cb9b2536a3559b328ac541b67a3a89472acaf5976b4420c”Œdag_status_filter”Œall”Œpage_history”]”(ŒYhttp://localhost:8080/dagrun/list/?_flt_3_dag_id=incremental_etl_dag&_flt_3_state=running”Œ$http://localhost:8080/variable/list/”ŒXhttp://localhost:8080/dagrun/list/?_flt_3_dag_id=incremental_etl_dag&_flt_3_state=failed”Œ$http://localhost:8080/variable/list/”eu.','2025-06-22 09:33:58'),(3,'891b7201-bedd-4197-b2e5-55937feb4176',_binary '€•\0\0\0\0\0\0\0}”(Œ\n_permanent”ˆŒ_fresh”‰u.','2025-06-22 09:15:58');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sla_miss`
--

DROP TABLE IF EXISTS `sla_miss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sla_miss` (
  `task_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `execution_date` timestamp(6) NOT NULL,
  `email_sent` tinyint(1) DEFAULT NULL,
  `timestamp` timestamp(6) NULL DEFAULT NULL,
  `description` text,
  `notification_sent` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`task_id`,`dag_id`,`execution_date`),
  KEY `sm_dag` (`dag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sla_miss`
--

LOCK TABLES `sla_miss` WRITE;
/*!40000 ALTER TABLE `sla_miss` DISABLE KEYS */;
/*!40000 ALTER TABLE `sla_miss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slot_pool`
--

DROP TABLE IF EXISTS `slot_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slot_pool` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pool` varchar(256) DEFAULT NULL,
  `slots` int DEFAULT NULL,
  `description` text,
  `include_deferred` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slot_pool_pool_uq` (`pool`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slot_pool`
--

LOCK TABLES `slot_pool` WRITE;
/*!40000 ALTER TABLE `slot_pool` DISABLE KEYS */;
INSERT INTO `slot_pool` VALUES (1,'default_pool',128,'Default pool',0);
/*!40000 ALTER TABLE `slot_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_fail`
--

DROP TABLE IF EXISTS `task_fail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_fail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `run_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `map_index` int NOT NULL DEFAULT '-1',
  `start_date` timestamp(6) NULL DEFAULT NULL,
  `end_date` timestamp(6) NULL DEFAULT NULL,
  `duration` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_task_fail_task_instance` (`dag_id`,`task_id`,`run_id`,`map_index`),
  CONSTRAINT `task_fail_ti_fkey` FOREIGN KEY (`dag_id`, `task_id`, `run_id`, `map_index`) REFERENCES `task_instance` (`dag_id`, `task_id`, `run_id`, `map_index`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_fail`
--

LOCK TABLES `task_fail` WRITE;
/*!40000 ALTER TABLE `task_fail` DISABLE KEYS */;
INSERT INTO `task_fail` VALUES (1,'db_incremental','incremental_etl_dag','manual__2025-05-23T08:09:27.576488+00:00',-1,'2025-05-23 08:09:30.089405','2025-05-23 08:09:30.612159',0),(2,'db_incremental','incremental_etl_dag','scheduled__2025-05-23T06:30:00+00:00',-1,'2025-05-23 08:09:30.090014','2025-05-23 08:09:30.612159',0),(3,'db_incremental','incremental_etl_dag','scheduled__2025-05-23T06:30:00+00:00',-1,'2025-05-23 09:00:43.022922','2025-05-23 09:00:43.546946',0),(4,'db_incremental','incremental_etl_dag','scheduled__2025-05-23T07:30:00+00:00',-1,'2025-05-23 09:00:43.291831','2025-05-23 09:00:43.722271',0),(5,'db_incremental','incremental_etl_dag','manual__2025-05-23T08:09:27.576488+00:00',-1,'2025-05-23 09:00:43.340667','2025-05-23 09:00:43.749754',0),(6,'db_incremental','incremental_etl_dag','scheduled__2025-05-23T07:30:00+00:00',-1,'2025-05-23 09:01:44.871536','2025-05-23 09:01:45.181241',0),(7,'db_incremental','incremental_etl_dag','manual__2025-05-23T09:20:40.924123+00:00',-1,'2025-05-23 09:20:43.439041','2025-05-23 09:20:43.661992',0),(8,'db_incremental','incremental_etl_dag','manual__2025-05-23T09:20:40.924123+00:00',-1,'2025-05-23 09:21:45.584885','2025-05-23 09:21:45.784019',0),(9,'db_incremental','incremental_etl_dag','manual__2025-05-23T09:28:33.825533+00:00',-1,'2025-05-23 09:28:36.809040','2025-05-23 09:28:37.051353',0),(10,'db_incremental','incremental_etl_dag','manual__2025-05-23T09:28:33.825533+00:00',-1,'2025-05-23 09:29:38.599650','2025-05-23 09:29:38.858073',0),(11,'db_incremental','incremental_etl_dag','scheduled__2025-05-23T08:30:00+00:00',-1,'2025-05-23 09:30:01.488026','2025-05-23 09:30:01.702264',0),(12,'db_incremental','incremental_etl_dag','scheduled__2025-05-23T08:30:00+00:00',-1,'2025-05-23 09:31:03.226908','2025-05-23 09:31:03.641793',0);
/*!40000 ALTER TABLE `task_fail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_instance`
--

DROP TABLE IF EXISTS `task_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_instance` (
  `task_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `run_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `map_index` int NOT NULL DEFAULT '-1',
  `start_date` timestamp(6) NULL DEFAULT NULL,
  `end_date` timestamp(6) NULL DEFAULT NULL,
  `duration` float DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `try_number` int DEFAULT NULL,
  `max_tries` int DEFAULT '-1',
  `hostname` varchar(1000) DEFAULT NULL,
  `unixname` varchar(1000) DEFAULT NULL,
  `job_id` int DEFAULT NULL,
  `pool` varchar(256) NOT NULL,
  `pool_slots` int NOT NULL,
  `queue` varchar(256) DEFAULT NULL,
  `priority_weight` int DEFAULT NULL,
  `operator` varchar(1000) DEFAULT NULL,
  `custom_operator_name` varchar(1000) DEFAULT NULL,
  `queued_dttm` timestamp(6) NULL DEFAULT NULL,
  `queued_by_job_id` int DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `executor_config` blob,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `rendered_map_index` varchar(250) DEFAULT NULL,
  `external_executor_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `trigger_id` int DEFAULT NULL,
  `trigger_timeout` datetime DEFAULT NULL,
  `next_method` varchar(1000) DEFAULT NULL,
  `next_kwargs` json DEFAULT NULL,
  `task_display_name` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`dag_id`,`task_id`,`run_id`,`map_index`),
  KEY `ti_state` (`state`),
  KEY `ti_dag_run` (`dag_id`,`run_id`),
  KEY `ti_dag_state` (`dag_id`,`state`),
  KEY `ti_pool` (`pool`,`state`,`priority_weight`),
  KEY `ti_state_lkp` (`dag_id`,`task_id`,`run_id`,`state`),
  KEY `ti_trigger_id` (`trigger_id`),
  KEY `ti_job_id` (`job_id`),
  CONSTRAINT `task_instance_dag_run_fkey` FOREIGN KEY (`dag_id`, `run_id`) REFERENCES `dag_run` (`dag_id`, `run_id`) ON DELETE CASCADE,
  CONSTRAINT `task_instance_trigger_id_fkey` FOREIGN KEY (`trigger_id`) REFERENCES `trigger` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_instance`
--

LOCK TABLES `task_instance` WRITE;
/*!40000 ALTER TABLE `task_instance` DISABLE KEYS */;
INSERT INTO `task_instance` VALUES ('api_incremental','incremental_etl_dag','manual__2025-05-23T08:09:27.576488+00:00',-1,'2025-05-23 09:00:43.827693','2025-05-23 09:00:43.827693',0,'upstream_failed',0,1,'','airflow',NULL,'default_pool',1,'default',1,'PythonOperator',NULL,NULL,NULL,NULL,_binary '€}”.','2025-05-23 09:00:43.835627',NULL,NULL,NULL,NULL,NULL,NULL,'api_incremental'),('api_incremental','incremental_etl_dag','manual__2025-05-23T09:20:40.924123+00:00',-1,'2025-05-23 09:21:45.890107','2025-05-23 09:21:45.890107',0,'upstream_failed',0,1,'','airflow',NULL,'default_pool',1,'default',1,'PythonOperator',NULL,NULL,NULL,NULL,_binary '€}”.','2025-05-23 09:21:45.900466',NULL,NULL,NULL,NULL,NULL,NULL,'api_incremental'),('api_incremental','incremental_etl_dag','manual__2025-05-23T09:28:33.825533+00:00',-1,'2025-05-23 09:29:38.917811','2025-05-23 09:29:38.917811',0,'upstream_failed',0,1,'','airflow',NULL,'default_pool',1,'default',1,'PythonOperator',NULL,NULL,NULL,NULL,_binary '€}”.','2025-05-23 09:29:38.926650',NULL,NULL,NULL,NULL,NULL,NULL,'api_incremental'),('api_incremental','incremental_etl_dag','scheduled__2025-05-23T06:30:00+00:00',-1,'2025-05-23 09:00:43.641965','2025-05-23 09:00:43.641965',0,'upstream_failed',0,1,'','airflow',NULL,'default_pool',1,'default',1,'PythonOperator',NULL,NULL,NULL,NULL,_binary '€}”.','2025-05-23 09:00:43.653380',NULL,NULL,NULL,NULL,NULL,NULL,'api_incremental'),('api_incremental','incremental_etl_dag','scheduled__2025-05-23T07:30:00+00:00',-1,'2025-05-23 09:01:45.223859','2025-05-23 09:01:45.223859',0,'upstream_failed',0,1,'','airflow',NULL,'default_pool',1,'default',1,'PythonOperator',NULL,NULL,NULL,NULL,_binary '€}”.','2025-05-23 09:01:45.231216',NULL,NULL,NULL,NULL,NULL,NULL,'api_incremental'),('api_incremental','incremental_etl_dag','scheduled__2025-05-23T08:30:00+00:00',-1,'2025-05-23 09:31:03.694647','2025-05-23 09:31:03.694647',0,'upstream_failed',0,1,'','airflow',NULL,'default_pool',1,'default',1,'PythonOperator',NULL,NULL,NULL,NULL,_binary '€}”.','2025-05-23 09:31:03.702853',NULL,NULL,NULL,NULL,NULL,NULL,'api_incremental'),('db_incremental','incremental_etl_dag','manual__2025-05-23T08:09:27.576488+00:00',-1,'2025-05-23 09:00:43.340667','2025-05-23 09:00:43.749754',0.409087,'failed',2,1,'51c7d41eaea9','airflow',6,'default_pool',1,'default',2,'PythonOperator',NULL,'2025-05-23 09:00:41.735589',1,199,_binary '€}”.','2025-05-23 09:00:43.378141',NULL,NULL,NULL,NULL,NULL,NULL,'db_incremental'),('db_incremental','incremental_etl_dag','manual__2025-05-23T09:20:40.924123+00:00',-1,'2025-05-23 09:21:45.584885','2025-05-23 09:21:45.784019',0.199134,'failed',2,1,'51c7d41eaea9','airflow',9,'default_pool',1,'default',2,'PythonOperator',NULL,'2025-05-23 09:21:44.774686',1,454,_binary '€}”.','2025-05-23 09:21:45.613489',NULL,NULL,NULL,NULL,NULL,NULL,'db_incremental'),('db_incremental','incremental_etl_dag','manual__2025-05-23T09:28:33.825533+00:00',-1,'2025-05-23 09:29:38.599650','2025-05-23 09:29:38.858073',0.258423,'failed',2,1,'5b251e7b28d9','airflow',12,'default_pool',1,'default',2,'PythonOperator',NULL,'2025-05-23 09:29:37.334934',10,189,_binary '€}”.','2025-05-23 09:29:38.638831',NULL,NULL,NULL,NULL,NULL,NULL,'db_incremental'),('db_incremental','incremental_etl_dag','scheduled__2025-05-23T06:30:00+00:00',-1,'2025-05-23 09:00:43.022922','2025-05-23 09:00:43.546946',0.524024,'failed',2,1,'51c7d41eaea9','airflow',4,'default_pool',1,'default',2,'PythonOperator',NULL,'2025-05-23 09:00:41.735589',1,197,_binary '€}”.','2025-05-23 09:00:43.062533',NULL,NULL,NULL,NULL,NULL,NULL,'db_incremental'),('db_incremental','incremental_etl_dag','scheduled__2025-05-23T07:30:00+00:00',-1,'2025-05-23 09:01:44.871536','2025-05-23 09:01:45.181241',0.309705,'failed',2,1,'51c7d41eaea9','airflow',7,'default_pool',1,'default',2,'PythonOperator',NULL,'2025-05-23 09:01:44.032580',1,214,_binary '€}”.','2025-05-23 09:01:44.900679',NULL,NULL,NULL,NULL,NULL,NULL,'db_incremental'),('db_incremental','incremental_etl_dag','scheduled__2025-05-23T08:30:00+00:00',-1,'2025-05-23 09:31:03.226908','2025-05-23 09:31:03.641793',0.414885,'failed',2,1,'5b251e7b28d9','airflow',14,'default_pool',1,'default',2,'PythonOperator',NULL,'2025-05-23 09:31:02.049973',10,207,_binary '€}”.','2025-05-23 09:31:03.250835',NULL,NULL,NULL,NULL,NULL,NULL,'db_incremental');
/*!40000 ALTER TABLE `task_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_instance_note`
--

DROP TABLE IF EXISTS `task_instance_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_instance_note` (
  `user_id` int DEFAULT NULL,
  `task_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `run_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `map_index` int NOT NULL,
  `content` text,
  `created_at` timestamp(6) NOT NULL,
  `updated_at` timestamp(6) NOT NULL,
  PRIMARY KEY (`task_id`,`dag_id`,`run_id`,`map_index`),
  KEY `task_instance_note_ti_fkey` (`dag_id`,`task_id`,`run_id`,`map_index`),
  KEY `task_instance_note_user_fkey` (`user_id`),
  CONSTRAINT `task_instance_note_ti_fkey` FOREIGN KEY (`dag_id`, `task_id`, `run_id`, `map_index`) REFERENCES `task_instance` (`dag_id`, `task_id`, `run_id`, `map_index`) ON DELETE CASCADE,
  CONSTRAINT `task_instance_note_user_fkey` FOREIGN KEY (`user_id`) REFERENCES `ab_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_instance_note`
--

LOCK TABLES `task_instance_note` WRITE;
/*!40000 ALTER TABLE `task_instance_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_instance_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_map`
--

DROP TABLE IF EXISTS `task_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_map` (
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `task_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `run_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `map_index` int NOT NULL,
  `length` int NOT NULL,
  `keys` json DEFAULT NULL,
  PRIMARY KEY (`dag_id`,`task_id`,`run_id`,`map_index`),
  CONSTRAINT `task_map_task_instance_fkey` FOREIGN KEY (`dag_id`, `task_id`, `run_id`, `map_index`) REFERENCES `task_instance` (`dag_id`, `task_id`, `run_id`, `map_index`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ck_task_map_task_map_length_not_negative` CHECK ((`length` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_map`
--

LOCK TABLES `task_map` WRITE;
/*!40000 ALTER TABLE `task_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_outlet_dataset_reference`
--

DROP TABLE IF EXISTS `task_outlet_dataset_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_outlet_dataset_reference` (
  `dataset_id` int NOT NULL,
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `task_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `created_at` timestamp(6) NOT NULL,
  `updated_at` timestamp(6) NOT NULL,
  PRIMARY KEY (`dataset_id`,`dag_id`,`task_id`),
  KEY `todr_dag_id_fkey` (`dag_id`),
  CONSTRAINT `todr_dag_id_fkey` FOREIGN KEY (`dag_id`) REFERENCES `dag` (`dag_id`) ON DELETE CASCADE,
  CONSTRAINT `todr_dataset_fkey` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_outlet_dataset_reference`
--

LOCK TABLES `task_outlet_dataset_reference` WRITE;
/*!40000 ALTER TABLE `task_outlet_dataset_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_outlet_dataset_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_reschedule`
--

DROP TABLE IF EXISTS `task_reschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_reschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `run_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `map_index` int NOT NULL DEFAULT '-1',
  `try_number` int NOT NULL,
  `start_date` timestamp(6) NOT NULL,
  `end_date` timestamp(6) NOT NULL,
  `duration` int NOT NULL,
  `reschedule_date` timestamp(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_task_reschedule_dag_task_run` (`dag_id`,`task_id`,`run_id`,`map_index`),
  KEY `idx_task_reschedule_dag_run` (`dag_id`,`run_id`),
  CONSTRAINT `task_reschedule_dr_fkey` FOREIGN KEY (`dag_id`, `run_id`) REFERENCES `dag_run` (`dag_id`, `run_id`) ON DELETE CASCADE,
  CONSTRAINT `task_reschedule_ti_fkey` FOREIGN KEY (`dag_id`, `task_id`, `run_id`, `map_index`) REFERENCES `task_instance` (`dag_id`, `task_id`, `run_id`, `map_index`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_reschedule`
--

LOCK TABLES `task_reschedule` WRITE;
/*!40000 ALTER TABLE `task_reschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_reschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger`
--

DROP TABLE IF EXISTS `trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trigger` (
  `id` int NOT NULL AUTO_INCREMENT,
  `classpath` varchar(1000) NOT NULL,
  `kwargs` text NOT NULL,
  `created_date` timestamp(6) NOT NULL,
  `triggerer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger`
--

LOCK TABLES `trigger` WRITE;
/*!40000 ALTER TABLE `trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variable`
--

DROP TABLE IF EXISTS `variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(250) DEFAULT NULL,
  `val` mediumtext,
  `description` text,
  `is_encrypted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `variable_key_uq` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variable`
--

LOCK TABLES `variable` WRITE;
/*!40000 ALTER TABLE `variable` DISABLE KEYS */;
INSERT INTO `variable` VALUES (1,'last_db_id','2','',0),(2,'last_api_ts','2024-01-01T00:00:00Z','',0);
/*!40000 ALTER TABLE `variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xcom`
--

DROP TABLE IF EXISTS `xcom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xcom` (
  `dag_run_id` int NOT NULL,
  `task_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `map_index` int NOT NULL DEFAULT '-1',
  `key` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `run_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `value` longblob,
  `timestamp` timestamp(6) NOT NULL,
  PRIMARY KEY (`dag_run_id`,`task_id`,`map_index`,`key`),
  KEY `idx_xcom_task_instance` (`dag_id`,`task_id`,`run_id`,`map_index`),
  KEY `idx_xcom_key` (`key`),
  CONSTRAINT `xcom_task_instance_fkey` FOREIGN KEY (`dag_id`, `task_id`, `run_id`, `map_index`) REFERENCES `task_instance` (`dag_id`, `task_id`, `run_id`, `map_index`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xcom`
--

LOCK TABLES `xcom` WRITE;
/*!40000 ALTER TABLE `xcom` DISABLE KEYS */;
/*!40000 ALTER TABLE `xcom` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-23  9:43:29
