# Shop
MYSQL  -----shop--DATABASE


-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.26 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 shop 的数据库结构
DROP DATABASE IF EXISTS `shop`;
CREATE DATABASE IF NOT EXISTS `shop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `shop`;


-- 导出  表 shop.tb_arealink_1026g6 结构
DROP TABLE IF EXISTS `tb_arealink_1026g6`;
CREATE TABLE IF NOT EXISTS `tb_arealink_1026g6` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `PID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  shop.tb_arealink_1026g6 的数据：~1 rows (大约)
DELETE FROM `tb_arealink_1026g6`;
/*!40000 ALTER TABLE `tb_arealink_1026g6` DISABLE KEYS */;
INSERT INTO `tb_arealink_1026g6` (`ID`, `NAME`, `PID`) VALUES
	(1, '河南省', 1);
/*!40000 ALTER TABLE `tb_arealink_1026g6` ENABLE KEYS */;


-- 导出  表 shop.tb_classes_1026g6 结构
DROP TABLE IF EXISTS `tb_classes_1026g6`;
CREATE TABLE IF NOT EXISTS `tb_classes_1026g6` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `PID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  shop.tb_classes_1026g6 的数据：~0 rows (大约)
DELETE FROM `tb_classes_1026g6`;
/*!40000 ALTER TABLE `tb_classes_1026g6` DISABLE KEYS */;
INSERT INTO `tb_classes_1026g6` (`ID`, `NAME`, `PID`) VALUES
	(1, '电器', 1);
/*!40000 ALTER TABLE `tb_classes_1026g6` ENABLE KEYS */;


-- 导出  表 shop.tb_goods_1026g6 结构
DROP TABLE IF EXISTS `tb_goods_1026g6`;
CREATE TABLE IF NOT EXISTS `tb_goods_1026g6` (
  `ID` int(11) NOT NULL,
  `GOODSNAME` varchar(200) NOT NULL,
  `PRICE` int(11) NOT NULL,
  `PICTURE` varchar(200) NOT NULL,
  `CREDATE` date NOT NULL,
  `INTRODUCE` varchar(4000) NOT NULL,
  `CLASSNAME` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  shop.tb_goods_1026g6 的数据：~5 rows (大约)
DELETE FROM `tb_goods_1026g6`;
/*!40000 ALTER TABLE `tb_goods_1026g6` DISABLE KEYS */;
INSERT INTO `tb_goods_1026g6` (`ID`, `GOODSNAME`, `PRICE`, `PICTURE`, `CREDATE`, `INTRODUCE`, `CLASSNAME`) VALUES
	(1, '羽绒服', 123, 'clothing.jpg', '2017-08-20', '新品羽绒', '冬衣'),
	(2, 'bike', 120, 'bike.jpg', '2017-08-20', '自行车', '交通'),
	(3, 'rose', 15, 'rose.gif', '2017-08-20', '玫瑰花', '花'),
	(4, 'paoche', 23, 'paoche.jpg', '2017-08-20', '跑车', '交通'),
	(5, 'computer', 300, 'computer.jpg', '2017-08-20', '500', '电脑');
/*!40000 ALTER TABLE `tb_goods_1026g6` ENABLE KEYS */;


-- 导出  表 shop.tb_manager_1026g6 结构
DROP TABLE IF EXISTS `tb_manager_1026g6`;
CREATE TABLE IF NOT EXISTS `tb_manager_1026g6` (
  `ID` int(11) NOT NULL,
  `MANAGER` varchar(20) NOT NULL,
  `PWD` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  shop.tb_manager_1026g6 的数据：~0 rows (大约)
DELETE FROM `tb_manager_1026g6`;
/*!40000 ALTER TABLE `tb_manager_1026g6` DISABLE KEYS */;
INSERT INTO `tb_manager_1026g6` (`ID`, `MANAGER`, `PWD`) VALUES
	(1, 'admin', 'admin');
/*!40000 ALTER TABLE `tb_manager_1026g6` ENABLE KEYS */;


-- 导出  表 shop.tb_member_1026g6 结构
DROP TABLE IF EXISTS `tb_member_1026g6`;
CREATE TABLE IF NOT EXISTS `tb_member_1026g6` (
  `ID` int(11) DEFAULT NULL,
  `USERNAME` varchar(20) NOT NULL,
  `TRUENAME` varchar(20) NOT NULL,
  `PASSWORD` varchar(40) NOT NULL,
  `CITY` varchar(20) NOT NULL,
  `ADDRESS` varchar(100) NOT NULL,
  `POSTCODE` int(11) NOT NULL,
  `CARDNO` varchar(20) NOT NULL,
  `CARDTYPE` varchar(20) NOT NULL,
  `TEL` varchar(20) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `FREEZE` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  shop.tb_member_1026g6 的数据：~1 rows (大约)
DELETE FROM `tb_member_1026g6`;
/*!40000 ALTER TABLE `tb_member_1026g6` DISABLE KEYS */;
INSERT INTO `tb_member_1026g6` (`ID`, `USERNAME`, `TRUENAME`, `PASSWORD`, `CITY`, `ADDRESS`, `POSTCODE`, `CARDNO`, `CARDTYPE`, `TEL`, `EMAIL`, `FREEZE`) VALUES
	(1, 'lily', '测试11', '123456', '北京', '海淀区', 100001, '543634577842', '身份证', '123457534', '22233455@qq.com', '0');
/*!40000 ALTER TABLE `tb_member_1026g6` ENABLE KEYS */;


-- 导出  表 shop.tb_notice_1026g6 结构
DROP TABLE IF EXISTS `tb_notice_1026g6`;
CREATE TABLE IF NOT EXISTS `tb_notice_1026g6` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(20) NOT NULL,
  `CONTENT` varchar(200) NOT NULL,
  `CREATDATE` date NOT NULL,
  `ENDDATE` date NOT NULL,
  `ADDFILE` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  shop.tb_notice_1026g6 的数据：~0 rows (大约)
DELETE FROM `tb_notice_1026g6`;
/*!40000 ALTER TABLE `tb_notice_1026g6` DISABLE KEYS */;
INSERT INTO `tb_notice_1026g6` (`ID`, `TITLE`, `CONTENT`, `CREATDATE`, `ENDDATE`, `ADDFILE`) VALUES
	(1, '优惠公告', '元旦优惠', '2017-08-20', '2017-08-20', '20170820');
/*!40000 ALTER TABLE `tb_notice_1026g6` ENABLE KEYS */;


-- 导出  表 shop.tb_order_1026g6 结构
DROP TABLE IF EXISTS `tb_order_1026g6`;
CREATE TABLE IF NOT EXISTS `tb_order_1026g6` (
  `ID` int(11) NOT NULL,
  `MEMBERID` int(11) NOT NULL,
  `ORDERCODE` varchar(20) NOT NULL,
  `BNUMBER` int(11) NOT NULL,
  `USERNAME` varchar(20) NOT NULL,
  `ADDRESS` varchar(100) NOT NULL,
  `POSTCODE` int(11) NOT NULL,
  `TEL` varchar(20) NOT NULL,
  `列 9` varchar(20) NOT NULL,
  `PAY` varchar(20) NOT NULL,
  `CARRY` varchar(20) NOT NULL,
  `ORDERDATE` date NOT NULL,
  `ENFORCE` char(1) NOT NULL,
  `BZ` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  shop.tb_order_1026g6 的数据：~0 rows (大约)
DELETE FROM `tb_order_1026g6`;
/*!40000 ALTER TABLE `tb_order_1026g6` DISABLE KEYS */;
INSERT INTO `tb_order_1026g6` (`ID`, `MEMBERID`, `ORDERCODE`, `BNUMBER`, `USERNAME`, `ADDRESS`, `POSTCODE`, `TEL`, `列 9`, `PAY`, `CARRY`, `ORDERDATE`, `ENFORCE`, `BZ`) VALUES
	(1, 1, '20180820', 3, '测试', '北京朝阳区', 100001, '1234524255', '1', '积分兑换', 'EMS', '2017-08-20', '1', '请尽快寄回');
/*!40000 ALTER TABLE `tb_order_1026g6` ENABLE KEYS */;


-- 导出  表 shop.tb_order_detail_1026g6 结构
DROP TABLE IF EXISTS `tb_order_detail_1026g6`;
CREATE TABLE IF NOT EXISTS `tb_order_detail_1026g6` (
  `ID` int(11) NOT NULL,
  `ORDERID` int(11) NOT NULL,
  `GOODSID` int(11) NOT NULL,
  `PRICE` int(11) NOT NULL,
  `NUMBERS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  shop.tb_order_detail_1026g6 的数据：~0 rows (大约)
DELETE FROM `tb_order_detail_1026g6`;
/*!40000 ALTER TABLE `tb_order_detail_1026g6` DISABLE KEYS */;
INSERT INTO `tb_order_detail_1026g6` (`ID`, `ORDERID`, `GOODSID`, `PRICE`, `NUMBERS`) VALUES
	(1, 1, 1, 123, 1);
/*!40000 ALTER TABLE `tb_order_detail_1026g6` ENABLE KEYS */;


-- 导出  表 shop.tb_type_1026g6 结构
DROP TABLE IF EXISTS `tb_type_1026g6`;
CREATE TABLE IF NOT EXISTS `tb_type_1026g6` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `FLAG` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  shop.tb_type_1026g6 的数据：~0 rows (大约)
DELETE FROM `tb_type_1026g6`;
/*!40000 ALTER TABLE `tb_type_1026g6` DISABLE KEYS */;
INSERT INTO `tb_type_1026g6` (`ID`, `NAME`, `FLAG`) VALUES
	(1, '快递', 'C');
/*!40000 ALTER TABLE `tb_type_1026g6` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
