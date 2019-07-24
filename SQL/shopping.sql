-- MySQL dump 10.13  Distrib 5.7.26, for Win64 (x86_64)
--
-- Host: localhost    Database: shopping
-- ------------------------------------------------------
-- Server version	5.7.26-log

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `isleaf` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (2,'落落','测试',0,1,1),(3,'test2','test2',1,1,2),(4,'test3','test3',3,0,3),(5,'钢笔','还不错',0,0,1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `normalprice` double DEFAULT NULL,
  `memberprice` double DEFAULT NULL,
  `pdate` datetime DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'钢笔','ok',8.9,8.9,'2018-09-27 23:47:34',2),(2,'方便面','味道鲜美',5.3,5.3,'2018-09-27 23:52:51',3),(3,'笔芯','0.35口径',0.5,0.5,'2018-09-28 09:30:33',2),(4,'qwe','qwe',1,0.8,'2018-10-06 23:51:47',2),(5,'wer','wer',1,0.8,'2018-10-06 23:53:45',2),(6,'asd','asd',1,0.8,'2018-10-03 23:53:48',3),(7,'fgh','fgh',1,0.8,'2018-09-25 23:53:52',3),(8,'uyi','yui',1,0.8,'2018-09-24 23:53:56',2),(9,'hj','hj',1,0.8,'2018-10-01 23:54:00',3),(10,'df','df',1,0.8,'2018-10-02 23:54:04',2),(11,'qw','wq',1,0.8,'2018-10-03 23:54:07',2);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruser`
--

DROP TABLE IF EXISTS `ruser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(16) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `rdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruser`
--

LOCK TABLES `ruser` WRITE;
/*!40000 ALTER TABLE `ruser` DISABLE KEYS */;
INSERT INTO `ruser` VALUES (4,'test','11','123','你们好呀，在干嘛呢','2018-09-20 23:34:02'),(9,'qwe','123','123','asd','2019-07-24 15:17:52');
/*!40000 ALTER TABLE `ruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesitem`
--

DROP TABLE IF EXISTS `salesitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) DEFAULT NULL,
  `unitprice` double DEFAULT NULL,
  `pcount` int(11) DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesitem`
--

LOCK TABLES `salesitem` WRITE;
/*!40000 ALTER TABLE `salesitem` DISABLE KEYS */;
INSERT INTO `salesitem` VALUES (1,7,1,1,1),(2,1,8.9,1,2),(3,9,0.8,1,2),(4,7,0.8,1,3),(5,7,0.8,5,4),(6,7,0.8,1,5),(7,2,5.3,12,6),(8,2,5.3,22,7),(9,7,1,4,8);
/*!40000 ALTER TABLE `salesitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesorder`
--

DROP TABLE IF EXISTS `salesorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `odate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesorder`
--

LOCK TABLES `salesorder` WRITE;
/*!40000 ALTER TABLE `salesorder` DISABLE KEYS */;
INSERT INTO `salesorder` VALUES (1,-1,'qwe','2018-10-10 15:19:07',0),(2,5,'123123sdf','2018-10-10 15:23:07',0),(3,5,'123123sdf','2018-10-10 15:26:19',0),(4,1,'qweqweqw','2018-12-29 19:12:03',0),(5,1,'qweqweqw','2018-12-29 19:20:51',0),(6,1,'123','2019-07-24 00:22:58',0),(7,-1,'','2019-07-24 00:53:58',0),(8,1,'abc','2019-07-24 01:46:52',0);
/*!40000 ALTER TABLE `salesorder` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-24 15:55:05
