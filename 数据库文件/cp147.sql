# MySQL-Front 5.1  (Build 4.2)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: shujuku_db
# ------------------------------------------------------
# Server version 5.0.67-community-nt

#
# Source for table t_fangyingting
#

DROP TABLE IF EXISTS `t_fangyingting`;
CREATE TABLE `t_fangyingting` (
  `id` int(11) NOT NULL auto_increment,
  `deletestatus` int(11) NOT NULL,
  `hang` int(11) NOT NULL,
  `lie` int(11) NOT NULL,
  `name` varchar(255) default NULL,
  `zuoweishu` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table t_fangyingting
#

LOCK TABLES `t_fangyingting` WRITE;
/*!40000 ALTER TABLE `t_fangyingting` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_fangyingting` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_order
#

DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL auto_increment,
  `createtime` datetime default NULL,
  `jiazong` varchar(255) default NULL,
  `orderid` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `truename` varchar(255) default NULL,
  `zhuangtai` varchar(255) default NULL,
  `userid` int(11) default NULL,
  `zuoweiid` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK9EFDD3A3774E5A41` (`zuoweiid`),
  KEY `FK9EFDD3A32EDD2249` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table t_order
#

LOCK TABLES `t_order` WRITE;
/*!40000 ALTER TABLE `t_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_user
#

DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL auto_increment,
  `createtime` datetime default NULL,
  `deletestatus` int(11) NOT NULL,
  `lianxifangshi` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `role` int(11) NOT NULL,
  `truename` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Dumping data for table t_user
#

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,NULL,0,NULL,'111111',1,'admin','admin');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_yingxun
#

DROP TABLE IF EXISTS `t_yingxun`;
CREATE TABLE `t_yingxun` (
  `id` int(11) NOT NULL auto_increment,
  `createtime` datetime default NULL,
  `daoyan` varchar(255) default NULL,
  `deletestatus` int(11) NOT NULL,
  `fangyingshijian` varchar(255) default NULL,
  `gongsi` varchar(255) default NULL,
  `juqing` varchar(255) default NULL,
  `pianming` varchar(255) default NULL,
  `piaojia` varchar(255) default NULL,
  `shengyu` int(11) NOT NULL,
  `shichang` varchar(255) default NULL,
  `tupian` varchar(255) default NULL,
  `yuyan` varchar(255) default NULL,
  `zhuyan` varchar(255) default NULL,
  `fangyingtingid` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKD90822BDF92CB089` (`fangyingtingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table t_yingxun
#

LOCK TABLES `t_yingxun` WRITE;
/*!40000 ALTER TABLE `t_yingxun` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_yingxun` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_zuowei
#

DROP TABLE IF EXISTS `t_zuowei`;
CREATE TABLE `t_zuowei` (
  `id` int(11) NOT NULL auto_increment,
  `deletestatus` int(11) NOT NULL,
  `pai` int(11) NOT NULL,
  `zhuangtai` varchar(255) default NULL,
  `zuo` int(11) NOT NULL,
  `zuowei` varchar(255) default NULL,
  `yingxunid` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK53B1789267126F13` (`yingxunid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table t_zuowei
#

LOCK TABLES `t_zuowei` WRITE;
/*!40000 ALTER TABLE `t_zuowei` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_zuowei` ENABLE KEYS */;
UNLOCK TABLES;

#
#  Foreign keys for table t_order
#

ALTER TABLE `t_order`
ADD CONSTRAINT `FK9EFDD3A32EDD2249` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`),
ADD CONSTRAINT `FK9EFDD3A3774E5A41` FOREIGN KEY (`zuoweiid`) REFERENCES `t_zuowei` (`id`);

#
#  Foreign keys for table t_yingxun
#

ALTER TABLE `t_yingxun`
ADD CONSTRAINT `FKD90822BDF92CB089` FOREIGN KEY (`fangyingtingid`) REFERENCES `t_fangyingting` (`id`);

#
#  Foreign keys for table t_zuowei
#

ALTER TABLE `t_zuowei`
ADD CONSTRAINT `FK53B1789267126F13` FOREIGN KEY (`yingxunid`) REFERENCES `t_yingxun` (`id`);


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
