/*
Navicat MySQL Data Transfer

Source Server         : wwq
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : market

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2020-04-03 10:27:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `importbill`
-- ----------------------------
DROP TABLE IF EXISTS `importbill`;
CREATE TABLE `importbill` (
  `imortBillID` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '进货单号',
  `merchID` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品编号',
  `profferID` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供货商号',
  `importPrice` double(10,2) NOT NULL COMMENT '进货价',
  `quantity` int(4) NOT NULL COMMENT '数量',
  `totalMoney` double(10,2) NOT NULL COMMENT '金额',
  `importDate` datetime(6) NOT NULL COMMENT '进货日期',
  `other` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '备注',
  PRIMARY KEY (`imortBillID`),
  KEY `merchID` (`merchID`),
  KEY `profferID` (`profferID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of importbill
-- ----------------------------
INSERT INTO `importbill` VALUES ('4001', '3006', '2005', '12.00', '23', '276.00', '2020-04-02 00:00:00.000000', '');

-- ----------------------------
-- Table structure for `merchbill`
-- ----------------------------
DROP TABLE IF EXISTS `merchbill`;
CREATE TABLE `merchbill` (
  `merchID` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品编号',
  `profferID` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供货商号',
  `fullName` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `kind` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类别',
  `birthPlace` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产地',
  `unitCost` double(10,2) NOT NULL COMMENT '单价',
  `other` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '备注',
  PRIMARY KEY (`merchID`),
  KEY `profferID` (`profferID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of merchbill
-- ----------------------------
INSERT INTO `merchbill` VALUES ('3001', '2001', '是的', '蔬菜类', 's\'d', '23.00', '');
INSERT INTO `merchbill` VALUES ('3002', '2002', '大白猪', '生物类', '北京', '20.00', '一般');
INSERT INTO `merchbill` VALUES ('3003', '2004', '四粮酒', '酒类', '福建', '15.00', '好喝');
INSERT INTO `merchbill` VALUES ('3004', '2006', '小麦', '杂粮类', '黑龙江', '15.00', '很好吃');
INSERT INTO `merchbill` VALUES ('3005', '2001', '面条', '零食类', '上海', '23.00', '很好吃');
INSERT INTO `merchbill` VALUES ('3006', '2005', '苹果', '水果类', '天津', '34.00', '鲜嫩可口');
INSERT INTO `merchbill` VALUES ('3007', '2002', '牛肉', '生物类', '上海', '50.00', '很有爵劲');
INSERT INTO `merchbill` VALUES ('3008', '2007', '手机', '其它类', '上海', '1320.00', '很好用');
INSERT INTO `merchbill` VALUES ('3009', '2005', '萝卜', '蔬菜类', '北京', '23.00', '红红的');
INSERT INTO `merchbill` VALUES ('3010', '2001', '黑米', '杂粮类', '非洲', '23.00', '');
INSERT INTO `merchbill` VALUES ('3011', '2001', '红薯', '杂粮类', '美国', '32.00', '');
INSERT INTO `merchbill` VALUES ('3012', '2001', '香蕉', '水果类', '广东', '23.00', '');

-- ----------------------------
-- Table structure for `profferbill`
-- ----------------------------
DROP TABLE IF EXISTS `profferbill`;
CREATE TABLE `profferbill` (
  `profferID` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供货商号',
  `fullName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `contactPerson` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系地址',
  `openingBank` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '开户行',
  `accountID` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '银行账号',
  `other` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '备注',
  PRIMARY KEY (`profferID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of profferbill
-- ----------------------------
INSERT INTO `profferbill` VALUES ('2001', '四谷有限公司', '张三', '13101058334', '湖南', '建设', '234', '蔬菜');
INSERT INTO `profferbill` VALUES ('2002', '五谷有限公司', '李四', '13101058333', '上海', '工商', '32', '玉米');
INSERT INTO `profferbill` VALUES ('2003', '三谷有限公司', '王五', '13101058334', '重庆奉节', '工商', '132', '五粮液');
INSERT INTO `profferbill` VALUES ('2004', '二谷有限公司', '王五', '13101058335', '重庆奉节', '工商', '132', '四粮液');
INSERT INTO `profferbill` VALUES ('2005', '二粮液', '张三', '12345678943', '北京', '建设', '234', '烈酒');
INSERT INTO `profferbill` VALUES ('2006', '三谷', '李四', '12345678945', '湖南', '工商', '1322', '小麦');
INSERT INTO `profferbill` VALUES ('2007', '华为', '任正非', '12345678945', '上海', '建设', '123', '手机');

-- ----------------------------
-- Table structure for `salebill`
-- ----------------------------
DROP TABLE IF EXISTS `salebill`;
CREATE TABLE `salebill` (
  `saleBillID` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '销售单号',
  `merchID` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品编号',
  `saleNum` int(4) NOT NULL COMMENT '销售数量',
  `saleDate` datetime(6) NOT NULL COMMENT '销售日期',
  PRIMARY KEY (`saleBillID`),
  KEY `merchID` (`merchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salebill
-- ----------------------------
INSERT INTO `salebill` VALUES ('5001', '3002', '15', '2020-03-26 20:36:41.000000');
INSERT INTO `salebill` VALUES ('5002', '3003', '25', '2020-03-29 00:00:00.000000');
INSERT INTO `salebill` VALUES ('5003', '3004', '18', '2020-03-30 00:00:00.000000');
INSERT INTO `salebill` VALUES ('5004', '3002', '32', '2020-03-30 00:00:00.000000');
INSERT INTO `salebill` VALUES ('5005', '3008', '20', '2020-04-01 00:00:00.000000');

-- ----------------------------
-- Table structure for `staffbill`
-- ----------------------------
DROP TABLE IF EXISTS `staffbill`;
CREATE TABLE `staffbill` (
  `staffID` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工编号',
  `name` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `sex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `diploma` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学历',
  `salary` int(14) DEFAULT NULL COMMENT '工资',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系电话',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系地址',
  `idCard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号',
  `beginDate` datetime(6) DEFAULT NULL COMMENT '聘用日期',
  `other` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '备注',
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staffbill
-- ----------------------------
INSERT INTO `staffbill` VALUES ('0001', 'wwq', '男', '本科', '1800', '13101058335', '重庆奉节', '500238125605082658', '2020-03-16 16:00:00.000000', '刻苦努力');
INSERT INTO `staffbill` VALUES ('0002', 'wwe', '女', '大专', '1800', '13101058335', '重庆奉节', '500238125605082658', '2020-03-25 16:00:00.000000', '刻苦努力');
INSERT INTO `staffbill` VALUES ('0003', 'wwe', '男', '大专', '122', '13101058333', '重庆奉节', '500238125605082652', '2020-03-24 16:00:00.000000', '刻苦努力');
INSERT INTO `staffbill` VALUES ('0004', 'wwe', '女', '大专', '1800', '13101058335', '重庆奉节', '500238125605082658', '2020-03-16 16:00:00.000000', '刻苦努力');
INSERT INTO `staffbill` VALUES ('0005', 'wwe', '女', '大专', '1800', '13101058335', '重庆奉节', '500238125605082658', '2020-03-27 16:00:00.000000', '刻苦努力');
INSERT INTO `staffbill` VALUES ('0006', 'wwe', '男', '大专', '1800', '13101058335', '重庆奉节', '500238125605082658', '2020-03-25 16:00:00.000000', '刻苦努力');
INSERT INTO `staffbill` VALUES ('0007', 'wwe', '男', '大专', '1800', '13101058335', '重庆奉节', '500238125605082658', '2020-03-25 16:00:00.000000', '刻苦努力');
INSERT INTO `staffbill` VALUES ('0008', 'wwe', '男', '大专', '18002', '13101058335', '重庆奉节', '500238125605082658', '2020-03-25 16:00:00.000000', '刻苦努力');
INSERT INTO `staffbill` VALUES ('0009', 'wwe', '女', '大专', '1800', '13101058335', '重庆奉节', '500238125605082658', '2020-03-25 15:13:47.000000', '刻苦努力');
INSERT INTO `staffbill` VALUES ('0010', 'wwe', '女', '大专', '1800', '13101058335', '重庆奉节', '500238125605082658', '2020-03-25 15:13:47.000000', '刻苦努力');
INSERT INTO `staffbill` VALUES ('0011', 'wwe', '女', '大专', '1800', '13101058335', '重庆奉节', '500238125605082658', '2020-03-25 15:13:47.000000', '刻苦努力');
INSERT INTO `staffbill` VALUES ('0012', 'wwe', '男', '大专', '1800', '13101058335', '重庆奉节', '500238125605082658', '2020-03-25 16:00:00.000000', '刻苦努力');
INSERT INTO `staffbill` VALUES ('0013', 'wewe', '男', '博士', '1202', '12312312312', '重庆', '32132123213213', '2020-03-03 00:14:26.000000', '奋斗');
INSERT INTO `staffbill` VALUES ('0014', '张三', '女', '本科', '1200', '123231', '北京', '1321456', '2020-05-02 00:00:00.000000', '很厉害');
INSERT INTO `staffbill` VALUES ('0015', 'wwe', '女', '大专', '1800', '13101058335', '重庆奉节', '500236199702010577', '2020-03-09 16:00:00.000000', '刻苦努力');
INSERT INTO `staffbill` VALUES ('0016', 'wwe', '男', '大专', '1800', '13101058335', '重庆奉节', '500236199702010577', '2020-03-05 16:00:00.000000', '刻苦努力');
INSERT INTO `staffbill` VALUES ('0017', 'wwe', '女', '大专', '1800', '13101058335', '重庆奉节', '500236199702010577', '2020-03-04 16:00:00.000000', '刻苦努力');
INSERT INTO `staffbill` VALUES ('0018', '王五', '男', '大专', '32', '12312312312', '是', '123123123123123123', '2020-03-24 16:00:00.000000', '士大夫');

-- ----------------------------
-- Table structure for `storebill`
-- ----------------------------
DROP TABLE IF EXISTS `storebill`;
CREATE TABLE `storebill` (
  `merchID` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品编号',
  `storeNum` int(4) NOT NULL COMMENT '库存数量',
  PRIMARY KEY (`merchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storebill
-- ----------------------------
INSERT INTO `storebill` VALUES ('3003', '2339');
INSERT INTO `storebill` VALUES ('3006', '23');
INSERT INTO `storebill` VALUES ('3008', '294');

-- ----------------------------
-- Table structure for `userbill`
-- ----------------------------
DROP TABLE IF EXISTS `userbill`;
CREATE TABLE `userbill` (
  `loginID` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `passWord` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  PRIMARY KEY (`loginID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userbill
-- ----------------------------
INSERT INTO `userbill` VALUES ('1001', '123789');
