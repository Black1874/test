/*
 Navicat Premium Data Transfer

 Source Server         : ams-boc
 Source Server Type    : MySQL
 Source Server Version : 50670
 Source Host           : rm-wz9w1r3jr728r43xdoo.mysql.rds.aliyuncs.com:3306
 Source Schema         : ams_boc_test

 Target Server Type    : MySQL
 Target Server Version : 50670
 File Encoding         : 65001

 Date: 19/01/2019 09:39:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for boc_biz_oppor_attachment
-- ----------------------------
DROP TABLE IF EXISTS `boc_biz_oppor_attachment`;
CREATE TABLE `boc_biz_oppor_attachment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '附件ID（主键）',
  `biz_oppor_info_id` bigint(20) NOT NULL COMMENT '商机信息ID（关联）',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件标题',
  `file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称',
  `postfix` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件后缀',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件描述',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_boc_biz_oppor_attachment_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商机附件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for boc_biz_oppor_collaborator
-- ----------------------------
DROP TABLE IF EXISTS `boc_biz_oppor_collaborator`;
CREATE TABLE `boc_biz_oppor_collaborator`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '协作人ID（主键）',
  `biz_oppor_info_id` bigint(20) NOT NULL COMMENT '商机信息ID（关联）',
  `user_id` bigint(20) NOT NULL COMMENT '协作人用户id（关联）',
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_boc_biz_oppor_collaborator_id`(`id`) USING BTREE,
  INDEX `FK_boc_biz_oppor_collaborator_info`(`biz_oppor_info_id`) USING BTREE,
  CONSTRAINT `FK_boc_biz_oppor_collaborator_info` FOREIGN KEY (`biz_oppor_info_id`) REFERENCES `boc_biz_oppor_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商机协作人' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for boc_biz_oppor_contact
-- ----------------------------
DROP TABLE IF EXISTS `boc_biz_oppor_contact`;
CREATE TABLE `boc_biz_oppor_contact`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识ID',
  `biz_oppor_info_id` bigint(20) NOT NULL COMMENT '关联商机信息ID（外键）',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `telphone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话',
  `dept_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `position` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（1有效、2无效）',
  `is_default` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否默认（0：否，1：是）',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_boc_biz_oppor_contact_id`(`id`) USING BTREE,
  INDEX `FK_boc_biz_oppor_contact_info`(`biz_oppor_info_id`) USING BTREE,
  CONSTRAINT `FK_boc_biz_oppor_contact_info` FOREIGN KEY (`biz_oppor_info_id`) REFERENCES `boc_biz_oppor_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商机联系人' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for boc_biz_oppor_follow_up
-- ----------------------------
DROP TABLE IF EXISTS `boc_biz_oppor_follow_up`;
CREATE TABLE `boc_biz_oppor_follow_up`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `biz_oppor_info_id` bigint(20) NOT NULL COMMENT '商机信息ID（外键）',
  `user_id` bigint(20) NOT NULL COMMENT '跟进人',
  `fu_mode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跟进方式（关联数据字典：follow-mode）',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跟进状态（数据字典:biz_oppor_fu_status）',
  `attachment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件信息',
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片信息',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跟进描述',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_boc_biz_oppor_follow_up_id`(`id`) USING BTREE,
  INDEX `FK_boc_biz_oppor_follow_up_info`(`biz_oppor_info_id`) USING BTREE,
  CONSTRAINT `FK_boc_biz_oppor_follow_up_info` FOREIGN KEY (`biz_oppor_info_id`) REFERENCES `boc_biz_oppor_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商机跟进记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for boc_biz_oppor_info
-- ----------------------------
DROP TABLE IF EXISTS `boc_biz_oppor_info`;
CREATE TABLE `boc_biz_oppor_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识主键',
  `customer_info_id` bigint(20) NULL DEFAULT NULL COMMENT '对应客户ID',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商机标题',
  `source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商机来源（数据字段：biz_oppor_source）',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商机类型（数据字典：biz_oppor_type）',
  `user_id` decimal(20, 0) NOT NULL COMMENT '负责人',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商机状态（数据字典：biz_oppor_status）',
  `order_level` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单量级别（数据字典：biz_oppor_order_level）',
  `urgency` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急程度',
  `corp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业名称',
  `contact_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人',
  `contact_mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `contact_telhone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话',
  `account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号（如：阿里云账号）',
  `estimated_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '预计金额',
  `estimated_begin` datetime(0) NULL DEFAULT NULL COMMENT '预计开始时间',
  `estimated_cycle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预计周期',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `next_fu_time` datetime(0) NULL DEFAULT NULL COMMENT '下次跟进时间',
  `last_fu_time` datetime(0) NULL DEFAULT NULL COMMENT '最后跟进时间',
  `last_fu_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后跟进人',
  `last_fu_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后跟进内容',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `is_remind` tinyint(1) NULL DEFAULT 0 COMMENT '是否提醒（0：否 1：是）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_boc_biz_oppor_info_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商机信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for boc_biz_oppor_op_log
-- ----------------------------
DROP TABLE IF EXISTS `boc_biz_oppor_op_log`;
CREATE TABLE `boc_biz_oppor_op_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识主键',
  `biz_oppor_info_id` bigint(20) NOT NULL COMMENT '商机信息（外键关联）',
  `op_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `op_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型（数据字典：clue_op_type）',
  `op_time` datetime(0) NOT NULL COMMENT '操作时间',
  `op_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作描述',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_boc_biz_oppor_op_log_id`(`id`) USING BTREE,
  INDEX `FK_boc_biz_oppor_op_log_info`(`biz_oppor_info_id`) USING BTREE,
  CONSTRAINT `FK_boc_biz_oppor_op_log_info` FOREIGN KEY (`biz_oppor_info_id`) REFERENCES `boc_biz_oppor_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商机操作日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `databasechangelog`;
CREATE TABLE `databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `databasechangeloglock`;
CREATE TABLE `databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
