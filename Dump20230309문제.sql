-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: db03091
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `견적내역`
--

DROP TABLE IF EXISTS `견적내역`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `견적내역` (
  `등록자등록번호` varchar(45) NOT NULL,
  `견적번호` int NOT NULL,
  `견적일자` date DEFAULT NULL,
  `공급가액` int DEFAULT NULL,
  `부가세` int DEFAULT NULL,
  `총계` int DEFAULT NULL,
  PRIMARY KEY (`등록자등록번호`,`견적번호`),
  CONSTRAINT `fk_견적내역_공급자1` FOREIGN KEY (`등록자등록번호`) REFERENCES `공급자` (`등록번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `견적내역`
--

LOCK TABLES `견적내역` WRITE;
/*!40000 ALTER TABLE `견적내역` DISABLE KEYS */;
INSERT INTO `견적내역` VALUES ('리아',3,'2023-03-09',30000,3000,33000),('아디',2,'2023-02-09',20000,2000,22000),('아리아',1,'2023-01-09',10000,1000,11000);
/*!40000 ALTER TABLE `견적내역` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `견적세부내용`
--

DROP TABLE IF EXISTS `견적세부내용`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `견적세부내용` (
  `등록자등록번호` varchar(45) NOT NULL,
  `상품코드` char(5) NOT NULL,
  `수량` int DEFAULT NULL,
  `공급가액` int DEFAULT NULL,
  `부가세` int DEFAULT NULL,
  `총계` int DEFAULT NULL,
  PRIMARY KEY (`등록자등록번호`,`상품코드`),
  KEY `fk_견적세부내용_상품1_idx` (`상품코드`),
  KEY `fk_견적세부내용_견적내역1_idx` (`등록자등록번호`),
  CONSTRAINT `fk_견적세부내용_견적내역1` FOREIGN KEY (`등록자등록번호`) REFERENCES `견적내역` (`등록자등록번호`),
  CONSTRAINT `fk_견적세부내용_상품1` FOREIGN KEY (`상품코드`) REFERENCES `상품` (`상품코드`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `견적세부내용`
--

LOCK TABLES `견적세부내용` WRITE;
/*!40000 ALTER TABLE `견적세부내용` DISABLE KEYS */;
INSERT INTO `견적세부내용` VALUES ('리아','cc',1,30000,3000,33000),('아디','dd',1,20000,2000,22000),('아리아','kk',1,10000,1000,11000);
/*!40000 ALTER TABLE `견적세부내용` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `공급자`
--

DROP TABLE IF EXISTS `공급자`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `공급자` (
  `등록번호` varchar(45) NOT NULL,
  `상호` char(30) DEFAULT NULL,
  `대표성명` char(10) DEFAULT NULL,
  `사업장주소` varchar(45) DEFAULT NULL,
  `업태` char(10) DEFAULT NULL,
  `종목` char(10) DEFAULT NULL,
  `전화번호` int DEFAULT NULL,
  PRIMARY KEY (`등록번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `공급자`
--

LOCK TABLES `공급자` WRITE;
/*!40000 ALTER TABLE `공급자` DISABLE KEYS */;
INSERT INTO `공급자` VALUES ('리아','d건설','김부장','대로번지1000-3','건설업',NULL,1012341234),('아디','g건설','김대표','대로번지1000-2','건설업',NULL,1023232323),('아리아','k건설','김사장','대로번지1000-1','건설업',NULL,1034343434);
/*!40000 ALTER TABLE `공급자` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `날짜`
--

DROP TABLE IF EXISTS `날짜`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `날짜` (
  `견적번호` int NOT NULL,
  `견적일자` date DEFAULT NULL,
  `담당자` char(10) DEFAULT NULL,
  PRIMARY KEY (`견적번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `날짜`
--

LOCK TABLES `날짜` WRITE;
/*!40000 ALTER TABLE `날짜` DISABLE KEYS */;
INSERT INTO `날짜` VALUES (1,'2023-03-09','김팀장'),(2,'2023-02-09','이팀장'),(3,'2023-01-09','오팀장');
/*!40000 ALTER TABLE `날짜` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `상품`
--

DROP TABLE IF EXISTS `상품`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `상품` (
  `상품코드` char(5) NOT NULL,
  `규격` varchar(45) DEFAULT NULL,
  `단가` int DEFAULT NULL,
  PRIMARY KEY (`상품코드`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `상품`
--

LOCK TABLES `상품` WRITE;
/*!40000 ALTER TABLE `상품` DISABLE KEYS */;
INSERT INTO `상품` VALUES ('cc','kok',40000),('dd','kok',35000),('kk','kok',30000);
/*!40000 ALTER TABLE `상품` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db03091'
--

--
-- Dumping routines for database 'db03091'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-09 17:18:41
