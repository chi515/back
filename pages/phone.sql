CREATE DATABASE  IF NOT EXISTS `phone` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `phone`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: phone
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ad`
--

DROP TABLE IF EXISTS `ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad` (
  `adid` int(11) NOT NULL AUTO_INCREMENT,
  `adfile` varchar(45) NOT NULL,
  `adtitle` text NOT NULL,
  `adcontent` text NOT NULL,
  PRIMARY KEY (`adid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad`
--

LOCK TABLES `ad` WRITE;
/*!40000 ALTER TABLE `ad` DISABLE KEYS */;
INSERT INTO `ad` VALUES (1,'01','車用手機架','車用手機架'),(2,'02','手機支架','手機支架'),(3,'03','充電線','充電線'),(4,'04','手機殼','手機殼');
/*!40000 ALTER TABLE `ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allproduct`
--

DROP TABLE IF EXISTS `allproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allproduct` (
  `itemid` varchar(30) NOT NULL,
  `itemcount` int(11) DEFAULT NULL,
  `itemtype` varchar(100) DEFAULT NULL,
  `itemprice` int(11) DEFAULT NULL,
  `itemnote` varchar(100) DEFAULT NULL,
  `pic` varchar(100) DEFAULT NULL,
  `itemname` varchar(100) DEFAULT NULL,
  `itemnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allproduct`
--

LOCK TABLES `allproduct` WRITE;
/*!40000 ALTER TABLE `allproduct` DISABLE KEYS */;
INSERT INTO `allproduct` VALUES ('cable01',15,'充電線',100,'約100公分剛剛好不糾結纏繞鋁箔+鋁鎂合金編織網，具抗干擾防護','../assets/photos/cable/img4.jfif','鋁合金高速傳輸充電線',1),('cable02',15,'充電線',200,'原廠品質保證 展現高品質、高效能、高效率充電模式','../assets/photos/cable/img2.jfif','【SAMSUNG 三星】原廠 A70高速傳輸充電線(平輸密封包裝) 白色',2),('cable03',15,'充電線',150,'快速充電 穩定傳輸 可支援PD快充','../assets/photos/cable/img3.jfif','DTAudio IPhone充電線(1M) 享有一年保固',3),('cable04',15,'充電線',100,'穩定傳輸、快速充電、1.5線長','../assets/photos/cable/img5.jpg','Hawk二合一高速充電線',4),('cable05',15,'充電線',300,'三合一手機快速充電線','../assets/photos/cable/img6.jfif','絲絨編織尼龍繩Type-C、Micro USB、蘋果lightning 8pin3合1數據充電線(ET-T36)',5),('cablepro01',20,'充電線保護套',50,'【材質】ATBC-PVC','../assets/photos/cc/cc1.jfif','咬咬小動物 iPhone傳輸線/充電線 防斷保護套',1),('cablepro02',20,'充電線保護套',100,'保護充電線/充電頭','../assets/photos/cc/cc2.jpg','動漫充電線保護套',2),('cablepro03',20,'充電線保護套',200,'保護充電線/充電頭','../assets/photos/cc/cc3.jpg','復古PC充電線保護套',3),('cablepro04',20,'充電線保護套',150,'一組一入(單邊) 建議購買兩組 線頭線尾各一個','../assets/photos/cc/cc4.jfif','蘋果傳輸線專用線套',4),('cablepro05',20,'充電線保護套',120,'保護充電線/充電頭','../assets/photos/cc/cc5.jpg','ELECOM Lightning充電線保護套休眠動物系列',5),('carps01',20,'車用手機架',100,'0.1秒自動夾緊 輕輕一推 取出手機 輕鬆應對高速過彎、急煞、顛頗山路','../assets/photos/carps/carps1.jpg','超迷你出風口手機支架',1),('carps02',20,'車用手機架',300,'稀土強磁吸附，牢牢固定無懼顛簸','../assets/photos/carps/carps2.jpg','磁吸手機導航支架',2),('carps03',20,'車用手機架',150,'360°旋轉視野調節;穩固4爪夾壁','../assets/photos/carps/carps3.jpg','三用夾持式手機架',3),('carps04',20,'車用手機架',200,'3邊都有防護，可以垂直或水平使用','../assets/photos/carps/carps4.jpg','多功能車用手機架/手機座/車架/固定架/支架',4),('carps05',20,'車用手機架',250,'全鋁合金材質夾具，堅固耐用','../assets/photos/carps/carps5.jpg','杯架式 車用手機架',5),('case01',10,'手機殼',200,'鬼滅之刃手機殼','../assets/photos/phonecase/pc1.jpg','鬼滅之刃手機殼',1),('case02',10,'手機殼',100,'矽膠IPhone手機軟殼','../assets/photos/phonecase/pc2.jfif','矽膠IPhone手機軟殼',2),('case03',10,'手機殼',150,'iPhone 13的星空手機殼','../assets/photos/phonecase/pc3.jpg','星空手機殼',3),('case04',10,'手機殼',100,'有多個型號和顏色的防摔手機殼','../assets/photos/phonecase/pc5.png','防摔手機殼',4),('case05',10,'手機殼',500,'Prada手機殼','../assets/photos/phonecase/pc4.jfif','Prada手機殼',5),('sp01',25,'手機膜',100,'專為手機玻璃螢幕設計的液態塗抹奈米膜，塗上去跟打蠟一樣，會有一層保護效果','../assets/photos/sp/sp1.jfif','液態奈米手機膜',1),('sp02',25,'手機膜',200,'不留指紋、減少藍光、抗刮花，滑動手感更佳!','../assets/photos/sp/sp2.jpg','簡易DIY手機奈米鍍膜',2),('sp03',25,'手機膜',150,'一秒貼膜','../assets/photos/sp/sp3.jpg','iPhone 13鋼化膜',3),('sp04',25,'手機膜',90,'防窺手機膜','../assets/photos/sp/sp4.webp','【iPhone 13 系列】0.33mm 滿版玻璃保護貼 (5.4\"/6.1\"/6.7\") 附貼膜神器',4),('sp05',25,'手機膜',70,'霧面防窺滿版手機膜','../assets/photos/sp/sp5.jfif','霧面防窺滿版',5),('stand01',20,'手機支架',100,'手指卡住手機，拿得更穩，減少掉落機會 適用於所有手機和平板','../assets/photos/phonestand/ps1.png','可伸縮氣囊手機支架',1),('stand02',20,'手機支架',50,'體積小輕薄，好攜帶不佔空間','../assets/photos/phonestand/ps2.jpg','磁吸手機支架',2),('stand03',20,'手機支架',40,'小巧便攜摺疊支架，不佔空間  自由調整各種角度，避免頸椎勞累','../assets/photos/phonestand/ps3.jpg','多功能便攜摺疊手機支架',3),('stand04',20,'手機支架',200,'材質：鋁合金 尺寸：7.5x6.2x8.3cm','../assets/photos/phonestand/ps4.jpg','手機平板金屬桌面支架',4),('stand05',20,'手機支架',150,'SPIDERMAN手機支架','../assets/photos/phonestand/ps5.jpg','SPIDERMAN手機支架',5);
/*!40000 ALTER TABLE `allproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `GBNO` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(45) NOT NULL,
  `Content` text,
  `Putdate` date DEFAULT NULL,
  `pid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`GBNO`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy`
--

DROP TABLE IF EXISTS `buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `itemid` varchar(45) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy`
--

LOCK TABLES `buy` WRITE;
/*!40000 ALTER TABLE `buy` DISABLE KEYS */;
/*!40000 ALTER TABLE `buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `count`
--

DROP TABLE IF EXISTS `count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `count` (
  `count` int(11) NOT NULL,
  PRIMARY KEY (`count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `count`
--

LOCK TABLES `count` WRITE;
/*!40000 ALTER TABLE `count` DISABLE KEYS */;
INSERT INTO `count` VALUES (35);
/*!40000 ALTER TABLE `count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `payway` varchar(50) DEFAULT NULL,
  `transport` varchar(45) DEFAULT NULL,
  `username` varchar(10) NOT NULL,
  `day` varchar(20) DEFAULT NULL,
  `itemid` varchar(45) DEFAULT NULL,
  `p_name` varchar(45) NOT NULL,
  `p_price` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `num` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `no` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `msg` text,
  `Putdate` date DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(12) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'phoone','phone','1234','台北市信義區中正路100號','0911111111','phone123@gmail.com'),(2,'王曉明','john123','1111','台北市信義區中正路100號','0912334456','john123@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-07  0:32:45
