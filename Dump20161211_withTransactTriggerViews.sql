-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: localhost    Database: art_registrar
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent` (
  `agent_id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_lname` varchar(20) DEFAULT NULL,
  `agent_fname` varchar(20) DEFAULT NULL,
  `agent_altname` varchar(200) DEFAULT NULL,
  `agent_url` text,
  `agent_email` varchar(100) DEFAULT NULL,
  `agent_phone` varchar(20) DEFAULT NULL,
  `agent_city` varchar(20) DEFAULT NULL,
  `agent_state` varchar(2) DEFAULT NULL,
  `agent_street1` varchar(50) DEFAULT NULL,
  `agent_street2` varchar(50) DEFAULT NULL,
  `agent_postalcode` varchar(20) DEFAULT NULL,
  `agent_country` varchar(20) DEFAULT NULL,
  `agent_addedinfo` varchar(400) DEFAULT NULL,
  `agent_knownas` varchar(200) GENERATED ALWAYS AS ((case when (`agent_altname` = '') then concat(`agent_lname`,', ',`agent_fname`) else (case when (`agent_lname` = '') then `agent_altname` else concat(`agent_lname`,', ',`agent_fname`,' ','(AKA, ',`agent_altname`,')') end) end)) VIRTUAL,
  PRIMARY KEY (`agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` (`agent_id`, `agent_lname`, `agent_fname`, `agent_altname`, `agent_url`, `agent_email`, `agent_phone`, `agent_city`, `agent_state`, `agent_street1`, `agent_street2`, `agent_postalcode`, `agent_country`, `agent_addedinfo`) VALUES (1,'Baade','Carrie','','http://carrieannbaade.com','carrie@carrieannbaade.com','3028978126','Tallahassee','FL','2778 Summer Meadow Lane','','32303','USA',''),(2,'Ballen','Roger','','http://www.rogerballen.com/','info@rogerballen.com','27 11 482 5401','Johannesburg','','PO Box 87396','Houghton 2041','','South Africa',''),(3,'Brodka','Michel','','http://www.michalbrodka.com/','redpyramids@yahoo.com','','','NJ','','','','USA',''),(4,'Cleff','Steve','','http://fluidbeauty.com/','stevecleff@gmail.com','','Philadelphia','PA','','','','USA',''),(5,'Conte','Christopher','','http://microbotic.org','DEATHCOM4@aol.com','516-567-0657','','NY','','','','USA',''),(6,'DeLeon','Cam','','http://happypencil.com','cam@happypencil.com','','','CA','','','','USA',''),(7,'Devon','Zelda','','','','','Los Angeles','CA','','','','USA','Part of Teetering Bulb'),(8,'Drexl','Caryn','','http://www.caryndrexl.com/','contact@caryndrexl.com','','Hickory','NC','','','','USA',''),(9,'Euclide','Gregory','','http://www.gregoryeuclide.com','geuclide@gmail.com','','Minneapolis','MN','','','','USA',''),(10,'Faerber','Jeff','','http://www.jefffaerber.com/','jsfaerber@yahoo.com','','Brooklyn','NY','','','','USA',''),(11,'Foisy','Katelan','','http://www.katelanfoisy.com/','katelanfoisy@gmail.com','','Chicago','IL','','','','USA',''),(12,'Gargon','Heather','','','heathergargon@gmail.com','','','NJ','','','','USA',''),(13,'Graf','Christina','','http://xinagraf.wordpress.com/','xinagraf@gmail.com','','Brooklyn','NY','','','','USA',''),(14,'Hackett','Caitlin','','http://www.caitlinhackett.com/','hackett.caitlin1@gmail.com','','','CA','','','','USA',''),(15,'Huggins','Kurt','','http://www.kurthuggins.com/','kurt@teeteringbulb.com','','Brooklyn','NY','','','','USA','Part of Teetering Bulb'),(16,'Hunt','Seldon','','http://www.seldonhunt.com/','seldonhunt@seldonhunt.com','3474204950','Brooklyn','NY','133 Dahill Rd #2','','11218','USA',''),(17,'Hush','Jeremy','','http://hushillustration.blogspot.com/','runlikehell2000@yahoo.com','','Philadelphia','PA','','','','USA',''),(18,'Kahan','Max','','http://maxkahan.com/','max@maxkahan.com','4155331163','Brooklyn','NY','56 Graham Ave, 3R','','11206','USA',''),(19,'Karolczak','Caitlin','','studiosilenti.com','karo0019@umn.edu','','','','','','','USA',''),(20,'Kraiza','Robert','','www.robertkraiza.com','rkraiza@gmail.com','6103575728','Philadelphia','PA','714 N. Franklin St. Apt. 2R','','19123','USA',''),(21,'Leonov','Yuri','','http://yurileonov.com/','leonov_yuri@yahoo.com','','Brooklyn','NY','','','','USA',''),(22,'Louie','Travis','','https://web.archive.org/web/20160801094051/http://www.travislouieart.com/','travislouie37@gmail.com','845-399-4393','Red Hook','NY','','','','USA',''),(23,'Maykut','Amber','','www.hoardaculture.com','amberjol@gmail.com','6462700464','Brooklyn','NY','','','','USA',''),(24,'McCormack','Caitlin','','http://caitlintmccormack.com','caitlin@caitlintmccormack.com','','','','','','','USA',''),(25,'Menna','Juliana','','http://www.juliannamenna.com/','juliannamenna@yahoo.com','6094336736','Bordentown','NJ','309 Prince St.','','08505','USA',''),(26,'Motorcycle','Michael','','https://www.michaelmichaelmotorcycle.com/','info@michaelmichaelmotorcycle.com','','','','','','','USA',''),(27,'Myaing','Tun','','http://www.tunmyaing.com/','tmyaing01@gmail.com','','Brooklyn','NY','','','','USA',''),(28,'Nestor','Buddy','','http://buddynestorartwork.com/','budnestor@gmail.com ','','','NJ','','','','USA',''),(29,'Nix Turner','Nicomi','','http://nicominixturner.com/','contact@nicominixturner.com','5103256514','','CA','','','','USA',''),(30,'Ouellette','Dan','','','dan.m.ouellette@gmail.com','','','NY','','','','USA',''),(31,'Pontius','Anthony','','http://www.moberginventory.com/category/anthony-pontius/','teeohinwhy@yahoo.com','','Brooklyn','NY','','','','USA',''),(32,'Romano','Paul','','http://workhardened.com/','paul@workhardened.com','','Philadelphia','PA','','','','USA',''),(33,'Rota','Matt','','http://www.mattrotasart.com/','rotamatt@hotmail.com','','Brooklyn','NY','','','','USA',''),(34,'Sommers','Allison','','http://www.allisonsommers.com/','allison.sommers@gmail.com','','Brooklyn','NY','','','','USA',''),(35,'Wandelmaier','Kurt','','https://www.behance.net/KurtW','kewandel@att.net','','','CT','','','','USA',''),(36,'Williams','Zoe','','http://zoewilliams.net/','interestingzoe@gmail.com','5044811237','New York','NY','49 E. 12th Street Apt. 4E','','10003','USA',''),(37,'','','Teetering Bulb','','','','Brooklyn','NY','','','','USA',''),(38,'Levesque','Jason','Stuntkid','http://www.stuntkid.com/','jason@stuntkid.com','','','','','','','USA',''),(39,'Hochbaum','David','','http://www.davidhochbaum.com/','davidhochbaum@gmail.com','','','MA','','','','USA',''),(40,'Levin','Samantha','Binnorie','http://samanthalevinfineart.com','binnorie@gmail.com','','Brooklyn','NY','','','11226','USA','Curator'),(41,'Ezzo','Danielle','','http://www.danielleezzo.com','d.ezzoster@gmail.com','','Brooklyn','NY','','','','USA',''),(42,'Zar','Chet','','','','','','','','','','',''),(43,'Mars','Chris','','','','','','','','','','',''),(44,'Rex Van Minnen','Christian','','','','','Brooklyn','NY','','','','',''),(45,'McGrath','Elizabeth','','','','','','','','','','',''),(46,'Simkins','Greg','','','','','','','','','','',''),(47,'Taillefer','Heidi','','','','','','','','','','',''),(48,'Joslin','Jessica','','','','','','','','','','',''),(49,'Schaechter','Judith','','','','','','','','','','',''),(50,'Clark','Kate','','','','','Brooklyn','NY','','','','',''),(51,'Olivas','Kathie','','','','','','','','','','',''),(52,'Boehmer','Kelly','','','','','','','','','','',''),(53,'Kuksi','Kris','','','','','','','','','','',''),(54,'Hogin','Laurie','','','','','','','','','','',''),(55,'Lipton','Laurie','','','','','','','','','','',''),(56,'Field','Lori','','','','','','','','','','',''),(57,'Peck','Marion','','','','','','','','','','',''),(58,'Hosford','Mark','','','','','','','','','','',''),(59,'Wittfooth','Martin','','','','','Brooklyn','NY','','','','',''),(60,'Caesar','Ray','','','','','','','','','','',''),(61,'A. Kirk','Richard','','','','','','','','','','',''),(62,'C. Brooks','Scott','','','','','','','','','','',''),(63,'Woodruff','Thomas','','','','','Brooklyn','NY','','','','',''),(64,'Cummings','Timothy','','','','','','','','','','',''),(65,'Ryden ','Mark ','','http://www.markryden.com/','news@markryden.com','','Los Angeles','','','','','USA',''),(66,'Klanten','Robert',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `artist_state_perc`
--

DROP TABLE IF EXISTS `artist_state_perc`;
/*!50001 DROP VIEW IF EXISTS `artist_state_perc`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `artist_state_perc` AS SELECT 
 1 AS `Artist State %`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `coll_to_agent`
--

DROP TABLE IF EXISTS `coll_to_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coll_to_agent` (
  `coll_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`coll_id`,`agent_id`),
  KEY `agent_id` (`agent_id`),
  CONSTRAINT `coll_to_agent_ibfk_1` FOREIGN KEY (`coll_id`) REFERENCES `collection` (`coll_id`) ON UPDATE CASCADE,
  CONSTRAINT `coll_to_agent_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coll_to_agent`
