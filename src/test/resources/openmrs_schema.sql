-- MySQL dump 10.13  Distrib 5.6.27, for Linux (x86_64)
--
-- Host: localhost    Database: openmrs
-- ------------------------------------------------------
-- Server version	5.6.27

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
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(63) NOT NULL,
  `AUTHOR` varchar(63) NOT NULL,
  `FILENAME` varchar(200) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`,`AUTHOR`,`FILENAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` tinyint(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_list`
--

DROP TABLE IF EXISTS `active_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_list` (
  `active_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `active_list_type_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `concept_id` int(11) NOT NULL,
  `start_obs_id` int(11) DEFAULT NULL,
  `stop_obs_id` int(11) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`active_list_id`),
  KEY `user_who_voided_active_list` (`voided_by`),
  KEY `user_who_created_active_list` (`creator`),
  KEY `active_list_type_of_active_list` (`active_list_type_id`),
  KEY `person_of_active_list` (`person_id`),
  KEY `concept_active_list` (`concept_id`),
  KEY `start_obs_active_list` (`start_obs_id`),
  KEY `stop_obs_active_list` (`stop_obs_id`),
  CONSTRAINT `active_list_type_of_active_list` FOREIGN KEY (`active_list_type_id`) REFERENCES `active_list_type` (`active_list_type_id`),
  CONSTRAINT `concept_active_list` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `person_of_active_list` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `start_obs_active_list` FOREIGN KEY (`start_obs_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `stop_obs_active_list` FOREIGN KEY (`stop_obs_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `user_who_created_active_list` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_active_list` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_list`
--

LOCK TABLES `active_list` WRITE;
/*!40000 ALTER TABLE `active_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_list_allergy`
--

DROP TABLE IF EXISTS `active_list_allergy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_list_allergy` (
  `active_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `allergy_type` varchar(50) DEFAULT NULL,
  `reaction_concept_id` int(11) DEFAULT NULL,
  `severity` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`active_list_id`),
  KEY `reaction_allergy` (`reaction_concept_id`),
  CONSTRAINT `reaction_allergy` FOREIGN KEY (`reaction_concept_id`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_list_allergy`
--

LOCK TABLES `active_list_allergy` WRITE;
/*!40000 ALTER TABLE `active_list_allergy` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_list_allergy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_list_problem`
--

DROP TABLE IF EXISTS `active_list_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_list_problem` (
  `active_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) DEFAULT NULL,
  `sort_weight` double DEFAULT NULL,
  PRIMARY KEY (`active_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_list_problem`
--

LOCK TABLES `active_list_problem` WRITE;
/*!40000 ALTER TABLE `active_list_problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_list_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_list_type`
--

DROP TABLE IF EXISTS `active_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_list_type` (
  `active_list_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`active_list_type_id`),
  KEY `user_who_retired_active_list_type` (`retired_by`),
  KEY `user_who_created_active_list_type` (`creator`),
  CONSTRAINT `user_who_created_active_list_type` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_active_list_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_list_type`
--

LOCK TABLES `active_list_type` WRITE;
/*!40000 ALTER TABLE `active_list_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_hierarchy_address_to_entry_map`
--

DROP TABLE IF EXISTS `address_hierarchy_address_to_entry_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_hierarchy_address_to_entry_map` (
  `address_to_entry_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_id` int(11) NOT NULL,
  `entry_id` int(11) NOT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`address_to_entry_map_id`),
  KEY `address_id_to_person_address_table` (`address_id`),
  KEY `entry_id_to_address_hierarchy_table` (`entry_id`),
  CONSTRAINT `address_id_to_person_address_table` FOREIGN KEY (`address_id`) REFERENCES `person_address` (`person_address_id`),
  CONSTRAINT `entry_id_to_address_hierarchy_table` FOREIGN KEY (`entry_id`) REFERENCES `address_hierarchy_entry` (`address_hierarchy_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_hierarchy_address_to_entry_map`
--

LOCK TABLES `address_hierarchy_address_to_entry_map` WRITE;
/*!40000 ALTER TABLE `address_hierarchy_address_to_entry_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_hierarchy_address_to_entry_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_hierarchy_entry`
--

DROP TABLE IF EXISTS `address_hierarchy_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_hierarchy_entry` (
  `address_hierarchy_entry_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(160) DEFAULT NULL,
  `level_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `user_generated_id` varchar(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `elevation` double DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`address_hierarchy_entry_id`),
  KEY `parent_name` (`parent_id`,`name`(20)),
  KEY `level_name` (`level_id`,`name`(20)),
  KEY `address_hierarchy_entry_name_idx` (`name`(10)),
  CONSTRAINT `level_to_level` FOREIGN KEY (`level_id`) REFERENCES `address_hierarchy_level` (`address_hierarchy_level_id`),
  CONSTRAINT `parent-to-parent` FOREIGN KEY (`parent_id`) REFERENCES `address_hierarchy_entry` (`address_hierarchy_entry_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_hierarchy_entry`
--

LOCK TABLES `address_hierarchy_entry` WRITE;
/*!40000 ALTER TABLE `address_hierarchy_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_hierarchy_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_hierarchy_level`
--

DROP TABLE IF EXISTS `address_hierarchy_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_hierarchy_level` (
  `address_hierarchy_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(160) DEFAULT NULL,
  `parent_level_id` int(11) DEFAULT NULL,
  `address_field` varchar(50) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_hierarchy_level_id`),
  UNIQUE KEY `parent_level_id_unique` (`parent_level_id`),
  KEY `address_field_unique` (`address_field`),
  CONSTRAINT `parent_level` FOREIGN KEY (`parent_level_id`) REFERENCES `address_hierarchy_level` (`address_hierarchy_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_hierarchy_level`
--

LOCK TABLES `address_hierarchy_level` WRITE;
/*!40000 ALTER TABLE `address_hierarchy_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_hierarchy_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appframework_component_state`
--

DROP TABLE IF EXISTS `appframework_component_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appframework_component_state` (
  `component_state_id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `component_id` varchar(255) NOT NULL,
  `component_type` varchar(50) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`component_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appframework_component_state`
--

LOCK TABLES `appframework_component_state` WRITE;
/*!40000 ALTER TABLE `appframework_component_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `appframework_component_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appframework_user_app`
--

DROP TABLE IF EXISTS `appframework_user_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appframework_user_app` (
  `app_id` varchar(50) NOT NULL,
  `json` mediumtext NOT NULL,
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appframework_user_app`
--

LOCK TABLES `appframework_user_app` WRITE;
/*!40000 ALTER TABLE `appframework_user_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `appframework_user_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentscheduling_appointment`
--

DROP TABLE IF EXISTS `appointmentscheduling_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointmentscheduling_appointment` (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT,
  `time_slot_id` int(11) NOT NULL,
  `visit_id` int(11) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `appointment_type_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `reason` varchar(1024) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(4) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `cancel_reason` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `appointment_creator` (`creator`),
  KEY `appointment_changed_by` (`changed_by`),
  KEY `appointment_voided_by` (`voided_by`),
  KEY `appointment_time_slot_id` (`time_slot_id`),
  KEY `appointment_appointment_type_id` (`appointment_type_id`),
  KEY `appointment_visit_id` (`visit_id`),
  KEY `appointment_patient_id` (`patient_id`),
  CONSTRAINT `appointment_appointment_type_id` FOREIGN KEY (`appointment_type_id`) REFERENCES `appointmentscheduling_appointment_type` (`appointment_type_id`),
  CONSTRAINT `appointment_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `appointment_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `appointment_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `appointment_time_slot_id` FOREIGN KEY (`time_slot_id`) REFERENCES `appointmentscheduling_time_slot` (`time_slot_id`),
  CONSTRAINT `appointment_visit_id` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`),
  CONSTRAINT `appointment_voided_by` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentscheduling_appointment`
--

LOCK TABLES `appointmentscheduling_appointment` WRITE;
/*!40000 ALTER TABLE `appointmentscheduling_appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointmentscheduling_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentscheduling_appointment_block`
--

DROP TABLE IF EXISTS `appointmentscheduling_appointment_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointmentscheduling_appointment_block` (
  `appointment_block_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(4) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`appointment_block_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `appointment_block_creator` (`creator`),
  KEY `appointment_block_changed_by` (`changed_by`),
  KEY `appointment_block_voided_by` (`voided_by`),
  KEY `appointment_block_location_id` (`location_id`),
  KEY `appointment_block_provider_id` (`provider_id`),
  CONSTRAINT `appointment_block_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `appointment_block_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `appointment_block_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `appointment_block_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `appointment_block_voided_by` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentscheduling_appointment_block`
--

LOCK TABLES `appointmentscheduling_appointment_block` WRITE;
/*!40000 ALTER TABLE `appointmentscheduling_appointment_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointmentscheduling_appointment_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentscheduling_appointment_request`
--

DROP TABLE IF EXISTS `appointmentscheduling_appointment_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointmentscheduling_appointment_request` (
  `appointment_request_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `appointment_type_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `requested_by` int(11) DEFAULT NULL,
  `requested_on` datetime NOT NULL,
  `min_time_frame_value` int(11) DEFAULT NULL,
  `min_time_frame_units` varchar(255) DEFAULT NULL,
  `max_time_frame_value` int(11) DEFAULT NULL,
  `max_time_frame_units` varchar(255) DEFAULT NULL,
  `notes` varchar(1024) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(4) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`appointment_request_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `appointment_request_creator` (`creator`),
  KEY `appointment_request_changed_by` (`changed_by`),
  KEY `appointment_request_voided_by` (`voided_by`),
  KEY `appointment_request_appointment_type_id` (`appointment_type_id`),
  KEY `appointment_request_patient_id` (`patient_id`),
  KEY `appointment_request_provider_id` (`provider_id`),
  KEY `appointment_request_requested_by` (`requested_by`),
  CONSTRAINT `appointment_request_appointment_type_id` FOREIGN KEY (`appointment_type_id`) REFERENCES `appointmentscheduling_appointment_type` (`appointment_type_id`),
  CONSTRAINT `appointment_request_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `appointment_request_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `appointment_request_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `appointment_request_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `appointment_request_requested_by` FOREIGN KEY (`requested_by`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `appointment_request_voided_by` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentscheduling_appointment_request`
--

LOCK TABLES `appointmentscheduling_appointment_request` WRITE;
/*!40000 ALTER TABLE `appointmentscheduling_appointment_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointmentscheduling_appointment_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentscheduling_appointment_status_history`
--

DROP TABLE IF EXISTS `appointmentscheduling_appointment_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointmentscheduling_appointment_status_history` (
  `appointment_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `appointment_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`appointment_status_history_id`),
  KEY `appointment_status_history_appointment` (`appointment_id`),
  CONSTRAINT `appointment_status_history_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `appointmentscheduling_appointment` (`appointment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentscheduling_appointment_status_history`
--

LOCK TABLES `appointmentscheduling_appointment_status_history` WRITE;
/*!40000 ALTER TABLE `appointmentscheduling_appointment_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointmentscheduling_appointment_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentscheduling_appointment_type`
--

DROP TABLE IF EXISTS `appointmentscheduling_appointment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointmentscheduling_appointment_type` (
  `appointment_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(4) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `confidential` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`appointment_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `appointment_type_creator` (`creator`),
  KEY `appointment_type_changed_by` (`changed_by`),
  KEY `appointment_type_retired_by` (`retired_by`),
  CONSTRAINT `appointment_type_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `appointment_type_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `appointment_type_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentscheduling_appointment_type`
--

LOCK TABLES `appointmentscheduling_appointment_type` WRITE;
/*!40000 ALTER TABLE `appointmentscheduling_appointment_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointmentscheduling_appointment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentscheduling_block_type_map`
--

DROP TABLE IF EXISTS `appointmentscheduling_block_type_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointmentscheduling_block_type_map` (
  `appointment_type_id` int(11) NOT NULL,
  `appointment_block_id` int(11) NOT NULL,
  PRIMARY KEY (`appointment_type_id`,`appointment_block_id`),
  KEY `appointment_block_type_map_appointment_block_id` (`appointment_block_id`),
  CONSTRAINT `appointment_block_type_map_appointment_block_id` FOREIGN KEY (`appointment_block_id`) REFERENCES `appointmentscheduling_appointment_block` (`appointment_block_id`),
  CONSTRAINT `appointment_block_type_map_appointment_type_id` FOREIGN KEY (`appointment_type_id`) REFERENCES `appointmentscheduling_appointment_type` (`appointment_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentscheduling_block_type_map`
--

LOCK TABLES `appointmentscheduling_block_type_map` WRITE;
/*!40000 ALTER TABLE `appointmentscheduling_block_type_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointmentscheduling_block_type_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentscheduling_time_slot`
--

DROP TABLE IF EXISTS `appointmentscheduling_time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointmentscheduling_time_slot` (
  `time_slot_id` int(11) NOT NULL AUTO_INCREMENT,
  `appointment_block_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(4) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`time_slot_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `appointment_slot_creator` (`creator`),
  KEY `appointment_slot__changed_by` (`changed_by`),
  KEY `appointment_slot_voided_by` (`voided_by`),
  KEY `appointment_slot_appointment_block_id` (`appointment_block_id`),
  CONSTRAINT `appointment_slot__changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `appointment_slot_appointment_block_id` FOREIGN KEY (`appointment_block_id`) REFERENCES `appointmentscheduling_appointment_block` (`appointment_block_id`),
  CONSTRAINT `appointment_slot_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `appointment_slot_voided_by` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentscheduling_time_slot`
--

LOCK TABLES `appointmentscheduling_time_slot` WRITE;
/*!40000 ALTER TABLE `appointmentscheduling_time_slot` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointmentscheduling_time_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqs_task`
--

DROP TABLE IF EXISTS `aqs_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqs_task` (
  `aqs_task_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `aqs_config_path` varchar(1024) NOT NULL,
  `task_status` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `results` text,
  `input_parameters` text,
  `query_config` text,
  `uuid` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`aqs_task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqs_task`
--

LOCK TABLES `aqs_task` WRITE;
/*!40000 ALTER TABLE `aqs_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqs_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bahmni_config`
--

DROP TABLE IF EXISTS `bahmni_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bahmni_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_name` varchar(255) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `config` longtext NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `bahmni_config_unique_app_config_name` (`config_name`,`app_name`),
  UNIQUE KEY `bahmni_config_unique_uuid` (`uuid`),
  KEY `bahmni_config_creator_fk` (`creator`),
  KEY `bahmni_config_changed_by_fk` (`changed_by`),
  CONSTRAINT `bahmni_config_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `bahmni_config_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bahmni_config`
--

LOCK TABLES `bahmni_config` WRITE;
/*!40000 ALTER TABLE `bahmni_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `bahmni_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bahmni_config_version`
--

DROP TABLE IF EXISTS `bahmni_config_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bahmni_config_version` (
  `config_version_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_uuid` char(38) NOT NULL,
  `config_diff` blob NOT NULL,
  `date_created` datetime NOT NULL,
  `version_name` varchar(255) NOT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`config_version_id`),
  UNIQUE KEY `bahmni_config_unique_version_name` (`version_name`),
  UNIQUE KEY `bahmni_config_version_unique_uuid` (`uuid`),
  KEY `bahmni_config_uuid_fk` (`config_uuid`),
  CONSTRAINT `bahmni_config_uuid_fk` FOREIGN KEY (`config_uuid`) REFERENCES `bahmni_config` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bahmni_config_version`
--

LOCK TABLES `bahmni_config_version` WRITE;
/*!40000 ALTER TABLE `bahmni_config_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `bahmni_config_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bed`
--

DROP TABLE IF EXISTS `bed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bed` (
  `bed_id` int(11) NOT NULL AUTO_INCREMENT,
  `bed_number` varchar(50) NOT NULL,
  `status` varchar(255) DEFAULT 'AVAILABLE',
  `bed_type_id` int(11) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bed_id`),
  UNIQUE KEY `bed_unique_uuid` (`uuid`),
  KEY `bed_bed_type_fk` (`bed_type_id`),
  KEY `bed_creator` (`creator`),
  KEY `bed_changed_by_fk` (`changed_by`),
  KEY `bed_voided_by_fk` (`voided_by`),
  CONSTRAINT `bed_bed_type_fk` FOREIGN KEY (`bed_type_id`) REFERENCES `bed_type` (`bed_type_id`),
  CONSTRAINT `bed_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `bed_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `bed_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed`
--

LOCK TABLES `bed` WRITE;
/*!40000 ALTER TABLE `bed` DISABLE KEYS */;
/*!40000 ALTER TABLE `bed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bed_location_map`
--

DROP TABLE IF EXISTS `bed_location_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bed_location_map` (
  `bed_location_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `row_number` smallint(6) NOT NULL,
  `column_number` smallint(6) NOT NULL,
  `bed_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bed_location_map_id`),
  KEY `bed_location_map_location_fk` (`location_id`),
  CONSTRAINT `bed_location_map_location_fk` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed_location_map`
--

LOCK TABLES `bed_location_map` WRITE;
/*!40000 ALTER TABLE `bed_location_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `bed_location_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bed_patient_assignment_map`
--

DROP TABLE IF EXISTS `bed_patient_assignment_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bed_patient_assignment_map` (
  `bed_patient_assignment_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `bed_id` int(11) NOT NULL,
  `date_started` datetime NOT NULL,
  `date_stopped` datetime DEFAULT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bed_patient_assignment_map_id`),
  UNIQUE KEY `bed_unique_uuid` (`uuid`),
  KEY `bed_id_fk` (`bed_id`),
  KEY `bed_patient_assignment_map_patient_fk` (`patient_id`),
  KEY `bed_patient_assignment_map_encounter_fk` (`encounter_id`),
  KEY `bed_patient_assignment_map_creator` (`creator`),
  KEY `bed_patient_assignment_map_changed_by_fk` (`changed_by`),
  KEY `bed_patient_assignment_map_voided_by_fk` (`voided_by`),
  CONSTRAINT `bed_id_fk` FOREIGN KEY (`bed_id`) REFERENCES `bed` (`bed_id`),
  CONSTRAINT `bed_patient_assignment_map_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `bed_patient_assignment_map_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `bed_patient_assignment_map_encounter_fk` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `bed_patient_assignment_map_patient_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `bed_patient_assignment_map_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed_patient_assignment_map`
--

LOCK TABLES `bed_patient_assignment_map` WRITE;
/*!40000 ALTER TABLE `bed_patient_assignment_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `bed_patient_assignment_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bed_type`
--

DROP TABLE IF EXISTS `bed_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bed_type` (
  `bed_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(10) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bed_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed_type`
--

LOCK TABLES `bed_type` WRITE;
/*!40000 ALTER TABLE `bed_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `bed_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calculation_registration`
--

DROP TABLE IF EXISTS `calculation_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calculation_registration` (
  `calculation_registration_id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `provider_class_name` varchar(512) NOT NULL,
  `calculation_name` varchar(512) NOT NULL,
  `configuration` text,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`calculation_registration_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calculation_registration`
--

LOCK TABLES `calculation_registration` WRITE;
/*!40000 ALTER TABLE `calculation_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `calculation_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `care_setting`
--

DROP TABLE IF EXISTS `care_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `care_setting` (
  `care_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `care_setting_type` varchar(50) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`care_setting_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `care_setting_creator` (`creator`),
  KEY `care_setting_retired_by` (`retired_by`),
  KEY `care_setting_changed_by` (`changed_by`),
  CONSTRAINT `care_setting_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `care_setting_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `care_setting_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `care_setting`
--

LOCK TABLES `care_setting` WRITE;
/*!40000 ALTER TABLE `care_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `care_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chunking_history`
--

DROP TABLE IF EXISTS `chunking_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chunking_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chunk_length` bigint(20) DEFAULT NULL,
  `start` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chunking_history`
--

LOCK TABLES `chunking_history` WRITE;
/*!40000 ALTER TABLE `chunking_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `chunking_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clob_datatype_storage`
--

DROP TABLE IF EXISTS `clob_datatype_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clob_datatype_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `clob_datatype_storage_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clob_datatype_storage`
--

LOCK TABLES `clob_datatype_storage` WRITE;
/*!40000 ALTER TABLE `clob_datatype_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `clob_datatype_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cohort`
--

DROP TABLE IF EXISTS `cohort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cohort` (
  `cohort_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`cohort_id`),
  UNIQUE KEY `cohort_uuid_index` (`uuid`),
  KEY `user_who_changed_cohort` (`changed_by`),
  KEY `cohort_creator` (`creator`),
  KEY `user_who_voided_cohort` (`voided_by`),
  CONSTRAINT `cohort_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_changed_cohort` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_cohort` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cohort`
--

LOCK TABLES `cohort` WRITE;
/*!40000 ALTER TABLE `cohort` DISABLE KEYS */;
/*!40000 ALTER TABLE `cohort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cohort_member`
--

DROP TABLE IF EXISTS `cohort_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cohort_member` (
  `cohort_id` int(11) NOT NULL DEFAULT '0',
  `patient_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cohort_id`,`patient_id`),
  KEY `member_patient` (`patient_id`),
  CONSTRAINT `member_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `parent_cohort` FOREIGN KEY (`cohort_id`) REFERENCES `cohort` (`cohort_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cohort_member`
--

LOCK TABLES `cohort_member` WRITE;
/*!40000 ALTER TABLE `cohort_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `cohort_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept`
--

DROP TABLE IF EXISTS `concept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept` (
  `concept_id` int(11) NOT NULL AUTO_INCREMENT,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `short_name` varchar(255) DEFAULT NULL,
  `description` text,
  `form_text` text,
  `datatype_id` int(11) NOT NULL DEFAULT '0',
  `class_id` int(11) NOT NULL DEFAULT '0',
  `is_set` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_id`),
  UNIQUE KEY `concept_uuid_index` (`uuid`),
  KEY `user_who_changed_concept` (`changed_by`),
  KEY `concept_classes` (`class_id`),
  KEY `concept_creator` (`creator`),
  KEY `concept_datatypes` (`datatype_id`),
  KEY `user_who_retired_concept` (`retired_by`),
  CONSTRAINT `concept_classes` FOREIGN KEY (`class_id`) REFERENCES `concept_class` (`concept_class_id`),
  CONSTRAINT `concept_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `concept_datatypes` FOREIGN KEY (`datatype_id`) REFERENCES `concept_datatype` (`concept_datatype_id`),
  CONSTRAINT `user_who_changed_concept` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_concept` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept`
--

LOCK TABLES `concept` WRITE;
/*!40000 ALTER TABLE `concept` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_answer`
--

DROP TABLE IF EXISTS `concept_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_answer` (
  `concept_answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `answer_concept` int(11) DEFAULT NULL,
  `answer_drug` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `sort_weight` double DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_answer_id`),
  UNIQUE KEY `concept_answer_uuid_index` (`uuid`),
  KEY `answer` (`answer_concept`),
  KEY `answers_for_concept` (`concept_id`),
  KEY `answer_creator` (`creator`),
  KEY `answer_answer_drug_fk` (`answer_drug`),
  CONSTRAINT `answer` FOREIGN KEY (`answer_concept`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `answer_answer_drug_fk` FOREIGN KEY (`answer_drug`) REFERENCES `drug` (`drug_id`),
  CONSTRAINT `answer_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `answers_for_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_answer`
--

LOCK TABLES `concept_answer` WRITE;
/*!40000 ALTER TABLE `concept_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_class`
--

DROP TABLE IF EXISTS `concept_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_class` (
  `concept_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_class_id`),
  UNIQUE KEY `concept_class_uuid_index` (`uuid`),
  KEY `concept_class_retired_status` (`retired`),
  KEY `concept_class_creator` (`creator`),
  KEY `user_who_retired_concept_class` (`retired_by`),
  KEY `concept_class_name_index` (`name`),
  CONSTRAINT `concept_class_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_concept_class` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_class`
--

LOCK TABLES `concept_class` WRITE;
/*!40000 ALTER TABLE `concept_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_complex`
--

DROP TABLE IF EXISTS `concept_complex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_complex` (
  `concept_id` int(11) NOT NULL,
  `handler` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`concept_id`),
  CONSTRAINT `concept_attributes` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_complex`
--

LOCK TABLES `concept_complex` WRITE;
/*!40000 ALTER TABLE `concept_complex` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_complex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_datatype`
--

DROP TABLE IF EXISTS `concept_datatype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_datatype` (
  `concept_datatype_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `hl7_abbreviation` varchar(3) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_datatype_id`),
  UNIQUE KEY `concept_datatype_uuid_index` (`uuid`),
  KEY `concept_datatype_retired_status` (`retired`),
  KEY `concept_datatype_creator` (`creator`),
  KEY `user_who_retired_concept_datatype` (`retired_by`),
  KEY `concept_datatype_name_index` (`name`),
  CONSTRAINT `concept_datatype_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_concept_datatype` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_datatype`
--

LOCK TABLES `concept_datatype` WRITE;
/*!40000 ALTER TABLE `concept_datatype` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_datatype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_description`
--

DROP TABLE IF EXISTS `concept_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_description` (
  `concept_description_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `locale` varchar(50) NOT NULL DEFAULT '',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_description_id`),
  UNIQUE KEY `concept_description_uuid_index` (`uuid`),
  KEY `user_who_changed_description` (`changed_by`),
  KEY `description_for_concept` (`concept_id`),
  KEY `user_who_created_description` (`creator`),
  CONSTRAINT `description_for_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_changed_description` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_description` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_description`
--

LOCK TABLES `concept_description` WRITE;
/*!40000 ALTER TABLE `concept_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_map_type`
--

DROP TABLE IF EXISTS `concept_map_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_map_type` (
  `concept_map_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_map_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `name` (`name`),
  KEY `mapped_user_creator_concept_map_type` (`creator`),
  KEY `mapped_user_changed_concept_map_type` (`changed_by`),
  KEY `mapped_user_retired_concept_map_type` (`retired_by`),
  CONSTRAINT `mapped_user_changed_concept_map_type` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_creator_concept_map_type` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_retired_concept_map_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_map_type`
--

LOCK TABLES `concept_map_type` WRITE;
/*!40000 ALTER TABLE `concept_map_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_map_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_name`
--

DROP TABLE IF EXISTS `concept_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_name` (
  `concept_name_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `locale` varchar(50) NOT NULL DEFAULT '',
  `locale_preferred` tinyint(1) DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `concept_name_type` varchar(50) DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_name_id`),
  UNIQUE KEY `concept_name_uuid_index` (`uuid`),
  KEY `name_of_concept` (`name`),
  KEY `name_for_concept` (`concept_id`),
  KEY `user_who_created_name` (`creator`),
  KEY `user_who_voided_this_name` (`voided_by`),
  CONSTRAINT `name_for_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_created_name` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_this_name` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_name`
--

LOCK TABLES `concept_name` WRITE;
/*!40000 ALTER TABLE `concept_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_name_tag`
--

DROP TABLE IF EXISTS `concept_name_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_name_tag` (
  `concept_name_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) NOT NULL,
  `description` text,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_name_tag_id`),
  UNIQUE KEY `concept_name_tag_unique_tags` (`tag`),
  UNIQUE KEY `concept_name_tag_uuid_index` (`uuid`),
  KEY `user_who_created_name_tag` (`creator`),
  KEY `user_who_voided_name_tag` (`voided_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_name_tag`
--

LOCK TABLES `concept_name_tag` WRITE;
/*!40000 ALTER TABLE `concept_name_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_name_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_name_tag_map`
--

DROP TABLE IF EXISTS `concept_name_tag_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_name_tag_map` (
  `concept_name_id` int(11) NOT NULL,
  `concept_name_tag_id` int(11) NOT NULL,
  KEY `mapped_concept_name` (`concept_name_id`),
  KEY `mapped_concept_name_tag` (`concept_name_tag_id`),
  CONSTRAINT `mapped_concept_name` FOREIGN KEY (`concept_name_id`) REFERENCES `concept_name` (`concept_name_id`),
  CONSTRAINT `mapped_concept_name_tag` FOREIGN KEY (`concept_name_tag_id`) REFERENCES `concept_name_tag` (`concept_name_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_name_tag_map`
--

LOCK TABLES `concept_name_tag_map` WRITE;
/*!40000 ALTER TABLE `concept_name_tag_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_name_tag_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_numeric`
--

DROP TABLE IF EXISTS `concept_numeric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_numeric` (
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `hi_absolute` double DEFAULT NULL,
  `hi_critical` double DEFAULT NULL,
  `hi_normal` double DEFAULT NULL,
  `low_absolute` double DEFAULT NULL,
  `low_critical` double DEFAULT NULL,
  `low_normal` double DEFAULT NULL,
  `units` varchar(50) DEFAULT NULL,
  `precise` tinyint(1) NOT NULL DEFAULT '0',
  `display_precision` int(11) DEFAULT NULL,
  PRIMARY KEY (`concept_id`),
  CONSTRAINT `numeric_attributes` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_numeric`
--

LOCK TABLES `concept_numeric` WRITE;
/*!40000 ALTER TABLE `concept_numeric` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_numeric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_proposal`
--

DROP TABLE IF EXISTS `concept_proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_proposal` (
  `concept_proposal_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) DEFAULT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  `original_text` varchar(255) NOT NULL DEFAULT '',
  `final_text` varchar(255) DEFAULT NULL,
  `obs_id` int(11) DEFAULT NULL,
  `obs_concept_id` int(11) DEFAULT NULL,
  `state` varchar(32) NOT NULL DEFAULT 'UNMAPPED',
  `comments` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `locale` varchar(50) NOT NULL DEFAULT '',
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_proposal_id`),
  UNIQUE KEY `concept_proposal_uuid_index` (`uuid`),
  KEY `user_who_changed_proposal` (`changed_by`),
  KEY `concept_for_proposal` (`concept_id`),
  KEY `user_who_created_proposal` (`creator`),
  KEY `encounter_for_proposal` (`encounter_id`),
  KEY `proposal_obs_concept_id` (`obs_concept_id`),
  KEY `proposal_obs_id` (`obs_id`),
  CONSTRAINT `concept_for_proposal` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `encounter_for_proposal` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `proposal_obs_concept_id` FOREIGN KEY (`obs_concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `proposal_obs_id` FOREIGN KEY (`obs_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `user_who_changed_proposal` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_proposal` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_proposal`
--

LOCK TABLES `concept_proposal` WRITE;
/*!40000 ALTER TABLE `concept_proposal` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_proposal_tag_map`
--

DROP TABLE IF EXISTS `concept_proposal_tag_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_proposal_tag_map` (
  `concept_proposal_id` int(11) NOT NULL,
  `concept_name_tag_id` int(11) NOT NULL,
  KEY `mapped_concept_proposal_tag` (`concept_name_tag_id`),
  KEY `mapped_concept_proposal` (`concept_proposal_id`),
  CONSTRAINT `mapped_concept_proposal` FOREIGN KEY (`concept_proposal_id`) REFERENCES `concept_proposal` (`concept_proposal_id`),
  CONSTRAINT `mapped_concept_proposal_tag` FOREIGN KEY (`concept_name_tag_id`) REFERENCES `concept_name_tag` (`concept_name_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_proposal_tag_map`
--

LOCK TABLES `concept_proposal_tag_map` WRITE;
/*!40000 ALTER TABLE `concept_proposal_tag_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_proposal_tag_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_reference_map`
--

DROP TABLE IF EXISTS `concept_reference_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_reference_map` (
  `concept_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_reference_term_id` int(11) NOT NULL,
  `concept_map_type_id` int(11) NOT NULL DEFAULT '1',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_map_id`),
  KEY `map_for_concept` (`concept_id`),
  KEY `map_creator` (`creator`),
  KEY `mapped_concept_map_type` (`concept_map_type_id`),
  KEY `mapped_user_changed_ref_term` (`changed_by`),
  KEY `mapped_concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `map_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `map_for_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `mapped_concept_map_type` FOREIGN KEY (`concept_map_type_id`) REFERENCES `concept_map_type` (`concept_map_type_id`),
  CONSTRAINT `mapped_concept_reference_term` FOREIGN KEY (`concept_reference_term_id`) REFERENCES `concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `mapped_user_changed_ref_term` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_reference_map`
--

LOCK TABLES `concept_reference_map` WRITE;
/*!40000 ALTER TABLE `concept_reference_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_reference_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_reference_source`
--

DROP TABLE IF EXISTS `concept_reference_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_reference_source` (
  `concept_source_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `hl7_code` varchar(50) DEFAULT '',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_source_id`),
  UNIQUE KEY `concept_source_unique_hl7_codes` (`hl7_code`),
  KEY `unique_hl7_code` (`hl7_code`),
  KEY `concept_source_creator` (`creator`),
  KEY `user_who_retired_concept_source` (`retired_by`),
  CONSTRAINT `concept_source_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_concept_source` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_reference_source`
--

LOCK TABLES `concept_reference_source` WRITE;
/*!40000 ALTER TABLE `concept_reference_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_reference_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_reference_term`
--

DROP TABLE IF EXISTS `concept_reference_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_reference_term` (
  `concept_reference_term_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_source_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `version` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_reference_term_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `mapped_user_creator` (`creator`),
  KEY `mapped_user_changed` (`changed_by`),
  KEY `mapped_user_retired` (`retired_by`),
  KEY `mapped_concept_source` (`concept_source_id`),
  KEY `idx_code_concept_reference_term` (`code`),
  CONSTRAINT `mapped_concept_source` FOREIGN KEY (`concept_source_id`) REFERENCES `concept_reference_source` (`concept_source_id`),
  CONSTRAINT `mapped_user_changed` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_retired` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_reference_term`
--

LOCK TABLES `concept_reference_term` WRITE;
/*!40000 ALTER TABLE `concept_reference_term` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_reference_term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_reference_term_map`
--

DROP TABLE IF EXISTS `concept_reference_term_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_reference_term_map` (
  `concept_reference_term_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `term_a_id` int(11) NOT NULL,
  `term_b_id` int(11) NOT NULL,
  `a_is_to_b_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_reference_term_map_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `mapped_term_a` (`term_a_id`),
  KEY `mapped_term_b` (`term_b_id`),
  KEY `mapped_concept_map_type_ref_term_map` (`a_is_to_b_id`),
  KEY `mapped_user_creator_ref_term_map` (`creator`),
  KEY `mapped_user_changed_ref_term_map` (`changed_by`),
  CONSTRAINT `mapped_concept_map_type_ref_term_map` FOREIGN KEY (`a_is_to_b_id`) REFERENCES `concept_map_type` (`concept_map_type_id`),
  CONSTRAINT `mapped_term_a` FOREIGN KEY (`term_a_id`) REFERENCES `concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `mapped_term_b` FOREIGN KEY (`term_b_id`) REFERENCES `concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `mapped_user_changed_ref_term_map` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_creator_ref_term_map` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_reference_term_map`
--

LOCK TABLES `concept_reference_term_map` WRITE;
/*!40000 ALTER TABLE `concept_reference_term_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_reference_term_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_set`
--

DROP TABLE IF EXISTS `concept_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_set` (
  `concept_set_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `concept_set` int(11) NOT NULL DEFAULT '0',
  `sort_weight` double DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_set_id`),
  UNIQUE KEY `concept_set_uuid_index` (`uuid`),
  KEY `idx_concept_set_concept` (`concept_id`),
  KEY `has_a` (`concept_set`),
  KEY `user_who_created` (`creator`),
  CONSTRAINT `has_a` FOREIGN KEY (`concept_set`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_created` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_set`
--

LOCK TABLES `concept_set` WRITE;
/*!40000 ALTER TABLE `concept_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_state_conversion`
--

DROP TABLE IF EXISTS `concept_state_conversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_state_conversion` (
  `concept_state_conversion_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) DEFAULT '0',
  `program_workflow_id` int(11) DEFAULT '0',
  `program_workflow_state_id` int(11) DEFAULT '0',
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_state_conversion_id`),
  UNIQUE KEY `unique_workflow_concept_in_conversion` (`program_workflow_id`,`concept_id`),
  UNIQUE KEY `concept_state_conversion_uuid_index` (`uuid`),
  KEY `concept_triggers_conversion` (`concept_id`),
  KEY `conversion_to_state` (`program_workflow_state_id`),
  CONSTRAINT `concept_triggers_conversion` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `conversion_involves_workflow` FOREIGN KEY (`program_workflow_id`) REFERENCES `program_workflow` (`program_workflow_id`),
  CONSTRAINT `conversion_to_state` FOREIGN KEY (`program_workflow_state_id`) REFERENCES `program_workflow_state` (`program_workflow_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_state_conversion`
--

LOCK TABLES `concept_state_conversion` WRITE;
/*!40000 ALTER TABLE `concept_state_conversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_state_conversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_stop_word`
--

DROP TABLE IF EXISTS `concept_stop_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_stop_word` (
  `concept_stop_word_id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(50) NOT NULL,
  `locale` varchar(50) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_stop_word_id`),
  UNIQUE KEY `Unique_StopWord_Key` (`word`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_stop_word`
--

LOCK TABLES `concept_stop_word` WRITE;
/*!40000 ALTER TABLE `concept_stop_word` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_stop_word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conditions`
--

DROP TABLE IF EXISTS `conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conditions` (
  `condition_id` int(11) NOT NULL AUTO_INCREMENT,
  `previous_condition_id` int(11) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `concept_id` int(11) NOT NULL,
  `condition_non_coded` varchar(1024) DEFAULT NULL,
  `onset_date` datetime DEFAULT NULL,
  `additional_detail` varchar(1024) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `end_reason` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL,
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`condition_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `condition_uuid_index` (`uuid`),
  KEY `conditions_previous_condition_id_fk` (`previous_condition_id`),
  KEY `conditions_patient_fk` (`patient_id`),
  KEY `conditions_concept_fk` (`concept_id`),
  KEY `conditions_end_reason_fk` (`end_reason`),
  KEY `conditions_created_by_fk` (`creator`),
  KEY `conditions_voided_by_fk` (`voided_by`),
  CONSTRAINT `conditions_concept_fk` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `conditions_created_by_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `conditions_end_reason_fk` FOREIGN KEY (`end_reason`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `conditions_patient_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `conditions_previous_condition_id_fk` FOREIGN KEY (`previous_condition_id`) REFERENCES `conditions` (`condition_id`),
  CONSTRAINT `conditions_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditions`
--

LOCK TABLES `conditions` WRITE;
/*!40000 ALTER TABLE `conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug`
--

DROP TABLE IF EXISTS `drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug` (
  `drug_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `combination` tinyint(1) NOT NULL DEFAULT '0',
  `dosage_form` int(11) DEFAULT NULL,
  `maximum_daily_dose` double DEFAULT NULL,
  `minimum_daily_dose` double DEFAULT NULL,
  `route` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `strength` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`drug_id`),
  UNIQUE KEY `drug_uuid_index` (`uuid`),
  KEY `primary_drug_concept` (`concept_id`),
  KEY `drug_creator` (`creator`),
  KEY `drug_changed_by` (`changed_by`),
  KEY `dosage_form_concept` (`dosage_form`),
  KEY `drug_retired_by` (`retired_by`),
  KEY `route_concept` (`route`),
  CONSTRAINT `dosage_form_concept` FOREIGN KEY (`dosage_form`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `drug_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `drug_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `drug_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `primary_drug_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `route_concept` FOREIGN KEY (`route`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug`
--

LOCK TABLES `drug` WRITE;
/*!40000 ALTER TABLE `drug` DISABLE KEYS */;
/*!40000 ALTER TABLE `drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug_ingredient`
--

DROP TABLE IF EXISTS `drug_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_ingredient` (
  `drug_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `uuid` char(38) NOT NULL,
  `strength` double DEFAULT NULL,
  `units` int(11) DEFAULT NULL,
  PRIMARY KEY (`drug_id`,`ingredient_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `drug_ingredient_units_fk` (`units`),
  KEY `drug_ingredient_ingredient_id_fk` (`ingredient_id`),
  CONSTRAINT `drug_ingredient_drug_id_fk` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`drug_id`),
  CONSTRAINT `drug_ingredient_ingredient_id_fk` FOREIGN KEY (`ingredient_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `drug_ingredient_units_fk` FOREIGN KEY (`units`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug_ingredient`
--

LOCK TABLES `drug_ingredient` WRITE;
/*!40000 ALTER TABLE `drug_ingredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `drug_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug_order`
--

DROP TABLE IF EXISTS `drug_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_order` (
  `order_id` int(11) NOT NULL DEFAULT '0',
  `drug_inventory_id` int(11) DEFAULT NULL,
  `dose` double DEFAULT NULL,
  `as_needed` smallint(6) NOT NULL,
  `dosing_type` varchar(255) DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `as_needed_condition` varchar(255) DEFAULT NULL,
  `num_refills` int(11) DEFAULT NULL,
  `dosing_instructions` text,
  `duration` int(11) DEFAULT NULL,
  `duration_units` int(11) DEFAULT NULL,
  `quantity_units` int(11) DEFAULT NULL,
  `route` int(11) DEFAULT NULL,
  `dose_units` int(11) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `brand_name` varchar(255) DEFAULT NULL,
  `dispense_as_written` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`),
  KEY `inventory_item` (`drug_inventory_id`),
  KEY `drug_order_duration_units_fk` (`duration_units`),
  KEY `drug_order_quantity_units` (`quantity_units`),
  KEY `drug_order_route_fk` (`route`),
  KEY `drug_order_dose_units` (`dose_units`),
  KEY `drug_order_frequency_fk` (`frequency`),
  CONSTRAINT `drug_order_dose_units` FOREIGN KEY (`dose_units`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `drug_order_duration_units_fk` FOREIGN KEY (`duration_units`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `drug_order_frequency_fk` FOREIGN KEY (`frequency`) REFERENCES `order_frequency` (`order_frequency_id`),
  CONSTRAINT `drug_order_quantity_units` FOREIGN KEY (`quantity_units`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `drug_order_route_fk` FOREIGN KEY (`route`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `extends_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `inventory_item` FOREIGN KEY (`drug_inventory_id`) REFERENCES `drug` (`drug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug_order`
--

LOCK TABLES `drug_order` WRITE;
/*!40000 ALTER TABLE `drug_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `drug_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug_reference_map`
--

DROP TABLE IF EXISTS `drug_reference_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_reference_map` (
  `drug_reference_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `drug_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  `concept_map_type` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`drug_reference_map_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `drug_for_drug_reference_map` (`drug_id`),
  KEY `concept_reference_term_for_drug_reference_map` (`term_id`),
  KEY `concept_map_type_for_drug_reference_map` (`concept_map_type`),
  KEY `user_who_changed_drug_reference_map` (`changed_by`),
  KEY `drug_reference_map_creator` (`creator`),
  KEY `user_who_retired_drug_reference_map` (`retired_by`),
  CONSTRAINT `concept_map_type_for_drug_reference_map` FOREIGN KEY (`concept_map_type`) REFERENCES `concept_map_type` (`concept_map_type_id`),
  CONSTRAINT `concept_reference_term_for_drug_reference_map` FOREIGN KEY (`term_id`) REFERENCES `concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `drug_for_drug_reference_map` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`drug_id`),
  CONSTRAINT `drug_reference_map_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_changed_drug_reference_map` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_drug_reference_map` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug_reference_map`
--

LOCK TABLES `drug_reference_map` WRITE;
/*!40000 ALTER TABLE `drug_reference_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `drug_reference_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter`
--

DROP TABLE IF EXISTS `encounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter` (
  `encounter_id` int(11) NOT NULL AUTO_INCREMENT,
  `encounter_type` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `location_id` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `encounter_datetime` datetime NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `visit_id` int(11) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`encounter_id`),
  UNIQUE KEY `encounter_uuid_index` (`uuid`),
  KEY `encounter_datetime_idx` (`encounter_datetime`),
  KEY `encounter_ibfk_1` (`creator`),
  KEY `encounter_type_id` (`encounter_type`),
  KEY `encounter_form` (`form_id`),
  KEY `encounter_location` (`location_id`),
  KEY `encounter_patient` (`patient_id`),
  KEY `user_who_voided_encounter` (`voided_by`),
  KEY `encounter_changed_by` (`changed_by`),
  KEY `encounter_visit_id_fk` (`visit_id`),
  CONSTRAINT `encounter_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_form` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`),
  CONSTRAINT `encounter_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `encounter_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `encounter_type_id` FOREIGN KEY (`encounter_type`) REFERENCES `encounter_type` (`encounter_type_id`),
  CONSTRAINT `encounter_visit_id_fk` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`),
  CONSTRAINT `user_who_voided_encounter` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter`
--

LOCK TABLES `encounter` WRITE;
/*!40000 ALTER TABLE `encounter` DISABLE KEYS */;
/*!40000 ALTER TABLE `encounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter_provider`
--

DROP TABLE IF EXISTS `encounter_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter_provider` (
  `encounter_provider_id` int(11) NOT NULL AUTO_INCREMENT,
  `encounter_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `encounter_role_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `date_voided` datetime DEFAULT NULL,
  `voided_by` int(11) DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`encounter_provider_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `encounter_id_fk` (`encounter_id`),
  KEY `provider_id_fk` (`provider_id`),
  KEY `encounter_role_id_fk` (`encounter_role_id`),
  KEY `encounter_provider_creator` (`creator`),
  KEY `encounter_provider_changed_by` (`changed_by`),
  KEY `encounter_provider_voided_by` (`voided_by`),
  CONSTRAINT `encounter_id_fk` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `encounter_provider_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_provider_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_provider_voided_by` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_role_id_fk` FOREIGN KEY (`encounter_role_id`) REFERENCES `encounter_role` (`encounter_role_id`),
  CONSTRAINT `provider_id_fk` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter_provider`
--

LOCK TABLES `encounter_provider` WRITE;
/*!40000 ALTER TABLE `encounter_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `encounter_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter_role`
--

DROP TABLE IF EXISTS `encounter_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter_role` (
  `encounter_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`encounter_role_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `encounter_role_unique_name` (`name`),
  KEY `encounter_role_creator_fk` (`creator`),
  KEY `encounter_role_changed_by_fk` (`changed_by`),
  KEY `encounter_role_retired_by_fk` (`retired_by`),
  CONSTRAINT `encounter_role_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_role_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_role_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter_role`
--

LOCK TABLES `encounter_role` WRITE;
/*!40000 ALTER TABLE `encounter_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `encounter_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter_type`
--

DROP TABLE IF EXISTS `encounter_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter_type` (
  `encounter_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `view_privilege` varchar(255) DEFAULT NULL,
  `edit_privilege` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`encounter_type_id`),
  UNIQUE KEY `encounter_type_unique_name` (`name`),
  UNIQUE KEY `encounter_type_uuid_index` (`uuid`),
  KEY `encounter_type_retired_status` (`retired`),
  KEY `user_who_created_type` (`creator`),
  KEY `user_who_retired_encounter_type` (`retired_by`),
  KEY `privilege_which_can_view_encounter_type` (`view_privilege`),
  KEY `privilege_which_can_edit_encounter_type` (`edit_privilege`),
  CONSTRAINT `privilege_which_can_edit_encounter_type` FOREIGN KEY (`edit_privilege`) REFERENCES `privilege` (`privilege`),
  CONSTRAINT `privilege_which_can_view_encounter_type` FOREIGN KEY (`view_privilege`) REFERENCES `privilege` (`privilege`),
  CONSTRAINT `user_who_created_type` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_encounter_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter_type`
--

LOCK TABLES `encounter_type` WRITE;
/*!40000 ALTER TABLE `encounter_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `encounter_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_mapping`
--

DROP TABLE IF EXISTS `entity_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `entity_mapping_type_id` int(11) NOT NULL,
  `entity1_uuid` char(38) NOT NULL,
  `entity2_uuid` char(38) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entity_mapping_entity_mapping_type_fk` (`entity_mapping_type_id`),
  CONSTRAINT `entity_mapping_entity_mapping_type_fk` FOREIGN KEY (`entity_mapping_type_id`) REFERENCES `entity_mapping_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_mapping`
--

LOCK TABLES `entity_mapping` WRITE;
/*!40000 ALTER TABLE `entity_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_mapping_type`
--

DROP TABLE IF EXISTS `entity_mapping_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_mapping_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `uuid` char(38) NOT NULL,
  `entity1_type` text NOT NULL,
  `entity2_type` text NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_entity_mapping_type_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_mapping_type`
--

LOCK TABLES `entity_mapping_type` WRITE;
/*!40000 ALTER TABLE `entity_mapping_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_mapping_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_records`
--

DROP TABLE IF EXISTS `event_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(40) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uri` varchar(255) DEFAULT NULL,
  `object` varchar(1000) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `event_records_category_idx` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_records`
--

LOCK TABLES `event_records` WRITE;
/*!40000 ALTER TABLE `event_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_records_offset_marker`
--

DROP TABLE IF EXISTS `event_records_offset_marker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_records_offset_marker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `event_count` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_records_offset_marker`
--

LOCK TABLES `event_records_offset_marker` WRITE;
/*!40000 ALTER TABLE `event_records_offset_marker` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_records_offset_marker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_records_queue`
--

DROP TABLE IF EXISTS `event_records_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_records_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(40) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uri` varchar(255) DEFAULT NULL,
  `object` varchar(1000) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_records_queue`
--

LOCK TABLES `event_records_queue` WRITE;
/*!40000 ALTER TABLE `event_records_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_records_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_event_retry_log`
--

DROP TABLE IF EXISTS `failed_event_retry_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_event_retry_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `feed_uri` varchar(255) DEFAULT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `error_message` varchar(4000) DEFAULT NULL,
  `event_id` varchar(255) DEFAULT NULL,
  `event_content` varchar(4000) DEFAULT NULL,
  `error_hash_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_event_retry_log`
--

LOCK TABLES `failed_event_retry_log` WRITE;
/*!40000 ALTER TABLE `failed_event_retry_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_event_retry_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_events`
--

DROP TABLE IF EXISTS `failed_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `feed_uri` varchar(255) DEFAULT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `error_message` varchar(4000) DEFAULT NULL,
  `event_id` varchar(255) DEFAULT NULL,
  `event_content` varchar(4000) DEFAULT NULL,
  `error_hash_code` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `retries` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_events`
--

LOCK TABLES `failed_events` WRITE;
/*!40000 ALTER TABLE `failed_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field`
--

DROP TABLE IF EXISTS `field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `field_type` int(11) DEFAULT NULL,
  `concept_id` int(11) DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `attribute_name` varchar(50) DEFAULT NULL,
  `default_value` text,
  `select_multiple` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`field_id`),
  UNIQUE KEY `field_uuid_index` (`uuid`),
  KEY `field_retired_status` (`retired`),
  KEY `user_who_changed_field` (`changed_by`),
  KEY `concept_for_field` (`concept_id`),
  KEY `user_who_created_field` (`creator`),
  KEY `type_of_field` (`field_type`),
  KEY `user_who_retired_field` (`retired_by`),
  CONSTRAINT `concept_for_field` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `type_of_field` FOREIGN KEY (`field_type`) REFERENCES `field_type` (`field_type_id`),
  CONSTRAINT `user_who_changed_field` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_field` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_field` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field`
--

LOCK TABLES `field` WRITE;
/*!40000 ALTER TABLE `field` DISABLE KEYS */;
/*!40000 ALTER TABLE `field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_answer`
--

DROP TABLE IF EXISTS `field_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_answer` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `answer_id` int(11) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`field_id`,`answer_id`),
  UNIQUE KEY `field_answer_uuid_index` (`uuid`),
  KEY `field_answer_concept` (`answer_id`),
  KEY `user_who_created_field_answer` (`creator`),
  CONSTRAINT `answers_for_field` FOREIGN KEY (`field_id`) REFERENCES `field` (`field_id`),
  CONSTRAINT `field_answer_concept` FOREIGN KEY (`answer_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_created_field_answer` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_answer`
--

LOCK TABLES `field_answer` WRITE;
/*!40000 ALTER TABLE `field_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_type`
--

DROP TABLE IF EXISTS `field_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_type` (
  `field_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `is_set` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`field_type_id`),
  UNIQUE KEY `field_type_uuid_index` (`uuid`),
  KEY `user_who_created_field_type` (`creator`),
  CONSTRAINT `user_who_created_field_type` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_type`
--

LOCK TABLES `field_type` WRITE;
/*!40000 ALTER TABLE `field_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form`
--

DROP TABLE IF EXISTS `form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form` (
  `form_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(50) NOT NULL DEFAULT '',
  `build` int(11) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `xslt` text,
  `template` text,
  `description` text,
  `encounter_type` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retired_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`form_id`),
  UNIQUE KEY `form_uuid_index` (`uuid`),
  KEY `form_published_index` (`published`),
  KEY `form_retired_index` (`retired`),
  KEY `form_published_and_retired_index` (`published`,`retired`),
  KEY `user_who_last_changed_form` (`changed_by`),
  KEY `user_who_created_form` (`creator`),
  KEY `form_encounter_type` (`encounter_type`),
  KEY `user_who_retired_form` (`retired_by`),
  CONSTRAINT `form_encounter_type` FOREIGN KEY (`encounter_type`) REFERENCES `encounter_type` (`encounter_type_id`),
  CONSTRAINT `user_who_created_form` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_last_changed_form` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_form` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form`
--

LOCK TABLES `form` WRITE;
/*!40000 ALTER TABLE `form` DISABLE KEYS */;
/*!40000 ALTER TABLE `form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_field`
--

DROP TABLE IF EXISTS `form_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_field` (
  `form_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL DEFAULT '0',
  `field_id` int(11) NOT NULL DEFAULT '0',
  `field_number` int(11) DEFAULT NULL,
  `field_part` varchar(5) DEFAULT NULL,
  `page_number` int(11) DEFAULT NULL,
  `parent_form_field` int(11) DEFAULT NULL,
  `min_occurs` int(11) DEFAULT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `sort_weight` double DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`form_field_id`),
  UNIQUE KEY `form_field_uuid_index` (`uuid`),
  KEY `user_who_last_changed_form_field` (`changed_by`),
  KEY `user_who_created_form_field` (`creator`),
  KEY `field_within_form` (`field_id`),
  KEY `form_containing_field` (`form_id`),
  KEY `form_field_hierarchy` (`parent_form_field`),
  CONSTRAINT `field_within_form` FOREIGN KEY (`field_id`) REFERENCES `field` (`field_id`),
  CONSTRAINT `form_containing_field` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`),
  CONSTRAINT `form_field_hierarchy` FOREIGN KEY (`parent_form_field`) REFERENCES `form_field` (`form_field_id`),
  CONSTRAINT `user_who_created_form_field` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_last_changed_form_field` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_field`
--

LOCK TABLES `form_field` WRITE;
/*!40000 ALTER TABLE `form_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_resource`
--

DROP TABLE IF EXISTS `form_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_resource` (
  `form_resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value_reference` text NOT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`form_resource_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `unique_form_and_name` (`form_id`,`name`),
  CONSTRAINT `form_resource_form_fk` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_resource`
--

LOCK TABLES `form_resource` WRITE;
/*!40000 ALTER TABLE `form_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_property`
--

DROP TABLE IF EXISTS `global_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_property` (
  `property` varchar(255) NOT NULL DEFAULT '',
  `property_value` text,
  `description` text,
  `uuid` char(38) DEFAULT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  PRIMARY KEY (`property`),
  UNIQUE KEY `global_property_uuid_index` (`uuid`),
  KEY `global_property_property_index` (`property`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_property`
--

LOCK TABLES `global_property` WRITE;
/*!40000 ALTER TABLE `global_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `global_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hl7_in_archive`
--

DROP TABLE IF EXISTS `hl7_in_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hl7_in_archive` (
  `hl7_in_archive_id` int(11) NOT NULL AUTO_INCREMENT,
  `hl7_source` int(11) NOT NULL DEFAULT '0',
  `hl7_source_key` varchar(255) DEFAULT NULL,
  `hl7_data` text NOT NULL,
  `date_created` datetime NOT NULL,
  `message_state` int(11) DEFAULT '2',
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`hl7_in_archive_id`),
  UNIQUE KEY `hl7_in_archive_uuid_index` (`uuid`),
  KEY `hl7_in_archive_message_state_idx` (`message_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hl7_in_archive`
--

LOCK TABLES `hl7_in_archive` WRITE;
/*!40000 ALTER TABLE `hl7_in_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `hl7_in_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hl7_in_error`
--

DROP TABLE IF EXISTS `hl7_in_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hl7_in_error` (
  `hl7_in_error_id` int(11) NOT NULL AUTO_INCREMENT,
  `hl7_source` int(11) NOT NULL DEFAULT '0',
  `hl7_source_key` text,
  `hl7_data` text NOT NULL,
  `error` varchar(255) NOT NULL DEFAULT '',
  `error_details` mediumtext,
  `date_created` datetime NOT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`hl7_in_error_id`),
  UNIQUE KEY `hl7_in_error_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hl7_in_error`
--

LOCK TABLES `hl7_in_error` WRITE;
/*!40000 ALTER TABLE `hl7_in_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `hl7_in_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hl7_in_queue`
--

DROP TABLE IF EXISTS `hl7_in_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hl7_in_queue` (
  `hl7_in_queue_id` int(11) NOT NULL AUTO_INCREMENT,
  `hl7_source` int(11) NOT NULL DEFAULT '0',
  `hl7_source_key` text,
  `hl7_data` text NOT NULL,
  `message_state` int(11) NOT NULL DEFAULT '0',
  `date_processed` datetime DEFAULT NULL,
  `error_msg` text,
  `date_created` datetime DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`hl7_in_queue_id`),
  UNIQUE KEY `hl7_in_queue_uuid_index` (`uuid`),
  KEY `hl7_source_with_queue` (`hl7_source`),
  CONSTRAINT `hl7_source_with_queue` FOREIGN KEY (`hl7_source`) REFERENCES `hl7_source` (`hl7_source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hl7_in_queue`
--

LOCK TABLES `hl7_in_queue` WRITE;
/*!40000 ALTER TABLE `hl7_in_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `hl7_in_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hl7_source`
--

DROP TABLE IF EXISTS `hl7_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hl7_source` (
  `hl7_source_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`hl7_source_id`),
  UNIQUE KEY `hl7_source_uuid_index` (`uuid`),
  KEY `user_who_created_hl7_source` (`creator`),
  CONSTRAINT `user_who_created_hl7_source` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hl7_source`
--

LOCK TABLES `hl7_source` WRITE;
/*!40000 ALTER TABLE `hl7_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `hl7_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htmlformentry_html_form`
--

DROP TABLE IF EXISTS `htmlformentry_html_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `htmlformentry_html_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `xml_data` mediumtext NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0002-11-30 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `uuid` char(38) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `htmlformentry_html_form_uuid_index` (`uuid`),
  KEY `User who created htmlformentry_htmlform` (`creator`),
  KEY `Form with which this htmlform is related` (`form_id`),
  KEY `User who changed htmlformentry_htmlform` (`changed_by`),
  KEY `user_who_retired_html_form` (`retired_by`),
  CONSTRAINT `Form with which this htmlform is related` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`),
  CONSTRAINT `User who changed htmlformentry_htmlform` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `User who created htmlformentry_htmlform` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_html_form` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htmlformentry_html_form`
--

LOCK TABLES `htmlformentry_html_form` WRITE;
/*!40000 ALTER TABLE `htmlformentry_html_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `htmlformentry_html_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_auto_generation_option`
--

DROP TABLE IF EXISTS `idgen_auto_generation_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_auto_generation_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier_type` int(11) NOT NULL,
  `source` int(11) NOT NULL,
  `manual_entry_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `automatic_generation_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `location` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `source for idgen_auto_generation_option` (`source`),
  KEY `location_for_auto_generation_option` (`location`),
  KEY `identifier_type for idgen_auto_generation_option` (`identifier_type`),
  CONSTRAINT `identifier_type for idgen_auto_generation_option` FOREIGN KEY (`identifier_type`) REFERENCES `patient_identifier_type` (`patient_identifier_type_id`),
  CONSTRAINT `location_for_auto_generation_option` FOREIGN KEY (`location`) REFERENCES `location` (`location_id`),
  CONSTRAINT `source for idgen_auto_generation_option` FOREIGN KEY (`source`) REFERENCES `idgen_identifier_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_auto_generation_option`
--

LOCK TABLES `idgen_auto_generation_option` WRITE;
/*!40000 ALTER TABLE `idgen_auto_generation_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `idgen_auto_generation_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_id_pool`
--

DROP TABLE IF EXISTS `idgen_id_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_id_pool` (
  `id` int(11) NOT NULL,
  `source` int(11) DEFAULT NULL,
  `batch_size` int(11) DEFAULT NULL,
  `min_pool_size` int(11) DEFAULT NULL,
  `sequential` tinyint(1) NOT NULL DEFAULT '0',
  `refill_with_scheduled_task` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `source for idgen_id_pool` (`source`),
  CONSTRAINT `id for idgen_id_pool` FOREIGN KEY (`id`) REFERENCES `idgen_identifier_source` (`id`),
  CONSTRAINT `source for idgen_id_pool` FOREIGN KEY (`source`) REFERENCES `idgen_identifier_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_id_pool`
--

LOCK TABLES `idgen_id_pool` WRITE;
/*!40000 ALTER TABLE `idgen_id_pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `idgen_id_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_identifier_source`
--

DROP TABLE IF EXISTS `idgen_identifier_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_identifier_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `identifier_type` int(11) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id for idgen_identifier_source` (`id`),
  KEY `identifier_type for idgen_identifier_source` (`identifier_type`),
  KEY `creator for idgen_identifier_source` (`creator`),
  KEY `changed_by for idgen_identifier_source` (`changed_by`),
  KEY `retired_by for idgen_identifier_source` (`retired_by`),
  CONSTRAINT `changed_by for idgen_identifier_source` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `creator for idgen_identifier_source` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `identifier_type for idgen_identifier_source` FOREIGN KEY (`identifier_type`) REFERENCES `patient_identifier_type` (`patient_identifier_type_id`),
  CONSTRAINT `retired_by for idgen_identifier_source` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_identifier_source`
--

LOCK TABLES `idgen_identifier_source` WRITE;
/*!40000 ALTER TABLE `idgen_identifier_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `idgen_identifier_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_log_entry`
--

DROP TABLE IF EXISTS `idgen_log_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_log_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `date_generated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `generated_by` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id for idgen_log` (`id`),
  KEY `source for idgen_log` (`source`),
  KEY `generated_by for idgen_log` (`generated_by`),
  CONSTRAINT `generated_by for idgen_log` FOREIGN KEY (`generated_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `source for idgen_log` FOREIGN KEY (`source`) REFERENCES `idgen_identifier_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_log_entry`
--

LOCK TABLES `idgen_log_entry` WRITE;
/*!40000 ALTER TABLE `idgen_log_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `idgen_log_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_pooled_identifier`
--

DROP TABLE IF EXISTS `idgen_pooled_identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_pooled_identifier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `pool_id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `date_used` datetime DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pool_id for idgen_pooled_identifier` (`pool_id`),
  CONSTRAINT `pool_id for idgen_pooled_identifier` FOREIGN KEY (`pool_id`) REFERENCES `idgen_id_pool` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_pooled_identifier`
--

LOCK TABLES `idgen_pooled_identifier` WRITE;
/*!40000 ALTER TABLE `idgen_pooled_identifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `idgen_pooled_identifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_remote_source`
--

DROP TABLE IF EXISTS `idgen_remote_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_remote_source` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `user` varchar(50) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id for idgen_remote_source` FOREIGN KEY (`id`) REFERENCES `idgen_identifier_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_remote_source`
--

LOCK TABLES `idgen_remote_source` WRITE;
/*!40000 ALTER TABLE `idgen_remote_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `idgen_remote_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_reserved_identifier`
--

DROP TABLE IF EXISTS `idgen_reserved_identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_reserved_identifier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id for idgen_reserved_identifier` (`id`),
  KEY `source for idgen_reserved_identifier` (`source`),
  CONSTRAINT `source for idgen_reserved_identifier` FOREIGN KEY (`source`) REFERENCES `idgen_identifier_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_reserved_identifier`
--

LOCK TABLES `idgen_reserved_identifier` WRITE;
/*!40000 ALTER TABLE `idgen_reserved_identifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `idgen_reserved_identifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_seq_id_gen`
--

DROP TABLE IF EXISTS `idgen_seq_id_gen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_seq_id_gen` (
  `id` int(11) NOT NULL,
  `next_sequence_value` int(11) NOT NULL DEFAULT '-1',
  `base_character_set` varchar(255) NOT NULL,
  `first_identifier_base` varchar(50) NOT NULL,
  `prefix` varchar(20) DEFAULT NULL,
  `suffix` varchar(20) DEFAULT NULL,
  `min_length` int(11) DEFAULT NULL,
  `max_length` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id for idgen_seq_id_gen` FOREIGN KEY (`id`) REFERENCES `idgen_identifier_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_seq_id_gen`
--

LOCK TABLES `idgen_seq_id_gen` WRITE;
/*!40000 ALTER TABLE `idgen_seq_id_gen` DISABLE KEYS */;
/*!40000 ALTER TABLE `idgen_seq_id_gen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_status`
--

DROP TABLE IF EXISTS `import_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_file_name` varchar(500) NOT NULL,
  `saved_file_name` varchar(500) NOT NULL,
  `error_file_name` varchar(500) DEFAULT NULL,
  `type` varchar(25) NOT NULL,
  `status` varchar(25) NOT NULL,
  `successful_records` decimal(6,0) DEFAULT NULL,
  `failed_records` decimal(6,0) DEFAULT NULL,
  `stage_name` varchar(30) DEFAULT NULL,
  `stack_trace` text,
  `uploaded_by` varchar(20) NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_status`
--

LOCK TABLES `import_status` WRITE;
/*!40000 ALTER TABLE `import_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jss_agegroups`
--

DROP TABLE IF EXISTS `jss_agegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jss_agegroups` (
  `jss_agegroup_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) NOT NULL,
  `age_min` int(11) NOT NULL,
  `age_max` int(11) NOT NULL,
  PRIMARY KEY (`jss_agegroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jss_agegroups`
--

LOCK TABLES `jss_agegroups` WRITE;
/*!40000 ALTER TABLE `jss_agegroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `jss_agegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jss_program_village`
--

DROP TABLE IF EXISTS `jss_program_village`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jss_program_village` (
  `jss_program_village_id` int(11) NOT NULL AUTO_INCREMENT,
  `jss_program_village` varchar(50) NOT NULL,
  `city_village` varchar(50) NOT NULL,
  PRIMARY KEY (`jss_program_village_id`),
  UNIQUE KEY `uc_jss_program_village_1` (`jss_program_village`,`city_village`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jss_program_village`
--

LOCK TABLES `jss_program_village` WRITE;
/*!40000 ALTER TABLE `jss_program_village` DISABLE KEYS */;
/*!40000 ALTER TABLE `jss_program_village` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liquibasechangelog`
--

DROP TABLE IF EXISTS `liquibasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liquibasechangelog` (
  `ID` varchar(63) NOT NULL,
  `AUTHOR` varchar(63) NOT NULL,
  `FILENAME` varchar(200) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `EXECTYPE` varchar(20) DEFAULT NULL,
  `ORDEREXECUTED` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`,`AUTHOR`,`FILENAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquibasechangelog`
--

LOCK TABLES `liquibasechangelog` WRITE;
/*!40000 ALTER TABLE `liquibasechangelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `liquibasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liquibasechangeloglock`
--

DROP TABLE IF EXISTS `liquibasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liquibasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` tinyint(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquibasechangeloglock`
--

LOCK TABLES `liquibasechangeloglock` WRITE;
/*!40000 ALTER TABLE `liquibasechangeloglock` DISABLE KEYS */;
/*!40000 ALTER TABLE `liquibasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city_village` varchar(255) DEFAULT NULL,
  `state_province` varchar(255) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `county_district` varchar(255) DEFAULT NULL,
  `address3` varchar(255) DEFAULT NULL,
  `address4` varchar(255) DEFAULT NULL,
  `address5` varchar(255) DEFAULT NULL,
  `address6` varchar(255) DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `parent_location` int(11) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE KEY `location_uuid_index` (`uuid`),
  KEY `name_of_location` (`name`),
  KEY `location_retired_status` (`retired`),
  KEY `user_who_created_location` (`creator`),
  KEY `user_who_retired_location` (`retired_by`),
  KEY `parent_location` (`parent_location`),
  KEY `location_changed_by` (`changed_by`),
  CONSTRAINT `location_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `parent_location` FOREIGN KEY (`parent_location`) REFERENCES `location` (`location_id`),
  CONSTRAINT `user_who_created_location` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_location` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_attribute`
--

DROP TABLE IF EXISTS `location_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_attribute` (
  `location_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `value_reference` text NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`location_attribute_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `location_attribute_location_fk` (`location_id`),
  KEY `location_attribute_attribute_type_id_fk` (`attribute_type_id`),
  KEY `location_attribute_creator_fk` (`creator`),
  KEY `location_attribute_changed_by_fk` (`changed_by`),
  KEY `location_attribute_voided_by_fk` (`voided_by`),
  CONSTRAINT `location_attribute_attribute_type_id_fk` FOREIGN KEY (`attribute_type_id`) REFERENCES `location_attribute_type` (`location_attribute_type_id`),
  CONSTRAINT `location_attribute_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_attribute_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_attribute_location_fk` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `location_attribute_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_attribute`
--

LOCK TABLES `location_attribute` WRITE;
/*!40000 ALTER TABLE `location_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_attribute_type`
--

DROP TABLE IF EXISTS `location_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_attribute_type` (
  `location_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `min_occurs` int(11) NOT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`location_attribute_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `location_attribute_type_unique_name` (`name`),
  KEY `location_attribute_type_creator_fk` (`creator`),
  KEY `location_attribute_type_changed_by_fk` (`changed_by`),
  KEY `location_attribute_type_retired_by_fk` (`retired_by`),
  CONSTRAINT `location_attribute_type_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_attribute_type_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_attribute_type_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_attribute_type`
--

LOCK TABLES `location_attribute_type` WRITE;
/*!40000 ALTER TABLE `location_attribute_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_encounter_type_map`
--

DROP TABLE IF EXISTS `location_encounter_type_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_encounter_type_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `encounter_type_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `date_voided` datetime DEFAULT NULL,
  `voided_by` int(11) DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_encounter_type_map_location_id_fk` (`location_id`),
  KEY `location_encounter_type_map_encounter_type_id_fk` (`encounter_type_id`),
  KEY `location_encounter_type_map_creator_fk` (`creator`),
  KEY `location_encounter_type_map_changed_by_fk` (`changed_by`),
  KEY `location_encounter_type_map_voided_by_fk` (`voided_by`),
  CONSTRAINT `location_encounter_type_map_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_encounter_type_map_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_encounter_type_map_encounter_type_id_fk` FOREIGN KEY (`encounter_type_id`) REFERENCES `encounter_type` (`encounter_type_id`),
  CONSTRAINT `location_encounter_type_map_location_id_fk` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `location_encounter_type_map_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_encounter_type_map`
--

LOCK TABLES `location_encounter_type_map` WRITE;
/*!40000 ALTER TABLE `location_encounter_type_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_encounter_type_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_tag`
--

DROP TABLE IF EXISTS `location_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_tag` (
  `location_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  PRIMARY KEY (`location_tag_id`),
  UNIQUE KEY `location_tag_uuid_index` (`uuid`),
  KEY `location_tag_creator` (`creator`),
  KEY `location_tag_retired_by` (`retired_by`),
  KEY `location_tag_changed_by` (`changed_by`),
  CONSTRAINT `location_tag_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_tag_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_tag_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_tag`
--

LOCK TABLES `location_tag` WRITE;
/*!40000 ALTER TABLE `location_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_tag_map`
--

DROP TABLE IF EXISTS `location_tag_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_tag_map` (
  `location_id` int(11) NOT NULL,
  `location_tag_id` int(11) NOT NULL,
  PRIMARY KEY (`location_id`,`location_tag_id`),
  KEY `location_tag_map_tag` (`location_tag_id`),
  CONSTRAINT `location_tag_map_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `location_tag_map_tag` FOREIGN KEY (`location_tag_id`) REFERENCES `location_tag` (`location_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_tag_map`
--

LOCK TABLES `location_tag_map` WRITE;
/*!40000 ALTER TABLE `location_tag_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_tag_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logic_rule_definition`
--

DROP TABLE IF EXISTS `logic_rule_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logic_rule_definition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `rule_content` varchar(2048) NOT NULL,
  `language` varchar(255) NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0002-11-30 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` smallint(6) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `creator_idx` (`creator`),
  KEY `changed_by_idx` (`changed_by`),
  KEY `retired_by_idx` (`retired_by`),
  CONSTRAINT `changed_by_for_rule_definition` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `creator_for_rule_definition` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `retired_by_for_rule_definition` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logic_rule_definition`
--

LOCK TABLES `logic_rule_definition` WRITE;
/*!40000 ALTER TABLE `logic_rule_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `logic_rule_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logic_rule_token`
--

DROP TABLE IF EXISTS `logic_rule_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logic_rule_token` (
  `logic_rule_token_id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0002-11-30 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `token` varchar(512) NOT NULL,
  `class_name` varchar(512) NOT NULL,
  `state` varchar(512) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`logic_rule_token_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `token_creator` (`creator`),
  KEY `token_changed_by` (`changed_by`),
  CONSTRAINT `token_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `person` (`person_id`),
  CONSTRAINT `token_creator` FOREIGN KEY (`creator`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logic_rule_token`
--

LOCK TABLES `logic_rule_token` WRITE;
/*!40000 ALTER TABLE `logic_rule_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `logic_rule_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logic_rule_token_tag`
--

DROP TABLE IF EXISTS `logic_rule_token_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logic_rule_token_tag` (
  `logic_rule_token_id` int(11) NOT NULL,
  `tag` varchar(512) NOT NULL,
  KEY `token_tag` (`logic_rule_token_id`),
  CONSTRAINT `token_tag` FOREIGN KEY (`logic_rule_token_id`) REFERENCES `logic_rule_token` (`logic_rule_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logic_rule_token_tag`
--

LOCK TABLES `logic_rule_token_tag` WRITE;
/*!40000 ALTER TABLE `logic_rule_token_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `logic_rule_token_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logic_token_registration`
--

DROP TABLE IF EXISTS `logic_token_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logic_token_registration` (
  `token_registration_id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0002-11-30 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `token` varchar(512) NOT NULL,
  `provider_class_name` varchar(512) NOT NULL,
  `provider_token` varchar(512) NOT NULL,
  `configuration` varchar(2000) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`token_registration_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `token_registration_creator` (`creator`),
  KEY `token_registration_changed_by` (`changed_by`),
  CONSTRAINT `token_registration_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `token_registration_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logic_token_registration`
--

LOCK TABLES `logic_token_registration` WRITE;
/*!40000 ALTER TABLE `logic_token_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `logic_token_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logic_token_registration_tag`
--

DROP TABLE IF EXISTS `logic_token_registration_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logic_token_registration_tag` (
  `token_registration_id` int(11) NOT NULL,
  `tag` varchar(512) NOT NULL,
  KEY `token_registration_tag` (`token_registration_id`),
  CONSTRAINT `token_registration_tag` FOREIGN KEY (`token_registration_id`) REFERENCES `logic_token_registration` (`token_registration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logic_token_registration_tag`
--

LOCK TABLES `logic_token_registration_tag` WRITE;
/*!40000 ALTER TABLE `logic_token_registration_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `logic_token_registration_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `markers`
--

DROP TABLE IF EXISTS `markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `markers` (
  `feed_uri` varchar(255) NOT NULL,
  `last_read_entry_id` varchar(255) DEFAULT NULL,
  `feed_uri_for_last_read_entry` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`feed_uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `markers`
--

LOCK TABLES `markers` WRITE;
/*!40000 ALTER TABLE `markers` DISABLE KEYS */;
/*!40000 ALTER TABLE `markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadatasharing_exported_package`
--

DROP TABLE IF EXISTS `metadatasharing_exported_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadatasharing_exported_package` (
  `exported_package_id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `group_uuid` char(38) NOT NULL,
  `version` int(11) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL,
  `content` longblob,
  PRIMARY KEY (`exported_package_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `group_uuid` (`group_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadatasharing_exported_package`
--

LOCK TABLES `metadatasharing_exported_package` WRITE;
/*!40000 ALTER TABLE `metadatasharing_exported_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadatasharing_exported_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadatasharing_imported_item`
--

DROP TABLE IF EXISTS `metadatasharing_imported_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadatasharing_imported_item` (
  `imported_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `classname` varchar(256) NOT NULL,
  `existing_uuid` char(38) DEFAULT NULL,
  `date_imported` datetime DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `import_type` tinyint(4) DEFAULT '0',
  `assessed` tinyint(1) NOT NULL,
  PRIMARY KEY (`imported_item_id`),
  KEY `uuid` (`uuid`),
  KEY `existing_uuid` (`existing_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadatasharing_imported_item`
--

LOCK TABLES `metadatasharing_imported_item` WRITE;
/*!40000 ALTER TABLE `metadatasharing_imported_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadatasharing_imported_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadatasharing_imported_package`
--

DROP TABLE IF EXISTS `metadatasharing_imported_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadatasharing_imported_package` (
  `imported_package_id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `group_uuid` char(38) NOT NULL,
  `subscription_url` varchar(512) DEFAULT NULL,
  `subscription_status` tinyint(4) DEFAULT '0',
  `date_created` datetime NOT NULL,
  `date_imported` datetime DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `import_config` varchar(1024) DEFAULT NULL,
  `remote_version` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`imported_package_id`),
  KEY `uuid` (`uuid`),
  KEY `group_uuid` (`group_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadatasharing_imported_package`
--

LOCK TABLES `metadatasharing_imported_package` WRITE;
/*!40000 ALTER TABLE `metadatasharing_imported_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadatasharing_imported_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `note_id` int(11) NOT NULL DEFAULT '0',
  `note_type` varchar(50) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `obs_id` int(11) DEFAULT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  `text` text NOT NULL,
  `priority` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  UNIQUE KEY `note_uuid_index` (`uuid`),
  KEY `user_who_changed_note` (`changed_by`),
  KEY `user_who_created_note` (`creator`),
  KEY `encounter_note` (`encounter_id`),
  KEY `obs_note` (`obs_id`),
  KEY `note_hierarchy` (`parent`),
  KEY `patient_note` (`patient_id`),
  CONSTRAINT `encounter_note` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `note_hierarchy` FOREIGN KEY (`parent`) REFERENCES `note` (`note_id`),
  CONSTRAINT `obs_note` FOREIGN KEY (`obs_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `patient_note` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `user_who_changed_note` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_note` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_alert`
--

DROP TABLE IF EXISTS `notification_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_alert` (
  `alert_id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(512) NOT NULL,
  `satisfied_by_any` tinyint(1) NOT NULL DEFAULT '0',
  `alert_read` tinyint(1) NOT NULL DEFAULT '0',
  `date_to_expire` datetime DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`alert_id`),
  UNIQUE KEY `notification_alert_uuid_index` (`uuid`),
  KEY `alert_date_to_expire_idx` (`date_to_expire`),
  KEY `user_who_changed_alert` (`changed_by`),
  KEY `alert_creator` (`creator`),
  CONSTRAINT `alert_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_changed_alert` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_alert`
--

LOCK TABLES `notification_alert` WRITE;
/*!40000 ALTER TABLE `notification_alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_alert_recipient`
--

DROP TABLE IF EXISTS `notification_alert_recipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_alert_recipient` (
  `alert_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `alert_read` tinyint(1) NOT NULL DEFAULT '0',
  `date_changed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`alert_id`,`user_id`),
  KEY `alert_read_by_user` (`user_id`),
  CONSTRAINT `alert_read_by_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `id_of_alert` FOREIGN KEY (`alert_id`) REFERENCES `notification_alert` (`alert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_alert_recipient`
--

LOCK TABLES `notification_alert_recipient` WRITE;
/*!40000 ALTER TABLE `notification_alert_recipient` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_alert_recipient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_template`
--

DROP TABLE IF EXISTS `notification_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_template` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `template` text,
  `subject` varchar(100) DEFAULT NULL,
  `sender` varchar(255) DEFAULT NULL,
  `recipients` varchar(512) DEFAULT NULL,
  `ordinal` int(11) DEFAULT '0',
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `notification_template_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_template`
--

LOCK TABLES `notification_template` WRITE;
/*!40000 ALTER TABLE `notification_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obs`
--

DROP TABLE IF EXISTS `obs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obs` (
  `obs_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `encounter_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `obs_datetime` datetime NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `obs_group_id` int(11) DEFAULT NULL,
  `accession_number` varchar(255) DEFAULT NULL,
  `value_group_id` int(11) DEFAULT NULL,
  `value_boolean` tinyint(1) DEFAULT NULL,
  `value_coded` int(11) DEFAULT NULL,
  `value_coded_name_id` int(11) DEFAULT NULL,
  `value_drug` int(11) DEFAULT NULL,
  `value_datetime` datetime DEFAULT NULL,
  `value_numeric` double DEFAULT NULL,
  `value_modifier` varchar(2) DEFAULT NULL,
  `value_text` text,
  `value_complex` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `previous_version` int(11) DEFAULT NULL,
  `form_namespace_and_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`obs_id`),
  UNIQUE KEY `obs_uuid_index` (`uuid`),
  KEY `obs_datetime_idx` (`obs_datetime`),
  KEY `obs_concept` (`concept_id`),
  KEY `obs_enterer` (`creator`),
  KEY `encounter_observations` (`encounter_id`),
  KEY `obs_location` (`location_id`),
  KEY `obs_grouping_id` (`obs_group_id`),
  KEY `obs_order` (`order_id`),
  KEY `person_obs` (`person_id`),
  KEY `answer_concept` (`value_coded`),
  KEY `obs_name_of_coded_value` (`value_coded_name_id`),
  KEY `answer_concept_drug` (`value_drug`),
  KEY `user_who_voided_obs` (`voided_by`),
  KEY `previous_version` (`previous_version`),
  CONSTRAINT `answer_concept` FOREIGN KEY (`value_coded`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `answer_concept_drug` FOREIGN KEY (`value_drug`) REFERENCES `drug` (`drug_id`),
  CONSTRAINT `encounter_observations` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `obs_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `obs_enterer` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `obs_grouping_id` FOREIGN KEY (`obs_group_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `obs_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `obs_name_of_coded_value` FOREIGN KEY (`value_coded_name_id`) REFERENCES `concept_name` (`concept_name_id`),
  CONSTRAINT `obs_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `person_obs` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `previous_version` FOREIGN KEY (`previous_version`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `user_who_voided_obs` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obs`
--

LOCK TABLES `obs` WRITE;
/*!40000 ALTER TABLE `obs` DISABLE KEYS */;
/*!40000 ALTER TABLE `obs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obs_relationship`
--

DROP TABLE IF EXISTS `obs_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obs_relationship` (
  `obs_relationship_id` int(11) NOT NULL AUTO_INCREMENT,
  `obs_relationship_type_id` int(11) NOT NULL,
  `source_obs_id` int(11) NOT NULL,
  `target_obs_id` int(11) NOT NULL,
  `uuid` char(38) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` int(11) NOT NULL,
  PRIMARY KEY (`obs_relationship_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `obs_relationship_type_id` (`obs_relationship_type_id`),
  KEY `source_obs_id` (`source_obs_id`),
  KEY `target_obs_id` (`target_obs_id`),
  KEY `creator` (`creator`),
  CONSTRAINT `obs_relationship_ibfk_1` FOREIGN KEY (`obs_relationship_type_id`) REFERENCES `obs_relationship_type` (`obs_relationship_type_id`),
  CONSTRAINT `obs_relationship_ibfk_2` FOREIGN KEY (`source_obs_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `obs_relationship_ibfk_3` FOREIGN KEY (`target_obs_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `obs_relationship_ibfk_4` FOREIGN KEY (`creator`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obs_relationship`
--

LOCK TABLES `obs_relationship` WRITE;
/*!40000 ALTER TABLE `obs_relationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `obs_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obs_relationship_type`
--

DROP TABLE IF EXISTS `obs_relationship_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obs_relationship_type` (
  `obs_relationship_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `retired` tinyint(4) NOT NULL DEFAULT '0',
  `date_retired` datetime DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`obs_relationship_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `creator` (`creator`),
  KEY `changed_by` (`changed_by`),
  KEY `retired_by` (`retired_by`),
  CONSTRAINT `obs_relationship_type_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `obs_relationship_type_ibfk_2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `obs_relationship_type_ibfk_3` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obs_relationship_type`
--

LOCK TABLES `obs_relationship_type` WRITE;
/*!40000 ALTER TABLE `obs_relationship_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `obs_relationship_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_frequency`
--

DROP TABLE IF EXISTS `order_frequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_frequency` (
  `order_frequency_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL,
  `frequency_per_day` double DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`order_frequency_id`),
  UNIQUE KEY `concept_id` (`concept_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `order_frequency_creator_fk` (`creator`),
  KEY `order_frequency_retired_by_fk` (`retired_by`),
  KEY `order_frequency_changed_by_fk` (`changed_by`),
  CONSTRAINT `order_frequency_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_frequency_concept_id_fk` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `order_frequency_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_frequency_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_frequency`
--

LOCK TABLES `order_frequency` WRITE;
/*!40000 ALTER TABLE `order_frequency` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_frequency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_type`
--

DROP TABLE IF EXISTS `order_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_type` (
  `order_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `java_class_name` varchar(255) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  PRIMARY KEY (`order_type_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `order_type_uuid_index` (`uuid`),
  KEY `order_type_retired_status` (`retired`),
  KEY `type_created_by` (`creator`),
  KEY `user_who_retired_order_type` (`retired_by`),
  KEY `order_type_changed_by` (`changed_by`),
  KEY `order_type_parent` (`parent`),
  CONSTRAINT `order_type_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_type_parent_order_type` FOREIGN KEY (`parent`) REFERENCES `order_type` (`order_type_id`),
  CONSTRAINT `type_created_by` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_order_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_type`
--

LOCK TABLES `order_type` WRITE;
/*!40000 ALTER TABLE `order_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_type_class_map`
--

DROP TABLE IF EXISTS `order_type_class_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_type_class_map` (
  `order_type_id` int(11) NOT NULL,
  `concept_class_id` int(11) NOT NULL,
  PRIMARY KEY (`order_type_id`,`concept_class_id`),
  UNIQUE KEY `concept_class_id` (`concept_class_id`),
  CONSTRAINT `fk_order_type_class_map_concept_class_concept_class_id` FOREIGN KEY (`concept_class_id`) REFERENCES `concept_class` (`concept_class_id`),
  CONSTRAINT `fk_order_type_order_type_id` FOREIGN KEY (`order_type_id`) REFERENCES `order_type` (`order_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_type_class_map`
--

LOCK TABLES `order_type_class_map` WRITE;
/*!40000 ALTER TABLE `order_type_class_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_type_class_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_type_id` int(11) DEFAULT NULL,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `orderer` int(11) NOT NULL,
  `encounter_id` int(11) NOT NULL,
  `instructions` text,
  `date_activated` datetime DEFAULT NULL,
  `auto_expire_date` datetime DEFAULT NULL,
  `date_stopped` datetime DEFAULT NULL,
  `order_reason` int(11) DEFAULT NULL,
  `order_reason_non_coded` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `accession_number` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `urgency` varchar(50) NOT NULL DEFAULT 'ROUTINE',
  `order_number` varchar(50) NOT NULL,
  `previous_order_id` int(11) DEFAULT NULL,
  `order_action` varchar(50) NOT NULL,
  `comment_to_fulfiller` varchar(1024) DEFAULT NULL,
  `care_setting` int(11) NOT NULL,
  `scheduled_date` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `orders_uuid_index` (`uuid`),
  KEY `order_creator` (`creator`),
  KEY `orders_in_encounter` (`encounter_id`),
  KEY `type_of_order` (`order_type_id`),
  KEY `order_for_patient` (`patient_id`),
  KEY `user_who_voided_order` (`voided_by`),
  KEY `previous_order_id_order_id` (`previous_order_id`),
  KEY `orders_care_setting` (`care_setting`),
  KEY `discontinued_because` (`order_reason`),
  KEY `fk_orderer_provider` (`orderer`),
  KEY `bahmni_orders_date_activated` (`date_activated`),
  CONSTRAINT `discontinued_because` FOREIGN KEY (`order_reason`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `fk_orderer_provider` FOREIGN KEY (`orderer`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `order_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_for_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `orders_care_setting` FOREIGN KEY (`care_setting`) REFERENCES `care_setting` (`care_setting_id`),
  CONSTRAINT `orders_in_encounter` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `previous_order_id_order_id` FOREIGN KEY (`previous_order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `type_of_order` FOREIGN KEY (`order_type_id`) REFERENCES `order_type` (`order_type_id`),
  CONSTRAINT `user_who_voided_order` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `user_who_changed_pat` (`changed_by`),
  KEY `user_who_created_patient` (`creator`),
  KEY `user_who_voided_patient` (`voided_by`),
  CONSTRAINT `person_id_for_patient` FOREIGN KEY (`patient_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `user_who_changed_pat` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_patient` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_patient` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_identifier`
--

DROP TABLE IF EXISTS `patient_identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_identifier` (
  `patient_identifier_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `identifier` varchar(50) NOT NULL DEFAULT '',
  `identifier_type` int(11) NOT NULL DEFAULT '0',
  `preferred` tinyint(1) NOT NULL DEFAULT '0',
  `location_id` int(11) DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`patient_identifier_id`),
  UNIQUE KEY `unique_patient_identifier` (`identifier`),
  UNIQUE KEY `patient_identifier_uuid_index` (`uuid`),
  KEY `identifier_name` (`identifier`),
  KEY `idx_patient_identifier_patient` (`patient_id`),
  KEY `identifier_creator` (`creator`),
  KEY `defines_identifier_type` (`identifier_type`),
  KEY `patient_identifier_ibfk_2` (`location_id`),
  KEY `identifier_voider` (`voided_by`),
  KEY `patient_identifier_changed_by` (`changed_by`),
  CONSTRAINT `defines_identifier_type` FOREIGN KEY (`identifier_type`) REFERENCES `patient_identifier_type` (`patient_identifier_type_id`),
  CONSTRAINT `identifier_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `identifier_voider` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_identifier_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_identifier_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_identifier`
--

LOCK TABLES `patient_identifier` WRITE;
/*!40000 ALTER TABLE `patient_identifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_identifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_identifier_type`
--

DROP TABLE IF EXISTS `patient_identifier_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_identifier_type` (
  `patient_identifier_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `format` varchar(255) DEFAULT NULL,
  `check_digit` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `format_description` varchar(255) DEFAULT NULL,
  `validator` varchar(200) DEFAULT NULL,
  `location_behavior` varchar(50) DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `uniqueness_behavior` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`patient_identifier_type_id`),
  UNIQUE KEY `patient_identifier_type_uuid_index` (`uuid`),
  KEY `patient_identifier_type_retired_status` (`retired`),
  KEY `type_creator` (`creator`),
  KEY `user_who_retired_patient_identifier_type` (`retired_by`),
  CONSTRAINT `type_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_patient_identifier_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_identifier_type`
--

LOCK TABLES `patient_identifier_type` WRITE;
/*!40000 ALTER TABLE `patient_identifier_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_identifier_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_program`
--

DROP TABLE IF EXISTS `patient_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_program` (
  `patient_program_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `program_id` int(11) NOT NULL DEFAULT '0',
  `date_enrolled` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `outcome_concept_id` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`patient_program_id`),
  UNIQUE KEY `patient_program_uuid_index` (`uuid`),
  KEY `user_who_changed` (`changed_by`),
  KEY `patient_program_creator` (`creator`),
  KEY `patient_in_program` (`patient_id`),
  KEY `program_for_patient` (`program_id`),
  KEY `user_who_voided_patient_program` (`voided_by`),
  KEY `patient_program_location_id` (`location_id`),
  KEY `patient_program_outcome_concept_id_fk` (`outcome_concept_id`),
  CONSTRAINT `patient_in_program` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `patient_program_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_program_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `patient_program_outcome_concept_id_fk` FOREIGN KEY (`outcome_concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `program_for_patient` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`),
  CONSTRAINT `user_who_changed` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_patient_program` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_program`
--

LOCK TABLES `patient_program` WRITE;
/*!40000 ALTER TABLE `patient_program` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_state`
--

DROP TABLE IF EXISTS `patient_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_state` (
  `patient_state_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_program_id` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`patient_state_id`),
  UNIQUE KEY `patient_state_uuid_index` (`uuid`),
  KEY `patient_state_changer` (`changed_by`),
  KEY `patient_state_creator` (`creator`),
  KEY `patient_program_for_state` (`patient_program_id`),
  KEY `state_for_patient` (`state`),
  KEY `patient_state_voider` (`voided_by`),
  CONSTRAINT `patient_program_for_state` FOREIGN KEY (`patient_program_id`) REFERENCES `patient_program` (`patient_program_id`),
  CONSTRAINT `patient_state_changer` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_state_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_state_voider` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `state_for_patient` FOREIGN KEY (`state`) REFERENCES `program_workflow_state` (`program_workflow_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_state`
--

LOCK TABLES `patient_state` WRITE;
/*!40000 ALTER TABLE `patient_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` varchar(50) DEFAULT '',
  `birthdate` date DEFAULT NULL,
  `birthdate_estimated` tinyint(1) NOT NULL DEFAULT '0',
  `dead` tinyint(1) NOT NULL DEFAULT '0',
  `death_date` datetime DEFAULT NULL,
  `cause_of_death` int(11) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `deathdate_estimated` tinyint(1) NOT NULL DEFAULT '0',
  `birthtime` time DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  UNIQUE KEY `person_uuid_index` (`uuid`),
  KEY `person_birthdate` (`birthdate`),
  KEY `person_death_date` (`death_date`),
  KEY `person_died_because` (`cause_of_death`),
  KEY `user_who_changed_person` (`changed_by`),
  KEY `user_who_created_person` (`creator`),
  KEY `user_who_voided_person` (`voided_by`),
  CONSTRAINT `person_died_because` FOREIGN KEY (`cause_of_death`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_changed_person` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_person` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_person` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_address`
--

DROP TABLE IF EXISTS `person_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_address` (
  `person_address_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `preferred` tinyint(1) NOT NULL DEFAULT '0',
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city_village` varchar(255) DEFAULT NULL,
  `state_province` varchar(255) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `county_district` varchar(255) DEFAULT NULL,
  `address3` varchar(255) DEFAULT NULL,
  `address4` varchar(255) DEFAULT NULL,
  `address5` varchar(255) DEFAULT NULL,
  `address6` varchar(255) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`person_address_id`),
  UNIQUE KEY `person_address_uuid_index` (`uuid`),
  KEY `patient_address_creator` (`creator`),
  KEY `address_for_person` (`person_id`),
  KEY `patient_address_void` (`voided_by`),
  KEY `person_address_changed_by` (`changed_by`),
  KEY `person_address_city_village` (`city_village`),
  CONSTRAINT `address_for_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `patient_address_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_address_void` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `person_address_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_address`
--

LOCK TABLES `person_address` WRITE;
/*!40000 ALTER TABLE `person_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_attribute`
--

DROP TABLE IF EXISTS `person_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_attribute` (
  `person_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(50) NOT NULL DEFAULT '',
  `person_attribute_type_id` int(11) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`person_attribute_id`),
  UNIQUE KEY `person_attribute_uuid_index` (`uuid`),
  KEY `attribute_changer` (`changed_by`),
  KEY `attribute_creator` (`creator`),
  KEY `defines_attribute_type` (`person_attribute_type_id`),
  KEY `identifies_person` (`person_id`),
  KEY `attribute_voider` (`voided_by`),
  CONSTRAINT `attribute_changer` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `attribute_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `attribute_voider` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `defines_attribute_type` FOREIGN KEY (`person_attribute_type_id`) REFERENCES `person_attribute_type` (`person_attribute_type_id`),
  CONSTRAINT `identifies_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_attribute`
--

LOCK TABLES `person_attribute` WRITE;
/*!40000 ALTER TABLE `person_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_attribute_type`
--

DROP TABLE IF EXISTS `person_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_attribute_type` (
  `person_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `format` varchar(50) DEFAULT NULL,
  `foreign_key` int(11) DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `edit_privilege` varchar(255) DEFAULT NULL,
  `sort_weight` double DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`person_attribute_type_id`),
  UNIQUE KEY `person_attribute_type_uuid_index` (`uuid`),
  KEY `attribute_is_searchable` (`searchable`),
  KEY `name_of_attribute` (`name`),
  KEY `person_attribute_type_retired_status` (`retired`),
  KEY `attribute_type_changer` (`changed_by`),
  KEY `attribute_type_creator` (`creator`),
  KEY `user_who_retired_person_attribute_type` (`retired_by`),
  KEY `privilege_which_can_edit` (`edit_privilege`),
  CONSTRAINT `attribute_type_changer` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `attribute_type_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `privilege_which_can_edit` FOREIGN KEY (`edit_privilege`) REFERENCES `privilege` (`privilege`),
  CONSTRAINT `user_who_retired_person_attribute_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_attribute_type`
--

LOCK TABLES `person_attribute_type` WRITE;
/*!40000 ALTER TABLE `person_attribute_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_merge_log`
--

DROP TABLE IF EXISTS `person_merge_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_merge_log` (
  `person_merge_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `winner_person_id` int(11) NOT NULL,
  `loser_person_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `merged_data` longtext NOT NULL,
  `uuid` char(38) NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`person_merge_log_id`),
  UNIQUE KEY `person_merge_log_unique_uuid` (`uuid`),
  KEY `person_merge_log_winner` (`winner_person_id`),
  KEY `person_merge_log_loser` (`loser_person_id`),
  KEY `person_merge_log_creator` (`creator`),
  KEY `person_merge_log_changed_by_fk` (`changed_by`),
  KEY `person_merge_log_voided_by_fk` (`voided_by`),
  CONSTRAINT `person_merge_log_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `person_merge_log_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `person_merge_log_loser` FOREIGN KEY (`loser_person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `person_merge_log_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `person_merge_log_winner` FOREIGN KEY (`winner_person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_merge_log`
--

LOCK TABLES `person_merge_log` WRITE;
/*!40000 ALTER TABLE `person_merge_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_merge_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_name`
--

DROP TABLE IF EXISTS `person_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_name` (
  `person_name_id` int(11) NOT NULL AUTO_INCREMENT,
  `preferred` tinyint(1) NOT NULL DEFAULT '0',
  `person_id` int(11) NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `given_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `family_name_prefix` varchar(50) DEFAULT NULL,
  `family_name` varchar(50) DEFAULT NULL,
  `family_name2` varchar(50) DEFAULT NULL,
  `family_name_suffix` varchar(50) DEFAULT NULL,
  `degree` varchar(50) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`person_name_id`),
  UNIQUE KEY `person_name_uuid_index` (`uuid`),
  KEY `first_name` (`given_name`),
  KEY `last_name` (`family_name`),
  KEY `middle_name` (`middle_name`),
  KEY `family_name2` (`family_name2`),
  KEY `user_who_made_name` (`creator`),
  KEY `name_for_person` (`person_id`),
  KEY `user_who_voided_name` (`voided_by`),
  CONSTRAINT `name_for_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `user_who_made_name` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_name` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_name`
--

LOCK TABLES `person_name` WRITE;
/*!40000 ALTER TABLE `person_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilege` (
  `privilege` varchar(255) NOT NULL,
  `description` text,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`privilege`),
  UNIQUE KEY `privilege_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program` (
  `program_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `outcomes_concept_id` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `description` text,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`program_id`),
  UNIQUE KEY `program_uuid_index` (`uuid`),
  KEY `user_who_changed_program` (`changed_by`),
  KEY `program_concept` (`concept_id`),
  KEY `program_creator` (`creator`),
  KEY `program_outcomes_concept_id_fk` (`outcomes_concept_id`),
  CONSTRAINT `program_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `program_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `program_outcomes_concept_id_fk` FOREIGN KEY (`outcomes_concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_changed_program` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_workflow`
--

DROP TABLE IF EXISTS `program_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_workflow` (
  `program_workflow_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL DEFAULT '0',
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`program_workflow_id`),
  UNIQUE KEY `program_workflow_uuid_index` (`uuid`),
  KEY `workflow_changed_by` (`changed_by`),
  KEY `workflow_concept` (`concept_id`),
  KEY `workflow_creator` (`creator`),
  KEY `program_for_workflow` (`program_id`),
  CONSTRAINT `program_for_workflow` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`),
  CONSTRAINT `workflow_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `workflow_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `workflow_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_workflow`
--

LOCK TABLES `program_workflow` WRITE;
/*!40000 ALTER TABLE `program_workflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `program_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_workflow_state`
--

DROP TABLE IF EXISTS `program_workflow_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_workflow_state` (
  `program_workflow_state_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_workflow_id` int(11) NOT NULL DEFAULT '0',
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `initial` tinyint(1) NOT NULL DEFAULT '0',
  `terminal` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`program_workflow_state_id`),
  UNIQUE KEY `program_workflow_state_uuid_index` (`uuid`),
  KEY `state_changed_by` (`changed_by`),
  KEY `state_concept` (`concept_id`),
  KEY `state_creator` (`creator`),
  KEY `workflow_for_state` (`program_workflow_id`),
  CONSTRAINT `state_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `state_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `state_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `workflow_for_state` FOREIGN KEY (`program_workflow_id`) REFERENCES `program_workflow` (`program_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_workflow_state`
--

LOCK TABLES `program_workflow_state` WRITE;
/*!40000 ALTER TABLE `program_workflow_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `program_workflow_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider` (
  `provider_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `provider_role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`provider_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `provider_changed_by_fk` (`changed_by`),
  KEY `provider_person_id_fk` (`person_id`),
  KEY `provider_retired_by_fk` (`retired_by`),
  KEY `provider_creator_fk` (`creator`),
  KEY `provider_role_id` (`provider_role_id`),
  CONSTRAINT `provider_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_ibfk_1` FOREIGN KEY (`provider_role_id`) REFERENCES `providermanagement_provider_role` (`provider_role_id`),
  CONSTRAINT `provider_person_id_fk` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `provider_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_attribute`
--

DROP TABLE IF EXISTS `provider_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_attribute` (
  `provider_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `value_reference` text NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`provider_attribute_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `provider_attribute_provider_fk` (`provider_id`),
  KEY `provider_attribute_attribute_type_id_fk` (`attribute_type_id`),
  KEY `provider_attribute_creator_fk` (`creator`),
  KEY `provider_attribute_changed_by_fk` (`changed_by`),
  KEY `provider_attribute_voided_by_fk` (`voided_by`),
  CONSTRAINT `provider_attribute_attribute_type_id_fk` FOREIGN KEY (`attribute_type_id`) REFERENCES `provider_attribute_type` (`provider_attribute_type_id`),
  CONSTRAINT `provider_attribute_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_attribute_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_attribute_provider_fk` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `provider_attribute_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_attribute`
--

LOCK TABLES `provider_attribute` WRITE;
/*!40000 ALTER TABLE `provider_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `provider_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_attribute_type`
--

DROP TABLE IF EXISTS `provider_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_attribute_type` (
  `provider_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `min_occurs` int(11) NOT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`provider_attribute_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `provider_attribute_type_creator_fk` (`creator`),
  KEY `provider_attribute_type_changed_by_fk` (`changed_by`),
  KEY `provider_attribute_type_retired_by_fk` (`retired_by`),
  CONSTRAINT `provider_attribute_type_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_attribute_type_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_attribute_type_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_attribute_type`
--

LOCK TABLES `provider_attribute_type` WRITE;
/*!40000 ALTER TABLE `provider_attribute_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `provider_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providermanagement_provider_role`
--

DROP TABLE IF EXISTS `providermanagement_provider_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providermanagement_provider_role` (
  `provider_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`provider_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providermanagement_provider_role`
--

LOCK TABLES `providermanagement_provider_role` WRITE;
/*!40000 ALTER TABLE `providermanagement_provider_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `providermanagement_provider_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providermanagement_provider_role_provider_attribute_type`
--

DROP TABLE IF EXISTS `providermanagement_provider_role_provider_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providermanagement_provider_role_provider_attribute_type` (
  `provider_role_id` int(11) NOT NULL,
  `provider_attribute_type_id` int(11) NOT NULL,
  KEY `provider_role_id` (`provider_role_id`),
  KEY `provider_attribute_type_id` (`provider_attribute_type_id`),
  CONSTRAINT `providermanagement_prpat_provider_attribute_type_fk` FOREIGN KEY (`provider_attribute_type_id`) REFERENCES `provider_attribute_type` (`provider_attribute_type_id`),
  CONSTRAINT `providermanagement_prpat_provider_role_fk` FOREIGN KEY (`provider_role_id`) REFERENCES `providermanagement_provider_role` (`provider_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providermanagement_provider_role_provider_attribute_type`
--

LOCK TABLES `providermanagement_provider_role_provider_attribute_type` WRITE;
/*!40000 ALTER TABLE `providermanagement_provider_role_provider_attribute_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `providermanagement_provider_role_provider_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providermanagement_provider_role_relationship_type`
--

DROP TABLE IF EXISTS `providermanagement_provider_role_relationship_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providermanagement_provider_role_relationship_type` (
  `provider_role_id` int(11) NOT NULL,
  `relationship_type_id` int(11) NOT NULL,
  KEY `provider_role_id` (`provider_role_id`),
  KEY `relationship_type_id` (`relationship_type_id`),
  CONSTRAINT `providermanagement_provider_role_relationship_type_ibfk_1` FOREIGN KEY (`provider_role_id`) REFERENCES `providermanagement_provider_role` (`provider_role_id`),
  CONSTRAINT `providermanagement_provider_role_relationship_type_ibfk_2` FOREIGN KEY (`relationship_type_id`) REFERENCES `relationship_type` (`relationship_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providermanagement_provider_role_relationship_type`
--

LOCK TABLES `providermanagement_provider_role_relationship_type` WRITE;
/*!40000 ALTER TABLE `providermanagement_provider_role_relationship_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `providermanagement_provider_role_relationship_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providermanagement_provider_role_supervisee_provider_role`
--

DROP TABLE IF EXISTS `providermanagement_provider_role_supervisee_provider_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providermanagement_provider_role_supervisee_provider_role` (
  `provider_role_id` int(11) NOT NULL,
  `supervisee_provider_role_id` int(11) NOT NULL,
  KEY `provider_role_id` (`provider_role_id`),
  KEY `supervisee_provider_role_id` (`supervisee_provider_role_id`),
  CONSTRAINT `providermanagement_prspr_provider_role_fk` FOREIGN KEY (`provider_role_id`) REFERENCES `providermanagement_provider_role` (`provider_role_id`),
  CONSTRAINT `providermanagement_prspr_supervisee_role_fk` FOREIGN KEY (`supervisee_provider_role_id`) REFERENCES `providermanagement_provider_role` (`provider_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providermanagement_provider_role_supervisee_provider_role`
--

LOCK TABLES `providermanagement_provider_role_supervisee_provider_role` WRITE;
/*!40000 ALTER TABLE `providermanagement_provider_role_supervisee_provider_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `providermanagement_provider_role_supervisee_provider_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providermanagement_provider_suggestion`
--

DROP TABLE IF EXISTS `providermanagement_provider_suggestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providermanagement_provider_suggestion` (
  `provider_suggestion_id` int(11) NOT NULL AUTO_INCREMENT,
  `criteria` varchar(5000) NOT NULL,
  `evaluator` varchar(255) NOT NULL,
  `relationship_type_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`provider_suggestion_id`),
  KEY `relationship_type_id` (`relationship_type_id`),
  CONSTRAINT `providermanagement_provider_suggestion_ibfk_1` FOREIGN KEY (`relationship_type_id`) REFERENCES `relationship_type` (`relationship_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providermanagement_provider_suggestion`
--

LOCK TABLES `providermanagement_provider_suggestion` WRITE;
/*!40000 ALTER TABLE `providermanagement_provider_suggestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `providermanagement_provider_suggestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providermanagement_supervision_suggestion`
--

DROP TABLE IF EXISTS `providermanagement_supervision_suggestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providermanagement_supervision_suggestion` (
  `supervision_suggestion_id` int(11) NOT NULL AUTO_INCREMENT,
  `criteria` varchar(5000) NOT NULL,
  `evaluator` varchar(255) NOT NULL,
  `provider_role_id` int(11) NOT NULL,
  `suggestion_type` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`supervision_suggestion_id`),
  KEY `provider_role_id` (`provider_role_id`),
  CONSTRAINT `providermanagement_supervision_suggestion_ibfk_1` FOREIGN KEY (`provider_role_id`) REFERENCES `providermanagement_provider_role` (`provider_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providermanagement_supervision_suggestion`
--

LOCK TABLES `providermanagement_supervision_suggestion` WRITE;
/*!40000 ALTER TABLE `providermanagement_supervision_suggestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `providermanagement_supervision_suggestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `random_names`
--

DROP TABLE IF EXISTS `random_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `random_names` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`rid`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `random_names`
--

LOCK TABLES `random_names` WRITE;
/*!40000 ALTER TABLE `random_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `random_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationship`
--

DROP TABLE IF EXISTS `relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationship` (
  `relationship_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_a` int(11) NOT NULL,
  `relationship` int(11) NOT NULL DEFAULT '0',
  `person_b` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`relationship_id`),
  UNIQUE KEY `relationship_uuid_index` (`uuid`),
  KEY `relation_creator` (`creator`),
  KEY `person_a_is_person` (`person_a`),
  KEY `person_b_is_person` (`person_b`),
  KEY `relationship_type_id` (`relationship`),
  KEY `relation_voider` (`voided_by`),
  KEY `relationship_changed_by` (`changed_by`),
  CONSTRAINT `person_a_is_person` FOREIGN KEY (`person_a`) REFERENCES `person` (`person_id`),
  CONSTRAINT `person_b_is_person` FOREIGN KEY (`person_b`) REFERENCES `person` (`person_id`),
  CONSTRAINT `relation_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `relation_voider` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `relationship_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `relationship_type_id` FOREIGN KEY (`relationship`) REFERENCES `relationship_type` (`relationship_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationship`
--

LOCK TABLES `relationship` WRITE;
/*!40000 ALTER TABLE `relationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationship_type`
--

DROP TABLE IF EXISTS `relationship_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationship_type` (
  `relationship_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_is_to_b` varchar(50) NOT NULL,
  `b_is_to_a` varchar(50) NOT NULL,
  `preferred` tinyint(1) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`relationship_type_id`),
  UNIQUE KEY `relationship_type_uuid_index` (`uuid`),
  KEY `user_who_created_rel` (`creator`),
  KEY `user_who_retired_relationship_type` (`retired_by`),
  CONSTRAINT `user_who_created_rel` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_relationship_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationship_type`
--

LOCK TABLES `relationship_type` WRITE;
/*!40000 ALTER TABLE `relationship_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `relationship_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_object`
--

DROP TABLE IF EXISTS `report_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_object` (
  `report_object_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `report_object_type` varchar(255) NOT NULL,
  `report_object_sub_type` varchar(255) NOT NULL,
  `xml_data` text,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`report_object_id`),
  UNIQUE KEY `report_object_uuid_index` (`uuid`),
  KEY `user_who_changed_report_object` (`changed_by`),
  KEY `report_object_creator` (`creator`),
  KEY `user_who_voided_report_object` (`voided_by`),
  CONSTRAINT `report_object_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_changed_report_object` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_report_object` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_object`
--

LOCK TABLES `report_object` WRITE;
/*!40000 ALTER TABLE `report_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_schema_xml`
--

DROP TABLE IF EXISTS `report_schema_xml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_schema_xml` (
  `report_schema_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `xml_data` text NOT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`report_schema_id`),
  UNIQUE KEY `report_schema_xml_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_schema_xml`
--

LOCK TABLES `report_schema_xml` WRITE;
/*!40000 ALTER TABLE `report_schema_xml` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_schema_xml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_age_group`
--

DROP TABLE IF EXISTS `reporting_age_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_age_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `report_group_name` varchar(255) NOT NULL,
  `min_years` int(11) NOT NULL DEFAULT '0',
  `min_days` int(11) NOT NULL DEFAULT '0',
  `max_years` int(11) NOT NULL DEFAULT '0',
  `max_days` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_age_group`
--

LOCK TABLES `reporting_age_group` WRITE;
/*!40000 ALTER TABLE `reporting_age_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_age_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_report_design`
--

DROP TABLE IF EXISTS `reporting_report_design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_report_design` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `renderer_type` varchar(255) NOT NULL,
  `properties` text,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `report_definition_uuid` char(38) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `creator for reporting_report_design` (`creator`),
  KEY `changed_by for reporting_report_design` (`changed_by`),
  KEY `retired_by for reporting_report_design` (`retired_by`),
  KEY `report_definition_uuid for reporting_report_design` (`report_definition_uuid`),
  CONSTRAINT `changed_by for reporting_report_design` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `creator for reporting_report_design` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `retired_by for reporting_report_design` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_report_design`
--

LOCK TABLES `reporting_report_design` WRITE;
/*!40000 ALTER TABLE `reporting_report_design` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_report_design` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_report_design_resource`
--

DROP TABLE IF EXISTS `reporting_report_design_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_report_design_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `report_design_id` int(11) NOT NULL DEFAULT '0',
  `content_type` varchar(50) DEFAULT NULL,
  `extension` varchar(20) DEFAULT NULL,
  `contents` longblob,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `report_design_id for reporting_report_design_resource` (`report_design_id`),
  KEY `creator for reporting_report_design_resource` (`creator`),
  KEY `changed_by for reporting_report_design_resource` (`changed_by`),
  KEY `retired_by for reporting_report_design_resource` (`retired_by`),
  CONSTRAINT `changed_by for reporting_report_design_resource` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `creator for reporting_report_design_resource` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `report_design_id for reporting_report_design_resource` FOREIGN KEY (`report_design_id`) REFERENCES `reporting_report_design` (`id`),
  CONSTRAINT `retired_by for reporting_report_design_resource` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_report_design_resource`
--

LOCK TABLES `reporting_report_design_resource` WRITE;
/*!40000 ALTER TABLE `reporting_report_design_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_report_design_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_report_processor`
--

DROP TABLE IF EXISTS `reporting_report_processor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_report_processor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `processor_type` varchar(255) NOT NULL,
  `configuration` mediumtext,
  `run_on_success` tinyint(1) NOT NULL DEFAULT '1',
  `run_on_error` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `report_design_id` int(11) DEFAULT NULL,
  `processor_mode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `creator for reporting_report_processor` (`creator`),
  KEY `changed_by for reporting_report_processor` (`changed_by`),
  KEY `retired_by for reporting_report_processor` (`retired_by`),
  KEY `reporting_report_processor_report_design` (`report_design_id`),
  CONSTRAINT `changed_by for reporting_report_processor` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `creator for reporting_report_processor` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `reporting_report_processor_report_design` FOREIGN KEY (`report_design_id`) REFERENCES `reporting_report_design` (`id`),
  CONSTRAINT `retired_by for reporting_report_processor` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_report_processor`
--

LOCK TABLES `reporting_report_processor` WRITE;
/*!40000 ALTER TABLE `reporting_report_processor` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_report_processor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_report_request`
--

DROP TABLE IF EXISTS `reporting_report_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_report_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `base_cohort_uuid` char(38) DEFAULT NULL,
  `base_cohort_parameters` text,
  `report_definition_uuid` char(38) NOT NULL,
  `report_definition_parameters` text,
  `renderer_type` varchar(255) NOT NULL,
  `renderer_argument` varchar(255) DEFAULT NULL,
  `requested_by` int(11) NOT NULL DEFAULT '0',
  `request_datetime` datetime NOT NULL,
  `priority` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `evaluation_start_datetime` datetime DEFAULT NULL,
  `evaluation_complete_datetime` datetime DEFAULT NULL,
  `render_complete_datetime` datetime DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `schedule` varchar(100) DEFAULT NULL,
  `process_automatically` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `requested_by for reporting_report_request` (`requested_by`),
  CONSTRAINT `requested_by for reporting_report_request` FOREIGN KEY (`requested_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_report_request`
--

LOCK TABLES `reporting_report_request` WRITE;
/*!40000 ALTER TABLE `reporting_report_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_report_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`role`),
  UNIQUE KEY `role_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_privilege`
--

DROP TABLE IF EXISTS `role_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_privilege` (
  `role` varchar(50) NOT NULL DEFAULT '',
  `privilege` varchar(255) NOT NULL,
  PRIMARY KEY (`privilege`,`role`),
  KEY `role_privilege_to_role` (`role`),
  CONSTRAINT `privilege_definitions` FOREIGN KEY (`privilege`) REFERENCES `privilege` (`privilege`),
  CONSTRAINT `role_privilege_to_role` FOREIGN KEY (`role`) REFERENCES `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_privilege`
--

LOCK TABLES `role_privilege` WRITE;
/*!40000 ALTER TABLE `role_privilege` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_role`
--

DROP TABLE IF EXISTS `role_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_role` (
  `parent_role` varchar(50) NOT NULL DEFAULT '',
  `child_role` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`parent_role`,`child_role`),
  KEY `inherited_role` (`child_role`),
  CONSTRAINT `inherited_role` FOREIGN KEY (`child_role`) REFERENCES `role` (`role`),
  CONSTRAINT `parent_role` FOREIGN KEY (`parent_role`) REFERENCES `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_role`
--

LOCK TABLES `role_role` WRITE;
/*!40000 ALTER TABLE `role_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduler_task_config`
--

DROP TABLE IF EXISTS `scheduler_task_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduler_task_config` (
  `task_config_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `schedulable_class` text,
  `start_time` datetime DEFAULT NULL,
  `start_time_pattern` varchar(50) DEFAULT NULL,
  `repeat_interval` int(11) NOT NULL DEFAULT '0',
  `start_on_startup` tinyint(1) NOT NULL DEFAULT '0',
  `started` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT '0',
  `date_created` datetime DEFAULT '2005-01-01 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `last_execution_time` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`task_config_id`),
  UNIQUE KEY `scheduler_task_config_uuid_index` (`uuid`),
  KEY `scheduler_changer` (`changed_by`),
  KEY `scheduler_creator` (`created_by`),
  CONSTRAINT `scheduler_changer` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `scheduler_creator` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduler_task_config`
--

LOCK TABLES `scheduler_task_config` WRITE;
/*!40000 ALTER TABLE `scheduler_task_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduler_task_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduler_task_config_property`
--

DROP TABLE IF EXISTS `scheduler_task_config_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduler_task_config_property` (
  `task_config_property_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text,
  `task_config_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`task_config_property_id`),
  KEY `task_config_for_property` (`task_config_id`),
  CONSTRAINT `task_config_for_property` FOREIGN KEY (`task_config_id`) REFERENCES `scheduler_task_config` (`task_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduler_task_config_property`
--

LOCK TABLES `scheduler_task_config_property` WRITE;
/*!40000 ALTER TABLE `scheduler_task_config_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduler_task_config_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_version`
--

DROP TABLE IF EXISTS `schema_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_version` (
  `version_rank` int(11) NOT NULL,
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`version`),
  KEY `schema_version_vr_idx` (`version_rank`),
  KEY `schema_version_ir_idx` (`installed_rank`),
  KEY `schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_version`
--

LOCK TABLES `schema_version` WRITE;
/*!40000 ALTER TABLE `schema_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `schema_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serialized_object`
--

DROP TABLE IF EXISTS `serialized_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serialized_object` (
  `serialized_object_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `subtype` varchar(255) NOT NULL,
  `serialization_class` varchar(255) NOT NULL,
  `serialized_data` mediumtext NOT NULL,
  `date_created` datetime NOT NULL,
  `creator` int(11) NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `date_retired` datetime DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `retire_reason` varchar(1000) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`serialized_object_id`),
  UNIQUE KEY `serialized_object_uuid_index` (`uuid`),
  KEY `serialized_object_creator` (`creator`),
  KEY `serialized_object_changed_by` (`changed_by`),
  KEY `serialized_object_retired_by` (`retired_by`),
  CONSTRAINT `serialized_object_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `serialized_object_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `serialized_object_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serialized_object`
--

LOCK TABLES `serialized_object` WRITE;
/*!40000 ALTER TABLE `serialized_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `serialized_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_order`
--

DROP TABLE IF EXISTS `test_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_order` (
  `order_id` int(11) NOT NULL DEFAULT '0',
  `specimen_source` int(11) DEFAULT NULL,
  `laterality` varchar(20) DEFAULT NULL,
  `clinical_history` text,
  `frequency` int(11) DEFAULT NULL,
  `number_of_repeats` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `test_order_specimen_source_fk` (`specimen_source`),
  KEY `test_order_frequency_fk` (`frequency`),
  CONSTRAINT `test_order_frequency_fk` FOREIGN KEY (`frequency`) REFERENCES `order_frequency` (`order_frequency_id`),
  CONSTRAINT `test_order_order_id_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `test_order_specimen_source_fk` FOREIGN KEY (`specimen_source`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_order`
--

LOCK TABLES `test_order` WRITE;
/*!40000 ALTER TABLE `test_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uiframework_user_defined_page_view`
--

DROP TABLE IF EXISTS `uiframework_user_defined_page_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uiframework_user_defined_page_view` (
  `page_view_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `template_type` varchar(50) NOT NULL,
  `template_text` mediumtext NOT NULL,
  `uuid` varchar(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`page_view_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uiframework_user_defined_page_view`
--

LOCK TABLES `uiframework_user_defined_page_view` WRITE;
/*!40000 ALTER TABLE `uiframework_user_defined_page_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `uiframework_user_defined_page_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_property`
--

DROP TABLE IF EXISTS `user_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_property` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `property` varchar(100) NOT NULL DEFAULT '',
  `property_value` text,
  PRIMARY KEY (`user_id`,`property`),
  CONSTRAINT `user_property_to_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_property`
--

LOCK TABLES `user_property` WRITE;
/*!40000 ALTER TABLE `user_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `role` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`role`,`user_id`),
  KEY `user_role_to_users` (`user_id`),
  CONSTRAINT `role_definitions` FOREIGN KEY (`role`) REFERENCES `role` (`role`),
  CONSTRAINT `user_role_to_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `system_id` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `salt` varchar(128) DEFAULT NULL,
  `secret_question` varchar(255) DEFAULT NULL,
  `secret_answer` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `person_id` int(11) NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_who_changed_user` (`changed_by`),
  KEY `user_creator` (`creator`),
  KEY `user_who_retired_this_user` (`retired_by`),
  KEY `person_id_for_user` (`person_id`),
  CONSTRAINT `person_id_for_user` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `user_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_changed_user` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_this_user` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit`
--

DROP TABLE IF EXISTS `visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit` (
  `visit_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `visit_type_id` int(11) NOT NULL,
  `date_started` datetime NOT NULL,
  `date_stopped` datetime DEFAULT NULL,
  `indication_concept_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`visit_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `visit_patient_index` (`patient_id`),
  KEY `visit_type_fk` (`visit_type_id`),
  KEY `visit_location_fk` (`location_id`),
  KEY `visit_creator_fk` (`creator`),
  KEY `visit_voided_by_fk` (`voided_by`),
  KEY `visit_changed_by_fk` (`changed_by`),
  KEY `visit_indication_concept_fk` (`indication_concept_id`),
  CONSTRAINT `visit_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_indication_concept_fk` FOREIGN KEY (`indication_concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `visit_location_fk` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `visit_patient_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `visit_type_fk` FOREIGN KEY (`visit_type_id`) REFERENCES `visit_type` (`visit_type_id`),
  CONSTRAINT `visit_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit`
--

LOCK TABLES `visit` WRITE;
/*!40000 ALTER TABLE `visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_attribute`
--

DROP TABLE IF EXISTS `visit_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_attribute` (
  `visit_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `visit_id` int(11) NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `value_reference` text NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`visit_attribute_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `visit_attribute_visit_fk` (`visit_id`),
  KEY `visit_attribute_attribute_type_id_fk` (`attribute_type_id`),
  KEY `visit_attribute_creator_fk` (`creator`),
  KEY `visit_attribute_changed_by_fk` (`changed_by`),
  KEY `visit_attribute_voided_by_fk` (`voided_by`),
  CONSTRAINT `visit_attribute_attribute_type_id_fk` FOREIGN KEY (`attribute_type_id`) REFERENCES `visit_attribute_type` (`visit_attribute_type_id`),
  CONSTRAINT `visit_attribute_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_attribute_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_attribute_visit_fk` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`),
  CONSTRAINT `visit_attribute_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_attribute`
--

LOCK TABLES `visit_attribute` WRITE;
/*!40000 ALTER TABLE `visit_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_attribute_type`
--

DROP TABLE IF EXISTS `visit_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_attribute_type` (
  `visit_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `min_occurs` int(11) NOT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`visit_attribute_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `visit_attribute_type_creator_fk` (`creator`),
  KEY `visit_attribute_type_changed_by_fk` (`changed_by`),
  KEY `visit_attribute_type_retired_by_fk` (`retired_by`),
  CONSTRAINT `visit_attribute_type_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_attribute_type_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_attribute_type_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_attribute_type`
--

LOCK TABLES `visit_attribute_type` WRITE;
/*!40000 ALTER TABLE `visit_attribute_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_type`
--

DROP TABLE IF EXISTS `visit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_type` (
  `visit_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`visit_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `visit_type_creator` (`creator`),
  KEY `visit_type_changed_by` (`changed_by`),
  KEY `visit_type_retired_by` (`retired_by`),
  CONSTRAINT `visit_type_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_type_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_type_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_type`
--

LOCK TABLES `visit_type` WRITE;
/*!40000 ALTER TABLE `visit_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-15 20:27:35
