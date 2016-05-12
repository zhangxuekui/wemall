-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: we
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `wemall_access`
--

DROP TABLE IF EXISTS `wemall_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wemall_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wemall_access`
--

LOCK TABLES `wemall_access` WRITE;
/*!40000 ALTER TABLE `wemall_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `wemall_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wemall_admin`
--

DROP TABLE IF EXISTS `wemall_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wemall_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wemall_admin`
--

LOCK TABLES `wemall_admin` WRITE;
/*!40000 ALTER TABLE `wemall_admin` DISABLE KEYS */;
INSERT INTO `wemall_admin` VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e','2015-01-26 01:10:49');
/*!40000 ALTER TABLE `wemall_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wemall_alipay`
--

DROP TABLE IF EXISTS `wemall_alipay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wemall_alipay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alipayname` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '֧        ',
  `partner` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '          id',
  `key` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '  ȫ      ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wemall_alipay`
--

LOCK TABLES `wemall_alipay` WRITE;
/*!40000 ALTER TABLE `wemall_alipay` DISABLE KEYS */;
/*!40000 ALTER TABLE `wemall_alipay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wemall_good`
--

DROP TABLE IF EXISTS `wemall_good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wemall_good` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `name` text NOT NULL,
  `price` text NOT NULL,
  `old_price` text NOT NULL,
  `image` text NOT NULL,
  `detail` text NOT NULL,
  `status` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `viewcount` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wemall_good`
--

LOCK TABLES `wemall_good` WRITE;
/*!40000 ALTER TABLE `wemall_good` DISABLE KEYS */;
INSERT INTO `wemall_good` VALUES (1,1,0,'笨笨豆洁面慕斯+精华液礼盒','99','99','54d99e3e72820.jpg','<p><img src=\"http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479423929.gif\" _src=\"http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479423929.gif\" style=\"\"/></p><p><img src=\"http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479452948.gif\" _src=\"http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479452948.gif\" style=\"\"/></p><p><img src=\"http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479474598.gif\" _src=\"http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479474598.gif\" style=\"\"/></p><p><img src=\"http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479491109.gif\" _src=\"http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479491109.gif\" style=\"\"/></p><p><img src=\"http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479513210.gif\" _src=\"http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479513210.gif\" style=\"\"/></p><p><img src=\"http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479547703.gif\" _src=\"http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479547703.gif\" style=\"\"/></p><p><img src=\"http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479553478.gif\" _src=\"http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479553478.gif\" style=\"\"/></p><p><img src=\"http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479587221.gif\" _src=\"http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479587221.gif\" style=\"\"/></p><p><img src=\"http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479595050.gif\" _src=\"http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479595050.gif\" style=\"\"/></p><p><img src=\"http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479611344.gif\" _src=\"http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479611344.gif\" style=\"\"/></p><p><img src=\"http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479631011.gif\" _src=\"http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479631011.gif\" style=\"\"/></p>',1,'2016-04-28 06:49:13',0),(2,1,12,'12345','12','12','5721b1bbb99bf.jpg','<p>121</p>',1,'2016-04-28 06:46:19',0);
/*!40000 ALTER TABLE `wemall_good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wemall_info`
--

DROP TABLE IF EXISTS `wemall_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wemall_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `notification` text NOT NULL,
  `theme` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wemall_info`
--

LOCK TABLES `wemall_info` WRITE;
/*!40000 ALTER TABLE `wemall_info` DISABLE KEYS */;
INSERT INTO `wemall_info` VALUES (1,'不要精明的累，就要笨笨的活！点击活出你的美！','','default');
/*!40000 ALTER TABLE `wemall_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wemall_mail`
--

DROP TABLE IF EXISTS `wemall_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wemall_mail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `smtp` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `on` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wemall_mail`
--

LOCK TABLES `wemall_mail` WRITE;
/*!40000 ALTER TABLE `wemall_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `wemall_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wemall_member`
--

DROP TABLE IF EXISTS `wemall_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wemall_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wemall_member`
--

LOCK TABLES `wemall_member` WRITE;
/*!40000 ALTER TABLE `wemall_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `wemall_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wemall_menu`
--

DROP TABLE IF EXISTS `wemall_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wemall_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wemall_menu`
--

LOCK TABLES `wemall_menu` WRITE;
/*!40000 ALTER TABLE `wemall_menu` DISABLE KEYS */;
INSERT INTO `wemall_menu` VALUES (1,'һ',0);
/*!40000 ALTER TABLE `wemall_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wemall_node`
--

DROP TABLE IF EXISTS `wemall_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wemall_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wemall_node`
--

LOCK TABLES `wemall_node` WRITE;
/*!40000 ALTER TABLE `wemall_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `wemall_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wemall_order`
--

DROP TABLE IF EXISTS `wemall_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wemall_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `orderid` varchar(255) NOT NULL,
  `totalprice` text NOT NULL,
  `pay_style` varchar(255) NOT NULL,
  `pay_status` tinyint(3) unsigned NOT NULL,
  `note` text NOT NULL,
  `order_status` tinyint(3) unsigned NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cartdata` text NOT NULL,
  `order_info` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order` (`order_status`),
  KEY `orderid` (`orderid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wemall_order`
--

LOCK TABLES `wemall_order` WRITE;
/*!40000 ALTER TABLE `wemall_order` DISABLE KEYS */;
INSERT INTO `wemall_order` VALUES (1,1,'201604281438183','99.00','微信支付',0,'',0,'2016-04-28 06:38:18','[{\"name\":\"笨笨豆洁面慕斯+精华液礼盒\",\"num\":\"1\",\"price\":\"99\"}]','');
/*!40000 ALTER TABLE `wemall_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wemall_order_level`
--

DROP TABLE IF EXISTS `wemall_order_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wemall_order_level` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `level_id` int(11) unsigned NOT NULL,
  `level_type` tinyint(3) unsigned NOT NULL,
  `price` float(6,2) unsigned NOT NULL,
  `active_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderid` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wemall_order_level`
--

LOCK TABLES `wemall_order_level` WRITE;
/*!40000 ALTER TABLE `wemall_order_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `wemall_order_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wemall_role`
--

DROP TABLE IF EXISTS `wemall_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wemall_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wemall_role`
--

LOCK TABLES `wemall_role` WRITE;
/*!40000 ALTER TABLE `wemall_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `wemall_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wemall_role_user`
--

DROP TABLE IF EXISTS `wemall_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wemall_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `admin_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wemall_role_user`
--

LOCK TABLES `wemall_role_user` WRITE;
/*!40000 ALTER TABLE `wemall_role_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `wemall_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wemall_statistics`
--

DROP TABLE IF EXISTS `wemall_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wemall_statistics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `goods_id` int(10) unsigned NOT NULL,
  `view_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wemall_statistics`
--

LOCK TABLES `wemall_statistics` WRITE;
/*!40000 ALTER TABLE `wemall_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `wemall_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wemall_tx_record`
--

DROP TABLE IF EXISTS `wemall_tx_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wemall_tx_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `price` float(6,2) NOT NULL,
  `bank_name` text NOT NULL,
  `bank_num` text NOT NULL,
  `name` text NOT NULL,
  `tel` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wemall_tx_record`
--

LOCK TABLES `wemall_tx_record` WRITE;
/*!40000 ALTER TABLE `wemall_tx_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `wemall_tx_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wemall_user`
--

DROP TABLE IF EXISTS `wemall_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wemall_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL,
  `member` tinyint(3) unsigned NOT NULL COMMENT ' Ƿ  ǻ Ա',
  `ticket` varchar(255) NOT NULL,
  `username` text NOT NULL,
  `phone` text NOT NULL,
  `weixin` text NOT NULL,
  `password` text NOT NULL,
  `address` text NOT NULL,
  `wx_info` text NOT NULL,
  `price` float(6,2) NOT NULL,
  `jifen` int(11) unsigned NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `url` text NOT NULL,
  `l_id` int(11) unsigned NOT NULL COMMENT ' ϼ ID',
  `l_b` int(11) unsigned NOT NULL COMMENT '   ϼ ',
  `l_c` int(11) unsigned NOT NULL COMMENT '     ϼ ',
  `c_cnt` int(11) unsigned NOT NULL COMMENT '3',
  `b_cnt` int(11) unsigned NOT NULL COMMENT '2',
  `a_cnt` int(11) unsigned NOT NULL COMMENT '1',
  `login` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `ticket` (`ticket`),
  KEY `l_id` (`l_id`),
  KEY `l_b` (`l_b`),
  KEY `l_c` (`l_c`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wemall_user`
--

LOCK TABLES `wemall_user` WRITE;
/*!40000 ALTER TABLE `wemall_user` DISABLE KEYS */;
INSERT INTO `wemall_user` VALUES (1,'1',0,'','zhangxuekui','15151939200','','e14b47308c03b968c32de29b092512cf','江苏省,null,null,ssadd','{\"nickname\":\"zhangxuekui\",\"subscribe_time\":1461667457}',0.00,0,'2016-04-28 06:38:45','',0,0,0,0,0,0,'zhangxuekui','303819762@qq.com');
/*!40000 ALTER TABLE `wemall_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wemall_wxconfig`
--

DROP TABLE IF EXISTS `wemall_wxconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wemall_wxconfig` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `num` text NOT NULL,
  `ini_num` text NOT NULL,
  `token` text NOT NULL,
  `appid` text NOT NULL,
  `appsecret` text NOT NULL,
  `encodingaeskey` text NOT NULL,
  `partnerid` text NOT NULL,
  `partnerkey` text NOT NULL,
  `paysignkey` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wemall_wxconfig`
--

LOCK TABLES `wemall_wxconfig` WRITE;
/*!40000 ALTER TABLE `wemall_wxconfig` DISABLE KEYS */;
INSERT INTO `wemall_wxconfig` VALUES (1,'1','','','','','','','','');
/*!40000 ALTER TABLE `wemall_wxconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wemall_wxmenu`
--

DROP TABLE IF EXISTS `wemall_wxmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wemall_wxmenu` (
  `menu_id` int(5) NOT NULL AUTO_INCREMENT,
  `menu_type` varchar(10) DEFAULT NULL,
  `menu_name` varchar(10) NOT NULL,
  `event_key` varchar(200) NOT NULL,
  `view_url` varchar(300) NOT NULL,
  `pid` int(5) NOT NULL DEFAULT '0',
  `listorder` varchar(5) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wemall_wxmenu`
--

LOCK TABLES `wemall_wxmenu` WRITE;
/*!40000 ALTER TABLE `wemall_wxmenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `wemall_wxmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wemall_wxmessage`
--

DROP TABLE IF EXISTS `wemall_wxmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wemall_wxmessage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` text NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `picurl` text NOT NULL,
  `url` text NOT NULL,
  `key` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wemall_wxmessage`
--

LOCK TABLES `wemall_wxmessage` WRITE;
/*!40000 ALTER TABLE `wemall_wxmessage` DISABLE KEYS */;
INSERT INTO `wemall_wxmessage` VALUES (8,'1','','请点击以下链接，了解详情：\r\n						\r\n1、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203441870&amp;idx=1&amp;sn=21d6bd4c54b2ee305a6ad05a9f49e48c#rd\">笨笨豆是什么</a>\r\n						\r\n2、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203245532&amp;idx=1&amp;sn=91bafc80e0690fb29bb7df9ae45a6e9a#rd\">模式解说</a>\r\n\r\n3、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203063484&amp;idx=1&amp;sn=4e8831c19873050cc918162dab21cc3c#rd\">如何赚取佣金</a>\r\n\r\n4、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203063620&amp;idx=1&amp;sn=f32d5ab174aca241abfb87a93c87acf8#rd\">如何开通微支付</a>\r\n\r\n5、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203063674&amp;idx=1&amp;sn=b2b6896b43a832b23d5f33dc2b051e0f#rd\">如何购买</a>\r\n\r\n6、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203245457&amp;idx=1&amp;sn=318b46bc5260395864dc5194afcd3954#rd\">如何推广</a>\r\n\r\n7、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203245483&amp;idx=1&amp;sn=ed1507226c1ee90994a36f4e889bfae6#rd\">确认收货</a>\r\n\r\n8、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203245503&amp;idx=1&amp;sn=fce448fbe85ea0776809ad6bb3050c4c#rd\">提现申请</a>\r\n\r\n9、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203063565&amp;idx=1&amp;sn=a313a9a729cf5da059e74c0abf3fc054#rd\">售后服务</a>\r\n\r\n10、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203594707&amp;idx=1&amp;sn=4d968dfac31d0f1ab1861370183dd83e#rd\">关于我们</a>','','','GET_INFO');
/*!40000 ALTER TABLE `wemall_wxmessage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-08 10:50:42
