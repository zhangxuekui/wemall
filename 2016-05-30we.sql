/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : we

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-05-30 07:58:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wemall_access
-- ----------------------------
DROP TABLE IF EXISTS `wemall_access`;
CREATE TABLE `wemall_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_access
-- ----------------------------

-- ----------------------------
-- Table structure for wemall_admin
-- ----------------------------
DROP TABLE IF EXISTS `wemall_admin`;
CREATE TABLE `wemall_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_admin
-- ----------------------------
INSERT INTO `wemall_admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2015-01-26 09:10:49');

-- ----------------------------
-- Table structure for wemall_alipay
-- ----------------------------
DROP TABLE IF EXISTS `wemall_alipay`;
CREATE TABLE `wemall_alipay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alipayname` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '֧        ',
  `partner` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '          id',
  `key` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '  ȫ      ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of wemall_alipay
-- ----------------------------

-- ----------------------------
-- Table structure for wemall_good
-- ----------------------------
DROP TABLE IF EXISTS `wemall_good`;
CREATE TABLE `wemall_good` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` text NOT NULL,
  `old_price` text NOT NULL,
  `image` text NOT NULL,
  `detail` text NOT NULL,
  `status` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `viewcount` int(10) unsigned DEFAULT '0',
  `recommend` int(10) unsigned DEFAULT '0' COMMENT '0不推荐1推荐到主页推荐位置2.主页下部分',
  PRIMARY KEY (`id`),
  KEY `menuid_sort_time` (`menu_id`,`sort`,`time`,`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of wemall_good
-- ----------------------------
INSERT INTO `wemall_good` VALUES ('1', '1', '0', '笨笨豆洁面慕斯+精华液礼盒\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '99', '99', '54d99e3e72820.jpg', 'dsgdffghfgh', '1', '2016-05-29 10:52:28', '2', '1');
INSERT INTO `wemall_good` VALUES ('2', '1', '12', '12345\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '12', '12', '5721b1bbb99bf.jpg', '<p>121</p>', '1', '2016-05-16 21:10:13', '7', '2');
INSERT INTO `wemall_good` VALUES ('3', '1', '111', '感动哦高级饭店里\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '111', '11', '57371b161d2bb.jpg', '<p>地方韩国风会更好感觉很好就开了交</p>', '1', '2016-05-29 00:01:00', '11', '2');
INSERT INTO `wemall_good` VALUES ('4', '3', '11', '大富大贵感到反感\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '111.66', '111.66', '5749ca9492e4e.JPG', '<p>1111动画风格和韩国观光和环境和对方的风格是</p>', '1', '2016-05-29 00:43:00', '0', '2');

-- ----------------------------
-- Table structure for wemall_info
-- ----------------------------
DROP TABLE IF EXISTS `wemall_info`;
CREATE TABLE `wemall_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `notification` text NOT NULL,
  `theme` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_info
-- ----------------------------
INSERT INTO `wemall_info` VALUES ('1', '不要精明的累，就要笨笨的活！点击活出你的美！', '', 'default');

-- ----------------------------
-- Table structure for wemall_mail
-- ----------------------------
DROP TABLE IF EXISTS `wemall_mail`;
CREATE TABLE `wemall_mail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `smtp` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `on` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_mail
-- ----------------------------

-- ----------------------------
-- Table structure for wemall_member
-- ----------------------------
DROP TABLE IF EXISTS `wemall_member`;
CREATE TABLE `wemall_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of wemall_member
-- ----------------------------

-- ----------------------------
-- Table structure for wemall_menu
-- ----------------------------
DROP TABLE IF EXISTS `wemall_menu`;
CREATE TABLE `wemall_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `pid` int(4) NOT NULL DEFAULT '0' COMMENT '上次菜单',
  `recommend` tinyint(4) DEFAULT '0' COMMENT '是否推荐',
  `sort` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rec_sort` (`recommend`,`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_menu
-- ----------------------------
INSERT INTO `wemall_menu` VALUES ('1', '电子', '0', '1', '0');
INSERT INTO `wemall_menu` VALUES ('3', '吃货', '0', '0', '0');
INSERT INTO `wemall_menu` VALUES ('4', '玩具', '0', '0', '0');

-- ----------------------------
-- Table structure for wemall_node
-- ----------------------------
DROP TABLE IF EXISTS `wemall_node`;
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

-- ----------------------------
-- Records of wemall_node
-- ----------------------------

-- ----------------------------
-- Table structure for wemall_order
-- ----------------------------
DROP TABLE IF EXISTS `wemall_order`;
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

-- ----------------------------
-- Records of wemall_order
-- ----------------------------
INSERT INTO `wemall_order` VALUES ('1', '1', '201604281438183', '99.00', '微信支付', '0', '', '0', '2016-04-28 14:38:18', '[{\"name\":\"笨笨豆洁面慕斯+精华液礼盒\",\"num\":\"1\",\"price\":\"99\"}]', '');

-- ----------------------------
-- Table structure for wemall_order_level
-- ----------------------------
DROP TABLE IF EXISTS `wemall_order_level`;
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

-- ----------------------------
-- Records of wemall_order_level
-- ----------------------------

-- ----------------------------
-- Table structure for wemall_role
-- ----------------------------
DROP TABLE IF EXISTS `wemall_role`;
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

-- ----------------------------
-- Records of wemall_role
-- ----------------------------

-- ----------------------------
-- Table structure for wemall_role_user
-- ----------------------------
DROP TABLE IF EXISTS `wemall_role_user`;
CREATE TABLE `wemall_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `admin_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for wemall_signin
-- ----------------------------
DROP TABLE IF EXISTS `wemall_signin`;
CREATE TABLE `wemall_signin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT ' 签到用户id',
  `addtime` int(11) DEFAULT NULL COMMENT '签到时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COMMENT=' 签到表';

-- ----------------------------
-- Records of wemall_signin
-- ----------------------------
INSERT INTO `wemall_signin` VALUES ('1', '1', '1464491848');
INSERT INTO `wemall_signin` VALUES ('2', '1', '1464492295');
INSERT INTO `wemall_signin` VALUES ('3', '1', '1464492429');
INSERT INTO `wemall_signin` VALUES ('4', '1', '1464492490');
INSERT INTO `wemall_signin` VALUES ('5', '1', '1464492492');
INSERT INTO `wemall_signin` VALUES ('6', '1', '1464492494');
INSERT INTO `wemall_signin` VALUES ('7', '1', '1464492525');
INSERT INTO `wemall_signin` VALUES ('8', '1', '1464492569');
INSERT INTO `wemall_signin` VALUES ('9', '1', '1464492657');
INSERT INTO `wemall_signin` VALUES ('10', '1', '1464492661');
INSERT INTO `wemall_signin` VALUES ('11', '1', '1464492714');
INSERT INTO `wemall_signin` VALUES ('12', '1', '1464492769');
INSERT INTO `wemall_signin` VALUES ('13', '1', '1464492868');
INSERT INTO `wemall_signin` VALUES ('14', '1', '1464493105');
INSERT INTO `wemall_signin` VALUES ('15', '1', '1464494125');
INSERT INTO `wemall_signin` VALUES ('16', '1', '1464494220');
INSERT INTO `wemall_signin` VALUES ('17', '1', '1464494223');
INSERT INTO `wemall_signin` VALUES ('18', '1', '1464494224');
INSERT INTO `wemall_signin` VALUES ('19', '1', '1464494224');
INSERT INTO `wemall_signin` VALUES ('20', '1', '1464494225');
INSERT INTO `wemall_signin` VALUES ('21', '1', '1464494225');
INSERT INTO `wemall_signin` VALUES ('22', '1', '1464494226');
INSERT INTO `wemall_signin` VALUES ('23', '1', '1464494228');
INSERT INTO `wemall_signin` VALUES ('24', '1', '1464494228');
INSERT INTO `wemall_signin` VALUES ('25', '1', '1464494228');
INSERT INTO `wemall_signin` VALUES ('26', '1', '1464494235');

-- ----------------------------
-- Table structure for wemall_statistics
-- ----------------------------
DROP TABLE IF EXISTS `wemall_statistics`;
CREATE TABLE `wemall_statistics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `goods_id` int(10) unsigned NOT NULL,
  `view_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_statistics
-- ----------------------------
INSERT INTO `wemall_statistics` VALUES ('1', '1', '0', '1463283468');
INSERT INTO `wemall_statistics` VALUES ('2', '1', '0', '1463283492');
INSERT INTO `wemall_statistics` VALUES ('3', '1', '1', '1463283504');
INSERT INTO `wemall_statistics` VALUES ('4', '1', '2', '1463283528');
INSERT INTO `wemall_statistics` VALUES ('5', '1', '2', '1463292583');
INSERT INTO `wemall_statistics` VALUES ('6', '1', '2', '1463403243');
INSERT INTO `wemall_statistics` VALUES ('7', '1', '3', '1463403278');
INSERT INTO `wemall_statistics` VALUES ('8', '1', '3', '1463403902');
INSERT INTO `wemall_statistics` VALUES ('9', '1', '3', '1463403925');
INSERT INTO `wemall_statistics` VALUES ('10', '1', '3', '1463403972');
INSERT INTO `wemall_statistics` VALUES ('11', '1', '3', '1463404056');
INSERT INTO `wemall_statistics` VALUES ('12', '1', '3', '1463404111');
INSERT INTO `wemall_statistics` VALUES ('13', '1', '3', '1463404129');
INSERT INTO `wemall_statistics` VALUES ('14', '1', '2', '1463404169');
INSERT INTO `wemall_statistics` VALUES ('15', '1', '2', '1463404207');
INSERT INTO `wemall_statistics` VALUES ('16', '1', '2', '1463404209');
INSERT INTO `wemall_statistics` VALUES ('17', '1', '2', '1463404211');
INSERT INTO `wemall_statistics` VALUES ('18', '1', '2', '1463404213');
INSERT INTO `wemall_statistics` VALUES ('19', '1', '3', '1464451104');
INSERT INTO `wemall_statistics` VALUES ('20', '1', '3', '1464451142');
INSERT INTO `wemall_statistics` VALUES ('21', '1', '3', '1464451260');
INSERT INTO `wemall_statistics` VALUES ('22', '1', '1', '1464490348');

-- ----------------------------
-- Table structure for wemall_tx_record
-- ----------------------------
DROP TABLE IF EXISTS `wemall_tx_record`;
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

-- ----------------------------
-- Records of wemall_tx_record
-- ----------------------------

-- ----------------------------
-- Table structure for wemall_user
-- ----------------------------
DROP TABLE IF EXISTS `wemall_user`;
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

-- ----------------------------
-- Records of wemall_user
-- ----------------------------
INSERT INTO `wemall_user` VALUES ('1', '1', '0', '', 'zhangxuekui', '15151939200', '', 'e14b47308c03b968c32de29b092512cf', '江苏省,null,null,ssadd', '{\"nickname\":\"zhangxuekui\",\"subscribe_time\":1461667457}', '0.00', '0', '2016-04-28 14:38:45', '', '0', '0', '0', '0', '0', '0', 'zhangxuekui', '303819762@qq.com');

-- ----------------------------
-- Table structure for wemall_wxconfig
-- ----------------------------
DROP TABLE IF EXISTS `wemall_wxconfig`;
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

-- ----------------------------
-- Records of wemall_wxconfig
-- ----------------------------
INSERT INTO `wemall_wxconfig` VALUES ('1', '1', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for wemall_wxmenu
-- ----------------------------
DROP TABLE IF EXISTS `wemall_wxmenu`;
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

-- ----------------------------
-- Records of wemall_wxmenu
-- ----------------------------

-- ----------------------------
-- Table structure for wemall_wxmessage
-- ----------------------------
DROP TABLE IF EXISTS `wemall_wxmessage`;
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

-- ----------------------------
-- Records of wemall_wxmessage
-- ----------------------------
INSERT INTO `wemall_wxmessage` VALUES ('8', '1', '', '请点击以下链接，了解详情：\r\n						\r\n1、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203441870&amp;idx=1&amp;sn=21d6bd4c54b2ee305a6ad05a9f49e48c#rd\">笨笨豆是什么</a>\r\n						\r\n2、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203245532&amp;idx=1&amp;sn=91bafc80e0690fb29bb7df9ae45a6e9a#rd\">模式解说</a>\r\n\r\n3、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203063484&amp;idx=1&amp;sn=4e8831c19873050cc918162dab21cc3c#rd\">如何赚取佣金</a>\r\n\r\n4、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203063620&amp;idx=1&amp;sn=f32d5ab174aca241abfb87a93c87acf8#rd\">如何开通微支付</a>\r\n\r\n5、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203063674&amp;idx=1&amp;sn=b2b6896b43a832b23d5f33dc2b051e0f#rd\">如何购买</a>\r\n\r\n6、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203245457&amp;idx=1&amp;sn=318b46bc5260395864dc5194afcd3954#rd\">如何推广</a>\r\n\r\n7、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203245483&amp;idx=1&amp;sn=ed1507226c1ee90994a36f4e889bfae6#rd\">确认收货</a>\r\n\r\n8、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203245503&amp;idx=1&amp;sn=fce448fbe85ea0776809ad6bb3050c4c#rd\">提现申请</a>\r\n\r\n9、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203063565&amp;idx=1&amp;sn=a313a9a729cf5da059e74c0abf3fc054#rd\">售后服务</a>\r\n\r\n10、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203594707&amp;idx=1&amp;sn=4d968dfac31d0f1ab1861370183dd83e#rd\">关于我们</a>', '', '', 'GET_INFO');
