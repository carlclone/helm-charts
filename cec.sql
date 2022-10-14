-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (arm64)
--
-- Host: localhost    Database: cec_test
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachment` (
  `id` bigint NOT NULL COMMENT '主键id',
  `origin_name` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `new_file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '新文件名',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `created_by` varchar(32) NOT NULL COMMENT '创建人工号',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseline_year`
--

DROP TABLE IF EXISTS `baseline_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `baseline_year` (
  `id` bigint NOT NULL COMMENT '主键',
  `org_id` bigint NOT NULL COMMENT '组织id',
  `year` int NOT NULL COMMENT '年份',
  `revision` int NOT NULL COMMENT '乐观锁',
  `created_by` varchar(32) NOT NULL COMMENT '创建人工号',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(20) NOT NULL COMMENT '更新人工号',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `delete_flag` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='组织基线年';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseline_year`
--

LOCK TABLES `baseline_year` WRITE;
/*!40000 ALTER TABLE `baseline_year` DISABLE KEYS */;
INSERT INTO `baseline_year` VALUES (1522822128884387852,1522069302193295360,2020,1,'1522124426508898304','2022-05-07 14:14:23','1522124426508898304','2022-05-07 14:14:23','fii',0),(1522822128884387925,1522069310518988800,2020,1,'1522124426508898304','2022-05-07 14:14:23','1522124426508898304','2022-05-07 14:14:23','fii',0),(1522822128884387937,1522069238142078976,2020,1,'1522124426508898304','2022-05-07 14:14:23','1522124426508898304','2022-05-07 14:14:23','fii',0);
/*!40000 ALTER TABLE `baseline_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carbon_inventory`
--

DROP TABLE IF EXISTS `carbon_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carbon_inventory` (
  `id` bigint NOT NULL COMMENT '主键id',
  `org_id` bigint NOT NULL COMMENT '组织id',
  `org_name` varchar(300) NOT NULL DEFAULT '' COMMENT '组织名称',
  `year` int NOT NULL COMMENT '年份',
  `quarter` int NOT NULL COMMENT '季度',
  `status` int NOT NULL COMMENT '状态',
  `scope_one` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '范围一排放',
  `scope_two` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '范围二排放',
  `scope_three` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '范围三排放',
  `deadline` datetime DEFAULT NULL COMMENT '截止日期',
  `unit` varchar(20) NOT NULL DEFAULT '' COMMENT '碳盘查二氧化碳当量单位',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `revision` int NOT NULL COMMENT '乐观锁',
  `created_by` varchar(32) NOT NULL COMMENT '创建人工号',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(20) NOT NULL COMMENT '更新人工号',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `delete_flag` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='碳盘查总报告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carbon_inventory`
--

LOCK TABLES `carbon_inventory` WRITE;
/*!40000 ALTER TABLE `carbon_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `carbon_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carbon_inventory_task`
--

DROP TABLE IF EXISTS `carbon_inventory_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carbon_inventory_task` (
  `id` bigint NOT NULL COMMENT '主键id',
  `year` int NOT NULL COMMENT '年份',
  `quarter` int NOT NULL COMMENT '季度',
  `org_id` bigint NOT NULL COMMENT '组织id',
  `is_root` int DEFAULT NULL COMMENT '是否是根节点',
  `deadline` datetime NOT NULL COMMENT '截止日期',
  `report_status` int NOT NULL DEFAULT '0' COMMENT '报告状态',
  `task_status` int DEFAULT '0' COMMENT '任务状态',
  `created_by` varchar(32) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) NOT NULL COMMENT '更新人id',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `revision` int NOT NULL DEFAULT '1' COMMENT '乐观锁',
  `delete_flag` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='碳盘查任务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carbon_inventory_task`
--

LOCK TABLES `carbon_inventory_task` WRITE;
/*!40000 ALTER TABLE `carbon_inventory_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `carbon_inventory_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cec_message`
--

DROP TABLE IF EXISTS `cec_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cec_message` (
  `id` bigint NOT NULL COMMENT '主键id',
  `content` varchar(1000) NOT NULL DEFAULT '0.0' COMMENT '消息内容',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '消息类型',
  `org_id` decimal(24,6) NOT NULL COMMENT '组织id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `created_by` varchar(32) NOT NULL COMMENT '创建人工号',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='消息通知';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cec_message`
--

LOCK TABLES `cec_message` WRITE;
/*!40000 ALTER TABLE `cec_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `cec_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `id` bigint unsigned NOT NULL,
  `currency` varchar(255) NOT NULL DEFAULT '',
  `rate` decimal(24,6) NOT NULL DEFAULT '0.000000',
  `source` varchar(255) NOT NULL DEFAULT '',
  `tenant_id` varchar(32) NOT NULL DEFAULT '',
  `created_time` datetime NOT NULL,
  `updated_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency` (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1544970420384567296,'USD',1.000000,'fool','fii','2022-07-08 17:03:47','2022-07-08 16:40:17'),(1544971919177158656,'BRL',0.187300,'实时汇率','fii','2022-07-09 17:09:44','2022-07-26 14:18:20'),(1545217951089692672,'CNY',0.149300,'2022/07/08','fii','2022-07-08 17:27:23','2022-07-08 16:40:07'),(1545319843216101376,'VND',0.000043,'2022/07/08','fii','2022-07-08 16:12:16','2022-07-08 16:12:16'),(1545326574189023232,'ZAR',0.000005,'aaaxxx','fii','2022-07-08 16:39:01','2022-07-14 11:51:16'),(1545336281272291328,'TWD',0.033601,'1','fii','2022-07-08 17:17:35','2022-07-08 17:18:29'),(1545336341884178432,'SGD',0.000000,'das','fii','2022-07-08 17:17:50','2022-07-08 17:17:50'),(1545340095584931840,'AUD',0.681400,'v','fii','2022-07-08 17:32:44','2022-07-08 17:47:03'),(1547861111439757312,'NZD',0.612500,'2022.7.15实时汇率','fii','2022-07-15 16:30:21','2022-07-15 16:30:38'),(1548865647570718720,'CAD',1.000000,'ds','fii','2022-07-18 11:02:02','2022-07-18 11:02:02'),(1548880164555984896,'DKK',0.135800,'2022.7.18实时汇率','fii','2022-07-18 11:59:43','2022-07-18 11:59:43'),(1551814360274440192,'CHF',1.036500,'1','fii','2022-07-26 14:19:09','2022-07-26 14:19:38'),(1552500004529246208,'EUR',1.200000,'7.28','fii','2022-07-28 11:43:40','2022-07-28 11:43:55');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_factor`
--

DROP TABLE IF EXISTS `custom_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_factor` (
  `id` bigint NOT NULL COMMENT '主键id',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '自定义碳排因子类型',
  `org_id` bigint NOT NULL COMMENT '组织id',
  `factor` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '因子数值',
  `factor_name` varchar(30) NOT NULL DEFAULT '' COMMENT '因子名称',
  `factor_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '排放因子单位',
  `fuel_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '燃料单位',
  `source_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '来源描述',
  `attachment_id` bigint DEFAULT NULL COMMENT '证明文件id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `created_by` varchar(32) NOT NULL COMMENT '创建人工号',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='自定义碳排放因子表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_factor`
--

LOCK TABLES `custom_factor` WRITE;
/*!40000 ALTER TABLE `custom_factor` DISABLE KEYS */;
INSERT INTO `custom_factor` VALUES (1483977604372500480,'外购能源_电力',1478968651452387328,0.340000,'南宁供电所','kgCO₂e/kWh','kWh','供电所提供',-1,'fii','1483709720098377728','2022-01-20 09:40:07'),(1491215978745434112,'固定燃烧排放_无烟煤',1485429855775494144,2.000000,'碳排标准2021','tCO₂e/t','t','碳排标准2021',1491215980918083584,'fii','1490872547317780480','2022-02-09 09:02:50'),(1491216269842714624,'固定燃烧排放_无烟煤',1485429855775494144,2.000000,'烟煤天津','tCO₂e/t','t','碳排标准2021',1491216270010486784,'fii','1490872547317780480','2022-02-09 09:03:59'),(1491217067460923392,'固定燃烧排放_无烟煤',1485429855775494144,1.870000,'无烟煤ocha','tCO₂e/t','t','供应商标准',1491217067586752512,'fii','1485505619829067776','2022-02-09 09:07:09'),(1491217792819662848,'固定燃烧排放_无烟煤',1485429855775494144,2.000000,'烟煤天津','tCO₂e/t','t','碳排标准2021',1491217792970657792,'fii','1490872547317780480','2022-02-09 09:10:02'),(1491291652462088192,'固定燃烧排放_无烟煤',1485429851061096448,1.300000,'无烟煤','tCO₂e/t','t','1',1491291652504031232,'fii','1490590134683439104','2022-02-09 14:03:31'),(1491292392672858112,'固定燃烧排放_无烟煤',1485429851061096448,1.300000,'无烟煤1','tCO₂e/t','t','1',1491292392714801152,'fii','1490590134683439104','2022-02-09 14:06:28'),(1491292611917516800,'固定燃烧排放_无烟煤',1485429851061096448,1.300000,'无烟煤1','tCO₂e/t','t','1',1491292611951071232,'fii','1490590134683439104','2022-02-09 14:07:20'),(1491312321249808384,'外购能源_电力',1485429852688486400,2.120000,'佛山2021标准','kgCO₂e/kWh','kWh','佛山地区碳排标准2021版',-1,'fii','1485787527892832256','2022-02-09 15:25:39'),(1491610252183998464,'移动燃烧排放_喷气煤油',1485429851061096448,5.000000,'喷气煤油','tCO₂e/t','t','是否',-1,'fii','1490590134683439104','2022-02-10 11:09:32'),(1491612549370744832,'外购能源_电力',1485429851061096448,2.000000,'电力','kgCO₂e/kWh','kWh','电力',-1,'fii','1490590134683439104','2022-02-10 11:18:39'),(1493877471324540928,'固定燃烧排放_无烟煤',1485429855775494144,2.430000,'2022新碳排','tCO₂e/t','t','国家2022燃烧碳排',1493877471534256128,'fii','1485787600533983232','2022-02-16 17:18:39'),(1493877928994410496,'固定燃烧排放_烟煤',1485429855775494144,2.330000,'国家2020','tCO₂e/t','t','国家2020',1493877929204125696,'fii','1485787600533983232','2022-02-16 17:20:28'),(1498554387818221568,'固定燃烧排放_褐煤',1485429851061096448,0.200000,'天津褐煤','tCO₂e/t','t','气候委员会测算提供',1498554389269450752,'fii','1485499720406274048','2022-03-01 15:03:03'),(1498558488924786688,'固定燃烧排放_无烟煤',1485429851061096448,2.000000,'深圳无烟煤','tCO₂e/t','t','政府气候委员会测算文件',1498558489033838592,'fii','1485499720406274048','2022-03-01 15:19:20'),(1498588540508966912,'固定燃烧排放_褐煤',1485429855775494144,2.000000,'天津褐煤','tCO₂e/t','kg','供应商提供测算文件',1498588540806762496,'fii','1485505619829067776','2022-03-01 17:18:45'),(1498867790772310016,'固定燃烧排放_烟煤',1485429855775494144,2.000000,'天津烟煤','tCO₂e/t','t','官方测算文件',1498867791145603072,'fii','1485505619829067776','2022-03-02 11:48:24'),(1501105776930983936,'固定燃烧排放_无烟煤',1485429851061096448,2.330000,'山西无烟煤','tCO₂e/t','t','山西煤矿',1501105777279111168,'fii','1485787396162326528','2022-03-08 16:01:21'),(1503654327691120640,'移动燃烧排放_汽油',1485429855775494144,3.010000,'自定义汽油排放','tCO₂e/t','t','国家标准',1503654328110551040,'fii','1485787600533983232','2022-03-15 16:48:23'),(1503660930922319872,'移动燃烧排放_喷气煤油',1485429855775494144,2000.000000,'内蒙标准','tCO₂e/t','t','内蒙电网官方文件',1503660931132035072,'fii','1485787600533983232','2022-03-15 17:14:37'),(1503661015202664448,'移动燃烧排放_喷气煤油',1485429855775494144,2.000000,'内蒙标准2','tCO₂e/t','t','内蒙电网官方文件',1503661015403991040,'fii','1485787600533983232','2022-03-15 17:14:57'),(1504003648299077632,'移动燃烧排放_液化天然气',1485429855775494144,3.120000,'内蒙液化油气碳排因子','tCO₂e/t','t','内蒙碳排标准',1504003648647204864,'fii','1485787600533983232','2022-03-16 15:56:28');
/*!40000 ALTER TABLE `custom_factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamic_message`
--

DROP TABLE IF EXISTS `dynamic_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dynamic_message` (
  `id` bigint NOT NULL COMMENT '主键id',
  `year` int DEFAULT NULL COMMENT '年份',
  `quarter` int DEFAULT NULL COMMENT '季度',
  `org_id` bigint NOT NULL COMMENT '组织id',
  `content` varchar(200) NOT NULL COMMENT '内容',
  `url` varchar(300) NOT NULL DEFAULT '' COMMENT 'url',
  `created_by` varchar(32) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `revision` int NOT NULL DEFAULT '1' COMMENT '乐观锁',
  `delete_flag` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `user_type` varchar(255) DEFAULT 'TOP_ORG',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='动态';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamic_message`
--

LOCK TABLES `dynamic_message` WRITE;
/*!40000 ALTER TABLE `dynamic_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamic_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emission_reduction_target`
--

DROP TABLE IF EXISTS `emission_reduction_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emission_reduction_target` (
  `id` bigint NOT NULL COMMENT '主键',
  `org_id` bigint NOT NULL COMMENT '组织id',
  `year` int NOT NULL COMMENT '年份',
  `carbon_emission` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '二氧化碳排放减少量',
  `carbon_emission_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '二氧化碳排放单位',
  `reduction_ratio` decimal(10,4) DEFAULT NULL COMMENT '计划减碳比例',
  `revision` int NOT NULL COMMENT '乐观锁',
  `created_by` varchar(32) NOT NULL COMMENT '创建人工号',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(20) NOT NULL COMMENT '更新人工号',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `delete_flag` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='组织减排目标';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emission_reduction_target`
--

LOCK TABLES `emission_reduction_target` WRITE;
/*!40000 ALTER TABLE `emission_reduction_target` DISABLE KEYS */;
INSERT INTO `emission_reduction_target` VALUES (1497040152919412736,1485429848393519104,2021,0.000000,'',0.1500,1,'1485787600533983232','2022-02-25 10:46:01','1485787600533983232','2022-02-25 10:46:01','fii',0),(1497049632923062272,1485429848393519104,2020,0.000000,'',0.1500,1,'1485787600533983232','2022-02-25 11:23:41','1485787600533983232','2022-02-25 11:23:41','fii',0),(1497049662539042816,1485429848393519104,2022,0.000000,'',0.1500,1,'1485787600533983232','2022-02-25 11:23:48','1485787600533983232','2022-02-25 11:23:48','fii',0),(1503659201774358528,1485429855775494144,2022,0.000000,'',0.2000,1,'1501830439596331008','2022-03-15 17:07:45','1501830439596331008','2022-03-15 17:07:45','fii',0);
/*!40000 ALTER TABLE `emission_reduction_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchange_rate`
--

DROP TABLE IF EXISTS `exchange_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exchange_rate` (
  `id` bigint NOT NULL COMMENT '主键id',
  `rate` decimal(10,6) NOT NULL COMMENT '汇率',
  `year` int NOT NULL COMMENT '年份',
  `created_by` varchar(32) NOT NULL COMMENT '创建人工号',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) NOT NULL COMMENT '更新人工号',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `revision` int NOT NULL DEFAULT '1' COMMENT '乐观锁',
  `delete_flag` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='美元与人民币汇率信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange_rate`
--

LOCK TABLES `exchange_rate` WRITE;
/*!40000 ALTER TABLE `exchange_rate` DISABLE KEYS */;
INSERT INTO `exchange_rate` VALUES (1479393590265384960,6.381000,2021,'','2022-01-07 18:04:55','','2022-01-07 18:04:55','fii',3,0);
/*!40000 ALTER TABLE `exchange_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fixed_combustion`
--

DROP TABLE IF EXISTS `fixed_combustion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fixed_combustion` (
  `id` bigint NOT NULL COMMENT '主键',
  `inventory_id` bigint NOT NULL COMMENT '碳盘查报告id',
  `quantity` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '数量',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '燃料类型',
  `fuel_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '燃料单位',
  `carbon_emission` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '二氧化碳排放',
  `carbon_emission_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '二氧化碳排放单位',
  `data_source` varchar(200) NOT NULL DEFAULT '' COMMENT '数据来源',
  `revision` int NOT NULL COMMENT '乐观锁',
  `created_by` varchar(32) NOT NULL COMMENT '创建人工号',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(20) NOT NULL COMMENT '更新人工号',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `delete_flag` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `attachment_id` bigint DEFAULT NULL COMMENT '附件id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='固定燃烧排放';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixed_combustion`
--

LOCK TABLES `fixed_combustion` WRITE;
/*!40000 ALTER TABLE `fixed_combustion` DISABLE KEYS */;
/*!40000 ALTER TABLE `fixed_combustion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flyway_schema_history`
--

DROP TABLE IF EXISTS `flyway_schema_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flyway_schema_history`
--

LOCK TABLES `flyway_schema_history` WRITE;
/*!40000 ALTER TABLE `flyway_schema_history` DISABLE KEYS */;
INSERT INTO `flyway_schema_history` VALUES (1,'1','<< Flyway Baseline >>','BASELINE','<< Flyway Baseline >>',NULL,'root','2022-04-29 06:10:36',0,1),(2,'2.0.0','version','SQL','V2.0.0__version.sql',579432312,'root','2022-04-29 06:10:38',278,1),(3,'2.0.1','version','SQL','V2.0.1__version.sql',684680520,'root','2022-04-29 06:16:32',308,1);
/*!40000 ALTER TABLE `flyway_schema_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fugitive_emission`
--

DROP TABLE IF EXISTS `fugitive_emission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fugitive_emission` (
  `id` bigint NOT NULL COMMENT '主键',
  `inventory_id` bigint NOT NULL COMMENT '碳盘查报告id',
  `fugitive_type` varchar(30) NOT NULL DEFAULT '' COMMENT '逸散类型',
  `quantity` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '数量',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '气体类型',
  `fuel_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '燃料单位',
  `factor_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '排放因子单位',
  `carbon_emission` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '二氧化碳排放',
  `carbon_emission_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '二氧化碳排放单位',
  `factor` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '排放因子',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `revision` int NOT NULL COMMENT '乐观锁',
  `created_by` varchar(32) NOT NULL COMMENT '创建人工号',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(20) NOT NULL COMMENT '更新人工号',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `delete_flag` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `data_source` varchar(200) NOT NULL DEFAULT '' COMMENT '数据来源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='逸散排放';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fugitive_emission`
--

LOCK TABLES `fugitive_emission` WRITE;
/*!40000 ALTER TABLE `fugitive_emission` DISABLE KEYS */;
/*!40000 ALTER TABLE `fugitive_emission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mid_attachment`
--

DROP TABLE IF EXISTS `mid_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mid_attachment` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `item_id` bigint DEFAULT NULL COMMENT '排放项id',
  `attachment_id` bigint DEFAULT NULL COMMENT '证明文件id',
  `created_by` varchar(32) NOT NULL COMMENT '创建人工号',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `mid_attachment_item_id_index` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8mb3 COMMENT='附件-排放文件中间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mid_attachment`
--

LOCK TABLES `mid_attachment` WRITE;
/*!40000 ALTER TABLE `mid_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mid_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mid_factor`
--

DROP TABLE IF EXISTS `mid_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mid_factor` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `item_id` bigint DEFAULT NULL COMMENT '排放项id(排放源id)',
  `factor_id` bigint DEFAULT NULL COMMENT '排放因子id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6506 DEFAULT CHARSET=utf8mb3 COMMENT='排放源-排放因子关联中间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mid_factor`
--

LOCK TABLES `mid_factor` WRITE;
/*!40000 ALTER TABLE `mid_factor` DISABLE KEYS */;
INSERT INTO `mid_factor` VALUES (6435,1547438210941063168,1514953872844656640),(6436,1547438451027218432,1514953872844656640),(6437,1547439031116238848,1514953872026767360),(6438,1547824006193876992,1514953856012914688),(6439,1547861475115274240,1514953856012914688),(6440,1547861575044567040,1514953864779010048),(6441,1547861771702898688,1514953872311980032),(6442,1547862562043990016,1514953872311980032),(6443,1547868366461603840,1514953855631233024),(6444,1547868366474186752,1514953870034472960),(6445,1547868366490963968,1514953898908061696),(6446,1547868366503546880,1514953898908061696),(6447,1547868366516129792,1514953872844656640),(6448,1551492000929419264,1514953855631233024),(6449,1551492982073593856,1514953864510574592),(6450,1551495637680394240,1514953871758331904),(6451,1551500133282222080,1516292284814069760),(6452,1551500356226256896,1514953872844656640),(6453,1551501360430714880,1514953863713656832),(6454,1551502067217076224,1514953867354312704),(6455,1551738408357990400,1514953864510574592),(6456,1551822340545974272,1514953859208974336),(6457,1551822572054777856,1514953864510574592),(6458,1551825583007207424,1514953872844656640),(6459,1551829324406067200,1514953872026767360),(6460,1552120320750653440,1514953898908061696),(6461,1552198142596878336,1514953898908061696),(6462,1552199954569760768,1514953872026767360),(6463,1552202147913928704,1514953898908061696),(6464,1552202250334638080,1514953856591728640),(6465,1552202316512366592,1514953864779010048),(6466,1552202487019212800,1514953867618553856),(6467,1552207245511626752,1514953865311686656),(6468,1552212705941786624,1514953864510574592),(6469,1552215358612574208,1514953855631233024),(6470,1552215778932166656,1514953863713656832),(6471,1552215991008759808,1514953872844656640),(6472,1552460076319641600,1514953856012914688),(6473,1552490877463695360,1514953867618553856),(6474,1552490949077241856,1514953870034472960),(6475,1552496571600474112,1514953868163813376),(6476,1552496652089167872,1514953867899572224),(6477,1552497035461136384,1514953898908061696),(6478,1552498863322042368,1514953858391085056),(6479,1552499429611802624,1514953898908061696),(6480,1552500541135917056,1514953872026767360),(6481,1552538253519884288,1514953864510574592),(6482,1552538372650700800,1514953867618553856),(6483,1552541664596332544,1514953871758331904),(6484,1552542143900422144,1514953898908061696),(6485,1552542178440515584,1514953856591728640),(6486,1552551152531410944,1514953870034472960),(6487,1552551185205039104,1514953868432248832),(6488,1552551281304932352,1514953898908061696),(6489,1552555612309688320,1514953856591728640),(6490,1552555643427229696,1514953870298714112),(6491,1552555668442058752,1514953868163813376),(6492,1552556077244092416,1514953898908061696),(6493,1552558215806455808,1514953898908061696),(6494,1552568549199974400,1514953856591728640),(6495,1552568608356438016,1514953870034472960),(6496,1552568650647605248,1514953867618553856),(6497,1552568760131522560,1514953898908061696),(6498,1552569060322054144,1514953872026767360),(6499,1552846272061378560,1514953857430589440),(6500,1552846692875898880,1514953867618553856),(6501,1552846884115189760,1514953898908061696),(6502,1552849679593639936,1514953858122649600),(6503,1552849722102910976,1514953865311686656),(6504,1552849768315752448,1514953910022967296),(6505,1552850104485023744,1514953898908061696);
/*!40000 ALTER TABLE `mid_factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobile_combustion`
--

DROP TABLE IF EXISTS `mobile_combustion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mobile_combustion` (
  `id` bigint NOT NULL COMMENT '主键',
  `inventory_id` bigint NOT NULL COMMENT '碳盘查报告id',
  `mobile_type` varchar(40) DEFAULT NULL COMMENT '移动燃烧排放类型',
  `quantity` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '数量',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '燃烧类型',
  `fuel_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '燃料单位',
  `carbon_emission` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '二氧化碳排放',
  `carbon_emission_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '二氧化碳排放单位',
  `data_source` varchar(200) NOT NULL DEFAULT '' COMMENT '数据来源',
  `revision` int NOT NULL COMMENT '乐观锁',
  `created_by` varchar(32) NOT NULL COMMENT '创建人工号',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(20) NOT NULL COMMENT '更新人工号',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `delete_flag` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='移动燃烧';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobile_combustion`
--

LOCK TABLES `mobile_combustion` WRITE;
/*!40000 ALTER TABLE `mobile_combustion` DISABLE KEYS */;
/*!40000 ALTER TABLE `mobile_combustion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `id` bigint NOT NULL COMMENT '主键id',
  `task_id` bigint DEFAULT NULL COMMENT '任务id',
  `year` int DEFAULT NULL COMMENT '年份',
  `quarter` int DEFAULT NULL COMMENT '季度',
  `org_id` bigint NOT NULL COMMENT '组织id',
  `status` int NOT NULL DEFAULT '0' COMMENT '通知状态',
  `content` varchar(200) NOT NULL COMMENT '内容',
  `url` varchar(300) NOT NULL COMMENT 'url',
  `created_by` varchar(32) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) NOT NULL COMMENT '更新人id',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `revision` int NOT NULL DEFAULT '1' COMMENT '乐观锁',
  `delete_flag` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='通知';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_info`
--

DROP TABLE IF EXISTS `org_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_info` (
  `id` bigint NOT NULL COMMENT '主键id',
  `org_name` varchar(100) NOT NULL DEFAULT '0.0' COMMENT '组织名称',
  `type` int NOT NULL DEFAULT '0' COMMENT '组织类型',
  `address` varchar(300) NOT NULL DEFAULT '' COMMENT '省市区',
  `street` varchar(300) NOT NULL DEFAULT '' COMMENT '街道',
  `principal` varchar(40) NOT NULL DEFAULT '' COMMENT '组织负责人',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `phone_number` varchar(50) NOT NULL DEFAULT '' COMMENT '联系电话',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人工号',
  `shareholding_ratio` varchar(10) NOT NULL DEFAULT 'N/A' COMMENT '上级组织控股比例,%',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新人工号',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `revision` int NOT NULL DEFAULT '1' COMMENT '乐观锁',
  `delete_flag` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_info_tenant_id_org_name_uindex` (`tenant_id`,`org_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='组织信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_info`
--

LOCK TABLES `org_info` WRITE;
/*!40000 ALTER TABLE `org_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_info_history`
--

DROP TABLE IF EXISTS `org_info_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_info_history` (
  `id` bigint NOT NULL COMMENT '主键id',
  `year` int NOT NULL DEFAULT '1970' COMMENT '年份',
  `quarter` int NOT NULL DEFAULT '0' COMMENT '季度',
  `detail` json NOT NULL COMMENT '具体数据',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人工号',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新人工号',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `revision` int NOT NULL DEFAULT '1' COMMENT '乐观锁',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='组织历史数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_info_history`
--

LOCK TABLES `org_info_history` WRITE;
/*!40000 ALTER TABLE `org_info_history` DISABLE KEYS */;
INSERT INTO `org_info_history` VALUES (1522069269725188096,2020,1,'[{\"id\": 1522069238142078976, \"type\": \"NO_INVENTORY\", \"email\": \"111@f.con\", \"street\": \"\", \"address\": \"中国-广东-深圳\", \"orgName\": \"Fii\", \"tenantId\": \"fii\", \"principal\": \"admin\", \"phoneNumber\": \"123\", \"shareholdingRatio\": \"N/A\"}, {\"id\": 1522069302193295360, \"type\": \"NO_INVENTORY\", \"address\": \"中国\", \"orgName\": \"iPEBG\", \"tenantId\": \"fii\", \"shareholdingRatio\": \"100%\"}, {\"id\": 1522069310518988800, \"type\": \"INVENTORY\", \"address\": \"中国\", \"orgName\": \"深圳市裕展精密科技有限公司\", \"tenantId\": \"fii\", \"shareholdingRatio\": \"100%\"}]','1522049591531409408','2022-05-05 20:22:47','','2022-05-05 20:22:47','fii',85),(1522160282431000576,2021,1,'[{\"id\": 1522069238142078976, \"type\": \"NO_INVENTORY\", \"email\": \"111@f.con\", \"street\": \"\", \"address\": \"中国-广东-深圳\", \"orgName\": \"Fii\", \"tenantId\": \"fii\", \"principal\": \"admin\", \"phoneNumber\": \"123\", \"shareholdingRatio\": \"N/A\"}, {\"id\": 1522069302193295360, \"type\": \"NO_INVENTORY\", \"address\": \"中国\", \"orgName\": \"iPEBG\", \"tenantId\": \"fii\", \"shareholdingRatio\": \"100%\"}, {\"id\": 1522069310518988800, \"type\": \"INVENTORY\", \"address\": \"中国\", \"orgName\": \"深圳市裕展精密科技有限公司\", \"tenantId\": \"fii\", \"shareholdingRatio\": \"100%\"}]','1522124426508898304','2022-05-06 02:24:26','','2022-05-06 02:24:26','fii',38);
/*!40000 ALTER TABLE `org_info_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_operation_info`
--

DROP TABLE IF EXISTS `org_operation_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_operation_info` (
  `id` bigint NOT NULL COMMENT '主键id',
  `org_id` bigint NOT NULL COMMENT '组织id',
  `year` int NOT NULL COMMENT '年份',
  `quarter` int NOT NULL COMMENT '季度',
  `output_value` decimal(12,6) DEFAULT NULL COMMENT '产值',
  `output_value_unit` varchar(10) DEFAULT NULL COMMENT '产值单位',
  `revenue` decimal(12,6) DEFAULT NULL COMMENT '营收',
  `revenue_unit` varchar(10) DEFAULT NULL COMMENT '营收单位',
  `industrial_output` decimal(12,6) DEFAULT NULL COMMENT '工业增加值',
  `industrial_output_unit` varchar(10) DEFAULT NULL COMMENT '工业增加值单位',
  `area` decimal(12,6) DEFAULT NULL COMMENT '占地面积',
  `area_unit` varchar(10) DEFAULT NULL COMMENT '占地面积单位',
  `employee_num` int DEFAULT NULL COMMENT '员工数量',
  `created_by` varchar(32) NOT NULL COMMENT '创建人工号',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) NOT NULL COMMENT '更新人工号',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `revision` int NOT NULL DEFAULT '1' COMMENT '乐观锁',
  `delete_flag` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='组织运营信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_operation_info`
--

LOCK TABLES `org_operation_info` WRITE;
/*!40000 ALTER TABLE `org_operation_info` DISABLE KEYS */;
INSERT INTO `org_operation_info` VALUES (1522479305538539520,1522160382549037056,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,'1522124426508898304','2022-05-06 15:32:07','1522124426508898304','2022-05-06 15:32:07','fii',1,0),(1522479318020788224,1522160383907991552,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,'1522124426508898304','2022-05-06 15:32:10','1522124426508898304','2022-05-06 15:32:10','fii',1,0),(1522479331350286336,1522160378178572288,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,'1522124426508898304','2022-05-06 15:32:14','1522124426508898304','2022-05-06 15:32:14','fii',1,0),(1522479343291469824,1522160376710565888,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,'1522124426508898304','2022-05-06 15:32:16','1522124426508898304','2022-05-06 15:32:16','fii',1,0),(1522479358655205376,1522160385283723264,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4155,'1522124426508898304','2022-05-06 15:32:20','1522124426508898304','2022-05-06 15:32:20','fii',1,0),(1522479372135698432,1522160365411110912,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,140,'1522124426508898304','2022-05-06 15:32:23','1522124426508898304','2022-05-06 15:32:23','fii',1,0),(1522479385230315520,1522160366853951488,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,'1522124426508898304','2022-05-06 15:32:26','1522124426508898304','2022-05-06 15:32:26','fii',1,0),(1522479417815863296,1522069359026114560,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4424,'1522124426508898304','2022-05-06 15:32:34','1522124426508898304','2022-05-06 15:32:34','fii',1,0),(1522479431040503808,1522069357583273984,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11000,'1522124426508898304','2022-05-06 15:32:37','1522124426508898304','2022-05-06 15:32:37','fii',1,0),(1522479444789432320,1522069344127946752,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,271,'1522124426508898304','2022-05-06 15:32:41','1522124426508898304','2022-05-06 15:32:41','fii',1,0),(1522479466805334016,1522069345621118976,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,180,'1522124426508898304','2022-05-06 15:32:46','1522124426508898304','2022-05-06 15:32:46','fii',1,0),(1522479479031730176,1522069340000751616,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,66,'1522124426508898304','2022-05-06 15:32:49','1522124426508898304','2022-05-06 15:32:49','fii',1,0),(1522479490981302272,1522069341384871936,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,'1522124426508898304','2022-05-06 15:32:52','1522124426508898304','2022-05-06 15:32:52','fii',1,0),(1522479503358693376,1522069352692715520,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,814,'1522124426508898304','2022-05-06 15:32:55','1522124426508898304','2022-05-06 15:32:55','fii',1,0),(1522479518554656768,1522069354672427008,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,57,'1522124426508898304','2022-05-06 15:32:58','1522124426508898304','2022-05-06 15:32:58','fii',1,0),(1522479585478971392,1522069336154574848,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,'1522124426508898304','2022-05-06 15:33:14','1522124426508898304','2022-05-06 15:33:14','fii',1,0),(1522479597369823232,1522069333528940544,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,'1522124426508898304','2022-05-06 15:33:17','1522124426508898304','2022-05-06 15:33:17','fii',1,0),(1522479608103047168,1522069334753677312,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,'1522124426508898304','2022-05-06 15:33:20','1522124426508898304','2022-05-06 15:33:20','fii',1,0),(1522479642081103872,1522069305611653120,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1878,'1522124426508898304','2022-05-06 15:33:28','1522124426508898304','2022-05-06 15:33:28','fii',1,0),(1522479658342420480,1522069321390624768,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10116,'1522124426508898304','2022-05-06 15:33:32','1522124426508898304','2022-05-06 15:33:32','fii',1,0),(1522479682807795712,1522069314134478848,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39452,'1522124426508898304','2022-05-06 15:33:37','1522124426508898304','2022-05-06 15:33:37','fii',1,0),(1522479699723423744,1522069296266743808,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,71897,'1522124426508898304','2022-05-06 15:33:41','1522124426508898304','2022-05-06 15:33:41','fii',1,0),(1522479723454795776,1522069295092338688,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13200,'1522124426508898304','2022-05-06 15:33:47','1522124426508898304','2022-05-06 15:33:47','fii',1,0),(1522479737073700864,1522069292751917056,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1115,'1522124426508898304','2022-05-06 15:33:50','1522124426508898304','2022-05-06 15:33:50','fii',1,0),(1522479749950214144,1522069304445636608,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4955,'1522124426508898304','2022-05-06 15:33:53','1522124426508898304','2022-05-06 15:33:53','fii',1,0),(1522479765368475648,1522069297533423616,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6138,'1522124426508898304','2022-05-06 15:33:57','1522124426508898304','2022-05-06 15:33:57','fii',1,0),(1522479787166273536,1522069278172516352,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,325,'1522124426508898304','2022-05-06 15:34:02','1522124426508898304','2022-05-06 15:34:02','fii',1,0),(1522479801246552064,1522069272443097088,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2077,'1522124426508898304','2022-05-06 15:34:06','1522124426508898304','2022-05-06 15:34:06','fii',1,0),(1522479813577805824,1522069274766741504,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1058,'1522124426508898304','2022-05-06 15:34:09','1522124426508898304','2022-05-06 15:34:09','fii',1,0),(1522479831516844032,1522069286242357248,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11560,'1522124426508898304','2022-05-06 15:34:13','1522124426508898304','2022-05-06 15:34:13','fii',1,0),(1522479848927399936,1522069287475482624,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2500,'1522124426508898304','2022-05-06 15:34:17','1522124426508898304','2022-05-06 15:34:17','fii',1,0),(1522479863901065216,1522069283985821696,2021,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,366,'1522124426508898304','2022-05-06 15:34:21','1522124426508898304','2022-05-06 15:34:21','fii',1,0),(1530071472410857472,1522069297533423616,2022,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,'1522764372735299584','2022-05-27 14:20:41','1522764372735299584','2022-05-27 14:20:41','fii',1,0),(1531179569124610048,1522069275869843456,2024,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,700,'1522124426508898304','2022-05-30 15:43:52','1522124426508898304','2022-05-30 15:43:52','fii',1,0),(1531186194975690752,1522069275869843456,2024,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,700,'1522124426508898304','2022-05-30 16:10:12','1522124426508898304','2022-05-30 16:10:12','fii',1,0),(1535148589532188672,1522069286242357248,2022,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,'1522811215561232384','2022-06-10 14:35:20','1522811215561232384','2022-06-10 14:35:20','fii',1,0),(1536171220368756736,1522069274766741504,2023,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1111,'1522516714938568704','2022-06-13 10:18:54','1522516714938568704','2022-06-13 10:18:54','fii',1,0),(1537710211635220480,1522069286242357248,2023,3,100.000000,'百万人民币',100.000000,'百万人民币',100.000000,'百万人民币',100.000000,'km²',100,'1522811215561232384','2022-06-17 16:14:18','1522811215561232384','2022-06-17 16:14:18','fii',1,0),(1537710295076704256,1522069286242357248,2023,4,100.000000,'百万人民币',100.000000,'百万人民币',100.000000,'百万人民币',100.000000,'km²',100,'1522811215561232384','2022-06-17 16:14:38','1522811215561232384','2022-06-17 16:14:38','fii',1,0),(1538787940602351616,1522069272443097088,2024,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1000,'1522400039505367040','2022-06-20 15:36:49','1522400039505367040','2022-06-20 15:36:49','fii',1,0),(1539855430623301632,1522069274766741504,2023,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,222,'1522516714938568704','2022-06-23 14:18:38','1522516714938568704','2022-06-23 14:18:38','fii',1,0),(1541708170026684416,1522069274766741504,2022,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,'1522516714938568704','2022-06-28 17:00:46','1522516714938568704','2022-06-28 17:00:46','fii',1,0),(1541976695182069760,1522069297533423616,2023,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,129,'1522764372735299584','2022-06-29 10:47:47','1522764372735299584','2022-06-29 10:47:47','fii',1,0),(1541979921964994560,1522069238142078976,2020,0,100.000000,'百万人民币',100.000000,'百万人民币',100.000000,'百万人民币',100.000000,'km²',3566,'1522049824223006720','2022-06-29 11:00:37','1522049824223006720','2022-06-29 11:00:37','fii',1,0),(1541979940956803072,1522069238142078976,2021,0,100.000000,'百万人民币',100.000000,'百万人民币',100.000000,'百万人民币',100.000000,'km²',3566,'1522049824223006720','2022-06-29 11:00:41','1522049824223006720','2022-06-29 11:00:41','fii',1,0),(1542526633590788096,1522069327317176320,2022,0,NULL,'百万人民币',NULL,'百万人民币',NULL,'百万人民币',NULL,'km²',100,'1522780159139254272','2022-06-30 23:13:03','1522780159139254272','2022-06-30 23:13:03','fii',1,0),(1542526988760256512,1522069327317176320,2024,3,NULL,'百万人民币',NULL,'百万人民币',NULL,'百万人民币',NULL,'km²',100,'1522780159139254272','2022-06-30 23:14:28','1522780159139254272','2022-06-30 23:14:28','fii',1,0),(1544889668963799040,1522069344127946752,2024,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'1542418023883870208','2022-07-07 11:42:54','1542418023883870208','2022-07-07 11:42:54','fii',1,0),(1545295541569720320,1522069274766741504,2025,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,'1522516714938568704','2022-07-08 14:35:42','1522516714938568704','2022-07-08 14:35:42','fii',1,0),(1545296238407192576,1522069274766741504,2025,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,'1522516714938568704','2022-07-08 14:38:28','1522516714938568704','2022-07-08 14:38:28','fii',1,0),(1545316643272527872,1522069344127946752,2025,1,NULL,'百万人民币',NULL,'百万人民币',NULL,'百万人民币',NULL,'km²',500,'1522106105617059840','2022-07-08 15:59:33','1522106105617059840','2022-07-08 15:59:33','fii',5,0),(1545327072833048576,1522069286242357248,2027,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'1541622015205707776','2022-07-08 16:41:00','1541622015205707776','2022-07-08 16:41:00','fii',1,0),(1546320287379886080,1522069286242357248,2027,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'1541622015205707776','2022-07-11 10:27:40','1541622015205707776','2022-07-11 10:27:40','fii',1,0),(1546391911726714880,1522069344127946752,2027,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'1542418023883870208','2022-07-11 15:12:17','1542418023883870208','2022-07-11 15:12:17','fii',1,0),(1546669679660109824,1522069344127946752,2025,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,'1545215002015830016','2022-07-12 09:36:02','1545215002015830016','2022-07-12 09:36:02','fii',1,0),(1546757226608332800,1522069238142078976,2022,0,100000.000000,'百万美元',1000.000000,'亿人民币',10000.000000,'百万人民币',4.000000,'km²',120000,'1522049922155810816','2022-07-12 15:23:55','1522049922155810816','2022-07-12 15:23:55','fii',6,0),(1547868366805536768,1522069338524356608,2022,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1000,'1547857988910452736','2022-07-15 16:59:11','1547857988910452736','2022-07-15 16:59:11','fii',1,0),(1549937165457297408,1522069344127946752,2026,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'1542418023883870208','2022-07-21 09:59:51','1542418023883870208','2022-07-21 09:59:51','fii',1,0),(1552132252949942272,1522069344127946752,2023,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,'1522106105617059840','2022-07-27 11:22:21','1522106105617059840','2022-07-27 11:22:21','fii',1,0),(1552218174261432320,1522069344127946752,2022,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,111,'1522106105617059840','2022-07-27 17:03:46','1522106105617059840','2022-07-27 17:03:46','fii',1,0),(1552846934853685248,1522069286242357248,2025,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,'1541622015205707776','2022-07-29 10:42:14','1541622015205707776','2022-07-29 10:42:14','fii',1,0),(1562639471801929728,1478968648273105000,2021,1,2021.000000,'亿美元',200.000000,'亿人民币',300.000000,'百万美元',10.000000,'km²',2021,'1522049824223006720','2022-08-25 11:14:17','1522049824223006720','2022-08-25 11:14:17','fii',1,0);
/*!40000 ALTER TABLE `org_operation_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_operation_message`
--

DROP TABLE IF EXISTS `org_operation_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_operation_message` (
  `id` bigint NOT NULL COMMENT '主键id',
  `year` int NOT NULL COMMENT '年份',
  `quarter` int NOT NULL COMMENT '季度',
  `org_id` bigint NOT NULL COMMENT '组织id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `content` varchar(200) NOT NULL COMMENT '内容',
  `status` int NOT NULL COMMENT '通知状态',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `delete_flag` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='待更新的运营信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_operation_message`
--

LOCK TABLES `org_operation_message` WRITE;
/*!40000 ALTER TABLE `org_operation_message` DISABLE KEYS */;
INSERT INTO `org_operation_message` VALUES (1565245364225839104,2021,1,1522069238142078976,1522049824223006720,'您需要完善2021年Q1运营信息',1,'2022-09-01 15:49:10','2022-09-01 15:49:10','fii',0),(1565245364565577728,2021,2,1522069238142078976,1522049824223006720,'您需要完善2021年Q2运营信息',1,'2022-09-01 15:49:10','2022-09-01 15:49:10','fii',0),(1565245364909510656,2021,3,1522069238142078976,1522049824223006720,'您需要完善2021年Q3运营信息',1,'2022-09-01 15:49:11','2022-09-01 15:49:11','fii',0),(1565245365039534080,2021,4,1522069238142078976,1522049824223006720,'您需要完善2021年Q4运营信息',1,'2022-09-01 15:49:11','2022-09-01 15:49:11','fii',0),(1565245365094060032,2022,1,1522069238142078976,1522049824223006720,'您需要完善2022年Q1运营信息',1,'2022-09-01 15:49:11','2022-09-01 15:49:11','fii',0),(1565245365169557504,2022,2,1522069238142078976,1522049824223006720,'您需要完善2022年Q2运营信息',1,'2022-09-01 15:49:11','2022-09-01 15:49:11','fii',0),(1565245365232472064,2022,3,1522069238142078976,1522049824223006720,'您需要完善2022年Q3运营信息',1,'2022-09-01 15:49:11','2022-09-01 15:49:11','fii',0),(1565520124595802112,2021,2,1522069238142078976,1565520123706609664,'您需要完善2021年Q2运营信息',1,'2022-09-02 10:00:58','2022-09-02 10:00:58','fii',0),(1565520124755185664,2021,1,1522069238142078976,1565520123706609664,'您需要完善2021年Q1运营信息',1,'2022-09-02 10:00:58','2022-09-02 10:00:58','fii',0),(1565520124864237568,2022,1,1522069238142078976,1565520123706609664,'您需要完善2022年Q1运营信息',1,'2022-09-02 10:00:58','2022-09-02 10:00:58','fii',0),(1565520124973289472,2021,4,1522069238142078976,1565520123706609664,'您需要完善2021年Q4运营信息',1,'2022-09-02 10:00:58','2022-09-02 10:00:58','fii',0),(1565520125040398336,2022,2,1522069238142078976,1565520123706609664,'您需要完善2022年Q2运营信息',1,'2022-09-02 10:00:58','2022-09-02 10:00:58','fii',0),(1565520125124284416,2021,3,1522069238142078976,1565520123706609664,'您需要完善2021年Q3运营信息',1,'2022-09-02 10:00:58','2022-09-02 10:00:58','fii',0),(1565616077906513920,2021,2,1522069238142078976,1565616077130567680,'您需要完善2021年Q2运营信息',1,'2022-09-02 16:22:15','2022-09-02 16:22:15','fii',0),(1565616078070091776,2021,1,1522069238142078976,1565616077130567680,'您需要完善2021年Q1运营信息',1,'2022-09-02 16:22:15','2022-09-02 16:22:15','fii',0),(1565616078187532288,2022,1,1522069238142078976,1565616077130567680,'您需要完善2022年Q1运营信息',1,'2022-09-02 16:22:15','2022-09-02 16:22:15','fii',0),(1565616078300778496,2021,4,1522069238142078976,1565616077130567680,'您需要完善2021年Q4运营信息',1,'2022-09-02 16:22:15','2022-09-02 16:22:15','fii',0),(1565616078409830400,2022,2,1522069238142078976,1565616077130567680,'您需要完善2022年Q2运营信息',1,'2022-09-02 16:22:15','2022-09-02 16:22:15','fii',0),(1565616078502105088,2021,3,1522069238142078976,1565616077130567680,'您需要完善2021年Q3运营信息',1,'2022-09-02 16:22:16','2022-09-02 16:22:16','fii',0);
/*!40000 ALTER TABLE `org_operation_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_operation_message_schedule`
--

DROP TABLE IF EXISTS `org_operation_message_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_operation_message_schedule` (
  `id` bigint NOT NULL COMMENT '主键id',
  `year` int NOT NULL COMMENT '年份',
  `quarter` int NOT NULL COMMENT '季度',
  `org_id` bigint NOT NULL COMMENT '组织id',
  `next_time` datetime NOT NULL COMMENT '下次任务时间',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `delete_flag` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='待更新的运营信息通知定时任务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_operation_message_schedule`
--

LOCK TABLES `org_operation_message_schedule` WRITE;
/*!40000 ALTER TABLE `org_operation_message_schedule` DISABLE KEYS */;
INSERT INTO `org_operation_message_schedule` VALUES (1565245363084988416,2022,4,1522069310518988800,'2022-10-01 00:00:00','2022-09-01 15:49:10','2022-09-01 15:49:10','fii',0),(1565245363609276416,2022,4,1522069238142078976,'2022-10-01 00:00:00','2022-09-01 15:49:10','2022-09-01 15:49:10','fii',0),(1565245365274415104,2022,4,1522069302193295360,'2022-10-01 00:00:00','2022-09-01 15:49:11','2022-09-01 15:49:11','fii',0);
/*!40000 ALTER TABLE `org_operation_message_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_tree`
--

DROP TABLE IF EXISTS `org_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_tree` (
  `id` bigint NOT NULL COMMENT '主键id',
  `ancestor_org_id` bigint NOT NULL DEFAULT '0' COMMENT '父组织id或祖先组织id',
  `ancestor_type` int NOT NULL DEFAULT '0' COMMENT '父组织或祖先组织类型',
  `level` int NOT NULL DEFAULT '0' COMMENT '层级关系',
  `org_id` bigint NOT NULL DEFAULT '0' COMMENT '组织id',
  `type` int NOT NULL DEFAULT '0' COMMENT '组织类型',
  `is_root` int NOT NULL DEFAULT '0' COMMENT '是否是根节点',
  `created_by` varchar(32) NOT NULL COMMENT '创建人工号',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) NOT NULL COMMENT '更新人工号',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `revision` int NOT NULL DEFAULT '1' COMMENT '乐观锁',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='组织关系树';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_tree`
--

LOCK TABLES `org_tree` WRITE;
/*!40000 ALTER TABLE `org_tree` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_tree_history`
--

DROP TABLE IF EXISTS `org_tree_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_tree_history` (
  `id` bigint NOT NULL COMMENT '主键id',
  `year` int NOT NULL DEFAULT '1970' COMMENT '年份',
  `quarter` int NOT NULL DEFAULT '0' COMMENT '季度',
  `detail` json NOT NULL COMMENT '具体数据',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人工号',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新人工号',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `revision` int NOT NULL DEFAULT '1' COMMENT '乐观锁',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='组织关系树';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_tree_history`
--

LOCK TABLES `org_tree_history` WRITE;
/*!40000 ALTER TABLE `org_tree_history` DISABLE KEYS */;
INSERT INTO `org_tree_history` VALUES (1522069269129596928,2020,1,'[{\"id\": 1522069257842724864, \"type\": \"NO_INVENTORY\", \"level\": 0, \"orgId\": 1522069238142078976, \"isRoot\": 1, \"tenantId\": \"fii\", \"createdBy\": \"1522049591531409408\", \"updatedBy\": \"1522049591531409408\", \"createdTime\": \"2022-05-05T12:22:44.437\", \"ancestorType\": \"NO_INVENTORY\", \"ancestorOrgId\": 1522069238142078976}, {\"id\": 1522069302356873217, \"type\": \"NO_INVENTORY\", \"level\": 1, \"orgId\": 1522069302193295360, \"isRoot\": 0, \"tenantId\": \"fii\", \"createdBy\": \"1522049591531409408\", \"updatedBy\": \"1522049591531409408\", \"ancestorType\": \"NO_INVENTORY\", \"ancestorOrgId\": 1522069238142078976}, {\"id\": 1522069310808395778, \"type\": \"INVENTORY\", \"level\": 1, \"orgId\": 1522069310518988800, \"isRoot\": 0, \"tenantId\": \"fii\", \"createdBy\": \"1522049591531409408\", \"updatedBy\": \"1522049591531409408\", \"ancestorType\": \"NO_INVENTORY\", \"ancestorOrgId\": 1522069302193295360}, {\"id\": 1522069310808395776, \"type\": \"INVENTORY\", \"level\": 0, \"orgId\": 1522069310518988800, \"isRoot\": 0, \"tenantId\": \"fii\", \"createdBy\": \"1522049591531409408\", \"updatedBy\": \"1522049591531409408\", \"ancestorType\": \"INVENTORY\", \"ancestorOrgId\": 1522069310518988800}, {\"id\": 1522069302356873216, \"type\": \"NO_INVENTORY\", \"level\": 0, \"orgId\": 1522069302193295360, \"isRoot\": 0, \"tenantId\": \"fii\", \"createdBy\": \"1522049591531409408\", \"updatedBy\": \"1522049591531409408\", \"ancestorType\": \"NO_INVENTORY\", \"ancestorOrgId\": 1522069302193295360}, {\"id\": 1522069310808395777, \"type\": \"INVENTORY\", \"level\": 2, \"orgId\": 1522069310518988800, \"isRoot\": 0, \"tenantId\": \"fii\", \"createdBy\": \"1522049591531409408\", \"updatedBy\": \"1522049591531409408\", \"ancestorType\": \"NO_INVENTORY\", \"ancestorOrgId\": 1522069238142078976}]','','2022-05-05 12:22:47','','2022-05-05 12:22:47','fii',79),(1522160281315315712,2021,1,'[{\"id\": 1522069257842724864, \"type\": \"NO_INVENTORY\", \"level\": 0, \"orgId\": 1522069238142078976, \"isRoot\": 1, \"tenantId\": \"fii\", \"createdBy\": \"1522049591531409408\", \"updatedBy\": \"1522049591531409408\", \"createdTime\": \"2022-05-05T12:22:44.437\", \"ancestorType\": \"NO_INVENTORY\", \"ancestorOrgId\": 1522069238142078976}, {\"id\": 1522069302356873217, \"type\": \"NO_INVENTORY\", \"level\": 1, \"orgId\": 1522069302193295360, \"isRoot\": 0, \"tenantId\": \"fii\", \"createdBy\": \"1522049591531409408\", \"updatedBy\": \"1522049591531409408\", \"ancestorType\": \"NO_INVENTORY\", \"ancestorOrgId\": 1522069238142078976}, {\"id\": 1522069310808395778, \"type\": \"INVENTORY\", \"level\": 1, \"orgId\": 1522069310518988800, \"isRoot\": 0, \"tenantId\": \"fii\", \"createdBy\": \"1522049591531409408\", \"updatedBy\": \"1522049591531409408\", \"ancestorType\": \"NO_INVENTORY\", \"ancestorOrgId\": 1522069302193295360}, {\"id\": 1522069310808395776, \"type\": \"INVENTORY\", \"level\": 0, \"orgId\": 1522069310518988800, \"isRoot\": 0, \"tenantId\": \"fii\", \"createdBy\": \"1522049591531409408\", \"updatedBy\": \"1522049591531409408\", \"ancestorType\": \"INVENTORY\", \"ancestorOrgId\": 1522069310518988800}, {\"id\": 1522069302356873216, \"type\": \"NO_INVENTORY\", \"level\": 0, \"orgId\": 1522069302193295360, \"isRoot\": 0, \"tenantId\": \"fii\", \"createdBy\": \"1522049591531409408\", \"updatedBy\": \"1522049591531409408\", \"ancestorType\": \"NO_INVENTORY\", \"ancestorOrgId\": 1522069302193295360}, {\"id\": 1522069310808395777, \"type\": \"INVENTORY\", \"level\": 2, \"orgId\": 1522069310518988800, \"isRoot\": 0, \"tenantId\": \"fii\", \"createdBy\": \"1522049591531409408\", \"updatedBy\": \"1522049591531409408\", \"ancestorType\": \"NO_INVENTORY\", \"ancestorOrgId\": 1522069238142078976}]','','2022-05-05 18:24:26','','2022-05-05 18:24:26','fii',29);
/*!40000 ALTER TABLE `org_tree_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outsourcing_energy`
--

DROP TABLE IF EXISTS `outsourcing_energy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outsourcing_energy` (
  `id` bigint NOT NULL COMMENT '主键',
  `inventory_id` bigint NOT NULL COMMENT '碳盘查报告id',
  `quantity` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '数量',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '能源类型',
  `fuel_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '燃料单位',
  `carbon_emission` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '二氧化碳排放',
  `carbon_emission_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '二氧化碳排放单位',
  `data_source` varchar(200) NOT NULL DEFAULT '' COMMENT '数据来源',
  `revision` int NOT NULL COMMENT '乐观锁',
  `created_by` varchar(32) NOT NULL COMMENT '创建人工号',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(20) NOT NULL COMMENT '更新人工号',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `delete_flag` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `region` varchar(30) NOT NULL DEFAULT '' COMMENT '区域',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='外购能源';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outsourcing_energy`
--

LOCK TABLES `outsourcing_energy` WRITE;
/*!40000 ALTER TABLE `outsourcing_energy` DISABLE KEYS */;
/*!40000 ALTER TABLE `outsourcing_energy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_emission`
--

DROP TABLE IF EXISTS `process_emission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `process_emission` (
  `id` bigint NOT NULL COMMENT '主键',
  `inventory_id` bigint NOT NULL COMMENT '碳盘查报告id',
  `process` varchar(30) NOT NULL DEFAULT '' COMMENT '制程',
  `quantity` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '数量',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '气体类型',
  `fuel_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '燃料单位',
  `carbon_emission` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '二氧化碳排放',
  `carbon_emission_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '二氧化碳排放单位',
  `factor` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '排放因子',
  `factor_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '排放因子单位',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `data_source` varchar(200) NOT NULL DEFAULT '' COMMENT '数据来源',
  `revision` int NOT NULL COMMENT '乐观锁',
  `created_by` varchar(32) NOT NULL COMMENT '创建人工号',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(20) NOT NULL COMMENT '更新人工号',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `delete_flag` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='制程排放';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_emission`
--

LOCK TABLES `process_emission` WRITE;
/*!40000 ALTER TABLE `process_emission` DISABLE KEYS */;
/*!40000 ALTER TABLE `process_emission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summary_scope_three`
--

DROP TABLE IF EXISTS `summary_scope_three`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary_scope_three` (
  `id` bigint NOT NULL COMMENT '主键',
  `inventory_id` bigint NOT NULL COMMENT '碳盘查报告id',
  `scope_three_type_enum` int NOT NULL COMMENT '类别（1~15类）',
  `group_enum` int DEFAULT NULL COMMENT '具体板块',
  `quantity` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '数量',
  `quantity_input` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '数量',
  `currency` varchar(255) NOT NULL DEFAULT 'USD',
  `currency_rate` decimal(24,6) NOT NULL DEFAULT '0.000000',
  `fuel_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '燃料单位',
  `factor_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '排放因子单位',
  `factor` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '排放因子',
  `carbon_emission` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '二氧化碳排放',
  `carbon_emission_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '二氧化碳排放单位',
  `source` varchar(400) DEFAULT '' COMMENT '排放因子来源',
  `detail` varchar(500) NOT NULL DEFAULT '' COMMENT '其他属性',
  `revision` int NOT NULL COMMENT '乐观锁',
  `created_by` varchar(32) NOT NULL COMMENT '创建人工号',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(20) NOT NULL COMMENT '更新人工号',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `delete_flag` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='范围三排放清单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summary_scope_three`
--

LOCK TABLES `summary_scope_three` WRITE;
/*!40000 ALTER TABLE `summary_scope_three` DISABLE KEYS */;
/*!40000 ALTER TABLE `summary_scope_three` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_permission`
--

DROP TABLE IF EXISTS `sys_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_permission` (
  `id` bigint NOT NULL COMMENT '主键id',
  `permission_name` varchar(50) NOT NULL DEFAULT '' COMMENT '权限名称',
  `permission_code` varchar(100) DEFAULT '' COMMENT '权限标识',
  `parent_id` bigint DEFAULT NULL COMMENT '父权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_permission`
--

LOCK TABLES `sys_permission` WRITE;
/*!40000 ALTER TABLE `sys_permission` DISABLE KEYS */;
INSERT INTO `sys_permission` VALUES (111,'碳盘查','carbon_inventory',NULL),(222,'报告查看','carbon_inventory:view',111),(333,'报告编辑','carbon_inventory:update',111),(444,'报告提交','carbon_inventory:submit',111),(555,'碳盘查管理','carbon_manager',NULL),(666,'发起碳盘查','carbon_manager:start',555),(777,'修改截止时间','carbon_manager:update_deadline',555),(888,'查看报告','carbon_manager:view',555),(999,'组织信息','org_info',NULL),(1111,'组织树（全）','org_info:org_structure',999),(1112,'动态','carbon_inventory:dynamic_message',111),(1113,'通知','carbon_inventory:notice',111),(2222,'账号与权限管理','org_info:authority',999),(3333,'新建账号','org_info:authority:new_account',2222),(4444,'编辑账号','org_info:authority:update_account',2222),(5551,'动态','carbon_manager:dynamic_message',555),(5552,'通知','carbon_manager:notice',555),(5555,'组织信息维护','org_info:info_maintenance',999),(6666,'编辑基础信息','org_info:info_maintenance:edit_basic_info',5555),(7777,'更新运营信息','org_info:info_maintenance:update_oper_info',5555),(9990,'基础信息（全）','org_info:base_info',999),(9991,'运营信息（全）','org_info:org_operation_info:all',999),(9992,'运营信息（自己+下属）','org_info:org_operation_info:sub',999),(9993,'运营信息（自己）','org_info:org_operation_info:self',999),(9994,'组织树（全）','carbon_manager:org_tree:all',555),(9995,'组织树（本组织+下属）','carbon_manager:org_tree:sub',555);
/*!40000 ALTER TABLE `sys_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `id` bigint NOT NULL COMMENT '主键id',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色类型',
  `role_org_type` int NOT NULL COMMENT '角色组织类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (11,'管理员',1),(22,'用户',1),(33,'主管',1),(44,'管理员',2),(55,'用户',2),(66,'主管',2),(77,'管理员',3),(88,'用户',3),(99,'主管',3);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_permission`
--

DROP TABLE IF EXISTS `sys_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_permission` (
  `id` bigint NOT NULL COMMENT '主键id',
  `permission_id` bigint NOT NULL COMMENT '权限id',
  `role_id` bigint NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色-权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_permission`
--

LOCK TABLES `sys_role_permission` WRITE;
/*!40000 ALTER TABLE `sys_role_permission` DISABLE KEYS */;
INSERT INTO `sys_role_permission` VALUES (1,555,11),(2,666,11),(3,777,11),(4,888,11),(5,999,11),(7,2222,11),(8,3333,11),(9,4444,11),(10,5555,11),(11,6666,11),(12,7777,11),(13,555,22),(14,888,22),(15,999,22),(17,555,33),(18,888,33),(19,999,33),(24,555,44),(25,888,44),(26,999,44),(27,2222,44),(28,3333,44),(29,4444,44),(30,5555,44),(31,6666,44),(32,7777,44),(33,555,55),(34,888,55),(35,999,55),(37,555,66),(38,888,66),(39,999,66),(44,111,77),(45,222,77),(46,333,77),(47,444,77),(48,999,77),(49,2222,77),(50,3333,77),(51,4444,77),(52,5555,77),(53,6666,77),(54,7777,77),(55,111,88),(56,222,88),(57,333,88),(59,444,88),(60,999,88),(62,555,99),(63,888,99),(64,999,99),(68,9990,11),(69,9990,22),(70,9990,33),(71,9990,44),(72,9990,55),(73,9990,66),(74,9990,77),(75,9990,88),(76,9990,99),(77,9991,11),(79,9991,33),(80,9992,44),(82,9992,66),(83,9993,77),(85,9993,99),(86,9994,11),(87,9994,22),(88,9994,33),(89,9995,44),(90,9995,55),(91,9995,66),(92,1111,11),(93,1111,22),(94,1111,33),(95,1111,44),(96,1111,55),(97,1111,66),(98,1111,77),(99,1111,88),(100,1111,99),(101,5551,11),(102,5551,22),(103,5551,33),(104,5551,44),(105,5551,55),(106,5551,66),(107,5551,99),(108,5552,11),(109,5552,22),(110,5552,33),(111,5552,99),(112,1112,77),(113,1112,88),(114,1113,77),(115,1113,88);
/*!40000 ALTER TABLE `sys_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `id` bigint NOT NULL COMMENT '主键id',
  `account_number` varchar(50) NOT NULL COMMENT '账号',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(200) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(50) NOT NULL DEFAULT '' COMMENT '盐值',
  `org_id` bigint DEFAULT NULL COMMENT '所属组织id',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新人id',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `revision` int NOT NULL DEFAULT '1' COMMENT '乐观锁',
  `delete_flag` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uindex` (`account_number`,`delete_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1522049824223006720,'admin','管理员','b2042c185ac3d37c9b50b3b1bb1c3ec7b0f52f9b1106b5586257d6e2ef087092','qHDeI964rO0cg3YsJ2w7',1522069238142078976,'','2022-05-06 03:05:31','','2022-05-06 03:05:31',11,0);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL COMMENT '主键id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `role_id` bigint NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户-角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1522049824281726976,1522049824223006720,11);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_custom_emission_factor`
--

DROP TABLE IF EXISTS `tb_custom_emission_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_custom_emission_factor` (
  `id` bigint NOT NULL COMMENT '主键',
  `category1` bigint NOT NULL COMMENT '分类1',
  `category2` bigint NOT NULL COMMENT '分类2',
  `factor_name` varchar(40) NOT NULL COMMENT '因子名称',
  `emission_gas_type` varchar(40) NOT NULL COMMENT '排放气体类型',
  `protocol_version` varchar(100) NOT NULL COMMENT '协议版本',
  `carbon_emission_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '排放气体单位',
  `fuel_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '活动数据单位',
  `factor` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '排放因子数值',
  `density` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '密度',
  `density_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '密度单位',
  `density_source` varchar(200) NOT NULL DEFAULT '' COMMENT '密度来源',
  `heat_value` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '热值',
  `heat_value_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '热值单位',
  `heat_value_source` varchar(200) NOT NULL DEFAULT '' COMMENT '热值来源',
  `car_con_per_heat_value` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '单位热值含碳量',
  `ca_con_per_heat_value_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '单位热值含碳量单位',
  `ca_con_per_heat_value_source` varchar(200) NOT NULL DEFAULT '' COMMENT '单位热值含碳量来源',
  `carbon_oxidation_rate` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '碳氧化率',
  `carbon_oxidation_rate_source` varchar(200) NOT NULL DEFAULT '' COMMENT '碳氧化率来源',
  `country` varchar(30) NOT NULL DEFAULT '' COMMENT '国家',
  `region` varchar(30) NOT NULL DEFAULT '' COMMENT '地区',
  `industry` varchar(30) NOT NULL DEFAULT '' COMMENT '行业',
  `source` varchar(200) NOT NULL DEFAULT '' COMMENT '来源',
  `year` int NOT NULL DEFAULT '1970' COMMENT '年份',
  `org_id` bigint NOT NULL COMMENT '组织id',
  `revision` int NOT NULL COMMENT '乐观锁',
  `created_by` varchar(32) NOT NULL COMMENT '创建人工号',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(20) NOT NULL COMMENT '更新人工号',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `delete_flag` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `emission_factor_type_enum` int NOT NULL DEFAULT '1' COMMENT '因子类型',
  `attachment_id` bigint DEFAULT NULL COMMENT '附件id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='自定义因子库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_custom_emission_factor`
--

LOCK TABLES `tb_custom_emission_factor` WRITE;
/*!40000 ALTER TABLE `tb_custom_emission_factor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_custom_emission_factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_inventory_status`
--

DROP TABLE IF EXISTS `tb_inventory_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_inventory_status` (
  `id` bigint NOT NULL COMMENT '主键id',
  `org_id` bigint NOT NULL COMMENT '组织id',
  `year` int NOT NULL COMMENT '年份',
  `quarter` int NOT NULL COMMENT '季度',
  `status` int NOT NULL COMMENT '状态',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `revision` int NOT NULL COMMENT '乐观锁',
  `created_by` varchar(32) NOT NULL COMMENT '创建人工号',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(20) NOT NULL COMMENT '更新人工号',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `delete_flag` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uindex` (`org_id`,`year`,`quarter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='碳排报告状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_inventory_status`
--

LOCK TABLES `tb_inventory_status` WRITE;
/*!40000 ALTER TABLE `tb_inventory_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_inventory_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sys_emission_factor`
--

DROP TABLE IF EXISTS `tb_sys_emission_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_sys_emission_factor` (
  `id` bigint NOT NULL COMMENT '主键',
  `category1` varchar(20) NOT NULL COMMENT '分类1',
  `category2` varchar(20) DEFAULT NULL COMMENT '分类2',
  `factor_name` varchar(40) NOT NULL COMMENT '因子名称',
  `emission_gas_type` varchar(40) NOT NULL COMMENT '排放气体类型',
  `protocol_version` varchar(100) NOT NULL COMMENT '协议版本',
  `carbon_emission_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '排放气体单位',
  `fuel_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '活动数据单位',
  `factor` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '排放因子数值',
  `factor_unit` varchar(40) DEFAULT NULL COMMENT '排放因子单位',
  `density` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '密度',
  `density_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '密度单位',
  `density_source` varchar(200) NOT NULL DEFAULT '' COMMENT '密度来源',
  `heat_value` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '热值',
  `heat_value_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '热值单位',
  `heat_value_source` varchar(200) NOT NULL DEFAULT '' COMMENT '热值来源',
  `ca_con_per_heat_value` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '单位热值含碳量',
  `ca_con_per_heat_value_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '单位热值含碳量单位',
  `ca_con_per_heat_value_source` varchar(200) NOT NULL DEFAULT '' COMMENT '单位热值含碳量来源',
  `carbon_oxidation_rate` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '碳氧化率',
  `carbon_oxidation_rate_source` varchar(200) NOT NULL DEFAULT '' COMMENT '碳氧化率来源',
  `country` varchar(30) NOT NULL DEFAULT '' COMMENT '国家',
  `region` varchar(30) NOT NULL DEFAULT '' COMMENT '地区',
  `industry` varchar(30) NOT NULL DEFAULT '' COMMENT '行业',
  `source` varchar(500) NOT NULL DEFAULT '' COMMENT '来源',
  `year` int NOT NULL DEFAULT '1970' COMMENT '年份',
  `revision` int NOT NULL COMMENT '乐观锁',
  `created_by` varchar(32) NOT NULL COMMENT '创建人工号',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(20) NOT NULL COMMENT '更新人工号',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `delete_flag` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `org_id` bigint DEFAULT NULL COMMENT '组织id',
  `attachment_id` bigint DEFAULT NULL COMMENT '文件id',
  `emission_factor_type_enum` int NOT NULL COMMENT '因子类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='系统因子库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sys_emission_factor`
--

LOCK TABLES `tb_sys_emission_factor` WRITE;
/*!40000 ALTER TABLE `tb_sys_emission_factor` DISABLE KEYS */;
INSERT INTO `tb_sys_emission_factor` VALUES (1514953855631233024,'能源','固定燃烧排放','无烟煤','CO2e','AR4','t','t',1.970000,'t/t',0.000000,'','',20908.000000,'kJ/kg','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',27.400000,'tC/TJ','《省级温室气体清单编制指南》',94.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:40','1514943054748979200','2022-04-15 21:08:40',0,NULL,-1,3),(1514953856012914688,'能源','固定燃烧排放','烟煤','CO2e','AR4','t','t',1.860000,'t/t',0.000000,'','',20908.000000,'kJ/kg','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',26.100000,'tC/TJ','《省级温室气体清单编制指南》',93.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:40','1514943054748979200','2022-04-15 21:08:40',0,NULL,-1,3),(1514953856302321664,'能源','固定燃烧排放','褐煤','CO2e','AR4','t','t',2.060000,'t/t',0.000000,'','',20908.000000,'kJ/kg','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',28.000000,'tC/TJ','《省级温室气体清单编制指南》',96.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:40','1514943054748979200','2022-04-15 21:08:40',0,NULL,-1,3),(1514953856591728640,'能源','固定燃烧排放','洗精煤','CO2e','AR4','t','t',2.450000,'t/t',0.000000,'','',26344.000000,'kJ/kg','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',25.410000,'tC/TJ','《省级温室气体清单编制指南》',100.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:41','1514943054748979200','2022-04-15 21:08:41',0,NULL,-1,3),(1514953856868552704,'能源','固定燃烧排放','洗中煤','CO2e','AR4','t','t',0.780000,'t/t',0.000000,'','',8363.000000,'kJ/kg','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',25.410000,'tC/TJ','《省级温室气体清单编制指南》',100.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:41','1514943054748979200','2022-04-15 21:08:41',0,NULL,-1,3),(1514953857145376768,'能源','固定燃烧排放','煤泥','CO2e','AR4','t','t',1.170000,'t/t',0.000000,'','',12545.000000,'kJ/kg','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',25.410000,'tC/TJ','《省级温室气体清单编制指南》',100.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:41','1514943054748979200','2022-04-15 21:08:41',0,NULL,-1,3),(1514953857430589440,'能源','固定燃烧排放','焦炭','CO2e','AR4','t','t',2.850000,'t/t',0.000000,'','',28435.000000,'kJ/kg','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',29.420000,'tC/TJ','《省级温室气体清单编制指南》',93.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:41','1514943054748979200','2022-04-15 21:08:41',0,NULL,-1,3),(1514953857833242624,'能源','固定燃烧排放','原油','CO2e','AR4','t','t',3.020000,'t/t',0.000000,'','',41816.000000,'kJ/kg','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',20.080000,'tC/TJ','《省级温室气体清单编制指南》',98.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:41','1514943054748979200','2022-04-15 21:08:41',0,NULL,-1,3),(1514953858122649600,'能源','固定燃烧排放','燃料油','CO2e','AR4','t','t',3.170000,'t/t',0.000000,'','',41816.000000,'kJ/kg','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',21.100000,'tC/TJ','《省级温室气体清单编制指南》',98.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:41','1514943054748979200','2022-04-15 21:08:41',0,NULL,-1,3),(1514953858391085056,'能源','固定燃烧排放','汽油','CO2e','AR4','t','t',2.920000,'t/t',775.000000,'','GB 17930-2016 《车用汽油》',43070.000000,'kJ/kg','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',18.900000,'tC/TJ','《省级温室气体清单编制指南》',98.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:41','1514943054748979200','2022-04-15 21:08:41',0,NULL,-1,3),(1514953858667909120,'能源','固定燃烧排放','一般煤油','CO2e','AR4','t','t',3.030000,'t/t',840.000000,'','GB 253-2008 《煤油》',43070.000000,'kJ/kg','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',19.600000,'tC/TJ','《省级温室气体清单编制指南》',98.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:41','1514943054748979200','2022-04-15 21:08:41',0,NULL,-1,3),(1514953858940538880,'能源','固定燃烧排放','柴油','CO2e','AR4','t','t',3.100000,'t/t',845.000000,'','GB 19147-2016 《车用柴油》',42652.000000,'kJ/kg','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',20.200000,'tC/TJ','《省级温室气体清单编制指南》',98.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:41','1514943054748979200','2022-04-15 21:08:41',0,NULL,-1,3),(1514953859208974336,'能源','固定燃烧排放','液化天然气','CO2e','AR4','t','t',2.580000,'t/t',0.000000,'','',46900.000000,'kJ/kg','IPCC 第2 卷表1.2《缺省净发热值（NCVs）和95%置信区间的下限和上限》的上限值',15.320000,'tC/TJ','《省级温室气体清单编制指南》',98.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:41','1514943054748979200','2022-04-15 21:08:41',0,NULL,-1,3),(1514953859481604096,'能源','固定燃烧排放','液化石油气','CO2e','AR4','t','t',3.100000,'t/t',0.000000,'','',50179.000000,'kJ/kg','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',17.200000,'tC/TJ','《省级温室气体清单编制指南》',98.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:41','1514943054748979200','2022-04-15 21:08:41',0,NULL,-1,3),(1514953859741650944,'能源','固定燃烧排放','炼厂干气','CO2e','AR4','t','t',3.040000,'t/t',0.000000,'','',46055.000000,'kJ/kg','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',18.200000,'tC/TJ','《省级温室气体清单编制指南》',99.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:41','1514943054748979200','2022-04-15 21:08:41',0,NULL,-1,3),(1514953860010086400,'能源','固定燃烧排放','乙烷','CO2e','AR4','t','t',3.280000,'t/t',0.000000,'','',48800.000000,'kJ/kg','IPCC 第2 卷表1.2《缺省净发热值（NCVs）和95%置信区间的下限和上限》的上限值',18.700000,'tC/TJ','IPCC 第2 卷表1.3《碳含量的缺省值》的上限值',98.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:41','1514943054748979200','2022-04-15 21:08:41',0,NULL,-1,3),(1514953860303687680,'能源','固定燃烧排放','沥青','CO2e','AR4','t','t',3.260000,'t/t',0.000000,'','',41200.000000,'kJ/kg','IPCC 第2 卷表1.2《缺省净发热值（NCVs）和95%置信区间的下限和上限》的上限值',22.000000,'tC/TJ','《省级温室气体清单编制指南》',98.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:41','1514943054748979200','2022-04-15 21:08:41',0,NULL,-1,3),(1514953860572123136,'能源','固定燃烧排放','润滑油','CO2e','AR4','t','t',3.040000,'t/t',0.000000,'','',42300.000000,'kJ/kg','IPCC 第2 卷表1.2《缺省净发热值（NCVs）和95%置信区间的下限和上限》的上限值',20.000000,'tC/TJ','《省级温室气体清单编制指南》',98.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:42','1514943054748979200','2022-04-15 21:08:42',0,NULL,-1,3),(1514953860848947200,'能源','固定燃烧排放','石油焦','CO2e','AR4','t','t',4.140000,'t/t',0.000000,'','',41900.000000,'kJ/kg','IPCC 第2 卷表1.2《缺省净发热值（NCVs）和95%置信区间的下限和上限》的上限值',27.500000,'tC/TJ','《省级温室气体清单编制指南》',98.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:42','1514943054748979200','2022-04-15 21:08:42',0,NULL,-1,3),(1514953861121576960,'能源','固定燃烧排放','天然气','CO2e','AR4','t','m³',0.002200,'t/m³',0.000000,'','',38931.000000,'kJ/m3','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',15.320000,'tC/TJ','《省级温室气体清单编制指南》',99.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:42','1514943054748979200','2022-04-15 21:08:42',0,NULL,-1,3),(1514953861390012416,'能源','固定燃烧排放','焦炉煤气','CO2e','AR4','t','m³',0.000890,'t/m³',0.000000,'','',17981.000000,'kJ/m3','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',13.580000,'tC/TJ','《省级温室气体清单编制指南》',99.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:42','1514943054748979200','2022-04-15 21:08:42',0,NULL,-1,3),(1514953861654253568,'能源','固定燃烧排放','高炉煤气','CO2e','AR4','t','m³',0.000170,'t/m³',0.000000,'','',3763.000000,'kJ/m3','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',12.200000,'tC/TJ','《省级温室气体清单编制指南》',99.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:42','1514943054748979200','2022-04-15 21:08:42',0,NULL,-1,3),(1514953861922689024,'能源','固定燃烧排放','发生炉煤气','CO2e','AR4','t','m³',0.000230,'t/m³',0.000000,'','',5227.000000,'kJ/m3','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',12.200000,'tC/TJ','《省级温室气体清单编制指南》',99.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:42','1514943054748979200','2022-04-15 21:08:42',0,NULL,-1,3),(1514953862316953600,'能源','固定燃烧排放','重油催化裂解煤气','CO2e','AR4','t','m³',0.000850,'t/m³',0.000000,'','',19235.000000,'kJ/m3','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',12.200000,'tC/TJ','《省级温室气体清单编制指南》',99.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:42','1514943054748979200','2022-04-15 21:08:42',0,NULL,-1,3),(1514953862585389056,'能源','固定燃烧排放','重油热裂解煤气','CO2e','AR4','t','m³',0.001600,'t/m³',0.000000,'','',35544.000000,'kJ/m3','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',12.200000,'tC/TJ','《省级温室气体清单编制指南》',99.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:42','1514943054748979200','2022-04-15 21:08:42',0,NULL,-1,3),(1514953862849630208,'能源','固定燃烧排放','焦炭制气','CO2e','AR4','t','m³',0.000720,'t/m³',0.000000,'','',16308.000000,'kJ/m3','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',12.200000,'tC/TJ','《省级温室气体清单编制指南》',99.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:42','1514943054748979200','2022-04-15 21:08:42',0,NULL,-1,3),(1514953863113871360,'能源','固定燃烧排放','压力水化煤气','CO2e','AR4','t','m³',0.000670,'t/m³',0.000000,'','',15054.000000,'kJ/m3','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',12.200000,'tC/TJ','《省级温室气体清单编制指南》',99.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:42','1514943054748979200','2022-04-15 21:08:42',0,NULL,-1,3),(1514953863445221376,'能源','固定燃烧排放','水煤气','CO2e','AR4','t','m³',0.000460,'t/m³',0.000000,'','',10454.000000,'kJ/m3','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',12.200000,'tC/TJ','《省级温室气体清单编制指南》',99.000000,'《省级温\n室气体清单编制指南》','中国','','','',2018,3,'1514943054748979200','2022-04-15 21:08:42','1514943054748979200','2022-04-15 21:08:42',0,NULL,-1,3),(1514953863713656832,'能源',NULL,'压缩天然气','CO2e','AR4','kg','t',2542.040000,'kg/t',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2019',2019,3,'1514943054748979200','2022-04-15 21:08:42','1514943054748979200','2022-04-15 21:08:42',0,NULL,-1,1),(1514953863977897984,'能源',NULL,'液化天然气','CO2e','AR4','kg','L',1.153870,'kg/L',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2019',2019,3,'1514943054748979200','2022-04-15 21:08:42','1514943054748979200','2022-04-15 21:08:42',0,NULL,-1,1),(1514953864246333440,'能源',NULL,'液化石油气','CO2e','AR4','kg','kWh',0.230290,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2019',2019,3,'1514943054748979200','2022-04-15 21:08:42','1514943054748979200','2022-04-15 21:08:42',0,NULL,-1,1),(1514953864510574592,'能源',NULL,'天然气','CO2e','AR4','kg','kWh',0.183850,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2019',2019,3,'1514943054748979200','2022-04-15 21:08:42','1514943054748979200','2022-04-15 21:08:42',0,NULL,-1,1),(1514953864779010048,'能源',NULL,'矿物柴油','CO2e','AR4','kg','L',2.686970,'kg/L',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2019',2019,3,'1514943054748979200','2022-04-15 21:08:43','1514943054748979200','2022-04-15 21:08:43',0,NULL,-1,1),(1514953865043251200,'能源',NULL,'燃料油','CO2e','AR4','kg','L',3.177990,'kg/L',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2019',2019,3,'1514943054748979200','2022-04-15 21:08:43','1514943054748979200','2022-04-15 21:08:43',0,NULL,-1,1),(1514953865311686656,'能源',NULL,'矿物汽油','CO2e','AR4','kg','L',2.314950,'kg/L',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2019',2019,3,'1514943054748979200','2022-04-15 21:08:43','1514943054748979200','2022-04-15 21:08:43',0,NULL,-1,1),(1514953865588510720,'能源',NULL,'汽油（生物燃料混合物）','CO2e','AR4','kg','L',2.209040,'kg/L',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2019',2019,3,'1514943054748979200','2022-04-15 21:08:43','1514943054748979200','2022-04-15 21:08:43',0,NULL,-1,1),(1514953865861140480,'能源',NULL,'瓦斯油','CO2e','AR4','kg','L',2.758210,'kg/L',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2019',2019,3,'1514943054748979200','2022-04-15 21:08:43','1514943054748979200','2022-04-15 21:08:43',0,NULL,-1,1),(1514953866133770240,'能源',NULL,'柴油（生物燃料混合物）','CO2e','AR4','kg','L',2.594110,'kg/L',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2019',2019,3,'1514943054748979200','2022-04-15 21:08:43','1514943054748979200','2022-04-15 21:08:43',0,NULL,-1,1),(1514953866406400000,'能源',NULL,'石油焦炭','CO2e','AR4','kg','t',3393.760000,'kg/t',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2019',2019,3,'1514943054748979200','2022-04-15 21:08:43','1514943054748979200','2022-04-15 21:08:43',0,NULL,-1,1),(1514953866804858880,'能源',NULL,'焦炭','CO2e','AR4','kg','t',3094.600000,'kg/t',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2019',2019,3,'1514943054748979200','2022-04-15 21:08:43','1514943054748979200','2022-04-15 21:08:43',0,NULL,-1,1),(1514953867069100032,'运输','里程·重量','乘用车-汽油','CO2e','AR4','kg','km',0.256800,'kg/km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2019',2019,3,'1514943054748979200','2022-04-15 21:08:43','1514943054748979200','2022-04-15 21:08:43',0,NULL,-1,1),(1514953867354312704,'运输','里程·重量','乘用车-柴油','CO2e','AR4','kg','km',0.173360,'kg/km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2019',2019,3,'1514943054748979200','2022-04-15 21:08:43','1514943054748979200','2022-04-15 21:08:43',0,NULL,-1,1),(1514953867618553856,'运输','里程·重量','重型货车/铰接式货车-柴油','CO2e','AR4','kg','t km',0.113600,'kg/t km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','DEFRA 2018',2018,3,'1514943054748979200','2022-04-15 21:08:43','1514943054748979200','2022-04-15 21:08:43',0,NULL,-1,1),(1514953867899572224,'运输','里程·重量','重型货车/未铰接货车（总重3.5-7.5t）-柴油','CO2e','AR4','kg','t km',0.486740,'kg/t km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2019',2018,3,'1514943054748979200','2022-04-15 21:08:43','1514943054748979200','2022-04-15 21:08:43',0,NULL,-1,1),(1514953868163813376,'运输','里程·重量','轻型货车(平均载重量<1.25t)-汽油','CO2e','AR4','kg','t km',0.811500,'kg/t km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','DEFRA 2018',2018,3,'1514943054748979200','2022-04-15 21:08:43','1514943054748979200','2022-04-15 21:08:43',0,NULL,-1,1),(1514953868432248832,'运输','里程·重量','轻型货车-柴油','CO2e','AR4','kg','t km',0.256800,'kg/t km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2019',2018,3,'1514943054748979200','2022-04-15 21:08:43','1514943054748979200','2022-04-15 21:08:43',0,NULL,-1,1),(1514953868704878592,'运输','里程·重量','航空货机','CO2e','AR4','kg','t km',5.833300,'kg/t km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2020',2018,3,'1514943054748979200','2022-04-15 21:08:43','1514943054748979200','2022-04-15 21:08:43',0,NULL,-1,1),(1514953868964925440,'运输','里程·重量','海运货船','CO2e','AR4','kg','t km',0.016142,'kg/t km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2021',2018,3,'1514943054748979200','2022-04-15 21:08:44','1514943054748979200','2022-04-15 21:08:44',0,NULL,-1,1),(1514953869233360896,'能源','移动燃烧排放','汽油','CO2e','AR4','t','t',2.920000,'t/t',775.000000,'','GB 17930-2016 《车用汽油》',43070.000000,'kJ/kg','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',18.900000,'tC/TJ','《省级温室气体清单编制指南》',98.000000,'《省级温\n室气体清单编制指南》','中国','','','英国环境、食品和农村事务部(Defra)-2022',2018,3,'1514943054748979200','2022-04-15 21:08:44','1514943054748979200','2022-04-15 21:08:44',0,NULL,-1,3),(1514953869497602048,'能源','移动燃烧排放','喷气煤油','CO2e','AR4','t','t',3.020000,'t/t',840.000000,'','GB 253-2008 《煤油》',43070.000000,'kJ/kg','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',19.500000,'tC/TJ','《省级温室气体清单编制指南》',98.000000,'《省级温\n室气体清单编制指南》','中国','','','英国环境、食品和农村事务部(Defra)-2023',2018,3,'1514943054748979200','2022-04-15 21:08:44','1514943054748979200','2022-04-15 21:08:44',0,NULL,-1,3),(1514953869766037504,'能源','移动燃烧排放','柴油','CO2e','AR4','t','t',3.100000,'t/t',845.000000,'','GB 19147-2016 《车用柴油》',42652.000000,'kJ/kg','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',20.200000,'tC/TJ','《省级温室气体清单编制指南》',98.000000,'《省级温\n室气体清单编制指南》','中国','','','英国环境、食品和农村事务部(Defra)-2024',2018,3,'1514943054748979200','2022-04-15 21:08:44','1514943054748979200','2022-04-15 21:08:44',0,NULL,-1,3),(1514953870034472960,'能源','移动燃烧排放','液化石油气','CO2e','AR4','t','t',3.100000,'t/t',0.000000,'','',50179.000000,'kJ/kg','GB/T 2589-2008《综合能耗计算通则》附录A 各种能源折标煤参考系数表中的平均低位发热量以区间段给出的取其最高值',17.200000,'tC/TJ','《省级温室气体清单编制指南》',98.000000,'《省级温\n室气体清单编制指南》','中国','','','英国环境、食品和农村事务部(Defra)-2025',2018,3,'1514943054748979200','2022-04-15 21:08:44','1514943054748979200','2022-04-15 21:08:44',0,NULL,-1,3),(1514953870298714112,'能源','移动燃烧排放','液化天然气','CO2e','AR4','t','t',2.680000,'t/t',0.000000,'','',46900.000000,'kJ/kg','IPCC 第2 卷表1.2《缺省净发热值（NCVs）和95％置信区间的下限和上限》的上限值',15.900000,'tC/TJ','《2006 年IPCC 国家温室气体清单指南》第2 卷表3.2.1 《道路运输缺省CO2 排放因子和不确定性范围》',98.000000,'《省级温\n室气体清单编制指南》','中国','','','英国环境、食品和农村事务部(Defra)-2026',2018,3,'1514943054748979200','2022-04-15 21:08:44','1514943054748979200','2022-04-15 21:08:44',0,NULL,-1,3),(1514953870567149568,'外购电力',NULL,'中国华北电网','CO2e','AR4','kg','kWh',0.884300,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','华北','','中国气候变化信息网《2011 年和 2012 年中国区域电网平均二氧化碳排放因子》',2012,3,'1514943054748979200','2022-04-15 21:08:44','1514943054748979200','2022-04-15 21:08:44',0,NULL,-1,3),(1514953870831390720,'外购电力',NULL,'中国东北电网','CO2e','AR4','kg','kWh',0.776900,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','东北','','中国气候变化信息网《2011 年和 2012 年中国区域电网平均二氧化碳排放因子》',2012,3,'1514943054748979200','2022-04-15 21:08:44','1514943054748979200','2022-04-15 21:08:44',0,NULL,-1,3),(1514953871225655296,'外购电力',NULL,'中国华东电网','CO2e','AR4','kg','kWh',0.703500,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','华东','','中国气候变化信息网《2011 年和 2012 年中国区域电网平均二氧化碳排放因子》',2012,3,'1514943054748979200','2022-04-15 21:08:44','1514943054748979200','2022-04-15 21:08:44',0,NULL,-1,3),(1514953871489896448,'外购电力',NULL,'中国华中电网','CO2e','AR4','kg','kWh',0.525700,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','华中','','中国气候变化信息网《2011 年和 2012 年中国区域电网平均二氧化碳排放因子》',2012,3,'1514943054748979200','2022-04-15 21:08:44','1514943054748979200','2022-04-15 21:08:44',0,NULL,-1,3),(1514953871758331904,'外购电力',NULL,'中国西北电网','CO2e','AR4','kg','kWh',0.667100,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','西北','','中国气候变化信息网《2011 年和 2012 年中国区域电网平均二氧化碳排放因子》',2012,3,'1514943054748979200','2022-04-15 21:08:44','1514943054748979200','2022-04-15 21:08:44',0,NULL,-1,3),(1514953872026767360,'外购电力',NULL,'中国南方电网','CO2e','AR4','kg','kWh',0.527100,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','南方','','中国气候变化信息网《2011 年和 2012 年中国区域电网平均二氧化碳排放因子》',2012,3,'1514943054748979200','2022-04-15 21:08:44','1514943054748979200','2022-04-15 21:08:44',0,NULL,-1,3),(1514953872311980032,'外购电力',NULL,'全球平均电力','CO2e','AR4','kg','kWh',0.520000,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','全球','','','国际能源署（IEA）-2011',2011,3,'1514943054748979200','2022-04-15 21:08:44','1514943054748979200','2022-04-15 21:08:44',0,NULL,-1,1),(1514953872580415488,'外购电力',NULL,'巴西电网','CO2e','AR4','g','kWh',99.800000,'g/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','巴西','','','国际能源署（IEA）-2020',2020,3,'1514943054748979200','2022-04-15 21:08:44','1514943054748979200','2022-04-15 21:08:44',0,NULL,-1,2),(1514953872844656640,'外购电力',NULL,'中国平均电力','CO2e','AR4','g','kWh',616.000000,'g/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','','','国际能源署（IEA）-2020',2020,3,'1514943054748979200','2022-04-15 21:08:44','1514943054748979200','2022-04-15 21:08:44',0,NULL,-1,2),(1514953873108897792,'外购电力',NULL,'中国平均电力','CO2e','AR4','t','MWh',0.583900,'t/MWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','','','中国生态环境部《企业温室气体排放核算方法与报告指南 发电设施（2021年修订版）》',2021,3,'1514943054748979200','2022-04-15 21:08:44','1514943054748979200','2022-04-15 21:08:44',0,NULL,-1,2),(1514953873377333248,'外购电力',NULL,'捷克共和国','CO2e','AR4','g','kWh',495.600000,'g/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','捷克共和国','','','国际能源署（IEA）-2020',2020,3,'1514943054748979200','2022-04-15 21:08:45','1514943054748979200','2022-04-15 21:08:45',0,NULL,-1,2),(1514953873645768704,'外购电力',NULL,'匈牙利电网','CO2e','AR4','g','kWh',253.900000,'g/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','匈牙利','','','国际能源署（IEA）-2020',2020,3,'1514943054748979200','2022-04-15 21:08:45','1514943054748979200','2022-04-15 21:08:45',0,NULL,-1,2),(1514953873918398464,'外购电力',NULL,'印度电网','CO2e','AR4','g','kWh',751.900000,'g/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','印度','','','国际能源署（IEA）-2020',2020,3,'1514943054748979200','2022-04-15 21:08:45','1514943054748979200','2022-04-15 21:08:45',0,NULL,-1,2),(1514953874186833920,'外购电力',NULL,'墨西哥电网','CO2e','AR4','g','kWh',456.300000,'g/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','墨西哥','','','国际能源署（IEA）-2020',2020,3,'1514943054748979200','2022-04-15 21:08:45','1514943054748979200','2022-04-15 21:08:45',0,NULL,-1,2),(1514953874451075072,'外购电力',NULL,'新加坡电网','CO2e','AR4','g','kWh',389.100000,'g/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','新加坡','','','国际能源署（IEA）-2020',2020,3,'1514943054748979200','2022-04-15 21:08:45','1514943054748979200','2022-04-15 21:08:45',0,NULL,-1,2),(1514953874719510528,'外购电力',NULL,'中国台湾电力','CO2e','AR4','g','kWh',559.000000,'g/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','台湾','','国际能源署（IEA）-2020',2020,3,'1514943054748979200','2022-04-15 21:08:45','1514943054748979200','2022-04-15 21:08:45',0,NULL,-1,3),(1514953874983751680,'外购电力',NULL,'美国AKGD电网','CO2e','AR4','kg','kWh',0.473987,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:45','1514943054748979200','2022-04-15 21:08:45',0,NULL,-1,3),(1514953875260575744,'外购电力',NULL,'美国AKMS电网','CO2e','AR4','kg','kWh',0.238986,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:45','1514943054748979200','2022-04-15 21:08:45',0,NULL,-1,3),(1514953875654840320,'外购电力',NULL,'美国AZNM电网','CO2e','AR4','kg','kWh',0.466092,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:45','1514943054748979200','2022-04-15 21:08:45',0,NULL,-1,3),(1514953875914887168,'外购电力',NULL,'美国CAMX电网','CO2e','AR4','kg','kWh',0.226151,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:45','1514943054748979200','2022-04-15 21:08:45',0,NULL,-1,3),(1514953876179128320,'外购电力',NULL,'美国ERCT电网','CO2e','AR4','kg','kWh',0.424564,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:45','1514943054748979200','2022-04-15 21:08:45',0,NULL,-1,3),(1514953876443369472,'外购电力',NULL,'美国FRCC电网','CO2e','AR4','kg','kWh',0.424641,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:45','1514943054748979200','2022-04-15 21:08:45',0,NULL,-1,3),(1514953876707610624,'外购电力',NULL,'美国HIMS电网','CO2e','AR4','kg','kWh',0.507571,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:45','1514943054748979200','2022-04-15 21:08:45',0,NULL,-1,3),(1514953876971851776,'外购电力',NULL,'美国HIOA电网','CO2e','AR4','kg','kWh',0.763164,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:45','1514943054748979200','2022-04-15 21:08:45',0,NULL,-1,3),(1514953877240287232,'外购电力',NULL,'美国MROE电网','CO2e','AR4','kg','kWh',0.766431,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:45','1514943054748979200','2022-04-15 21:08:45',0,NULL,-1,3),(1514953877504528384,'外购电力',NULL,'美国MROW电网','CO2e','AR4','kg','kWh',0.566654,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:46','1514943054748979200','2022-04-15 21:08:46',0,NULL,-1,3),(1514953877772963840,'外购电力',NULL,'美国NEWE电网','CO2e','AR4','kg','kWh',0.239333,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:46','1514943054748979200','2022-04-15 21:08:46',0,NULL,-1,3),(1514953878041399296,'外购电力',NULL,'美国NWPP电网','CO2e','AR4','kg','kWh',0.291805,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:46','1514943054748979200','2022-04-15 21:08:46',0,NULL,-1,3),(1514953878305640448,'外购电力',NULL,'美国NYCW电网','CO2e','AR4','kg','kWh',0.271184,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:46','1514943054748979200','2022-04-15 21:08:46',0,NULL,-1,3),(1514953878569881600,'外购电力',NULL,'美国NYLI电网','CO2e','AR4','kg','kWh',0.541172,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:46','1514943054748979200','2022-04-15 21:08:46',0,NULL,-1,3),(1514953878842511360,'外购电力',NULL,'美国NYUP电网','CO2e','AR4','kg','kWh',0.115284,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:46','1514943054748979200','2022-04-15 21:08:46',0,NULL,-1,3),(1514953879110946816,'外购电力',NULL,'美国RFCE电网','CO2e','AR4','kg','kWh',0.326530,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:46','1514943054748979200','2022-04-15 21:08:46',0,NULL,-1,3),(1514953879379382272,'外购电力',NULL,'美国RFCM电网','CO2e','AR4','kg','kWh',0.599263,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:46','1514943054748979200','2022-04-15 21:08:46',0,NULL,-1,3),(1514953879643623424,'外购电力',NULL,'美国RFCW电网','CO2e','AR4','kg','kWh',0.532557,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:46','1514943054748979200','2022-04-15 21:08:46',0,NULL,-1,3),(1514953880033693696,'外购电力',NULL,'美国RMPA电网','CO2e','AR4','kg','kWh',0.581530,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:46','1514943054748979200','2022-04-15 21:08:46',0,NULL,-1,3),(1514953880297934848,'外购电力',NULL,'美国SPNO电网','CO2e','AR4','kg','kWh',0.531452,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:46','1514943054748979200','2022-04-15 21:08:46',0,NULL,-1,3),(1514953880557981696,'外购电力',NULL,'美国SPSO电网','CO2e','AR4','kg','kWh',0.531942,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:46','1514943054748979200','2022-04-15 21:08:46',0,NULL,-1,3),(1514953880830611456,'外购电力',NULL,'美国SRMV电网','CO2e','AR4','kg','kWh',0.389366,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:46','1514943054748979200','2022-04-15 21:08:46',0,NULL,-1,3),(1514953881103241216,'外购电力',NULL,'美国SRMW电网','CO2e','AR4','kg','kWh',0.760593,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:46','1514943054748979200','2022-04-15 21:08:46',0,NULL,-1,3),(1514953881371676672,'外购电力',NULL,'美国SRSO电网','CO2e','AR4','kg','kWh',0.468801,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:46','1514943054748979200','2022-04-15 21:08:46',0,NULL,-1,3),(1514953881648500736,'外购电力',NULL,'美国SRTV电网','CO2e','AR4','kg','kWh',0.470890,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:47','1514943054748979200','2022-04-15 21:08:47',0,NULL,-1,3),(1514953881925324800,'外购电力',NULL,'美国SRVC电网','CO2e','AR4','kg','kWh',0.339144,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:47','1514943054748979200','2022-04-15 21:08:47',0,NULL,-1,3),(1514953882210537472,'外购电力',NULL,'美国平均电力','CO2e','AR4','kg','kWh',0.432220,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:47','1514943054748979200','2022-04-15 21:08:47',0,NULL,-1,2),(1514953882478972928,'外购电力',NULL,'美国AKGD电网','CO2e','AR5','kg','kWh',0.473934,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:47','1514943054748979200','2022-04-15 21:08:47',0,NULL,-1,3),(1514953882743214080,'外购电力',NULL,'美国AKMS电网','CO2e','AR5','kg','kWh',0.238959,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:47','1514943054748979200','2022-04-15 21:08:47',0,NULL,-1,3),(1514953883011649536,'外购电力',NULL,'美国AZNM电网','CO2e','AR5','kg','kWh',0.466033,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:47','1514943054748979200','2022-04-15 21:08:47',0,NULL,-1,3),(1514953883280084992,'外购电力',NULL,'美国CAMX电网','CO2e','AR5','kg','kWh',0.226138,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:47','1514943054748979200','2022-04-15 21:08:47',0,NULL,-1,3),(1514953883548520448,'外购电力',NULL,'美国ERCT电网','CO2e','AR5','kg','kWh',0.424519,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:47','1514943054748979200','2022-04-15 21:08:47',0,NULL,-1,3),(1514953883812761600,'外购电力',NULL,'美国FRCC电网','CO2e','AR5','kg','kWh',0.424596,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:47','1514943054748979200','2022-04-15 21:08:47',0,NULL,-1,3),(1514953884077002752,'外购电力',NULL,'美国HIMS电网','CO2e','AR5','kg','kWh',0.507462,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:47','1514943054748979200','2022-04-15 21:08:47',0,NULL,-1,3),(1514953884471267328,'外购电力',NULL,'美国HIOA电网','CO2e','AR5','kg','kWh',0.763005,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:47','1514943054748979200','2022-04-15 21:08:47',0,NULL,-1,3),(1514953884739702784,'外购电力',NULL,'美国MROE电网','CO2e','AR5','kg','kWh',0.766287,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:47','1514943054748979200','2022-04-15 21:08:47',0,NULL,-1,3),(1514953885008138240,'外购电力',NULL,'美国MROW电网','CO2e','AR5','kg','kWh',0.566542,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:47','1514943054748979200','2022-04-15 21:08:47',0,NULL,-1,3),(1514953885272379392,'外购电力',NULL,'美国NEWE电网','CO2e','AR5','kg','kWh',0.239280,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:47','1514943054748979200','2022-04-15 21:08:47',0,NULL,-1,3),(1514953885536620544,'外购电力',NULL,'美国NWPP电网','CO2e','AR5','kg','kWh',0.291757,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:47','1514943054748979200','2022-04-15 21:08:47',0,NULL,-1,3),(1514953885805056000,'外购电力',NULL,'美国NYCW电网','CO2e','AR5','kg','kWh',0.271169,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:48','1514943054748979200','2022-04-15 21:08:48',0,NULL,-1,3),(1514953886065102848,'外购电力',NULL,'美国NYLI电网','CO2e','AR5','kg','kWh',0.541092,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:48','1514943054748979200','2022-04-15 21:08:48',0,NULL,-1,3),(1514953886329344000,'外购电力',NULL,'美国NYUP电网','CO2e','AR5','kg','kWh',0.115279,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:48','1514943054748979200','2022-04-15 21:08:48',0,NULL,-1,3),(1514953886593585152,'外购电力',NULL,'美国RFCE电网','CO2e','AR5','kg','kWh',0.326493,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:48','1514943054748979200','2022-04-15 21:08:48',0,NULL,-1,3),(1514953886853632000,'外购电力',NULL,'美国RFCM电网','CO2e','AR5','kg','kWh',0.599169,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:48','1514943054748979200','2022-04-15 21:08:48',0,NULL,-1,3),(1514953887117873152,'外购电力',NULL,'美国RFCW电网','CO2e','AR5','kg','kWh',0.532462,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:48','1514943054748979200','2022-04-15 21:08:48',0,NULL,-1,3),(1514953887386308608,'外购电力',NULL,'美国RMPA电网','CO2e','AR5','kg','kWh',0.581428,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:48','1514943054748979200','2022-04-15 21:08:48',0,NULL,-1,3),(1514953887650549760,'外购电力',NULL,'美国SPNO电网','CO2e','AR5','kg','kWh',0.531351,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:48','1514943054748979200','2022-04-15 21:08:48',0,NULL,-1,3),(1514953887914790912,'外购电力',NULL,'美国SPSO电网','CO2e','AR5','kg','kWh',0.531871,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:48','1514943054748979200','2022-04-15 21:08:48',0,NULL,-1,3),(1514953888183226368,'外购电力',NULL,'美国SRMV电网','CO2e','AR5','kg','kWh',0.389321,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:48','1514943054748979200','2022-04-15 21:08:48',0,NULL,-1,3),(1514953888451661824,'外购电力',NULL,'美国SRMW电网','CO2e','AR5','kg','kWh',0.760441,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:48','1514943054748979200','2022-04-15 21:08:48',0,NULL,-1,3),(1514953888841732096,'外购电力',NULL,'美国SRSO电网','CO2e','AR5','kg','kWh',0.468731,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:48','1514943054748979200','2022-04-15 21:08:48',0,NULL,-1,3),(1514953889105973248,'外购电力',NULL,'美国SRTV电网','CO2e','AR5','kg','kWh',0.470812,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:48','1514943054748979200','2022-04-15 21:08:48',0,NULL,-1,3),(1514953889374408704,'外购电力',NULL,'美国SRVC电网','CO2e','AR5','kg','kWh',0.339101,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:48','1514943054748979200','2022-04-15 21:08:48',0,NULL,-1,3),(1514953889655427072,'外购电力',NULL,'美国平均电力','CO2e','AR5','kg','kWh',0.432157,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:48','1514943054748979200','2022-04-15 21:08:48',0,NULL,-1,2),(1514953889928056832,'外购电力',NULL,'加拿大平均电网','CO2e','AR4','kg','kWh',0.130000,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:48','1514943054748979200','2022-04-15 21:08:48',0,NULL,-1,2),(1514953890192297984,'外购电力',NULL,'加拿大-纽芬兰与拉布拉多电网','CO2e','AR4','kg','kWh',0.040313,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','纽芬兰与拉布拉多','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:49','1514943054748979200','2022-04-15 21:08:49',0,NULL,-1,3),(1514953890452344832,'外购电力',NULL,'加拿大-爱德华王子岛电网','CO2e','AR4','kg','kWh',0.014072,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','爱德华王子岛','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:49','1514943054748979200','2022-04-15 21:08:49',0,NULL,-1,3),(1514953890716585984,'外购电力',NULL,'加拿大-新斯科舍电网','CO2e','AR4','kg','kWh',0.673730,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','新斯科舍','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:49','1514943054748979200','2022-04-15 21:08:49',0,NULL,-1,3),(1514953890980827136,'外购电力',NULL,'加拿大-新不伦瑞克省电网','CO2e','AR4','kg','kWh',0.311692,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','新不伦瑞克省','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:49','1514943054748979200','2022-04-15 21:08:49',0,NULL,-1,3),(1514953891245068288,'外购电力',NULL,'加拿大-魁北克电网','CO2e','AR4','kg','kWh',0.001230,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','魁北克','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:49','1514943054748979200','2022-04-15 21:08:49',0,NULL,-1,3),(1514953891505115136,'外购电力',NULL,'加拿大-安大略省电网','CO2e','AR4','kg','kWh',0.017298,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','安大略省','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:49','1514943054748979200','2022-04-15 21:08:49',0,NULL,-1,3),(1514953891781939200,'外购电力',NULL,'加拿大-马尼托巴湖电网','CO2e','AR4','kg','kWh',0.001932,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','马尼托巴湖','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:49','1514943054748979200','2022-04-15 21:08:49',0,NULL,-1,3),(1514953892050374656,'外购电力',NULL,'加拿大- 萨斯喀彻温省电网','CO2e','AR4','kg','kWh',0.657210,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','萨斯喀彻温省','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:49','1514943054748979200','2022-04-15 21:08:49',0,NULL,-1,3),(1514953892314615808,'外购电力',NULL,'加拿大-亚伯达电网','CO2e','AR4','kg','kWh',0.753980,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','亚伯达','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:49','1514943054748979200','2022-04-15 21:08:49',0,NULL,-1,3),(1514953892583051264,'外购电力',NULL,'加拿大-不列颠哥伦比亚电网','CO2e','AR4','kg','kWh',0.009284,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','不列颠哥伦比亚','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:49','1514943054748979200','2022-04-15 21:08:49',0,NULL,-1,3),(1514953892847292416,'外购电力',NULL,'加拿大-育空电网','CO2e','AR4','kg','kWh',0.051080,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','育空','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:49','1514943054748979200','2022-04-15 21:08:49',0,NULL,-1,3),(1514953893237362688,'外购电力',NULL,'加拿大-西北地区和努纳武特电网','CO2e','AR4','kg','kWh',0.176210,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','西北地区和努纳武特','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:49','1514943054748979200','2022-04-15 21:08:49',0,NULL,-1,3),(1514953893501603840,'外购电力',NULL,'加拿大平均电力','CO2e','AR5','kg','kWh',0.130000,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:49','1514943054748979200','2022-04-15 21:08:49',0,NULL,-1,2),(1514953893770039296,'外购电力',NULL,'加拿大-纽芬兰与拉布拉多电网','CO2e','AR5','kg','kWh',0.040282,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','纽芬兰与拉布拉多','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:49','1514943054748979200','2022-04-15 21:08:49',0,NULL,-1,3),(1514953894030086144,'外购电力',NULL,'加拿大-爱德华王子岛电网','CO2e','AR5','kg','kWh',0.014067,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','爱德华王子岛','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:49','1514943054748979200','2022-04-15 21:08:49',0,NULL,-1,3),(1514953894298521600,'外购电力',NULL,'加拿大-新斯科舍电网','CO2e','AR5','kg','kWh',0.673490,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','新斯科舍','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:50','1514943054748979200','2022-04-15 21:08:50',0,NULL,-1,3),(1514953894566957056,'外购电力',NULL,'加拿大-新不伦瑞克省电网','CO2e','AR5','kg','kWh',0.311620,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','新不伦瑞克省','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:50','1514943054748979200','2022-04-15 21:08:50',0,NULL,-1,3),(1514953894827003904,'外购电力',NULL,'加拿大-魁北克电网','CO2e','AR5','kg','kWh',0.001226,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','魁北克','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:50','1514943054748979200','2022-04-15 21:08:50',0,NULL,-1,3),(1514953895091245056,'外购电力',NULL,'加拿大-安大略省电网','CO2e','AR5','kg','kWh',0.017265,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','安大略省','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:50','1514943054748979200','2022-04-15 21:08:50',0,NULL,-1,3),(1514953895355486208,'外购电力',NULL,'加拿大-马尼托巴湖电网','CO2e','AR5','kg','kWh',0.001929,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','马尼托巴湖','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:50','1514943054748979200','2022-04-15 21:08:50',0,NULL,-1,3),(1514953895615533056,'外购电力',NULL,'加拿大- 萨斯喀彻温省电网','CO2e','AR5','kg','kWh',0.656700,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','萨斯喀彻温省','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:50','1514943054748979200','2022-04-15 21:08:50',0,NULL,-1,3),(1514953895879774208,'外购电力',NULL,'加拿大-亚伯达电网','CO2e','AR5','kg','kWh',0.753770,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','亚伯达','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:50','1514943054748979200','2022-04-15 21:08:50',0,NULL,-1,3),(1514953896139821056,'外购电力',NULL,'加拿大-不列颠哥伦比亚电网','CO2e','AR5','kg','kWh',0.009270,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','不列颠哥伦比亚','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:50','1514943054748979200','2022-04-15 21:08:50',0,NULL,-1,3),(1514953896408256512,'外购电力',NULL,'加拿大-育空电网','CO2e','AR5','kg','kWh',0.050762,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','育空','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:50','1514943054748979200','2022-04-15 21:08:50',0,NULL,-1,3),(1514953896668303360,'外购电力',NULL,'加拿大-西北地区和努纳武特电网','CO2e','AR5','kg','kWh',0.175580,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','加拿大','西北地区和努纳武特','','Canada NIR 2018',2018,3,'1514943054748979200','2022-04-15 21:08:50','1514943054748979200','2022-04-15 21:08:50',0,NULL,-1,3),(1514953896928350208,'外购电力',NULL,'澳大利亚新南威尔士州和首都领地电网','CO2e','AR4','kg','kWh',0.810000,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','澳大利亚','新南威尔士州和首都领地','','澳大利亚环境与能源部-2019',2019,3,'1514943054748979200','2022-04-15 21:08:50','1514943054748979200','2022-04-15 21:08:50',0,NULL,-1,3),(1514953897192591360,'外购电力',NULL,'澳大利亚维多利亚州电网','CO2e','AR4','kg','kWh',1.020000,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','澳大利亚','维多利亚州','','澳大利亚环境与能源部-2019',2019,3,'1514943054748979200','2022-04-15 21:08:50','1514943054748979200','2022-04-15 21:08:50',0,NULL,-1,3),(1514953897586855936,'外购电力',NULL,'澳大利亚昆士兰电网','CO2e','AR4','kg','kWh',0.810000,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','澳大利亚','昆士兰','','澳大利亚环境与能源部-2019',2019,3,'1514943054748979200','2022-04-15 21:08:50','1514943054748979200','2022-04-15 21:08:50',0,NULL,-1,3),(1514953897846902784,'外购电力',NULL,'澳大利亚南澳大利亚州电网','CO2e','AR4','kg','kWh',0.440000,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','澳大利亚','南澳大利亚州','','澳大利亚环境与能源部-2019',2019,3,'1514943054748979200','2022-04-15 21:08:50','1514943054748979200','2022-04-15 21:08:50',0,NULL,-1,3),(1514953898106949632,'外购电力',NULL,'澳大利亚西澳大利亚州SWIS电网','CO2e','AR4','kg','kWh',0.690000,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','澳大利亚','西澳大利亚州SWIS','','澳大利亚环境与能源部-2019',2019,3,'1514943054748979200','2022-04-15 21:08:50','1514943054748979200','2022-04-15 21:08:50',0,NULL,-1,3),(1514953898379579392,'外购电力',NULL,'澳大利亚塔斯马尼亚岛电网','CO2e','AR4','kg','kWh',0.150000,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','澳大利亚','塔斯马尼亚岛','','澳大利亚环境与能源部-2019',2019,3,'1514943054748979200','2022-04-15 21:08:51','1514943054748979200','2022-04-15 21:08:51',0,NULL,-1,3),(1514953898643820544,'外购电力',NULL,'澳大利亚北领地电网','CO2e','AR4','kg','kWh',0.630000,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','澳大利亚','北领地','','澳大利亚环境与能源部-2019',2019,3,'1514943054748979200','2022-04-15 21:08:51','1514943054748979200','2022-04-15 21:08:51',0,NULL,-1,3),(1514953898908061696,'外购热能',NULL,'平均热能排放','CO2e','AR4','kg','kWh',0.176060,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','全球','','','英国环境、食品和农村事务部(Defra)-2019',2019,3,'1514943054748979200','2022-04-15 21:08:51','1514943054748979200','2022-04-15 21:08:51',0,NULL,-1,1),(1514953899172302848,'外购热能',NULL,'平均热能排放','CO3e','AR5','kg','mmBTU',66.398500,'kg/mmBTU',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','全球','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:51','1514943054748979200','2022-04-15 21:08:51',0,NULL,-1,1),(1514953899436544000,'外购热能',NULL,'热能-北京','CO2e','AR4','t','GJ',0.100427,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','北京','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:51','1514943054748979200','2022-04-15 21:08:51',0,NULL,-1,3),(1514953899704979456,'外购热能',NULL,'热能-天津','CO2e','AR4','t','GJ',0.110557,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','天津','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:51','1514943054748979200','2022-04-15 21:08:51',0,NULL,-1,3),(1514953899969220608,'外购热能',NULL,'热能-河北','CO2e','AR4','t','GJ',0.190557,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','河北','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:51','1514943054748979200','2022-04-15 21:08:51',0,NULL,-1,3),(1514953900233461760,'外购热能',NULL,'热能-山西','CO2e','AR4','t','GJ',0.140606,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','山西','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:51','1514943054748979200','2022-04-15 21:08:51',0,NULL,-1,3),(1514953900497702912,'外购热能',NULL,'热能-内蒙古','CO2e','AR4','t','GJ',0.170813,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','内蒙古','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:51','1514943054748979200','2022-04-15 21:08:51',0,NULL,-1,3),(1514953900761944064,'外购热能',NULL,'热能-辽宁','CO2e','AR4','t','GJ',0.150632,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','辽宁','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:51','1514943054748979200','2022-04-15 21:08:51',0,NULL,-1,3),(1514953901026185216,'外购热能',NULL,'热能-吉林','CO2e','AR4','t','GJ',0.130659,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','吉林','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:51','1514943054748979200','2022-04-15 21:08:51',0,NULL,-1,3),(1514953901294620672,'外购热能',NULL,'热能-黑龙江','CO2e','AR4','t','GJ',0.170732,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','黑龙江','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:51','1514943054748979200','2022-04-15 21:08:51',0,NULL,-1,3),(1514953901554667520,'外购热能',NULL,'热能-上海','CO2e','AR4','t','GJ',0.100469,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','上海','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:51','1514943054748979200','2022-04-15 21:08:51',0,NULL,-1,3),(1514953901940543488,'外购热能',NULL,'热能-江苏','CO2e','AR4','t','GJ',0.110526,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','江苏','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:51','1514943054748979200','2022-04-15 21:08:51',0,NULL,-1,3),(1514953902204784640,'外购热能',NULL,'热能-浙江','CO2e','AR4','t','GJ',0.120630,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','浙江','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:51','1514943054748979200','2022-04-15 21:08:51',0,NULL,-1,3),(1514953902469025792,'外购热能',NULL,'热能-安徽','CO2e','AR4','t','GJ',0.110514,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','安徽','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:51','1514943054748979200','2022-04-15 21:08:51',0,NULL,-1,3),(1514953902733266944,'外购热能',NULL,'热能-福建','CO2e','AR4','t','GJ',0.130493,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','福建','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:52','1514943054748979200','2022-04-15 21:08:52',0,NULL,-1,3),(1514953902997508096,'外购热能',NULL,'热能-江西','CO2e','AR4','t','GJ',0.150674,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','江西','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:52','1514943054748979200','2022-04-15 21:08:52',0,NULL,-1,3),(1514953903257554944,'外购热能',NULL,'热能-山东','CO2e','AR4','t','GJ',0.120572,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','山东','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:52','1514943054748979200','2022-04-15 21:08:52',0,NULL,-1,3),(1514953903517601792,'外购热能',NULL,'热能-河南','CO2e','AR4','t','GJ',0.130650,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','河南','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:52','1514943054748979200','2022-04-15 21:08:52',0,NULL,-1,3),(1514953903777648640,'外购热能',NULL,'热能-湖北','CO2e','AR4','t','GJ',0.160552,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','湖北','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:52','1514943054748979200','2022-04-15 21:08:52',0,NULL,-1,3),(1514953904037695488,'外购热能',NULL,'热能-湖南','CO2e','AR4','t','GJ',0.130508,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','湖南','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:52','1514943054748979200','2022-04-15 21:08:52',0,NULL,-1,3),(1514953904297742336,'外购热能',NULL,'热能-广东','CO2e','AR4','t','GJ',0.110503,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','广东','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:52','1514943054748979200','2022-04-15 21:08:52',0,NULL,-1,3),(1514953904557789184,'外购热能',NULL,'热能-广西','CO2e','AR4','t','GJ',0.170821,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','广西','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:52','1514943054748979200','2022-04-15 21:08:52',0,NULL,-1,3),(1514953904834613248,'外购热能',NULL,'热能-海南','CO2e','AR4','t','GJ',0.030028,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','海南','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:52','1514943054748979200','2022-04-15 21:08:52',0,NULL,-1,3),(1514953905094660096,'外购热能',NULL,'热能-重庆','CO2e','AR4','t','GJ',0.130655,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','重庆','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:52','1514943054748979200','2022-04-15 21:08:52',0,NULL,-1,3),(1514953905363095552,'外购热能',NULL,'热能-四川','CO2e','AR4','t','GJ',0.150528,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','四川','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:52','1514943054748979200','2022-04-15 21:08:52',0,NULL,-1,3),(1514953905648308224,'外购热能',NULL,'热能-贵州','CO2e','AR4','t','GJ',0.150752,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','贵州','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:52','1514943054748979200','2022-04-15 21:08:52',0,NULL,-1,3),(1514953905912549376,'外购热能',NULL,'热能-云南','CO2e','AR4','t','GJ',0.180878,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','云南','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:52','1514943054748979200','2022-04-15 21:08:52',0,NULL,-1,3),(1514953906306813952,'外购热能',NULL,'热能-陕西','CO2e','AR4','t','GJ',0.130624,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','陕西','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:52','1514943054748979200','2022-04-15 21:08:52',0,NULL,-1,3),(1514953906579443712,'外购热能',NULL,'热能-甘肃','CO2e','AR4','t','GJ',0.120542,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','甘肃','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:52','1514943054748979200','2022-04-15 21:08:52',0,NULL,-1,3),(1514953906843684864,'外购热能',NULL,'热能-青海','CO2e','AR4','t','GJ',0.160268,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','青海','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:53','1514943054748979200','2022-04-15 21:08:53',0,NULL,-1,3),(1514953907116314624,'外购热能',NULL,'热能-宁夏','CO2e','AR4','t','GJ',0.130656,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','宁夏','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:53','1514943054748979200','2022-04-15 21:08:53',0,NULL,-1,3),(1514953907380555776,'外购热能',NULL,'热能-新疆','CO2e','AR4','t','GJ',0.130563,'t/GJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','新疆','','GHG中国能源消耗引起的温室气体排放计算工具指南（2.1版）',2011,3,'1514943054748979200','2022-04-15 21:08:53','1514943054748979200','2022-04-15 21:08:53',0,NULL,-1,3),(1514953907661574144,'运输','里程·重量','轻型汽油货车运输（载重2t）','CO2e','AR4','kg','t km',0.288200,'kg/t km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','','','碳排放交易网',2019,3,'1514943054748979200','2022-04-15 21:08:53','1514943054748979200','2022-04-15 21:08:53',0,NULL,-1,2),(1514953907921620992,'运输','里程·重量','中型汽油货车运输（载重8t）','CO2e','AR4','kg','t km',0.103400,'kg/t km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','','','碳排放交易网',2019,3,'1514943054748979200','2022-04-15 21:08:53','1514943054748979200','2022-04-15 21:08:53',0,NULL,-1,2),(1514953908185862144,'运输','里程·重量','重型汽油货车运输(载重10t)','CO2e','AR4','kg','t km',0.140200,'kg/t km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','','','碳排放交易网',2019,3,'1514943054748979200','2022-04-15 21:08:53','1514943054748979200','2022-04-15 21:08:53',0,NULL,-1,2),(1514953908450103296,'运输','里程·重量','重型汽油货车运输（载重18t）','CO2e','AR4','kg','t km',0.095850,'kg/t km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','','','碳排放交易网',2019,3,'1514943054748979200','2022-04-15 21:08:53','1514943054748979200','2022-04-15 21:08:53',0,NULL,-1,2),(1514953908714344448,'运输','里程·重量','轻型柴油货车运输（载重2t）','CO2e','AR4','kg','t km',0.246100,'kg/t km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','','','碳排放交易网',2019,3,'1514943054748979200','2022-04-15 21:08:53','1514943054748979200','2022-04-15 21:08:53',0,NULL,-1,2),(1514953908978585600,'运输','里程·重量','中型柴油货车运输（载重8t）','CO2e','AR4','kg','t km',0.166300,'kg/t km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','','','碳排放交易网',2019,3,'1514943054748979200','2022-04-15 21:08:53','1514943054748979200','2022-04-15 21:08:53',0,NULL,-1,2),(1514953909238632448,'运输','里程·重量','重型柴油货车运输（载重10t）','CO2e','AR4','kg','t km',0.177200,'kg/t km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','','','碳排放交易网',2019,3,'1514943054748979200','2022-04-15 21:08:53','1514943054748979200','2022-04-15 21:08:53',0,NULL,-1,2),(1514953909502873600,'运输','里程·重量','重型柴油货车运输（载重18t）','CO2e','AR4','kg','t km',0.121100,'kg/t km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','','','碳排放交易网',2019,3,'1514943054748979200','2022-04-15 21:08:53','1514943054748979200','2022-04-15 21:08:53',0,NULL,-1,2),(1514953909762920448,'运输','里程·重量','重型柴油货车运输（载重30t）','CO2e','AR4','kg','t km',0.072690,'kg/t km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','','','碳排放交易网',2019,3,'1514943054748979200','2022-04-15 21:08:53','1514943054748979200','2022-04-15 21:08:53',0,NULL,-1,2),(1514953910022967296,'运输','里程·重量','重型柴油货车运输(载重46t)','CO2e','AR4','kg','t km',0.057770,'kg/t km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','','','碳排放交易网',2019,3,'1514943054748979200','2022-04-15 21:08:53','1514943054748979200','2022-04-15 21:08:53',0,NULL,-1,2),(1514953910287208448,'运输','里程·重量','电力机车运输','CO2e','AR4','kg','t km',0.010940,'kg/t km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','','','碳排放交易网',2019,3,'1514943054748979200','2022-04-15 21:08:53','1514943054748979200','2022-04-15 21:08:53',0,NULL,-1,2),(1514953910677278720,'运输','里程·重量','内燃机车运输','CO2e','AR4','kg','t km',0.009634,'kg/t km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','','','碳排放交易网',2019,3,'1514943054748979200','2022-04-15 21:08:53','1514943054748979200','2022-04-15 21:08:53',0,NULL,-1,2),(1514953910941519872,'运输','里程·重量','铁路运输-中国市场平均','CO2e','AR4','kg','t km',0.010130,'kg/t km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','','','碳排放交易网',2019,3,'1514943054748979200','2022-04-15 21:08:54','1514943054748979200','2022-04-15 21:08:54',0,NULL,-1,2),(1514953911201566720,'运输','里程·重量','液货船运输（载重2000t）','CO2e','AR4','kg','t km',0.018390,'kg/t km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','','','碳排放交易网',2019,3,'1514943054748979200','2022-04-15 21:08:54','1514943054748979200','2022-04-15 21:08:54',0,NULL,-1,2),(1514953911465807872,'运输','里程·重量','干散货船运输(载重2500t)','CO2e','AR4','kg','t km',0.014710,'kg/t km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','','','碳排放交易网',2019,3,'1514943054748979200','2022-04-15 21:08:54','1514943054748979200','2022-04-15 21:08:54',0,NULL,-1,2),(1514953911734243328,'运输','里程·重量','集装箱船运输（载重200TEU）','CO2e','AR4','kg','t km',0.011820,'kg/t km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','','','碳排放交易网',2019,3,'1514943054748979200','2022-04-15 21:08:54','1514943054748979200','2022-04-15 21:08:54',0,NULL,-1,2),(1514953911998484480,'运输','里程·重量','飞机','CO2e','AR4','kg','t mile',1.318653,'kg/t mile',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:54','1514943054748979200','2022-04-15 21:08:54',0,NULL,-1,1),(1514953912262725632,'运输','里程·重量','飞机','CO2e','AR4','kg','t km',5.833300,'kg/t km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2018',2018,3,'1514943054748979200','2022-04-15 21:08:54','1514943054748979200','2022-04-15 21:08:54',0,NULL,-1,1),(1514953912526966784,'商务旅行','里程','短途航空（<300里）','CO2e','AR4','kg','mile',0.227011,'kg/mile',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:54','1514943054748979200','2022-04-15 21:08:54',0,NULL,-1,1),(1514953912795402240,'商务旅行','里程','中途航空（300-2300里）','CO2e','AR4','kg','mile',0.137156,'kg/mile',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:54','1514943054748979200','2022-04-15 21:08:54',0,NULL,-1,1),(1514953913055449088,'商务旅行','里程','长途航空（>2300里）','CO2e','AR4','kg','mile',0.167421,'kg/mile',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','美国环境保护局（EPA）-2018',2018,3,'1514943054748979200','2022-04-15 21:08:54','1514943054748979200','2022-04-15 21:08:54',0,NULL,-1,1),(1514953913323884544,'商务旅行','里程','国内航班（普通舱）','CO2e','AR4','kg','km',0.134830,'kg/km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2019',2019,3,'1514943054748979200','2022-04-15 21:08:54','1514943054748979200','2022-04-15 21:08:54',0,NULL,-1,1),(1514953913592320000,'商务旅行','里程','国际航班（普通舱）','CO2e','AR4','kg','km',0.095580,'kg/km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2019',2019,3,'1514943054748979200','2022-04-15 21:08:54','1514943054748979200','2022-04-15 21:08:54',0,NULL,-1,1),(1514953913852366848,'商务旅行','里程','短途航空','CO2e','AR4','kg','km',0.083700,'kg/km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2019',2019,3,'1514943054748979200','2022-04-15 21:08:54','1514943054748979200','2022-04-15 21:08:54',0,NULL,-1,1),(1514953914108219392,'废弃物','重量','危险废弃物焚烧','CO2e','AR4','kg','t',21.353800,'kg/t',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2019',2019,3,'1514943054748979200','2022-04-15 21:08:54','1514943054748979200','2022-04-15 21:08:54',0,NULL,-1,1),(1514953914372460544,'废弃物','重量','非危险废弃物焚烧','CO2e','AR4','kg','t',21.353800,'kg/t',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2019',2019,3,'1514943054748979200','2022-04-15 21:08:54','1514943054748979200','2022-04-15 21:08:54',0,NULL,-1,1),(1514953914632507392,'废弃物','重量','非危险废弃物填埋','CO2e','AR4','kg','t',586.513800,'kg/t',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2019',2019,3,'1514943054748979200','2022-04-15 21:08:54','1514943054748979200','2022-04-15 21:08:54',0,NULL,-1,1),(1514953915018383360,'废弃物','重量','非危险废弃物回收利用','CO2e','AR4','kg','t',21.353800,'kg/t',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','英国环境、食品和农村事务部(Defra)-2019',2019,3,'1514943054748979200','2022-04-15 21:08:54','1514943054748979200','2022-04-15 21:08:54',0,NULL,-1,1),(1514953915278430208,'设施排放','花费','教育行业','CO2e','AR4','kg','m²',50.350000,'kg/m²',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:55','1514943054748979200','2022-04-15 21:08:55',0,NULL,-1,1),(1514953915538477056,'设施排放','花费','食品销售行业','CO2e','AR4','kg','m²',65.962500,'kg/m²',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:55','1514943054748979200','2022-04-15 21:08:55',0,NULL,-1,1),(1514953915811106816,'设施排放','花费','餐饮服务行业','CO2e','AR4','kg','m²',66.325000,'kg/m²',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:55','1514943054748979200','2022-04-15 21:08:55',0,NULL,-1,1),(1514953916071153664,'设施排放','花费','健康关怀行业','CO2e','AR4','kg','m²',47.767500,'kg/m²',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:55','1514943054748979200','2022-04-15 21:08:55',0,NULL,-1,1),(1514953916331200512,'设施排放','花费','住宿行业','CO2e','AR4','kg','m²',43.347500,'kg/m²',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:55','1514943054748979200','2022-04-15 21:08:55',0,NULL,-1,1),(1514953916591247360,'设施排放','花费','商品行业','CO2e','AR4','kg','m²',27.550000,'kg/m²',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:55','1514943054748979200','2022-04-15 21:08:55',0,NULL,-1,1),(1514953916851294208,'设施排放','花费','办公室行业','CO2e','AR4','kg','m²',30.577500,'kg/m²',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:55','1514943054748979200','2022-04-15 21:08:55',0,NULL,-1,1),(1514953917115535360,'设施排放','花费','公共场所行业','CO2e','AR4','kg','m²',58.585000,'kg/m²',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:55','1514943054748979200','2022-04-15 21:08:55',0,NULL,-1,1),(1514953917379776512,'设施排放','花费','公共秩序与安全行业','CO2e','AR4','kg','m²',24.567500,'kg/m²',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:55','1514943054748979200','2022-04-15 21:08:55',0,NULL,-1,1),(1514953917644017664,'设施排放','花费','宗教场地行业','CO2e','AR4','kg','m²',60.057500,'kg/m²',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:55','1514943054748979200','2022-04-15 21:08:55',0,NULL,-1,1),(1514953917908258816,'设施排放','花费','仓库行业','CO2e','AR4','kg','m²',21.585000,'kg/m²',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:55','1514943054748979200','2022-04-15 21:08:55',0,NULL,-1,1),(1514953918172499968,'设施排放','花费','其他行业','CO2e','AR4','kg','m²',36.632500,'kg/m²',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:55','1514943054748979200','2022-04-15 21:08:55',0,NULL,-1,1),(1514953918436741120,'设施排放','花费','空','CO2e','AR4','kg','m²',6.230000,'kg/m²',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:55','1514943054748979200','2022-04-15 21:08:55',0,NULL,-1,1),(1514953918705176576,'设施排放','花费','制造行业','CO2e','AR4','kg','m²',187.817500,'kg/m²',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:55','1514943054748979200','2022-04-15 21:08:55',0,NULL,-1,1),(1514953918969417728,'分行业排放','花费','农业，狩猎，林业和渔业','CO2e','AR4','kg','USD',2.090000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:55','1514943054748979200','2022-04-15 21:08:55',0,NULL,-1,1),(1514953919367876608,'分行业排放','花费','采矿业','CO2e','AR4','kg','USD',1.780000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:56','1514943054748979200','2022-04-15 21:08:56',0,NULL,-1,1),(1514953919636312064,'分行业排放','花费','食品、饮料和烟草','CO2e','AR4','kg','USD',0.890000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:56','1514943054748979200','2022-04-15 21:08:56',0,NULL,-1,1),(1514953919908941824,'分行业排放','花费','纺织原料及纺织制品','CO2e','AR4','kg','USD',0.940000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:56','1514943054748979200','2022-04-15 21:08:56',0,NULL,-1,1),(1514953920168988672,'分行业排放','花费','皮革和鞋类','CO2e','AR4','kg','USD',0.870000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:56','1514943054748979200','2022-04-15 21:08:56',0,NULL,-1,1),(1514953920429035520,'分行业排放','花费','木材、木材及软木产品','CO2e','AR4','kg','USD',0.940000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:56','1514943054748979200','2022-04-15 21:08:56',0,NULL,-1,1),(1514953920693276672,'分行业排放','花费','纸浆，纸，印刷和出版','CO2e','AR4','kg','USD',0.640000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:56','1514943054748979200','2022-04-15 21:08:56',0,NULL,-1,1),(1514953920953323520,'分行业排放','花费','焦炭，精炼石油和核燃料','CO2e','AR4','kg','USD',1.880000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:56','1514943054748979200','2022-04-15 21:08:56',0,NULL,-1,1),(1514953921213370368,'分行业排放','花费','化学品及化学品产品','CO2e','AR4','kg','USD',1.120000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:56','1514943054748979200','2022-04-15 21:08:56',0,NULL,-1,1),(1514953921473417216,'分行业排放','花费','橡胶和塑料','CO2e','AR4','kg','USD',1.060000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:56','1514943054748979200','2022-04-15 21:08:56',0,NULL,-1,1),(1514953921737658368,'分行业排放','花费','非金属矿物','CO2e','AR4','kg','USD',2.440000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:56','1514943054748979200','2022-04-15 21:08:56',0,NULL,-1,1),(1514953922001899520,'分行业排放','花费','基本金属和金属制品','CO2e','AR4','kg','USD',1.540000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:56','1514943054748979200','2022-04-15 21:08:56',0,NULL,-1,1),(1514953922266140672,'分行业排放','花费','机器(未算在其他分类中','CO2e','AR4','kg','USD',0.710000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:56','1514943054748979200','2022-04-15 21:08:56',0,NULL,-1,1),(1514953922530381824,'分行业排放','花费','光电设备','CO2e','AR4','kg','USD',0.810000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:56','1514943054748979200','2022-04-15 21:08:56',0,NULL,-1,1),(1514953922794622976,'分行业排放','花费','运输设备','CO2e','AR4','kg','USD',0.750000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:56','1514943054748979200','2022-04-15 21:08:56',0,NULL,-1,1),(1514953923058864128,'分行业排放','花费','制造业与回收','CO3e','AR5','kg','USD',0.720000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 4 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:56','1514943054748979200','2022-04-15 21:08:56',0,NULL,-1,1),(1514953923318910976,'分行业排放','花费','零售业(汽车及电单车除外);家居用品修理','CO2e','AR4','kg','USD',0.220000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:56','1514943054748979200','2022-04-15 21:08:56',0,NULL,-1,1),(1514953923708981248,'分行业排放','花费','电、气、水供应','CO2e','AR4','kg','USD',4.870000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:57','1514943054748979200','2022-04-15 21:08:57',0,NULL,-1,1),(1514953923973222400,'分行业排放','花费','建筑','CO2e','AR4','kg','USD',0.690000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:57','1514943054748979200','2022-04-15 21:08:57',0,NULL,-1,1),(1514953924237463552,'分行业排放','花费','汽车及摩托车的销售、保养及修理;燃料零售','CO2e','AR4','kg','USD',0.210000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:57','1514943054748979200','2022-04-15 21:08:57',0,NULL,-1,1),(1514953924510093312,'分行业排放','花费','批发贸易及代销贸易（汽车、摩托车除外）','CO2e','AR4','kg','USD',0.230000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:57','1514943054748979200','2022-04-15 21:08:57',0,NULL,-1,1),(1514953924774334464,'分行业排放','花费','旅馆及餐饮业','CO2e','AR4','kg','USD',0.460000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:57','1514943054748979200','2022-04-15 21:08:57',0,NULL,-1,1),(1514953925038575616,'分行业排放','花费','内陆运输','CO2e','AR4','kg','USD',0.780000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:57','1514943054748979200','2022-04-15 21:08:57',0,NULL,-1,1),(1514953925307011072,'分行业排放','花费','水路运输','CO2e','AR4','kg','USD',1.930000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:57','1514943054748979200','2022-04-15 21:08:57',0,NULL,-1,1),(1514953925567057920,'分行业排放','花费','航空运输','CO2e','AR4','kg','USD',1.640000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:57','1514943054748979200','2022-04-15 21:08:57',0,NULL,-1,1),(1514953925843881984,'分行业排放','花费','其他支援及辅助运输活动;旅行社的活动','CO2e','AR4','kg','USD',0.420000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:57','1514943054748979200','2022-04-15 21:08:57',0,NULL,-1,1),(1514953926129094656,'分行业排放','花费','邮政电信','CO2e','AR4','kg','USD',0.300000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:57','1514943054748979200','2022-04-15 21:08:57',0,NULL,-1,1),(1514953926401724416,'分行业排放','花费','金融中介','CO2e','AR4','kg','USD',0.120000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:57','1514943054748979200','2022-04-15 21:08:57',0,NULL,-1,1),(1514953926665965568,'分行业排放','花费','房地产业','CO2e','AR4','kg','USD',0.100000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:57','1514943054748979200','2022-04-15 21:08:57',0,NULL,-1,1),(1514953926926012416,'分行业排放','花费','经营活动租赁','CO2e','AR4','kg','USD',0.210000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:57','1514943054748979200','2022-04-15 21:08:57',0,NULL,-1,1),(1514953927186059264,'分行业排放','花费','公共行政与国防;强制性社会保障','CO2e','AR4','kg','USD',0.260000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:57','1514943054748979200','2022-04-15 21:08:57',0,NULL,-1,1),(1514953927450300416,'分行业排放','花费','教育','CO2e','AR4','kg','USD',0.250000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:57','1514943054748979200','2022-04-15 21:08:57',0,NULL,-1,1),(1514953927710347264,'分行业排放','花费','卫生与社会工作','CO2e','AR4','kg','USD',0.260000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:58','1514943054748979200','2022-04-15 21:08:58',0,NULL,-1,1),(1514953928092028928,'分行业排放','花费','其他社区、社会和个人服务','CO2e','AR4','kg','USD',0.630000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:58','1514943054748979200','2022-04-15 21:08:58',0,NULL,-1,1),(1514953928352075776,'分行业排放','花费','家庭服务业','CO2e','AR4','kg','USD',0.010000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:58','1514943054748979200','2022-04-15 21:08:58',0,NULL,-1,1),(1514953928607928320,'分行业排放','花费','其他','CO2e','AR4','kg','USD',0.630000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:58','1514943054748979200','2022-04-15 21:08:58',0,NULL,-1,1),(1514953928872169472,'运输','花费','航空','CO2e','AR4','kg','USD',1.640000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:58','1514943054748979200','2022-04-15 21:08:58',0,NULL,-1,1),(1514953929132216320,'运输','花费','水运','CO2e','AR4','kg','USD',1.930000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:58','1514943054748979200','2022-04-15 21:08:58',0,NULL,-1,1),(1514953929392263168,'运输','花费','铁路','CO2e','AR4','kg','USD',0.780000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:58','1514943054748979200','2022-04-15 21:08:58',0,NULL,-1,1),(1514953929652310016,'运输','花费','公路','CO2e','AR4','kg','USD',0.780000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:58','1514943054748979200','2022-04-15 21:08:58',0,NULL,-1,1),(1514953929916551168,'商务旅行','花费','汽车','CO2e','AR4','kg','USD',0.780000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:58','1514943054748979200','2022-04-15 21:08:58',0,NULL,-1,1),(1514953930176598016,'商务旅行','花费','公共汽车','CO2e','AR4','kg','USD',0.780000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:58','1514943054748979200','2022-04-15 21:08:58',0,NULL,-1,1),(1514953930440839168,'商务旅行','花费','面包车','CO2e','AR4','kg','USD',0.780000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:58','1514943054748979200','2022-04-15 21:08:58',0,NULL,-1,1),(1514953930705080320,'商务旅行','花费','地铁','CO2e','AR4','kg','USD',0.780000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:58','1514943054748979200','2022-04-15 21:08:58',0,NULL,-1,1),(1514953930965127168,'商务旅行','花费','轮船','CO2e','AR4','kg','USD',0.780000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:58','1514943054748979200','2022-04-15 21:08:58',0,NULL,-1,1),(1514953931229368320,'商务旅行','花费','航空','CO2e','AR4','kg','USD',1.640000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:58','1514943054748979200','2022-04-15 21:08:58',0,NULL,-1,1),(1514953931493609472,'商务旅行','花费','酒店','CO2e','AR4','kg','USD',0.460000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:58','1514943054748979200','2022-04-15 21:08:58',0,NULL,-1,1),(1514953931770433536,'商务旅行','里程','汽车','CO2e','AR4','kg','km',0.220000,'kg/km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:58','1514943054748979200','2022-04-15 21:08:58',0,NULL,-1,1),(1514953932034674688,'商务旅行','里程','公共汽车','CO2e','AR4','kg','km',0.120000,'kg/km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:59','1514943054748979200','2022-04-15 21:08:59',0,NULL,-1,1),(1514953932424744960,'商务旅行','里程','面包车','CO2e','AR4','kg','km',0.320000,'kg/km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:59','1514943054748979200','2022-04-15 21:08:59',0,NULL,-1,1),(1514953932688986112,'商务旅行','里程','地铁','CO2e','AR4','kg','km',0.070000,'kg/km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:59','1514943054748979200','2022-04-15 21:08:59',0,NULL,-1,1),(1514953932953227264,'商务旅行','里程','轮船','CO2e','AR4','kg','km',0.000000,'kg/km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:59','1514943054748979200','2022-04-15 21:08:59',0,NULL,-1,1),(1514953933230051328,'商务旅行','里程','航空','CO2e','AR4','kg','km',0.180000,'kg/km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:59','1514943054748979200','2022-04-15 21:08:59',0,NULL,-1,1),(1514953933498486784,'商务旅行','间夜','酒店','CO2e','AR4','kg','room night',17.980000,'kg/room night',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:59','1514943054748979200','2022-04-15 21:08:59',0,NULL,-1,1),(1514953933758533632,'能源','范围三','天然气','CO2e','AR4','kg','MJ',0.056630,'kg/MJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:59','1514943054748979200','2022-04-15 21:08:59',0,NULL,-1,1),(1514953934031163392,'能源','范围三','丙烷/丁烷','CO2e','AR4','kg','MJ',0.074000,'kg/MJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:59','1514943054748979200','2022-04-15 21:08:59',0,NULL,-1,1),(1514953934291210240,'能源','范围三','柴油','CO2e','AR4','kg','MJ',0.086000,'kg/MJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:59','1514943054748979200','2022-04-15 21:08:59',0,NULL,-1,1),(1514953934555451392,'能源','范围三','重油','CO2e','AR4','kg','MJ',0.088410,'kg/MJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:59','1514943054748979200','2022-04-15 21:08:59',0,NULL,-1,1),(1514953934815498240,'能源','范围三','生物柴油','CO2e','AR4','kg','MJ',0.108000,'kg/MJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:59','1514943054748979200','2022-04-15 21:08:59',0,NULL,-1,1),(1514953935079739392,'能源','范围三','乙醇','CO2e','AR4','kg','MJ',0.011600,'kg/MJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:59','1514943054748979200','2022-04-15 21:08:59',0,NULL,-1,1),(1514953935348174848,'能源','范围三','生物乙醇','CO2e','AR4','kg','MJ',0.152280,'kg/MJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:59','1514943054748979200','2022-04-15 21:08:59',0,NULL,-1,1),(1514953935616610304,'能源','范围三','无铅汽油','CO2e','AR4','kg','MJ',0.083350,'kg/MJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:59','1514943054748979200','2022-04-15 21:08:59',0,NULL,-1,1),(1514953935889240064,'能源','范围三','煤油','CO2e','AR4','kg','MJ',0.079860,'kg/MJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:08:59','1514943054748979200','2022-04-15 21:08:59',0,NULL,-1,1),(1514953936178647040,'能源','范围三','无烟煤','CO2e','AR4','kg','MJ',0.092510,'kg/MJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:00','1514943054748979200','2022-04-15 21:09:00',0,NULL,-1,1),(1514953936447082496,'能源','范围三','浓缩铀','CO2e','AR4','kg','MJ',0.000026,'kg/MJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:00','1514943054748979200','2022-04-15 21:09:00',0,NULL,-1,1),(1514953936837152768,'能源','范围三','沼气','CO2e','AR4','kg','MJ',0.097140,'kg/MJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:00','1514943054748979200','2022-04-15 21:09:00',0,NULL,-1,1),(1514953937097199616,'能源','范围三','甲烷','CO2e','AR4','kg','MJ',0.159450,'kg/MJ',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:00','1514943054748979200','2022-04-15 21:09:00',0,NULL,-1,1),(1514953937357246464,'能源','范围三','天然气','CO2e','AR4','kg','kg',3.013000,'kg/kg',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:00','1514943054748979200','2022-04-15 21:09:00',0,NULL,-1,1),(1514953937617293312,'能源','范围三','丙烷/丁烷','CO2e','AR4','kg','kg',3.190000,'kg/kg',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:00','1514943054748979200','2022-04-15 21:09:00',0,NULL,-1,1),(1514953937881534464,'能源','范围三','柴油','CO2e','AR4','kg','kg',3.684000,'kg/kg',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:00','1514943054748979200','2022-04-15 21:09:00',0,NULL,-1,1),(1514953938145775616,'能源','范围三','重油','CO2e','AR4','kg','kg',3.642000,'kg/kg',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:00','1514943054748979200','2022-04-15 21:09:00',0,NULL,-1,1),(1514953938405822464,'能源','范围三','生物柴油','CO2e','AR4','kg','kg',4.049700,'kg/kg',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:00','1514943054748979200','2022-04-15 21:09:00',0,NULL,-1,1),(1514953938670063616,'能源','范围三','乙醇','CO2e','AR4','kg','kg',3.130000,'kg/kg',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:00','1514943054748979200','2022-04-15 21:09:00',0,NULL,-1,1),(1514953938934304768,'能源','范围三','生物乙醇','CO2e','AR4','kg','kg',4.096200,'kg/kg',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:00','1514943054748979200','2022-04-15 21:09:00',0,NULL,-1,1),(1514953939198545920,'能源','范围三','无铅汽油','CO2e','AR4','kg','kg',3.542500,'kg/kg',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:00','1514943054748979200','2022-04-15 21:09:00',0,NULL,-1,1),(1514953939462787072,'能源','范围三','煤油','CO2e','AR4','kg','kg',3.434130,'kg/kg',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:00','1514943054748979200','2022-04-15 21:09:00',0,NULL,-1,1),(1514953939731222528,'能源','范围三','无烟煤','CO2e','AR4','kg','kg',2.673530,'kg/kg',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:00','1514943054748979200','2022-04-15 21:09:00',0,NULL,-1,1),(1514953939995463680,'能源','范围三','浓缩铀','CO2e','AR4','kg','kg',2060.920630,'kg/kg',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:00','1514943054748979200','2022-04-15 21:09:00',0,NULL,-1,1),(1514953940272287744,'能源','范围三','沼气','CO2e','AR4','kg','kg',2.078870,'kg/kg',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:01','1514943054748979200','2022-04-15 21:09:01',0,NULL,-1,1),(1514953940532334592,'能源','范围三','甲烷','CO2e','AR4','kg','kg',3.412230,'kg/kg',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:01','1514943054748979200','2022-04-15 21:09:01',0,NULL,-1,1),(1514953940792381440,'废弃物','花费','纸','CO2e','AR4','kg','kg',0.460000,'kg/kg',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:01','1514943054748979200','2022-04-15 21:09:01',0,NULL,-1,1),(1514953941174063104,'废弃物','花费','金属','CO2e','AR4','kg','kg',0.460000,'kg/kg',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:01','1514943054748979200','2022-04-15 21:09:01',0,NULL,-1,1),(1514953941434109952,'废弃物','花费','塑料','CO2e','AR4','kg','kg',0.040000,'kg/kg',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:01','1514943054748979200','2022-04-15 21:09:01',0,NULL,-1,1),(1514953941694156800,'废弃物','花费','有机物质','CO2e','AR4','kg','kg',0.040000,'kg/kg',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:01','1514943054748979200','2022-04-15 21:09:01',0,NULL,-1,1),(1514953941954203648,'废弃物','花费','混合物','CO2e','AR4','kg','kg',0.530000,'kg/kg',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:01','1514943054748979200','2022-04-15 21:09:01',0,NULL,-1,1),(1514953942214250496,'下游租赁资产排放','花费','内陆运输','CO2e','AR4','kg','USD',0.780000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:01','1514943054748979200','2022-04-15 21:09:01',0,NULL,-1,1),(1514953942474297344,'下游租赁资产排放','花费','水路运输','CO2e','AR4','kg','USD',1.930000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:01','1514943054748979200','2022-04-15 21:09:01',0,NULL,-1,1),(1514953942759510016,'下游租赁资产排放','花费','航空运输','CO2e','AR4','kg','USD',1.640000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:01','1514943054748979200','2022-04-15 21:09:01',0,NULL,-1,1),(1514953943023751168,'下游租赁资产排放','花费','教育','CO2e','AR4','kg','USD',4.870000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:01','1514943054748979200','2022-04-15 21:09:01',0,NULL,-1,1),(1514953943279603712,'下游租赁资产排放','花费','食品销售','CO2e','AR4','kg','USD',4.870000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:01','1514943054748979200','2022-04-15 21:09:01',0,NULL,-1,1),(1514953943552233472,'下游租赁资产排放','花费','餐饮服务','CO2e','AR4','kg','USD',4.870000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:01','1514943054748979200','2022-04-15 21:09:01',0,NULL,-1,1),(1514953943816474624,'下游租赁资产排放','花费','健康关怀','CO2e','AR4','kg','USD',4.870000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:01','1514943054748979200','2022-04-15 21:09:01',0,NULL,-1,1),(1514953944080715776,'下游租赁资产排放','花费','住宿','CO2e','AR4','kg','USD',4.870000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:01','1514943054748979200','2022-04-15 21:09:01',0,NULL,-1,1),(1514953944349151232,'下游租赁资产排放','花费','商品','CO2e','AR4','kg','USD',4.870000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:01','1514943054748979200','2022-04-15 21:09:01',0,NULL,-1,1),(1514953944613392384,'下游租赁资产排放','花费','办公室','CO2e','AR4','kg','USD',4.870000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:02','1514943054748979200','2022-04-15 21:09:02',0,NULL,-1,1),(1514953944877633536,'下游租赁资产排放','花费','公共场所','CO2e','AR4','kg','USD',4.870000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:02','1514943054748979200','2022-04-15 21:09:02',0,NULL,-1,1),(1514953945141874688,'下游租赁资产排放','花费','公共秩序与安全','CO2e','AR4','kg','USD',4.870000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:02','1514943054748979200','2022-04-15 21:09:02',0,NULL,-1,1),(1514953945523556352,'下游租赁资产排放','花费','宗教场地','CO2e','AR4','kg','USD',4.870000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:02','1514943054748979200','2022-04-15 21:09:02',0,NULL,-1,1),(1514953945787797504,'下游租赁资产排放','花费','仓库','CO2e','AR4','kg','USD',4.870000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:02','1514943054748979200','2022-04-15 21:09:02',0,NULL,-1,1),(1514953946052038656,'下游租赁资产排放','花费','其他','CO2e','AR4','kg','USD',4.870000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:02','1514943054748979200','2022-04-15 21:09:02',0,NULL,-1,1),(1514953946312085504,'下游租赁资产排放','花费','空','CO2e','AR4','kg','USD',4.870000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:02','1514943054748979200','2022-04-15 21:09:02',0,NULL,-1,1),(1514953946576326656,'下游租赁资产排放','花费','制造','CO2e','AR4','kg','USD',4.870000,'kg/USD',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','','','','GHG Protocal Scope 3 Evaluator',1970,3,'1514943054748979200','2022-04-15 21:09:02','1514943054748979200','2022-04-15 21:09:02',0,NULL,-1,1),(1516233845396082688,'外购电力',NULL,'美国平均电力','CO2e','AR4','g','kWh',412.800000,'g/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','美国','','','Based on IEA data from  CO2 Emissions from Fuel Combustion © OECD/IEA 2020, www.iea.org/statistics, Licence:  www.iea.org/t&c; as modified by UL E&S. Users are only permitted to disclose those IEA Factors relevant to their emissions calculations in their sustainability reports to third parties for the purposes of emissions audits and/or reporting (e.g. to CDP) and only to the extent they are required to do so by the relevant entity to which they report or which audits them.',2020,3,'1515896721291481088','2022-04-19 09:54:54','1515896721291481088','2022-04-19 09:54:54',0,NULL,-1,2),(1516292284470136832,'外购电力',NULL,'越南自定义电力','CO2e','AR4','kg','kWh',0.845800,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','越南','','','自定义',2021,3,'1516260703219093504','2022-04-19 13:47:07','1516260703219093504','2022-04-19 13:47:07',0,NULL,-1,2),(1516292284814069760,'外购电力',NULL,'台湾自定义电力','CO2e','AR4','kg','kWh',0.502000,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','台湾','','自定义',2021,3,'1516260703219093504','2022-04-19 13:47:07','1516260703219093504','2022-04-19 13:47:07',0,NULL,-1,3),(1522751677713747968,'能源','固定燃烧排放','2','CO₂e','AR4','kg','t',14.670000,'kg/t',0.000000,'','',2.000000,'KJ/t','23',1.000000,'TC/KJ','32',2.000000,'23','中国','华北','通用','',1971,1,'1522106105617059840','2022-05-07 09:34:26','1522106105617059840','2022-05-07 09:34:26',1522751677713747968,NULL,-1,6),(1522755106704068608,'运输','里程·重量','乘用车-汽油自定义','CO₂e','AR4','t','km',0.000181,'t/km',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','全球','','通用','',2020,1,'1522468872169590784','2022-05-07 09:48:04','1522468872169590784','2022-05-07 09:48:04',0,NULL,-1,1),(1522760392646987776,'外购电力',NULL,'中国台湾电力','CO2e','AR4','kg','kWh',0.509000,'kg/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','台湾','','自定义',2020,1,'1522124426508898304','2022-05-07 10:09:04','1522124426508898304','2022-05-07 10:09:04',0,NULL,-1,3),(1522761763660107776,'运输','里程·重量','se','CO₂e','AR4','t','t',12.000000,'t/t',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','华北','通用','22',1972,1,'1522106105617059840','2022-05-07 10:14:31','1522106105617059840','2022-05-07 10:14:31',1522761763660107776,NULL,-1,5),(1522765678417940480,'外购电力',NULL,'越南电力','CO2e','AR4','g','kWh',454.800000,'g/kWh',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','越南','','','Based on IEA data from  CO2 Emissions from Fuel Combustion © OECD/IEA 2020, www.iea.org/statistics, Licence:  www.iea.org/t&c; as modified by UL E&S. Users are only permitted to',2020,1,'1522124426508898304','2022-05-07 10:30:04','1522124426508898304','2022-05-07 10:30:04',0,NULL,-1,2),(1522766728701022208,'运输','里程·重量','q2','CO₂e','AR6','kg','t',22.000000,'kg/t',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','','通用','we',1971,1,'1522106105617059840','2022-05-07 10:34:14','1522106105617059840','2022-05-07 10:34:14',1522766728701022208,NULL,-1,4),(1522766906300436480,'外购热能',NULL,'q22','CO₂e','AR6','kg','t',22.000000,'kg/t',0.000000,'','',0.000000,'','',0.000000,'','',0.000000,'','中国','','通用','we',1971,1,'1522106105617059840','2022-05-07 10:34:57','1522106105617059840','2022-05-07 10:34:57',1522766906300436480,NULL,-1,4),(1522768385673400320,'能源','固定燃烧排放','w','CO₂e','AR4','kg','km',22.000002,'kg/km',0.000000,'','',2.000000,'KJ/km','1',1.000000,'TC/KJ','1',3.000000,'1','中国','华北','通用','',2023,1,'1522106105617059840','2022-05-07 10:40:49','1522106105617059840','2022-05-07 10:40:49',1522768385673400320,NULL,-1,5),(1522768495941652480,'能源','固定燃烧排放','w','CO₂e','AR4','kg','km',22.000002,'kg/km',0.000000,'','',2.000000,'KJ/km','1',1.000000,'TC/KJ','1',3.000000,'1','中国','华北','通用','',2023,1,'1522106105617059840','2022-05-07 10:41:16','1522106105617059840','2022-05-07 10:41:16',1522768495941652480,NULL,-1,5);
/*!40000 ALTER TABLE `tb_sys_emission_factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport_emission`
--

DROP TABLE IF EXISTS `transport_emission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transport_emission` (
  `id` bigint NOT NULL COMMENT '主键',
  `inventory_id` bigint NOT NULL COMMENT '碳盘查报告id',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '分类',
  `transportation_mode` varchar(30) NOT NULL DEFAULT '' COMMENT '交通运输方式',
  `vehicle_type` varchar(30) NOT NULL DEFAULT '' COMMENT '车辆类型',
  `quantity` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '数量',
  `fuel_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '燃料单位',
  `factor_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '排放因子单位',
  `use_default_factor` int NOT NULL DEFAULT '0' COMMENT '是否使用默认碳排放因子',
  `carbon_emission` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '二氧化碳排放',
  `carbon_emission_unit` varchar(30) NOT NULL DEFAULT '' COMMENT '二氧化碳排放单位',
  `factor` decimal(24,6) NOT NULL DEFAULT '0.000000' COMMENT '排放因子',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `revision` int NOT NULL COMMENT '乐观锁',
  `created_by` varchar(32) NOT NULL COMMENT '创建人工号',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(20) NOT NULL COMMENT '更新人工号',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户号',
  `delete_flag` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='交通运输排放';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport_emission`
--

LOCK TABLES `transport_emission` WRITE;
/*!40000 ALTER TABLE `transport_emission` DISABLE KEYS */;
/*!40000 ALTER TABLE `transport_emission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'cec_test'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-13 14:29:24
