/*
 Navicat Premium Data Transfer

 Source Server         : mysql-docker(端口转发)
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : 192.168.56.101:33060
 Source Schema         : framework

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 04/06/2020 20:30:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('GhcScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('GhcScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('GhcScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fired_time` bigint(0) NOT NULL,
  `sched_time` bigint(0) NOT NULL,
  `priority` int(0) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('GhcScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.jblog.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E6A626C6F672E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E6A626C6F672E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E74697479000000000000000102000A4C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C00096461746153636F706571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787070707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('GhcScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.jblog.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E6A626C6F672E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E6A626C6F672E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E74697479000000000000000102000A4C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C00096461746153636F706571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787070707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('GhcScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.jblog.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E6A626C6F672E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E6A626C6F672E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E74697479000000000000000102000A4C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C00096461746153636F706571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787070707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('GhcScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('GhcScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_checkin_time` bigint(0) NOT NULL,
  `checkin_interval` bigint(0) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('GhcScheduler', 'DESKTOP-LW1591273158954', 1591273702731, 15000);

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `repeat_count` bigint(0) NOT NULL,
  `repeat_interval` bigint(0) NOT NULL,
  `times_triggered` bigint(0) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `int_prop_1` int(0) NULL DEFAULT NULL,
  `int_prop_2` int(0) NULL DEFAULT NULL,
  `long_prop_1` bigint(0) NULL DEFAULT NULL,
  `long_prop_2` bigint(0) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(0) NULL DEFAULT NULL,
  `prev_fire_time` bigint(0) NULL DEFAULT NULL,
  `priority` int(0) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_time` bigint(0) NOT NULL,
  `end_time` bigint(0) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(0) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS` VALUES ('GhcScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1591273160000, -1, 5, 'PAUSED', 'CRON', 1591273159000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('GhcScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1591273170000, -1, 5, 'PAUSED', 'CRON', 1591273159000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('GhcScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1591273160000, -1, 5, 'PAUSED', 'CRON', 1591273159000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `nick_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者昵称',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章摘要',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容txt',
  `content_html` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容html',
  `view_num` int(0) NULL DEFAULT NULL COMMENT '浏览数',
  `comment_num` int(0) NULL DEFAULT NULL COMMENT '评论数',
  `weight` int(0) NOT NULL COMMENT '权重',
  `tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章标签',
  `category_id` int(0) NULL DEFAULT NULL COMMENT '文章分类ID',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1005 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES (1000, 1, '一点点梵', '你是小猪猪嘛', '猪猪侠', '会飞的猪猪侠', '<p>会飞的猪猪侠</p>\n', 31, 1, 0, 'Vue', 3, '2020-05-15 13:10:27', '2020-05-16 03:04:39', '2');
INSERT INTO `blog_article` VALUES (1002, 1, '一点点梵', 'SpringBoot是什么？', 'springboot', 'SpringBoot是什么？\n\n 我管她是什么，好用就行了啊！！！但是无奈我的简历上写了“精通SpringBoot”。。。那总得大体说得上SpringBoot是个啥东西吧！\n\nSpring相信大家都用过，那一堆的配置，用起来就好比：你要吃饭，饭是熟的，但是你还要自己（配置）加油盐酱醋，还得搅拌均匀，然后才能吃，，，\n\nSpringBoot就不一样了，直接给你端过来一碗香喷喷的牛肉拉面，哇，好香，，，，（好吧，写这个博客的时候没有吃饭，臆想一下，）你可以直接狼吞虎咽了有木有？啥？你想让她帮你嚼碎然后喂你？！！！滚吧你。。。\n一、关于Spring Boot\n\n在开始了解Spring Boot之前，我们需要先了解一下Spring，因为Spring Boot的诞生和Spring是息息相关的，Spring Boot是Spring发展到一定程度的一个产物，但并不是Spring的替代品，Spring Boot是为了让程序员更好的使用Spring。说到这里可能有些人会迷糊，那到底Spring和Spring Boot有着什么样的联系呢？\n1.Spring发展史\n\n在开始之前我们先了解一下Spring，Spring的前身是interface21，这个框架最初是为了解决EJB开发笨重臃肿的问题，为J2EE提供了另一种简单又实用的解决方案，并在2004年3月发布了Spring 1.0正式版之后，就引起了Java界广泛的关注和热评，从此Spring在Java界势如破竹迅速走红，一路成为Java界一颗璀璨夺目的明星，至今无可替代，也一度成为J2EE开发中真正意义上的标准了，而他的创始人Rod Johnson也在之后声名大噪，名利双收，现在是一名优秀的天使投资人，走上了人生的巅峰。\n2.Spring Boot诞生\n\n那既然Spring已经这么优秀了，为什么还有了之后Spring Boot？\n\n因为随着Spring发展的越来越火，Spring也慢慢从一个小而精的框架变成了，一个覆盖面广大而全的框架，另一方面随着新技术的发展，比如nodejs、golang、Ruby的兴起，让Spring逐渐看着笨重起来，大量繁琐的XML配置和第三方整合配置，让Spring使用者痛苦不已，这个时候急需一个解决方案，来解决这些问题。\n\n就在这个节骨眼上Spring Boot应运而生，2013年Spring Boot开始研发，2014年4月Spring Boot 1.0正式发布，Spring Boot诞生之初就受到业界的广泛关注，很多个人和企业陆续开始尝试，随着Spring Boot 2.0的发布，又一次把Spring Boot推向了公众的视野，也有越来越多了的中大型企业把Spring Boot使用到正式的生产环境了。值得一提的是Spring官方也把Spring Boot作为首要的推广项目，放到了官网的首位。\n3.Spring Boot介绍\n\nSpring Boot是由Pivotal团队提供的全新框架，其设计目的是用来简化Spring应用初始搭建以及开发过程。该框架使用了特定的方式来进行配置，从而使开发人员不再需要定义样板化的配置。Spring Boot其实就是一个整合很多可插拔的组件（框架），内嵌了使用工具（比如内嵌了Tomcat、Jetty等），方便开发人员快速搭建和开发的一个框架。\n\n上面的解释是为了大家方便理解，加深记忆。。。下面看看官方的介绍：\n\nSpring Boot makes it easy to create stand-alone, production-grade Spring based Applications that you can \"just run\".\n\nWe take an opinionated view of the Spring platform and third-party libraries so you can get started with minimum fuss. Most Spring Boot applications need very little Spring configuration.\n\n我忍不住想翻译一下：\n\nSpring Boot使创建独立的、基于生产级Spring的应用程序变得很容易，您可以“直接运行”这些应用程序。\n\n我们对Spring平台和第三方库有自己的见解，这样您就可以轻松入门了。大多数Spring引导应用程序只需要很少的Spring配置。\n\n大体意思就是说，她真的很好用，她可以让你在服务的搭建时省去很多繁琐的配置，用过之后的体验：“简直像是日了狗了”。。。\n4.Spring Boot特点\n\n    搭建项目快，几秒钟就可以搭建完成；\n    让测试变的简单，内置了JUnit、Spring Boot Test等多种测试框架，方便测试；\n    Spring Boot让配置变的简单，Spring Boot的核心理念：约定大约配置，约定了某种命名规范，可以不用配置，就可以完成功能开发，比如模型和表名一致就可以不用配置，直接进行CRUD（增删改查）的操作，只有表名和模型不一致的时候，配置名称即可；\n    内嵌容器，省去了配置Tomcat的繁琐；\n    方便监控，使用Spring Boot Actuator组件提供了应用的系统监控，可以查看应用配置的详细信息；\n\n二、开发环境\n\nSpring Boot 2.0.4\n\nJDK 1.8\n\nIDE：IntelliJ IDEA 2018.2\n\n注意：Spring Boot 2.x 要求Java8及以上版本，不再支持Java6、Java7.\n三、开发工具\nIntelliJ IDEA Vs MyEclipse\n\n开发工具的选择是每一个人入门人员要经历和选择的，如果你是老手可以忽略本节。\n\n曾几何时Eclipse和MyEclipse统治了Java使用者，而如今，年复一年，毫不客气的说，十年前我用MyEclipse 6.0到现在的MyEclipse 2017 我没有感觉有任何的变化，还是一样的皮肤，一样的布局，一样卡的起飞使用感受，即使按照Google的指引，优化了一堆配置之后，你也会发现收效甚微。\n\n这让我想起了曾经辉煌一时的诺基亚，到今天为止它依然不知道自己做错了什么，但时过境迁当一个事物跟不上时代变化的节奏，它就会被新来更适合的事物所代替。不得不说我曾经也是MyEclipse的忠实热爱者，并且对一个人来说一旦接受了某种事物，出于习惯的作用，通常改变也是很难的。\n\n然而，到今天，我不得不承认IntelliJ IDEA从外观到运行速度上要比MyEclipse好太多，尤其是对Spring Boot的支持上，更好天作之合，所以IntelliJ IDEA是最好的选择。\n四、Spring Boot版本号说明\n\n官网上的SpringBoot版本如下图所列：\n\n那版本号后面的英文代表什么含义呢？\n\n具体含义，如下文所示：\n\n    SNAPSHOT：快照版，表示开发版本，随时可能修改；\n    M1（Mn）：M是milestone的缩写，也就是里程碑版本；\n    RC1（RCn）：RC是release candidates的缩写，也就是发布预览版；\n    Release：正式版，也可能没有任何后缀也表示正式版；\n\n五、补充内容：\n啥玩意！？你还不明白？还想更加“深入”的了解一下她？好吧那我就在给你贴点东西吧（有点乱，你随便翻翻看看吧）：\n\n北京时间 2018 年 3 月 1 日早上，如约发布的 Spring Boot 2.0 在同步至 Maven 仓库时出现问题，导\n致在 GitHub 上发布的 v2.0.0.RELEASE 被撤回。在问题修复后，官方重新发布了 Spring Boot 2.0，\n并提供了 Maven 中央仓库地址。至此 Spring Boot2.0 正式推出！\n\n官方表示，这个版本经历了 17 个月的开发，有 215 个不同的使用者提供了超过 6800 次的提交。非常感谢提\n供贡献的每一位用户，并感谢所有对这些里程碑版本提供重要反馈的早期采用者。\n\n该版本是自 4 年前发布 Spring Boot 1.0 以来的第一次重大修订，也是首个提供对 Spring Framework 5.0\n支持的 GA 稳定版本。\n那去哪里找SpringBoot呢？\n\n很好，这位同学问得好！：\n\n \n\n 怎么样？这个地方熟悉吧，没错，这就是Spring家族，SB（SpringBoot，一下以及今后的博客简称SB）也是其中成员之一，你可以把她当做Spring的好朋友(●\'◡\'●)ﾉ*\\(๑•₃•๑)*或者闺蜜什么的，whatever吧。。。总之她让我们在和Spring打交道的时候很方便了。\n\n另外SpringBoot2.X之后真的是大换血了：\n新版本值得关注的亮点：\n\n1.基于 Java 8，支持 Java 9，这意味着不是不可以使用JDK7 或更旧的JDK版本运行SpringBoot2而是官方推荐使用JDK8+版本，你自己琢磨琢磨用还是用。。。.\n\n2.支持 Quartz 调度程序\n\n3.大大简化了安全自动配置\n\n4.支持嵌入式 Netty\n\n5.Tomcat, Undertow 和 Jetty 均已支持 HTTP/2\n\n6.全新的执行器架构，支持 Spring MVC, WebFlux 和 Jersey\n\n7.使用 Spring WebFlux/WebFlux.fn 提供响应式 Web 编程支持\n\n8.为各种组件的响应式编程提供了自动化配置，如：Reactive Spring Data、Reactive Spring Security 等\n\n9.用于响应式 Spring Data Cassandra, MongoDB, Couchbase 和 Redis 的自动化配置和启动器 POM\n\n10.引入对 Kotlin 1.2.x 的支持，并提供了一个 runApplication 函数，让你通过惯用的 Kotlin 来运行 Spring Boot 应用程序。更多信息请参阅参考文档中对 Kotlin 的支持部分\n\n11.启动时的 ASCII 图像 Spring Boot banner 现已支持 GIF\n举个栗子：\n\n\n。。。\n\n值得注意的一点是，在 Spring Boot 2.0 中，许多配置属性已被重命名或被删除，为了方便升级，Spring Boot 发布了一个新的 spring-boot-properties-migrator 模块。只要将其作为依赖添加到项目中，它不仅会分析应用程序的环境并在启动时打印诊断信息，而且还会在运行时阶段为项目临时将属性迁移至新的配置方式。\n\n在程序迁移至springboot2.0 期间，这个模块是必备的\n\n<dependency>\n<groupId>org.springframework.boot</groupId>\n<artifactId>spring-boot-properties-migrator</artifactId>\n</dependency>\n注意： 在迁移完成后，请确保从项目的依赖关系中移除该模块。\n', '<p>SpringBoot是什么？</p>\n<p>我管她是什么，好用就行了啊！！！但是无奈我的简历上写了“精通SpringBoot”。。。那总得大体说得上SpringBoot是个啥东西吧！</p>\n<p>Spring相信大家都用过，那一堆的配置，用起来就好比：你要吃饭，饭是熟的，但是你还要自己（配置）加油盐酱醋，还得搅拌均匀，然后才能吃，，，</p>\n<p>SpringBoot就不一样了，直接给你端过来一碗香喷喷的牛肉拉面，哇，好香，，，，（好吧，写这个博客的时候没有吃饭，臆想一下，）你可以直接狼吞虎咽了有木有？啥？你想让她帮你嚼碎然后喂你？！！！滚吧你。。。<br />\n一、关于Spring Boot</p>\n<p>在开始了解Spring Boot之前，我们需要先了解一下Spring，因为Spring Boot的诞生和Spring是息息相关的，Spring Boot是Spring发展到一定程度的一个产物，但并不是Spring的替代品，Spring Boot是为了让程序员更好的使用Spring。说到这里可能有些人会迷糊，那到底Spring和Spring Boot有着什么样的联系呢？<br />\n1.Spring发展史</p>\n<p>在开始之前我们先了解一下Spring，Spring的前身是interface21，这个框架最初是为了解决EJB开发笨重臃肿的问题，为J2EE提供了另一种简单又实用的解决方案，并在2004年3月发布了Spring 1.0正式版之后，就引起了Java界广泛的关注和热评，从此Spring在Java界势如破竹迅速走红，一路成为Java界一颗璀璨夺目的明星，至今无可替代，也一度成为J2EE开发中真正意义上的标准了，而他的创始人Rod Johnson也在之后声名大噪，名利双收，现在是一名优秀的天使投资人，走上了人生的巅峰。<br />\n2.Spring Boot诞生</p>\n<p>那既然Spring已经这么优秀了，为什么还有了之后Spring Boot？</p>\n<p>因为随着Spring发展的越来越火，Spring也慢慢从一个小而精的框架变成了，一个覆盖面广大而全的框架，另一方面随着新技术的发展，比如nodejs、golang、Ruby的兴起，让Spring逐渐看着笨重起来，大量繁琐的XML配置和第三方整合配置，让Spring使用者痛苦不已，这个时候急需一个解决方案，来解决这些问题。</p>\n<p>就在这个节骨眼上Spring Boot应运而生，2013年Spring Boot开始研发，2014年4月Spring Boot 1.0正式发布，Spring Boot诞生之初就受到业界的广泛关注，很多个人和企业陆续开始尝试，随着Spring Boot 2.0的发布，又一次把Spring Boot推向了公众的视野，也有越来越多了的中大型企业把Spring Boot使用到正式的生产环境了。值得一提的是Spring官方也把Spring Boot作为首要的推广项目，放到了官网的首位。<br />\n3.Spring Boot介绍</p>\n<p>Spring Boot是由Pivotal团队提供的全新框架，其设计目的是用来简化Spring应用初始搭建以及开发过程。该框架使用了特定的方式来进行配置，从而使开发人员不再需要定义样板化的配置。Spring Boot其实就是一个整合很多可插拔的组件（框架），内嵌了使用工具（比如内嵌了Tomcat、Jetty等），方便开发人员快速搭建和开发的一个框架。</p>\n<p>上面的解释是为了大家方便理解，加深记忆。。。下面看看官方的介绍：</p>\n<p>Spring Boot makes it easy to create stand-alone, production-grade Spring based Applications that you can “just run”.</p>\n<p>We take an opinionated view of the Spring platform and third-party libraries so you can get started with minimum fuss. Most Spring Boot applications need very little Spring configuration.</p>\n<p>我忍不住想翻译一下：</p>\n<p>Spring Boot使创建独立的、基于生产级Spring的应用程序变得很容易，您可以“直接运行”这些应用程序。</p>\n<p>我们对Spring平台和第三方库有自己的见解，这样您就可以轻松入门了。大多数Spring引导应用程序只需要很少的Spring配置。</p>\n<p>大体意思就是说，她真的很好用，她可以让你在服务的搭建时省去很多繁琐的配置，用过之后的体验：“简直像是日了狗了”。。。<br />\n4.Spring Boot特点</p>\n<pre><code>搭建项目快，几秒钟就可以搭建完成；\n让测试变的简单，内置了JUnit、Spring Boot Test等多种测试框架，方便测试；\nSpring Boot让配置变的简单，Spring Boot的核心理念：约定大约配置，约定了某种命名规范，可以不用配置，就可以完成功能开发，比如模型和表名一致就可以不用配置，直接进行CRUD（增删改查）的操作，只有表名和模型不一致的时候，配置名称即可；\n内嵌容器，省去了配置Tomcat的繁琐；\n方便监控，使用Spring Boot Actuator组件提供了应用的系统监控，可以查看应用配置的详细信息；\n</code></pre>\n<p>二、开发环境</p>\n<p>Spring Boot 2.0.4</p>\n<p>JDK 1.8</p>\n<p>IDE：IntelliJ IDEA 2018.2</p>\n<p>注意：Spring Boot 2.x 要求Java8及以上版本，不再支持Java6、Java7.<br />\n三、开发工具<br />\nIntelliJ IDEA Vs MyEclipse</p>\n<p>开发工具的选择是每一个人入门人员要经历和选择的，如果你是老手可以忽略本节。</p>\n<p>曾几何时Eclipse和MyEclipse统治了Java使用者，而如今，年复一年，毫不客气的说，十年前我用MyEclipse 6.0到现在的MyEclipse 2017 我没有感觉有任何的变化，还是一样的皮肤，一样的布局，一样卡的起飞使用感受，即使按照Google的指引，优化了一堆配置之后，你也会发现收效甚微。</p>\n<p>这让我想起了曾经辉煌一时的诺基亚，到今天为止它依然不知道自己做错了什么，但时过境迁当一个事物跟不上时代变化的节奏，它就会被新来更适合的事物所代替。不得不说我曾经也是MyEclipse的忠实热爱者，并且对一个人来说一旦接受了某种事物，出于习惯的作用，通常改变也是很难的。</p>\n<p>然而，到今天，我不得不承认IntelliJ IDEA从外观到运行速度上要比MyEclipse好太多，尤其是对Spring Boot的支持上，更好天作之合，所以IntelliJ IDEA是最好的选择。<br />\n四、Spring Boot版本号说明</p>\n<p>官网上的SpringBoot版本如下图所列：</p>\n<p>那版本号后面的英文代表什么含义呢？</p>\n<p>具体含义，如下文所示：</p>\n<pre><code>SNAPSHOT：快照版，表示开发版本，随时可能修改；\nM1（Mn）：M是milestone的缩写，也就是里程碑版本；\nRC1（RCn）：RC是release candidates的缩写，也就是发布预览版；\nRelease：正式版，也可能没有任何后缀也表示正式版；\n</code></pre>\n<p>五、补充内容：<br />\n啥玩意！？你还不明白？还想更加“深入”的了解一下她？好吧那我就在给你贴点东西吧（有点乱，你随便翻翻看看吧）：</p>\n<p>北京时间 2018 年 3 月 1 日早上，如约发布的 Spring Boot 2.0 在同步至 Maven 仓库时出现问题，导<br />\n致在 GitHub 上发布的 v2.0.0.RELEASE 被撤回。在问题修复后，官方重新发布了 Spring Boot 2.0，<br />\n并提供了 Maven 中央仓库地址。至此 Spring Boot2.0 正式推出！</p>\n<p>官方表示，这个版本经历了 17 个月的开发，有 215 个不同的使用者提供了超过 6800 次的提交。非常感谢提<br />\n供贡献的每一位用户，并感谢所有对这些里程碑版本提供重要反馈的早期采用者。</p>\n<p>该版本是自 4 年前发布 Spring Boot 1.0 以来的第一次重大修订，也是首个提供对 Spring Framework 5.0<br />\n支持的 GA 稳定版本。<br />\n那去哪里找SpringBoot呢？</p>\n<p>很好，这位同学问得好！：</p>\n<p>怎么样？这个地方熟悉吧，没错，这就是Spring家族，SB（SpringBoot，一下以及今后的博客简称SB）也是其中成员之一，你可以把她当做Spring的好朋友(●’◡’●)ﾉ*(๑•₃•๑)*或者闺蜜什么的，whatever吧。。。总之她让我们在和Spring打交道的时候很方便了。</p>\n<p>另外SpringBoot2.X之后真的是大换血了：<br />\n新版本值得关注的亮点：</p>\n<p>1.基于 Java 8，支持 Java 9，这意味着不是不可以使用JDK7 或更旧的JDK版本运行SpringBoot2而是官方推荐使用JDK8+版本，你自己琢磨琢磨用还是用。。。.</p>\n<p>2.支持 Quartz 调度程序</p>\n<p>3.大大简化了安全自动配置</p>\n<p>4.支持嵌入式 Netty</p>\n<p>5.Tomcat, Undertow 和 Jetty 均已支持 HTTP/2</p>\n<p>6.全新的执行器架构，支持 Spring MVC, WebFlux 和 Jersey</p>\n<p>7.使用 Spring WebFlux/WebFlux.fn 提供响应式 Web 编程支持</p>\n<p>8.为各种组件的响应式编程提供了自动化配置，如：Reactive Spring Data、Reactive Spring Security 等</p>\n<p>9.用于响应式 Spring Data Cassandra, MongoDB, Couchbase 和 Redis 的自动化配置和启动器 POM</p>\n<p>10.引入对 Kotlin 1.2.x 的支持，并提供了一个 runApplication 函数，让你通过惯用的 Kotlin 来运行 Spring Boot 应用程序。更多信息请参阅参考文档中对 Kotlin 的支持部分</p>\n<p>11.启动时的 ASCII 图像 Spring Boot banner 现已支持 GIF<br />\n举个栗子：</p>\n<p>。。。</p>\n<p>值得注意的一点是，在 Spring Boot 2.0 中，许多配置属性已被重命名或被删除，为了方便升级，Spring Boot 发布了一个新的 spring-boot-properties-migrator 模块。只要将其作为依赖添加到项目中，它不仅会分析应用程序的环境并在启动时打印诊断信息，而且还会在运行时阶段为项目临时将属性迁移至新的配置方式。</p>\n<p>在程序迁移至springboot2.0 期间，这个模块是必备的</p>\n<dependency>\n<groupId>org.springframework.boot</groupId>\n<artifactId>spring-boot-properties-migrator</artifactId>\n</dependency>\n注意： 在迁移完成后，请确保从项目的依赖关系中移除该模块。\n', 2, 0, 0, NULL, 2, '2020-05-15 20:26:58', '2020-05-15 20:26:58', '1');
INSERT INTO `blog_article` VALUES (1003, 1, '一点点梵', '权限管理 【SpringSecurity篇】', '权限、安全', '    只要和用户打交道的系统基本都需要进行权限管理，不然哪一天操作不当给你删库了怎么办。开源的权限管理框架有SpringSecurity、Shiro，权限管理模型有RBAC、ACL等，是选择开源框架好还是基于权限管理模型造轮子好，必须都调研一下选一个适合公司业务的实现方式，首先先调研学习一波SpringSecurity\n\n通过本篇文章你将了解到\n\n    SpringSecurity中的一些核心类\n    使用SpringSecurity基于角色的权限校验\n    SpringSecurity的不足\n\nSpringSecurity核心类\n\n因为对SpringSecurity只是调研性的学习，所以这里并不会对源码进行介绍。权限管理就是授权、鉴权，要想鉴权必须首先登陆拿到用户信息，但是这里也不会去讲登陆、登出以及分布式session管理，只会介绍一下鉴权过程中的核心类，了解一下核心类可以快速整合SpringSecurity框架。\n登陆校验\n\n    UsernamePasswordAuthenticationFilter => 用户登陆验证，但这个类里并不会正真去进行登陆校验，而是通过ProviderManager\n    ProviderManager => 这个类里有一个List<AuthenticationProvider>，提供了不同的校验方式，只要其中一个通过即可。一般我们什么都不配的情况下是根据用户名和密码，这时候AuthenticationProvider实现类为AbstractUserDetailsAuthenticationProvider\n    AbstractUserDetailsAuthenticationProvider => 其登陆校验是通过子类的additionalAuthenticationChecks方法完成的\n    DaoAuthenticationProvider => AbstractUserDetailsAuthenticationProvider的唯一子类，如果我们设定的密码(可以基于内存也可以基于数据库)和传过来的密码比对不上登陆校验失败\n    UserDetailsService => 通过这个接口唯一的方法loadUserByUsername返回我们设定的用户名和密码等用户信息（被封装为UserDetails的实现类）\n\n小结：登陆验证就是拿到客户端的用户名密码和我们设定的用户名密码（即UserDetails的实现类）进行比对，拿到我们设定的用户名密码是通过UserDetailsService.loadUserByUsername(String userName)实现的[划重点，一会要考]，框架实现的UserDetailsService一般没法满足项目要求，就需要自己手动实现了，同时如果框架自带的UserDetails的实现类没法满足要求我们也可以自己实现UserDetails\n权限校验\n\n    FilterSecurityInterceptor => 基于角色的权限校验拦截器，调用父类AbstractSecurityInterceptor的beforeInvocation方法进行鉴权\n    AbstractSecurityInterceptor => 调用AccessDecisionManager实现类的decide方法进行鉴权，所以如何想自定义鉴权方式可以写一个类然后实现AccessDecisionManager\n    AffirmativeBased => 默认使用的AccessDecisionManager实现类，调用AccessDecisionVoter实现类的vote方法进行鉴权，返回1权限校验通过，其实跟踪到最后其实还是比对字符串不能说是投票吧，方法名容易让人误解\n    WebExpressionVoter => 默认使用的AccessDecisionVoter实现类，调用Authentication的authentication方法进行鉴权\n    SecurityExpressionOperations => 获取Authentication对象接口\n    SecurityExpressionRoot => SecurityExpressionOperations实现类\n\n小结：一般不自定鉴权方式的话这些我们都可以不需要管，虽然层层调用了很多层，其实实质就是判断当前的用户所包含的权限列表中是否包含访问指定url所需要的权限\nSpringBoot整合SpringSecurity\n依赖\n\n<dependency>\n    <groupId>org.springframework.boot</groupId>\n    <artifactId>spring-boot-starter-security</artifactId>\n    <version>1.4.1.RELEASE</version>\n</dependency>\n\nUserDetails实现类：UserDTO.java\n\npublic class UserDTO implements UserDetails {\n    /**\n     * 用户名\n     * */\n    private String username;\n\n    /**\n     * 密码\n     * */\n    private String password;\n\n    /**\n     * 角色列表\n     * */\n    private List<String> roleList;\n\n    public void setUsername(String username) {\n        this.username = username;\n    }\n\n    public void setPassword(String password) {\n        this.password = password;\n    }\n\n    public List<String> getRoleList() {\n        return roleList;\n    }\n\n    public void setRoleList(List<String> roleList) {\n        this.roleList = roleList;\n    }\n\n    @Override\n    public Collection<? extends GrantedAuthority> getAuthorities() {\n        List<GrantedAuthority> authorityList = new ArrayList<>();\n        for (String role : roleList) {\n            authorityList.add(new SimpleGrantedAuthority(role));\n        }\n\n        return authorityList;\n    }\n\n    @Override\n    public String getPassword() {\n        return password;\n    }\n\n    @Override\n    public String getUsername() {\n        return username;\n    }\n\n    @Override\n    public boolean isAccountNonExpired() {\n        return true;\n    }\n\n    @Override\n    public boolean isAccountNonLocked() {\n        return true;\n    }\n\n    @Override\n    public boolean isCredentialsNonExpired() {\n        return true;\n    }\n\n    @Override\n    public boolean isEnabled() {\n        return true;\n    }\n}\n\n实现类需要实现接口，这里我们将查询到的roleList字符串封装到SimpleGrantedAuthority中，SimpleGrantedAuthority是GrantedAuthority的一个实现类，如果默认实现没法满足需求可自己重新实现。UserDetail是SpringSecurity和应用之间的桥梁，不管你数据库怎么建，只要你最后将用户信息和权限的关系封装为UserDetails，SpringSecurity就可以按它自己的机制进行权限校验\nUserDetailsService实现类：UserDetailsServiceImpl.java\n\npublic class UserDetailsServiceImpl implements UserDetailsService {\n    @Resource\n    private UsersService usersService;\n\n    /**\n     * 根据用户名获取用户信息\n     */\n    @Override\n    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {\n        Users users = new Users();\n        users.setUsername(username);\n        List<Users> usersList = usersService.selectList(users);\n\n        return buildUserDTO(usersList);\n    }\n\n    /**\n     * 封装UserDTO对象\n     *\n     * @param usersList\n     * @return\n     * */\n    private UserDTO buildUserDTO(List<Users> usersList) {\n        UserDTO userDTO = new UserDTO();\n        userDTO.setUsername(usersList.get(0).getUsername());\n        userDTO.setPassword(usersList.get(0).getPassword());\n        List<String> roleList = new ArrayList<>();\n        for (Users users : usersList) {\n            roleList.add(String.format(\"ROLE_%s\", users.getRole()));\n        }\n\n        userDTO.setRoleList(roleList);\n        return userDTO;\n    }\n}\n\n该类作用就是将用户信息和权限信息从数据库查找到封装为一个UserDetails返回\n权限配置类：WebSecurityConfig.java\n\n@Configuration\n@EnableWebSecurity\n@EnableGlobalMethodSecurity(prePostEnabled = true) // 开启方法级安全验证\npublic class WebSecurityConfig extends WebSecurityConfigurerAdapter {\n    @Autowired\n    private UserDetailsServiceImpl userDetailsService;\n\n    @Override\n    protected void configure(HttpSecurity http) throws Exception {\n        http.authorizeRequests()\n                .anyRequest().authenticated() //任何请求,登录后可以访问\n                .and().formLogin().permitAll(); //登录页面用户任意访问\n\n        // 关闭CSRF跨域\n        http.csrf().disable();\n    }\n\n    @Override\n    public void configure(WebSecurity web) throws Exception {\n        // 设置拦截忽略文件夹，可以对静态资源放行\n        web.ignoring().antMatchers(\"/css/**\", \"/js/**\", \"/templates/**\");\n    }\n\n    @Override\n    protected void configure(AuthenticationManagerBuilder auth) throws Exception {\n        //1.设置自定义userDetailService\n        //2.校验时指定密码解码方式\n        auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder());\n    }\n}\n\n这个类里配置了登陆页面以及一些简单权限设置，比如任何请求登陆后可访问、登录页面所有人可以访问。因为通过@EnableGlobalMethodSecurity注解开启了方法级别验证，在这个方法里没有配置方法级别的权限。同时通过指定自己实现的UserDetailsService以及密码解码方式，如果不指定密码解码方式将会报错在最新的SpringSecurity版本中\n控制层注解使用方式\n\n@RestController\n@RequestMapping(\"/api/user\")\npublic class UsersController {\n    @GetMapping(\"/guest\")\n    @PreAuthorize(\"hasAnyRole(\'guest\')\")\n    public Object guest() {\n        return \"hello guest\";\n    }\n\n    @PreAuthorize(\"hasAnyRole(\'admin\')\")\n    @GetMapping(\"/admin\")\n    public Object admin() {\n        return \"hello admin\";\n    }\n}\n\n通过@PreAuthorize来进行权限控制，在hasAnyRole中写入访问该api具有的权限（角色），除了可以使用@PreAuthorize注解，还可以使用@Secured、@PostAuthorize注解\nSpringSecurity框架的不足\n\n    对项目代码有入侵\n    不够通用，所有需要权限校验的系统都需要整合SpringSecurity框架，不同应用系统数据库设计不同，UserDetail一般需自己实现【只是举个例子，实际开发过程中重写的类可能更多】\n    角色应该是动态的，但通过SpringSecurity配置的角色是静态的，在数据库新添角色时必须对代码进行修改，否则无法使用\n    并不是一个RBAC的设计模型而是一个ACL模型，角色权限的划分并不是特别清楚，权限也可以是角色，如果想基于RBAC的权限校验就必须自己重新写权限校验方法\n    权限管理粒度不够细，比如没法支持到方法级别的权限校验，想支持更细粒度的权限必须自己写权限校验\n    提供的三种缓存用户信息的方式，分别为NullUserCache、EhCacheBasedUserCache、SpringCacheBasedUserCache。第一种永远return null，相当于没使用缓存，后两者是内存缓存，在分布式部署中会出现缓存命中率低、缓存不一致的情况，需要自己实现缓存\n\n    仅是自己的一些看法，如有纰漏欢迎指正\n', '<pre><code>只要和用户打交道的系统基本都需要进行权限管理，不然哪一天操作不当给你删库了怎么办。开源的权限管理框架有SpringSecurity、Shiro，权限管理模型有RBAC、ACL等，是选择开源框架好还是基于权限管理模型造轮子好，必须都调研一下选一个适合公司业务的实现方式，首先先调研学习一波SpringSecurity\n</code></pre>\n<p>通过本篇文章你将了解到</p>\n<pre><code>SpringSecurity中的一些核心类\n使用SpringSecurity基于角色的权限校验\nSpringSecurity的不足\n</code></pre>\n<p>SpringSecurity核心类</p>\n<p>因为对SpringSecurity只是调研性的学习，所以这里并不会对源码进行介绍。权限管理就是授权、鉴权，要想鉴权必须首先登陆拿到用户信息，但是这里也不会去讲登陆、登出以及分布式session管理，只会介绍一下鉴权过程中的核心类，了解一下核心类可以快速整合SpringSecurity框架。<br />\n登陆校验</p>\n<pre><code>UsernamePasswordAuthenticationFilter =&gt; 用户登陆验证，但这个类里并不会正真去进行登陆校验，而是通过ProviderManager\nProviderManager =&gt; 这个类里有一个List&lt;AuthenticationProvider&gt;，提供了不同的校验方式，只要其中一个通过即可。一般我们什么都不配的情况下是根据用户名和密码，这时候AuthenticationProvider实现类为AbstractUserDetailsAuthenticationProvider\nAbstractUserDetailsAuthenticationProvider =&gt; 其登陆校验是通过子类的additionalAuthenticationChecks方法完成的\nDaoAuthenticationProvider =&gt; AbstractUserDetailsAuthenticationProvider的唯一子类，如果我们设定的密码(可以基于内存也可以基于数据库)和传过来的密码比对不上登陆校验失败\nUserDetailsService =&gt; 通过这个接口唯一的方法loadUserByUsername返回我们设定的用户名和密码等用户信息（被封装为UserDetails的实现类）\n</code></pre>\n<p>小结：登陆验证就是拿到客户端的用户名密码和我们设定的用户名密码（即UserDetails的实现类）进行比对，拿到我们设定的用户名密码是通过UserDetailsService.loadUserByUsername(String userName)实现的[划重点，一会要考]，框架实现的UserDetailsService一般没法满足项目要求，就需要自己手动实现了，同时如果框架自带的UserDetails的实现类没法满足要求我们也可以自己实现UserDetails<br />\n权限校验</p>\n<pre><code>FilterSecurityInterceptor =&gt; 基于角色的权限校验拦截器，调用父类AbstractSecurityInterceptor的beforeInvocation方法进行鉴权\nAbstractSecurityInterceptor =&gt; 调用AccessDecisionManager实现类的decide方法进行鉴权，所以如何想自定义鉴权方式可以写一个类然后实现AccessDecisionManager\nAffirmativeBased =&gt; 默认使用的AccessDecisionManager实现类，调用AccessDecisionVoter实现类的vote方法进行鉴权，返回1权限校验通过，其实跟踪到最后其实还是比对字符串不能说是投票吧，方法名容易让人误解\nWebExpressionVoter =&gt; 默认使用的AccessDecisionVoter实现类，调用Authentication的authentication方法进行鉴权\nSecurityExpressionOperations =&gt; 获取Authentication对象接口\nSecurityExpressionRoot =&gt; SecurityExpressionOperations实现类\n</code></pre>\n<p>小结：一般不自定鉴权方式的话这些我们都可以不需要管，虽然层层调用了很多层，其实实质就是判断当前的用户所包含的权限列表中是否包含访问指定url所需要的权限<br />\nSpringBoot整合SpringSecurity<br />\n依赖</p>\n<dependency>\n    <groupId>org.springframework.boot</groupId>\n    <artifactId>spring-boot-starter-security</artifactId>\n    <version>1.4.1.RELEASE</version>\n</dependency>\n<p>UserDetails实现类：UserDTO.java</p>\n<p>public class UserDTO implements UserDetails {<br />\n/**<br />\n* 用户名<br />\n* */<br />\nprivate String username;</p>\n<pre><code>/**\n * 密码\n * */\nprivate String password;\n\n/**\n * 角色列表\n * */\nprivate List&lt;String&gt; roleList;\n\npublic void setUsername(String username) {\n    this.username = username;\n}\n\npublic void setPassword(String password) {\n    this.password = password;\n}\n\npublic List&lt;String&gt; getRoleList() {\n    return roleList;\n}\n\npublic void setRoleList(List&lt;String&gt; roleList) {\n    this.roleList = roleList;\n}\n\n@Override\npublic Collection&lt;? extends GrantedAuthority&gt; getAuthorities() {\n    List&lt;GrantedAuthority&gt; authorityList = new ArrayList&lt;&gt;();\n    for (String role : roleList) {\n        authorityList.add(new SimpleGrantedAuthority(role));\n    }\n\n    return authorityList;\n}\n\n@Override\npublic String getPassword() {\n    return password;\n}\n\n@Override\npublic String getUsername() {\n    return username;\n}\n\n@Override\npublic boolean isAccountNonExpired() {\n    return true;\n}\n\n@Override\npublic boolean isAccountNonLocked() {\n    return true;\n}\n\n@Override\npublic boolean isCredentialsNonExpired() {\n    return true;\n}\n\n@Override\npublic boolean isEnabled() {\n    return true;\n}\n</code></pre>\n<p>}</p>\n<p>实现类需要实现接口，这里我们将查询到的roleList字符串封装到SimpleGrantedAuthority中，SimpleGrantedAuthority是GrantedAuthority的一个实现类，如果默认实现没法满足需求可自己重新实现。UserDetail是SpringSecurity和应用之间的桥梁，不管你数据库怎么建，只要你最后将用户信息和权限的关系封装为UserDetails，SpringSecurity就可以按它自己的机制进行权限校验<br />\nUserDetailsService实现类：UserDetailsServiceImpl.java</p>\n<p>public class UserDetailsServiceImpl implements UserDetailsService {<br />\n@Resource<br />\nprivate UsersService usersService;</p>\n<pre><code>/**\n * 根据用户名获取用户信息\n */\n@Override\npublic UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {\n    Users users = new Users();\n    users.setUsername(username);\n    List&lt;Users&gt; usersList = usersService.selectList(users);\n\n    return buildUserDTO(usersList);\n}\n\n/**\n * 封装UserDTO对象\n *\n * @param usersList\n * @return\n * */\nprivate UserDTO buildUserDTO(List&lt;Users&gt; usersList) {\n    UserDTO userDTO = new UserDTO();\n    userDTO.setUsername(usersList.get(0).getUsername());\n    userDTO.setPassword(usersList.get(0).getPassword());\n    List&lt;String&gt; roleList = new ArrayList&lt;&gt;();\n    for (Users users : usersList) {\n        roleList.add(String.format(&quot;ROLE_%s&quot;, users.getRole()));\n    }\n\n    userDTO.setRoleList(roleList);\n    return userDTO;\n}\n</code></pre>\n<p>}</p>\n<p>该类作用就是将用户信息和权限信息从数据库查找到封装为一个UserDetails返回<br />\n权限配置类：WebSecurityConfig.java</p>\n<p>@Configuration<br />\n@EnableWebSecurity<br />\n@EnableGlobalMethodSecurity(prePostEnabled = true) // 开启方法级安全验证<br />\npublic class WebSecurityConfig extends WebSecurityConfigurerAdapter {<br />\n@Autowired<br />\nprivate UserDetailsServiceImpl userDetailsService;</p>\n<pre><code>@Override\nprotected void configure(HttpSecurity http) throws Exception {\n    http.authorizeRequests()\n            .anyRequest().authenticated() //任何请求,登录后可以访问\n            .and().formLogin().permitAll(); //登录页面用户任意访问\n\n    // 关闭CSRF跨域\n    http.csrf().disable();\n}\n\n@Override\npublic void configure(WebSecurity web) throws Exception {\n    // 设置拦截忽略文件夹，可以对静态资源放行\n    web.ignoring().antMatchers(&quot;/css/**&quot;, &quot;/js/**&quot;, &quot;/templates/**&quot;);\n}\n\n@Override\nprotected void configure(AuthenticationManagerBuilder auth) throws Exception {\n    //1.设置自定义userDetailService\n    //2.校验时指定密码解码方式\n    auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder());\n}\n</code></pre>\n<p>}</p>\n<p>这个类里配置了登陆页面以及一些简单权限设置，比如任何请求登陆后可访问、登录页面所有人可以访问。因为通过@EnableGlobalMethodSecurity注解开启了方法级别验证，在这个方法里没有配置方法级别的权限。同时通过指定自己实现的UserDetailsService以及密码解码方式，如果不指定密码解码方式将会报错在最新的SpringSecurity版本中<br />\n控制层注解使用方式</p>\n<p>@RestController<br />\n@RequestMapping(&quot;/api/user&quot;)<br />\npublic class UsersController {<br />\n@GetMapping(&quot;/guest&quot;)<br />\n@PreAuthorize(“hasAnyRole(‘guest’)”)<br />\npublic Object guest() {<br />\nreturn “hello guest”;<br />\n}</p>\n<pre><code>@PreAuthorize(&quot;hasAnyRole(\'admin\')&quot;)\n@GetMapping(&quot;/admin&quot;)\npublic Object admin() {\n    return &quot;hello admin&quot;;\n}\n</code></pre>\n<p>}</p>\n<p>通过@PreAuthorize来进行权限控制，在hasAnyRole中写入访问该api具有的权限（角色），除了可以使用@PreAuthorize注解，还可以使用@Secured、@PostAuthorize注解<br />\nSpringSecurity框架的不足</p>\n<pre><code>对项目代码有入侵\n不够通用，所有需要权限校验的系统都需要整合SpringSecurity框架，不同应用系统数据库设计不同，UserDetail一般需自己实现【只是举个例子，实际开发过程中重写的类可能更多】\n角色应该是动态的，但通过SpringSecurity配置的角色是静态的，在数据库新添角色时必须对代码进行修改，否则无法使用\n并不是一个RBAC的设计模型而是一个ACL模型，角色权限的划分并不是特别清楚，权限也可以是角色，如果想基于RBAC的权限校验就必须自己重新写权限校验方法\n权限管理粒度不够细，比如没法支持到方法级别的权限校验，想支持更细粒度的权限必须自己写权限校验\n提供的三种缓存用户信息的方式，分别为NullUserCache、EhCacheBasedUserCache、SpringCacheBasedUserCache。第一种永远return null，相当于没使用缓存，后两者是内存缓存，在分布式部署中会出现缓存命中率低、缓存不一致的情况，需要自己实现缓存\n\n仅是自己的一些看法，如有纰漏欢迎指正\n</code></pre>\n', 4, 0, 0, NULL, 2, '2020-05-15 20:33:35', '2020-05-16 03:10:41', '1');
INSERT INTO `blog_article` VALUES (1004, 1, '一点点梵', 'Vue.js是什么？', 'vue', 'Vue.js新手入门指南\n最近在逛各大网站，论坛，以及像SegmentFault等编程问答社区，发现Vue.js异常火爆，重复性的提问和内容也很多，楼主自己也趁着这个大前端的热潮，着手学习了一段时间的Vue.js，目前用它正在做自己的结业项目。\n\n在做的过程中也对Vue.js的官方文档以及其各种特性有了许多认识。作为一个之前以PHP+模版引擎为主的开发，从一个从未接触过除HTML+CSS+JavaScript+jQuery以外的前端技术的人到现在可以独立使用Vue.js以及各种附属的UI库来开发项目，我总结了一些知识和经验想与大家分享。\n\n下面我就以问答的形式来分享吧。这里假设你仅仅只掌握了HTML+CSS+JavaScript，如果你对JQuery这个前端库，以及各种后端模版语言比如说PHP，JSP还有所了解并且使用过的话那就太好了。\n1.Vue.js是什么？\n\n    Vue.js（读音 /vjuː/, 类似于 view） 是一套构建用户界面的 渐进式框架。与其他重量级框架不同的是，Vue 采用自底向上增量开发的设计。Vue 的核心库只关注视图层，并且非常容易学习，非常容易与其它库或已有项目整合。另一方面，Vue 完全有能力驱动采用单文件组件和 Vue 生态系统支持的库开发的复杂单页应用。\n\n    Vue.js 的目标是通过尽可能简单的 API 实现响应的数据绑定和组合的视图组件。\n\n    如果你是有经验的前端开发者，想知道 Vue.js 与其它库/框架的区别，查看对比其它框架。\n\n这是官网的介绍，是不是觉得非常的抽象非常的官方？看完之后可能还是有很多人不是很懂这个框架到底是用来做什么的，什么是“渐进式框架”？什么是“自底向上增量开发”？什么是“视图层”？什么是“单文件组件”？什么是“复杂的单页应用？”第二段话里面“响应的数据绑定和组合的视图组件”这又是个啥？还有最后一段话，“Vue.js 与其它库/框架的区别”究竟是什么？\n\n不要担心，如果你慢慢看完这里面的所有问答，一定会对前面那些可能你从未听说过的专业术语有一种恍然大悟的感觉。\n2.Vue.js到底是什么？\n\n想必现在能看到我这篇文章的人，都是用着APP或者网页版知乎在阅读把。Vue.js就是一个用于搭建类似于网页版知乎这种表单项繁多，且内容需要根据用户的操作进行修改的网页版应用。\n3.单页应用程序（SPA）\n\n顾名思义，单页应用一般指的就是一个页面就是应用，当然也可以是一个子应用，比如说知乎的一个页面就可以视为一个子应用。单页应用程序中一般交互处理非常多，而且页面中的内容需要根据用户的操作动态变化。\n4.你前面说的网页版知乎我也可以用JQuery写啊，为什么要用Vue.js呢？\n\n讲到JQuery，就不得不说到JavaScript的DOM操作了。如果你用JQuery来开发一个知乎，那么你就需要用JQuery中的各种DOM操作方法去操作HTML的DOM结构了。\n\n现在我们把一个网页应用抽象一下，那么HTML中的DOM其实就是视图，一个网页就是通过DOM的组合与嵌套，形成了最基本的视图结构，再通过CSS的修饰，在基本的视图结构上“化妆”让他们看起来更加美观。最后涉及到交互部分，就需要用到JavaScript来接受用户的交互请求，并且通过事件机制来响应用户的交互操作，并且在事件的处理函数中进行各种数据的修改，比如说修改某个DOM中的innerHTML或者innerText部分。\n\n我们把HTML中的DOM就可以与其他的部分独立开来划分出一个层次，这个层次就叫做视图层。\n\n    Vue 的核心库只关注视图层\n\n我们为什么要把视图层抽取出来并且单独去关注它呢？\n\n因为在像知乎这种页面元素非常多，结构很庞大的网页中，数据和视图如果全部混杂在一起，像传统开发一样全部混合在HTML中，那么要对它们进行处理会十分的费劲，并且如果其中有几个结构之间存在藕断丝连的关系，那么会导致代码上出现更大的问题，这什么问题呢？\n\n你是否还记得你当初写JQuery的时候，有写过(\'#xxx\').parent().parent().parent()这种代码呢？当你第一次写的时候，你觉得页面元素不多，不就是找这个元素的爸爸的爸爸的爸爸吗，我大不了在注释里面写清楚这个元素的爸爸的爸爸的爸爸不就好了。但是万一过几天之后你的项目组长或者你的产品经理突然对你做的网页提出修改要求，这个修改要求将会影响页面的结构，也就是DOM的关联与嵌套层次要发生改变，那么\n\n(‘#xxx’).parent().parent().parent()可能就会变成$(‘#xxx’).parent().parent().parent().parent().parent()了。\n\n这还不算什么，等以后产品迭代越来越快，修改越来越多，而且页面中类似的关联和嵌套DOM元素不止一个，那么修改起来将非常费劲。而且JQuery选择器查找页面元素以及DOM操作本身也是有性能损失的，可能到时候打开这个页面，会变得越来越卡，而你却无从下手。\n\n当你在编写项目的时候遇到了这种问题，你一定会抱怨，为什么世上会有HTML这种像盗梦空间一样的需要无数div嵌套才能做出页面的语言，为什么当初学JQuery看中的是它简洁的DOM操作，现在却一点也不觉得它有多简洁，难道我学的是假的JQuery？为什么写个代码这么难，你想砸电脑，你想一键盘拍在产品狗的脑袋上，责怪他天天改需求才让你原本花清香茶清味的代码变得如此又臭又长。\n\n这个时候如果你学过Vue.js，那么这些抱怨将不复存在。\n5.Vue.js为什么能让基于网页的前端应用程序开发起来这么方便？\n\n因为Vue.js有声明式，响应式的数据绑定，与组件化的开发，并且还使用了Virtual DOM这个看名字就觉得高大上的技术。\n\n可是这些名词都是啥？\n6.响应式的数据绑定\n\n这里的响应式不是@media 媒体查询中的响应式布局，而是指vue.js会自动对页面中某些数据的变化做出响应。至于是如何响应的，大家可以先把下面这段代码随便粘贴到一个扩展名为html的文件然后用浏览器打开，随便在文本框里面输入一些文字，观察一下页面变化。\n\n<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n    <meta charset=\"UTF-8\">\n    <title>vue.js测试 - 代码之美专栏</title>\n    <!-- author:昌维 代码之美 https://zhuanlan.zhihu.com/codes -->\n    <script src=\"https://unpkg.com/vue/dist/vue.js\"></script>\n</head>\n<body>\n    <div id=\"app\">\n        <input type=\"text\" name=\"\" value=\"\" placeholder=\"在这里输入文字，下面会跟着变化\" v-model=\"message\">\n        <hr>\n        <p>{{ message }}</p>\n    </div>\n    <script type=\"text/javascript\">\n        var app = new Vue({\n          el: \'#app\',\n          data: {\n            message: \'Hello Vue!\'\n          }\n        })\n    </script>\n</body>\n</html>\n```\n<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n    <meta charset=\"UTF-8\">\n    <title>vue.js测试 - 代码之美专栏</title>\n    <!-- author:昌维 代码之美 https://zhuanlan.zhihu.com/codes -->\n    <script src=\"https://unpkg.com/vue/dist/vue.js\"></script>\n</head>\n<body>\n    <div id=\"app\">\n        <input type=\"text\" name=\"\" value=\"\" placeholder=\"在这里输入文字，下面会跟着变化\" v-model=\"message\">\n        <hr>\n        <p>{{ message }}</p>\n    </div>\n    <script type=\"text/javascript\">\n        var app = new Vue({\n          el: \'#app\',\n          data: {\n            message: \'Hello Vue!\'\n          }\n        })\n    </script>\n</body>\n</html>\n\n\n```\n\n    \n是不是会发现一个很神奇的现象，文本框里面输入的文字和后面的p标签中的内容一起变化？\n\n换句话说，p标签里面通过{{ message }}这个写法与input标签中的value绑定在了一起，其中变化，另外一个和它绑定的数据就跟着变化。\n\n结合标题来说，就是vue.js会自动响应数据的变化情况，并且根据用户在代码中预先写好的绑定关系，对所有绑定在一起的数据和视图内容都进行修改。而这种绑定关系，在图上是以input 标签的v-model属性来声明的，因此你在别的地方可能也会看到有人粗略的称vue.js为声明式渲染的模版引擎。\n7.组件化开发\n\n还记得在传统前端开发的时候，我们都是每个人做一个页面，然后最后套入各种后端模版引擎，比如说PHP的Smarty或者Java的JSP等等。\n\n但是现在我们做单页应用，页面交互和结构十分复杂，一个页面上就有许许多多的模块需要编写，而且往往一个模块的代码量和工作量就非常庞大，如果还按照原先的方法来开发，那么会累死人。而且遇到以后的产品需求变更，修改起来也非常麻烦，生怕动了其中一个div之后，其他div跟着雪崩，整个页面全部乱套，或者由于JavaScript的事件冒泡机制，导致修改一些内层的DOM事件处理函数之后，出现各种莫名其妙的诡异BUG。\n\n在面向对象编程中，我们可以使用面向对象的思想将各种模块打包成类或者把一个大的业务模块拆分成更多更小的几个类。在面向过程编程中，我们也可以把一些大功能拆分成许多函数，然后分配给不同的人来开发。\n\n在前端应用，我们是否也可以像编程一样把模块封装呢？这就引入了组件化开发的思想。\n\nVue.js通过组件，把一个单页应用中的各种模块拆分到一个一个单独的组件（component）中，我们只要先在父级应用中写好各种组件标签（占坑），并且在组件标签中写好要传入组件的参数（就像给函数传入参数一样，这个参数叫做组件的属性），然后再分别写好各种组件的实现（填坑），然后整个应用就算做完了。\n8.Virtual DOM\n\n现在的网速越来越快了，很多人家里都是几十甚至上百M的光纤，手机也是4G起步了，按道理一个网页才几百K，而且浏览器本身还会缓存很多资源文件，那么几十M的光纤为什么打开一个之前已经打开过，已经有缓存的页面还是感觉很慢呢？这就是因为浏览器本身处理DOM也是有性能瓶颈的，尤其是在传统开发中，用JQuery或者原生的JavaScript DOM操作函数对DOM进行频繁操作的时候，浏览器要不停的渲染新的DOM树，导致页面看起来非常卡顿。\n\n而Virtual DOM则是虚拟DOM的英文，简单来说，他就是一种可以预先通过JavaScript进行各种计算，把最终的DOM操作计算出来并优化，由于这个DOM操作属于预处理操作，并没有真实的操作DOM，所以叫做虚拟DOM。最后在计算完毕才真正将DOM操作提交，将DOM操作变化反映到DOM树上。\n\n对于vue.js的Virtual DOM，目前业界有着褒贬不一的评价。有人认为Vue.js作为一个轻量级框架，引入Virtual DOM会加大Vue.js本身的代码尺寸，也会消耗更多CPU（手机上会更耗电）（注意：消耗更多的CPU并不意味着会更卡，因为JavaScript计算是后台计算，他的计算量还不至于让DOM操作变得卡顿），并且在操作单个DOM元素的时候，反而多了一道计算工序，会更慢。但也有人认为基本上会用Vue.js开发的都是页面中内容很多的元素，肯定操作的DOM量级普遍较大，平均一下还是比较划算的。\n9.我到底该怎么用Vue.js做单页应用开发？\n\n说了这么多，我还是不知道怎么用它做出一个像知乎那样的页面啊，到底怎么学它呢？\n\n前面我们看了一个响应式的数据绑定案例，那只是一个DEMO，而且也看不出有什么实际意义，离真正的单页应用程序还差得远，到底怎么用它开发真实的项目呢？\n\n我的建议是，先把介绍 - vue.js官方文档的基础部分硬着头皮看一遍。除了组件这个小节涉及到了很多晦涩难懂的名词以外，前面几章完全就是把Vue.js当作一个模版引擎来用。\n\n然后开始学习ECMAScript6，Webpack，NPM以及Vue-Cli的基本用法，最好对Node.js也要有所了解。\n\n最后组件部分先大致看一遍，了解组件里面都有哪些概念之后，开始看网上各种实战视频以及文章还有别人开源的源代码。\n10.在前面你提到过好几次ECMAScript，这是啥？\n\nECMAScript听名字好像和JavaScript很像，难不成他们有什么千丝万缕的联系？\n\n没错你猜对了，他们之间还真有着很深的联系。\n\n引用阮一峰老师的话：（ECMAScript 6入门）\n\n    要讲清楚这个问题，需要回顾历史。1996年11月，JavaScript 的创造者 Netscape 公司，决定将 JavaScript 提交给国际标准化组织ECMA，希望这种语言能够成为国际标准。次年，ECMA 发布262号标准文件（ECMA-262）的第一版，规定了浏览器脚本语言的标准，并将这种语言称为 ECMAScript，这个版本就是1.0版。\n\n    该标准从一开始就是针对 JavaScript 语言制定的，但是之所以不叫 JavaScript，有两个原因。一是商标，Java 是 Sun 公司的商标，根据授权协议，只有 Netscape 公司可以合法地使用 JavaScript 这个名字，且 JavaScript 本身也已经被 Netscape 公司注册为商标。二是想体现这门语言的制定者是 ECMA，不是 Netscape，这样有利于保证这门语言的开放性和中立性。\n\n    因此，ECMAScript 和 JavaScript 的关系是，前者是后者的规格，后者是前者的一种实现（另外的 ECMAScript 方言还有 Jscript 和 ActionScript）。日常场合，这两个词是可以互换的。\n\n而ECMAScript6就是新一代的JavaScript语言。\n\n这里也强烈推荐大家学习ECMAScript6的时候参考这本书ECMAScript 6入门\n11.我在学习Vue.js的时候老是听到Webpack，这是啥？\n\nWebpack是一个前端打包和构建工具。如果你之前一直是手写HTML，CSS，JavaScript，并且通过link标签将CSS引入你的HTML文件，以及通过Script标签的src属性引入外部的JS脚本，那么你肯定会对这个工具感到陌生。不要紧，我们先来了解一下为什么要用Webpack，然后带着原因去学习就好了。\n12.为什么要用Webpack\n\n前面说了，做一个单页应用程序本身就相当复杂，而且在做的时候肯定会使用到很多素材和别的第三方库，我们该如何去管理这些东西呢？\n\n还有前面讲到了Webpack是一个前端打包工具，前端代码为什么要打包呢？因为单页应用程序中用到很多素材，如果每一个素材都通过在HTML中以src属性或者link来引入，那么请求一个页面的时候，可能浏览器就要发起十多次请求，往往请求的这些资源都是一些脚本代码或者很小的图片，这些资源本身才几k，下载连1秒都不需要，但是由于HTTP是应用层协议，它的下层是TCP这个运输层协议，TCP的握手和挥手过程消耗的时间可能比下载资源本身还要长，所以需要把这些小文件全部打包成一个文件，这样只要一次TCP握手和挥手的过程，就把多个资源给下载下来了，并且多个资源由于都是共享一个HTTP请求，所以head等部分也是共享的，相当于形成了规模效应，让网页展现更快，用户体验更好。\n\n前面说到Webpack还有构建的功能，这就不得不提到了ECMAScript6这个新版本的JavaScript，但是现在国内外还有很多人用着老版本的浏览器，这些浏览器并不支持ECMAScript6，那么我们的前端项目如何在这种浏览器上运行呢？这就需要Webpack的Loader自动载入一个转换器来将我们写的ECMAScript6转换成浏览器能支持的老版本JavaScript语言，这个转换器的名字叫做babel，如果你以后听到或者看到了这个单词，应该要知道它就是一个ECMAScript6 to 老版本JavaScript的转换器了。这也是Webpack的构建功能。当然对前端有更深入的同学还会知道Sass，Less，stylus之类的CSS预处理器，我们也可以通过在Loader中编写特定的规则来实现自动将这些CSS预处理语言转换成普通浏览器能识别的CSS代码。\n\n开头的介绍提到了vue.js可以使用单文件组件开发项目，其实也是通过Webpack将单文件组件中的模版，样式以及JS转换到主页面中\n\n当然Webpack不止这点功能，它还可以通过安装各种插件来扩展，比如说热加载技术，就是解放键盘的F5键。让我们修改代码，并且按Ctrl+S保存之后，浏览器页面自动刷新变化，不需要我们去手动刷新，还有一些插件可以自动添加注释，自动给CSS代码加上一些浏览器内核对CSS3兼容前缀，就像webkit-xxx之类的一样。\n13.NPM和Node.js又是什么？它们是什么关系？\n\n首先讲讲node.js。我们知道通常情况下，JavaScript的运行环境都是浏览器，因此JavaScript的能力也就局限于浏览器能赋予它的权限了。比如说读写本地系统文件这种操作，一般情况下运行在浏览器中的JavaScript代码是没有这个操作权限的。如果我们想用JavaScript写出一些能够运行在操作系统上的，能够具有像PHP，JAVA之类的编程语言具有的功能的程序该怎么办呢？Node.js就解决了这个问题。Node.js是一个服务端的JavaScript运行环境，通过Node.js可以实现用JavaScript写独立程序。像我们之前提到的Webpack就是Node.js写的，所以作为一个前端开发，即使你不用Node.js写独立程序，也得配一个Node.js运行环境，毕竟很多前端工具都是使用它写的。\n\nNPM是一个node.js的包管理器。我们在传统开发的时候，JQuery.js大多都是百度搜索，然后去官网下载，或者直接引入CDN资源，这种方法太过于麻烦。如果以后遇到其他的包，这个包的代码本身可能还调用了其他的包（也称这个包和其他的那几个包存在依赖关系），那么我们要在自己的项目中引入一个包将变得十分困难。现在我们有了NPM这个包管理器，直接可以通过\n\nnpm install xxx包名称\n\n    1\n\n的方式引入它，比如说\n\nnpm install vue\n\n    1\n\n就自动在当前项目文件夹下导入了这个包，并且npm自动下载好了vue这个包依赖的其他包。\n\n至于有的人在按照网上的npm教程配置的时候踩坑了，发现下载速度很慢或者完全下载不了，那是因为我国有着众所周知的原因，网上也有各种解决方法可以解决这个问题，大家多善用搜索引擎。\n\n前面提到了Webpack可以安装各种插件来扩展功能，其实也是通过这种方式扩展。\n\n如果你学过PHP的话，NPM就和PHP里面的Composer差不多。也和CentOS下的yum和Ubuntu下的apt-get差不多。\n14.Vue-CLi又是啥？\n\n它是一个vue.js的脚手架工具。说白了就是一个自动帮你生成好项目目录，配置好Webpack，以及各种依赖包的工具，它可以通过\n\nnpm install vue-cli -g\n\n    1\n\n的方式安装，后面的-g表示全局安装的意思，意味着你可以打开命令行之后直接通过vue命令调用它。\n15.我该不该学Vue.js？\n\n现在Vue.js无论是发展势头还是作者支持还是很好的，而且它本身中文资料就比较多，教程也很多，现在随随便便打开几个和前端开发有关的知乎专栏，基本上都能见到相关文章，社区也很活跃。\n\n至于你该不该学，取决于你自己，如果你当前只是做做以内容展示为主的项目，或者就是成天用各种CMS建站仿站，并且以后都不打算更换更好的工作，那么可以暂时不用学。如果你开发的项目交互非常多，而且前后端开发都对前后端分离有很清楚的认识，那么可以大胆的学习，并且在实际项目中运用。\n16.Vue.js怎么火起来的？\n\n关于这个问题，网上说法很多，我自己认为主要还是前些年大前端变革太快，而最近一年开始Vue.js+Webpack这个组合开始逐渐稳定下来了，而且已经有了很多中文资料。\n\n对比它的竞争对手AngularJS，新旧版本项目无法平滑升级，变革太大让用户感觉不安稳。\n\n而React本身主流推荐用的是JSX，需要额外学习一门语法（什么？学Vue.js还要学ECMAScript6？现在ECMAScript6是趋势，并不是因为Vue.js才要学的），并且React本身用的是render写法编写模版代码，这让很多用习惯了Smarty等后端模版引擎得人来使用感觉很不适应，现在看来React本身在中国一些论坛社区的火爆程度还是没有Vue.js高。\n\n当然也并不是说除了Vue.js以外其他框架都很差。像知乎新版也是用React开发的，他还是有各自优秀的地方大家可以深入学习之后做出自己的判断。\n17.我在很多地方还看到Vuex和Vue-route，它们又是什么？\n\nVuex是vue的一个状态管理器。用于集中管理一个单页应用程序中的各种状态。\n\nVue-route是vue的一个前端路由器，这个路由器不是我们上网用的路由器，而是一个管理请求入口和页面映射关系的东西。它可以实现对页面局部进行无刷新的替换，让用户感觉就像切换到了网页一样。\n\n要讲清楚这两个东西，又得花费大量篇幅，所以这里只是简单提一下，先学好vue.js本身才是最重要的。\n18.我还在一些地方看到过Vue-resource和Axios，它们又是什么？\n\n我们在传统的前后端不分离的开发中，后端直接把数据通过模版引擎拼接进了返回的HTML中。而现在做单页应用程序属于前后端分离开发，那么这个单页应用程序中的数据就得通过ajax的方式获取，也要通过ajax的方式提交到后端。\n\n在传统开发中我们都是通过xmlhttprequest手动操作，或者通过JQuery的ajax方法来进行数据提交获取。\n\nvue.js本身没有封装ajax操作库，所以我们要通过Vue-resource和Axios来进行ajax操作，而因为种种原因，现在vue.js2.0已经将axios作为官方推荐的ajax库了。\n19.我该学Vue.js2.0还是1.0呢？\n\n现在很多框架和语言都是学新不学旧（Python慢慢也变得如此），因此如果不是为了维护老旧项目，肯定推荐学Vue.js2.0。而且学会了Vue.js2.0，再去学习Vue.js1.0也不是什么难事。\n20.写Vue.js用什么开发工具和电脑呢？\n\n前端开发基本上不需要太高端的电脑都能胜任，现在这个时代是台电脑，装个编辑器都可以做前端开发的。\n\nVue.js的组件文件本质上还是普通的代码文件，所以各种编辑器配合一些语法检查插件就足够了。我自己用的是sublime text 3，安装一些插件之后可以实现.vue单文件组件高亮代码以及各种自动完成。Webstorm中也有类似插件，大家可以在网上各种教学文章的指导下配置好环境。\n\n我用的主题是Monokai，这个主题在大部分显示器下长时间观看眼睛不会很疼。我使用的显示器是LG IPS236，部分显示器有亮度色标调节，我这款显示器调到2.0左右会比较舒适，过低会导致底部的茶色背景变黑，反差较大更加疲劳，过高会导致对比度不足，画面泛白影响调色。\n结语：\n\n可能包括我在内的很多人在看到Vue.js那神奇的双向绑定优雅写法都会有一种非常惊艳，而看到中文文档发布之后有种想立马学习的冲动。可惜大前端终究是大前端，如果一个对于前端各个方面没有深入认识就想着能一步登天，肯定对不起大前端的“大”字。原本看着只想学一个Vue.js，没想到顺带把ECMAScript6，Webpack配置，ESLint配置，bable配置，npm使用，node.js语法，以后vue全家桶中的vuex，vue-route等等等等都学了一遍。前段时间网上也流传出了一个职位叫做Webpack配置工程师，从这里也可以看出弄懂前端这个大杂烩确实不是那么容易。大家一起加油，有什么问题也可以在评论区回复，我会抽空补充在文章内容中。谢谢各位的支持！~', '<p>Vue.js新手入门指南<br />\n最近在逛各大网站，论坛，以及像SegmentFault等编程问答社区，发现Vue.js异常火爆，重复性的提问和内容也很多，楼主自己也趁着这个大前端的热潮，着手学习了一段时间的Vue.js，目前用它正在做自己的结业项目。</p>\n<p>在做的过程中也对Vue.js的官方文档以及其各种特性有了许多认识。作为一个之前以PHP+模版引擎为主的开发，从一个从未接触过除HTML+CSS+JavaScript+jQuery以外的前端技术的人到现在可以独立使用Vue.js以及各种附属的UI库来开发项目，我总结了一些知识和经验想与大家分享。</p>\n<p>下面我就以问答的形式来分享吧。这里假设你仅仅只掌握了HTML+CSS+JavaScript，如果你对JQuery这个前端库，以及各种后端模版语言比如说PHP，JSP还有所了解并且使用过的话那就太好了。<br />\n1.Vue.js是什么？</p>\n<pre><code>Vue.js（读音 /vjuː/, 类似于 view） 是一套构建用户界面的 渐进式框架。与其他重量级框架不同的是，Vue 采用自底向上增量开发的设计。Vue 的核心库只关注视图层，并且非常容易学习，非常容易与其它库或已有项目整合。另一方面，Vue 完全有能力驱动采用单文件组件和 Vue 生态系统支持的库开发的复杂单页应用。\n\nVue.js 的目标是通过尽可能简单的 API 实现响应的数据绑定和组合的视图组件。\n\n如果你是有经验的前端开发者，想知道 Vue.js 与其它库/框架的区别，查看对比其它框架。\n</code></pre>\n<p>这是官网的介绍，是不是觉得非常的抽象非常的官方？看完之后可能还是有很多人不是很懂这个框架到底是用来做什么的，什么是“渐进式框架”？什么是“自底向上增量开发”？什么是“视图层”？什么是“单文件组件”？什么是“复杂的单页应用？”第二段话里面“响应的数据绑定和组合的视图组件”这又是个啥？还有最后一段话，“Vue.js 与其它库/框架的区别”究竟是什么？</p>\n<p>不要担心，如果你慢慢看完这里面的所有问答，一定会对前面那些可能你从未听说过的专业术语有一种恍然大悟的感觉。<br />\n2.Vue.js到底是什么？</p>\n<p>想必现在能看到我这篇文章的人，都是用着APP或者网页版知乎在阅读把。Vue.js就是一个用于搭建类似于网页版知乎这种表单项繁多，且内容需要根据用户的操作进行修改的网页版应用。<br />\n3.单页应用程序（SPA）</p>\n<p>顾名思义，单页应用一般指的就是一个页面就是应用，当然也可以是一个子应用，比如说知乎的一个页面就可以视为一个子应用。单页应用程序中一般交互处理非常多，而且页面中的内容需要根据用户的操作动态变化。<br />\n4.你前面说的网页版知乎我也可以用JQuery写啊，为什么要用Vue.js呢？</p>\n<p>讲到JQuery，就不得不说到JavaScript的DOM操作了。如果你用JQuery来开发一个知乎，那么你就需要用JQuery中的各种DOM操作方法去操作HTML的DOM结构了。</p>\n<p>现在我们把一个网页应用抽象一下，那么HTML中的DOM其实就是视图，一个网页就是通过DOM的组合与嵌套，形成了最基本的视图结构，再通过CSS的修饰，在基本的视图结构上“化妆”让他们看起来更加美观。最后涉及到交互部分，就需要用到JavaScript来接受用户的交互请求，并且通过事件机制来响应用户的交互操作，并且在事件的处理函数中进行各种数据的修改，比如说修改某个DOM中的innerHTML或者innerText部分。</p>\n<p>我们把HTML中的DOM就可以与其他的部分独立开来划分出一个层次，这个层次就叫做视图层。</p>\n<pre><code>Vue 的核心库只关注视图层\n</code></pre>\n<p>我们为什么要把视图层抽取出来并且单独去关注它呢？</p>\n<p>因为在像知乎这种页面元素非常多，结构很庞大的网页中，数据和视图如果全部混杂在一起，像传统开发一样全部混合在HTML中，那么要对它们进行处理会十分的费劲，并且如果其中有几个结构之间存在藕断丝连的关系，那么会导致代码上出现更大的问题，这什么问题呢？</p>\n<p>你是否还记得你当初写JQuery的时候，有写过(’#xxx’).parent().parent().parent()这种代码呢？当你第一次写的时候，你觉得页面元素不多，不就是找这个元素的爸爸的爸爸的爸爸吗，我大不了在注释里面写清楚这个元素的爸爸的爸爸的爸爸不就好了。但是万一过几天之后你的项目组长或者你的产品经理突然对你做的网页提出修改要求，这个修改要求将会影响页面的结构，也就是DOM的关联与嵌套层次要发生改变，那么</p>\n<p>(‘#xxx’).parent().parent().parent()可能就会变成$(‘#xxx’).parent().parent().parent().parent().parent()了。</p>\n<p>这还不算什么，等以后产品迭代越来越快，修改越来越多，而且页面中类似的关联和嵌套DOM元素不止一个，那么修改起来将非常费劲。而且JQuery选择器查找页面元素以及DOM操作本身也是有性能损失的，可能到时候打开这个页面，会变得越来越卡，而你却无从下手。</p>\n<p>当你在编写项目的时候遇到了这种问题，你一定会抱怨，为什么世上会有HTML这种像盗梦空间一样的需要无数div嵌套才能做出页面的语言，为什么当初学JQuery看中的是它简洁的DOM操作，现在却一点也不觉得它有多简洁，难道我学的是假的JQuery？为什么写个代码这么难，你想砸电脑，你想一键盘拍在产品狗的脑袋上，责怪他天天改需求才让你原本花清香茶清味的代码变得如此又臭又长。</p>\n<p>这个时候如果你学过Vue.js，那么这些抱怨将不复存在。<br />\n5.Vue.js为什么能让基于网页的前端应用程序开发起来这么方便？</p>\n<p>因为Vue.js有声明式，响应式的数据绑定，与组件化的开发，并且还使用了Virtual DOM这个看名字就觉得高大上的技术。</p>\n<p>可是这些名词都是啥？<br />\n6.响应式的数据绑定</p>\n<p>这里的响应式不是@media 媒体查询中的响应式布局，而是指vue.js会自动对页面中某些数据的变化做出响应。至于是如何响应的，大家可以先把下面这段代码随便粘贴到一个扩展名为html的文件然后用浏览器打开，随便在文本框里面输入一些文字，观察一下页面变化。</p>\n<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n    <meta charset=\"UTF-8\">\n    <title>vue.js测试 - 代码之美专栏</title>\n    <!-- author:昌维 代码之美 https://zhuanlan.zhihu.com/codes -->\n    <script src=\"https://unpkg.com/vue/dist/vue.js\"></script>\n</head>\n<body>\n    <div id=\"app\">\n        <input type=\"text\" name=\"\" value=\"\" placeholder=\"在这里输入文字，下面会跟着变化\" v-model=\"message\">\n        <hr>\n        <p>{{ message }}</p>\n    </div>\n    <script type=\"text/javascript\">\n        var app = new Vue({\n          el: \'#app\',\n          data: {\n            message: \'Hello Vue!\'\n          }\n        })\n    </script>\n</body>\n</html>\n```\n<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n    <meta charset=\"UTF-8\">\n    <title>vue.js测试 - 代码之美专栏</title>\n    <!-- author:昌维 代码之美 https://zhuanlan.zhihu.com/codes -->\n    <script src=\"https://unpkg.com/vue/dist/vue.js\"></script>\n</head>\n<body>\n    <div id=\"app\">\n        <input type=\"text\" name=\"\" value=\"\" placeholder=\"在这里输入文字，下面会跟着变化\" v-model=\"message\">\n        <hr>\n        <p>{{ message }}</p>\n    </div>\n    <script type=\"text/javascript\">\n        var app = new Vue({\n          el: \'#app\',\n          data: {\n            message: \'Hello Vue!\'\n          }\n        })\n    </script>\n</body>\n</html>\n<pre><code class=\"lang-\">\n    \n是不是会发现一个很神奇的现象，文本框里面输入的文字和后面的p标签中的内容一起变化？\n\n换句话说，p标签里面通过{{ message }}这个写法与input标签中的value绑定在了一起，其中变化，另外一个和它绑定的数据就跟着变化。\n\n结合标题来说，就是vue.js会自动响应数据的变化情况，并且根据用户在代码中预先写好的绑定关系，对所有绑定在一起的数据和视图内容都进行修改。而这种绑定关系，在图上是以input 标签的v-model属性来声明的，因此你在别的地方可能也会看到有人粗略的称vue.js为声明式渲染的模版引擎。\n7.组件化开发\n\n还记得在传统前端开发的时候，我们都是每个人做一个页面，然后最后套入各种后端模版引擎，比如说PHP的Smarty或者Java的JSP等等。\n\n但是现在我们做单页应用，页面交互和结构十分复杂，一个页面上就有许许多多的模块需要编写，而且往往一个模块的代码量和工作量就非常庞大，如果还按照原先的方法来开发，那么会累死人。而且遇到以后的产品需求变更，修改起来也非常麻烦，生怕动了其中一个div之后，其他div跟着雪崩，整个页面全部乱套，或者由于JavaScript的事件冒泡机制，导致修改一些内层的DOM事件处理函数之后，出现各种莫名其妙的诡异BUG。\n\n在面向对象编程中，我们可以使用面向对象的思想将各种模块打包成类或者把一个大的业务模块拆分成更多更小的几个类。在面向过程编程中，我们也可以把一些大功能拆分成许多函数，然后分配给不同的人来开发。\n\n在前端应用，我们是否也可以像编程一样把模块封装呢？这就引入了组件化开发的思想。\n\nVue.js通过组件，把一个单页应用中的各种模块拆分到一个一个单独的组件（component）中，我们只要先在父级应用中写好各种组件标签（占坑），并且在组件标签中写好要传入组件的参数（就像给函数传入参数一样，这个参数叫做组件的属性），然后再分别写好各种组件的实现（填坑），然后整个应用就算做完了。\n8.Virtual DOM\n\n现在的网速越来越快了，很多人家里都是几十甚至上百M的光纤，手机也是4G起步了，按道理一个网页才几百K，而且浏览器本身还会缓存很多资源文件，那么几十M的光纤为什么打开一个之前已经打开过，已经有缓存的页面还是感觉很慢呢？这就是因为浏览器本身处理DOM也是有性能瓶颈的，尤其是在传统开发中，用JQuery或者原生的JavaScript DOM操作函数对DOM进行频繁操作的时候，浏览器要不停的渲染新的DOM树，导致页面看起来非常卡顿。\n\n而Virtual DOM则是虚拟DOM的英文，简单来说，他就是一种可以预先通过JavaScript进行各种计算，把最终的DOM操作计算出来并优化，由于这个DOM操作属于预处理操作，并没有真实的操作DOM，所以叫做虚拟DOM。最后在计算完毕才真正将DOM操作提交，将DOM操作变化反映到DOM树上。\n\n对于vue.js的Virtual DOM，目前业界有着褒贬不一的评价。有人认为Vue.js作为一个轻量级框架，引入Virtual DOM会加大Vue.js本身的代码尺寸，也会消耗更多CPU（手机上会更耗电）（注意：消耗更多的CPU并不意味着会更卡，因为JavaScript计算是后台计算，他的计算量还不至于让DOM操作变得卡顿），并且在操作单个DOM元素的时候，反而多了一道计算工序，会更慢。但也有人认为基本上会用Vue.js开发的都是页面中内容很多的元素，肯定操作的DOM量级普遍较大，平均一下还是比较划算的。\n9.我到底该怎么用Vue.js做单页应用开发？\n\n说了这么多，我还是不知道怎么用它做出一个像知乎那样的页面啊，到底怎么学它呢？\n\n前面我们看了一个响应式的数据绑定案例，那只是一个DEMO，而且也看不出有什么实际意义，离真正的单页应用程序还差得远，到底怎么用它开发真实的项目呢？\n\n我的建议是，先把介绍 - vue.js官方文档的基础部分硬着头皮看一遍。除了组件这个小节涉及到了很多晦涩难懂的名词以外，前面几章完全就是把Vue.js当作一个模版引擎来用。\n\n然后开始学习ECMAScript6，Webpack，NPM以及Vue-Cli的基本用法，最好对Node.js也要有所了解。\n\n最后组件部分先大致看一遍，了解组件里面都有哪些概念之后，开始看网上各种实战视频以及文章还有别人开源的源代码。\n10.在前面你提到过好几次ECMAScript，这是啥？\n\nECMAScript听名字好像和JavaScript很像，难不成他们有什么千丝万缕的联系？\n\n没错你猜对了，他们之间还真有着很深的联系。\n\n引用阮一峰老师的话：（ECMAScript 6入门）\n\n    要讲清楚这个问题，需要回顾历史。1996年11月，JavaScript 的创造者 Netscape 公司，决定将 JavaScript 提交给国际标准化组织ECMA，希望这种语言能够成为国际标准。次年，ECMA 发布262号标准文件（ECMA-262）的第一版，规定了浏览器脚本语言的标准，并将这种语言称为 ECMAScript，这个版本就是1.0版。\n\n    该标准从一开始就是针对 JavaScript 语言制定的，但是之所以不叫 JavaScript，有两个原因。一是商标，Java 是 Sun 公司的商标，根据授权协议，只有 Netscape 公司可以合法地使用 JavaScript 这个名字，且 JavaScript 本身也已经被 Netscape 公司注册为商标。二是想体现这门语言的制定者是 ECMA，不是 Netscape，这样有利于保证这门语言的开放性和中立性。\n\n    因此，ECMAScript 和 JavaScript 的关系是，前者是后者的规格，后者是前者的一种实现（另外的 ECMAScript 方言还有 Jscript 和 ActionScript）。日常场合，这两个词是可以互换的。\n\n而ECMAScript6就是新一代的JavaScript语言。\n\n这里也强烈推荐大家学习ECMAScript6的时候参考这本书ECMAScript 6入门\n11.我在学习Vue.js的时候老是听到Webpack，这是啥？\n\nWebpack是一个前端打包和构建工具。如果你之前一直是手写HTML，CSS，JavaScript，并且通过link标签将CSS引入你的HTML文件，以及通过Script标签的src属性引入外部的JS脚本，那么你肯定会对这个工具感到陌生。不要紧，我们先来了解一下为什么要用Webpack，然后带着原因去学习就好了。\n12.为什么要用Webpack\n\n前面说了，做一个单页应用程序本身就相当复杂，而且在做的时候肯定会使用到很多素材和别的第三方库，我们该如何去管理这些东西呢？\n\n还有前面讲到了Webpack是一个前端打包工具，前端代码为什么要打包呢？因为单页应用程序中用到很多素材，如果每一个素材都通过在HTML中以src属性或者link来引入，那么请求一个页面的时候，可能浏览器就要发起十多次请求，往往请求的这些资源都是一些脚本代码或者很小的图片，这些资源本身才几k，下载连1秒都不需要，但是由于HTTP是应用层协议，它的下层是TCP这个运输层协议，TCP的握手和挥手过程消耗的时间可能比下载资源本身还要长，所以需要把这些小文件全部打包成一个文件，这样只要一次TCP握手和挥手的过程，就把多个资源给下载下来了，并且多个资源由于都是共享一个HTTP请求，所以head等部分也是共享的，相当于形成了规模效应，让网页展现更快，用户体验更好。\n\n前面说到Webpack还有构建的功能，这就不得不提到了ECMAScript6这个新版本的JavaScript，但是现在国内外还有很多人用着老版本的浏览器，这些浏览器并不支持ECMAScript6，那么我们的前端项目如何在这种浏览器上运行呢？这就需要Webpack的Loader自动载入一个转换器来将我们写的ECMAScript6转换成浏览器能支持的老版本JavaScript语言，这个转换器的名字叫做babel，如果你以后听到或者看到了这个单词，应该要知道它就是一个ECMAScript6 to 老版本JavaScript的转换器了。这也是Webpack的构建功能。当然对前端有更深入的同学还会知道Sass，Less，stylus之类的CSS预处理器，我们也可以通过在Loader中编写特定的规则来实现自动将这些CSS预处理语言转换成普通浏览器能识别的CSS代码。\n\n开头的介绍提到了vue.js可以使用单文件组件开发项目，其实也是通过Webpack将单文件组件中的模版，样式以及JS转换到主页面中\n\n当然Webpack不止这点功能，它还可以通过安装各种插件来扩展，比如说热加载技术，就是解放键盘的F5键。让我们修改代码，并且按Ctrl+S保存之后，浏览器页面自动刷新变化，不需要我们去手动刷新，还有一些插件可以自动添加注释，自动给CSS代码加上一些浏览器内核对CSS3兼容前缀，就像webkit-xxx之类的一样。\n13.NPM和Node.js又是什么？它们是什么关系？\n\n首先讲讲node.js。我们知道通常情况下，JavaScript的运行环境都是浏览器，因此JavaScript的能力也就局限于浏览器能赋予它的权限了。比如说读写本地系统文件这种操作，一般情况下运行在浏览器中的JavaScript代码是没有这个操作权限的。如果我们想用JavaScript写出一些能够运行在操作系统上的，能够具有像PHP，JAVA之类的编程语言具有的功能的程序该怎么办呢？Node.js就解决了这个问题。Node.js是一个服务端的JavaScript运行环境，通过Node.js可以实现用JavaScript写独立程序。像我们之前提到的Webpack就是Node.js写的，所以作为一个前端开发，即使你不用Node.js写独立程序，也得配一个Node.js运行环境，毕竟很多前端工具都是使用它写的。\n\nNPM是一个node.js的包管理器。我们在传统开发的时候，JQuery.js大多都是百度搜索，然后去官网下载，或者直接引入CDN资源，这种方法太过于麻烦。如果以后遇到其他的包，这个包的代码本身可能还调用了其他的包（也称这个包和其他的那几个包存在依赖关系），那么我们要在自己的项目中引入一个包将变得十分困难。现在我们有了NPM这个包管理器，直接可以通过\n\nnpm install xxx包名称\n\n    1\n\n的方式引入它，比如说\n\nnpm install vue\n\n    1\n\n就自动在当前项目文件夹下导入了这个包，并且npm自动下载好了vue这个包依赖的其他包。\n\n至于有的人在按照网上的npm教程配置的时候踩坑了，发现下载速度很慢或者完全下载不了，那是因为我国有着众所周知的原因，网上也有各种解决方法可以解决这个问题，大家多善用搜索引擎。\n\n前面提到了Webpack可以安装各种插件来扩展功能，其实也是通过这种方式扩展。\n\n如果你学过PHP的话，NPM就和PHP里面的Composer差不多。也和CentOS下的yum和Ubuntu下的apt-get差不多。\n14.Vue-CLi又是啥？\n\n它是一个vue.js的脚手架工具。说白了就是一个自动帮你生成好项目目录，配置好Webpack，以及各种依赖包的工具，它可以通过\n\nnpm install vue-cli -g\n\n    1\n\n的方式安装，后面的-g表示全局安装的意思，意味着你可以打开命令行之后直接通过vue命令调用它。\n15.我该不该学Vue.js？\n\n现在Vue.js无论是发展势头还是作者支持还是很好的，而且它本身中文资料就比较多，教程也很多，现在随随便便打开几个和前端开发有关的知乎专栏，基本上都能见到相关文章，社区也很活跃。\n\n至于你该不该学，取决于你自己，如果你当前只是做做以内容展示为主的项目，或者就是成天用各种CMS建站仿站，并且以后都不打算更换更好的工作，那么可以暂时不用学。如果你开发的项目交互非常多，而且前后端开发都对前后端分离有很清楚的认识，那么可以大胆的学习，并且在实际项目中运用。\n16.Vue.js怎么火起来的？\n\n关于这个问题，网上说法很多，我自己认为主要还是前些年大前端变革太快，而最近一年开始Vue.js+Webpack这个组合开始逐渐稳定下来了，而且已经有了很多中文资料。\n\n对比它的竞争对手AngularJS，新旧版本项目无法平滑升级，变革太大让用户感觉不安稳。\n\n而React本身主流推荐用的是JSX，需要额外学习一门语法（什么？学Vue.js还要学ECMAScript6？现在ECMAScript6是趋势，并不是因为Vue.js才要学的），并且React本身用的是render写法编写模版代码，这让很多用习惯了Smarty等后端模版引擎得人来使用感觉很不适应，现在看来React本身在中国一些论坛社区的火爆程度还是没有Vue.js高。\n\n当然也并不是说除了Vue.js以外其他框架都很差。像知乎新版也是用React开发的，他还是有各自优秀的地方大家可以深入学习之后做出自己的判断。\n17.我在很多地方还看到Vuex和Vue-route，它们又是什么？\n\nVuex是vue的一个状态管理器。用于集中管理一个单页应用程序中的各种状态。\n\nVue-route是vue的一个前端路由器，这个路由器不是我们上网用的路由器，而是一个管理请求入口和页面映射关系的东西。它可以实现对页面局部进行无刷新的替换，让用户感觉就像切换到了网页一样。\n\n要讲清楚这两个东西，又得花费大量篇幅，所以这里只是简单提一下，先学好vue.js本身才是最重要的。\n18.我还在一些地方看到过Vue-resource和Axios，它们又是什么？\n\n我们在传统的前后端不分离的开发中，后端直接把数据通过模版引擎拼接进了返回的HTML中。而现在做单页应用程序属于前后端分离开发，那么这个单页应用程序中的数据就得通过ajax的方式获取，也要通过ajax的方式提交到后端。\n\n在传统开发中我们都是通过xmlhttprequest手动操作，或者通过JQuery的ajax方法来进行数据提交获取。\n\nvue.js本身没有封装ajax操作库，所以我们要通过Vue-resource和Axios来进行ajax操作，而因为种种原因，现在vue.js2.0已经将axios作为官方推荐的ajax库了。\n19.我该学Vue.js2.0还是1.0呢？\n\n现在很多框架和语言都是学新不学旧（Python慢慢也变得如此），因此如果不是为了维护老旧项目，肯定推荐学Vue.js2.0。而且学会了Vue.js2.0，再去学习Vue.js1.0也不是什么难事。\n20.写Vue.js用什么开发工具和电脑呢？\n\n前端开发基本上不需要太高端的电脑都能胜任，现在这个时代是台电脑，装个编辑器都可以做前端开发的。\n\nVue.js的组件文件本质上还是普通的代码文件，所以各种编辑器配合一些语法检查插件就足够了。我自己用的是sublime text 3，安装一些插件之后可以实现.vue单文件组件高亮代码以及各种自动完成。Webstorm中也有类似插件，大家可以在网上各种教学文章的指导下配置好环境。\n\n我用的主题是Monokai，这个主题在大部分显示器下长时间观看眼睛不会很疼。我使用的显示器是LG IPS236，部分显示器有亮度色标调节，我这款显示器调到2.0左右会比较舒适，过低会导致底部的茶色背景变黑，反差较大更加疲劳，过高会导致对比度不足，画面泛白影响调色。\n结语：\n\n可能包括我在内的很多人在看到Vue.js那神奇的双向绑定优雅写法都会有一种非常惊艳，而看到中文文档发布之后有种想立马学习的冲动。可惜大前端终究是大前端，如果一个对于前端各个方面没有深入认识就想着能一步登天，肯定对不起大前端的“大”字。原本看着只想学一个Vue.js，没想到顺带把ECMAScript6，Webpack配置，ESLint配置，bable配置，npm使用，node.js语法，以后vue全家桶中的vuex，vue-route等等等等都学了一遍。前段时间网上也流传出了一个职位叫做Webpack配置工程师，从这里也可以看出弄懂前端这个大杂烩确实不是那么容易。大家一起加油，有什么问题也可以在评论区回复，我会抽空补充在文章内容中。谢谢各位的支持！~</code></pre>\n', 2, 0, 0, NULL, 1, '2020-05-15 20:42:52', '2020-05-15 20:43:05', '0');
INSERT INTO `blog_article` VALUES (1005, 1, '一点点梵', '中美科技战战鼓已经擂响 ', '生活', '该来的迟早要来的，尤其在技术制裁方面，美国人从不食言。\n\n\n在前一段时间美国政府威胁要求台积电断供华为后，昨天（5月15日），美国商务部正式发布公告，确定将对使用美国技术向华为供货的全球厂商进行限制，所有厂商，一律需要提前获得美国政府的许可证，才可继续向华为供货。\n给大家划几个重点：\n\n\n1、此次限制措施仅针对华为一家公司，而不是全部中国企业。\n\n2、限制对象不仅仅是美国公司，而是全球华为供应链公司。\n\n3、并非是完全禁止供货，而是需先获得美国政府许可证才可供货。\n\n4、并没有对采用美国技术的比例做限制，连之前曝光的10%低门限都没了，直接就是使用了就算。\n\n\n这条新规简单来说，就是举美国及其全球盟友之力，发动全球科技行业针对一家中国公司，进行全方位无死角打击。\n\n不但华为的核心芯片代工厂台积电要受到影响，华为的一些日本韩国供应商要受到影响，甚至连中国兄弟中芯国际理论上也要受到影响。\n\n\n世界上几乎没有任何一家高科技企业可以脱离任何美国技术而存在，这就是现实。\n\n\n如果新规完全落实，假如华为供货商们向美国申请许可证后，美国商务部全部拒绝，会有什么后果？\n\n\n那就是真是华为生死存亡的时刻到来了。就算是华为目前也无法完全与美国技术脱钩，更别说华为的大小供应商们了。\n\n\n在之前一篇文章华为的冬天可能真的要来了中，我提到过，华为轮值董事长徐直军也无奈的表示，如果美国真的实施断供升级新规，华为确实没有太多办法，希望政府能够介入采取反制措施。\n这一次，美国人的官宣来了。中国政府也确实没有坐视不管。\n\n\n昨晚，向来可以代表政府官方态度的环球时报总编辑胡锡进在推特上发布推文，非常直接的表示：\n\n\n据我所知，如果美国政府实施对华为的更进一步的技术封锁，中国政府将实施“不可靠实体清单”反制高通、思科、苹果，方式为对这些美国科技公司进行限制或者调查。另外，中国将会停止采购波音飞机。\n\n胡总编的“据我所知”，那就绝非是道听途说了，他敢说出这话，说明已经提前获取了官方消息。\n\n\n什么是“不可靠实体清单”？其实就是中国政府面对国内公司近年频频被美方加入“实体清单”进行限制、断供的局面，制定的一个反制清单。\n\n\n那么什么样的公司会被加入“不可靠实体清单”呢？\n\n\n一是该实体存在针对中国实体实施封锁、断供或其他歧视性措施的行为；\n\n二是该实体行为基于非商业目的，违背市场规则和契约精神；\n\n三是该实体行为对中国企业或相关产业造成实质损害；\n\n四是该实体行为对国家安全构成威胁或潜在威胁。\n\n\n先不说这二三四条，就第一条，绝大多数美国公司和配合美国实施断供的公司，都是可以被“轻松”列入的。\n\n\n那么被列入清单有什么后果？官方声明是，中方将依据《对外贸易法》《反垄断法》《国家安全法》等有关法律法规和行政规章，对列入清单的实体采取任何必要的法律和行政措施。\n\n\n虽然没明说，但是可以说一旦贵公司真的进“黑名单”了，你就不要在中国做生意了。。\n\n\n而胡总编提到的几家公司，无一不高度依赖中国市场。其中高通营收来自中国比例超过60%，毫不客气的说是中国的小米、OPPO、VIVO等手机厂商与中国庞大的手机用户市场养活了高通\n苹果虽然对中国市场依赖度没有那么高，但超过20%的收入如果丢掉了，可不仅仅是肉疼，这可是一个大腿就被人锯掉了。\n波音营收来自中国比例达到13%，数字虽然不大，但是地球人都知道中国在民航市场发展的潜力是巨大的。要知道，这是一个还有10亿人没坐过飞机、潜在机场需求2000多个、2020年规划机场超过500个的发展中国家。\n\n所以，一旦美国实施对华为的升级断供、中国将美国高科技公司加入“不可靠清单”进行反制，那么毫无疑问，中美两个经济、科技大国正式开打科技战，而夹在中间的无数全球科技公司，将不得不接受选边站的尴尬局面。\n\n\n美国得罪的起吗？当然得罪不起，毕竟还得靠美国技术吃饭呢。\n\n\n中国的市场丢的起吗？14亿人口的基数、高速的经济增长，这样的市场扔掉了，不死也是半残。\n\n\n以受本次政策影响比较严重的芯片代工厂中国台湾企业台积电为例，华为全部高端芯片几乎都在台积电代工生产，而且，华为已经在2020年成为台积电的第二大客户。\n\n台积电在美国和华为之间艰难的“夹缝生存”，甚至这两天破天荒的宣布要将最先进的5nm制程芯片工厂建在美国，个人感觉就是台积电对美国政府的一个投名状，我把高科技岗位和投资给您了，华为的许可证，您批下吧。。\n而其他高科技公司尤其是全球芯片公司会不会因为想换来中国市场的许可证也同样采取在美国投资建厂的方式？我觉得是可能的。\n\n\n当然，中国政府在芯片产业扶持上近期也是动作频频。为了培育中国芯片产业，2014年《国家集成电路产业发展推进纲要》出台，随后，1380亿元的国家集成电路产业投资基金（俗称“大基金一期”）正式成立，专注国内芯片上下游产业链公司的投资。\n\n\n而相比大基金一期资金量接近翻倍的注册资本达到2000亿以上的国家大基金二期，近期火力全开，先是向中国芯片设计龙头企业紫光展锐投资22.5亿元，前几天又向对标台积电的本土芯片代工厂中芯国际投资15亿，美金。\n\n\n另外，大基金二期官方表示，二期基金积极支持湖北产业发展，已推动两个重大项目在湖北落地，分别是总投资规模800亿元左右的长江存储，以及总投资规模120亿元的三安光电，目前项目推进顺利。\n\n\n国家在几年前根本没人关注的芯片半导体行业砸下血本，也使得芯片行业的公司有了购买设备、招纳人才的本钱，这几年芯片行业相关岗位的工资也是水涨船高，大有超过互联网公司的架势。当然，国内芯片公司的技术能力也在开挂一样的进步中。\n\n\n比如芯片代工龙头中芯国际，已经具备为华为低端手机代工芯片的能力，虽然仅仅是低端手机，但是智能手机芯片制造在几年前还是国内芯片代工厂不敢企及的领域。\n\n\n\n在科技行业的顶点——芯片领域这个主战场，中美已经开始交战，中国已经坚定的走在了芯片国产替代的道路上。\n\n\n未来，在科技行业的各个细分领域，就算美国还没有进行断供，相信涉及到的国内公司也是胆战心惊，因为做大了早晚自己也会成为下一个华为。\n\n\n美国此次疯狗一样的撕咬华为，一定是坏事吗？这么看也未必，就算一个华为倒下了，如果能使得千千万万的华为站起来，那么这没准就是中美科技差距逐步缩小甚至逆转的开始。\n\n\n当然，我觉得华为不会倒。\n\n\n近期优质好文：\n\n1、一家没有华为中兴爱立信的5G联盟成立了\n\n2、中国芯片界开始动真格了\n\n3、能扼住华为命运咽喉的台积电，是怎样炼成的？\n\n4、运营商们反击微信的时刻到了\n\n5、全村人希望的中芯国际，依然道阻且长\n\n\n\n\n\n', '<p>该来的迟早要来的，尤其在技术制裁方面，美国人从不食言。</p>\n<p>在前一段时间美国政府威胁要求台积电断供华为后，昨天（5月15日），美国商务部正式发布公告，确定将对使用美国技术向华为供货的全球厂商进行限制，所有厂商，一律需要提前获得美国政府的许可证，才可继续向华为供货。<br />\n给大家划几个重点：</p>\n<p>1、此次限制措施仅针对华为一家公司，而不是全部中国企业。</p>\n<p>2、限制对象不仅仅是美国公司，而是全球华为供应链公司。</p>\n<p>3、并非是完全禁止供货，而是需先获得美国政府许可证才可供货。</p>\n<p>4、并没有对采用美国技术的比例做限制，连之前曝光的10%低门限都没了，直接就是使用了就算。</p>\n<p>这条新规简单来说，就是举美国及其全球盟友之力，发动全球科技行业针对一家中国公司，进行全方位无死角打击。</p>\n<p>不但华为的核心芯片代工厂台积电要受到影响，华为的一些日本韩国供应商要受到影响，甚至连中国兄弟中芯国际理论上也要受到影响。</p>\n<p>世界上几乎没有任何一家高科技企业可以脱离任何美国技术而存在，这就是现实。</p>\n<p>如果新规完全落实，假如华为供货商们向美国申请许可证后，美国商务部全部拒绝，会有什么后果？</p>\n<p>那就是真是华为生死存亡的时刻到来了。就算是华为目前也无法完全与美国技术脱钩，更别说华为的大小供应商们了。</p>\n<p>在之前一篇文章华为的冬天可能真的要来了中，我提到过，华为轮值董事长徐直军也无奈的表示，如果美国真的实施断供升级新规，华为确实没有太多办法，希望政府能够介入采取反制措施。<br />\n这一次，美国人的官宣来了。中国政府也确实没有坐视不管。</p>\n<p>昨晚，向来可以代表政府官方态度的环球时报总编辑胡锡进在推特上发布推文，非常直接的表示：</p>\n<p>据我所知，如果美国政府实施对华为的更进一步的技术封锁，中国政府将实施“不可靠实体清单”反制高通、思科、苹果，方式为对这些美国科技公司进行限制或者调查。另外，中国将会停止采购波音飞机。</p>\n<p>胡总编的“据我所知”，那就绝非是道听途说了，他敢说出这话，说明已经提前获取了官方消息。</p>\n<p>什么是“不可靠实体清单”？其实就是中国政府面对国内公司近年频频被美方加入“实体清单”进行限制、断供的局面，制定的一个反制清单。</p>\n<p>那么什么样的公司会被加入“不可靠实体清单”呢？</p>\n<p>一是该实体存在针对中国实体实施封锁、断供或其他歧视性措施的行为；</p>\n<p>二是该实体行为基于非商业目的，违背市场规则和契约精神；</p>\n<p>三是该实体行为对中国企业或相关产业造成实质损害；</p>\n<p>四是该实体行为对国家安全构成威胁或潜在威胁。</p>\n<p>先不说这二三四条，就第一条，绝大多数美国公司和配合美国实施断供的公司，都是可以被“轻松”列入的。</p>\n<p>那么被列入清单有什么后果？官方声明是，中方将依据《对外贸易法》《反垄断法》《国家安全法》等有关法律法规和行政规章，对列入清单的实体采取任何必要的法律和行政措施。</p>\n<p>虽然没明说，但是可以说一旦贵公司真的进“黑名单”了，你就不要在中国做生意了。。</p>\n<p>而胡总编提到的几家公司，无一不高度依赖中国市场。其中高通营收来自中国比例超过60%，毫不客气的说是中国的小米、OPPO、VIVO等手机厂商与中国庞大的手机用户市场养活了高通<br />\n苹果虽然对中国市场依赖度没有那么高，但超过20%的收入如果丢掉了，可不仅仅是肉疼，这可是一个大腿就被人锯掉了。<br />\n波音营收来自中国比例达到13%，数字虽然不大，但是地球人都知道中国在民航市场发展的潜力是巨大的。要知道，这是一个还有10亿人没坐过飞机、潜在机场需求2000多个、2020年规划机场超过500个的发展中国家。</p>\n<p>所以，一旦美国实施对华为的升级断供、中国将美国高科技公司加入“不可靠清单”进行反制，那么毫无疑问，中美两个经济、科技大国正式开打科技战，而夹在中间的无数全球科技公司，将不得不接受选边站的尴尬局面。</p>\n<p>美国得罪的起吗？当然得罪不起，毕竟还得靠美国技术吃饭呢。</p>\n<p>中国的市场丢的起吗？14亿人口的基数、高速的经济增长，这样的市场扔掉了，不死也是半残。</p>\n<p>以受本次政策影响比较严重的芯片代工厂中国台湾企业台积电为例，华为全部高端芯片几乎都在台积电代工生产，而且，华为已经在2020年成为台积电的第二大客户。</p>\n<p>台积电在美国和华为之间艰难的“夹缝生存”，甚至这两天破天荒的宣布要将最先进的5nm制程芯片工厂建在美国，个人感觉就是台积电对美国政府的一个投名状，我把高科技岗位和投资给您了，华为的许可证，您批下吧。。<br />\n而其他高科技公司尤其是全球芯片公司会不会因为想换来中国市场的许可证也同样采取在美国投资建厂的方式？我觉得是可能的。</p>\n<p>当然，中国政府在芯片产业扶持上近期也是动作频频。为了培育中国芯片产业，2014年《国家集成电路产业发展推进纲要》出台，随后，1380亿元的国家集成电路产业投资基金（俗称“大基金一期”）正式成立，专注国内芯片上下游产业链公司的投资。</p>\n<p>而相比大基金一期资金量接近翻倍的注册资本达到2000亿以上的国家大基金二期，近期火力全开，先是向中国芯片设计龙头企业紫光展锐投资22.5亿元，前几天又向对标台积电的本土芯片代工厂中芯国际投资15亿，美金。</p>\n<p>另外，大基金二期官方表示，二期基金积极支持湖北产业发展，已推动两个重大项目在湖北落地，分别是总投资规模800亿元左右的长江存储，以及总投资规模120亿元的三安光电，目前项目推进顺利。</p>\n<p>国家在几年前根本没人关注的芯片半导体行业砸下血本，也使得芯片行业的公司有了购买设备、招纳人才的本钱，这几年芯片行业相关岗位的工资也是水涨船高，大有超过互联网公司的架势。当然，国内芯片公司的技术能力也在开挂一样的进步中。</p>\n<p>比如芯片代工龙头中芯国际，已经具备为华为低端手机代工芯片的能力，虽然仅仅是低端手机，但是智能手机芯片制造在几年前还是国内芯片代工厂不敢企及的领域。</p>\n<p>在科技行业的顶点——芯片领域这个主战场，中美已经开始交战，中国已经坚定的走在了芯片国产替代的道路上。</p>\n<p>未来，在科技行业的各个细分领域，就算美国还没有进行断供，相信涉及到的国内公司也是胆战心惊，因为做大了早晚自己也会成为下一个华为。</p>\n<p>美国此次疯狗一样的撕咬华为，一定是坏事吗？这么看也未必，就算一个华为倒下了，如果能使得千千万万的华为站起来，那么这没准就是中美科技差距逐步缩小甚至逆转的开始。</p>\n<p>当然，我觉得华为不会倒。</p>\n<p>近期优质好文：</p>\n<p>1、一家没有华为中兴爱立信的5G联盟成立了</p>\n<p>2、中国芯片界开始动真格了</p>\n<p>3、能扼住华为命运咽喉的台积电，是怎样炼成的？</p>\n<p>4、运营商们反击微信的时刻到了</p>\n<p>5、全村人希望的中芯国际，依然道阻且长</p>\n', 17, 4, 0, NULL, 3, '2020-05-15 21:36:20', '2020-05-16 03:19:49', '1');

-- ----------------------------
-- Table structure for blog_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_tag`;
CREATE TABLE `blog_article_tag`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `article_id` bigint(0) NOT NULL COMMENT '文章ID',
  `tag_id` int(0) NOT NULL COMMENT '标签ID',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1022 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article_tag
-- ----------------------------
INSERT INTO `blog_article_tag` VALUES (1000, 1000, 5, '2018-07-06 18:52:21', '2018-07-06 18:52:21');
INSERT INTO `blog_article_tag` VALUES (1001, 1001, 6, '2018-07-06 18:52:21', '2018-07-06 18:52:21');
INSERT INTO `blog_article_tag` VALUES (1013, 1002, 1, '2020-05-15 20:26:58', '2020-05-15 20:26:58');
INSERT INTO `blog_article_tag` VALUES (1014, 1002, 2, '2020-05-15 20:26:58', '2020-05-15 20:26:58');
INSERT INTO `blog_article_tag` VALUES (1015, 1003, 1, '2020-05-15 20:33:35', '2020-05-15 20:33:35');
INSERT INTO `blog_article_tag` VALUES (1016, 1003, 2, '2020-05-15 20:33:35', '2020-05-15 20:33:35');
INSERT INTO `blog_article_tag` VALUES (1017, 1003, 4, '2020-05-15 20:33:35', '2020-05-15 20:33:35');
INSERT INTO `blog_article_tag` VALUES (1018, 1004, 5, '2020-05-15 20:42:52', '2020-05-15 20:42:52');
INSERT INTO `blog_article_tag` VALUES (1019, 1004, 8, '2020-05-15 20:42:52', '2020-05-15 20:42:52');
INSERT INTO `blog_article_tag` VALUES (1020, 1004, 7, '2020-05-15 20:42:52', '2020-05-15 20:42:52');
INSERT INTO `blog_article_tag` VALUES (1021, 1004, 6, '2020-05-15 20:42:52', '2020-05-15 20:42:52');
INSERT INTO `blog_article_tag` VALUES (1022, 1005, 9, '2020-05-15 21:36:20', '2020-05-15 21:36:20');

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `category_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别名字',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别图标',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类描述',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES (1, '前端', 'font_end.jpg', NULL, '2018-07-06 14:50:52');
INSERT INTO `blog_category` VALUES (2, '后端', 'end_back.jpg', NULL, '2018-07-06 14:50:52');
INSERT INTO `blog_category` VALUES (3, '生活', 'life.jpg', NULL, '2018-07-06 14:50:52');
INSERT INTO `blog_category` VALUES (4, '数据库', 'database.jpg', NULL, '2018-07-06 14:50:52');
INSERT INTO `blog_category` VALUES (5, '爱情', 'love.jpg', NULL, '2018-07-06 14:50:52');

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '用户ID',
  `article_id` bigint(0) NULL DEFAULT NULL COMMENT '文章ID',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `parent_id` bigint(0) NULL DEFAULT NULL COMMENT '父评论Id',
  `to_uid` bigint(0) NULL DEFAULT NULL COMMENT '评论的评论用户ID',
  `level_flag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论级别',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------
INSERT INTO `blog_comment` VALUES (100, 1, 1000, '你是我的小猪猪\n', NULL, NULL, '0', '2020-05-15 13:17:50', '2020-05-15 13:17:50');
INSERT INTO `blog_comment` VALUES (102, 1, 1005, 'aaa', NULL, NULL, '0', '2020-06-01 13:08:41', '2020-06-01 13:08:41');
INSERT INTO `blog_comment` VALUES (103, 1, 1005, 'aaaaccccc', NULL, NULL, '1', '2020-06-01 13:09:24', '2020-06-01 13:09:24');
INSERT INTO `blog_comment` VALUES (104, 1, 1005, '三楼', NULL, 1, '2', '2020-06-01 13:10:21', '2020-06-01 13:10:21');
INSERT INTO `blog_comment` VALUES (105, 1, 1005, 'nnnn', NULL, 1, '2', '2020-06-01 13:11:16', '2020-06-01 13:11:16');

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tag_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名字',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签图标',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES (1, 'Java', 'java.jpg', '2018-07-06 14:40:41', NULL);
INSERT INTO `blog_tag` VALUES (2, 'Spring', 'spring.jpg', '2018-07-06 14:46:55', NULL);
INSERT INTO `blog_tag` VALUES (3, 'Hibernate', 'hibernate.jpg', '2018-07-06 14:46:55', NULL);
INSERT INTO `blog_tag` VALUES (4, 'Maven', 'maven.jpg', '2018-07-06 14:46:55', NULL);
INSERT INTO `blog_tag` VALUES (5, 'Html', 'html.jpg', '2018-07-06 14:46:55', NULL);
INSERT INTO `blog_tag` VALUES (6, 'JavaScript', 'js.jpg', '2018-07-06 14:46:55', NULL);
INSERT INTO `blog_tag` VALUES (7, 'Vue', 'vue.jpg', '2018-07-06 14:46:55', NULL);
INSERT INTO `blog_tag` VALUES (8, 'Css', 'css.jpg', '2018-07-06 14:46:55', NULL);
INSERT INTO `blog_tag` VALUES (9, '生活', 'life2.jpg', '2020-05-17 16:10:40', NULL);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (3, 'blog_article', '文章表', 'BlogArticle', 'crud', 'com.jblog.project.system', 'system', 'article', '文章', 'jblog', NULL, 'happy', '2020-05-16 00:33:18', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 'blog_category', '文章类别表', 'BlogCategory', 'crud', 'com.jblog.project.system', 'system', 'category', '文章类别', 'jblog', NULL, 'happy', '2020-05-16 01:31:06', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (6, 'blog_tag', '标签表', 'BlogTag', 'crud', 'com.jblog.project.system', 'system', 'tag', '标签', 'jblog', NULL, 'happy', '2020-05-16 01:46:58', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (25, '3', 'id', '主键ID', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'happy', '2020-05-16 00:33:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (26, '3', 'user_id', '用户ID', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'happy', '2020-05-16 00:33:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (27, '3', 'nick_name', '作者昵称', 'varchar(64)', 'String', 'nickName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'happy', '2020-05-16 00:33:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (28, '3', 'title', '文章标题', 'varchar(255)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'happy', '2020-05-16 00:33:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (29, '3', 'summary', '文章摘要', 'varchar(255)', 'String', 'summary', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'happy', '2020-05-16 00:33:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (30, '3', 'content', '文章内容txt', 'longtext', 'String', 'content', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'happy', '2020-05-16 00:33:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (31, '3', 'content_html', '文章内容html', 'longtext', 'String', 'contentHtml', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'happy', '2020-05-16 00:33:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (32, '3', 'view_num', '浏览数', 'int', 'Long', 'viewNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'happy', '2020-05-16 00:33:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (33, '3', 'comment_num', '评论数', 'int', 'Long', 'commentNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'happy', '2020-05-16 00:33:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (34, '3', 'weight', '权重', 'int', 'Long', 'weight', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'happy', '2020-05-16 00:33:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (35, '3', 'tags', '文章标签', 'varchar(255)', 'String', 'tags', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'happy', '2020-05-16 00:33:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, '3', 'category_id', '文章分类ID', 'int', 'Long', 'categoryId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'happy', '2020-05-16 00:33:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'happy', '2020-05-16 00:33:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'happy', '2020-05-16 00:33:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, '4', 'id', '主键ID', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'happy', '2020-05-16 01:31:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, '4', 'category_name', '类别名字', 'varchar(64)', 'String', 'categoryName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'happy', '2020-05-16 01:31:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, '4', 'avatar', '类别图标', 'varchar(255)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'happy', '2020-05-16 01:31:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, '4', 'description', '分类描述', 'varchar(255)', 'String', 'description', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'happy', '2020-05-16 01:31:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'happy', '2020-05-16 01:31:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (48, '6', 'id', '主键ID', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'happy', '2020-05-16 01:46:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (49, '6', 'tag_name', '标签名字', 'varchar(64)', 'String', 'tagName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'happy', '2020-05-16 01:46:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (50, '6', 'avatar', '标签图标', 'varchar(255)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'happy', '2020-05-16 01:46:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (51, '6', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'happy', '2020-05-16 01:46:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (52, '6', 'description', '标签描述', 'varchar(500)', 'String', 'description', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'happy', '2020-05-16 01:46:58', '', NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '金特尔科技', 0, '金特尔', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '金特尔', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '金特尔', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '金特尔', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '金特尔', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '金特尔', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '金特尔', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '金特尔', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '金特尔', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '金特尔', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '审核中', '0', 'article_status', NULL, NULL, 'N', '0', 'admin', '2020-05-20 23:23:30', 'admin', '2020-05-20 23:23:37', '文章审核中状态');
INSERT INTO `sys_dict_data` VALUES (101, 2, '审核通过', '1', 'article_status', NULL, NULL, 'N', '0', 'admin', '2020-05-20 23:24:23', 'admin', '2020-05-20 23:24:29', '文章审核通过状态');
INSERT INTO `sys_dict_data` VALUES (102, 3, '审核拒绝', '2', 'article_status', NULL, NULL, 'N', '0', 'admin', '2020-05-20 23:25:18', 'admin', '2020-05-20 23:25:25', '文章审核拒绝状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '文章状态', 'article_status', '0', 'admin', '2020-05-20 23:21:09', 'admin', '2020-05-20 23:21:16', '文章状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 356 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2020-03-26 14:05:21');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-03-26 14:06:19');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-03-26 14:07:50');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-06 09:18:56');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-04-06 09:22:44');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-06 09:23:07');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-04-06 14:03:55');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-04-06 14:04:23');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-21 01:38:10');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-04-21 02:32:31');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-21 02:34:54');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-04-21 02:35:13');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-21 02:35:48');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-21 06:04:36');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-21 07:24:36');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-21 09:00:55');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-21 10:19:10');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-21 12:44:17');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-23 12:33:47');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-05 09:04:52');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-05 13:23:09');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-06 05:23:08');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-06 07:21:02');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-06 07:22:43');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-05-06 07:24:14');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-05-06 07:25:06');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-06 07:25:14');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-06 07:25:19');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-06 07:25:29');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-06 07:25:52');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-05-06 07:26:56');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-06 07:27:00');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-06 07:27:05');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-05-06 07:28:41');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-05-06 07:28:45');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-06 07:28:55');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-06 07:29:08');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-06 07:29:34');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-06 07:30:38');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-06 07:30:48');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-06 07:40:12');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-08 16:32:09');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-08 16:32:22');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-08 19:25:56');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-08 19:36:56');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-09 14:06:33');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-09 14:08:42');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-09 14:16:43');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-09 14:19:58');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-09 14:25:17');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-09 14:27:02');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-09 14:30:05');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-10 02:59:13');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-10 03:05:35');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-10 03:08:08');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-10 03:10:05');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-10 03:11:31');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-10 03:24:21');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-10 04:09:50');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-10 04:19:07');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-10 04:19:41');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-10 04:20:28');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-10 04:21:05');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-10 04:21:14');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-10 04:22:45');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-10 04:27:05');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-10 04:27:13');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-10 04:28:11');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-10 04:34:17');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-10 04:44:38');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-10 05:00:39');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-10 05:01:05');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-10 05:01:46');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-10 05:38:52');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-10 05:41:48');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-14 11:29:36');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-14 11:45:01');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-14 11:51:25');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-14 12:05:42');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Firefox 7', 'Windows 10', '0', '登录成功', '2020-05-14 12:18:13');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-14 12:22:27');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-14 12:50:07');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-14 12:54:52');
INSERT INTO `sys_logininfor` VALUES (183, NULL, '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-14 13:06:19');
INSERT INTO `sys_logininfor` VALUES (184, NULL, '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-14 13:11:42');
INSERT INTO `sys_logininfor` VALUES (185, NULL, '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-14 13:12:12');
INSERT INTO `sys_logininfor` VALUES (186, NULL, '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-14 13:12:49');
INSERT INTO `sys_logininfor` VALUES (187, NULL, '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-14 13:13:17');
INSERT INTO `sys_logininfor` VALUES (188, NULL, '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-14 13:21:33');
INSERT INTO `sys_logininfor` VALUES (189, NULL, '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-14 13:21:33');
INSERT INTO `sys_logininfor` VALUES (190, NULL, '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-14 13:22:10');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-14 13:23:25');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-14 13:23:37');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-14 13:45:35');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-14 14:02:41');
INSERT INTO `sys_logininfor` VALUES (195, 'shadow', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 02:30:17');
INSERT INTO `sys_logininfor` VALUES (196, 'shadow', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-15 02:38:05');
INSERT INTO `sys_logininfor` VALUES (197, 'shadow5', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-15 02:39:10');
INSERT INTO `sys_logininfor` VALUES (198, 'shadow5', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-15 02:39:22');
INSERT INTO `sys_logininfor` VALUES (199, 'shadow2', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 02:39:39');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 08:10:39');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 08:18:30');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 08:20:03');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 08:24:03');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 08:28:44');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 08:52:54');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 09:04:06');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-15 09:04:29');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 09:04:41');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 10:23:36');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-15 10:26:47');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 12:49:25');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 13:03:58');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-15 13:47:18');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-15 13:47:52');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-15 13:48:16');
INSERT INTO `sys_logininfor` VALUES (216, 'shadow2', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-15 13:48:42');
INSERT INTO `sys_logininfor` VALUES (217, 'shadow2', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 13:48:54');
INSERT INTO `sys_logininfor` VALUES (218, 'shadow2', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-15 13:49:05');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-15 13:49:22');
INSERT INTO `sys_logininfor` VALUES (220, 'shadow2', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 13:49:42');
INSERT INTO `sys_logininfor` VALUES (221, 'shadow2', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-15 13:55:05');
INSERT INTO `sys_logininfor` VALUES (222, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 13:55:19');
INSERT INTO `sys_logininfor` VALUES (223, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-15 14:03:50');
INSERT INTO `sys_logininfor` VALUES (224, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 14:04:16');
INSERT INTO `sys_logininfor` VALUES (225, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 16:33:27');
INSERT INTO `sys_logininfor` VALUES (226, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-15 16:34:18');
INSERT INTO `sys_logininfor` VALUES (227, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 16:34:33');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-15 16:47:09');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-05-15 16:47:26');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-15 16:51:19');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-15 16:54:44');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-15 16:55:42');
INSERT INTO `sys_logininfor` VALUES (233, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 16:56:01');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-15 18:19:08');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-15 18:20:25');
INSERT INTO `sys_logininfor` VALUES (236, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 18:20:38');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-15 18:21:37');
INSERT INTO `sys_logininfor` VALUES (238, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 18:21:53');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-15 19:03:13');
INSERT INTO `sys_logininfor` VALUES (240, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 19:03:29');
INSERT INTO `sys_logininfor` VALUES (241, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-15 19:08:02');
INSERT INTO `sys_logininfor` VALUES (242, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 19:13:05');
INSERT INTO `sys_logininfor` VALUES (243, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-15 19:14:58');
INSERT INTO `sys_logininfor` VALUES (244, 'shadow', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-15 19:17:09');
INSERT INTO `sys_logininfor` VALUES (245, 'shadow', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-15 19:18:08');
INSERT INTO `sys_logininfor` VALUES (246, 'shadow', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 19:18:25');
INSERT INTO `sys_logininfor` VALUES (247, 'shadow', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-15 19:30:01');
INSERT INTO `sys_logininfor` VALUES (248, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 19:31:13');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-15 19:47:53');
INSERT INTO `sys_logininfor` VALUES (250, 'happyy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-15 19:48:14');
INSERT INTO `sys_logininfor` VALUES (251, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 19:48:37');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-15 19:50:39');
INSERT INTO `sys_logininfor` VALUES (253, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 19:51:01');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-15 20:01:31');
INSERT INTO `sys_logininfor` VALUES (255, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 20:04:42');
INSERT INTO `sys_logininfor` VALUES (256, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 21:33:38');
INSERT INTO `sys_logininfor` VALUES (257, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-15 22:02:30');
INSERT INTO `sys_logininfor` VALUES (258, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-15 22:07:19');
INSERT INTO `sys_logininfor` VALUES (259, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-16 00:31:50');
INSERT INTO `sys_logininfor` VALUES (260, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-16 02:50:14');
INSERT INTO `sys_logininfor` VALUES (261, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-16 03:03:26');
INSERT INTO `sys_logininfor` VALUES (262, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-16 03:03:34');
INSERT INTO `sys_logininfor` VALUES (263, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-16 03:04:01');
INSERT INTO `sys_logininfor` VALUES (264, 'happy', '220.202.233.228', 'XX XX', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2020-05-16 03:20:22');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-16 05:49:36');
INSERT INTO `sys_logininfor` VALUES (266, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-16 05:51:59');
INSERT INTO `sys_logininfor` VALUES (267, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-16 05:52:06');
INSERT INTO `sys_logininfor` VALUES (268, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-16 06:29:40');
INSERT INTO `sys_logininfor` VALUES (269, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-20 14:08:06');
INSERT INTO `sys_logininfor` VALUES (270, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-20 15:39:00');
INSERT INTO `sys_logininfor` VALUES (271, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-20 15:52:31');
INSERT INTO `sys_logininfor` VALUES (272, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-20 15:53:05');
INSERT INTO `sys_logininfor` VALUES (273, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-20 16:18:47');
INSERT INTO `sys_logininfor` VALUES (274, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-20 16:19:08');
INSERT INTO `sys_logininfor` VALUES (275, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-20 16:19:43');
INSERT INTO `sys_logininfor` VALUES (276, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-20 16:20:05');
INSERT INTO `sys_logininfor` VALUES (277, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-20 16:27:30');
INSERT INTO `sys_logininfor` VALUES (278, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-20 16:27:46');
INSERT INTO `sys_logininfor` VALUES (279, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-20 16:32:41');
INSERT INTO `sys_logininfor` VALUES (280, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-20 16:33:01');
INSERT INTO `sys_logininfor` VALUES (281, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-20 16:35:01');
INSERT INTO `sys_logininfor` VALUES (282, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-20 16:35:25');
INSERT INTO `sys_logininfor` VALUES (283, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-05-21 19:23:52');
INSERT INTO `sys_logininfor` VALUES (284, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-21 19:24:07');
INSERT INTO `sys_logininfor` VALUES (285, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-21 20:04:58');
INSERT INTO `sys_logininfor` VALUES (286, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-21 20:08:23');
INSERT INTO `sys_logininfor` VALUES (287, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-21 23:20:38');
INSERT INTO `sys_logininfor` VALUES (288, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-21 23:39:47');
INSERT INTO `sys_logininfor` VALUES (289, 'happy', '127.0.0.1', '内网IP', 'Firefox 7', 'Windows 10', '0', '登录成功', '2020-05-21 23:44:13');
INSERT INTO `sys_logininfor` VALUES (290, 'happy', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2020-05-24 08:26:59');
INSERT INTO `sys_logininfor` VALUES (291, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-27 15:24:08');
INSERT INTO `sys_logininfor` VALUES (292, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-30 04:21:41');
INSERT INTO `sys_logininfor` VALUES (293, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-30 04:56:17');
INSERT INTO `sys_logininfor` VALUES (294, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-30 11:54:00');
INSERT INTO `sys_logininfor` VALUES (295, '小方块', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-30 11:56:14');
INSERT INTO `sys_logininfor` VALUES (296, '小方块', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-30 11:56:18');
INSERT INTO `sys_logininfor` VALUES (297, 'shadow', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-30 15:54:19');
INSERT INTO `sys_logininfor` VALUES (298, 'shadow', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-30 15:54:27');
INSERT INTO `sys_logininfor` VALUES (299, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-30 19:00:32');
INSERT INTO `sys_logininfor` VALUES (300, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-30 19:11:27');
INSERT INTO `sys_logininfor` VALUES (301, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-30 19:34:12');
INSERT INTO `sys_logininfor` VALUES (302, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-30 19:34:29');
INSERT INTO `sys_logininfor` VALUES (303, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-30 19:34:34');
INSERT INTO `sys_logininfor` VALUES (304, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-30 19:35:15');
INSERT INTO `sys_logininfor` VALUES (305, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-31 09:42:15');
INSERT INTO `sys_logininfor` VALUES (306, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-31 10:13:51');
INSERT INTO `sys_logininfor` VALUES (307, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-31 11:42:49');
INSERT INTO `sys_logininfor` VALUES (308, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-31 13:41:55');
INSERT INTO `sys_logininfor` VALUES (309, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-31 15:17:26');
INSERT INTO `sys_logininfor` VALUES (310, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-01 12:57:25');
INSERT INTO `sys_logininfor` VALUES (311, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-01 16:10:52');
INSERT INTO `sys_logininfor` VALUES (312, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 12:35:25');
INSERT INTO `sys_logininfor` VALUES (313, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-02 12:39:07');
INSERT INTO `sys_logininfor` VALUES (314, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 12:39:17');
INSERT INTO `sys_logininfor` VALUES (315, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-02 12:49:25');
INSERT INTO `sys_logininfor` VALUES (316, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 12:49:33');
INSERT INTO `sys_logininfor` VALUES (317, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-02 13:04:21');
INSERT INTO `sys_logininfor` VALUES (318, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 13:04:30');
INSERT INTO `sys_logininfor` VALUES (319, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-02 13:06:16');
INSERT INTO `sys_logininfor` VALUES (320, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 13:06:24');
INSERT INTO `sys_logininfor` VALUES (321, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 14:39:37');
INSERT INTO `sys_logininfor` VALUES (322, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-02 14:43:12');
INSERT INTO `sys_logininfor` VALUES (323, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 14:43:23');
INSERT INTO `sys_logininfor` VALUES (324, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-02 14:51:08');
INSERT INTO `sys_logininfor` VALUES (325, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 14:51:18');
INSERT INTO `sys_logininfor` VALUES (326, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-02 15:20:30');
INSERT INTO `sys_logininfor` VALUES (327, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 15:20:37');
INSERT INTO `sys_logininfor` VALUES (328, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-02 15:48:40');
INSERT INTO `sys_logininfor` VALUES (329, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 15:48:49');
INSERT INTO `sys_logininfor` VALUES (330, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-02 16:06:23');
INSERT INTO `sys_logininfor` VALUES (331, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 16:06:35');
INSERT INTO `sys_logininfor` VALUES (332, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 20:28:45');
INSERT INTO `sys_logininfor` VALUES (333, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 21:06:36');
INSERT INTO `sys_logininfor` VALUES (334, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 21:07:48');
INSERT INTO `sys_logininfor` VALUES (335, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 21:14:43');
INSERT INTO `sys_logininfor` VALUES (336, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 21:15:36');
INSERT INTO `sys_logininfor` VALUES (337, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 21:17:54');
INSERT INTO `sys_logininfor` VALUES (338, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 21:23:43');
INSERT INTO `sys_logininfor` VALUES (339, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-02 21:36:23');
INSERT INTO `sys_logininfor` VALUES (340, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 21:36:30');
INSERT INTO `sys_logininfor` VALUES (341, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-02 21:36:52');
INSERT INTO `sys_logininfor` VALUES (342, 'shadow', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-06-02 21:37:01');
INSERT INTO `sys_logininfor` VALUES (343, 'shadow', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-06-02 21:37:17');
INSERT INTO `sys_logininfor` VALUES (344, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 21:41:24');
INSERT INTO `sys_logininfor` VALUES (345, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-02 21:43:07');
INSERT INTO `sys_logininfor` VALUES (346, 'shadow', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 21:43:18');
INSERT INTO `sys_logininfor` VALUES (347, 'shadow', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-02 22:06:47');
INSERT INTO `sys_logininfor` VALUES (348, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 22:06:57');
INSERT INTO `sys_logininfor` VALUES (349, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-02 22:14:36');
INSERT INTO `sys_logininfor` VALUES (350, 'shadow', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 22:14:46');
INSERT INTO `sys_logininfor` VALUES (351, 'shadow', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-02 22:29:15');
INSERT INTO `sys_logininfor` VALUES (352, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 22:29:23');
INSERT INTO `sys_logininfor` VALUES (353, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-02 22:29:55');
INSERT INTO `sys_logininfor` VALUES (354, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 22:30:01');
INSERT INTO `sys_logininfor` VALUES (355, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 23:13:58');
INSERT INTO `sys_logininfor` VALUES (356, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-03 00:07:45');
INSERT INTO `sys_logininfor` VALUES (357, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-06-04 12:16:20');
INSERT INTO `sys_logininfor` VALUES (358, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-04 12:19:32');
INSERT INTO `sys_logininfor` VALUES (359, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-04 12:21:25');
INSERT INTO `sys_logininfor` VALUES (360, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-04 12:21:30');
INSERT INTO `sys_logininfor` VALUES (361, 'happy', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-04 12:21:40');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(0) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2012 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 1, 'M', '0', '', 'system', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录', '0');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, 1, 'M', '0', '', 'monitor', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录', '0');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, 1, 'M', '0', '', 'tool', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录', '1');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 2010, 2, 'role', 'permission/role/index', 1, 'C', '0', 'permisson:role:list', 'peoples', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-21 11:42:36', '角色管理菜单', '0');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 2010, 3, 'menu', 'permission/menu/index', 1, 'C', '0', 'permission:menu:list', 'tree-table', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单', '1');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 1, 'C', '0', 'system:dept:list', 'tree', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单', '1');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 1, 'C', '0', 'system:post:list', 'post', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单', '1');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 'C', '0', 'system:dict:list', 'dict', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单', '0');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 1, 'C', '0', 'system:config:list', 'edit', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单', '0');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', 1, 'C', '0', 'system:notice:list', 'message', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单', '0');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', 'system/log/index', 1, 'M', '0', '', 'log', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单', '0');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 'C', '0', 'monitor:online:list', 'online', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单', '0');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 1, 'C', '0', 'monitor:job:list', 'job', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单', '0');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 1, 'C', '0', 'monitor:druid:list', 'druid', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单', '0');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 'C', '0', 'monitor:server:list', 'server', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单', '0');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 'C', '0', 'tool:build:list', 'build', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单', '0');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 'C', '0', 'tool:gen:list', 'code', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单', '0');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 1, 'C', '0', 'tool:swagger:list', 'swagger', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单', '0');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 'C', '0', 'monitor:operlog:list', 'form', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单', '0');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 'C', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单', '0');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 2009, 1, '', '', 1, 'F', '0', 'system:user:query', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-21 11:30:02', '', '0');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 2009, 2, '', '', 1, 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-21 11:30:26', '', '0');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 2009, 3, '', '', 1, 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-21 11:30:32', '', '0');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 2009, 4, '', '', 1, 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-21 11:30:38', '', '0');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 2009, 5, '', '', 1, 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-21 11:30:49', '', '0');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 2009, 6, '', '', 1, 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-21 11:30:58', '', '0');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 2009, 7, '', '', 1, 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-21 11:31:06', '', '0');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 'F', '0', 'system:role:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 'F', '0', 'system:menu:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', 1, 'F', '0', 'system:dept:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', 1, 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-21 02:42:16', '', '0');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', 1, 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', 1, 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 1, 'F', '0', 'system:post:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 1, 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 1, 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 1, 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 1, 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 1, 'F', '0', 'system:dict:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 1, 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 1, 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 1, 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 1, 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 1, 'F', '0', 'system:config:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 1, 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 1, 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 1, 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 1, 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', 1, 'F', '0', 'system:notice:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', 1, 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', 1, 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', 1, 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 1, 'F', '0', 'monitor:operlog:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 1, 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 1, 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 1, 'F', '0', 'monitor:logininfor:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 1, 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 1, 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 1, 'F', '0', 'monitor:online:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 1, 'F', '0', 'monitor:online:batchLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 1, 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 1, 'F', '0', 'monitor:job:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 1, 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 1, 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 1, 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 1, 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', 1, 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 114, 1, '#', '', 1, 'F', '0', 'tool:gen:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 114, 2, '#', '', 1, 'F', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 114, 3, '#', '', 1, 'F', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 114, 2, '#', '', 1, 'F', '0', 'tool:gen:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 114, 4, '#', '', 1, 'F', '0', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 114, 5, '#', '', 1, 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES (2000, '文章管理', 0, 0, 'article', NULL, 1, 'M', '0', '', 'edit', 'admin', '2020-04-21 07:30:31', 'admin', '2020-04-21 10:26:33', '', '0');
INSERT INTO `sys_menu` VALUES (2001, '文章列表', 2000, 1, 'article', 'article/article/index', 1, 'C', '0', 'article:article:list', 'language', 'admin', '2020-04-21 07:34:59', 'admin', '2020-04-21 10:30:20', '', '0');
INSERT INTO `sys_menu` VALUES (2002, '分类列表', 2000, 2, 'category', 'article/category/index', 1, 'C', '0', 'article:category:list', 'edit', 'admin', '2020-04-21 10:32:05', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (2003, '标签列表', 2000, 3, 'lable', 'article/lable/index', 1, 'C', '0', 'article:lable:list', 'edit', 'admin', '2020-04-21 10:33:36', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (2004, '用户管理', 0, 2, 'user', NULL, 1, 'M', '0', '', 'user', 'admin', '2020-04-21 10:42:36', 'admin', '2020-04-21 11:36:16', '', '0');
INSERT INTO `sys_menu` VALUES (2006, '网站管理', 0, 4, 'website', NULL, 1, 'M', '0', NULL, 'server', 'admin', '2020-04-21 10:48:52', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (2007, '友情链接', 2006, 1, 'link', 'website/link/index', 1, 'C', '0', 'website:link:list', 'guide', 'admin', '2020-04-21 10:50:52', 'admin', '2020-04-21 13:08:21', '', '0');
INSERT INTO `sys_menu` VALUES (2008, '评论管理', 2006, 2, 'comment', 'website/comment/index', 1, 'C', '0', 'website:comment:list', 'log', 'admin', '2020-04-21 10:52:24', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (2009, '用户列表', 2004, 1, 'user', 'user/index', 1, 'C', '0', 'user:list', 'user', 'admin', '2020-04-21 10:56:32', 'admin', '2020-04-21 11:17:29', '', '0');
INSERT INTO `sys_menu` VALUES (2010, '权限管理', 0, 4, 'permission', NULL, 1, 'M', '0', NULL, 'eye-open', 'admin', '2020-04-21 10:57:46', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (2011, '文章审核', 2000, 0, 'audit', 'article/article/audit', 1, 'C', '0', 'article:article:audit', 'language', 'admin', '2020-05-17 21:40:51', 'admin', '2020-05-17 21:40:56', '', '0');
INSERT INTO `sys_menu` VALUES (2012, '文章编辑', 2000, 0, '', NULL, 1, 'F', '0', 'system:article:edit', '#', 'admin', '2020-05-21 00:26:02', 'admin', '2020-05-21 00:26:06', '', '0');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '操作日志', 9, 'com.jblog.project.monitor.controller.SysOperlogController.clean()', 'DELETE', 1, 'happy', NULL, '/monitor/operlog/clean', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-05-16 02:17:07');
INSERT INTO `sys_oper_log` VALUES (2, '角色管理', 2, 'com.jblog.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'happy', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"remark\":\"管理员\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"1\",\"createTime\":1521171180000,\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"menuIds\":[2012,2000],\"status\":\"0\"}', 'null', 1, '不允许操作超级管理员角色', '2020-05-20 16:27:03');
INSERT INTO `sys_oper_log` VALUES (3, '用户管理', 1, 'com.jblog.project.blog.user.controller.UserController.add()', 'POST', 1, NULL, NULL, '/system/user/register', '127.0.0.1', '内网IP', '{\"phonenumber\":\"17300000000\",\"admin\":false,\"password\":\"$2a$10$Wq9wK7Xaq9x39B3QYp1J6e87wlj0YI/9ZOiveQqM6Mc7UDlmmhVMK\",\"email\":\"3465370452@qq.com\",\"nickName\":\"小方块\",\"avatar\":\"avatar.png\",\"params\":{},\"userName\":\"小方块\",\"userId\":108,\"createBy\":\"小方块\",\"roleIds\":[2]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-05-30 11:48:27');
INSERT INTO `sys_oper_log` VALUES (4, '用户管理', 2, 'com.jblog.project.blog.user.controller.UserController.edit()', 'POST', 1, 'happy', NULL, '/user/updateUser', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15888888888\",\"admin\":false,\"email\":\"girl@163.com\",\"nickName\":\"一点点梵\",\"sex\":\"0\",\"params\":{},\"userName\":\"happy\"}', '{\"msg\":\"修改用户\'happy\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2020-06-02 21:27:16');
INSERT INTO `sys_oper_log` VALUES (5, '用户管理', 2, 'com.jblog.project.blog.user.controller.UserController.edit()', 'POST', 1, 'happy', NULL, '/user/updateUser', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"email\":\"girl@163.com\",\"nickName\":\"一点点梵\",\"sex\":\"1\",\"params\":{},\"userName\":\"happy\",\"userId\":1}', 'null', 1, '不允许操作超级管理员用户', '2020-06-02 21:33:47');
INSERT INTO `sys_oper_log` VALUES (6, '用户管理', 2, 'com.jblog.project.blog.user.controller.UserController.edit()', 'POST', 1, 'happy', NULL, '/user/updateUser', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"email\":\"girl@163.com\",\"nickName\":\"一点点梵\",\"sex\":\"0\",\"params\":{},\"userName\":\"happy\",\"userId\":1}', 'null', 1, '不允许操作超级管理员用户', '2020-06-02 21:35:48');
INSERT INTO `sys_oper_log` VALUES (7, '用户管理', 2, 'com.jblog.project.blog.user.controller.UserController.edit()', 'POST', 1, 'happy', NULL, '/user/updateUser', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"email\":\"girl@163.com\",\"nickName\":\"一点点梵\",\"sex\":\"0\",\"params\":{},\"userName\":\"happy\",\"userId\":1}', 'null', 1, '不允许操作超级管理员用户', '2020-06-02 21:36:36');
INSERT INTO `sys_oper_log` VALUES (8, '用户管理', 2, 'com.jblog.project.blog.user.controller.UserController.edit()', 'POST', 1, 'happy', NULL, '/user/updateUser', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"email\":\"girl@163.com\",\"nickName\":\"一点点梵\",\"sex\":\"0\",\"params\":{},\"userName\":\"happy\",\"userId\":1}', 'null', 1, '不允许操作超级管理员用户', '2020-06-02 21:41:47');
INSERT INTO `sys_oper_log` VALUES (9, '用户管理', 2, 'com.jblog.project.blog.user.controller.UserController.edit()', 'POST', 1, 'happy', NULL, '/user/updateUser', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"email\":\"girl@163.com\",\"nickName\":\"一点点梵\",\"sex\":\"0\",\"params\":{},\"userName\":\"happy\",\"userId\":1}', 'null', 1, '不允许操作超级管理员用户', '2020-06-02 21:42:14');
INSERT INTO `sys_oper_log` VALUES (10, '用户管理', 2, 'com.jblog.project.blog.user.controller.UserController.edit()', 'POST', 1, 'shadow', NULL, '/user/updateUser', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15666666666\",\"admin\":false,\"updateBy\":\"shadow\",\"email\":\"2581992919@qq.com\",\"nickName\":\"shadow\",\"sex\":\"0\",\"params\":{},\"userName\":\"shadow\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-06-02 21:46:16');
INSERT INTO `sys_oper_log` VALUES (11, '用户管理', 2, 'com.jblog.project.blog.user.controller.UserController.edit()', 'POST', 1, 'shadow', NULL, '/user/updateUser', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15666666666\",\"admin\":false,\"updateBy\":\"shadow\",\"email\":\"2581992919@qq.com\",\"nickName\":\"shadow\",\"sex\":\"0\",\"params\":{},\"userName\":\"shadow\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-06-02 21:46:23');
INSERT INTO `sys_oper_log` VALUES (12, '用户管理', 2, 'com.jblog.project.blog.user.controller.UserController.edit()', 'POST', 1, 'shadow', NULL, '/user/updateUser', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15666666666\",\"admin\":false,\"updateBy\":\"shadow\",\"email\":\"2581992919@qq.com\",\"nickName\":\"shadow\",\"sex\":\"0\",\"params\":{},\"userName\":\"shadow\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-06-02 21:46:55');
INSERT INTO `sys_oper_log` VALUES (13, '用户管理', 2, 'com.jblog.project.blog.user.controller.UserController.edit()', 'POST', 1, 'shadow', NULL, '/user/updateUser', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15666666666\",\"admin\":false,\"updateBy\":\"shadow\",\"email\":\"2581992919@qq.com\",\"nickName\":\"shadow\",\"sex\":\"0\",\"params\":{},\"userName\":\"shadow\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-06-02 21:47:05');
INSERT INTO `sys_oper_log` VALUES (14, '用户管理', 2, 'com.jblog.project.blog.user.controller.UserController.edit()', 'POST', 1, 'shadow', NULL, '/user/updateUser', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15666666666\",\"admin\":false,\"updateBy\":\"shadow\",\"email\":\"2581992919@qq.com\",\"nickName\":\"shadow\",\"sex\":\"0\",\"params\":{},\"userName\":\"shadow\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-06-02 21:47:25');
INSERT INTO `sys_oper_log` VALUES (15, '用户管理', 2, 'com.jblog.project.blog.user.controller.UserController.edit()', 'POST', 1, 'shadow', NULL, '/user/updateUser', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15666666666\",\"admin\":false,\"updateBy\":\"shadow\",\"email\":\"2581992919@qq.com\",\"nickName\":\"shadow\",\"sex\":\"0\",\"params\":{},\"userName\":\"shadow\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-06-02 21:48:41');
INSERT INTO `sys_oper_log` VALUES (16, '用户管理', 2, 'com.jblog.project.blog.user.controller.UserController.edit()', 'POST', 1, 'shadow', NULL, '/user/updateUser', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13005342342\",\"admin\":false,\"updateBy\":\"shadow\",\"email\":\"2581992919@qq.com\",\"nickName\":\"shadow\",\"sex\":\"1\",\"params\":{},\"userName\":\"shadow\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-06-02 21:49:59');
INSERT INTO `sys_oper_log` VALUES (17, '用户管理', 2, 'com.jblog.project.blog.user.controller.UserController.edit()', 'POST', 1, 'shadow', NULL, '/user/updateUser', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15666\",\"admin\":false,\"updateBy\":\"shadow\",\"email\":\"2581992919@qq.com\",\"nickName\":\"shadow\",\"sex\":\"1\",\"params\":{},\"userName\":\"shadow\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-06-02 21:50:21');
INSERT INTO `sys_oper_log` VALUES (18, '用户管理', 2, 'com.jblog.project.blog.user.controller.UserController.edit()', 'POST', 1, 'happy', NULL, '/user/updateUser', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15888888\",\"admin\":true,\"email\":\"girl@163.com\",\"nickName\":\"一点点梵\",\"sex\":\"1\",\"params\":{},\"userName\":\"happy\",\"userId\":1}', 'null', 1, '不允许操作超级管理员用户', '2020-06-02 22:14:32');
INSERT INTO `sys_oper_log` VALUES (19, '用户管理', 2, 'com.jblog.project.blog.user.controller.UserController.edit()', 'POST', 1, 'shadow', NULL, '/user/updateUser', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15666\",\"admin\":false,\"updateBy\":\"shadow\",\"email\":\"2581992919@qq.com\",\"nickName\":\"shadow\",\"sex\":\"0\",\"params\":{},\"userName\":\"shadow\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-06-02 22:14:56');
INSERT INTO `sys_oper_log` VALUES (20, '用户管理', 2, 'com.jblog.project.blog.user.controller.UserController.edit()', 'POST', 1, 'shadow', NULL, '/user/updateUser', '127.0.0.1', '内网IP', '{\"phonenumber\":\"1566622222\",\"admin\":false,\"updateBy\":\"shadow\",\"email\":\"2581992919@qq.com\",\"nickName\":\"shadow\",\"sex\":\"0\",\"params\":{},\"userName\":\"shadow\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-06-02 22:18:09');
INSERT INTO `sys_oper_log` VALUES (21, '用户管理', 2, 'com.jblog.project.blog.user.controller.UserController.edit()', 'POST', 1, 'shadow', NULL, '/user/updateUser', '127.0.0.1', '内网IP', '{\"phonenumber\":\"1566622222\",\"admin\":false,\"updateBy\":\"shadow\",\"email\":\"2581992919@qq.com\",\"nickName\":\"shadow\",\"sex\":\"1\",\"params\":{},\"userName\":\"shadow\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-06-02 22:18:18');
INSERT INTO `sys_oper_log` VALUES (22, '用户管理', 2, 'com.jblog.project.blog.user.controller.UserController.edit()', 'POST', 1, 'shadow', NULL, '/user/updateUser', '127.0.0.1', '内网IP', '{\"phonenumber\":\"1566622222\",\"admin\":false,\"updateBy\":\"shadow\",\"email\":\"2581992919@qq.com\",\"nickName\":\"shadow\",\"sex\":\"0\",\"params\":{},\"userName\":\"shadow\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-06-02 22:22:10');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'happy', '2020-05-15 19:14:28', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 101);
INSERT INTO `sys_role_menu` VALUES (1, 102);
INSERT INTO `sys_role_menu` VALUES (1, 103);
INSERT INTO `sys_role_menu` VALUES (1, 104);
INSERT INTO `sys_role_menu` VALUES (1, 105);
INSERT INTO `sys_role_menu` VALUES (1, 106);
INSERT INTO `sys_role_menu` VALUES (1, 107);
INSERT INTO `sys_role_menu` VALUES (1, 108);
INSERT INTO `sys_role_menu` VALUES (1, 109);
INSERT INTO `sys_role_menu` VALUES (1, 110);
INSERT INTO `sys_role_menu` VALUES (1, 111);
INSERT INTO `sys_role_menu` VALUES (1, 112);
INSERT INTO `sys_role_menu` VALUES (1, 113);
INSERT INTO `sys_role_menu` VALUES (1, 114);
INSERT INTO `sys_role_menu` VALUES (1, 115);
INSERT INTO `sys_role_menu` VALUES (1, 500);
INSERT INTO `sys_role_menu` VALUES (1, 501);
INSERT INTO `sys_role_menu` VALUES (1, 1001);
INSERT INTO `sys_role_menu` VALUES (1, 1002);
INSERT INTO `sys_role_menu` VALUES (1, 1003);
INSERT INTO `sys_role_menu` VALUES (1, 1004);
INSERT INTO `sys_role_menu` VALUES (1, 1005);
INSERT INTO `sys_role_menu` VALUES (1, 1006);
INSERT INTO `sys_role_menu` VALUES (1, 1007);
INSERT INTO `sys_role_menu` VALUES (1, 1008);
INSERT INTO `sys_role_menu` VALUES (1, 1009);
INSERT INTO `sys_role_menu` VALUES (1, 1010);
INSERT INTO `sys_role_menu` VALUES (1, 1011);
INSERT INTO `sys_role_menu` VALUES (1, 1012);
INSERT INTO `sys_role_menu` VALUES (1, 1013);
INSERT INTO `sys_role_menu` VALUES (1, 1014);
INSERT INTO `sys_role_menu` VALUES (1, 1015);
INSERT INTO `sys_role_menu` VALUES (1, 1016);
INSERT INTO `sys_role_menu` VALUES (1, 1017);
INSERT INTO `sys_role_menu` VALUES (1, 1018);
INSERT INTO `sys_role_menu` VALUES (1, 1019);
INSERT INTO `sys_role_menu` VALUES (1, 1020);
INSERT INTO `sys_role_menu` VALUES (1, 1021);
INSERT INTO `sys_role_menu` VALUES (1, 1022);
INSERT INTO `sys_role_menu` VALUES (1, 1023);
INSERT INTO `sys_role_menu` VALUES (1, 1024);
INSERT INTO `sys_role_menu` VALUES (1, 1025);
INSERT INTO `sys_role_menu` VALUES (1, 1026);
INSERT INTO `sys_role_menu` VALUES (1, 1027);
INSERT INTO `sys_role_menu` VALUES (1, 1028);
INSERT INTO `sys_role_menu` VALUES (1, 1029);
INSERT INTO `sys_role_menu` VALUES (1, 1030);
INSERT INTO `sys_role_menu` VALUES (1, 1031);
INSERT INTO `sys_role_menu` VALUES (1, 1032);
INSERT INTO `sys_role_menu` VALUES (1, 1033);
INSERT INTO `sys_role_menu` VALUES (1, 1034);
INSERT INTO `sys_role_menu` VALUES (1, 1035);
INSERT INTO `sys_role_menu` VALUES (1, 1036);
INSERT INTO `sys_role_menu` VALUES (1, 1037);
INSERT INTO `sys_role_menu` VALUES (1, 1038);
INSERT INTO `sys_role_menu` VALUES (1, 1039);
INSERT INTO `sys_role_menu` VALUES (1, 1040);
INSERT INTO `sys_role_menu` VALUES (1, 1041);
INSERT INTO `sys_role_menu` VALUES (1, 1042);
INSERT INTO `sys_role_menu` VALUES (1, 1043);
INSERT INTO `sys_role_menu` VALUES (1, 1044);
INSERT INTO `sys_role_menu` VALUES (1, 1045);
INSERT INTO `sys_role_menu` VALUES (1, 1046);
INSERT INTO `sys_role_menu` VALUES (1, 1047);
INSERT INTO `sys_role_menu` VALUES (1, 1048);
INSERT INTO `sys_role_menu` VALUES (1, 1049);
INSERT INTO `sys_role_menu` VALUES (1, 1050);
INSERT INTO `sys_role_menu` VALUES (1, 1051);
INSERT INTO `sys_role_menu` VALUES (1, 1052);
INSERT INTO `sys_role_menu` VALUES (1, 1053);
INSERT INTO `sys_role_menu` VALUES (1, 1054);
INSERT INTO `sys_role_menu` VALUES (1, 1055);
INSERT INTO `sys_role_menu` VALUES (1, 1056);
INSERT INTO `sys_role_menu` VALUES (1, 1057);
INSERT INTO `sys_role_menu` VALUES (1, 1058);
INSERT INTO `sys_role_menu` VALUES (1, 1059);
INSERT INTO `sys_role_menu` VALUES (1, 1060);
INSERT INTO `sys_role_menu` VALUES (1, 2004);
INSERT INTO `sys_role_menu` VALUES (1, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '住址',
  `label` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '个性签名',
  PRIMARY KEY (`user_id`, `sex`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'happy', '一点点梵', '00', 'girl@163.com', '15888888888', '1', 'b25702a581c7b0bbecf3e6327b50c486.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2020-05-05 11:33:00', 'happy', '2020-06-02 22:29:33', '测试员', '湖南长沙', '应届毕业生');
INSERT INTO `sys_user` VALUES (2, 105, 'shadow', 'shadow', '00', '2581992919@qq.com', '1566622222', '0', '499d2f69be72ddb97942602ddbe7d419.jpg', '$2a$10$3yyWb2WJ30WabiVkBcC8XOhEKhw4g8YqNhNCcYRBVCYWHpYSfpVDi', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2020-05-10 11:33:00', 'shadow', '2020-06-02 22:22:10', '管理员', '湖南长沙', '勇往直前');
INSERT INTO `sys_user` VALUES (108, NULL, '小方块', '小方块', '00', '3465370452@qq.com', '17300000000', '0', 'avatar.png', '$2a$10$Wq9wK7Xaq9x39B3QYp1J6e87wlj0YI/9ZOiveQqM6Mc7UDlmmhVMK', '0', '0', '', NULL, '小方块', '2020-05-30 11:48:27', '', NULL, NULL, '湖南长沙', '极速前进');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 2);
INSERT INTO `sys_user_post` VALUES (2, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (107, 2);
INSERT INTO `sys_user_role` VALUES (108, 2);

SET FOREIGN_KEY_CHECKS = 1;
