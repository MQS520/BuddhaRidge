# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.25)
# Database: buddha_ridge
# Generation Time: 2019-04-15 12:07:50 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table article
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `status` int(4) NOT NULL DEFAULT '0' COMMENT '0 未审核; 1 审核通过; 2 审核不通过',
  `pushtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;

INSERT INTO `article` (`id`, `title`, `content`, `status`, `pushtime`)
VALUES
	(1,'hahah','ssss',1,'2019-03-09 17:54:53'),
	(2,'ssssss','ssss',1,'2019-03-09 17:54:55'),
	(3,'aaaaaaaaaa','ssssss',1,'2019-03-09 17:54:57'),
	(4,'bbbbbbbbb','bbbbbbbbb',1,'2019-03-09 17:54:58'),
	(5,'ccccc','cccccccc',0,'2019-03-09 17:57:43'),
	(6,'dddddddd','<h1>你好啊啊啊啊</h1>',1,'2019-03-09 17:55:01'),
	(7,'Win10 Contul安装','一. 下载consul\n\n这里的系统是win10 64位的,找到对应版本下载\n\n官网下载地址\n\n二. 配置\n\n下载后解压,将解压后的consul.exe文件放到想要安装的位置,如D://software/consul\n\n将此路径加入到环境变量Path中,即可\n\n三. 启动\n\n控制台输入命令启动\n\nconsul agent -dev\n\n打开浏览器输入地址\n\nlocalhost:8500/ 就可以看到consul的页面了',1,'2019-03-09 17:55:03'),
	(9,'dsafds ','dsawadsads',0,'2019-03-22 10:00:41'),
	(10,'dsafds ',' dsawadsads',0,'2019-03-22 14:07:37'),
	(11,'wrewre',' ewrewrew',0,'2019-03-22 14:08:07'),
	(12,'ewfewere',' darewfewe',0,'2019-03-22 14:11:33'),
	(13,'ewfewere',' darewfewe',0,'2019-03-22 14:11:55'),
	(14,'Hello World','   你好，世界！',2,'2019-03-24 11:11:31'),
	(23,'逗比3','    逗比是你\n	\n```java\npublic static void main(String[] args){\n	System.out.println(\"Hello Wrold!\");\n}\n```',1,'2019-03-26 11:08:14'),
	(24,'哈哈哈哈','哔哔哔哔哔',1,'2019-03-24 11:15:38');

/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table article_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article_type`;

CREATE TABLE `article_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL COMMENT '文章id',
  `type_id` int(11) DEFAULT NULL COMMENT '类型id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

LOCK TABLES `article_type` WRITE;
/*!40000 ALTER TABLE `article_type` DISABLE KEYS */;

INSERT INTO `article_type` (`id`, `article_id`, `type_id`)
VALUES
	(1,1,1),
	(2,2,1),
	(3,3,1),
	(4,4,2),
	(5,5,2),
	(6,6,2),
	(7,1,3),
	(8,7,1),
	(11,9,1),
	(12,9,2),
	(13,9,3),
	(14,10,1),
	(15,10,2),
	(16,10,3),
	(17,11,1),
	(18,11,2),
	(19,12,1),
	(20,12,2),
	(21,13,1),
	(22,13,2),
	(27,14,1),
	(28,14,2),
	(29,14,3),
	(31,23,3),
	(38,24,1),
	(39,23,1);

/*!40000 ALTER TABLE `article_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table article_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article_user`;

CREATE TABLE `article_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL COMMENT 'article主键',
  `user_id` int(11) DEFAULT NULL COMMENT 'user主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

LOCK TABLES `article_user` WRITE;
/*!40000 ALTER TABLE `article_user` DISABLE KEYS */;

INSERT INTO `article_user` (`id`, `article_id`, `user_id`)
VALUES
	(1,1,1),
	(2,2,1),
	(3,3,1),
	(4,4,1),
	(5,5,1),
	(6,6,1),
	(7,7,1),
	(8,1,2),
	(11,9,1),
	(12,9,2),
	(13,10,1),
	(14,10,2),
	(15,11,1),
	(16,12,1),
	(17,13,1),
	(30,14,2),
	(37,23,2),
	(41,24,1),
	(42,23,1);

/*!40000 ALTER TABLE `article_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `type`;

CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_type` varchar(255) DEFAULT NULL COMMENT '文章类型',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态: 0正常; 1冻结',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;

INSERT INTO `type` (`id`, `article_type`, `status`, `createtime`)
VALUES
	(1,'java',0,'2019-02-25 19:08:40'),
	(2,'python',0,'2019-02-25 19:09:11'),
	(3,'mysql',0,'2019-02-25 19:10:27');

/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `account` varchar(255) DEFAULT NULL COMMENT '账号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `role` int(4) DEFAULT NULL COMMENT '0 管理员; 1 普通用户',
  `status` int(4) DEFAULT NULL COMMENT '0 正常; 1 冻结',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `nickname`, `account`, `password`, `role`, `status`, `createtime`)
VALUES
	(1,'MQS','MQS','e10adc3949ba59abbe56e057f20f883e',0,0,'2019-03-26 17:02:25'),
	(2,'aaa','aaa','e10adc3949ba59abbe56e057f20f883e',0,0,'2019-03-26 15:51:59'),
	(3,'ccc','ccc','ccc',1,0,'2019-03-26 15:47:13'),
	(4,'ddd','ddd','e10adc3949ba59abbe56e057f20f883e',1,1,'2019-03-26 16:31:16');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
