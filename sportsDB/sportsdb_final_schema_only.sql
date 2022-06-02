-- MariaDB dump 10.19  Distrib 10.7.3-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: sportsdb
-- ------------------------------------------------------
-- Server version	10.7.3-MariaDB

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `language` varchar(100) DEFAULT NULL,
  `suite` varchar(100) DEFAULT NULL,
  `floor` varchar(100) DEFAULT NULL,
  `building` varchar(100) DEFAULT NULL,
  `street_number` varchar(100) DEFAULT NULL,
  `street_prefix` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `street_suffix` varchar(100) DEFAULT NULL,
  `neighborhood` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `locality` varchar(100) DEFAULT NULL,
  `county` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `postal_code` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_addresses_1` (`locality`),
  KEY `IDX_addresses_2` (`region`),
  KEY `IDX_addresses_3` (`postal_code`),
  KEY `IDX_FK_add_loc_id__loc_id` (`location_id`),
  CONSTRAINT `FK_add_loc_id__loc_id` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `affiliation_phases`
--

DROP TABLE IF EXISTS `affiliation_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliation_phases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliation_id` int(11) NOT NULL,
  `root_id` int(11) DEFAULT NULL,
  `ancestor_affiliation_id` int(11) DEFAULT NULL,
  `start_season_id` int(11) DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_season_id` int(11) DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_seasons_affiliation_phases1` (`end_season_id`),
  KEY `FK_seasons_affiliation_phases` (`start_season_id`),
  KEY `FK_affiliations_affiliation_phases1` (`ancestor_affiliation_id`),
  KEY `FK_affiliations_affiliation_phases` (`affiliation_id`),
  CONSTRAINT `FK_affiliations_affiliation_phases` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_affiliations_affiliation_phases1` FOREIGN KEY (`ancestor_affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_seasons_affiliation_phases` FOREIGN KEY (`start_season_id`) REFERENCES `seasons` (`id`),
  CONSTRAINT `FK_seasons_affiliation_phases1` FOREIGN KEY (`end_season_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `affiliations`
--

DROP TABLE IF EXISTS `affiliations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliation_key` varchar(100) NOT NULL,
  `affiliation_type` varchar(100) DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_affiliations_1` (`affiliation_key`),
  KEY `IDX_affiliations_2` (`affiliation_type`),
  KEY `IDX_affiliations_3` (`affiliation_key`,`affiliation_type`,`publisher_id`),
  KEY `IDX_FK_aff_pub_id__pub_id` (`publisher_id`),
  CONSTRAINT `FK_aff_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `affiliations_documents`
--

DROP TABLE IF EXISTS `affiliations_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliations_documents` (
  `affiliation_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  KEY `FK_aff_doc_aff_id__aff_id` (`affiliation_id`),
  KEY `FK_aff_doc_doc_id__doc_id` (`document_id`),
  CONSTRAINT `FK_aff_doc_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_aff_doc_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `affiliations_events`
--

DROP TABLE IF EXISTS `affiliations_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliations_events` (
  `affiliation_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  KEY `FK_aff_eve_aff_id__aff_id` (`affiliation_id`),
  KEY `FK_aff_eve_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_aff_eve_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_aff_eve_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `affiliations_media`
--

DROP TABLE IF EXISTS `affiliations_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliations_media` (
  `affiliation_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  KEY `FK_aff_med_med_id__med_id` (`media_id`),
  KEY `FK_aff_med_aff_id__aff_id` (`affiliation_id`),
  CONSTRAINT `FK_aff_med_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_aff_med_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `american_football_action_participants`
--

DROP TABLE IF EXISTS `american_football_action_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_action_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `american_football_action_play_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `participant_role` varchar(100) NOT NULL,
  `score_type` varchar(100) DEFAULT NULL,
  `field_line` int(11) DEFAULT NULL,
  `yardage` int(11) DEFAULT NULL,
  `score_credit` int(11) DEFAULT NULL,
  `yards_gained` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_american_football_action_participants_1` (`participant_role`),
  KEY `IDX_american_football_action_participants_2` (`score_type`),
  KEY `IDX_FK_ame_foo_act_par_ame_foo_act_pla_id__ame_foo_act_pla_id` (`american_football_action_play_id`),
  KEY `IDX_FK_ame_foo_act_par_per_id__per_id` (`person_id`),
  CONSTRAINT `FK_ame_foo_act_par_ame_foo_act_pla_id__ame_foo_act_pla_id` FOREIGN KEY (`american_football_action_play_id`) REFERENCES `american_football_action_plays` (`id`),
  CONSTRAINT `FK_ame_foo_act_par_per_id__per_id` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `american_football_action_plays`
--

DROP TABLE IF EXISTS `american_football_action_plays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_action_plays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `american_football_event_state_id` int(11) NOT NULL,
  `team_id` int(11) DEFAULT NULL,
  `play_type` varchar(100) DEFAULT NULL,
  `score_attempt_type` varchar(100) DEFAULT NULL,
  `touchdown_type` varchar(100) DEFAULT NULL,
  `drive_result` varchar(100) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_american_football_action_plays_team_id_teams_id` (`team_id`),
  KEY `IDX_american_football_action_plays_1` (`play_type`),
  KEY `IDX_american_football_action_plays_2` (`score_attempt_type`),
  KEY `IDX_american_football_action_plays_3` (`drive_result`),
  KEY `IDX_FK_ame_foo_act_pla_ame_foo_eve_sta_id__ame_foo_eve_sta_id` (`american_football_event_state_id`),
  CONSTRAINT `FK_ame_foo_act_pla_ame_foo_eve_sta_id__ame_foo_eve_sta_id` FOREIGN KEY (`american_football_event_state_id`) REFERENCES `american_football_event_states` (`id`),
  CONSTRAINT `FK_american_football_action_plays_team_id_teams_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `american_football_defensive_stats`
--

DROP TABLE IF EXISTS `american_football_defensive_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_defensive_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tackles_total` varchar(100) DEFAULT NULL,
  `tackles_solo` varchar(100) DEFAULT NULL,
  `tackles_assists` varchar(100) DEFAULT NULL,
  `interceptions_total` varchar(100) DEFAULT NULL,
  `interceptions_yards` varchar(100) DEFAULT NULL,
  `interceptions_average` varchar(100) DEFAULT NULL,
  `interceptions_longest` varchar(100) DEFAULT NULL,
  `interceptions_touchdown` varchar(100) DEFAULT NULL,
  `quarterback_hurries` varchar(100) DEFAULT NULL,
  `sacks_total` varchar(100) DEFAULT NULL,
  `sacks_yards` varchar(100) DEFAULT NULL,
  `passes_defensed` varchar(100) DEFAULT NULL,
  `first_downs_against_total` int(11) DEFAULT NULL,
  `first_downs_against_rushing` int(11) DEFAULT NULL,
  `first_downs_against_passing` int(11) DEFAULT NULL,
  `first_downs_against_penalty` int(11) DEFAULT NULL,
  `conversions_third_down_against` int(11) DEFAULT NULL,
  `conversions_third_down_against_attempts` int(11) DEFAULT NULL,
  `conversions_third_down_against_percentage` decimal(5,2) DEFAULT NULL,
  `conversions_fourth_down_against` int(11) DEFAULT NULL,
  `conversions_fourth_down_against_attempts` int(11) DEFAULT NULL,
  `conversions_fourth_down_against_percentage` decimal(5,2) DEFAULT NULL,
  `two_point_conversions_against` int(11) DEFAULT NULL,
  `two_point_conversions_against_attempts` int(11) DEFAULT NULL,
  `offensive_plays_against_touchdown` int(11) DEFAULT NULL,
  `offensive_plays_against_average_yards_per_game` decimal(5,2) DEFAULT NULL,
  `rushes_against_attempts` int(11) DEFAULT NULL,
  `rushes_against_yards` int(11) DEFAULT NULL,
  `rushing_against_average_yards_per_game` decimal(5,2) DEFAULT NULL,
  `rushes_against_touchdowns` int(11) DEFAULT NULL,
  `rushes_against_average_yards_per` decimal(5,2) DEFAULT NULL,
  `rushes_against_longest` int(11) DEFAULT NULL,
  `receptions_against_total` int(11) DEFAULT NULL,
  `receptions_against_yards` int(11) DEFAULT NULL,
  `receptions_against_touchdowns` int(11) DEFAULT NULL,
  `receptions_against_average_yards_per` decimal(5,2) DEFAULT NULL,
  `receptions_against_longest` int(11) DEFAULT NULL,
  `passes_against_yards_net` int(11) DEFAULT NULL,
  `passes_against_yards_gross` int(11) DEFAULT NULL,
  `passes_against_attempts` int(11) DEFAULT NULL,
  `passes_against_completions` int(11) DEFAULT NULL,
  `passes_against_percentage` decimal(5,2) DEFAULT NULL,
  `passes_against_average_yards_per_game` decimal(5,2) DEFAULT NULL,
  `passes_against_average_yards_per` decimal(5,2) DEFAULT NULL,
  `passes_against_touchdowns` int(11) DEFAULT NULL,
  `passes_against_touchdowns_percentage` decimal(5,2) DEFAULT NULL,
  `passes_against_longest` int(11) DEFAULT NULL,
  `passes_against_rating` decimal(5,2) DEFAULT NULL,
  `interceptions_percentage` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `american_football_down_progress_stats`
--

DROP TABLE IF EXISTS `american_football_down_progress_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_down_progress_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_downs_total` varchar(100) DEFAULT NULL,
  `first_downs_pass` varchar(100) DEFAULT NULL,
  `first_downs_run` varchar(100) DEFAULT NULL,
  `first_downs_penalty` varchar(100) DEFAULT NULL,
  `conversions_third_down` varchar(100) DEFAULT NULL,
  `conversions_third_down_attempts` varchar(100) DEFAULT NULL,
  `conversions_third_down_percentage` varchar(100) DEFAULT NULL,
  `conversions_fourth_down` varchar(100) DEFAULT NULL,
  `conversions_fourth_down_attempts` varchar(100) DEFAULT NULL,
  `conversions_fourth_down_percentage` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `american_football_event_states`
--

DROP TABLE IF EXISTS `american_football_event_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_event_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `current_state` smallint(6) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `period_value` int(11) DEFAULT NULL,
  `period_time_elapsed` varchar(100) DEFAULT NULL,
  `period_time_remaining` varchar(100) DEFAULT NULL,
  `clock_state` varchar(100) DEFAULT NULL,
  `down` int(11) DEFAULT NULL,
  `team_in_possession_id` int(11) DEFAULT NULL,
  `score_team` int(11) DEFAULT NULL,
  `score_team_opposing` int(11) DEFAULT NULL,
  `distance_for_1st_down` int(11) DEFAULT NULL,
  `field_side` varchar(100) DEFAULT NULL,
  `field_line` int(11) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `score_team_away` int(11) DEFAULT NULL,
  `score_team_home` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ame_foo_eve_sta_tea_in_pos_id__tea_id` (`team_in_possession_id`),
  KEY `IDX_american_football_event_states_1` (`current_state`),
  KEY `IDX_american_football_event_states_context` (`context`),
  KEY `IDX_american_football_event_states_seq_num` (`sequence_number`),
  KEY `IDX_FK_ame_foo_eve_sta_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_ame_foo_eve_sta_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_ame_foo_eve_sta_tea_in_pos_id__tea_id` FOREIGN KEY (`team_in_possession_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `american_football_fumbles_stats`
--

DROP TABLE IF EXISTS `american_football_fumbles_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_fumbles_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fumbles_committed` varchar(100) DEFAULT NULL,
  `fumbles_forced` varchar(100) DEFAULT NULL,
  `fumbles_recovered` varchar(100) DEFAULT NULL,
  `fumbles_lost` varchar(100) DEFAULT NULL,
  `fumbles_yards_gained` varchar(100) DEFAULT NULL,
  `fumbles_own_committed` varchar(100) DEFAULT NULL,
  `fumbles_own_recovered` varchar(100) DEFAULT NULL,
  `fumbles_own_lost` varchar(100) DEFAULT NULL,
  `fumbles_own_yards_gained` varchar(100) DEFAULT NULL,
  `fumbles_opposing_committed` varchar(100) DEFAULT NULL,
  `fumbles_opposing_recovered` varchar(100) DEFAULT NULL,
  `fumbles_opposing_lost` varchar(100) DEFAULT NULL,
  `fumbles_opposing_yards_gained` varchar(100) DEFAULT NULL,
  `fumbles_own_touchdowns` int(11) DEFAULT NULL,
  `fumbles_opposing_touchdowns` int(11) DEFAULT NULL,
  `fumbles_committed_defense` int(11) DEFAULT NULL,
  `fumbles_committed_special_teams` int(11) DEFAULT NULL,
  `fumbles_committed_other` int(11) DEFAULT NULL,
  `fumbles_lost_defense` int(11) DEFAULT NULL,
  `fumbles_lost_special_teams` int(11) DEFAULT NULL,
  `fumbles_lost_other` int(11) DEFAULT NULL,
  `fumbles_forced_defense` int(11) DEFAULT NULL,
  `fumbles_recovered_defense` int(11) DEFAULT NULL,
  `fumbles_recovered_special_teams` int(11) DEFAULT NULL,
  `fumbles_recovered_other` int(11) DEFAULT NULL,
  `fumbles_recovered_yards_defense` int(11) DEFAULT NULL,
  `fumbles_recovered_yards_special_teams` int(11) DEFAULT NULL,
  `fumbles_recovered_yards_other` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `american_football_offensive_stats`
--

DROP TABLE IF EXISTS `american_football_offensive_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_offensive_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offensive_plays_yards` varchar(100) DEFAULT NULL,
  `offensive_plays_number` varchar(100) DEFAULT NULL,
  `offensive_plays_average_yards_per` varchar(100) DEFAULT NULL,
  `possession_duration` varchar(100) DEFAULT NULL,
  `turnovers_giveaway` varchar(100) DEFAULT NULL,
  `tackles` int(11) DEFAULT NULL,
  `tackles_assists` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `american_football_passing_stats`
--

DROP TABLE IF EXISTS `american_football_passing_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_passing_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `passes_attempts` varchar(100) DEFAULT NULL,
  `passes_completions` varchar(100) DEFAULT NULL,
  `passes_percentage` varchar(100) DEFAULT NULL,
  `passes_yards_gross` varchar(100) DEFAULT NULL,
  `passes_yards_net` varchar(100) DEFAULT NULL,
  `passes_yards_lost` varchar(100) DEFAULT NULL,
  `passes_touchdowns` varchar(100) DEFAULT NULL,
  `passes_touchdowns_percentage` varchar(100) DEFAULT NULL,
  `passes_interceptions` varchar(100) DEFAULT NULL,
  `passes_interceptions_percentage` varchar(100) DEFAULT NULL,
  `passes_longest` varchar(100) DEFAULT NULL,
  `passes_average_yards_per` varchar(100) DEFAULT NULL,
  `passer_rating` varchar(100) DEFAULT NULL,
  `receptions_total` varchar(100) DEFAULT NULL,
  `receptions_yards` varchar(100) DEFAULT NULL,
  `receptions_touchdowns` varchar(100) DEFAULT NULL,
  `receptions_first_down` varchar(100) DEFAULT NULL,
  `receptions_longest` varchar(100) DEFAULT NULL,
  `receptions_average_yards_per` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `american_football_penalties_stats`
--

DROP TABLE IF EXISTS `american_football_penalties_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_penalties_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `penalties_total` varchar(100) DEFAULT NULL,
  `penalty_yards` varchar(100) DEFAULT NULL,
  `penalty_first_downs` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `american_football_rushing_stats`
--

DROP TABLE IF EXISTS `american_football_rushing_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_rushing_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rushes_attempts` varchar(100) DEFAULT NULL,
  `rushes_yards` varchar(100) DEFAULT NULL,
  `rushes_touchdowns` varchar(100) DEFAULT NULL,
  `rushing_average_yards_per` varchar(100) DEFAULT NULL,
  `rushes_first_down` varchar(100) DEFAULT NULL,
  `rushes_longest` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `american_football_sacks_against_stats`
--

DROP TABLE IF EXISTS `american_football_sacks_against_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_sacks_against_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sacks_against_yards` varchar(100) DEFAULT NULL,
  `sacks_against_total` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `american_football_scoring_stats`
--

DROP TABLE IF EXISTS `american_football_scoring_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_scoring_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `touchdowns_total` varchar(100) DEFAULT NULL,
  `touchdowns_passing` varchar(100) DEFAULT NULL,
  `touchdowns_rushing` varchar(100) DEFAULT NULL,
  `touchdowns_special_teams` varchar(100) DEFAULT NULL,
  `touchdowns_defensive` varchar(100) DEFAULT NULL,
  `extra_points_attempts` varchar(100) DEFAULT NULL,
  `extra_points_made` varchar(100) DEFAULT NULL,
  `extra_points_missed` varchar(100) DEFAULT NULL,
  `extra_points_blocked` varchar(100) DEFAULT NULL,
  `field_goal_attempts` varchar(100) DEFAULT NULL,
  `field_goals_made` varchar(100) DEFAULT NULL,
  `field_goals_missed` varchar(100) DEFAULT NULL,
  `field_goals_blocked` varchar(100) DEFAULT NULL,
  `safeties_against` varchar(100) DEFAULT NULL,
  `two_point_conversions_attempts` varchar(100) DEFAULT NULL,
  `two_point_conversions_made` varchar(100) DEFAULT NULL,
  `touchbacks_total` varchar(100) DEFAULT NULL,
  `safeties_against_opponent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `american_football_special_teams_stats`
--

DROP TABLE IF EXISTS `american_football_special_teams_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_special_teams_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `returns_punt_total` varchar(100) DEFAULT NULL,
  `returns_punt_yards` varchar(100) DEFAULT NULL,
  `returns_punt_average` varchar(100) DEFAULT NULL,
  `returns_punt_longest` varchar(100) DEFAULT NULL,
  `returns_punt_touchdown` varchar(100) DEFAULT NULL,
  `returns_kickoff_total` varchar(100) DEFAULT NULL,
  `returns_kickoff_yards` varchar(100) DEFAULT NULL,
  `returns_kickoff_average` varchar(100) DEFAULT NULL,
  `returns_kickoff_longest` varchar(100) DEFAULT NULL,
  `returns_kickoff_touchdown` varchar(100) DEFAULT NULL,
  `returns_total` varchar(100) DEFAULT NULL,
  `returns_yards` varchar(100) DEFAULT NULL,
  `punts_total` varchar(100) DEFAULT NULL,
  `punts_yards_gross` varchar(100) DEFAULT NULL,
  `punts_yards_net` varchar(100) DEFAULT NULL,
  `punts_longest` varchar(100) DEFAULT NULL,
  `punts_inside_20` varchar(100) DEFAULT NULL,
  `punts_inside_20_percentage` varchar(100) DEFAULT NULL,
  `punts_average` varchar(100) DEFAULT NULL,
  `punts_blocked` varchar(100) DEFAULT NULL,
  `touchbacks_total` varchar(100) DEFAULT NULL,
  `touchbacks_total_percentage` varchar(100) DEFAULT NULL,
  `touchbacks_kickoffs` varchar(100) DEFAULT NULL,
  `touchbacks_kickoffs_percentage` varchar(100) DEFAULT NULL,
  `touchbacks_punts` varchar(100) DEFAULT NULL,
  `touchbacks_punts_percentage` varchar(100) DEFAULT NULL,
  `touchbacks_interceptions` varchar(100) DEFAULT NULL,
  `touchbacks_interceptions_percentage` varchar(100) DEFAULT NULL,
  `fair_catches` varchar(100) DEFAULT NULL,
  `punts_against_blocked` int(11) DEFAULT NULL,
  `field_goals_against_attempts_1_to_19` int(11) DEFAULT NULL,
  `field_goals_against_made_1_to_19` int(11) DEFAULT NULL,
  `field_goals_against_attempts_20_to_29` int(11) DEFAULT NULL,
  `field_goals_against_made_20_to_29` int(11) DEFAULT NULL,
  `field_goals_against_attempts_30_to_39` int(11) DEFAULT NULL,
  `field_goals_against_made_30_to_39` int(11) DEFAULT NULL,
  `field_goals_against_attempts_40_to_49` int(11) DEFAULT NULL,
  `field_goals_against_made_40_to_49` int(11) DEFAULT NULL,
  `field_goals_against_attempts_50_plus` int(11) DEFAULT NULL,
  `field_goals_against_made_50_plus` int(11) DEFAULT NULL,
  `field_goals_against_attempts` int(11) DEFAULT NULL,
  `extra_points_against_attempts` int(11) DEFAULT NULL,
  `tackles` int(11) DEFAULT NULL,
  `tackles_assists` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `american_football_team_stats`
--

DROP TABLE IF EXISTS `american_football_team_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `american_football_team_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yards_per_attempt` varchar(100) DEFAULT NULL,
  `average_starting_position` varchar(100) DEFAULT NULL,
  `timeouts` varchar(100) DEFAULT NULL,
  `time_of_possession` varchar(100) DEFAULT NULL,
  `turnover_ratio` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_type` varchar(100) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `award_type` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `rank` varchar(100) DEFAULT NULL,
  `award_value` varchar(100) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `date_coverage_type` varchar(100) DEFAULT NULL,
  `date_coverage_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `baseball_action_contact_details`
--

DROP TABLE IF EXISTS `baseball_action_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseball_action_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseball_action_pitch_id` int(11) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `strength` varchar(100) DEFAULT NULL,
  `velocity` int(11) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `trajectory_coordinates` varchar(100) DEFAULT NULL,
  `trajectory_formula` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bas_act_con_det_bas_act_pit_id__bas_act_pit_id` (`baseball_action_pitch_id`),
  CONSTRAINT `FK_bas_act_con_det_bas_act_pit_id__bas_act_pit_id` FOREIGN KEY (`baseball_action_pitch_id`) REFERENCES `baseball_action_pitches` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `baseball_action_pitches`
--

DROP TABLE IF EXISTS `baseball_action_pitches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseball_action_pitches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseball_action_play_id` int(11) NOT NULL,
  `sequence_number` decimal(4,1) DEFAULT NULL,
  `baseball_defensive_group_id` int(11) DEFAULT NULL,
  `umpire_call` varchar(100) DEFAULT NULL,
  `pitch_location` varchar(100) DEFAULT NULL,
  `pitch_type` varchar(100) DEFAULT NULL,
  `pitch_velocity` int(11) DEFAULT NULL,
  `comment` varchar(2048) DEFAULT NULL,
  `trajectory_coordinates` varchar(512) DEFAULT NULL,
  `trajectory_formula` varchar(100) DEFAULT NULL,
  `ball_type` varchar(40) DEFAULT NULL,
  `strike_type` varchar(40) DEFAULT NULL,
  `strikes` int(11) DEFAULT NULL,
  `balls` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_baseball_action_plays_baseball_action_pitches` (`baseball_action_play_id`),
  KEY `IDX_baseball_action_pitches_1` (`umpire_call`),
  KEY `IDX_baseball_action_pitches_2` (`pitch_type`),
  KEY `IDX_FK_bas_act_pit_bas_def_gro_id__bas_def_gro_id` (`baseball_defensive_group_id`),
  CONSTRAINT `FK_bas_act_pit_bas_def_gro_id__bas_def_gro_id` FOREIGN KEY (`baseball_defensive_group_id`) REFERENCES `baseball_defensive_group` (`id`),
  CONSTRAINT `FK_baseball_action_plays_baseball_action_pitches` FOREIGN KEY (`baseball_action_play_id`) REFERENCES `baseball_action_plays` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `baseball_action_plays`
--

DROP TABLE IF EXISTS `baseball_action_plays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseball_action_plays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseball_event_state_id` int(11) NOT NULL,
  `play_type` varchar(100) DEFAULT NULL,
  `out_type` varchar(100) DEFAULT NULL,
  `notation` varchar(100) DEFAULT NULL,
  `notation_yaml` text DEFAULT NULL,
  `baseball_defensive_group_id` int(11) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `runner_on_first_advance` varchar(40) DEFAULT NULL,
  `runner_on_second_advance` varchar(40) DEFAULT NULL,
  `runner_on_third_advance` varchar(40) DEFAULT NULL,
  `outs_recorded` int(11) DEFAULT NULL,
  `rbi` int(11) DEFAULT NULL,
  `runs_scored` int(11) DEFAULT NULL,
  `earned_runs_scored` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_baseball_action_plays_1` (`play_type`),
  KEY `IDX_baseball_action_plays_2` (`out_type`),
  KEY `IDX_FK_bas_act_pla_bas_eve_sta_id__bas_eve_sta_id` (`baseball_event_state_id`),
  CONSTRAINT `FK_bas_act_pla_bas_eve_sta_id__bas_eve_sta_id` FOREIGN KEY (`baseball_event_state_id`) REFERENCES `baseball_event_states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `baseball_action_substitutions`
--

DROP TABLE IF EXISTS `baseball_action_substitutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseball_action_substitutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseball_event_state_id` int(11) NOT NULL,
  `sequence_number` decimal(4,1) DEFAULT NULL,
  `person_type` varchar(100) DEFAULT NULL,
  `person_original_id` int(11) DEFAULT NULL,
  `person_original_position_id` int(11) DEFAULT NULL,
  `person_original_lineup_slot` int(11) DEFAULT NULL,
  `person_replacing_id` int(11) DEFAULT NULL,
  `person_replacing_position_id` int(11) DEFAULT NULL,
  `person_replacing_lineup_slot` int(11) DEFAULT NULL,
  `substitution_reason` varchar(100) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bas_act_sub_per_rep_pos_id__pos_id` (`person_replacing_position_id`),
  KEY `FK_bas_act_sub_per_ori_pos_id__pos_id` (`person_original_position_id`),
  KEY `FK_bas_act_sub_bas_eve_sta_id__bas_eve_sta_id` (`baseball_event_state_id`),
  KEY `FK_bas_act_sub_per_rep_id__per_id` (`person_replacing_id`),
  KEY `FK_bas_act_sub_per_ori_id__per_id` (`person_original_id`),
  CONSTRAINT `FK_bas_act_sub_bas_eve_sta_id__bas_eve_sta_id` FOREIGN KEY (`baseball_event_state_id`) REFERENCES `baseball_event_states` (`id`),
  CONSTRAINT `FK_bas_act_sub_per_ori_id__per_id` FOREIGN KEY (`person_original_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_bas_act_sub_per_ori_pos_id__pos_id` FOREIGN KEY (`person_original_position_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `FK_bas_act_sub_per_rep_id__per_id` FOREIGN KEY (`person_replacing_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_bas_act_sub_per_rep_pos_id__pos_id` FOREIGN KEY (`person_replacing_position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `baseball_defensive_group`
--

DROP TABLE IF EXISTS `baseball_defensive_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseball_defensive_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `baseball_defensive_players`
--

DROP TABLE IF EXISTS `baseball_defensive_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseball_defensive_players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseball_defensive_group_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bas_def_pla_bas_def_gro_id__bas_def_gro_id` (`baseball_defensive_group_id`),
  KEY `FK_bas_def_pla_pla_id__per_id` (`player_id`),
  KEY `FK_bas_def_pla_pos_id__pos_id` (`position_id`),
  CONSTRAINT `FK_bas_def_pla_bas_def_gro_id__bas_def_gro_id` FOREIGN KEY (`baseball_defensive_group_id`) REFERENCES `baseball_defensive_group` (`id`),
  CONSTRAINT `FK_bas_def_pla_pla_id__per_id` FOREIGN KEY (`player_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_bas_def_pla_pos_id__pos_id` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `baseball_defensive_stats`
--

DROP TABLE IF EXISTS `baseball_defensive_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseball_defensive_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `double_plays` int(11) DEFAULT NULL,
  `triple_plays` int(11) DEFAULT NULL,
  `putouts` int(11) DEFAULT NULL,
  `assists` int(11) DEFAULT NULL,
  `errors` int(11) DEFAULT NULL,
  `fielding_percentage` float DEFAULT NULL,
  `defensive_average` float DEFAULT NULL,
  `errors_passed_ball` int(11) DEFAULT NULL,
  `errors_catchers_interference` int(11) DEFAULT NULL,
  `stolen_bases_average` int(11) DEFAULT NULL,
  `stolen_bases_caught` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `baseball_event_states`
--

DROP TABLE IF EXISTS `baseball_event_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseball_event_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `current_state` smallint(6) DEFAULT NULL,
  `sequence_number` decimal(4,1) DEFAULT NULL,
  `at_bat_number` int(11) DEFAULT NULL,
  `inning_value` int(11) DEFAULT NULL,
  `inning_half` varchar(100) DEFAULT NULL,
  `outs` int(11) DEFAULT NULL,
  `balls` int(11) DEFAULT NULL,
  `strikes` int(11) DEFAULT NULL,
  `runner_on_first_id` int(11) DEFAULT NULL,
  `runner_on_second_id` int(11) DEFAULT NULL,
  `runner_on_third_id` int(11) DEFAULT NULL,
  `runner_on_first` smallint(6) DEFAULT NULL,
  `runner_on_second` smallint(6) DEFAULT NULL,
  `runner_on_third` smallint(6) DEFAULT NULL,
  `runs_this_inning_half` int(11) DEFAULT NULL,
  `pitcher_id` int(11) DEFAULT NULL,
  `batter_id` int(11) DEFAULT NULL,
  `batter_side` varchar(100) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bas_eve_sta_run_on_sec_id__per_id` (`runner_on_second_id`),
  KEY `FK_bas_eve_sta_run_on_thi_id__per_id` (`runner_on_third_id`),
  KEY `FK_bas_eve_sta_run_on_fir_id__per_id` (`runner_on_first_id`),
  KEY `FK_bas_eve_sta_bat_id__per_id` (`batter_id`),
  KEY `FK_bas_eve_sta_pit_id__per_id` (`pitcher_id`),
  KEY `IDX_baseball_event_states_1` (`current_state`),
  KEY `IDX_baseball_event_states_context` (`context`),
  KEY `IDX_baseball_event_states_seq_num` (`sequence_number`),
  KEY `IDX_FK_bas_eve_sta_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_bas_eve_sta_bat_id__per_id` FOREIGN KEY (`batter_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_bas_eve_sta_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_bas_eve_sta_pit_id__per_id` FOREIGN KEY (`pitcher_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_bas_eve_sta_run_on_fir_id__per_id` FOREIGN KEY (`runner_on_first_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_bas_eve_sta_run_on_sec_id__per_id` FOREIGN KEY (`runner_on_second_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_bas_eve_sta_run_on_thi_id__per_id` FOREIGN KEY (`runner_on_third_id`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `baseball_offensive_stats`
--

DROP TABLE IF EXISTS `baseball_offensive_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseball_offensive_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `average` float DEFAULT NULL,
  `runs_scored` int(11) DEFAULT NULL,
  `at_bats` int(11) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `rbi` int(11) DEFAULT NULL,
  `total_bases` int(11) DEFAULT NULL,
  `slugging_percentage` float DEFAULT NULL,
  `bases_on_balls` int(11) DEFAULT NULL,
  `strikeouts` int(11) DEFAULT NULL,
  `left_on_base` int(11) DEFAULT NULL,
  `left_in_scoring_position` int(11) DEFAULT NULL,
  `singles` int(11) DEFAULT NULL,
  `doubles` int(11) DEFAULT NULL,
  `triples` int(11) DEFAULT NULL,
  `home_runs` int(11) DEFAULT NULL,
  `grand_slams` int(11) DEFAULT NULL,
  `at_bats_per_rbi` float DEFAULT NULL,
  `plate_appearances_per_rbi` float DEFAULT NULL,
  `at_bats_per_home_run` float DEFAULT NULL,
  `plate_appearances_per_home_run` float DEFAULT NULL,
  `sac_flies` int(11) DEFAULT NULL,
  `sac_bunts` int(11) DEFAULT NULL,
  `grounded_into_double_play` int(11) DEFAULT NULL,
  `moved_up` int(11) DEFAULT NULL,
  `on_base_percentage` float DEFAULT NULL,
  `stolen_bases` int(11) DEFAULT NULL,
  `stolen_bases_caught` int(11) DEFAULT NULL,
  `stolen_bases_average` float DEFAULT NULL,
  `hit_by_pitch` int(11) DEFAULT NULL,
  `on_base_plus_slugging` float DEFAULT NULL,
  `plate_appearances` int(11) DEFAULT NULL,
  `hits_extra_base` int(11) DEFAULT NULL,
  `pick_offs_against` int(11) DEFAULT NULL,
  `sacrifices` int(11) DEFAULT NULL,
  `outs_fly` int(11) DEFAULT NULL,
  `outs_ground` int(11) DEFAULT NULL,
  `reached_base_defensive_interference` int(11) DEFAULT NULL,
  `reached_base_error` int(11) DEFAULT NULL,
  `reached_base_fielder_choice` int(11) DEFAULT NULL,
  `double_plays_against` int(11) DEFAULT NULL,
  `triple_plays_against` int(11) DEFAULT NULL,
  `strikeouts_looking` int(11) DEFAULT NULL,
  `bases_on_balls_intentional` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `baseball_pitching_stats`
--

DROP TABLE IF EXISTS `baseball_pitching_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseball_pitching_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `runs_allowed` int(11) DEFAULT NULL,
  `singles_allowed` int(11) DEFAULT NULL,
  `doubles_allowed` int(11) DEFAULT NULL,
  `triples_allowed` int(11) DEFAULT NULL,
  `home_runs_allowed` int(11) DEFAULT NULL,
  `innings_pitched` varchar(20) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `earned_runs` int(11) DEFAULT NULL,
  `unearned_runs` int(11) DEFAULT NULL,
  `bases_on_balls` int(11) DEFAULT NULL,
  `bases_on_balls_intentional` int(11) DEFAULT NULL,
  `strikeouts` int(11) DEFAULT NULL,
  `strikeout_to_bb_ratio` float DEFAULT NULL,
  `number_of_pitches` int(11) DEFAULT NULL,
  `era` float DEFAULT NULL,
  `inherited_runners_scored` int(11) DEFAULT NULL,
  `pick_offs` int(11) DEFAULT NULL,
  `errors_hit_with_pitch` int(11) DEFAULT NULL,
  `errors_wild_pitch` int(11) DEFAULT NULL,
  `balks` int(11) DEFAULT NULL,
  `wins` int(11) DEFAULT NULL,
  `losses` int(11) DEFAULT NULL,
  `saves` int(11) DEFAULT NULL,
  `shutouts` int(11) DEFAULT NULL,
  `games_complete` int(11) DEFAULT NULL,
  `games_finished` int(11) DEFAULT NULL,
  `winning_percentage` float DEFAULT NULL,
  `event_credit` varchar(40) DEFAULT NULL,
  `save_credit` varchar(40) DEFAULT NULL,
  `batters_doubles_against` int(11) DEFAULT NULL,
  `batters_triples_against` int(11) DEFAULT NULL,
  `outs_recorded` int(11) DEFAULT NULL,
  `batters_at_bats_against` int(11) DEFAULT NULL,
  `number_of_strikes` int(11) DEFAULT NULL,
  `wins_season` int(11) DEFAULT NULL,
  `losses_season` int(11) DEFAULT NULL,
  `saves_season` int(11) DEFAULT NULL,
  `saves_blown_season` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `basketball_defensive_stats`
--

DROP TABLE IF EXISTS `basketball_defensive_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basketball_defensive_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `steals_total` varchar(100) DEFAULT NULL,
  `steals_per_game` varchar(100) DEFAULT NULL,
  `blocks_total` varchar(100) DEFAULT NULL,
  `blocks_per_game` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `basketball_event_states`
--

DROP TABLE IF EXISTS `basketball_event_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basketball_event_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `current_state` tinyint(4) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `period_value` varchar(100) DEFAULT NULL,
  `period_time_elapsed` varchar(100) DEFAULT NULL,
  `period_time_remaining` varchar(100) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_basketball_event_states_context` (`context`),
  KEY `IDX_basketball_event_states_seq_num` (`sequence_number`),
  KEY `IDX_FK_events_basketball_event_states` (`event_id`),
  CONSTRAINT `FK_bask_eve_sta_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `basketball_offensive_stats`
--

DROP TABLE IF EXISTS `basketball_offensive_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basketball_offensive_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_goals_made` int(11) DEFAULT NULL,
  `field_goals_attempted` int(11) DEFAULT NULL,
  `field_goals_percentage` varchar(100) DEFAULT NULL,
  `field_goals_per_game` varchar(100) DEFAULT NULL,
  `field_goals_attempted_per_game` varchar(100) DEFAULT NULL,
  `field_goals_percentage_adjusted` varchar(100) DEFAULT NULL,
  `three_pointers_made` int(11) DEFAULT NULL,
  `three_pointers_attempted` int(11) DEFAULT NULL,
  `three_pointers_percentage` varchar(100) DEFAULT NULL,
  `three_pointers_per_game` varchar(100) DEFAULT NULL,
  `three_pointers_attempted_per_game` varchar(100) DEFAULT NULL,
  `free_throws_made` varchar(100) DEFAULT NULL,
  `free_throws_attempted` varchar(100) DEFAULT NULL,
  `free_throws_percentage` varchar(100) DEFAULT NULL,
  `free_throws_per_game` varchar(100) DEFAULT NULL,
  `free_throws_attempted_per_game` varchar(100) DEFAULT NULL,
  `points_scored_total` varchar(100) DEFAULT NULL,
  `points_scored_per_game` varchar(100) DEFAULT NULL,
  `assists_total` varchar(100) DEFAULT NULL,
  `assists_per_game` varchar(100) DEFAULT NULL,
  `turnovers_total` varchar(100) DEFAULT NULL,
  `turnovers_per_game` varchar(100) DEFAULT NULL,
  `points_scored_off_turnovers` varchar(100) DEFAULT NULL,
  `points_scored_in_paint` varchar(100) DEFAULT NULL,
  `points_scored_on_second_chance` varchar(100) DEFAULT NULL,
  `points_scored_on_fast_break` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `basketball_rebounding_stats`
--

DROP TABLE IF EXISTS `basketball_rebounding_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basketball_rebounding_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rebounds_total` varchar(100) DEFAULT NULL,
  `rebounds_per_game` varchar(100) DEFAULT NULL,
  `rebounds_defensive` varchar(100) DEFAULT NULL,
  `rebounds_offensive` varchar(100) DEFAULT NULL,
  `team_rebounds_total` varchar(100) DEFAULT NULL,
  `team_rebounds_per_game` varchar(100) DEFAULT NULL,
  `team_rebounds_defensive` varchar(100) DEFAULT NULL,
  `team_rebounds_offensive` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `basketball_team_stats`
--

DROP TABLE IF EXISTS `basketball_team_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basketball_team_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timeouts_left` varchar(100) DEFAULT NULL,
  `largest_lead` varchar(100) DEFAULT NULL,
  `fouls_total` varchar(100) DEFAULT NULL,
  `turnover_margin` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bookmakers`
--

DROP TABLE IF EXISTS `bookmakers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmakers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_key` varchar(100) DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_boo_loc_id__loc_id` (`location_id`),
  KEY `FK_boo_pub_id__pub_id` (`publisher_id`),
  CONSTRAINT `FK_boo_loc_id__loc_id` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_boo_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `core_stats`
--

DROP TABLE IF EXISTS `core_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` varchar(100) DEFAULT NULL,
  `score_opposing` varchar(100) DEFAULT NULL,
  `score_attempts` varchar(100) DEFAULT NULL,
  `score_attempts_opposing` varchar(100) DEFAULT NULL,
  `score_percentage` varchar(100) DEFAULT NULL,
  `score_percentage_opposing` varchar(100) DEFAULT NULL,
  `time_played_event` varchar(40) DEFAULT NULL,
  `time_played_total` varchar(40) DEFAULT NULL,
  `time_played_event_average` varchar(40) DEFAULT NULL,
  `events_played` varchar(40) DEFAULT NULL,
  `events_started` varchar(40) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `db_info`
--

DROP TABLE IF EXISTS `db_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_info` (
  `version` varchar(100) NOT NULL DEFAULT '16',
  KEY `IDX_db_info_1` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `display_names`
--

DROP TABLE IF EXISTS `display_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `display_names` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(100) NOT NULL,
  `entity_type` varchar(100) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `abbreviation` varchar(100) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `prefix` varchar(20) DEFAULT NULL,
  `suffix` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_display_names_1` (`entity_id`),
  KEY `IDX_display_names_2` (`entity_type`),
  CONSTRAINT `person_name_id` FOREIGN KEY (`entity_id`) REFERENCES `persons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document_classes`
--

DROP TABLE IF EXISTS `document_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_document_classes_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document_contents`
--

DROP TABLE IF EXISTS `document_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `sportsml` varchar(200) DEFAULT NULL,
  `sportsml_blob` text DEFAULT NULL,
  `abstract` text DEFAULT NULL,
  `abstract_blob` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_doc_con_doc_id__doc_id` (`document_id`),
  CONSTRAINT `FK_doc_con_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document_fixtures`
--

DROP TABLE IF EXISTS `document_fixtures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_fixtures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fixture_key` varchar(100) DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `document_class_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_document_fixtures_1` (`fixture_key`),
  KEY `IDX_FK_doc_fix_doc_cla_id__doc_cla_id` (`document_class_id`),
  KEY `IDX_FK_doc_fix_pub_id__pub_id` (`publisher_id`),
  CONSTRAINT `FK_doc_fix_doc_cla_id__doc_cla_id` FOREIGN KEY (`document_class_id`) REFERENCES `document_classes` (`id`),
  CONSTRAINT `FK_doc_fix_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document_fixtures_events`
--

DROP TABLE IF EXISTS `document_fixtures_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_fixtures_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_fixture_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `latest_document_id` int(11) NOT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_doc_fix_eve_doc_fix_id__doc_fix_id` (`document_fixture_id`),
  KEY `IDX_FK_doc_fix_eve_eve_id__eve_id` (`event_id`),
  KEY `IDX_FK_doc_fix_eve_lat_doc_id__doc_id` (`latest_document_id`),
  CONSTRAINT `FK_doc_fix_eve_doc_fix_id__doc_fix_id` FOREIGN KEY (`document_fixture_id`) REFERENCES `document_fixtures` (`id`),
  CONSTRAINT `FK_doc_fix_eve_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_doc_fix_eve_lat_doc_id__doc_id` FOREIGN KEY (`latest_document_id`) REFERENCES `documents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document_package_entry`
--

DROP TABLE IF EXISTS `document_package_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_package_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_package_id` int(11) NOT NULL,
  `rank` varchar(100) DEFAULT NULL,
  `document_id` int(11) NOT NULL,
  `headline` varchar(100) DEFAULT NULL,
  `short_headline` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_doc_pac_ent_doc_pac_id__doc_pac_id` (`document_package_id`),
  KEY `FK_doc_pac_ent_doc_id__doc_id` (`document_id`),
  CONSTRAINT `FK_doc_pac_ent_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  CONSTRAINT `FK_doc_pac_ent_doc_pac_id__doc_pac_id` FOREIGN KEY (`document_package_id`) REFERENCES `document_packages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document_packages`
--

DROP TABLE IF EXISTS `document_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_key` varchar(100) DEFAULT NULL,
  `package_name` varchar(100) DEFAULT NULL,
  `date_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` varchar(75) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `revision_id` varchar(255) DEFAULT NULL,
  `stats_coverage` varchar(100) DEFAULT NULL,
  `document_fixture_id` int(11) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `db_loading_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_documents_1` (`doc_id`),
  KEY `IDX_documents_3` (`date_time`),
  KEY `IDX_documents_4` (`priority`),
  KEY `IDX_documents_5` (`revision_id`),
  KEY `IDX_FK_doc_doc_fix_id__doc_fix_id` (`document_fixture_id`),
  KEY `IDX_FK_doc_pub_id__pub_id` (`publisher_id`),
  KEY `IDX_FK_doc_sou_id__pub_id` (`source_id`),
  CONSTRAINT `FK_doc_doc_fix_id__doc_fix_id` FOREIGN KEY (`document_fixture_id`) REFERENCES `document_fixtures` (`id`),
  CONSTRAINT `FK_doc_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`),
  CONSTRAINT `FK_doc_sou_id__pub_id` FOREIGN KEY (`source_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documents_media`
--

DROP TABLE IF EXISTS `documents_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `media_caption_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_doc_med_med_cap_id__med_cap_id` (`media_caption_id`),
  KEY `FK_doc_med_med_id__med_id` (`media_id`),
  KEY `FK_doc_med_doc_id__doc_id` (`document_id`),
  CONSTRAINT `FK_doc_med_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  CONSTRAINT `FK_doc_med_med_cap_id__med_cap_id` FOREIGN KEY (`media_caption_id`) REFERENCES `media_captions` (`id`),
  CONSTRAINT `FK_doc_med_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_action_fouls`
--

DROP TABLE IF EXISTS `event_action_fouls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_action_fouls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_state_id` int(11) NOT NULL,
  `foul_name` varchar(100) DEFAULT NULL,
  `foul_result` varchar(100) DEFAULT NULL,
  `foul_type` varchar(100) DEFAULT NULL,
  `fouler_id` varchar(100) DEFAULT NULL,
  `recipient_type` varchar(100) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_event_states_event_action_fouls` (`event_state_id`),
  CONSTRAINT `FK_event_states_event_action_fouls` FOREIGN KEY (`event_state_id`) REFERENCES `event_states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_action_participants`
--

DROP TABLE IF EXISTS `event_action_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_action_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_state_id` int(11) NOT NULL,
  `event_action_play_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `participant_role` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_event_action_plays_event_action_participants` (`event_action_play_id`),
  KEY `FK_persons_event_action_participants` (`person_id`),
  KEY `FK_event_states_event_action_participants` (`event_state_id`),
  CONSTRAINT `FK_event_action_plays_event_action_participants` FOREIGN KEY (`event_action_play_id`) REFERENCES `event_action_plays` (`id`),
  CONSTRAINT `FK_event_states_event_action_participants` FOREIGN KEY (`event_state_id`) REFERENCES `event_states` (`id`),
  CONSTRAINT `FK_persons_event_action_participants` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_action_penalties`
--

DROP TABLE IF EXISTS `event_action_penalties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_action_penalties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_state_id` int(11) NOT NULL,
  `penalty_type` varchar(100) DEFAULT NULL,
  `penalty_level` varchar(100) DEFAULT NULL,
  `caution_level` varchar(100) DEFAULT NULL,
  `recipient_type` varchar(100) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_event_states_event_action_penalties` (`event_state_id`),
  CONSTRAINT `FK_event_states_event_action_penalties` FOREIGN KEY (`event_state_id`) REFERENCES `event_states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_action_plays`
--

DROP TABLE IF EXISTS `event_action_plays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_action_plays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_state_id` int(11) NOT NULL,
  `play_type` varchar(100) DEFAULT NULL,
  `score_attempt_type` varchar(100) DEFAULT NULL,
  `play_result` varchar(100) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_event_states_event_action_plays` (`event_state_id`),
  CONSTRAINT `FK_event_states_event_action_plays` FOREIGN KEY (`event_state_id`) REFERENCES `event_states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_action_substitutions`
--

DROP TABLE IF EXISTS `event_action_substitutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_action_substitutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_state_id` int(11) NOT NULL,
  `person_original_id` int(11) NOT NULL,
  `person_original_position_id` int(11) NOT NULL,
  `person_replacing_id` int(11) NOT NULL,
  `person_replacing_position_id` int(11) NOT NULL,
  `substitution_reason` varchar(100) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_persons_event_action_substitutions1` (`person_replacing_id`),
  KEY `FK_persons_event_action_substitutions` (`person_original_id`),
  KEY `FK_event_states_event_action_substitutions` (`event_state_id`),
  KEY `FK_positions_event_action_substitutions1` (`person_replacing_position_id`),
  KEY `FK_positions_event_action_substitutions` (`person_original_position_id`),
  CONSTRAINT `FK_event_states_event_action_substitutions` FOREIGN KEY (`event_state_id`) REFERENCES `event_states` (`id`),
  CONSTRAINT `FK_persons_event_action_substitutions` FOREIGN KEY (`person_original_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_persons_event_action_substitutions1` FOREIGN KEY (`person_replacing_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_positions_event_action_substitutions` FOREIGN KEY (`person_original_position_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `FK_positions_event_action_substitutions1` FOREIGN KEY (`person_replacing_position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_states`
--

DROP TABLE IF EXISTS `event_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `current_state` int(11) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `period_value` varchar(100) DEFAULT NULL,
  `period_time_elapsed` varchar(100) DEFAULT NULL,
  `period_time_remaining` varchar(100) DEFAULT NULL,
  `minutes_elapsed` varchar(100) DEFAULT NULL,
  `period_minutes_elapsed` varchar(100) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_events_event_states` (`event_id`),
  KEY `IDX_event_states_context` (`context`),
  KEY `IDX_event_states_seq_num` (`sequence_number`),
  CONSTRAINT `FK_events_event_states` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_key` varchar(100) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `site_alignment` varchar(100) DEFAULT NULL,
  `event_status` varchar(100) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `attendance` varchar(100) DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `event_number` varchar(32) DEFAULT NULL,
  `round_number` varchar(32) DEFAULT NULL,
  `time_certainty` varchar(100) DEFAULT NULL,
  `broadcast_listing` varchar(255) DEFAULT NULL,
  `start_date_time_local` datetime DEFAULT NULL,
  `medal_event` varchar(100) DEFAULT NULL,
  `series_index` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_events_1` (`event_key`),
  KEY `IDX_FK_eve_pub_id__pub_id` (`publisher_id`),
  KEY `IDX_FK_eve_sit_id__sit_id` (`site_id`),
  CONSTRAINT `FK_eve_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`),
  CONSTRAINT `FK_eve_sit_id__sit_id` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events_documents`
--

DROP TABLE IF EXISTS `events_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events_documents` (
  `event_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  KEY `FK_eve_doc_doc_id__doc_id` (`document_id`),
  KEY `FK_eve_doc_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_eve_doc_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  CONSTRAINT `FK_eve_doc_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events_media`
--

DROP TABLE IF EXISTS `events_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events_media` (
  `event_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  KEY `FK_eve_med_med_id__med_id` (`media_id`),
  KEY `FK_eve_med_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_eve_med_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_eve_med_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events_sub_seasons`
--

DROP TABLE IF EXISTS `events_sub_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events_sub_seasons` (
  `event_id` int(11) NOT NULL,
  `sub_season_id` int(11) NOT NULL,
  KEY `FK_eve_sub_sea_sub_sea_id__sub_sea_id` (`sub_season_id`),
  KEY `FK_eve_sub_sea_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_eve_sub_sea_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_eve_sub_sea_sub_sea_id__sub_sea_id` FOREIGN KEY (`sub_season_id`) REFERENCES `sub_seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ice_hockey_action_participants`
--

DROP TABLE IF EXISTS `ice_hockey_action_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ice_hockey_action_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `ice_hockey_action_play_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `participant_role` varchar(100) DEFAULT NULL,
  `point_credit` int(11) DEFAULT NULL,
  `goals_cumulative` int(11) DEFAULT NULL,
  `assists_cumulative` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ice_hockey_action_participants_team_id_teams_id` (`team_id`),
  KEY `FK_persons_ice_hockey_action_participants` (`person_id`),
  KEY `FK_ice_hockey_action_plays_ice_hockey_action_participants` (`ice_hockey_action_play_id`),
  CONSTRAINT `FK_ice_hockey_action_participants_team_id_teams_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `FK_ice_hockey_action_plays_ice_hockey_action_participants` FOREIGN KEY (`ice_hockey_action_play_id`) REFERENCES `ice_hockey_action_plays` (`id`),
  CONSTRAINT `FK_persons_ice_hockey_action_participants` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ice_hockey_action_plays`
--

DROP TABLE IF EXISTS `ice_hockey_action_plays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ice_hockey_action_plays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ice_hockey_event_state_id` int(11) NOT NULL,
  `play_key` varchar(100) DEFAULT NULL,
  `play_type` varchar(100) DEFAULT NULL,
  `score_attempt_type` varchar(100) DEFAULT NULL,
  `play_result` varchar(100) DEFAULT NULL,
  `penalty_type` varchar(100) DEFAULT NULL,
  `penalty_length` varchar(100) DEFAULT NULL,
  `penalty_code` varchar(100) DEFAULT NULL,
  `recipient_type` varchar(100) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `strength` varchar(100) DEFAULT NULL,
  `shootout_shot_order` int(11) DEFAULT NULL,
  `goal_order` int(11) DEFAULT NULL,
  `shot_type` varchar(100) DEFAULT NULL,
  `shot_distance` varchar(100) DEFAULT NULL,
  `goal_zone` varchar(100) DEFAULT NULL,
  `penalty_time_remaining` varchar(40) DEFAULT NULL,
  `location` varchar(40) DEFAULT NULL,
  `zone` varchar(40) DEFAULT NULL,
  `comment` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ice_hockey_event_states_ice_hockey_action_plays` (`ice_hockey_event_state_id`),
  CONSTRAINT `FK_ice_hockey_event_states_ice_hockey_action_plays` FOREIGN KEY (`ice_hockey_event_state_id`) REFERENCES `ice_hockey_event_states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ice_hockey_defensive_stats`
--

DROP TABLE IF EXISTS `ice_hockey_defensive_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ice_hockey_defensive_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goals_power_play_allowed` varchar(100) DEFAULT NULL,
  `goals_penalty_shot_allowed` varchar(100) DEFAULT NULL,
  `goals_empty_net_allowed` varchar(100) DEFAULT NULL,
  `goals_against_average` varchar(100) DEFAULT NULL,
  `goals_short_handed_allowed` varchar(100) DEFAULT NULL,
  `goals_shootout_allowed` varchar(100) DEFAULT NULL,
  `shots_power_play_allowed` varchar(100) DEFAULT NULL,
  `shots_penalty_shot_allowed` varchar(100) DEFAULT NULL,
  `shots_blocked` varchar(100) DEFAULT NULL,
  `saves` varchar(100) DEFAULT NULL,
  `save_percentage` varchar(100) DEFAULT NULL,
  `penalty_killing_amount` varchar(100) DEFAULT NULL,
  `penalty_killing_percentage` varchar(100) DEFAULT NULL,
  `takeaways` varchar(100) DEFAULT NULL,
  `shutouts` varchar(100) DEFAULT NULL,
  `minutes_penalty_killing` varchar(100) DEFAULT NULL,
  `hits` varchar(100) DEFAULT NULL,
  `shots_shootout_allowed` varchar(100) DEFAULT NULL,
  `goaltender_wins` int(11) DEFAULT NULL,
  `goaltender_losses` int(11) DEFAULT NULL,
  `goaltender_ties` int(11) DEFAULT NULL,
  `goals_allowed` int(11) DEFAULT NULL,
  `shots_allowed` int(11) DEFAULT NULL,
  `player_count` int(11) DEFAULT NULL,
  `player_count_opposing` int(11) DEFAULT NULL,
  `goaltender_wins_overtime` int(11) DEFAULT NULL,
  `goaltender_losses_overtime` int(11) DEFAULT NULL,
  `goals_overtime_allowed` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ice_hockey_event_states`
--

DROP TABLE IF EXISTS `ice_hockey_event_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ice_hockey_event_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `power_play_team_id` int(11) DEFAULT NULL,
  `event_id` int(11) NOT NULL,
  `current_state` tinyint(4) DEFAULT NULL,
  `period_value` varchar(100) DEFAULT NULL,
  `period_time_elapsed` varchar(100) DEFAULT NULL,
  `period_time_remaining` varchar(100) DEFAULT NULL,
  `record_type` varchar(40) DEFAULT NULL,
  `power_play_player_advantage` int(11) DEFAULT NULL,
  `score_team` int(11) DEFAULT NULL,
  `score_team_opposing` int(11) DEFAULT NULL,
  `score_team_home` int(11) DEFAULT NULL,
  `score_team_away` int(11) DEFAULT NULL,
  `action_key` varchar(100) DEFAULT NULL,
  `sequence_number` varchar(100) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ice_hoc_eve_sta_eve_id__eve_id` (`event_id`),
  KEY `FK_hockey_event_states_power_play_team_id_teams_id` (`power_play_team_id`),
  KEY `IDX_ice_hockey_event_states_context` (`context`),
  KEY `IDX_ice_hockey_event_states_seq_num` (`sequence_number`),
  CONSTRAINT `FK_hockey_event_states_power_play_team_id_teams_id` FOREIGN KEY (`power_play_team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `FK_ice_hoc_eve_sta_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ice_hockey_faceoff_stats`
--

DROP TABLE IF EXISTS `ice_hockey_faceoff_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ice_hockey_faceoff_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_count` int(11) DEFAULT NULL,
  `player_count_opposing` int(11) DEFAULT NULL,
  `faceoff_wins` int(11) DEFAULT NULL,
  `faceoff_losses` int(11) DEFAULT NULL,
  `faceoff_win_percentage` decimal(5,2) DEFAULT NULL,
  `faceoffs_power_play_wins` int(11) DEFAULT NULL,
  `faceoffs_power_play_losses` int(11) DEFAULT NULL,
  `faceoffs_power_play_win_percentage` decimal(5,2) DEFAULT NULL,
  `faceoffs_short_handed_wins` int(11) DEFAULT NULL,
  `faceoffs_short_handed_losses` int(11) DEFAULT NULL,
  `faceoffs_short_handed_win_percentage` decimal(5,2) DEFAULT NULL,
  `faceoffs_even_strength_wins` int(11) DEFAULT NULL,
  `faceoffs_even_strength_losses` int(11) DEFAULT NULL,
  `faceoffs_even_strength_win_percentage` decimal(5,2) DEFAULT NULL,
  `faceoffs_offensive_zone_wins` int(11) DEFAULT NULL,
  `faceoffs_offensive_zone_losses` int(11) DEFAULT NULL,
  `faceoffs_offensive_zone_win_percentage` decimal(5,2) DEFAULT NULL,
  `faceoffs_defensive_zone_wins` int(11) DEFAULT NULL,
  `faceoffs_defensive_zone_losses` int(11) DEFAULT NULL,
  `faceoffs_defensive_zone_win_percentage` decimal(5,2) DEFAULT NULL,
  `faceoffs_neutral_zone_wins` int(11) DEFAULT NULL,
  `faceoffs_neutral_zone_losses` int(11) DEFAULT NULL,
  `faceoffs_neutral_zone_win_percentage` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ice_hockey_offensive_stats`
--

DROP TABLE IF EXISTS `ice_hockey_offensive_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ice_hockey_offensive_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `giveaways` varchar(100) DEFAULT NULL,
  `goals` int(11) DEFAULT NULL,
  `goals_game_winning` varchar(100) DEFAULT NULL,
  `goals_game_tying` varchar(100) DEFAULT NULL,
  `goals_power_play` varchar(100) DEFAULT NULL,
  `goals_short_handed` varchar(100) DEFAULT NULL,
  `goals_even_strength` varchar(100) DEFAULT NULL,
  `goals_empty_net` varchar(100) DEFAULT NULL,
  `goals_overtime` varchar(100) DEFAULT NULL,
  `goals_shootout` varchar(100) DEFAULT NULL,
  `goals_penalty_shot` varchar(100) DEFAULT NULL,
  `assists` varchar(100) DEFAULT NULL,
  `shots` int(11) DEFAULT NULL,
  `shots_penalty_shot_taken` varchar(100) DEFAULT NULL,
  `shots_penalty_shot_missed` varchar(100) DEFAULT NULL,
  `shots_penalty_shot_percentage` varchar(100) DEFAULT NULL,
  `shots_missed` int(11) DEFAULT NULL,
  `shots_blocked` int(11) DEFAULT NULL,
  `shots_power_play` int(11) DEFAULT NULL,
  `shots_short_handed` int(11) DEFAULT NULL,
  `shots_even_strength` int(11) DEFAULT NULL,
  `points` varchar(100) DEFAULT NULL,
  `power_play_amount` varchar(100) DEFAULT NULL,
  `power_play_percentage` varchar(100) DEFAULT NULL,
  `minutes_power_play` varchar(100) DEFAULT NULL,
  `faceoff_wins` varchar(100) DEFAULT NULL,
  `faceoff_losses` varchar(100) DEFAULT NULL,
  `faceoff_win_percentage` varchar(100) DEFAULT NULL,
  `scoring_chances` varchar(100) DEFAULT NULL,
  `player_count` int(11) DEFAULT NULL,
  `player_count_opposing` int(11) DEFAULT NULL,
  `assists_game_winning` int(11) DEFAULT NULL,
  `assists_overtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ice_hockey_player_stats`
--

DROP TABLE IF EXISTS `ice_hockey_player_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ice_hockey_player_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plus_minus` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ice_hockey_time_on_ice_stats`
--

DROP TABLE IF EXISTS `ice_hockey_time_on_ice_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ice_hockey_time_on_ice_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_count` int(11) DEFAULT NULL,
  `player_count_opposing` int(11) DEFAULT NULL,
  `shifts` int(11) DEFAULT NULL,
  `time_total` varchar(40) DEFAULT NULL,
  `time_power_play` varchar(40) DEFAULT NULL,
  `time_short_handed` varchar(40) DEFAULT NULL,
  `time_even_strength` varchar(40) DEFAULT NULL,
  `time_empty_net` varchar(40) DEFAULT NULL,
  `time_power_play_empty_net` varchar(40) DEFAULT NULL,
  `time_short_handed_empty_net` varchar(40) DEFAULT NULL,
  `time_even_strength_empty_net` varchar(40) DEFAULT NULL,
  `time_average_per_shift` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `injury_phases`
--

DROP TABLE IF EXISTS `injury_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `injury_phases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `injury_status` varchar(100) DEFAULT NULL,
  `injury_type` varchar(100) DEFAULT NULL,
  `injury_comment` varchar(100) DEFAULT NULL,
  `disabled_list` varchar(100) DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `season_id` int(11) DEFAULT NULL,
  `phase_type` varchar(100) DEFAULT NULL,
  `injury_side` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_inj_pha_per_id__per_id` (`person_id`),
  KEY `IDX_FK_inj_pha_sea_id__sea_id` (`season_id`),
  KEY `IDX_injury_phases_2` (`injury_status`),
  KEY `IDX_injury_phases_3` (`start_date_time`),
  KEY `IDX_injury_phases_4` (`end_date_time`),
  CONSTRAINT `FK_inj_pha_per_id__per_id` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_inj_pha_sea_id__sea_id` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `key_aliases`
--

DROP TABLE IF EXISTS `key_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `key_aliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_id` int(11) NOT NULL,
  `key_root_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_key_roots_key_aliases` (`key_root_id`),
  KEY `IDX_key_aliases_2` (`key_id`),
  CONSTRAINT `FK_key_roots_key_aliases` FOREIGN KEY (`key_root_id`) REFERENCES `key_roots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `key_roots`
--

DROP TABLE IF EXISTS `key_roots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `key_roots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_key_aliases_1` (`key_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `latest_revisions`
--

DROP TABLE IF EXISTS `latest_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `latest_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_id` varchar(255) NOT NULL,
  `latest_document_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_lat_rev_lat_doc_id__doc_id` (`latest_document_id`),
  KEY `IDX_latest_revisions_1` (`revision_id`),
  CONSTRAINT `FK_lat_rev_lat_doc_id__doc_id` FOREIGN KEY (`latest_document_id`) REFERENCES `documents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `timezone` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `country_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_locations_1` (`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `revision_id` int(11) DEFAULT NULL,
  `media_type` varchar(100) DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  `date_time` varchar(100) DEFAULT NULL,
  `credit_id` int(11) NOT NULL,
  `db_loading_date_time` datetime DEFAULT NULL,
  `creation_location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_med_cre_id__per_id` (`credit_id`),
  KEY `FK_med_pub_id__pub_id` (`publisher_id`),
  KEY `FK_med_cre_loc_id__loc_id` (`creation_location_id`),
  CONSTRAINT `FK_med_cre_id__per_id` FOREIGN KEY (`credit_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_med_cre_loc_id__loc_id` FOREIGN KEY (`creation_location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_med_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media_captions`
--

DROP TABLE IF EXISTS `media_captions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_captions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL,
  `caption_type` varchar(100) DEFAULT NULL,
  `caption` varchar(100) DEFAULT NULL,
  `caption_author_id` int(11) NOT NULL,
  `language` varchar(100) DEFAULT NULL,
  `caption_size` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_med_cap_med_id__med_id` (`media_id`),
  KEY `FK_med_cap_cap_aut_id__per_id` (`caption_author_id`),
  CONSTRAINT `FK_med_cap_cap_aut_id__per_id` FOREIGN KEY (`caption_author_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_med_cap_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media_contents`
--

DROP TABLE IF EXISTS `media_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL,
  `object` varchar(100) DEFAULT NULL,
  `format` varchar(100) DEFAULT NULL,
  `mime_type` varchar(100) DEFAULT NULL,
  `height` varchar(100) DEFAULT NULL,
  `width` varchar(100) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `file_size` varchar(100) DEFAULT NULL,
  `resolution` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_med_con_med_id__med_id` (`media_id`),
  CONSTRAINT `FK_med_con_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media_keywords`
--

DROP TABLE IF EXISTS `media_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) DEFAULT NULL,
  `media_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_med_key_med_id__med_id` (`media_id`),
  CONSTRAINT `FK_med_key_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `motor_racing_event_states`
--

DROP TABLE IF EXISTS `motor_racing_event_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motor_racing_event_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `current_state` tinyint(4) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `lap` varchar(100) DEFAULT NULL,
  `laps_remaining` varchar(100) DEFAULT NULL,
  `time_elapsed` varchar(100) DEFAULT NULL,
  `flag_state` varchar(100) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_events_motor_racing_event_states` (`event_id`),
  KEY `IDX_motor_racing_event_states_context` (`context`),
  KEY `IDX_motor_racing_event_states_seq_num` (`sequence_number`),
  CONSTRAINT `FK_mot_rac_eve_sta_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `motor_racing_event_stats`
--

DROP TABLE IF EXISTS `motor_racing_event_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motor_racing_event_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `speed_average` decimal(6,3) DEFAULT NULL,
  `speed_units` varchar(40) DEFAULT NULL,
  `margin_of_victory` decimal(6,3) DEFAULT NULL,
  `caution_flags` int(11) DEFAULT NULL,
  `caution_flags_laps` int(11) DEFAULT NULL,
  `lead_changes` int(11) DEFAULT NULL,
  `lead_changes_drivers` int(11) DEFAULT NULL,
  `laps_total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `motor_racing_qualifying_stats`
--

DROP TABLE IF EXISTS `motor_racing_qualifying_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motor_racing_qualifying_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid` varchar(100) DEFAULT NULL,
  `pole_position` varchar(100) DEFAULT NULL,
  `pole_wins` varchar(100) DEFAULT NULL,
  `qualifying_speed` varchar(100) DEFAULT NULL,
  `qualifying_speed_units` varchar(100) DEFAULT NULL,
  `qualifying_time` varchar(100) DEFAULT NULL,
  `qualifying_position` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `motor_racing_race_stats`
--

DROP TABLE IF EXISTS `motor_racing_race_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motor_racing_race_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time_behind_leader` varchar(100) DEFAULT NULL,
  `laps_behind_leader` varchar(100) DEFAULT NULL,
  `time_ahead_follower` varchar(100) DEFAULT NULL,
  `laps_ahead_follower` varchar(100) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  `points` varchar(100) DEFAULT NULL,
  `points_rookie` varchar(100) DEFAULT NULL,
  `bonus` varchar(100) DEFAULT NULL,
  `laps_completed` varchar(100) DEFAULT NULL,
  `laps_leading_total` varchar(100) DEFAULT NULL,
  `distance_leading` varchar(100) DEFAULT NULL,
  `distance_completed` varchar(100) DEFAULT NULL,
  `distance_units` varchar(40) DEFAULT NULL,
  `speed_average` varchar(40) DEFAULT NULL,
  `speed_units` varchar(40) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL,
  `finishes_top_5` varchar(40) DEFAULT NULL,
  `finishes_top_10` varchar(40) DEFAULT NULL,
  `starts` varchar(40) DEFAULT NULL,
  `finishes` varchar(40) DEFAULT NULL,
  `non_finishes` varchar(40) DEFAULT NULL,
  `wins` varchar(40) DEFAULT NULL,
  `races_leading` varchar(40) DEFAULT NULL,
  `money` varchar(40) DEFAULT NULL,
  `money_units` varchar(40) DEFAULT NULL,
  `leads_total` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `outcome_totals`
--

DROP TABLE IF EXISTS `outcome_totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outcome_totals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `standing_subgroup_id` int(11) NOT NULL,
  `outcome_holder_type` varchar(100) DEFAULT NULL,
  `outcome_holder_id` int(11) DEFAULT NULL,
  `rank` varchar(100) DEFAULT NULL,
  `wins` varchar(100) DEFAULT NULL,
  `losses` varchar(100) DEFAULT NULL,
  `ties` varchar(100) DEFAULT NULL,
  `wins_overtime` int(11) DEFAULT NULL,
  `losses_overtime` int(11) DEFAULT NULL,
  `undecideds` varchar(100) DEFAULT NULL,
  `winning_percentage` varchar(100) DEFAULT NULL,
  `points_scored_for` varchar(100) DEFAULT NULL,
  `points_scored_against` varchar(100) DEFAULT NULL,
  `points_difference` varchar(100) DEFAULT NULL,
  `standing_points` varchar(100) DEFAULT NULL,
  `streak_type` varchar(100) DEFAULT NULL,
  `streak_duration` varchar(100) DEFAULT NULL,
  `streak_total` varchar(100) DEFAULT NULL,
  `streak_start` datetime DEFAULT NULL,
  `streak_end` datetime DEFAULT NULL,
  `events_played` int(11) DEFAULT NULL,
  `games_back` varchar(100) DEFAULT NULL,
  `result_effect` varchar(100) DEFAULT NULL,
  `sets_against` varchar(100) DEFAULT NULL,
  `sets_for` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_out_tot_sta_sub_id__sta_sub_id` (`standing_subgroup_id`),
  CONSTRAINT `FK_out_tot_sta_sub_id__sta_sub_id` FOREIGN KEY (`standing_subgroup_id`) REFERENCES `standing_subgroups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `participants_events`
--

DROP TABLE IF EXISTS `participants_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participants_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_type` varchar(100) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `alignment` varchar(100) DEFAULT NULL,
  `score` varchar(100) DEFAULT NULL,
  `event_outcome` varchar(100) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `result_effect` varchar(100) DEFAULT NULL,
  `score_attempts` int(11) DEFAULT NULL,
  `sort_order` varchar(100) DEFAULT NULL,
  `score_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_par_eve_eve_id__eve_id` (`event_id`),
  KEY `IDX_participants_events_1` (`participant_type`),
  KEY `IDX_participants_events_2` (`participant_id`),
  KEY `IDX_participants_events_3` (`alignment`),
  KEY `IDX_participants_events_4` (`event_outcome`),
  CONSTRAINT `FK_par_eve_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `penalty_stats`
--

DROP TABLE IF EXISTS `penalty_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penalty_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `periods`
--

DROP TABLE IF EXISTS `periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_event_id` int(11) NOT NULL,
  `period_value` varchar(100) DEFAULT NULL,
  `score` varchar(100) DEFAULT NULL,
  `score_attempts` int(11) DEFAULT NULL,
  `rank` varchar(100) DEFAULT NULL,
  `sub_score_key` varchar(100) DEFAULT NULL,
  `sub_score_type` varchar(100) DEFAULT NULL,
  `sub_score_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_per_par_eve_id__par_eve_id` (`participant_event_id`),
  CONSTRAINT `FK_per_par_eve_id__par_eve_id` FOREIGN KEY (`participant_event_id`) REFERENCES `participants_events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `person_event_metadata`
--

DROP TABLE IF EXISTS `person_event_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_event_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `health` varchar(100) DEFAULT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `lineup_slot` int(11) DEFAULT NULL,
  `lineup_slot_sequence` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_per_eve_met_eve_id__eve_id` (`event_id`),
  KEY `IDX_FK_per_eve_met_per_id__per_id` (`person_id`),
  KEY `IDX_FK_per_eve_met_pos_id__pos_id` (`position_id`),
  KEY `IDX_FK_per_eve_met_rol_id__rol_id` (`role_id`),
  KEY `IDX_FK_teams_person_event_metadata` (`team_id`),
  KEY `IDX_person_event_metadata_1` (`status`),
  CONSTRAINT `FK_per_eve_met_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_per_eve_met_per_id__per_id` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_per_eve_met_pos_id__pos_id` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `FK_per_eve_met_rol_id__rol_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_per_eve_met_tea_id__tea_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `person_phases`
--

DROP TABLE IF EXISTS `person_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_phases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `membership_type` varchar(40) NOT NULL,
  `membership_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `role_status` varchar(40) DEFAULT NULL,
  `phase_status` varchar(40) DEFAULT NULL,
  `uniform_number` varchar(20) DEFAULT NULL,
  `regular_position_id` int(11) DEFAULT NULL,
  `regular_position_depth` varchar(40) DEFAULT NULL,
  `height` varchar(100) DEFAULT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `start_season_id` int(11) DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `end_season_id` int(11) DEFAULT NULL,
  `entry_reason` varchar(40) DEFAULT NULL,
  `exit_reason` varchar(40) DEFAULT NULL,
  `selection_level` int(11) DEFAULT NULL,
  `selection_sublevel` int(11) DEFAULT NULL,
  `selection_overall` int(11) DEFAULT NULL,
  `duration` varchar(32) DEFAULT NULL,
  `phase_type` varchar(40) DEFAULT NULL,
  `subphase_type` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_per_pha_rol_id__rol_id` (`role_id`),
  KEY `FK_per_pha_sta_sea_id__sea_id` (`start_season_id`),
  KEY `FK_per_pha_end_sea_id__sea_id` (`end_season_id`),
  KEY `IDX_FK_per_pha_per_id__per_id` (`person_id`),
  KEY `IDX_FK_per_pha_reg_pos_id__pos_id` (`regular_position_id`),
  KEY `IDX_person_phases_1` (`membership_type`),
  KEY `IDX_person_phases_2` (`membership_id`),
  KEY `IDX_person_phases_3` (`phase_status`),
  CONSTRAINT `FK_per_pha_end_sea_id__sea_id` FOREIGN KEY (`end_season_id`) REFERENCES `seasons` (`id`),
  CONSTRAINT `FK_per_pha_per_id__per_id` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_per_pha_reg_pos_id__pos_id` FOREIGN KEY (`regular_position_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `FK_per_pha_rol_id__rol_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_per_pha_sta_sea_id__sea_id` FOREIGN KEY (`start_season_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_key` varchar(100) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `birth_date` varchar(30) DEFAULT NULL,
  `death_date` varchar(30) DEFAULT NULL,
  `final_resting_location_id` int(11) DEFAULT NULL,
  `birth_location_id` int(11) DEFAULT NULL,
  `hometown_location_id` int(11) DEFAULT NULL,
  `residence_location_id` int(11) DEFAULT NULL,
  `death_location_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_persons_final_resting_location_id_locations_id` (`final_resting_location_id`),
  KEY `FK_per_bir_loc_id__loc_id` (`birth_location_id`),
  KEY `FK_per_dea_loc_id__loc_id` (`death_location_id`),
  KEY `FK_per_res_loc_id__loc_id` (`residence_location_id`),
  KEY `FK_per_hom_loc_id__loc_id` (`hometown_location_id`),
  KEY `IDX_FK_per_pub_id__pub_id` (`publisher_id`),
  KEY `IDX_persons_1` (`person_key`),
  CONSTRAINT `FK_per_bir_loc_id__loc_id` FOREIGN KEY (`birth_location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_per_dea_loc_id__loc_id` FOREIGN KEY (`death_location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_per_hom_loc_id__loc_id` FOREIGN KEY (`hometown_location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_per_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`),
  CONSTRAINT `FK_per_res_loc_id__loc_id` FOREIGN KEY (`residence_location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_persons_final_resting_location_id_locations_id` FOREIGN KEY (`final_resting_location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `persons_documents`
--

DROP TABLE IF EXISTS `persons_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons_documents` (
  `person_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  KEY `FK_per_doc_per_id__per_id` (`person_id`),
  KEY `FK_per_doc_doc_id__doc_id` (`document_id`),
  CONSTRAINT `FK_per_doc_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  CONSTRAINT `FK_per_doc_per_id__per_id` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `persons_media`
--

DROP TABLE IF EXISTS `persons_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons_media` (
  `person_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  KEY `FK_per_med_med_id__med_id` (`media_id`),
  KEY `FK_per_med_per_id__per_id` (`person_id`),
  CONSTRAINT `FK_per_med_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `FK_per_med_per_id__per_id` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliation_id` int(11) NOT NULL,
  `abbreviation` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_pos_aff_id__aff_id` (`affiliation_id`),
  KEY `IDX_positions_1` (`abbreviation`),
  CONSTRAINT `FK_pos_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publishers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_key` varchar(100) NOT NULL,
  `publisher_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_publishers_1` (`publisher_key`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rankings`
--

DROP TABLE IF EXISTS `rankings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rankings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_fixture_id` int(11) DEFAULT NULL,
  `participant_type` varchar(100) DEFAULT NULL,
  `participant_id` int(11) DEFAULT NULL,
  `issuer` varchar(100) DEFAULT NULL,
  `ranking_type` varchar(100) DEFAULT NULL,
  `ranking_value` varchar(100) DEFAULT NULL,
  `ranking_value_previous` varchar(100) DEFAULT NULL,
  `date_coverage_type` varchar(100) DEFAULT NULL,
  `date_coverage_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_type` varchar(100) DEFAULT NULL,
  `participant_id` int(11) DEFAULT NULL,
  `record_type` varchar(100) DEFAULT NULL,
  `record_label` varchar(100) DEFAULT NULL,
  `record_value` varchar(100) DEFAULT NULL,
  `previous_value` varchar(100) DEFAULT NULL,
  `date_coverage_type` varchar(100) DEFAULT NULL,
  `date_coverage_id` int(11) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_key` varchar(100) NOT NULL,
  `role_name` varchar(100) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_roles_1` (`role_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_key` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `league_id` int(11) DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_sea_lea_id__aff_id` (`league_id`),
  KEY `IDX_FK_sea_pub_id__pub_id` (`publisher_id`),
  KEY `IDX_seasons_1` (`season_key`),
  CONSTRAINT `FK_sea_lea_id__aff_id` FOREIGN KEY (`league_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_sea_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_key` varchar(128) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_sit_loc_id__loc_id` (`location_id`),
  KEY `IDX_FK_sit_pub_id__pub_id` (`publisher_id`),
  KEY `IDX_sites_1` (`site_key`),
  CONSTRAINT `FK_sit_loc_id__loc_id` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_sit_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `soccer_action_fouls`
--

DROP TABLE IF EXISTS `soccer_action_fouls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soccer_action_fouls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `soccer_event_state_id` int(11) NOT NULL,
  `foul_name` varchar(100) DEFAULT NULL,
  `foul_result` varchar(100) DEFAULT NULL,
  `foul_type` varchar(100) DEFAULT NULL,
  `fouler_id` varchar(100) DEFAULT NULL,
  `recipient_type` varchar(100) DEFAULT NULL,
  `recipient_id` int(11) NOT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_soccer_event_states_soccer_action_fouls` (`soccer_event_state_id`),
  KEY `FK_persons_soccer_action_fouls` (`recipient_id`),
  CONSTRAINT `FK_persons_soccer_action_fouls` FOREIGN KEY (`recipient_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_soccer_event_states_soccer_action_fouls` FOREIGN KEY (`soccer_event_state_id`) REFERENCES `soccer_event_states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `soccer_action_participants`
--

DROP TABLE IF EXISTS `soccer_action_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soccer_action_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `soccer_action_play_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `participant_role` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_soccer_action_plays_soccer_action_participants` (`soccer_action_play_id`),
  KEY `FK_persons_soccer_action_participants` (`person_id`),
  CONSTRAINT `FK_persons_soccer_action_participants` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_soccer_action_plays_soccer_action_participants` FOREIGN KEY (`soccer_action_play_id`) REFERENCES `soccer_action_plays` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `soccer_action_penalties`
--

DROP TABLE IF EXISTS `soccer_action_penalties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soccer_action_penalties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `soccer_event_state_id` int(11) NOT NULL,
  `penalty_type` varchar(100) DEFAULT NULL,
  `penalty_level` varchar(100) DEFAULT NULL,
  `caution_value` varchar(100) DEFAULT NULL,
  `recipient_type` varchar(100) DEFAULT NULL,
  `recipient_id` int(11) NOT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_soccer_event_states_soccer_action_penalties` (`soccer_event_state_id`),
  KEY `FK_persons_soccer_action_penalties` (`recipient_id`),
  CONSTRAINT `FK_persons_soccer_action_penalties` FOREIGN KEY (`recipient_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_soccer_event_states_soccer_action_penalties` FOREIGN KEY (`soccer_event_state_id`) REFERENCES `soccer_event_states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `soccer_action_plays`
--

DROP TABLE IF EXISTS `soccer_action_plays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soccer_action_plays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `soccer_event_state_id` int(11) NOT NULL,
  `play_type` varchar(100) DEFAULT NULL,
  `score_attempt_type` varchar(100) DEFAULT NULL,
  `play_result` varchar(100) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_soccer_event_states_soccer_action_plays` (`soccer_event_state_id`),
  CONSTRAINT `FK_soccer_event_states_soccer_action_plays` FOREIGN KEY (`soccer_event_state_id`) REFERENCES `soccer_event_states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `soccer_action_substitutions`
--

DROP TABLE IF EXISTS `soccer_action_substitutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soccer_action_substitutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `soccer_event_state_id` int(11) NOT NULL,
  `person_type` varchar(100) DEFAULT NULL,
  `person_original_id` int(11) NOT NULL,
  `person_original_position_id` int(11) DEFAULT NULL,
  `person_replacing_id` int(11) NOT NULL,
  `person_replacing_position_id` int(11) DEFAULT NULL,
  `substitution_reason` varchar(100) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_soccer_event_states_soccer_action_substitutions` (`soccer_event_state_id`),
  KEY `FK_persons_soccer_action_substitutions` (`person_original_id`),
  KEY `FK_persons_soccer_action_substitutions1` (`person_replacing_id`),
  KEY `FK_positions_soccer_action_substitutions` (`person_original_position_id`),
  KEY `FK_positions_soccer_action_substitutions1` (`person_replacing_position_id`),
  CONSTRAINT `FK_persons_soccer_action_substitutions` FOREIGN KEY (`person_original_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_persons_soccer_action_substitutions1` FOREIGN KEY (`person_replacing_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_positions_soccer_action_substitutions` FOREIGN KEY (`person_original_position_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `FK_positions_soccer_action_substitutions1` FOREIGN KEY (`person_replacing_position_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `FK_soccer_event_states_soccer_action_substitutions` FOREIGN KEY (`soccer_event_state_id`) REFERENCES `soccer_event_states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `soccer_defensive_stats`
--

DROP TABLE IF EXISTS `soccer_defensive_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soccer_defensive_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shots_penalty_shot_allowed` varchar(100) DEFAULT NULL,
  `goals_penalty_shot_allowed` varchar(100) DEFAULT NULL,
  `goals_against_average` varchar(100) DEFAULT NULL,
  `goals_against_total` varchar(100) DEFAULT NULL,
  `saves` varchar(100) DEFAULT NULL,
  `save_percentage` varchar(100) DEFAULT NULL,
  `catches_punches` varchar(100) DEFAULT NULL,
  `shots_on_goal_total` varchar(100) DEFAULT NULL,
  `shots_shootout_total` varchar(100) DEFAULT NULL,
  `shots_shootout_allowed` varchar(100) DEFAULT NULL,
  `shots_blocked` varchar(100) DEFAULT NULL,
  `shutouts` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `soccer_event_states`
--

DROP TABLE IF EXISTS `soccer_event_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soccer_event_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `current_state` tinyint(4) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `period_value` varchar(100) DEFAULT NULL,
  `period_time_elapsed` varchar(100) DEFAULT NULL,
  `period_time_remaining` varchar(100) DEFAULT NULL,
  `minutes_elapsed` varchar(100) DEFAULT NULL,
  `period_minute_elapsed` varchar(100) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_events_soccer_event_states` (`event_id`),
  KEY `IDX_soccer_event_states_context` (`context`),
  KEY `IDX_soccer_event_states_seq_num` (`sequence_number`),
  CONSTRAINT `FK_soc_eve_sta_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `soccer_foul_stats`
--

DROP TABLE IF EXISTS `soccer_foul_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soccer_foul_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fouls_suffered` varchar(100) DEFAULT NULL,
  `fouls_commited` varchar(100) DEFAULT NULL,
  `cautions_total` varchar(100) DEFAULT NULL,
  `cautions_pending` varchar(100) DEFAULT NULL,
  `caution_points_total` varchar(100) DEFAULT NULL,
  `caution_points_pending` varchar(100) DEFAULT NULL,
  `ejections_total` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `soccer_offensive_stats`
--

DROP TABLE IF EXISTS `soccer_offensive_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soccer_offensive_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goals_game_winning` varchar(100) DEFAULT NULL,
  `goals_game_tying` varchar(100) DEFAULT NULL,
  `goals_overtime` varchar(100) DEFAULT NULL,
  `goals_shootout` varchar(100) DEFAULT NULL,
  `goals_total` varchar(100) DEFAULT NULL,
  `assists_game_winning` varchar(100) DEFAULT NULL,
  `assists_game_tying` varchar(100) DEFAULT NULL,
  `assists_overtime` varchar(100) DEFAULT NULL,
  `assists_total` varchar(100) DEFAULT NULL,
  `points` varchar(100) DEFAULT NULL,
  `shots_total` varchar(100) DEFAULT NULL,
  `shots_on_goal_total` varchar(100) DEFAULT NULL,
  `shots_hit_frame` varchar(100) DEFAULT NULL,
  `shots_penalty_shot_taken` varchar(100) DEFAULT NULL,
  `shots_penalty_shot_scored` varchar(100) DEFAULT NULL,
  `shots_penalty_shot_missed` varchar(40) DEFAULT NULL,
  `shots_penalty_shot_percentage` varchar(40) DEFAULT NULL,
  `shots_shootout_taken` varchar(40) DEFAULT NULL,
  `shots_shootout_scored` varchar(40) DEFAULT NULL,
  `shots_shootout_missed` varchar(40) DEFAULT NULL,
  `shots_shootout_percentage` varchar(40) DEFAULT NULL,
  `giveaways` varchar(40) DEFAULT NULL,
  `offsides` varchar(40) DEFAULT NULL,
  `corner_kicks` varchar(40) DEFAULT NULL,
  `hat_tricks` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sports_property`
--

DROP TABLE IF EXISTS `sports_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sports_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sports_property_type` varchar(100) DEFAULT NULL,
  `sports_property_id` int(11) DEFAULT NULL,
  `formal_name` varchar(100) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `standing_subgroups`
--

DROP TABLE IF EXISTS `standing_subgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `standing_subgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `standing_id` int(11) NOT NULL,
  `affiliation_id` int(11) NOT NULL,
  `alignment_scope` varchar(100) DEFAULT NULL,
  `competition_scope` varchar(100) DEFAULT NULL,
  `competition_scope_id` varchar(100) DEFAULT NULL,
  `duration_scope` varchar(100) DEFAULT NULL,
  `scoping_label` varchar(100) DEFAULT NULL,
  `site_scope` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sta_sub_sta_id__sta_id` (`standing_id`),
  KEY `FK_sta_sub_aff_id__aff_id` (`affiliation_id`),
  CONSTRAINT `FK_sta_sub_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_sta_sub_sta_id__sta_id` FOREIGN KEY (`standing_id`) REFERENCES `standings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `standings`
--

DROP TABLE IF EXISTS `standings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `standings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliation_id` int(11) NOT NULL,
  `standing_type` varchar(100) DEFAULT NULL,
  `sub_season_id` int(11) NOT NULL,
  `last_updated` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sta_aff_id__aff_id` (`affiliation_id`),
  KEY `FK_sta_sub_sea_id__sub_sea_id` (`sub_season_id`),
  CONSTRAINT `FK_sta_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_sta_sub_sea_id__sub_sea_id` FOREIGN KEY (`sub_season_id`) REFERENCES `sub_seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_repository_type` varchar(100) DEFAULT NULL,
  `stat_repository_id` int(11) NOT NULL,
  `stat_holder_type` varchar(100) DEFAULT NULL,
  `stat_holder_id` int(11) DEFAULT NULL,
  `stat_coverage_type` varchar(100) DEFAULT NULL,
  `stat_coverage_id` int(11) DEFAULT NULL,
  `stat_membership_type` varchar(40) DEFAULT NULL,
  `stat_membership_id` int(11) DEFAULT NULL,
  `context` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_stats_1` (`stat_repository_type`),
  KEY `IDX_stats_2` (`stat_repository_id`),
  KEY `IDX_stats_3` (`stat_holder_type`),
  KEY `IDX_stats_4` (`stat_holder_id`),
  KEY `IDX_stats_5` (`stat_coverage_type`),
  KEY `IDX_stats_6` (`stat_coverage_id`),
  KEY `IDX_stats_7` (`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub_periods`
--

DROP TABLE IF EXISTS `sub_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_periods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period_id` int(11) NOT NULL,
  `sub_period_value` varchar(100) DEFAULT NULL,
  `score` varchar(100) DEFAULT NULL,
  `score_attempts` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_sub_per_per_id__per_id` (`period_id`),
  CONSTRAINT `FK_sub_per_per_id__per_id` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub_seasons`
--

DROP TABLE IF EXISTS `sub_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_seasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_season_key` varchar(100) NOT NULL,
  `season_id` int(11) NOT NULL,
  `sub_season_type` varchar(100) NOT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_sub_sea_sea_id__sea_id` (`season_id`),
  KEY `IDX_sub_seasons_1` (`sub_season_key`),
  KEY `IDX_sub_seasons_2` (`sub_season_type`),
  CONSTRAINT `FK_sub_sea_sea_id__sea_id` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `swimmer_stats`
--

DROP TABLE IF EXISTS `swimmer_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swimmer_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` tinyint(3) unsigned NOT NULL,
  `speed` float unsigned NOT NULL,
  `points` float unsigned NOT NULL,
  `stroke_count` int(10) unsigned NOT NULL,
  `swim_time` time NOT NULL,
  `avg_heartrate` float NOT NULL,
  `distance_per_stroke` float unsigned NOT NULL,
  `event_identity` int(11) NOT NULL,
  `person_identity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_identity_idx` (`event_identity`),
  KEY `person_identity_idx` (`person_identity`),
  CONSTRAINT `event_identity` FOREIGN KEY (`event_identity`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `person_identity` FOREIGN KEY (`person_identity`) REFERENCES `persons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `swimming_disqualified`
--

DROP TABLE IF EXISTS `swimming_disqualified`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swimming_disqualified` (
  `reason` mediumtext NOT NULL,
  `play_type_disqualified_id` int(11) NOT NULL,
  KEY `play_type_num_id_idx` (`play_type_disqualified_id`),
  CONSTRAINT `play_type_disqualified_id` FOREIGN KEY (`play_type_disqualified_id`) REFERENCES `swimming_play_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `swimming_event_states`
--

DROP TABLE IF EXISTS `swimming_event_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swimming_event_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_nr` int(10) unsigned NOT NULL,
  `time_elapsed` time NOT NULL,
  `person_1` varchar(100) NOT NULL,
  `person_2` varchar(100) DEFAULT NULL,
  `current_race_state` varchar(45) NOT NULL,
  `play_type_id` int(11) NOT NULL,
  `event_iden` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `play_type_id_idx` (`play_type_id`),
  KEY `event_iden_idx` (`event_iden`),
  CONSTRAINT `event_iden` FOREIGN KEY (`event_iden`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `play_type_id` FOREIGN KEY (`play_type_id`) REFERENCES `swimming_play_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `swimming_finish`
--

DROP TABLE IF EXISTS `swimming_finish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swimming_finish` (
  `points_gained` int(10) unsigned NOT NULL,
  `play_type_finish_id` int(11) NOT NULL,
  KEY `play_type_identity_idx` (`play_type_finish_id`),
  CONSTRAINT `play_type_finish_id` FOREIGN KEY (`play_type_finish_id`) REFERENCES `swimming_play_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `swimming_overtake`
--

DROP TABLE IF EXISTS `swimming_overtake`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swimming_overtake` (
  `new_position` int(11) NOT NULL,
  `old_position` int(11) NOT NULL,
  `play_type_overtake_id` int(11) NOT NULL,
  KEY `play_type_number_idx` (`play_type_overtake_id`),
  CONSTRAINT `play_type_overtake_id` FOREIGN KEY (`play_type_overtake_id`) REFERENCES `swimming_play_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `swimming_play_type`
--

DROP TABLE IF EXISTS `swimming_play_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swimming_play_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `swimming_start`
--

DROP TABLE IF EXISTS `swimming_start`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swimming_start` (
  `start_position` int(11) NOT NULL,
  `play_type_start_id` int(11) NOT NULL,
  KEY `play_type_idnum_idx` (`play_type_start_id`),
  CONSTRAINT `play_type_start_id` FOREIGN KEY (`play_type_start_id`) REFERENCES `swimming_play_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `swimming_stats_of_events`
--

DROP TABLE IF EXISTS `swimming_stats_of_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swimming_stats_of_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_place` int(11) NOT NULL,
  `second_place` int(11) NOT NULL,
  `third_place` int(11) NOT NULL,
  `no_swimmers` int(11) NOT NULL,
  `swim_style` varchar(45) NOT NULL,
  `distance` int(11) NOT NULL,
  `no_finished` int(11) NOT NULL,
  `race_time` time NOT NULL,
  `event_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_number_idx` (`event_number`),
  CONSTRAINT `event_number` FOREIGN KEY (`event_number`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `swimming_team_members`
--

DROP TABLE IF EXISTS `swimming_team_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swimming_team_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `swimmer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id_idx` (`team_id`),
  KEY `swimmer_id_idx` (`swimmer_id`),
  CONSTRAINT `swimmer_id` FOREIGN KEY (`swimmer_id`) REFERENCES `persons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `swimming_team_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `swimming_team_stats`
--

DROP TABLE IF EXISTS `swimming_team_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swimming_team_stats` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `points` int(11) NOT NULL,
  `max_points` int(11) NOT NULL,
  `best_time` time NOT NULL,
  `worst_time` time NOT NULL,
  `event_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id_idx` (`event_id`),
  KEY `team_id_idx` (`team_id`),
  CONSTRAINT `event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `team_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `swimming_teams`
--

DROP TABLE IF EXISTS `swimming_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swimming_teams` (
  `team_number` int(11) NOT NULL,
  `series_id` int(11) NOT NULL,
  KEY `team_id_idx` (`team_number`),
  KEY `series_index_idx` (`series_id`),
  CONSTRAINT `series_id` FOREIGN KEY (`series_id`) REFERENCES `swimming_tournament` (`series_index`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `team_number` FOREIGN KEY (`team_number`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `swimming_tournament`
--

DROP TABLE IF EXISTS `swimming_tournament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swimming_tournament` (
  `series_index` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `end_date` date NOT NULL,
  `location` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `winner` int(11) DEFAULT NULL,
  PRIMARY KEY (`series_index`),
  KEY `tournament_site_id_idx` (`location`),
  CONSTRAINT `tournament_site_id` FOREIGN KEY (`location`) REFERENCES `sites` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `team_phases`
--

DROP TABLE IF EXISTS `team_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_phases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `start_season_id` int(11) DEFAULT NULL,
  `end_season_id` int(11) DEFAULT NULL,
  `affiliation_id` int(11) NOT NULL,
  `start_date_time` varchar(100) DEFAULT NULL,
  `end_date_time` varchar(100) DEFAULT NULL,
  `phase_status` varchar(40) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tea_aff_pha_rol_id__rol_id` (`role_id`),
  KEY `FK_tea_aff_pha_end_sea_id__sea_id` (`end_season_id`),
  KEY `FK_tea_aff_pha_sta_sea_id__sea_id` (`start_season_id`),
  KEY `FK_tea_aff_pha_aff_id__aff_id` (`affiliation_id`),
  KEY `FK_tea_aff_pha_tea_id__tea_id` (`team_id`),
  CONSTRAINT `FK_tea_aff_pha_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_tea_aff_pha_end_sea_id__sea_id` FOREIGN KEY (`end_season_id`) REFERENCES `seasons` (`id`),
  CONSTRAINT `FK_tea_aff_pha_rol_id__rol_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_tea_aff_pha_sta_sea_id__sea_id` FOREIGN KEY (`start_season_id`) REFERENCES `seasons` (`id`),
  CONSTRAINT `FK_tea_aff_pha_tea_id__tea_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_key` varchar(100) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `home_site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tea_pub_id__pub_id` (`publisher_id`),
  KEY `FK_tea_hom_sit_id__sit_id` (`home_site_id`),
  KEY `IDX_teams_team_key` (`team_key`),
  CONSTRAINT `FK_tea_hom_sit_id__sit_id` FOREIGN KEY (`home_site_id`) REFERENCES `sites` (`id`),
  CONSTRAINT `FK_tea_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teams_documents`
--

DROP TABLE IF EXISTS `teams_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams_documents` (
  `team_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  KEY `FK_tea_doc_tea_id__tea_id` (`team_id`),
  KEY `FK_tea_doc_doc_id__doc_id` (`document_id`),
  CONSTRAINT `FK_tea_doc_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  CONSTRAINT `FK_tea_doc_tea_id__tea_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teams_media`
--

DROP TABLE IF EXISTS `teams_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams_media` (
  `team_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  KEY `FK_tea_med_med_id__med_id` (`media_id`),
  KEY `FK_tea_med_tea_id__tea_id` (`team_id`),
  CONSTRAINT `FK_tea_med_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `FK_tea_med_tea_id__tea_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tennis_action_points`
--

DROP TABLE IF EXISTS `tennis_action_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tennis_action_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_period_id` varchar(100) DEFAULT NULL,
  `sequence_number` varchar(100) DEFAULT NULL,
  `win_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tennis_action_volleys`
--

DROP TABLE IF EXISTS `tennis_action_volleys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tennis_action_volleys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_number` varchar(100) DEFAULT NULL,
  `tennis_action_points_id` int(11) DEFAULT NULL,
  `landing_location` varchar(100) DEFAULT NULL,
  `swing_type` varchar(100) DEFAULT NULL,
  `result` varchar(100) DEFAULT NULL,
  `spin_type` varchar(100) DEFAULT NULL,
  `trajectory_details` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tennis_event_states`
--

DROP TABLE IF EXISTS `tennis_event_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tennis_event_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `current_state` tinyint(4) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `tennis_set` varchar(100) DEFAULT NULL,
  `game` varchar(100) DEFAULT NULL,
  `server_person_id` int(11) DEFAULT NULL,
  `server_score` varchar(100) DEFAULT NULL,
  `receiver_person_id` int(11) DEFAULT NULL,
  `receiver_score` varchar(100) DEFAULT NULL,
  `service_number` varchar(100) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_events_tennis_event_states` (`event_id`),
  KEY `IDX_tennis_event_states_context` (`context`),
  KEY `IDX_tennis_event_states_seq_num` (`sequence_number`),
  CONSTRAINT `FK_ten_eve_sta_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tennis_player_stats`
--

DROP TABLE IF EXISTS `tennis_player_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tennis_player_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `net_points_won` int(11) DEFAULT NULL,
  `net_points_played` int(11) DEFAULT NULL,
  `points_won` int(11) DEFAULT NULL,
  `winners` int(11) DEFAULT NULL,
  `unforced_errors` int(11) DEFAULT NULL,
  `winners_forehand` int(11) DEFAULT NULL,
  `winners_backhand` int(11) DEFAULT NULL,
  `winners_volley` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tennis_return_stats`
--

DROP TABLE IF EXISTS `tennis_return_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tennis_return_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `returns_played` int(11) DEFAULT NULL,
  `matches_played` int(11) DEFAULT NULL,
  `first_service_return_points_won` int(11) DEFAULT NULL,
  `first_service_return_points_won_pct` int(11) DEFAULT NULL,
  `second_service_return_points_won` int(11) DEFAULT NULL,
  `second_service_return_points_won_pct` int(11) DEFAULT NULL,
  `return_games_played` int(11) DEFAULT NULL,
  `return_games_won` int(11) DEFAULT NULL,
  `return_games_won_pct` int(11) DEFAULT NULL,
  `break_points_played` int(11) DEFAULT NULL,
  `break_points_converted` int(11) DEFAULT NULL,
  `break_points_converted_pct` int(11) DEFAULT NULL,
  `net_points_won` int(11) DEFAULT NULL,
  `net_points_played` int(11) DEFAULT NULL,
  `points_won` int(11) DEFAULT NULL,
  `winners` int(11) DEFAULT NULL,
  `unforced_errors` int(11) DEFAULT NULL,
  `winners_forehand` int(11) DEFAULT NULL,
  `winners_backhand` int(11) DEFAULT NULL,
  `winners_volley` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tennis_service_stats`
--

DROP TABLE IF EXISTS `tennis_service_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tennis_service_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `services_played` int(11) DEFAULT NULL,
  `matches_played` int(11) DEFAULT NULL,
  `aces` int(11) DEFAULT NULL,
  `first_services_good` int(11) DEFAULT NULL,
  `first_services_good_pct` int(11) DEFAULT NULL,
  `first_service_points_won` int(11) DEFAULT NULL,
  `first_service_points_won_pct` int(11) DEFAULT NULL,
  `second_service_points_won` int(11) DEFAULT NULL,
  `second_service_points_won_pct` int(11) DEFAULT NULL,
  `service_games_played` int(11) DEFAULT NULL,
  `service_games_won` int(11) DEFAULT NULL,
  `service_games_won_pct` int(11) DEFAULT NULL,
  `break_points_played` int(11) DEFAULT NULL,
  `break_points_saved` int(11) DEFAULT NULL,
  `break_points_saved_pct` int(11) DEFAULT NULL,
  `service_points_won` int(11) DEFAULT NULL,
  `service_points_won_pct` int(11) DEFAULT NULL,
  `double_faults` int(11) DEFAULT NULL,
  `first_service_top_speed` varchar(100) DEFAULT NULL,
  `second_services_good` int(11) DEFAULT NULL,
  `second_services_good_pct` int(11) DEFAULT NULL,
  `second_service_top_speed` varchar(100) DEFAULT NULL,
  `net_points_won` int(11) DEFAULT NULL,
  `net_points_played` int(11) DEFAULT NULL,
  `points_won` int(11) DEFAULT NULL,
  `winners` int(11) DEFAULT NULL,
  `unforced_errors` int(11) DEFAULT NULL,
  `winners_forehand` int(11) DEFAULT NULL,
  `winners_backhand` int(11) DEFAULT NULL,
  `winners_volley` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tennis_set_stats`
--

DROP TABLE IF EXISTS `tennis_set_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tennis_set_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `net_points_won` int(11) DEFAULT NULL,
  `net_points_played` int(11) DEFAULT NULL,
  `points_won` int(11) DEFAULT NULL,
  `winners` int(11) DEFAULT NULL,
  `unforced_errors` int(11) DEFAULT NULL,
  `winners_forehand` int(11) DEFAULT NULL,
  `winners_backhand` int(11) DEFAULT NULL,
  `winners_volley` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tennis_team_stats`
--

DROP TABLE IF EXISTS `tennis_team_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tennis_team_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `net_points_won` int(11) DEFAULT NULL,
  `net_points_played` int(11) DEFAULT NULL,
  `points_won` int(11) DEFAULT NULL,
  `winners` int(11) DEFAULT NULL,
  `unforced_errors` int(11) DEFAULT NULL,
  `winners_forehand` int(11) DEFAULT NULL,
  `winners_backhand` int(11) DEFAULT NULL,
  `winners_volley` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `email` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  PRIMARY KEY (`email`),
  KEY `users_publisher_id_idx` (`publisher_id`),
  CONSTRAINT `users_publisher_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wagering_moneylines`
--

DROP TABLE IF EXISTS `wagering_moneylines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagering_moneylines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `rotation_key` varchar(100) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `vigorish` varchar(100) DEFAULT NULL,
  `line` varchar(100) DEFAULT NULL,
  `line_opening` varchar(100) DEFAULT NULL,
  `prediction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_wag_mon_boo_id__boo_id` (`bookmaker_id`),
  KEY `FK_wag_mon_tea_id__tea_id` (`team_id`),
  KEY `FK_wag_mon_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_wag_mon_boo_id__boo_id` FOREIGN KEY (`bookmaker_id`) REFERENCES `bookmakers` (`id`),
  CONSTRAINT `FK_wag_mon_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_wag_mon_tea_id__tea_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wagering_odds_lines`
--

DROP TABLE IF EXISTS `wagering_odds_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagering_odds_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `rotation_key` varchar(100) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `numerator` varchar(100) DEFAULT NULL,
  `denominator` varchar(100) DEFAULT NULL,
  `prediction` varchar(100) DEFAULT NULL,
  `payout_calculation` varchar(100) DEFAULT NULL,
  `payout_amount` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_wag_odd_lin_tea_id__tea_id` (`team_id`),
  KEY `FK_wag_odd_lin_eve_id__eve_id` (`event_id`),
  KEY `FK_wag_odd_lin_boo_id__boo_id` (`bookmaker_id`),
  CONSTRAINT `FK_wag_odd_lin_boo_id__boo_id` FOREIGN KEY (`bookmaker_id`) REFERENCES `bookmakers` (`id`),
  CONSTRAINT `FK_wag_odd_lin_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_wag_odd_lin_tea_id__tea_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wagering_runlines`
--

DROP TABLE IF EXISTS `wagering_runlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagering_runlines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `rotation_key` varchar(100) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `vigorish` varchar(100) DEFAULT NULL,
  `line` varchar(100) DEFAULT NULL,
  `line_opening` varchar(100) DEFAULT NULL,
  `line_value` varchar(100) DEFAULT NULL,
  `prediction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_wag_run_boo_id__boo_id` (`bookmaker_id`),
  KEY `FK_wag_run_tea_id__tea_id` (`team_id`),
  KEY `FK_wag_run_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_wag_run_boo_id__boo_id` FOREIGN KEY (`bookmaker_id`) REFERENCES `bookmakers` (`id`),
  CONSTRAINT `FK_wag_run_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_wag_run_tea_id__tea_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wagering_straight_spread_lines`
--

DROP TABLE IF EXISTS `wagering_straight_spread_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagering_straight_spread_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `rotation_key` varchar(100) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `vigorish` varchar(100) DEFAULT NULL,
  `line_value` varchar(100) DEFAULT NULL,
  `line_value_opening` varchar(100) DEFAULT NULL,
  `prediction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_wag_str_spr_lin_tea_id__tea_id` (`team_id`),
  KEY `FK_wag_str_spr_lin_eve_id__eve_id` (`event_id`),
  KEY `FK_wag_str_spr_lin_boo_id__boo_id` (`bookmaker_id`),
  CONSTRAINT `FK_wag_str_spr_lin_boo_id__boo_id` FOREIGN KEY (`bookmaker_id`) REFERENCES `bookmakers` (`id`),
  CONSTRAINT `FK_wag_str_spr_lin_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_wag_str_spr_lin_tea_id__tea_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wagering_total_score_lines`
--

DROP TABLE IF EXISTS `wagering_total_score_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagering_total_score_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `rotation_key` varchar(100) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `vigorish` varchar(100) DEFAULT NULL,
  `line_over` varchar(100) DEFAULT NULL,
  `line_under` varchar(100) DEFAULT NULL,
  `total` varchar(100) DEFAULT NULL,
  `total_opening` varchar(100) DEFAULT NULL,
  `prediction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_wag_tot_sco_lin_boo_id__boo_id` (`bookmaker_id`),
  KEY `FK_wag_tot_sco_lin_eve_id__eve_id` (`event_id`),
  KEY `FK_wag_tot_sco_lin_tea_id__tea_id` (`team_id`),
  CONSTRAINT `FK_wag_tot_sco_lin_boo_id__boo_id` FOREIGN KEY (`bookmaker_id`) REFERENCES `bookmakers` (`id`),
  CONSTRAINT `FK_wag_tot_sco_lin_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_wag_tot_sco_lin_tea_id__tea_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weather_conditions`
--

DROP TABLE IF EXISTS `weather_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weather_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `temperature` varchar(100) DEFAULT NULL,
  `temperature_units` varchar(40) DEFAULT NULL,
  `humidity` varchar(100) DEFAULT NULL,
  `clouds` varchar(100) DEFAULT NULL,
  `wind_direction` varchar(100) DEFAULT NULL,
  `wind_velocity` varchar(100) DEFAULT NULL,
  `weather_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_wea_con_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_wea_con_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'sportsdb'
--

--
-- Dumping routines for database 'sportsdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-02 22:57:09
