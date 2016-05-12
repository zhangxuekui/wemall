-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 02 月 17 日 01:30
-- 服务器版本: 5.5.20
-- PHP 版本: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `we`
--

-- --------------------------------------------------------

--
-- 表的结构 `wemall_access`
--

CREATE TABLE IF NOT EXISTS `wemall_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wemall_admin`
--

CREATE TABLE IF NOT EXISTS `wemall_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `wemall_admin`
--

INSERT INTO `wemall_admin` (`id`, `username`, `password`, `time`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2015-01-26 01:10:49');

-- --------------------------------------------------------

--
-- 表的结构 `wemall_alipay`
--

CREATE TABLE IF NOT EXISTS `wemall_alipay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alipayname` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '֧��������',
  `partner` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '����������id',
  `key` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '��ȫ������',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `wemall_good`
--

CREATE TABLE IF NOT EXISTS `wemall_good` (
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `wemall_good`
--

INSERT INTO `wemall_good` (`id`, `menu_id`, `sort`, `name`, `price`, `old_price`, `image`, `detail`, `status`, `time`) VALUES
(1, 1, 0, '笨笨豆洁面慕斯+精华液礼盒', '99', '99', '54d99e3e72820.jpg', '<p><img src="http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479423929.gif" _src="http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479423929.gif" style=""/></p><p><img src="http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479452948.gif" _src="http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479452948.gif" style=""/></p><p><img src="http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479474598.gif" _src="http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479474598.gif" style=""/></p><p><img src="http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479491109.gif" _src="http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479491109.gif" style=""/></p><p><img src="http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479513210.gif" _src="http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479513210.gif" style=""/></p><p><img src="http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479547703.gif" _src="http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479547703.gif" style=""/></p><p><img src="http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479553478.gif" _src="http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479553478.gif" style=""/></p><p><img src="http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479587221.gif" _src="http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479587221.gif" style=""/></p><p><img src="http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479595050.gif" _src="http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479595050.gif" style=""/></p><p><img src="http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479611344.gif" _src="http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479611344.gif" style=""/></p><p><img src="http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479631011.gif" _src="http://wx.yuewang520.cn/Public/Plugin/umeditor/php/upload/20150210/14235479631011.gif" style=""/></p>', 1, '2015-02-10 08:59:55');

-- --------------------------------------------------------

--
-- 表的结构 `wemall_info`
--

CREATE TABLE IF NOT EXISTS `wemall_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `notification` text NOT NULL,
  `theme` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `wemall_info`
--

INSERT INTO `wemall_info` (`id`, `name`, `notification`, `theme`) VALUES
(1, '不要精明的累，就要笨笨的活！点击活出你的美！', '', 'default');

-- --------------------------------------------------------

--
-- 表的结构 `wemall_mail`
--

CREATE TABLE IF NOT EXISTS `wemall_mail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `smtp` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `on` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wemall_member`
--

CREATE TABLE IF NOT EXISTS `wemall_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wemall_menu`
--

CREATE TABLE IF NOT EXISTS `wemall_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `wemall_menu`
--

INSERT INTO `wemall_menu` (`id`, `name`, `pid`) VALUES
(1, 'һ', 0);

-- --------------------------------------------------------

--
-- 表的结构 `wemall_node`
--

CREATE TABLE IF NOT EXISTS `wemall_node` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wemall_order`
--

CREATE TABLE IF NOT EXISTS `wemall_order` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;


-- --------------------------------------------------------

--
-- 表的结构 `wemall_order_level`
--

