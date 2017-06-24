/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2016-05-21 21:07:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for SysPermission
-- ----------------------------
--DROP TABLE IF EXISTS `sys_permission`;
--CREATE TABLE `sys_permission` (
--  `id` bigint(20) NOT NULL AUTO_INCREMENT,
--  `available` int(1) DEFAULT NULL,
--  `name` varchar(255) DEFAULT NULL,
--  `parentId` bigint(20) DEFAULT NULL,
--  `parentIds` varchar(255) DEFAULT NULL,
--  `permission` varchar(255) DEFAULT NULL,
--  `resourceType` enum('menu','button') DEFAULT NULL,
--  `url` varchar(255) DEFAULT NULL,
--  PRIMARY KEY (`id`)
--) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SysPermission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '1', 'user_manage', '0', '0/', 'userInfo:view', 'menu', 'userInfo/userList');
INSERT INTO `sys_permission` VALUES ('2', '1', 'user_add', '1', '0/1', 'userInfo:add', 'button', 'userInfo/userAdd');
INSERT INTO `sys_permission` VALUES ('3', '1', 'user_delete', '1', '0/1', 'userInfo:del', 'button', 'userInfo/userDel');

-- ----------------------------
-- Table structure for SysRole
-- ----------------------------
--DROP TABLE IF EXISTS `sys_role`;
--CREATE TABLE `sys_role` (
--  `id` bigint(20) NOT NULL AUTO_INCREMENT,
--  `available` int(1) DEFAULT NULL,
--  `description` varchar(255) DEFAULT NULL,
--  `role` varchar(255) DEFAULT NULL,
--  PRIMARY KEY (`id`)
--) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SysRole
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '1', 'manager', 'admin');
INSERT INTO `sys_role` VALUES ('2', '1', 'vip', 'vip');

-- ----------------------------
-- Table structure for SysRolePermission
-- ----------------------------
--DROP TABLE IF EXISTS `sys_role_permission`;
--CREATE TABLE `sys_role_permission` (
--  `roleId` bigint(20) NOT NULL,
--  `permissionId` bigint(20) NOT NULL,
--  KEY `FK_pn90qffgw1e6lo1xhw964qadf` (`roleId`),
--  KEY `FK_qr3wmwfxapktvdv5g6d4mbtta` (`permissionId`),
--  CONSTRAINT `FK_pn90qffgw1e6lo1xhw964qadf` FOREIGN KEY (`roleId`) REFERENCES `sys_role` (`id`),
--  CONSTRAINT `FK_qr3wmwfxapktvdv5g6d4mbtta` FOREIGN KEY (`permissionId`) REFERENCES `sys_permission` (`id`)
--) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SysRolePermission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '1');
INSERT INTO `sys_role_permission` VALUES ('1', '2');

-- ----------------------------
-- Table structure for SysUserRole
-- ----------------------------
--DROP TABLE IF EXISTS `sys_user_role`;
--CREATE TABLE `sys_user_role` (
--  `uid` bigint(20) NOT NULL,
--  `roleId` bigint(20) NOT NULL,
--  KEY `FK_io5ssq2ol6uqcx9nll8gfnm4n` (`uid`),
--  KEY `FK_suwqmd7mystg1lwv8o4ffxaag` (`roleId`),
--  CONSTRAINT `FK_io5ssq2ol6uqcx9nll8gfnm4n` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uid`),
--  CONSTRAINT `FK_suwqmd7mystg1lwv8o4ffxaag` FOREIGN KEY (`roleId`) REFERENCES `sys_role` (`id`)
--) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SysUserRole
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES ('1', '2');

-- ----------------------------
-- Table structure for UserInfo
-- ----------------------------
--DROP TABLE IF EXISTS `user_info`;
--CREATE TABLE `user_info` (
--  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
--  `name` varchar(255) DEFAULT NULL,
--  `username` varchar(255) DEFAULT NULL,
--  `password` varchar(255) DEFAULT NULL,
--  `salt` varchar(255) DEFAULT NULL,
--  `state` tinyint(4) NOT NULL,
--  PRIMARY KEY (`uid`),
--  UNIQUE KEY `UK_45fvrme4q2wy85b1vbf55hm6s` (`username`)
--) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of UserInfo
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'manager', 'admin', 'd3c59d25033dbf980d29554025c23a75', '8d78869f470951332959580424d4bf4f', '0');
