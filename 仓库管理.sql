/*
Navicat MySQL Data Transfer

Source Server         : bookmanager
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : 仓库管理

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2020-06-27 23:43:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for buy_history
-- ----------------------------
DROP TABLE IF EXISTS `buy_history`;
CREATE TABLE `buy_history` (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `item` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `count` int(11) NOT NULL,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `store` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pay` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of buy_history
-- ----------------------------
INSERT INTO `buy_history` VALUES ('sam', 'a', '12', '2019-12-25 09:24:34', 'store1', '192');
INSERT INTO `buy_history` VALUES ('asdf', '八宝粥', '11', '2019-12-26 11:02:40', 'store4', '88');
INSERT INTO `buy_history` VALUES ('user1', '农夫山泉', '100', '2019-12-26 15:42:32', 'store4', '200');
INSERT INTO `buy_history` VALUES ('sam', '花露水', '100', '2019-12-26 16:09:52', 'store2', '15600');
INSERT INTO `buy_history` VALUES ('sam', '花露水', '50', '2019-12-26 16:09:52', 'store3', '7800');
INSERT INTO `buy_history` VALUES ('sam', '巧克力', '12', '2019-12-26 16:42:39', 'store3', '720');
INSERT INTO `buy_history` VALUES ('sam', '瓜子', '12', '2019-12-26 16:44:24', 'store3', '192');
INSERT INTO `buy_history` VALUES ('user1', '地瓜干', '12', '2019-12-26 17:02:43', 'store1', '84');
INSERT INTO `buy_history` VALUES ('tom', '地瓜干', '12', '2020-06-23 11:19:49', 'store1', '1056');
INSERT INTO `buy_history` VALUES ('tom', '巧克力', '12', '2020-06-23 11:20:01', 'store2', '720');
INSERT INTO `buy_history` VALUES ('tom1', '地瓜干', '12', '2020-06-24 17:18:35', 'store1', '1056');

-- ----------------------------
-- Table structure for price
-- ----------------------------
DROP TABLE IF EXISTS `price`;
CREATE TABLE `price` (
  `item` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `baseprice` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemId` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `outprice` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of price
-- ----------------------------
INSERT INTO `price` VALUES ('地瓜干', '10', '1018', '88', 'diguagan');
INSERT INTO `price` VALUES ('巧克力', '55', '1016', '60', 'qiaokeli');
INSERT INTO `price` VALUES ('开心果', '40', '1012', '45', 'kaixinguo');
INSERT INTO `price` VALUES ('汉堡', '18', '1004', '44', 'hanbao');
INSERT INTO `price` VALUES ('瓜子', '15', '1010', '16', 'guazi');
INSERT INTO `price` VALUES ('腰果', '47', '1013', '50', 'yaoguo');
INSERT INTO `price` VALUES ('蛋糕', '10', '1007', '12', 'dangao');
INSERT INTO `price` VALUES ('锅巴', '5', '1017', '44', 'guoba');

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `storeName` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemId` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `storeManager` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('store1', '汉堡', '30', '1004', 'manager1');
INSERT INTO `store` VALUES ('store1', '花生', '100', '1001', 'manager1');
INSERT INTO `store` VALUES ('store1', '瓜子', '100', '1010', 'manager1');
INSERT INTO `store` VALUES ('store1', '腰果', '50', '1013', 'manager1');
INSERT INTO `store` VALUES ('store1', '地瓜干', '45', '1018', 'manager1');
INSERT INTO `store` VALUES ('store3', '瓜子', '100', '1002', 'manager2');
INSERT INTO `store` VALUES ('tore2', '牙膏', '123', '1111', 'manager1');
INSERT INTO `store` VALUES ('store3', '开心果', '112', '1012', 'manager2');
INSERT INTO `store` VALUES ('store4', null, null, null, 'manager1');

-- ----------------------------
-- Table structure for storemanager
-- ----------------------------
DROP TABLE IF EXISTS `storemanager`;
CREATE TABLE `storemanager` (
  `storeName` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `managerName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`storeName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of storemanager
-- ----------------------------
INSERT INTO `storemanager` VALUES ('store1', 'manager1');
INSERT INTO `storemanager` VALUES ('store2', 'manager1');
INSERT INTO `storemanager` VALUES ('store3', 'manager2');
INSERT INTO `storemanager` VALUES ('store4', 'manager2');

-- ----------------------------
-- Table structure for tradelog
-- ----------------------------
DROP TABLE IF EXISTS `tradelog`;
CREATE TABLE `tradelog` (
  `serial` int(20) NOT NULL AUTO_INCREMENT,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trade` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`serial`)
) ENGINE=InnoDB AUTO_INCREMENT=12311 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tradelog
-- ----------------------------
INSERT INTO `tradelog` VALUES ('12306', 'user1', '100', '2019-12-22');
INSERT INTO `tradelog` VALUES ('12307', 'user2', '200', '2019-12-22');
INSERT INTO `tradelog` VALUES ('12308', 'user3', '150', '2019-12-22');
INSERT INTO `tradelog` VALUES ('12309', 'user2', '509', '2019-12-22');
INSERT INTO `tradelog` VALUES ('12310', 'user1', '1000', '2019-12-22');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `power` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `money` float NOT NULL DEFAULT '100000',
  `in_money` float NOT NULL DEFAULT '0',
  `true_in_money` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('aad', '123456', '3', '100000', '0', '0');
INSERT INTO `user` VALUES ('asg', '123456', '3', '100000', '0', '0');
INSERT INTO `user` VALUES ('manager1', '123456', '2', '127192', '45159', '24372');
INSERT INTO `user` VALUES ('manager2', '123456', '2', '615113', '22344', '12447');
INSERT INTO `user` VALUES ('qwe', '1234', '3', '99400', '0', '99364');
INSERT INTO `user` VALUES ('qwer', '123456', '3', '323564', '0', '0');
INSERT INTO `user` VALUES ('qwert', '123456', '3', '1241420', '0', '0');
INSERT INTO `user` VALUES ('root', '123456', '1', '2211020', '0', '0');
INSERT INTO `user` VALUES ('sam', '12344', '3', '108330', '0', '108510');
INSERT INTO `user` VALUES ('tom', '111111', '3', '96448', '0', '96052');
INSERT INTO `user` VALUES ('tom1', '111111', '3', '97888', '0', '98008');
INSERT INTO `user` VALUES ('tom22', '111111', '3', '99472', '0', '99160');
INSERT INTO `user` VALUES ('tt', '1234', '3', '99904', '0', '99880');
INSERT INTO `user` VALUES ('user1', '1234', '3', '130108', '0', '129172');
INSERT INTO `user` VALUES ('user2', '123456', '3', '1234420', '0', '0');
INSERT INTO `user` VALUES ('user3', '123456', '3', '23114.2', '0', '0');