--

LOCK TABLES `coll_to_agent` WRITE;
/*!40000 ALTER TABLE `coll_to_agent` DISABLE KEYS */;
INSERT INTO `coll_to_agent` VALUES (1,40,'Curator'),(2,40,'Curator'),(3,2,'Creator'),(4,40,'Curator'),(4,41,'Curator'),(6,66,'author');
/*!40000 ALTER TABLE `coll_to_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coll_to_imagerep`
--

DROP TABLE IF EXISTS `coll_to_imagerep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coll_to_imagerep` (
  `coll_id` int(11) NOT NULL,
  `img_id` int(11) NOT NULL,
  PRIMARY KEY (`coll_id`,`img_id`),
  KEY `img_id` (`img_id`),
  CONSTRAINT `coll_to_imagerep_ibfk_1` FOREIGN KEY (`coll_id`) REFERENCES `collection` (`coll_id`) ON UPDATE CASCADE,
  CONSTRAINT `coll_to_imagerep_ibfk_2` FOREIGN KEY (`img_id`) REFERENCES `image_rep` (`img_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coll_to_imagerep`
--

LOCK TABLES `coll_to_imagerep` WRITE;
/*!40000 ALTER TABLE `coll_to_imagerep` DISABLE KEYS */;
INSERT INTO `coll_to_imagerep` VALUES (4,44),(1,45),(3,46),(6,53);
/*!40000 ALTER TABLE `coll_to_imagerep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection` (
  `coll_id` int(11) NOT NULL AUTO_INCREMENT,
  `coll_title` varchar(200) DEFAULT NULL,
  `coll_year` year(4) DEFAULT NULL,
  `coll_path` text,
  `rights_id` int(11) NOT NULL,
  PRIMARY KEY (`coll_id`),
  UNIQUE KEY `rights_id` (`rights_id`),
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`rights_id`) REFERENCES `rights_set` (`rights_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES (1,'Realms of the Unreal',2015,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',45),(2,'Binnorie',NULL,'',44),(3,'Boarding House',2009,'http://web.archive.org/web/20160413063539/http://www.rogerballen.com/boarding-house',30),(4,'The Little Death',2009,'',47),(5,'Cute and Creepy Exhibition Catalog',2013,'http://web.archive.org/web/20121116014353/http://www.washington.edu/uwpress/search/books/BAACUT.html',48),(6,'The Upset',2008,'http://www.worldcat.org/title/upset-young-contemporary-art/oclc/228358626&referer=brief_results',53);
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colltype`
--

DROP TABLE IF EXISTS `colltype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colltype` (
  `colltype_id` int(11) NOT NULL AUTO_INCREMENT,
  `colltype_name` varchar(100) NOT NULL,
  PRIMARY KEY (`colltype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colltype`
--

LOCK TABLES `colltype` WRITE;
/*!40000 ALTER TABLE `colltype` DISABLE KEYS */;
INSERT INTO `colltype` VALUES (1,'exhibition'),(2,'private collection'),(3,'artist series'),(4,'publication');
/*!40000 ALTER TABLE `colltype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colltype_to_coll`
--

DROP TABLE IF EXISTS `colltype_to_coll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colltype_to_coll` (
  `coll_id` int(11) NOT NULL,
  `colltype_id` int(11) NOT NULL,
  PRIMARY KEY (`coll_id`,`colltype_id`),
  KEY `colltype_id` (`colltype_id`),
  CONSTRAINT `colltype_to_coll_ibfk_1` FOREIGN KEY (`coll_id`) REFERENCES `collection` (`coll_id`) ON UPDATE CASCADE,
  CONSTRAINT `colltype_to_coll_ibfk_2` FOREIGN KEY (`colltype_id`) REFERENCES `colltype` (`colltype_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colltype_to_coll`
--

LOCK TABLES `colltype_to_coll` WRITE;
/*!40000 ALTER TABLE `colltype_to_coll` DISABLE KEYS */;
INSERT INTO `colltype_to_coll` VALUES (1,1),(4,1),(2,2),(3,3),(5,4),(6,4);
/*!40000 ALTER TABLE `colltype_to_coll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_rep`
--

DROP TABLE IF EXISTS `image_rep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_rep` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `img_path` text,
  `img_year` year(4) DEFAULT NULL,
  `img_addedinfo` varchar(400) DEFAULT NULL,
  `rights_id` int(11) NOT NULL,
  PRIMARY KEY (`img_id`),
  UNIQUE KEY `rights_id` (`rights_id`),
  CONSTRAINT `image_rep_ibfk_1` FOREIGN KEY (`rights_id`) REFERENCES `rights_set` (`rights_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_rep`
--

LOCK TABLES `image_rep` WRITE;
/*!40000 ALTER TABLE `image_rep` DISABLE KEYS */;
INSERT INTO `image_rep` VALUES (1,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',72),(2,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',73),(3,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',74),(4,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',75),(5,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',76),(6,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',77),(7,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',78),(8,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',79),(9,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',80),(10,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',81),(11,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',82),(12,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',83),(13,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',84),(14,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',85),(15,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',86),(16,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',87),(17,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',88),(18,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',89),(19,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',90),(20,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',91),(21,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',92),(22,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',93),(23,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',94),(24,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'IMG_PATH links to a gallery page displaying multiple art images of the exhibition titled Realms of the Unreal. Ideally, PURLs of each image should be included for each image, but this works for now. This link is the same as the one used for the Collection/Exhibition entry',95),(25,'https://web.archive.org/web/20080628210556/http://carrieannbaade.com/gallery-wanted.html',2005,'',96),(26,'https://web.archive.org/web/20090522110200/http://www.carrieannbaade.com/gallery-devil.html',2006,'',97),(27,'https://web.archive.org/web/20090522110200/http://www.carrieannbaade.com/gallery-devil.html',2006,'',98),(28,'https://web.archive.org/web/20160816191310/http://www.gregoryeuclide.com/prints/',2014,'',99),(29,'https://web.archive.org/web/20161023162201/http://www.teeteringbulb.com/',2008,'The Internet Archive does not currently have this individual artwork archived. The archived URL provided leads to a page that contains the image. ',100),(30,'http://web.archive.org/web/20160413063539/http://www.rogerballen.com/boarding-house',2005,'IMG_PATH entered here is the same as the one entered for the Boarding House collection.',101),(31,'http://web.archive.org/web/20161105112027/http://www.caryndrexl.com/portfolio_pieces.html',2012,'',102),(33,'http://web.archive.org/web/20140903032827/http://samanthalevinfineart.com/caitlin-hacketts-in-memory-limited-edition-prints/',2013,'',103),(34,'https://web.archive.org/save/_embed/http://samanthalevinfineart.com/wp-content/uploads/2009/12/hackett_undergrowth.jpg',2009,'',105),(35,'',NULL,'',106),(36,'https://web.archive.org/save/_embed/http://samanthalevinfineart.com/wp-content/uploads/2009/12/mask-alt2.jpg',NULL,'',107),(37,'',NULL,'',108),(38,'https://web.archive.org/web/20161103141557/http://microbotic.org/Store.htm',NULL,'',109),(39,'https://web.archive.org/web/20161014183922/http://buddynestorartwork.com/art_gallery',NULL,'',110),(40,'https://web.archive.org/web/20161113032507/http://www.moberginventory.com/work/pandagram-sam/',NULL,'',111),(41,'https://web.archive.org/web/20161113033127/http://www.happypencil.com/store.phtml?itemId=131&gid=3',NULL,'',112),(42,'',NULL,'',113),(43,'',NULL,'',114),(44,'https://perma.cc/U5HD-DK69',2009,'IMG_PATH links to a Flickr page displaying multiple installation images of the exhibition The Little Deaths. Ideally, PURLs of each image should be listed separately. Could not archive this page via Archive.org',115),(45,'https://web.archive.org/web/20160612020333/http://www.gristleartgallery.com/realms-of-the-unreal.html',2015,'',116),(46,'http://web.archive.org/web/20160413063539/http://www.rogerballen.com/boarding-house',2005,'IMG_PATH entered here is the same as the one entered for the Retreat image.',117),(47,'https://www.flickr.com/photos/artanagnorisis/4173682670',2009,'IMG_PATH entered here is not archived',118),(48,'http://web.archive.org/web/20161126163559/https://caitlinhackett.carbonmade.com/projects/5770049',2013,'',104),(49,'https://web.archive.org/web/20160320224546/http://markryden.com/paintings/treeshow/images/paintings/large/apology.jpg',2006,'',121),(50,'https://web.archive.org/web/20161020073706/http://www.wondertoonel.com/',2005,'',122),(51,'https://web.archive.org/web/20160207133313/http://www.markryden.com/paintings/one/images/large/the_creatrix.jpg',2005,'',50),(52,'https://web.archive.org/web/20151003040046/http://www.porterhouseart.com/v/arch/editions/creatrix.html',2005,'',51),(53,'http://coverart.oclc.org/ImageWebSvc/oclc/+-+171308377_140.jpg?SearchOrder=+-+OT,OS,TN,GO,FA',2008,'Digital image is very small',123);
/*!40000 ALTER TABLE `image_rep` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER URL_trim 
BEFORE INSERT ON image_rep
FOR EACH ROW SET NEW.img_path = TRIM(LEADING "http" FROM NEW.img_path) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `img_to_agent`
--

DROP TABLE IF EXISTS `img_to_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `img_to_agent` (
  `img_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  PRIMARY KEY (`img_id`,`agent_id`),
  KEY `agent_id` (`agent_id`),
  CONSTRAINT `img_to_agent_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`) ON UPDATE CASCADE,
  CONSTRAINT `img_to_agent_ibfk_2` FOREIGN KEY (`img_id`) REFERENCES `image_rep` (`img_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `img_to_agent`
--

LOCK TABLES `img_to_agent` WRITE;
/*!40000 ALTER TABLE `img_to_agent` DISABLE KEYS */;
INSERT INTO `img_to_agent` VALUES (30,2),(37,5),(41,6),(36,30),(29,37),(34,40),(35,40),(50,65),(51,65),(52,65);
/*!40000 ALTER TABLE `img_to_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license`
--

DROP TABLE IF EXISTS `license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license` (
  `lic_id` int(11) NOT NULL AUTO_INCREMENT,
  `lic_code` varchar(50) DEFAULT NULL,
  `lic_addedinfo` varchar(2000) DEFAULT NULL,
  `lic_path` text,
  PRIMARY KEY (`lic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license`
--

LOCK TABLES `license` WRITE;
/*!40000 ALTER TABLE `license` DISABLE KEYS */;
INSERT INTO `license` VALUES (1,'CC BY','This license lets others distribute, remix, tweak, and build upon your work, even commercially, as long as they credit you for the original creation. This is the most accommodating of licenses offered. Recommended for maximum dissemination and use of licensed materials.','https://web.archive.org/web/20161121171539/https://creativecommons.org/licenses/by/4.0/legalcode'),(2,'CC BY-SA','This license lets others remix, tweak, and build upon your work even for commercial purposes, as long as they credit you and license their new creations under the identical terms. This license is often compared to “copyleft” free and open source software licenses. All new works based on yours will carry the same license, so any derivatives will also allow commercial use. This is the license used by Wikipedia, and is recommended for materials that would benefit from incorporating content from Wikipedia and similarly licensed projects. ','https://web.archive.org/web/20161116031046/https://creativecommons.org/licenses/by-sa/4.0/legalcode'),(3,'CC BY-ND','This license allows for redistribution, commercial and non-commercial, as long as it is passed along unchanged and in whole, with credit to you. ','https://web.archive.org/web/20161114200706/https://creativecommons.org/licenses/by-nd/4.0/legalcode'),(4,'CC BY-NC','This license lets others remix, tweak, and build upon your work non-commercially, and although their new works must also acknowledge you and be non-commercial, they don’t have to license their derivative works on the same terms. ','https://web.archive.org/web/20160715010806/https://creativecommons.org/licenses/by-nc/4.0/legalcode'),(5,'CC BY-NC-SA','This license lets others remix, tweak, and build upon your work non-commercially, as long as they credit you and license their new creations under the identical terms. ','https://web.archive.org/web/20161114200546/https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode'),(6,'CC BY-NC-ND','This license is the most restrictive of our six main licenses, only allowing others to download your works and share them with others as long as they credit you, but they can’t change them in any way or use them commercially. ','https://web.archive.org/web/20161114201031/https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode'),(7,'All rights reserved','Default license',''),(8,'Public Domain','This indicates that the work has fallen into the public domain.',''),(9,'CC 0','No Rights Reserved; Public Domain Dedication. CC0 enables scientists, educators, artists and other creators and owners of copyright- or database-protected content to waive those interests in their works and thereby place them as completely as possible in the public domain, so that others may freely build upon, enhance and reuse the works for any purposes without restriction under copyright or database law.','https://web.archive.org/web/20161117114015/https://creativecommons.org/publicdomain/zero/1.0/legalcode'),(10,'Various','For some Collections: rights differ per each work included','');
/*!40000 ALTER TABLE `license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `panda`
--

DROP TABLE IF EXISTS `panda`;
/*!50001 DROP VIEW IF EXISTS `panda`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `panda` AS SELECT 
 1 AS `Artist`,
 1 AS `Work Title`,
 1 AS `Art Description`,
 1 AS `Year Created`,
 1 AS `Image Location`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `realms`
--

DROP TABLE IF EXISTS `realms`;
/*!50001 DROP VIEW IF EXISTS `realms`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `realms` AS SELECT 
 1 AS `Artist`,
 1 AS `Work Title`,
 1 AS `Exhibition`,
 1 AS `Year`,
 1 AS `Website`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rights_set`
--

DROP TABLE IF EXISTS `rights_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights_set` (
  `rights_id` int(11) NOT NULL AUTO_INCREMENT,
  `lic_id` int(11) DEFAULT '7',
  `reg_no` varchar(50) DEFAULT NULL,
  `reg_year` year(4) DEFAULT NULL,
  `rights_addedinfo` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`rights_id`),
  UNIQUE KEY `reg_no` (`reg_no`),
  KEY `lic_id` (`lic_id`),
  CONSTRAINT `rights_set_ibfk_1` FOREIGN KEY (`lic_id`) REFERENCES `license` (`lic_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights_set`
--

LOCK TABLES `rights_set` WRITE;
/*!40000 ALTER TABLE `rights_set` DISABLE KEYS */;
INSERT INTO `rights_set` VALUES (1,7,'V489023894',2015,'Registration number is a sample only.'),(2,7,NULL,NULL,NULL),(3,7,NULL,NULL,NULL),(4,7,NULL,NULL,NULL),(5,7,NULL,NULL,NULL),(6,7,'V990278650',2015,'Registration number is a sample only.'),(7,7,NULL,NULL,NULL),(8,7,NULL,NULL,NULL),(9,7,NULL,NULL,NULL),(10,7,NULL,NULL,NULL),(11,7,NULL,NULL,NULL),(12,7,NULL,NULL,NULL),(13,7,NULL,NULL,NULL),(14,7,NULL,NULL,NULL),(15,7,NULL,NULL,NULL),(16,7,NULL,NULL,NULL),(17,7,NULL,NULL,NULL),(18,7,NULL,NULL,NULL),(19,7,'VA930678209',2015,'Registration number is a sample only.'),(20,7,'VA715268309',2015,'Registration number is a sample only.'),(21,7,'VA825467774',2015,'Registration number is a sample only.'),(22,7,'VA109873656',2015,'Registration number is a sample only.'),(23,7,'VA192677874',2005,'Registration number is a sample only.'),(24,7,'VA109276544',2006,'Registration number is a sample only.'),(25,6,NULL,NULL,'License is sample only - art is all rights reserved.'),(26,6,NULL,NULL,'License is sample only - art is all rights reserved.'),(27,6,NULL,NULL,'License is sample only - art is all rights reserved.'),(28,7,NULL,NULL,NULL),(29,7,'VA907255444',2012,'Registration number is a sample only.'),(30,7,'VA192098765',2012,'Registration number is a sample only.'),(31,7,'VA017293874',2013,'Registration number is a sample only.'),(32,5,'VA102938475',2009,'Registration number is a sample only. License is sample only - art is all rights reserved.'),(33,7,'VA472635467',2009,'Registration number is a sample only.'),(34,7,NULL,NULL,NULL),(35,7,NULL,NULL,NULL),(36,7,NULL,NULL,NULL),(37,7,NULL,NULL,NULL),(38,7,NULL,NULL,NULL),(39,7,NULL,NULL,NULL),(40,7,NULL,NULL,NULL),(41,7,NULL,NULL,NULL),(42,7,NULL,NULL,NULL),(43,7,NULL,NULL,NULL),(44,10,NULL,NULL,NULL),(45,10,NULL,NULL,NULL),(46,7,NULL,NULL,NULL),(47,10,NULL,NULL,NULL),(48,10,NULL,NULL,NULL),(49,7,NULL,NULL,NULL),(50,7,NULL,NULL,NULL),(51,7,NULL,NULL,NULL),(52,7,NULL,NULL,NULL),(53,7,NULL,NULL,NULL),(54,7,NULL,NULL,NULL),(55,7,NULL,NULL,NULL),(56,7,NULL,NULL,NULL),(57,7,NULL,NULL,NULL),(58,7,NULL,NULL,NULL),(59,7,NULL,NULL,NULL),(60,7,NULL,NULL,NULL),(61,7,NULL,NULL,NULL),(62,7,NULL,NULL,NULL),(63,7,NULL,NULL,NULL),(64,7,NULL,NULL,NULL),(65,7,NULL,NULL,NULL),(66,7,NULL,NULL,NULL),(67,7,NULL,NULL,NULL),(68,7,NULL,NULL,NULL),(69,7,NULL,NULL,NULL),(70,7,NULL,NULL,NULL),(71,7,NULL,NULL,NULL),(72,7,NULL,NULL,NULL),(73,7,NULL,NULL,NULL),(74,7,NULL,NULL,NULL),(75,7,NULL,NULL,NULL),(76,7,NULL,NULL,NULL),(77,7,NULL,NULL,NULL),(78,7,NULL,NULL,NULL),(79,7,NULL,NULL,NULL),(80,7,NULL,NULL,NULL),(81,7,NULL,NULL,NULL),(82,7,NULL,NULL,NULL),(83,7,NULL,NULL,NULL),(84,7,NULL,NULL,NULL),(85,7,NULL,NULL,NULL),(86,7,NULL,NULL,NULL),(87,7,NULL,NULL,NULL),(88,7,NULL,NULL,NULL),(89,7,NULL,NULL,NULL),(90,7,NULL,NULL,NULL),(91,7,NULL,NULL,NULL),(92,7,NULL,NULL,NULL),(93,7,NULL,NULL,NULL),(94,7,NULL,NULL,NULL),(95,7,NULL,NULL,NULL),(96,7,NULL,NULL,NULL),(97,7,NULL,NULL,NULL),(98,7,NULL,NULL,NULL),(99,7,NULL,NULL,NULL),(100,7,NULL,NULL,NULL),(101,7,NULL,NULL,NULL),(102,7,NULL,NULL,NULL),(103,7,NULL,NULL,NULL),(104,7,NULL,NULL,NULL),(105,7,NULL,NULL,NULL),(106,7,NULL,NULL,NULL),(107,7,NULL,NULL,NULL),(108,7,NULL,NULL,NULL),(109,7,NULL,NULL,NULL),(110,7,NULL,NULL,NULL),(111,7,NULL,NULL,NULL),(112,7,NULL,NULL,NULL),(113,7,NULL,NULL,NULL),(114,7,NULL,NULL,NULL),(115,10,NULL,NULL,NULL),(116,10,NULL,NULL,NULL),(117,7,NULL,NULL,NULL),(118,10,NULL,NULL,NULL),(119,7,NULL,NULL,NULL),(120,7,NULL,NULL,NULL),(121,7,NULL,NULL,NULL),(122,7,NULL,NULL,NULL),(123,7,NULL,NULL,NULL);
/*!40000 ALTER TABLE `rights_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work`
--

DROP TABLE IF EXISTS `work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work` (
  `work_id` int(11) NOT NULL AUTO_INCREMENT,
  `creation_year` year(4) DEFAULT NULL,
  `work_title` varchar(200) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `work_measurements` varchar(100) DEFAULT NULL,
  `work_material` varchar(400) DEFAULT NULL,
  `rights_id` int(11) NOT NULL,
  PRIMARY KEY (`work_id`),
  UNIQUE KEY `rights_id` (`rights_id`),
  CONSTRAINT `work_ibfk_1` FOREIGN KEY (`rights_id`) REFERENCES `rights_set` (`rights_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work`
--

LOCK TABLES `work` WRITE;
/*!40000 ALTER TABLE `work` DISABLE KEYS */;
INSERT INTO `work` VALUES (1,2015,'And Being Was Enough','Book art interpreting the work of Henry Darger. Opens up and can be mounted to the wall. Uses multiple types of paper and collage. Muted color including grey and pastels.','60x8.25','',1),(2,2015,'Ex Libris','','10x20','',2),(3,2015,'Bandolier (The Protector)','','21x25x2.25','crocheted cotton string, glue, antique dress, rusty nails',3),(4,2015,'Front line of the Glandeco- Angelinian War Storm','','7.5x11','ballpoint pen and watercolor',4),(5,2015,'Rainbow of the free','','','oil on board ',5),(6,2015,'Good is Prior to Evil','','20x24','oil on linen',6),(7,2015,'Ghosts of War','','7 - 4x6 panels','watercolor, encaustic, oil on panel',7),(8,2015,'The First Color of the Rainbow','','5.5x7.5','Ink and watercolor on panel',8),(9,2015,'Different Losses','','16x20','mixed media',9),(10,2015,'Righteous Vindication','','5x5 closed 10x5 open','booklet: pen, pencil and watercolor on paper',10),(11,2015,'Vivian Girl: Citrus Swallowtails & Western Emperor Swallowtail','','11 wide x 9 tall x 1.5 deep','entomology/mixed media',11),(12,2015,'Little Henry\'s Heart','','approx. 10x10x9','mixed media: paper skull diorama, hand-cut wood, LED light',12),(13,2015,'Untitled Portrait of Henry Darger','','20x30','oil on canvas',13),(14,2015,'Luminous Guardian','','14x17','giclee print',14),(15,2015,'Fire at Black Lake','','22x30','ink on paper',15),(16,2015,'Overture','','12x16','oil and acrylic on board',16),(17,2015,'The Unreality','There is a boy obsessed with a gadget (iphone)...proportions of the painting being reminiscent of that shape of the phone while the boy is almost trapped inside...','26x12 ','oil and acrylic on canvas',17),(18,2015,'Little Lamb','','4x6x4.5','wool felt, mixed media',18),(19,2015,'And The World Swallows Her','','5x7','ink on paper',19),(20,2015,'The Vivian Girl Daisy','Nude portrait of an intersex child, Daisy.','14.25x19.75','ink, tempera, pastel on watercolor paper',20),(21,2015,'Avenging Annie','Portrait of a young girl wearing a cowboy hat and carrying a gun','12x17.5','pastel, metal leaf on paper',21),(22,2015,'In The Realms of the Unreal, innocence lives in the constant shadow of danger…','','16x20','mixed media on acid free-board',22),(23,2015,'Blengin Exhumed','','10x11','graphite on paper',23),(24,2015,'Blengin','','','',24),(25,2005,'Death and the Maiden','','12x18','oil on copper',25),(26,2006,'The Devil is in the Details, part IV: Suicide of the Alligator Queen','','10x13','gouache and ink on ziatype print',26),(27,2006,'The Devil is in the Details, part II','','10x13','gouache and ink on ziatype print',27),(28,2014,'From This Distance: Sound Pearls','','12x12','print on paper',28),(29,2008,'Fragments','','10x15','print on paper',29),(30,2005,'Retreat','','15x15','nonarchival photographic print on paper for display',30),(31,2012,'I Know the Pieces Fit','','','print on paper',31),(32,2012,'Untitled (New Years Greeting Card)','','','print on paper, embellished with gold paint',32),(33,2013,'In Memory','This piece represents the Memory of forests as they once were; it is an ode to the vast wilderness that once covered the world and the potency of nature. Deer have long been held to be mystic creatures, from Cernunnos who was a god in Celtic mythology with deer antlers atop his head, to the white hart of Arthurian legend, deer have long been spiritual guides, harbingers of transgressed taboos, the companions to saints and fairies alike. This creature of mine, Memory, is a combination of a Stag and an Ibex, combining the spiritual symbolism of the deer with the tragic endangerment of the old world ibex. In Memory is about both the power of nature and the loss of it. It is meant as a reflection on what been lost and what could be regained.','18x24','ballpoint pen, water color, colored pencil, and gold acrylic on cold press water color paper.',33),(34,2009,'Undergrowth','','','',34),(35,2009,'Stole','','','',35),(36,2007,'Sex Mask for Religious People','','','',36),(37,2015,'Untitled','Pencil sketch of a goblin','','graphite on paper',37),(38,2008,'Cog\'nition','Print of depiction of Cog-Nition sculpture (Mid-Sagital Skull Bisection), Version 1','10.5x13','print infused into metal',38),(39,2010,'Samantha Levin','Abstract portrait of Samantha Levin','16x20','Acrylic, Spray, and Graphite on canvas',39),(40,2008,'Pandagram Sam','Figure in foreground, with panda-like markings, stands in a surreal landscape.','36x32','Giclee print on paper',40),(41,2008,'Dream 03','The experience of “awakening” to the awareness that one is dreaming...','20x13.33','Giclee print on Hahnemuhle “German Etching” 310 gm watercolor paper. Signed limited edition no 6 of 66',41),(42,2013,'Untitled','Cut-out ink drawings mounted in two separate boxes in the format of a diorama.','2.75x5.75x5.75 and 4x4x2','Diorama, ink on paper - 2 boxes',42),(43,2011,'Untitled','Images of ships and water, silkscreened onto repurposed wood','18x10','silkscreen on wood',43),(44,2011,'C&C Dummy Work1','This is a temporary record for a work published in the Cute & Creepy art exhibition catalog. The agents for these works are accurately entered into the database.','','',49),(45,2011,'C&C Dummy Work2','This is a temporary record for a work published in the Cute & Creepy art exhibition catalog. The agents for these works are accurately entered into the database.','','',50),(46,2011,'C&C Dummy Work3','This is a temporary record for a work published in the Cute & Creepy art exhibition catalog. The agents for these works are accurately entered into the database.','','',51),(47,2011,'C&C Dummy Work4','This is a temporary record for a work published in the Cute & Creepy art exhibition catalog. The agents for these works are accurately entered into the database.','','',52),(48,2011,'C&C Dummy Work5','This is a temporary record for a work published in the Cute & Creepy art exhibition catalog. The agents for these works are accurately entered into the database.','','',53),(49,2011,'C&C Dummy Work6','This is a temporary record for a work published in the Cute & Creepy art exhibition catalog. The agents for these works are accurately entered into the database.','','',54),(50,2011,'C&C Dummy Work7','This is a temporary record for a work published in the Cute & Creepy art exhibition catalog. The agents for these works are accurately entered into the database.','','',55),(51,2011,'C&C Dummy Work8','This is a temporary record for a work published in the Cute & Creepy art exhibition catalog. The agents for these works are accurately entered into the database.','','',56),(52,2011,'C&C Dummy Work9','This is a temporary record for a work published in the Cute & Creepy art exhibition catalog. The agents for these works are accurately entered into the database.','','',57),(53,2011,'C&C Dummy Work10','This is a temporary record for a work published in the Cute & Creepy art exhibition catalog. The agents for these works are accurately entered into the database.','','',58),(54,2011,'C&C Dummy Work11','This is a temporary record for a work published in the Cute & Creepy art exhibition catalog. The agents for these works are accurately entered into the database.','','',59),(55,2011,'C&C Dummy Work12','This is a temporary record for a work published in the Cute & Creepy art exhibition catalog. The agents for these works are accurately entered into the database.','','',60),(56,2011,'C&C Dummy Work13','This is a temporary record for a work published in the Cute & Creepy art exhibition catalog. The agents for these works are accurately entered into the database.','','',61),(57,2011,'C&C Dummy Work14','This is a temporary record for a work published in the Cute & Creepy art exhibition catalog. The agents for these works are accurately entered into the database.','','',62),(58,2011,'C&C Dummy Work15','This is a temporary record for a work published in the Cute & Creepy art exhibition catalog. The agents for these works are accurately entered into the database.','','',63),(59,2011,'C&C Dummy Work16','This is a temporary record for a work published in the Cute & Creepy art exhibition catalog. The agents for these works are accurately entered into the database.','','',64),(60,2011,'C&C Dummy Work17','This is a temporary record for a work published in the Cute & Creepy art exhibition catalog. The agents for these works are accurately entered into the database.','','',65),(61,2011,'C&C Dummy Work18','This is a temporary record for a work published in the Cute & Creepy art exhibition catalog. The agents for these works are accurately entered into the database.','','',66),(62,2011,'C&C Dummy Work19','This is a temporary record for a work published in the Cute & Creepy art exhibition catalog. The agents for these works are accurately entered into the database.','','',67),(63,2011,'C&C Dummy Work20','This is a temporary record for a work published in the Cute & Creepy art exhibition catalog. The agents for these works are accurately entered into the database.','','',68),(64,2011,'C&C Dummy Work21','This is a temporary record for a work published in the Cute & Creepy art exhibition catalog. The agents for these works are accurately entered into the database.','','',69),(65,2011,'C&C Dummy Work22','This is a temporary record for a work published in the Cute & Creepy art exhibition catalog. The agents for these works are accurately entered into the database.','','',70),(66,2011,'C&C Dummy Work23','This is a temporary record for a work published in the Cute & Creepy art exhibition catalog. The agents for these works are accurately entered into the database.','','',71),(67,2006,'Apology','A girl wearing a yellow dress gestures in apology to a tree stump with an eye in its center','24x31','oil on canvas',119),(68,2005,'The Creatrix','A woman wearing a long gown and crown, stands in a field filled with creatures, carrying an infant and and twig.','91x60','oil on canvas',120);
/*!40000 ALTER TABLE `work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `work_license`
--

DROP TABLE IF EXISTS `work_license`;
/*!50001 DROP VIEW IF EXISTS `work_license`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `work_license` AS SELECT 
 1 AS `Artist`,
 1 AS `Work Title`,
 1 AS `Public License`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `work_to_agent`
--

DROP TABLE IF EXISTS `work_to_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_to_agent` (
  `work_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  PRIMARY KEY (`work_id`,`agent_id`),
  KEY `agent_id` (`agent_id`),
  CONSTRAINT `work_to_agent_ibfk_1` FOREIGN KEY (`work_id`) REFERENCES `work` (`work_id`) ON UPDATE CASCADE,
  CONSTRAINT `work_to_agent_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_to_agent`
--

LOCK TABLES `work_to_agent` WRITE;
/*!40000 ALTER TABLE `work_to_agent` DISABLE KEYS */;
INSERT INTO `work_to_agent` VALUES (25,1),(26,1),(27,1),(30,2),(2,3),(9,4),(38,5),(41,6),(31,8),(28,9),(22,10),(24,11),(35,12),(12,13),(33,14),(34,14),(13,15),(23,16),(4,17),(32,17),(1,18),(20,19),(21,19),(8,20),(17,21),(37,22),(11,23),(3,24),(5,25),(6,26),(16,27),(39,28),(19,29),(36,30),(40,31),(7,32),(15,33),(10,34),(14,35),(18,36),(29,37),(42,38),(43,39),(44,42),(45,43),(46,44),(47,45),(48,46),(49,47),(50,48),(51,49),(52,50),(53,51),(54,52),(55,53),(56,54),(57,55),(58,56),(59,57),(60,58),(61,59),(62,60),(63,61),(64,62),(65,63),(66,64),(67,65),(68,65);
/*!40000 ALTER TABLE `work_to_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_to_coll`
--

DROP TABLE IF EXISTS `work_to_coll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_to_coll` (
  `work_id` int(11) NOT NULL,
  `coll_id` int(11) NOT NULL,
  PRIMARY KEY (`work_id`,`coll_id`),
  KEY `coll_id` (`coll_id`),
  CONSTRAINT `work_to_coll_ibfk_1` FOREIGN KEY (`coll_id`) REFERENCES `collection` (`coll_id`) ON UPDATE CASCADE,
  CONSTRAINT `work_to_coll_ibfk_2` FOREIGN KEY (`work_id`) REFERENCES `work` (`work_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_to_coll`
--

LOCK TABLES `work_to_coll` WRITE;
/*!40000 ALTER TABLE `work_to_coll` DISABLE KEYS */;
INSERT INTO `work_to_coll` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(22,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(31,2),(32,2),(33,2),(34,2),(35,2),(36,2),(37,2),(38,2),(39,2),(40,2),(41,2),(42,2),(43,2),(30,3),(30,4),(34,4),(44,5),(45,5),(46,5),(47,5),(48,5),(49,5),(50,5),(51,5),(52,5),(53,5),(54,5),(55,5),(56,5),(57,5),(58,5),(59,5),(60,5),(61,5),(62,5),(63,5),(64,5),(65,5),(66,5),(67,6),(68,6);
/*!40000 ALTER TABLE `work_to_coll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_to_imagerep`
--

DROP TABLE IF EXISTS `work_to_imagerep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_to_imagerep` (
  `work_id` int(11) NOT NULL,
  `img_id` int(11) NOT NULL,
  PRIMARY KEY (`work_id`,`img_id`),
  KEY `img_id` (`img_id`),
  CONSTRAINT `work_to_imagerep_ibfk_1` FOREIGN KEY (`work_id`) REFERENCES `work` (`work_id`) ON UPDATE CASCADE,
  CONSTRAINT `work_to_imagerep_ibfk_2` FOREIGN KEY (`img_id`) REFERENCES `image_rep` (`img_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_to_imagerep`
--

LOCK TABLES `work_to_imagerep` WRITE;
/*!40000 ALTER TABLE `work_to_imagerep` DISABLE KEYS */;
INSERT INTO `work_to_imagerep` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(67,49),(68,52);
/*!40000 ALTER TABLE `work_to_imagerep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_to_worktype`
--

DROP TABLE IF EXISTS `work_to_worktype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_to_worktype` (
  `work_id` int(11) NOT NULL,
  `wt_id` int(11) NOT NULL,
  PRIMARY KEY (`work_id`,`wt_id`),
  KEY `wt_id` (`wt_id`),
  CONSTRAINT `work_to_worktype_ibfk_1` FOREIGN KEY (`work_id`) REFERENCES `work` (`work_id`) ON UPDATE CASCADE,
  CONSTRAINT `work_to_worktype_ibfk_2` FOREIGN KEY (`wt_id`) REFERENCES `worktype` (`wt_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_to_worktype`
--

LOCK TABLES `work_to_worktype` WRITE;
/*!40000 ALTER TABLE `work_to_worktype` DISABLE KEYS */;
INSERT INTO `work_to_worktype` VALUES (16,1),(17,1),(39,1),(43,1),(1,2),(10,2),(14,3),(29,3),(20,4),(21,4),(23,4),(34,4),(37,4),(7,5),(3,6),(18,6),(35,7),(14,8),(29,8),(26,9),(27,9),(9,10),(9,11),(11,11),(12,11),(20,11),(21,11),(22,11),(24,11),(39,11),(42,11),(5,12),(6,12),(7,12),(13,12),(16,12),(17,12),(25,12),(67,12),(68,12),(15,13),(19,13),(20,13),(26,13),(27,13),(42,13),(30,14),(31,14),(36,14),(38,14),(2,15),(26,15),(27,15),(28,15),(32,15),(33,15),(40,15),(41,15),(12,16),(4,17),(7,17),(8,17),(43,18),(42,19);
/*!40000 ALTER TABLE `work_to_worktype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worktype`
--

DROP TABLE IF EXISTS `worktype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worktype` (
  `wt_id` int(11) NOT NULL AUTO_INCREMENT,
  `wt_name` varchar(300) NOT NULL,
  PRIMARY KEY (`wt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worktype`
--

LOCK TABLES `worktype` WRITE;
/*!40000 ALTER TABLE `worktype` DISABLE KEYS */;
INSERT INTO `worktype` VALUES (1,'acrylic paintings'),(2,'bookworks'),(3,'computer drawings'),(4,'drawings'),(5,'encaustic paint'),(6,'fiber art'),(7,'sculpture'),(8,'giclée prints'),(9,'gouaches'),(10,'high reliefs'),(11,'mixed media'),(12,'oil paintings'),(13,'pen and ink drawings'),(14,'photographic prints '),(15,'prints'),(16,'sculpture'),(17,'watercolors'),(18,'screen prints'),(19,'dioramas');
/*!40000 ALTER TABLE `worktype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `worktype_list`
--

DROP TABLE IF EXISTS `worktype_list`;
/*!50001 DROP VIEW IF EXISTS `worktype_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `worktype_list` AS SELECT 
 1 AS `Artist`,
 1 AS `Work Title`,
 1 AS `AAT Worktype`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'art_registrar'
--

--
-- Dumping routines for database 'art_registrar'
--

--
-- Final view structure for view `artist_state_perc`
--

/*!50001 DROP VIEW IF EXISTS `artist_state_perc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `artist_state_perc` AS select (case when (`agent`.`agent_state` = ' ') then concat(round(((count(`agent`.`agent_state`) / (select count(0) from `agent`)) * 100),0),'%',', or ',count(`agent`.`agent_state`),' ','of all ',(select count(0) from `agent`),' artists in database, are missing their state location') else concat(round(((count(`agent`.`agent_state`) / (select count(0) from `agent`)) * 100),0),'%',', or ',count(`agent`.`agent_state`),' ','of all ',(select count(0) from `agent`),' artists in database, are from ',`agent`.`agent_state`) end) AS `Artist State %` from `agent` group by `agent`.`agent_state` order by ((count(`agent`.`agent_state`) / (select count(0) from `agent`)) * 100) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `panda`
--

/*!50001 DROP VIEW IF EXISTS `panda`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `panda` AS select `a`.`agent_knownas` AS `Artist`,`c`.`work_title` AS `Work Title`,`c`.`description` AS `Art Description`,`c`.`creation_year` AS `Year Created`,`e`.`img_path` AS `Image Location` from ((((`agent` `a` left join `work_to_agent` `b` on((`a`.`agent_id` = `b`.`agent_id`))) left join `work` `c` on((`c`.`work_id` = `b`.`work_id`))) left join `work_to_imagerep` `d` on((`d`.`work_id` = `c`.`work_id`))) left join `image_rep` `e` on((`d`.`img_id` = `e`.`img_id`))) where (`c`.`description` like '%panda%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `realms`
--

/*!50001 DROP VIEW IF EXISTS `realms`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `realms` AS select `a`.`agent_knownas` AS `Artist`,`e`.`work_title` AS `Work Title`,`c`.`coll_title` AS `Exhibition`,`c`.`coll_year` AS `Year`,`c`.`coll_path` AS `Website` from ((((`work` `e` left join `work_to_coll` `b` on((`b`.`work_id` = `e`.`work_id`))) left join `collection` `c` on((`c`.`coll_id` = `b`.`coll_id`))) left join `work_to_agent` `f` on((`f`.`work_id` = `e`.`work_id`))) left join `agent` `a` on((`a`.`agent_id` = `f`.`agent_id`))) where (`c`.`coll_title` = 'Realms of the Unreal') order by `a`.`agent_knownas` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `work_license`
--

/*!50001 DROP VIEW IF EXISTS `work_license`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `work_license` AS select `a`.`agent_knownas` AS `Artist`,`c`.`work_title` AS `Work Title`,`d`.`lic_code` AS `Public License` from ((((`agent` `a` left join `work_to_agent` `b` on((`a`.`agent_id` = `b`.`agent_id`))) left join `work` `c` on((`c`.`work_id` = `b`.`work_id`))) left join `rights_set` `e` on((`e`.`rights_id` = `c`.`rights_id`))) left join `license` `d` on((`e`.`lic_id` = `d`.`lic_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `worktype_list`
--

/*!50001 DROP VIEW IF EXISTS `worktype_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `worktype_list` AS select `a`.`agent_knownas` AS `Artist`,`c`.`work_title` AS `Work Title`,`d`.`wt_name` AS `AAT Worktype` from ((((`agent` `a` left join `work_to_agent` `b` on((`a`.`agent_id` = `b`.`agent_id`))) left join `work` `c` on((`c`.`work_id` = `b`.`work_id`))) left join `work_to_worktype` `g` on((`g`.`work_id` = `c`.`work_id`))) left join `worktype` `d` on((`d`.`wt_id` = `g`.`wt_id`))) */;
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

-- Dump completed on 2016-12-11 13:38:50