CREATE TABLE IF NOT EXISTS `wemall_order_level` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `level_id` int(11) unsigned NOT NULL,
  `level_type` tinyint(3) unsigned NOT NULL,
  `price` float(6,2) unsigned NOT NULL,
  `active_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderid` (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- 表的结构 `wemall_role`
--

CREATE TABLE IF NOT EXISTS `wemall_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wemall_role_user`
--

CREATE TABLE IF NOT EXISTS `wemall_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `admin_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wemall_tx_record`
--

CREATE TABLE IF NOT EXISTS `wemall_tx_record` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `wemall_user`
--

CREATE TABLE IF NOT EXISTS `wemall_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL,
  `member` tinyint(3) unsigned NOT NULL COMMENT '�Ƿ��ǻ�Ա',
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
  `l_id` int(11) unsigned NOT NULL COMMENT '�ϼ�ID',
  `l_b` int(11) unsigned NOT NULL COMMENT '���ϼ�',
  `l_c` int(11) unsigned NOT NULL COMMENT '�����ϼ�',
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

--
-- 转存表中的数据 `wemall_user`
--

-- --------------------------------------------------------

--
-- 表的结构 `wemall_wxconfig`
--

CREATE TABLE IF NOT EXISTS `wemall_wxconfig` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;


--
-- 转存表中的数据 `wemall_wxconfig`
--

INSERT INTO `wemall_wxconfig` (`id`, `num`, `ini_num`, `token`, `appid`, `appsecret`, `encodingaeskey`, `partnerid`, `partnerkey`, `paysignkey`) VALUES (1, '1', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `wemall_wxmenu`
--

CREATE TABLE IF NOT EXISTS `wemall_wxmenu` (
  `menu_id` int(5) NOT NULL AUTO_INCREMENT,
  `menu_type` varchar(10) DEFAULT NULL,
  `menu_name` varchar(10) NOT NULL,
  `event_key` varchar(200) NOT NULL,
  `view_url` varchar(300) NOT NULL,
  `pid` int(5) NOT NULL DEFAULT '0',
  `listorder` varchar(5) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `wemall_wxmenu`
--

-- --------------------------------------------------------

--
-- 表的结构 `wemall_wxmessage`
--

CREATE TABLE IF NOT EXISTS `wemall_wxmessage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` text NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `picurl` text NOT NULL,
  `url` text NOT NULL,
  `key` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `wemall_wxmessage`
--

INSERT INTO `wemall_wxmessage` (`id`, `type`, `title`, `description`, `picurl`, `url`, `key`) VALUES
(8, '1', '', '请点击以下链接，了解详情：\r\n						\r\n1、<a href="http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203441870&amp;idx=1&amp;sn=21d6bd4c54b2ee305a6ad05a9f49e48c#rd">笨笨豆是什么</a>\r\n						\r\n2、<a href="http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203245532&amp;idx=1&amp;sn=91bafc80e0690fb29bb7df9ae45a6e9a#rd">模式解说</a>\r\n\r\n3、<a href="http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203063484&amp;idx=1&amp;sn=4e8831c19873050cc918162dab21cc3c#rd">如何赚取佣金</a>\r\n\r\n4、<a href="http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203063620&amp;idx=1&amp;sn=f32d5ab174aca241abfb87a93c87acf8#rd">如何开通微支付</a>\r\n\r\n5、<a href="http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203063674&amp;idx=1&amp;sn=b2b6896b43a832b23d5f33dc2b051e0f#rd">如何购买</a>\r\n\r\n6、<a href="http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203245457&amp;idx=1&amp;sn=318b46bc5260395864dc5194afcd3954#rd">如何推广</a>\r\n\r\n7、<a href="http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203245483&amp;idx=1&amp;sn=ed1507226c1ee90994a36f4e889bfae6#rd">确认收货</a>\r\n\r\n8、<a href="http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203245503&amp;idx=1&amp;sn=fce448fbe85ea0776809ad6bb3050c4c#rd">提现申请</a>\r\n\r\n9、<a href="http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203063565&amp;idx=1&amp;sn=a313a9a729cf5da059e74c0abf3fc054#rd">售后服务</a>\r\n\r\n10、<a href="http://mp.weixin.qq.com/s?__biz=MzAxOTEyNTc3MA==&amp;mid=203594707&amp;idx=1&amp;sn=4d968dfac31d0f1ab1861370183dd83e#rd">关于我们</a>', '', '', 'GET_INFO');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
