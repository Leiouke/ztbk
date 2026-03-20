/*
Navicat MySQL Data Transfer

Source Server         : mysql_localhost
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : minxue

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2015-04-14 18:29:19
*/

/*  增加了1个超级管理员, 用户名wkh 默认密码wkh  */
set identity_insert it_system_user ON  --打开

-- ----------------------------
-- Records of ld_system_user
-- ----------------------------
INSERT INTO it_system_user(id, account, password, job_no, status, registerDate, isManager) VALUES ('1', 'wkh', '9a2fe9b2330aad7b8cefcb5ed1f3d757c40f97d5','wkh', '0', '2019-01-16 10:23:00', 1);

set identity_insert it_system_user OFF  --关闭