-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: grabcompany
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `Account_id` int NOT NULL,
  `Account_name` varchar(20) NOT NULL,
  `CID` int NOT NULL,
  PRIMARY KEY (`Account_id`),
  KEY `FK_CID_Acc` (`CID`),
  CONSTRAINT `FK_CID_Acc` FOREIGN KEY (`CID`) REFERENCES `customer` (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (100000,'Aritsu',1),(100001,'tan',2),(100002,'Hymmji',3),(100003,'Tannie',4),(100004,'Samira',5),(100005,'Eoin',6),(100006,'Habib9',7),(100007,'Zoe11',8),(100008,'Elizaza',9),(100009,'Dhruv9',10);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `Build_no` varchar(10) NOT NULL,
  `note` varchar(40) DEFAULT NULL,
  `Postal_codes` varchar(5) NOT NULL,
  `Organization_name` varchar(40) DEFAULT NULL,
  `City_name` varchar(20) NOT NULL,
  `Country` varchar(60) NOT NULL,
  `District` varchar(30) DEFAULT NULL,
  `Road` varchar(30) DEFAULT NULL,
  `Alley` varchar(30) DEFAULT NULL,
  `CID` int NOT NULL,
  PRIMARY KEY (`Build_no`,`CID`),
  KEY `FK_CID_Add` (`CID`),
  CONSTRAINT `FK_CID_Add` FOREIGN KEY (`CID`) REFERENCES `customer` (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES ('1/12',NULL,'10330',NULL,'Pathum Wan','Thailand','',NULL,NULL,5),('1/3',NULL,'10330',NULL,'Pathum Wan','Thailand','',NULL,NULL,8),('11/9',NULL,'10110',NULL,'Khlong Toei','Thailand','',NULL,NULL,3),('15/5',NULL,'10150',NULL,'Nonthaburi','Thailand','Muang',NULL,NULL,2),('16/1','Closed to 7-11','73000',NULL,'Nakhon Pathom','Thailand','Muang',NULL,NULL,1),('16/5',NULL,'10250',NULL,'Suan Luang','Thailand','',NULL,NULL,6),('2/1',NULL,'10110',NULL,'Watthana','Thailand','',NULL,NULL,4),('3/14',NULL,'10110',NULL,'Khlong Toei','Thailand','',NULL,NULL,9),('6/1',NULL,'10250',NULL,'Suan Luang','Thailand','',NULL,NULL,7),('6/11',NULL,'10600',NULL,'Khlong San','Thailand','',NULL,NULL,10);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card` (
  `Payment_id` int NOT NULL,
  `Credit` char(1) DEFAULT NULL,
  `Debit` char(1) DEFAULT NULL,
  `Issuer_bank_name` varchar(20) NOT NULL,
  `Issuer_bank_country` varchar(8) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Expiry_date` varchar(20) NOT NULL,
  `Card_number` varchar(16) NOT NULL,
  `CVV` char(3) NOT NULL,
  PRIMARY KEY (`Payment_id`,`Card_number`),
  CONSTRAINT `FK_Payment_id_Card` FOREIGN KEY (`Payment_id`) REFERENCES `payment_transaction` (`Payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (1000005,'Y',NULL,'Bangkok Bank','Thailand','Eoin','Nieves','12/22','5111451142125392','123'),(1000006,NULL,'Y','Bank of Ayudhya','Thailand','Habib','Witt','06/24','5112512250240668','516'),(1000007,NULL,'Y','Tisco Bank','Thailand','Zoe','Alvarado','09/26','5104713732070000','107'),(1000008,'Y',NULL,'Bangkok Bank','Thailand','Eli','Reilly','03/23','5110801937381728','813'),(1000009,NULL,'Y','TMBThanachat Bank','Thailand','Dhruv','Alvarado','01/23','5110801937381521','103');
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash`
--

DROP TABLE IF EXISTS `cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cash` (
  `Payment_id` int NOT NULL,
  `Money_change` decimal(5,2) NOT NULL,
  PRIMARY KEY (`Payment_id`),
  CONSTRAINT `FK_Payment_id_Cash` FOREIGN KEY (`Payment_id`) REFERENCES `payment_transaction` (`Payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash`
--

LOCK TABLES `cash` WRITE;
/*!40000 ALTER TABLE `cash` DISABLE KEYS */;
INSERT INTO `cash` VALUES (1000000,30.00),(1000001,10.00),(1000002,29.00),(1000003,0.00),(1000004,10.00);
/*!40000 ALTER TABLE `cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Customer_id` int NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Email` varchar(319) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Gender` char(1) DEFAULT NULL,
  PRIMARY KEY (`Customer_id`),
  CONSTRAINT `chk_Gender` CHECK ((`Gender` in (_utf8mb3'M',_utf8mb3'F')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Thanawat','Jarusuthirug','thanawat@gmail.com','0814833126','M'),(2,'Kamin','Dechopanyakul','kamin@gmail.com','0927104131','M'),(3,'Sirasit','Puangpathanachai','sirasit@gmail.com','0671445359','M'),(4,'Jatenipat','Ausanarassamee','jateni@gmail.com','0671087083','F'),(5,'Samira','Rocha','samir@gmail.com','0841708616','F'),(6,'Eoin','Nieves','eoinn@gmail.com','0643271323','M'),(7,'Habib','Witt','habib.w@gmail.com','0649449319','M'),(8,'Zoe','Alvarado','alvazoe@gmail.com','0640380940','F'),(9,'Eli','Reilly','elire@gmail.com','0634938021','M'),(10,'Dhruv','Alvarado','dhruvhruv@gmail.com','0928741634','M');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `Driver_id` int NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `AID` int NOT NULL,
  PRIMARY KEY (`Driver_id`,`Fname`,`Lname`,`AID`),
  KEY `FK_AID_D` (`AID`),
  CONSTRAINT `FK_AID_D` FOREIGN KEY (`AID`) REFERENCES `account` (`Account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1012,'Supsampantuwongse','Plaphol',100000),(1041,'Khakanang','Sukbunsung',100001),(1015,'Chatchom','Thawan',100002),(1017,'Pongtham','Sathianthai',100003),(1054,'Niwat','Yoovidhya',100004),(1124,'Thaksin','Damrongsak',100005),(1321,'Piyawat','Kaewburesai',100006),(1351,'Urairat','Maleenon',100007),(1512,'Phawta','Janpong',100008),(1123,'Kamonrat','Parnthep',100009);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver_location`
--

DROP TABLE IF EXISTS `driver_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver_location` (
  `Driver_id` int NOT NULL,
  `Driver_location` varchar(50) NOT NULL,
  KEY `FK_DriverID_L` (`Driver_id`),
  CONSTRAINT `FK_DriverID_L` FOREIGN KEY (`Driver_id`) REFERENCES `driver` (`Driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_location`
--

LOCK TABLES `driver_location` WRITE;
/*!40000 ALTER TABLE `driver_location` DISABLE KEYS */;
INSERT INTO `driver_location` VALUES (1012,'Nakhon Pathom'),(1041,'Nonthaburi'),(1015,'Bangkok'),(1017,'Nakhon Pathom'),(1054,'Bangkok'),(1124,'Bangkok'),(1321,'Nakhon Pathom'),(1351,'Bangkok'),(1512,'Nonthaburi'),(1123,'Nonthaburi');
/*!40000 ALTER TABLE `driver_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grab_service`
--

DROP TABLE IF EXISTS `grab_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grab_service` (
  `Car_id` int NOT NULL,
  `Car_type` varchar(20) NOT NULL,
  `Driver_ID_GS` int NOT NULL,
  PRIMARY KEY (`Car_id`),
  KEY `FK_Driver_ID_GS` (`Driver_ID_GS`),
  CONSTRAINT `FK_Driver_ID_GS` FOREIGN KEY (`Driver_ID_GS`) REFERENCES `driver` (`Driver_id`),
  CONSTRAINT `chk_car_type` CHECK ((`Car_type` in (_utf8mb3'GrabCar',_utf8mb3'GrabCarPremium',_utf8mb3'GrabBikeWin',_utf8mb3'JustGrab',_utf8mb3'GrabTaxi')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grab_service`
--

LOCK TABLES `grab_service` WRITE;
/*!40000 ALTER TABLE `grab_service` DISABLE KEYS */;
INSERT INTO `grab_service` VALUES (100000,'GrabCar',1012),(100001,'GrabCarPremium',1041),(100002,'GrabCar',1015),(100003,'GrabCar',1017),(100004,'JustGrab',1054),(100005,'GrabTaxi',1124),(100006,'JustGrab',1321),(100007,'GrabTaxi',1351),(100008,'GrabBikeWin',1512),(100009,'GrabBikeWin',1123);
/*!40000 ALTER TABLE `grab_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `NOTIF_id` int NOT NULL,
  `NOTLF_time` date NOT NULL,
  `NOTLF_type` varchar(20) NOT NULL,
  `NOTIF_msg` varchar(500) NOT NULL,
  `AID` int NOT NULL,
  PRIMARY KEY (`NOTIF_id`,`AID`),
  KEY `FK_AID_NOTI` (`AID`),
  CONSTRAINT `FK_AID_NOTI` FOREIGN KEY (`AID`) REFERENCES `account` (`Account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1000000,'2022-10-12','News','Grab war registration',100000),(1000000,'2022-10-12','News','Grab war registration',100001),(1000000,'2022-10-12','News','Grab war registration',100002),(1000000,'2022-10-12','News','Grab war registration',100003),(1000000,'2022-10-12','News','Grab war registration',100004),(1000000,'2022-10-12','News','Grab war registration',100005),(1000000,'2022-10-12','News','Grab war registration',100006),(1000000,'2022-10-12','News','Grab war registration',100007),(1000000,'2022-10-12','News','Grab war registration',100008),(1000000,'2022-10-12','News','Grab war registration',100009),(1000001,'2022-11-11','Event','11.11 Promotion Code free -111.0 Baht!',100000),(1000001,'2022-11-11','Event','11.11 Promotion Code free -111.0 Baht!',100001),(1000001,'2022-11-11','Event','11.11 Promotion Code free -111.0 Baht!',100002),(1000001,'2022-11-11','Event','11.11 Promotion Code free -111.0 Baht!',100003),(1000001,'2022-11-11','Event','11.11 Promotion Code free -111.0 Baht!',100004),(1000001,'2022-11-11','Event','11.11 Promotion Code free -111.0 Baht!',100005),(1000001,'2022-11-11','Event','11.11 Promotion Code free -111.0 Baht!',100006),(1000001,'2022-11-11','Event','11.11 Promotion Code free -111.0 Baht!',100007),(1000001,'2022-11-11','Event','11.11 Promotion Code free -111.0 Baht!',100008),(1000001,'2022-11-11','Event','11.11 Promotion Code free -111.0 Baht!',100009),(1000003,'2022-11-12','Recommend','For you \'Back\' code reduce price 20%',100000),(1000004,'2022-11-12','Recommend','\'Flash11\' code',100001),(1000005,'2022-11-12','Recommend','Get 80 Baht off code for grabbike',100002),(1000006,'2022-11-12','Recommend','Get 100 Baht off code for grabcar',100003),(1000007,'2022-11-12','Recommend','Get 80 Baht off code for grabbike',100004),(1000008,'2022-11-12','Recommend','Get 10 Baht off code for grabcar',100005),(1000009,'2022-11-12','Recommend','Get 20 Baht off code for grabbike',100006),(1000010,'2022-11-12','Recommend','Get 40 Baht off code for grabcar',100007),(1000011,'2022-11-12','Recommend','Get 90 Baht off code for grabbike',100008),(1000012,'2022-11-12','Recommend','Get 80 Baht off code for grabwin',100009);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_transaction`
--

DROP TABLE IF EXISTS `payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_transaction` (
  `Payment_id` int NOT NULL,
  `Payment_amount` decimal(5,2) NOT NULL,
  `AID` int NOT NULL,
  `Car_id` int NOT NULL,
  PRIMARY KEY (`Payment_id`,`AID`,`Car_id`),
  KEY `FK_AID_PT` (`AID`),
  KEY `FK_Car_id_PT` (`Car_id`),
  CONSTRAINT `FK_AID_PT` FOREIGN KEY (`AID`) REFERENCES `account` (`Account_id`),
  CONSTRAINT `FK_Car_id_PT` FOREIGN KEY (`Car_id`) REFERENCES `grab_service` (`Car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_transaction`
--

LOCK TABLES `payment_transaction` WRITE;
/*!40000 ALTER TABLE `payment_transaction` DISABLE KEYS */;
INSERT INTO `payment_transaction` VALUES (1000000,170.00,100000,100000),(1000001,130.00,100001,100001),(1000002,121.00,100002,100002),(1000003,100.00,100003,100003),(1000004,150.00,100004,100004),(1000005,290.00,100005,100005),(1000006,80.00,100006,100006),(1000007,40.00,100007,100007),(1000008,140.00,100008,100008),(1000009,190.00,100009,100009);
/*!40000 ALTER TABLE `payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-02 18:28:58
