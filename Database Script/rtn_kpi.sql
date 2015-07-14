/*
Navicat MySQL Data Transfer

Source Server         : contest
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : rtn_kpi

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2015-06-29 16:29:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kpi
-- ----------------------------
DROP TABLE IF EXISTS `kpi`;
CREATE TABLE `kpi` (
  `kpi_id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NOT NULL,
  `kpi_code` varchar(50) NOT NULL,
  `kpi_name` varchar(255) NOT NULL,
  `perspective_id` int(11) NOT NULL,
  `uom_id` int(11) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_dt` datetime NOT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_dt` datetime NOT NULL,
  PRIMARY KEY (`kpi_id`),
  KEY `uom_kpi_fk` (`uom_id`),
  KEY `organization_kpi_fk` (`organization_id`),
  KEY `perspective_kpi_fk` (`perspective_id`),
  CONSTRAINT `organization_kpi_fk` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `perspective_kpi_fk` FOREIGN KEY (`perspective_id`) REFERENCES `perspective` (`perspective_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `uom_kpi_fk` FOREIGN KEY (`uom_id`) REFERENCES `uom` (`uom_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpi
-- ----------------------------
INSERT INTO `kpi` VALUES ('34', '1', '1111', 'ตัวชี้วัดที่ 2', '19', '15', 'admin', '2015-04-23 11:16:37', 'admin', '2015-04-23 13:29:21');
INSERT INTO `kpi` VALUES ('35', '1', '2222', 'ตัวชี้วัดที่ 1', '17', '14', 'admin', '2015-04-23 11:26:44', 'admin', '2015-04-23 11:26:44');
INSERT INTO `kpi` VALUES ('36', '1', '3333', 'ตัวชี้วัดที่ 3', '19', '15', 'admin', '2015-04-23 11:28:00', 'admin', '2015-04-23 13:29:12');
INSERT INTO `kpi` VALUES ('38', '1', '4444', 'ตัวชี้วัดที่ 4', '17', '14', 'admin', '2015-04-23 11:31:29', 'admin', '2015-04-23 11:31:29');
INSERT INTO `kpi` VALUES ('39', '24', '1112', 'test', '17', '14', 'user01', '2015-04-23 13:48:03', 'user01', '2015-04-23 13:48:03');
INSERT INTO `kpi` VALUES ('40', '24', '1113', 'test2', '17', '14', 'user01', '2015-04-23 13:48:08', 'user01', '2015-04-23 13:48:08');
INSERT INTO `kpi` VALUES ('41', '24', '1114', 'test3', '17', '14', 'user01', '2015-04-23 13:48:16', 'user01', '2015-04-23 13:48:16');
INSERT INTO `kpi` VALUES ('42', '24', '1115', 'test4', '17', '14', 'user01', '2015-04-23 13:51:01', 'user01', '2015-04-23 13:51:01');
INSERT INTO `kpi` VALUES ('43', '24', '1116', 'test5', '17', '14', 'user01', '2015-04-23 13:51:07', 'user01', '2015-04-23 13:51:07');
INSERT INTO `kpi` VALUES ('44', '24', '1117', 'test6', '17', '14', 'user01', '2015-04-23 13:51:12', 'user01', '2015-04-23 13:51:12');
INSERT INTO `kpi` VALUES ('45', '24', '1118', 'test7', '17', '14', 'user01', '2015-04-23 13:51:18', 'user01', '2015-04-23 13:51:18');
INSERT INTO `kpi` VALUES ('46', '24', '1119', 'test8', '17', '14', 'user01', '2015-04-23 13:51:24', 'user01', '2015-04-23 13:51:24');
INSERT INTO `kpi` VALUES ('47', '1', '1004', 'ตัวที่วัดที่ 5', '17', '14', 'admin', '2015-04-29 09:16:14', 'admin', '2015-04-29 09:16:14');
INSERT INTO `kpi` VALUES ('48', '1', '1005', 'ตัวที่วัดที่ 6', '17', '14', 'admin', '2015-04-29 09:16:32', 'admin', '2015-04-29 09:16:32');

-- ----------------------------
-- Table structure for kpi_attached_file
-- ----------------------------
DROP TABLE IF EXISTS `kpi_attached_file`;
CREATE TABLE `kpi_attached_file` (
  `kpi_attached_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `attached_file_name` varchar(255) NOT NULL,
  `kpi_id` int(11) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_dt` datetime NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `updated_dt` datetime NOT NULL,
  PRIMARY KEY (`kpi_attached_file_id`),
  KEY `kpi_kpi_desc_fk` (`kpi_id`),
  CONSTRAINT `kpi_kpi_desc_fk` FOREIGN KEY (`kpi_id`) REFERENCES `kpi` (`kpi_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpi_attached_file
-- ----------------------------
INSERT INTO `kpi_attached_file` VALUES ('18', 'AFET_Setup.exe', '34', 'admin', '2015-04-23 11:25:35', 'admin', '2015-04-23 11:25:35');
INSERT INTO `kpi_attached_file` VALUES ('19', 'catalina.out', '34', 'admin', '2015-04-23 11:25:36', 'admin', '2015-04-23 11:25:36');
INSERT INTO `kpi_attached_file` VALUES ('20', 'Durbell-Database', '35', 'admin', '2015-04-23 11:26:53', 'admin', '2015-04-23 11:26:53');
INSERT INTO `kpi_attached_file` VALUES ('21', 'ZoomIt.zip', '36', 'admin', '2015-04-23 11:28:10', 'admin', '2015-04-23 11:28:10');
INSERT INTO `kpi_attached_file` VALUES ('25', 'java-json.jar', '38', 'admin', '2015-04-23 11:31:38', 'admin', '2015-04-23 11:31:38');

-- ----------------------------
-- Table structure for kpi_baseline
-- ----------------------------
DROP TABLE IF EXISTS `kpi_baseline`;
CREATE TABLE `kpi_baseline` (
  `baseline_id` int(11) NOT NULL AUTO_INCREMENT,
  `kpi_id` int(11) NOT NULL,
  `begin_baseline` decimal(5,2) NOT NULL,
  `end_baseline` decimal(5,2) NOT NULL,
  `actual_score` decimal(5,2) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_dt` datetime NOT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_dt` datetime NOT NULL,
  PRIMARY KEY (`baseline_id`),
  KEY `kpi_kpi_baseline_fk` (`kpi_id`),
  CONSTRAINT `kpi_kpi_baseline_fk` FOREIGN KEY (`kpi_id`) REFERENCES `kpi` (`kpi_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpi_baseline
-- ----------------------------
INSERT INTO `kpi_baseline` VALUES ('1', '34', '0.00', '20.00', '2.00', 'test', 'admin', '2015-04-23 11:17:00', 'admin', '2015-04-23 11:26:25');
INSERT INTO `kpi_baseline` VALUES ('2', '48', '0.00', '20.00', '1.00', '<=20', 'admin', '2015-04-29 09:17:12', 'admin', '2015-04-29 09:17:12');

-- ----------------------------
-- Table structure for kpi_result
-- ----------------------------
DROP TABLE IF EXISTS `kpi_result`;
CREATE TABLE `kpi_result` (
  `kpi_result_id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NOT NULL,
  `period_id` int(11) NOT NULL,
  `kpi_id` int(11) NOT NULL,
  `kpi_order` int(11) NOT NULL,
  `kpi_weight` decimal(5,2) NOT NULL,
  `target_data` varchar(100) NOT NULL,
  `target_score` decimal(5,2) NOT NULL DEFAULT '0.00',
  `actual_data` decimal(15,2) NOT NULL,
  `actual_score` decimal(5,2) NOT NULL DEFAULT '0.00',
  `created_by` varchar(255) DEFAULT NULL,
  `created_dt` datetime NOT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_dt` datetime NOT NULL,
  PRIMARY KEY (`kpi_result_id`),
  KEY `employee_kpi_result_fk` (`organization_id`),
  KEY `kpi_kpi_result_fk` (`kpi_id`),
  KEY `period_kpi_result_fk` (`period_id`),
  CONSTRAINT `employee_kpi_result_fk` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `kpi_kpi_result_fk` FOREIGN KEY (`kpi_id`) REFERENCES `kpi` (`kpi_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `period_kpi_result_fk` FOREIGN KEY (`period_id`) REFERENCES `period` (`period_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpi_result
-- ----------------------------
INSERT INTO `kpi_result` VALUES ('1', '1', '24', '35', '0', '15.00', '10', '0.00', '0.00', '0.00', 'admin', '2015-04-29 09:23:12', 'admin', '2015-04-29 09:23:12');
INSERT INTO `kpi_result` VALUES ('2', '1', '25', '35', '0', '15.00', '10', '0.00', '0.00', '0.00', 'admin', '2015-04-29 09:23:12', 'admin', '2015-04-29 09:23:12');
INSERT INTO `kpi_result` VALUES ('3', '1', '24', '38', '0', '20.00', '15', '0.00', '0.00', '0.00', 'admin', '2015-04-29 09:23:12', 'admin', '2015-04-29 09:23:12');
INSERT INTO `kpi_result` VALUES ('4', '1', '25', '38', '0', '20.00', '15', '0.00', '0.00', '0.00', 'admin', '2015-04-29 09:23:12', 'admin', '2015-04-29 09:23:12');

-- ----------------------------
-- Table structure for kpi_result_attached_file
-- ----------------------------
DROP TABLE IF EXISTS `kpi_result_attached_file`;
CREATE TABLE `kpi_result_attached_file` (
  `kpi_result_attached_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `attached_file_name` varchar(255) NOT NULL,
  `kpi_result_id` int(11) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_dt` datetime NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `updated_dt` datetime NOT NULL,
  PRIMARY KEY (`kpi_result_attached_file_id`),
  KEY `kpi_result_id_fk` (`kpi_result_id`) USING BTREE,
  CONSTRAINT `kpi_result_id` FOREIGN KEY (`kpi_result_id`) REFERENCES `kpi_result` (`kpi_result_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpi_result_attached_file
-- ----------------------------

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `organization_id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_code` varchar(50) NOT NULL,
  `organization_name` varchar(50) NOT NULL,
  `organization_short_name` varchar(50) NOT NULL,
  `organization_status` varchar(25) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_dt` datetime NOT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_dt` datetime NOT NULL,
  PRIMARY KEY (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES ('1', '0501000000', 'สำนักงานเลขานุการกองทัพเรือ', 'สลก.ทร.', 'active', 'admin', '2015-04-03 13:58:01', 'admin', '2015-04-03 16:30:51');
INSERT INTO `organization` VALUES ('2', '0502000000', 'กรมสารบรรณทหารเรือ', 'สบ.ทร.', 'active', 'admin', '2015-04-03 14:00:01', 'admin', '2015-04-03 14:00:01');
INSERT INTO `organization` VALUES ('3', '0503000000', 'กรมกำลังพลทหารเรือ', 'กพ.ทร.', 'active', 'admin', '2015-04-03 14:01:13', 'admin', '2015-04-03 14:01:13');
INSERT INTO `organization` VALUES ('4', '0504000000', 'กรมข่าวทหารเรือ', 'ขว.ทร.', 'active', 'admin', '2015-04-03 14:01:40', 'admin', '2015-04-03 14:01:40');
INSERT INTO `organization` VALUES ('5', '0505000000', 'กรมยุทธการทหารเรือ', 'ยก.ทร.', 'active', 'admin', '2015-04-03 14:02:38', 'admin', '2015-04-03 14:02:38');
INSERT INTO `organization` VALUES ('6', '0506000000', 'กรมส่งกำลังบำรุงทหารเรือ', 'กบ.ทร.', 'active', 'admin', '2015-04-03 14:03:15', 'admin', '2015-04-03 14:03:15');
INSERT INTO `organization` VALUES ('7', '0507000000', 'กรมการสื่อสารและเทคโนโลยีสารสนเทศทหารเรือ', 'สสท.ทร.', 'active', 'admin', '2015-04-03 14:05:12', 'admin', '2015-04-03 14:05:12');
INSERT INTO `organization` VALUES ('8', '0508000000', 'กรมกิจการพลเรื่อนทหารเรือ', 'กพร.ทร.', 'active', 'admin', '2015-04-03 14:06:13', 'admin', '2015-04-03 14:06:36');
INSERT INTO `organization` VALUES ('9', '0509000000', 'สำนักงานปลัดบัญชีทหารเรือ', 'สปช.ทร.', 'active', 'admin', '2015-04-03 14:07:22', 'admin', '2015-04-03 14:07:22');
INSERT INTO `organization` VALUES ('10', '0510000000', 'สำนักงานตรวจสอบภายในทหารเรือ', 'สตน.ทร.', 'active', 'admin', '2015-04-03 14:12:16', 'admin', '2015-04-03 15:20:33');
INSERT INTO `organization` VALUES ('11', '0511000000', 'กรมจเรทหารเรือ', 'จร.ทร.', 'active', 'admin', '2015-04-03 14:12:16', 'admin', '2015-04-03 15:21:05');
INSERT INTO `organization` VALUES ('12', '0512000000', 'กองเรือยุทธการ', 'กร.', 'active', 'admin', '2015-04-03 14:15:45', 'admin', '2015-04-03 15:22:56');
INSERT INTO `organization` VALUES ('13', '0514000000', 'หน่วยบัญชาการนาวิกโยธิน', 'นย.', 'active', 'admin', '2015-04-03 14:17:15', 'admin', '2015-04-03 15:24:14');
INSERT INTO `organization` VALUES ('14', '0515000000', 'หน่วยบัญชาการต่อสู้อากาศยานและรักษาฝั่ง', 'สอ.รฝ.', 'active', 'admin', '2015-04-03 14:18:42', 'admin', '2015-04-03 15:25:06');
INSERT INTO `organization` VALUES ('15', '0516000000', 'ฐานทัพเรือสัตหีบ', 'ฐท.สส.', 'active', 'admin', '2015-04-03 14:21:38', 'admin', '2015-04-03 15:25:22');
INSERT INTO `organization` VALUES ('16', '0517000000', 'ฐานทัพเรือกรุงเทพ', 'ฐท.กท.', 'active', 'admin', '2015-04-03 14:25:00', 'admin', '2015-04-03 15:25:35');
INSERT INTO `organization` VALUES ('17', '0520000000', 'กรมสารวัตรทหารเรือ', 'กรม สห.ทร.', 'active', 'admin', '2015-04-03 14:43:00', 'admin', '2015-04-03 15:25:52');
INSERT INTO `organization` VALUES ('18', '0521000000', 'กรมอู่ทหารเรือ', 'อร.', 'active', 'admin', '2015-04-03 14:43:25', 'admin', '2015-04-03 15:26:09');
INSERT INTO `organization` VALUES ('19', '0522000000', 'กรมอิเล็กทรอนิกส์ทหารเรือ', 'อล.ทร.', 'active', 'admin', '2015-04-03 14:44:00', 'admin', '2015-04-03 15:26:25');
INSERT INTO `organization` VALUES ('20', '0523000000', 'กรมช่างโยธาทหารเรือ', 'ชย.ทร.', 'active', 'admin', '2015-04-03 14:44:29', 'admin', '2015-04-03 15:26:39');
INSERT INTO `organization` VALUES ('21', '0524000000', 'กรมสรรพาวุธทหารเรือ', 'สพ.ทร.', 'active', 'admin', '2015-04-03 14:45:18', 'admin', '2015-04-03 15:45:10');
INSERT INTO `organization` VALUES ('22', '0525000000', 'กรมพลาธิการทหารเรือ', 'พธ.ทร.', 'active', 'admin', '2015-04-03 14:45:43', 'admin', '2015-04-03 15:49:46');
INSERT INTO `organization` VALUES ('23', '0526000000', 'กรมแพทย์ทหารเรือ', 'พร.', 'active', 'admin', '2015-04-03 14:46:04', 'admin', '2015-04-03 15:49:05');
INSERT INTO `organization` VALUES ('24', '0527000000', 'กรมการเงินทหารเรือ', 'กง.ทร.', 'active', 'admin', '2015-04-03 14:46:22', 'admin', '2015-04-03 15:49:59');
INSERT INTO `organization` VALUES ('25', '0528000000', 'กรมการขนส่งทหารเรือ', 'ขส.ทร.', 'active', 'admin', '2015-04-03 14:48:11', 'admin', '2015-04-03 15:50:14');
INSERT INTO `organization` VALUES ('26', '0529000000', 'กรมอุทกศาสตร์', 'อศ.', 'active', 'admin', '2015-04-03 14:48:39', 'admin', '2015-04-03 15:50:25');
INSERT INTO `organization` VALUES ('27', '0530000000', 'กรมสวัสดิการทหารเรือ', 'สก.ทร.', 'active', 'admin', '2015-04-03 14:49:03', 'admin', '2015-04-03 15:50:43');
INSERT INTO `organization` VALUES ('28', '0531000000', 'กรมวิทยาศาสตร์ทหารเรือ', 'วศ.ทร.', 'active', 'admin', '2015-04-03 14:52:23', 'admin', '2015-04-03 15:50:57');
INSERT INTO `organization` VALUES ('29', '0532000000', 'สำนักงานวิจัยและพัฒนาการทางทหารกองทัพเรือ', 'สวพ.ทร.', 'active', 'admin', '2015-04-03 14:53:44', 'admin', '2015-04-03 15:51:32');
INSERT INTO `organization` VALUES ('30', '0534000000', 'กรมยุทธศึกษาทหารเรือ', 'ยศ.ทร.', 'active', 'admin', '2015-04-03 14:55:08', 'admin', '2015-04-03 15:51:48');
INSERT INTO `organization` VALUES ('31', '0535000000', 'โรงเรียนนายเรือ', 'รร.นร.', 'active', 'admin', '2015-04-03 14:57:09', 'admin', '2015-04-03 15:52:27');
INSERT INTO `organization` VALUES ('34', '0536000000', 'ศูนย์ปฎิบัติการกองทัพเรือ', 'ศปก.ทร.', 'active', 'admin', '2015-04-03 15:01:49', 'admin', '2015-04-03 15:53:20');
INSERT INTO `organization` VALUES ('35', '0537000000', 'กองบัญชาการป้องกันชายแดนจันทบุรีและตราด', 'กปช.จต.', 'active', 'admin', '2015-04-03 15:02:50', 'admin', '2015-04-03 15:53:32');
INSERT INTO `organization` VALUES ('36', '0540000000', 'หน่วยเรือรักษาความสงบเรียบร้อยตามลำแม่น้ำโขง', 'นรข.', 'active', 'admin', '2015-04-03 15:03:50', 'admin', '2015-04-03 15:53:47');
INSERT INTO `organization` VALUES ('37', '0551000000', 'สำนักงานจัดหายุทโธปกรณ์ทหารเรือ', 'สยป.ทร.', 'active', 'admin', '2015-04-03 15:05:02', 'admin', '2015-04-03 15:54:04');
INSERT INTO `organization` VALUES ('38', '0552000000', 'สำนักงานพระธรรมนูญทหารเรือ', 'สธน.ทร.', 'active', 'admin', '2015-04-03 15:05:55', 'admin', '2015-04-03 15:56:30');
INSERT INTO `organization` VALUES ('39', '0553000000', 'ทัพเรือภาคที่ ๑', 'ทรภ.๑', 'active', 'admin', '2015-04-03 15:06:28', 'admin', '2015-04-03 15:56:41');
INSERT INTO `organization` VALUES ('40', '0554000000', 'ทัพเรือภาคที่ ๒', 'ทรภ.๒', 'active', 'admin', '2015-04-03 15:06:54', 'admin', '2015-04-03 15:56:57');
INSERT INTO `organization` VALUES ('41', '0555000000', 'ทัพเรือภาคที่ ๓', 'ทรภ.๓', 'active', 'admin', '2015-04-03 15:07:18', 'admin', '2015-04-03 15:57:08');

-- ----------------------------
-- Table structure for period
-- ----------------------------
DROP TABLE IF EXISTS `period`;
CREATE TABLE `period` (
  `period_id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `period_no` int(11) NOT NULL,
  `period_desc` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_dt` datetime NOT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_dt` datetime NOT NULL,
  PRIMARY KEY (`period_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of period
-- ----------------------------
INSERT INTO `period` VALUES ('20', '2014', '1', 'รอบที่ 1 ปี 2557', '2015-01-01', '2015-03-31', 'admin', '2015-04-23 11:36:46', 'admin', '2015-04-23 11:39:52');
INSERT INTO `period` VALUES ('21', '2014', '2', 'รอบที่ 2 ปี 2557', '2015-04-01', '2015-06-30', 'admin', '2015-04-23 11:37:16', 'admin', '2015-04-23 11:40:05');
INSERT INTO `period` VALUES ('22', '2014', '3', 'รอบที่ 3 ปี 2557', '2015-07-01', '2015-09-30', 'admin', '2015-04-23 11:38:04', 'admin', '2015-04-23 11:39:46');
INSERT INTO `period` VALUES ('23', '2014', '4', 'รอบที่ 3 ปี 2557', '2015-10-01', '2015-12-31', 'admin', '2015-04-23 11:39:38', 'admin', '2015-04-23 11:39:38');
INSERT INTO `period` VALUES ('24', '2015', '1', 'รอบที่ 1 ปี 2558', '2015-01-01', '2015-06-30', 'admin', '2015-04-23 11:43:28', 'admin', '2015-04-23 11:43:28');
INSERT INTO `period` VALUES ('25', '2015', '2', 'รอบที่ 2 ปี 2558', '2015-07-01', '2015-12-31', 'admin', '2015-04-23 11:44:15', 'admin', '2015-04-23 11:44:15');

-- ----------------------------
-- Table structure for period_tmp
-- ----------------------------
DROP TABLE IF EXISTS `period_tmp`;
CREATE TABLE `period_tmp` (
  `period_id` int(11) NOT NULL,
  `year` year(4) NOT NULL,
  PRIMARY KEY (`period_id`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of period_tmp
-- ----------------------------
INSERT INTO `period_tmp` VALUES ('16', '2015');

-- ----------------------------
-- Table structure for perspective
-- ----------------------------
DROP TABLE IF EXISTS `perspective`;
CREATE TABLE `perspective` (
  `perspective_id` int(11) NOT NULL AUTO_INCREMENT,
  `perspective_name` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_dt` datetime NOT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_dt` datetime NOT NULL,
  PRIMARY KEY (`perspective_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of perspective
-- ----------------------------
INSERT INTO `perspective` VALUES ('17', 'ความพร้อมกองทัพเรือ', 'admin', '2015-04-23 11:11:55', 'admin', '2015-04-29 09:03:02');
INSERT INTO `perspective` VALUES ('19', 'การประเมินประสิทธิผล', 'admin', '2015-04-23 11:12:25', 'admin', '2015-04-29 09:06:08');

-- ----------------------------
-- Table structure for sys_conf
-- ----------------------------
DROP TABLE IF EXISTS `sys_conf`;
CREATE TABLE `sys_conf` (
  `param_name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_conf
-- ----------------------------

-- ----------------------------
-- Table structure for threshold
-- ----------------------------
DROP TABLE IF EXISTS `threshold`;
CREATE TABLE `threshold` (
  `threshold_id` int(11) NOT NULL AUTO_INCREMENT,
  `threshold_name` varchar(255) NOT NULL,
  `begin_threshold` decimal(5,2) NOT NULL,
  `end_threshold` decimal(5,2) NOT NULL,
  `color_code` varchar(9) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_dt` datetime NOT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_dt` datetime NOT NULL,
  PRIMARY KEY (`threshold_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of threshold
-- ----------------------------
INSERT INTO `threshold` VALUES ('1', 'พอใช้', '0.00', '1.00', 'FA0A0A', 'admin', '2015-04-29 13:29:21', 'admin', '2015-04-29 13:29:21');
INSERT INTO `threshold` VALUES ('2', 'ดี', '1.01', '2.00', '00FF7B', 'admin', '2015-04-29 13:30:00', 'admin', '2015-04-29 13:30:00');
INSERT INTO `threshold` VALUES ('3', 'ดีมาก', '2.01', '3.00', '3F9E23', 'admin', '2015-04-29 13:30:24', 'admin', '2015-04-29 13:30:24');

-- ----------------------------
-- Table structure for uom
-- ----------------------------
DROP TABLE IF EXISTS `uom`;
CREATE TABLE `uom` (
  `uom_id` int(11) NOT NULL AUTO_INCREMENT,
  `uom_name` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_dt` datetime NOT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_dt` datetime NOT NULL,
  PRIMARY KEY (`uom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uom
-- ----------------------------
INSERT INTO `uom` VALUES ('14', 'เปอร์เซ็น', 'admin', '2015-04-23 11:10:55', 'admin', '2015-04-23 11:10:55');
INSERT INTO `uom` VALUES ('15', 'ร้อยละ', 'admin', '2015-04-23 11:11:15', 'admin', '2015-04-23 11:11:15');

-- ----------------------------
-- Procedure structure for getOrgByRole
-- ----------------------------
DROP PROCEDURE IF EXISTS `getOrgByRole`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getOrgByRole`(paramRole varchar(100))
BEGIN
	set @qryStr = concat(
		'SELECT
			organization_code,
			CONCAT(organization_short_name) AS organization_name
		FROM rtn_kpi.organization
		where organization_code in(',paramRole,')'
	);
	prepare exeStr from @qryStr;
	execute exeStr;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_add_kpi_all_period
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_add_kpi_all_period`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_add_kpi_all_period`(IN v_yearName INT, IN v_org_id INT, IN v_kpi_id INT, v_kpi_weight DECIMAL(5,0), IN v_target_data DECIMAL(5,0), IN v_created_by VARCHAR(255), IN v_updated_by VARCHAR(255))
BEGIN
	DECLARE done								INT DEFAULT 0;
	DECLARE v_period_id					INT;
	DECLARE v_kpi_result_id			INT;
	DECLARE AssignKPI CURSOR FOR	SELECT period_id FROM rtn_kpi.period WHERE `year` = v_yearName;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

	OPEN AssignKPI;
	SET done = 0;
		loop_AssignKPI : LOOP 

			FETCH AssignKPI	INTO v_period_id;
			IF done THEN
				LEAVE loop_AssignKPI; 				
			END IF;

			IF NOT EXISTS(SELECT 1 FROM rtn_kpi.kpi_result WHERE organization_id = v_org_id AND period_id = v_period_id AND kpi_id = v_kpi_id) THEN
						INSERT INTO rtn_kpi.kpi_result (organization_id, period_id, kpi_id, kpi_order, kpi_weight,
							target_data, target_score, actual_data, actual_score, created_dt, updated_dt, created_by, updated_by)
						VALUES(v_org_id, v_period_id, v_kpi_id, 0, v_kpi_weight, v_target_data,0 ,0, 0, NOW(), NOW(), v_created_by, v_updated_by);
			ELSE
					UPDATE rtn_kpi.kpi_result SET 
						kpi_weight = v_kpi_weight, target_data = v_target_data, updated_dt = NOW(), updated_by = v_updated_by
					WHERE organization_id = v_org_id AND period_id = v_period_id AND kpi_id = v_kpi_id;
			END IF;

		END LOOP loop_AssignKPI;
	CLOSE AssignKPI;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_assign
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_assign`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_assign`(IN v_yearName INT, IN v_org_id INT, IN v_kpi_id INT, v_kpi_weight DECIMAL(5,2), IN v_target_data DECIMAL(5,2), IN v_created_by VARCHAR(255), IN v_updated_by VARCHAR(255))
BEGIN
	DECLARE done								INT DEFAULT 0;
	DECLARE v_period_id					INT;
	DECLARE v_kpi_result_id			INT;
	DECLARE AssignKPI CURSOR FOR	SELECT period_id FROM rtn_kpi.period WHERE `year` = v_yearName;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

	OPEN AssignKPI;
	SET done = 0;
		loop_AssignKPI : LOOP 

			FETCH AssignKPI	INTO v_period_id;
			IF done THEN
				LEAVE loop_AssignKPI; 				
			END IF;

			IF NOT EXISTS(SELECT 1 FROM rtn_kpi.kpi_result WHERE organization_id = v_org_id AND period_id = v_period_id AND kpi_id = v_kpi_id) THEN
						INSERT INTO rtn_kpi.kpi_result (organization_id, period_id, kpi_id, kpi_order, kpi_weight,
							target_data, target_score, actual_data, actual_score, created_dt, updated_dt, created_by, updated_by)
						VALUES(v_org_id, v_period_id, v_kpi_id, 0, v_kpi_weight, v_target_data,0 ,0, 0, NOW(), NOW(), v_created_by, v_updated_by);
			ELSE
					UPDATE rtn_kpi.kpi_result SET 
						kpi_weight = v_kpi_weight, target_data = v_target_data, updated_dt = NOW(), updated_by = v_updated_by
					WHERE organization_id = v_org_id AND period_id = v_period_id AND kpi_id = v_kpi_id;
			END IF;

		END LOOP loop_AssignKPI;
	CLOSE AssignKPI;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_delete_kpi_all_period
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_delete_kpi_all_period`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_delete_kpi_all_period`(IN v_yearName INT, IN v_org_id INT, IN v_kpi_id INT, v_kpi_weight DECIMAL(5,0), IN v_target_data DECIMAL(5,0))
BEGIN
	DECLARE done								INT DEFAULT 0;
	DECLARE v_period_id					INT;
	DECLARE v_kpi_result_id			INT;
	DECLARE AssignKPI CURSOR FOR	SELECT period_id FROM rtn_kpi.period WHERE `year` = v_yearName;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

	OPEN AssignKPI;
	SET done = 0;
		loop_AssignKPI : LOOP 

			FETCH AssignKPI	INTO v_period_id;
			IF done THEN
				LEAVE loop_AssignKPI; 				
			END IF;

			DELETE FROM rtn_kpi.kpi_result WHERE organization_id = v_org_id AND period_id = v_period_id AND kpi_id = v_kpi_id AND 
			kpi_weight = v_kpi_weight AND target_data = v_target_data;

		END LOOP loop_AssignKPI;
	CLOSE AssignKPI;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_test
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_test`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_test`(IN v_yearName INT)
BEGIN
	DECLARE done								INT DEFAULT 0;
	DECLARE done_2								INT DEFAULT 0;
	DECLARE v_period_id					INT;
	DECLARE v_kpi_r			INT; DECLARE v_kpi INT;
	DECLARE AssignKPI CURSOR FOR	SELECT period_id FROM period WHERE `year` = v_yearName;
	DECLARE pp CURSOR FOR	 SELECT period_id, `year` FROM period_tmp;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1,done_2 = 1;
	#DECLARE CONTINUE HANDLER FOR NOT FOUND SET ;

	OPEN AssignKPI;
	SET done = 0;

TRUNCATE TABLE period_tmp;
		loop_AssignKPI : LOOP 

			FETCH AssignKPI	INTO v_period_id;
			IF done THEN
				LEAVE loop_AssignKPI; 				
			END IF;
				#SELECT period_id, `year` #INTO v_kpi_r, v_kpi FROM period_tmp;
		#IF v_kpi_r IS NULL THEN
				INSERT INTO period_tmp VALUES (v_period_id, v_yearName);
		#ELSE UPDATE period_tmp SET `year` = v_yearName WHERE period_id = v_period_id;
		#END IF;

		END LOOP loop_AssignKPI;
	CLOSE AssignKPI;

END
;;
DELIMITER ;
