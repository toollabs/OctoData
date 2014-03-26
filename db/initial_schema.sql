CREATE DATABASE  IF NOT EXISTS `s51816__krakenbase_p` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `s51816__krakenbase_p`;
-- MySQL dump
--
-- Host: localhost    Database: s51816__krakenbase_p
-- ------------------------------------------------------
-- Server version	5.5.34-MariaDB-1~precise-log

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
-- Table structure for table `ballots`
--

DROP TABLE IF EXISTS `ballots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ballots` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_project` varbinary(45) NOT NULL,
  `b_url` varchar(350) NOT NULL,
  `b_title` varbinary(100) NOT NULL,
  `b_starttime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`b_id`),
  KEY `idx_b_starttime` (`b_starttime`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `octoeye`
--

DROP TABLE IF EXISTS `octoeye`;
/*!50001 DROP VIEW IF EXISTS `octoeye`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `octoeye` (
  `vt_id` tinyint NOT NULL,
  `vt_diff` tinyint NOT NULL,
  `vt_timestamp` tinyint NOT NULL,
  `u_name` tinyint NOT NULL,
  `b_url` tinyint NOT NULL,
  `b_title` tinyint NOT NULL,
  `b_starttime` tinyint NOT NULL,
  `s_url` tinyint NOT NULL,
  `s_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `octoeye_meta`
--

DROP TABLE IF EXISTS `octoeye_meta`;
/*!50001 DROP VIEW IF EXISTS `octoeye_meta`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `octoeye_meta` (
  `vt_id` tinyint NOT NULL,
  `vt_diff` tinyint NOT NULL,
  `vt_timestamp` tinyint NOT NULL,
  `u_name` tinyint NOT NULL,
  `b_url` tinyint NOT NULL,
  `b_title` tinyint NOT NULL,
  `b_starttime` tinyint NOT NULL,
  `s_url` tinyint NOT NULL,
  `s_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_url` varbinary(320) DEFAULT NULL,
  `s_name` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2160 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `u_id` int(11) NOT NULL DEFAULT '0',
  `u_name` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_name_UNIQUE` (`u_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_meta`
--

DROP TABLE IF EXISTS `users_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_meta` (
  `u_id` int(11) NOT NULL DEFAULT '0',
  `u_name` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_name_UNIQUE` (`u_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes` (
  `vt_id` int(11) NOT NULL AUTO_INCREMENT,
  `vt_user_id` int(11) DEFAULT NULL,
  `vt_diff` int(11) DEFAULT NULL,
  `vt_ballot` int(11) DEFAULT NULL,
  `vt_subject` int(11) DEFAULT NULL,
  `vt_timestamp` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`vt_id`),
  KEY `IDX_V_UID` (`vt_user_id`),
  KEY `IDX_V_BALLOT` (`vt_ballot`)
) ENGINE=InnoDB AUTO_INCREMENT=278682 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `votes_meta`
--

DROP TABLE IF EXISTS `votes_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes_meta` (
  `vt_id` int(11) NOT NULL AUTO_INCREMENT,
  `vt_user_id` int(11) DEFAULT NULL,
  `vt_diff` int(11) DEFAULT NULL,
  `vt_ballot` int(11) DEFAULT NULL,
  `vt_subject` int(11) DEFAULT NULL,
  `vt_timestamp` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`vt_id`),
  KEY `IDX_V_UID` (`vt_user_id`),
  KEY `IDX_V_BALLOT` (`vt_ballot`)
) ENGINE=InnoDB AUTO_INCREMENT=3163 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `octoeye`
--

/*!50001 DROP TABLE IF EXISTS `octoeye`*/;
/*!50001 DROP VIEW IF EXISTS `octoeye`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`s51816`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `octoeye` AS select `votes`.`vt_id` AS `vt_id`,`votes`.`vt_diff` AS `vt_diff`,`votes`.`vt_timestamp` AS `vt_timestamp`,`users`.`u_name` AS `u_name`,`ballots`.`b_url` AS `b_url`,`ballots`.`b_title` AS `b_title`,`ballots`.`b_starttime` AS `b_starttime`,`subjects`.`s_url` AS `s_url`,`subjects`.`s_name` AS `s_name` from (((`votes` left join `users` on((`votes`.`vt_user_id` = `users`.`u_id`))) left join `ballots` on((`votes`.`vt_ballot` = `ballots`.`b_id`))) left join `subjects` on((`votes`.`vt_subject` = `subjects`.`s_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `octoeye_meta`
--

/*!50001 DROP TABLE IF EXISTS `octoeye_meta`*/;
/*!50001 DROP VIEW IF EXISTS `octoeye_meta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`s51816`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `octoeye_meta` AS select `votes_meta`.`vt_id` AS `vt_id`,`votes_meta`.`vt_diff` AS `vt_diff`,`votes_meta`.`vt_timestamp` AS `vt_timestamp`,`users_meta`.`u_name` AS `u_name`,`ballots`.`b_url` AS `b_url`,`ballots`.`b_title` AS `b_title`,`ballots`.`b_starttime` AS `b_starttime`,`subjects`.`s_url` AS `s_url`,`subjects`.`s_name` AS `s_name` from (((`votes_meta` left join `users_meta` on((`votes_meta`.`vt_user_id` = `users_meta`.`u_id`))) left join `ballots` on((`votes_meta`.`vt_ballot` = `ballots`.`b_id`))) left join `subjects` on((`votes_meta`.`vt_subject` = `subjects`.`s_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-26 23:56:15
