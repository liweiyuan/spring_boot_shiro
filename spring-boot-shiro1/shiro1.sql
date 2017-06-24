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
-- Records of SysPermission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '1', 'user_manage', '0', '0/', 'userInfo:view', 'menu', 'userInfo/userList');
INSERT INTO `sys_permission` VALUES ('2', '1', 'user_add', '1', '0/1', 'userInfo:add', 'button', 'userInfo/userAdd');
INSERT INTO `sys_permission` VALUES ('3', '1', 'user_delete', '1', '0/1', 'userInfo:del', 'button', 'userInfo/userDel');


-- ----------------------------
-- Records of SysRole
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '1', 'manager', 'admin');
INSERT INTO `sys_role` VALUES ('2', '1', 'vip', 'vip');



-- ----------------------------
-- Records of SysRolePermission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '1');
INSERT INTO `sys_role_permission` VALUES ('1', '2');



-- ----------------------------
-- Records of SysUserRole
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES ('1', '2');



-- ----------------------------
-- Records of UserInfo
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'manager', 'admin', 'd3c59d25033dbf980d29554025c23a75', '8d78869f470951332959580424d4bf4f', '0');
