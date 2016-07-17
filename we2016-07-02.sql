/*
Navicat MySQL Data Transfer

Source Server         : www.saikui.com
Source Server Version : 50630
Source Host           : www.saikui.com:3306
Source Database       : we

Target Server Type    : MYSQL
Target Server Version : 50630
File Encoding         : 65001

Date: 2016-07-02 16:51:45
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
  KEY `groupId` (`role_id`) USING BTREE,
  KEY `nodeId` (`node_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_access
-- ----------------------------

-- ----------------------------
-- Table structure for wemall_act
-- ----------------------------
DROP TABLE IF EXISTS `wemall_act`;
CREATE TABLE `wemall_act` (
  `act_id` int(10) NOT NULL AUTO_INCREMENT,
  `act_name` varchar(50) NOT NULL DEFAULT '0' COMMENT '活动名称',
  `start_time` int(10) DEFAULT '0' COMMENT '开始时间',
  `end_time` int(10) DEFAULT '0' COMMENT '结束时间',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `if_show` tinyint(4) DEFAULT '1' COMMENT '是否显示1显示0不显示',
  PRIMARY KEY (`act_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='活动表';

-- ----------------------------
-- Records of wemall_act
-- ----------------------------

-- ----------------------------
-- Table structure for wemall_act_goods
-- ----------------------------
DROP TABLE IF EXISTS `wemall_act_goods`;
CREATE TABLE `wemall_act_goods` (
  `act_goods_id` int(10) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) NOT NULL DEFAULT '0' COMMENT '商品id',
  `act_id` int(10) NOT NULL DEFAULT '0' COMMENT '活动id',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '添加管理员的id',
  `if_show` tinyint(4) DEFAULT '1' COMMENT '是否显示1显示0不显示',
  PRIMARY KEY (`act_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of wemall_act_goods
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
  `describe` varchar(255) DEFAULT NULL COMMENT '商品描述',
  `weblink` varchar(255) NOT NULL DEFAULT '0' COMMENT '商品链接',
  `couponslink` varchar(255) DEFAULT NULL COMMENT '优惠券地址',
  `price` text NOT NULL,
  `old_price` text NOT NULL,
  `image` text NOT NULL,
  `detail` text NOT NULL,
  `status` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `viewcount` int(10) unsigned DEFAULT '0',
  `recommend` int(10) unsigned DEFAULT '0' COMMENT '0不推荐1推荐到主页推荐位置2.主页下部分3热卖专区4限时秒杀5免单专区',
  PRIMARY KEY (`id`),
  KEY `menuid_sort_time` (`menu_id`,`sort`,`time`,`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_good
-- ----------------------------
INSERT INTO `wemall_good` VALUES ('1', '1', '0', '笨笨豆洁面慕斯+精华液礼盒', '111', '1111', 'https://www.google.com.tw/', '99', '99', '54d99e3e72820.jpg', 'dsgdffghfgh', '1', '2016-06-21 08:41:39', '14', '1');
INSERT INTO `wemall_good` VALUES ('2', '1', '12', '12345', '112222342342345', '', '', '12', '12', '5721b1bbb99bf.jpg', '<p>121</p>', '1', '2016-06-18 13:10:17', '14', '3');
INSERT INTO `wemall_good` VALUES ('3', '1', '111', '感动哦高级饭店里', '', '', '', '111', '11', '57371b161d2bb.jpg', '<p>地方韩国风会更好感觉很好就开了交</p>', '1', '2016-06-20 19:14:44', '29', '2');
INSERT INTO `wemall_good` VALUES ('4', '3', '11', '大富大贵感到反感', '', 'https://segmentfault.com/', 'https://segmentfault.com/', '111.66', '111.66', '5749ca9492e4e.JPG', '<p>1111动画风格和韩国观光和环境和对方的风格是</p>', '1', '2016-06-11 11:25:59', '35', '3');
INSERT INTO `wemall_good` VALUES ('5', '1', '1', '白色短袖大码宽松简约T 券后9.9元', null, 'http://s.click.taobao.com/npxb2Xx', null, '9.9', '39.9', '575e84f43ebb9.png', '<p>313232132131232213213</p>', '1', '2016-06-15 23:13:15', '7', '4');
INSERT INTO `wemall_good` VALUES ('6', '1', '1', '3242', null, '33423423', null, '3242', '342', '57676eea22d01.jpg', '<p>2343242342</p>', '1', '2016-06-20 19:14:59', '1', '5');

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
  KEY `rec_sort` (`recommend`,`sort`) USING BTREE
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
  KEY `level` (`level`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `name` (`name`) USING BTREE
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
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `order` (`order_status`) USING BTREE,
  KEY `orderid` (`orderid`) USING BTREE
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
  KEY `orderid` (`order_id`) USING BTREE
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
  KEY `pid` (`pid`) USING BTREE,
  KEY `status` (`status`) USING BTREE
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
  KEY `group_id` (`role_id`) USING BTREE,
  KEY `user_id` (`admin_id`) USING BTREE
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1 COMMENT=' 签到表';

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
INSERT INTO `wemall_signin` VALUES ('27', '1', '1465028003');
INSERT INTO `wemall_signin` VALUES ('28', '1', '1465138597');
INSERT INTO `wemall_signin` VALUES ('29', '6', '1465897801');

-- ----------------------------
-- Table structure for wemall_statistics
-- ----------------------------
DROP TABLE IF EXISTS `wemall_statistics`;
CREATE TABLE `wemall_statistics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `goods_id` int(10) unsigned NOT NULL,
  `view_time` int(10) unsigned NOT NULL,
  `source_id` int(10) NOT NULL DEFAULT '0' COMMENT '上级用户id',
  `wechatid` varchar(255) DEFAULT NULL COMMENT '微信公众号',
  `type` tinyint(4) DEFAULT NULL COMMENT '来源方式，1代是分享二维码，2代是关注微信公众号',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_statistics
-- ----------------------------
INSERT INTO `wemall_statistics` VALUES ('1', '1', '0', '1463283468', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('2', '1', '0', '1463283492', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('3', '1', '1', '1463283504', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('4', '1', '2', '1463283528', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('5', '1', '2', '1463292583', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('6', '1', '2', '1463403243', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('7', '1', '3', '1463403278', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('8', '1', '3', '1463403902', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('9', '1', '3', '1463403925', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('10', '1', '3', '1463403972', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('11', '1', '3', '1463404056', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('12', '1', '3', '1463404111', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('13', '1', '3', '1463404129', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('14', '1', '2', '1463404169', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('15', '1', '2', '1463404207', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('16', '1', '2', '1463404209', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('17', '1', '2', '1463404211', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('18', '1', '2', '1463404213', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('19', '1', '3', '1464451104', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('20', '1', '3', '1464451142', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('21', '1', '3', '1464451260', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('22', '1', '1', '1464490348', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('23', '1', '2', '1465031238', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('24', '1', '2', '1465054444', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('25', '1', '2', '1465054479', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('26', '1', '3', '1465054514', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('27', '1', '3', '1465054739', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('28', '1', '3', '1465054855', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('29', '1', '3', '1465054876', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('30', '1', '3', '1465054896', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('31', '1', '2', '1465054912', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('32', '1', '2', '1465054936', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('33', '1', '1', '1465054938', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('34', '1', '3', '1465054941', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('35', '1', '4', '1465054944', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('36', '1', '4', '1465055348', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('37', '1', '4', '1465055367', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('38', '1', '4', '1465055511', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('39', '1', '4', '1465055570', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('40', '1', '4', '1465055599', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('41', '1', '4', '1465055633', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('42', '1', '4', '1465055653', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('43', '1', '4', '1465055659', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('44', '1', '4', '1465055703', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('45', '1', '4', '1465055710', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('46', '1', '4', '1465055842', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('47', '1', '4', '1465056118', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('48', '1', '4', '1465056279', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('49', '1', '4', '1465056284', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('50', '1', '4', '1465056314', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('51', '1', '4', '1465056333', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('52', '1', '4', '1465056335', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('53', '1', '4', '1465056407', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('54', '1', '4', '1465056493', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('55', '1', '4', '1465056523', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('56', '1', '4', '1465056574', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('57', '1', '4', '1465056856', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('58', '1', '4', '1465056986', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('59', '1', '4', '1465057299', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('60', '1', '4', '1465057330', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('61', '1', '4', '1465057408', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('62', '1', '4', '1465057597', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('63', '1', '4', '1465137293', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('64', '1', '4', '1465137334', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('65', '1', '4', '1465137350', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('66', '1', '4', '1465137410', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('67', '1', '4', '1465137418', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('68', '1', '4', '1465137453', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('69', '1', '1', '1465138235', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('70', '1', '1', '1465138274', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('71', '1', '1', '1465138297', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('72', '1', '4', '1465138353', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('73', '1', '3', '1465140070', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('74', '1', '3', '1465140107', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('75', '1', '3', '1465140179', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('76', '1', '3', '1465140185', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('77', '1', '3', '1465140204', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('78', '1', '3', '1465140210', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('79', '1', '3', '1465140447', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('80', '1', '3', '1465140498', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('81', '1', '3', '1465140519', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('82', '1', '3', '1465140534', '0', null, null);
INSERT INTO `wemall_statistics` VALUES ('83', '1', '3', '1465141017', '1', null, null);
INSERT INTO `wemall_statistics` VALUES ('84', '1', '1', '1465486946', '1', null, null);
INSERT INTO `wemall_statistics` VALUES ('85', '1', '1', '1465539603', '1', null, null);
INSERT INTO `wemall_statistics` VALUES ('86', '1', '2', '1465617260', '1', null, null);

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
  KEY `uid` (`uid`) USING BTREE
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
  UNIQUE KEY `uid` (`uid`) USING BTREE,
  KEY `ticket` (`ticket`) USING BTREE,
  KEY `l_id` (`l_id`) USING BTREE,
  KEY `l_b` (`l_b`) USING BTREE,
  KEY `l_c` (`l_c`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_user
-- ----------------------------
INSERT INTO `wemall_user` VALUES ('1', '1', '0', '', 'zhangxuekui', '15151939200', '', 'e14b47308c03b968c32de29b092512cf', '江苏省,null,null,ssadd', '{\"nickname\":\"zhangxuekui\",\"subscribe_time\":1461667457}', '0.00', '0', '2016-04-28 14:38:45', '', '0', '0', '0', '0', '0', '0', 'zhangxuekui', '303819762@qq.com');
INSERT INTO `wemall_user` VALUES ('2', '2', '0', '', '', '123456', '', '1b1b761570433315865e53c2a083c700', '', '{\"nickname\":\"perlauhlenhopp4r6\",\"subscribe_time\":1465755989}', '0.00', '0', '2016-06-13 02:26:29', '', '0', '0', '0', '0', '0', '0', 'perlauhlenhopp4r6', 'hirataixad@live.com');
INSERT INTO `wemall_user` VALUES ('3', '3', '0', '', '', '12', '', '34d7b46cdc9023a89443c69bad2e814c', '', '{\"nickname\":\"lftlong\",\"subscribe_time\":1465812250}', '0.00', '0', '2016-06-13 18:04:10', '', '0', '0', '0', '0', '0', '0', 'lftlong', 'lftlong@163.com');
INSERT INTO `wemall_user` VALUES ('4', '4', '0', '', '', '123456', '', '7c63bc5d4fb2493e9ad2e567da32910a', '', '{\"nickname\":\"ArdmxurJato\",\"subscribe_time\":1465814209}', '0.00', '0', '2016-06-13 18:36:49', '', '0', '0', '0', '0', '0', '0', 'ArdmxurJato', 'ardthurxen@gmail.com');
INSERT INTO `wemall_user` VALUES ('5', '5', '0', '', '', '123456', '', 'c0411ee06389423b814a209fab2c1b59', '', '{\"nickname\":\"louisapr4\",\"subscribe_time\":1465890407}', '0.00', '0', '2016-06-14 15:46:47', '', '0', '0', '0', '0', '0', '0', 'louisapr4', 'lilyoz60@omegaxray.thefreemail.top');
INSERT INTO `wemall_user` VALUES ('6', '6', '0', '', '', '15080313439', '', '34d7b46cdc9023a89443c69bad2e814c', '', '{\"nickname\":\"zykq811\",\"subscribe_time\":1465897795}', '0.00', '0', '2016-06-14 17:49:55', '', '0', '0', '0', '0', '0', '0', 'zykq811', 'starzykq@163.com');
INSERT INTO `wemall_user` VALUES ('7', '7', '0', '', '', '123456', '', '6339db8ce161644a07dee9fcef30805a', '', '{\"nickname\":\"RolandoKt\",\"subscribe_time\":1466075087}', '0.00', '0', '2016-06-16 19:04:47', '', '0', '0', '0', '0', '0', '0', 'RolandoKt', 'raymondtit@yandex.ru');
INSERT INTO `wemall_user` VALUES ('8', '8', '0', '', '', '123456', '', '8d41a085fe8b91498a228174542193bb', '', '{\"nickname\":\"Anibix\",\"subscribe_time\":1466278209}', '0.00', '0', '2016-06-19 03:30:09', '', '0', '0', '0', '0', '0', '0', 'Anibix', 'ccueqiqq5gtq@mail.ru');
INSERT INTO `wemall_user` VALUES ('9', '9', '0', '', '', '123456', '', 'c0411ee06389423b814a209fab2c1b59', '', '{\"nickname\":\"marcimf3\",\"subscribe_time\":1466298392}', '0.00', '0', '2016-06-19 09:06:32', '', '0', '0', '0', '0', '0', '0', 'marcimf3', 'leeie3@kilozeta.webmailious.top');
INSERT INTO `wemall_user` VALUES ('10', '10', '0', '', '', '123456', '', '5d60778b5bf9c7d2f6cfc8119ccf6721', '', '{\"nickname\":\"RichardVerb\",\"subscribe_time\":1466393111}', '0.00', '0', '2016-06-20 11:25:11', '', '0', '0', '0', '0', '0', '0', 'RichardVerb', 'cafe@sixin-cafe.com');
INSERT INTO `wemall_user` VALUES ('11', '11', '0', '', '', '123456', '', '48c94d0f2a0c5dfaa93cfcbee77d3b85', '', '{\"nickname\":\"Gyncinvicle\",\"subscribe_time\":1466541065}', '0.00', '0', '2016-06-22 04:31:05', '', '0', '0', '0', '0', '0', '0', 'Gyncinvicle', 'JuarezHolloway48504@gmail.com');
INSERT INTO `wemall_user` VALUES ('12', '12', '0', '', '', '123456', '', 'c0411ee06389423b814a209fab2c1b59', '', '{\"nickname\":\"millicentdq11\",\"subscribe_time\":1466647297}', '0.00', '0', '2016-06-23 10:01:37', '', '0', '0', '0', '0', '0', '0', 'millicentdq11', 'estelajc20@zulu.xray.livefreemail.top');
INSERT INTO `wemall_user` VALUES ('13', '13', '0', '', '', '123456', '', '1b1b761570433315865e53c2a083c700', '', '{\"nickname\":\"leiaschobertf3g\",\"subscribe_time\":1466750580}', '0.00', '0', '2016-06-24 14:43:00', '', '0', '0', '0', '0', '0', '0', 'leiaschobertf3g', 'wadauzm@hotmail.com');
INSERT INTO `wemall_user` VALUES ('14', '14', '0', '', '', '123456', '', 'c0411ee06389423b814a209fab2c1b59', '', '{\"nickname\":\"melbajb2\",\"subscribe_time\":1466859144}', '0.00', '0', '2016-06-25 20:52:24', '', '0', '0', '0', '0', '0', '0', 'melbajb2', 'lakishaaz1@lima.zulu.webmailious.top');
INSERT INTO `wemall_user` VALUES ('15', '15', '0', '', '', '123456', '', 'ca46af986aca20eda4f1f5176ae1d02b', '', '{\"nickname\":\"fyripusnrt\",\"subscribe_time\":1466873018}', '0.00', '0', '2016-06-26 00:43:38', '', '0', '0', '0', '0', '0', '0', 'fyripusnrt', 'AlstonHendricks40750+2O4Pq@gmail.com');
INSERT INTO `wemall_user` VALUES ('16', '16', '0', '', '', '123456', '', 'e5509816bf1686407fa490e6cdf8b86e', '', '{\"nickname\":\"Ronaldrelt\",\"subscribe_time\":1467016096}', '0.00', '0', '2016-06-27 16:28:16', '', '0', '0', '0', '0', '0', '0', 'Ronaldrelt', 'meme123@ccxpnthu2.pw');
INSERT INTO `wemall_user` VALUES ('17', '17', '0', '', '', '123456', '', '5cbdaf109a9603eb5225a28778db5e3b', '', '{\"nickname\":\"hdruonlineme\",\"subscribe_time\":1467030397}', '0.00', '0', '2016-06-27 20:26:37', '', '0', '0', '0', '0', '0', '0', 'hdruonlineme', 'hd2017ruonline@yandex.com');
INSERT INTO `wemall_user` VALUES ('18', '18', '0', '', '', '123456', '', 'c0411ee06389423b814a209fab2c1b59', '', '{\"nickname\":\"emmade60\",\"subscribe_time\":1467336847}', '0.00', '0', '2016-07-01 09:34:07', '', '0', '0', '0', '0', '0', '0', 'emmade60', 'meredithal16@omegaxray.thefreemail.top');

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
INSERT INTO `wemall_wxconfig` VALUES ('1', 'yunxianggou', 'gh_2f7f47398272gh_a35110bdca98', 'zhangxuekui', 'wxbd6d33fdeb93a3da', 'd9ec1d60289d0ccf74be77f3804adeba', 'VKX0uMMhek9BMGUfXwRilubXCYbWh2zXYAcPyFebAI8', '', '', '');

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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_wxmessage
-- ----------------------------
INSERT INTO `wemall_wxmessage` VALUES ('8', '1', '', '请点击以下链接，了解详情：\r\n						\r\n1、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203441870&amp;idx=1&amp;sn=21d6bd4c54b2ee305a6ad05a9f49e48c#rd\">笨笨豆是什么</a>\r\n						\r\n2、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203245532&amp;idx=1&amp;sn=91bafc80e0690fb29bb7df9ae45a6e9a#rd\">模式解说</a>\r\n\r\n3、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203063484&amp;idx=1&amp;sn=4e8831c19873050cc918162dab21cc3c#rd\">如何赚取佣金</a>\r\n\r\n4、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203063620&amp;idx=1&amp;sn=f32d5ab174aca241abfb87a93c87acf8#rd\">如何开通微支付</a>\r\n\r\n5、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203063674&amp;idx=1&amp;sn=b2b6896b43a832b23d5f33dc2b051e0f#rd\">如何购买</a>\r\n\r\n6、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203245457&amp;idx=1&amp;sn=318b46bc5260395864dc5194afcd3954#rd\">如何推广</a>\r\n\r\n7、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203245483&amp;idx=1&amp;sn=ed1507226c1ee90994a36f4e889bfae6#rd\">确认收货</a>\r\n\r\n8、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203245503&amp;idx=1&amp;sn=fce448fbe85ea0776809ad6bb3050c4c#rd\">提现申请</a>\r\n\r\n9、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203063565&amp;idx=1&amp;sn=a313a9a729cf5da059e74c0abf3fc054#rd\">售后服务</a>\r\n\r\n10、<a href=\"http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203594707&amp;idx=1&amp;sn=4d968dfac31d0f1ab1861370183dd83e#rd\">关于我们</a>', '', '', 'GET_INFO');
INSERT INTO `wemall_wxmessage` VALUES ('9', '1', '12', '12', '576654bc15ffa.JPG', 'http://www.saikui.com', '123');
