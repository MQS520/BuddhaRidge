/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50634
 Source Host           : localhost:3306
 Source Schema         : buddha_ridge

 Target Server Type    : MySQL
 Target Server Version : 50634
 File Encoding         : 65001

 Date: 27/02/2019 21:20:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '内容',
  `pushtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 'hahah', 'ssss', '2019-02-23 13:57:33');
INSERT INTO `article` VALUES (2, 'ssssss', 'ssss', '2019-02-23 13:57:51');
INSERT INTO `article` VALUES (3, 'aaaaaaaaaa', 'ssssss', '2019-02-23 14:08:41');
INSERT INTO `article` VALUES (4, 'bbbbbbbbb', 'bbbbbbbbb', '2019-02-23 14:08:49');
INSERT INTO `article` VALUES (5, 'ccccc', 'cccccccc', '2019-02-23 14:08:57');
INSERT INTO `article` VALUES (6, 'dddddddd', '<h1>你好啊啊啊啊</h1>', '2019-02-24 10:32:46');
INSERT INTO `article` VALUES (7, 'Win10 Contul安装', '一. 下载consul\n\n这里的系统是win10 64位的,找到对应版本下载\n\n官网下载地址\n\n二. 配置\n\n下载后解压,将解压后的consul.exe文件放到想要安装的位置,如D://software/consul\n\n将此路径加入到环境变量Path中,即可\n\n三. 启动\n\n控制台输入命令启动\n\nconsul agent -dev\n\n打开浏览器输入地址\n\nlocalhost:8500/ 就可以看到consul的页面了', '2019-02-24 10:48:44');

-- ----------------------------
-- Table structure for article_type
-- ----------------------------
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL COMMENT '文章id',
  `type_id` int(11) DEFAULT NULL COMMENT '类型id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article_type
-- ----------------------------
INSERT INTO `article_type` VALUES (1, 1, 1);
INSERT INTO `article_type` VALUES (2, 2, 1);
INSERT INTO `article_type` VALUES (3, 3, 1);
INSERT INTO `article_type` VALUES (4, 4, 2);
INSERT INTO `article_type` VALUES (5, 5, 2);
INSERT INTO `article_type` VALUES (6, 6, 2);
INSERT INTO `article_type` VALUES (7, 1, 3);
INSERT INTO `article_type` VALUES (8, 7, 1);

-- ----------------------------
-- Table structure for article_user
-- ----------------------------
DROP TABLE IF EXISTS `article_user`;
CREATE TABLE `article_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL COMMENT 'article主键',
  `user_id` int(11) DEFAULT NULL COMMENT 'user主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article_user
-- ----------------------------
INSERT INTO `article_user` VALUES (1, 1, 1);
INSERT INTO `article_user` VALUES (2, 2, 1);
INSERT INTO `article_user` VALUES (3, 3, 1);
INSERT INTO `article_user` VALUES (4, 4, 1);
INSERT INTO `article_user` VALUES (5, 5, 1);
INSERT INTO `article_user` VALUES (6, 6, 1);
INSERT INTO `article_user` VALUES (7, 7, 1);
INSERT INTO `article_user` VALUES (8, 1, 2);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文章类型',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态: 0正常; 1冻结',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, 'java', 0, '2019-02-25 19:08:40');
INSERT INTO `type` VALUES (2, 'python', 0, '2019-02-25 19:09:11');
INSERT INTO `type` VALUES (3, 'mysql', 0, '2019-02-25 19:10:27');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `role` int(4) DEFAULT NULL COMMENT '0 管理员; 1 普通用户',
  `status` int(4) DEFAULT NULL COMMENT '0 正常; 1 冻结',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'MQS', 'MQS', '520753', 0, 0, '2019-02-24 11:05:45');
INSERT INTO `user` VALUES (2, 'aaa', 'aaa', '123456', 0, 0, '2019-02-24 11:13:22');

SET FOREIGN_KEY_CHECKS = 1;
