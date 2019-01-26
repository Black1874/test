/*
 Navicat Premium Data Transfer

 Source Server         : ams-cpc
 Source Server Type    : MySQL
 Source Server Version : 50670
 Source Host           : rm-wz9w1r3jr728r43xdoo.mysql.rds.aliyuncs.com:3306
 Source Schema         : ams_cpc_test

 Target Server Type    : MySQL
 Target Server Version : 50670
 File Encoding         : 65001

 Date: 19/01/2019 09:39:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cpc_partner_attachment
-- ----------------------------
DROP TABLE IF EXISTS `cpc_partner_attachment`;
CREATE TABLE `cpc_partner_attachment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件ID（主键）',
  `partner_info_id` bigint(20) NOT NULL COMMENT '伙伴信息ID（关联）',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件标题',
  `file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称',
  `postfix` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件后缀',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件描述',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `creator_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_cpc_partner_attachment_id`(`id`) USING BTREE,
  INDEX `FK_cpc_partner_attachment_info`(`partner_info_id`) USING BTREE,
  CONSTRAINT `FK_cpc_partner_attachment_info` FOREIGN KEY (`partner_info_id`) REFERENCES `cpc_partner_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '伙伴附件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cpc_partner_collaborator
-- ----------------------------
DROP TABLE IF EXISTS `cpc_partner_collaborator`;
CREATE TABLE `cpc_partner_collaborator`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '协作人ID（主键）',
  `partner_info_id` bigint(20) NOT NULL COMMENT '伙伴信息ID（关联）',
  `user_id` int(11) NOT NULL COMMENT '协作人用户id（关联）',
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `creator_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_cpc_partner_collaborator_id`(`id`) USING BTREE,
  INDEX `FK_cpc_partner_collaborator_info`(`partner_info_id`) USING BTREE,
  CONSTRAINT `FK_cpc_partner_collaborator_info` FOREIGN KEY (`partner_info_id`) REFERENCES `cpc_partner_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '伙伴协作人' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cpc_partner_contact
-- ----------------------------
DROP TABLE IF EXISTS `cpc_partner_contact`;
CREATE TABLE `cpc_partner_contact`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识ID',
  `partner_info_id` bigint(20) NOT NULL COMMENT '关联伙伴信息ID（外键）',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `telphone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固话',
  `dept_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `position` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（1有效、2无效）',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_default` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否默认（0：否，1：是）',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `creator_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_cpc_partner_contact_id`(`id`) USING BTREE,
  INDEX `FK_cpc_partner_contact_info`(`partner_info_id`) USING BTREE,
  CONSTRAINT `FK_cpc_partner_contact_info` FOREIGN KEY (`partner_info_id`) REFERENCES `cpc_partner_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '伙伴联系人' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cpc_partner_follow_up
-- ----------------------------
DROP TABLE IF EXISTS `cpc_partner_follow_up`;
CREATE TABLE `cpc_partner_follow_up`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `partner_info_id` bigint(20) NOT NULL COMMENT '伙伴信息ID（外键）',
  `user_id` decimal(20, 0) NOT NULL COMMENT '跟进人',
  `fu_mode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跟进方式（关联数据字典：follow-mode）',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跟进状态',
  `attachment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件信息',
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片信息',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跟进描述',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `creator_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_cpc_partner_follow_up_id`(`id`) USING BTREE,
  INDEX `FK_cpc_partner_follow_up_cpc_partner_info`(`partner_info_id`) USING BTREE,
  CONSTRAINT `FK_cpc_partner_follow_up_cpc_partner_info` FOREIGN KEY (`partner_info_id`) REFERENCES `cpc_partner_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '伙伴跟进记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cpc_partner_info
-- ----------------------------
DROP TABLE IF EXISTS `cpc_partner_info`;
CREATE TABLE `cpc_partner_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识主键',
  `corp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司名称',
  `source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '伙伴来源（关联数据字典：partner_source）',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '伙伴类型（数据字典：partner_type）',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '合作状态（数据字典：partner_status）',
  `is_active` tinyint(4) NULL DEFAULT NULL COMMENT '是否激活（0：未激活、1：已激活）',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '负责人ID',
  `biz_oppor_info_id` bigint(20) NULL DEFAULT NULL COMMENT '商机信息ID（商机转化的记录商机ID）',
  `contact_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人姓名',
  `contact_sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人性别',
  `contact_mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人手机',
  `contact_telphone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人固话',
  `contact_dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人所在部门',
  `contact_position` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人职位',
  `contact_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人住址',
  `org_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织类型（数据字典：partner_org_type）',
  `corp_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业地址',
  `industry` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属行业',
  `website` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网址',
  `legal_person` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人代表',
  `registration_time` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `registration_office` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册机关',
  `registration_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册编号',
  `registration_money` decimal(10, 0) NULL DEFAULT NULL COMMENT '注册资金',
  `corp_nature` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业性质（数据字典：corp_nature）',
  `corp_size` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业规模（数据字典:corp_size）',
  `corp_area` bigint(20) NULL DEFAULT NULL COMMENT '企业所在区域（关联区域表）',
  `corp_postal_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业邮政编码',
  `corp_fax_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业传真号码',
  `corp_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业电话',
  `main_business_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主营产品类型（数据字典：main_business_type）',
  `main_business_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主营业务描述',
  `main_customer_group` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主营客户群体（数据字典：main_customer_group）',
  `business_area_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务区域描述',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `it_team_size` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'IT团队规模（数据字典：it_team_size）',
  `it_language` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主要开发语言',
  `it_database` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主要数据库',
  `core_pro_system` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核心产品和系统',
  `it_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'it补充说明',
  `next_fu_time` datetime(0) NULL DEFAULT NULL COMMENT '下次跟进时间',
  `last_fu_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后跟进人，存储用户名',
  `last_fu_time` datetime(0) NULL DEFAULT NULL COMMENT '最后跟进时间',
  `last_fu_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后跟进内容',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `creator_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本号',
  `is_remind` tinyint(1) NULL DEFAULT 0 COMMENT '是否提醒（0：否 1：是）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_cpc_partner_info_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '伙伴信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cpc_partner_op_log
-- ----------------------------
DROP TABLE IF EXISTS `cpc_partner_op_log`;
CREATE TABLE `cpc_partner_op_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识主键',
  `partner_info_id` bigint(20) NOT NULL COMMENT '伙伴信息ID（外键）',
  `op_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `op_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型（数据字典：customer_op_type）',
  `op_time` datetime(0) NOT NULL COMMENT '创建时间',
  `op_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作描述',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_cpc_partner_op_log_id`(`id`) USING BTREE,
  INDEX `FK_cpc_partner_op_log_info`(`partner_info_id`) USING BTREE,
  CONSTRAINT `FK_cpc_partner_op_log_info` FOREIGN KEY (`partner_info_id`) REFERENCES `cpc_partner_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '伙伴信息操作日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cpc_partner_sum
-- ----------------------------
DROP TABLE IF EXISTS `cpc_partner_sum`;
CREATE TABLE `cpc_partner_sum`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识自增长主键',
  `partner_info_id` bigint(20) NOT NULL COMMENT '伙伴信息ID（外键）',
  `total_contact_num` int(11) NULL DEFAULT 0 COMMENT '总联系人数量',
  `total_customer_num` int(11) NULL DEFAULT NULL COMMENT '总客户数量',
  `total_account_num` int(11) NULL DEFAULT NULL COMMENT '总账号数量',
  `total_bo_num` int(11) NULL DEFAULT NULL COMMENT '总商机数量',
  `total_cons_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '总消费金额',
  `total_prepaid_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '总预付费金额',
  `total_postpaid_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '总后付费金额',
  `total_attach_num` int(11) NULL DEFAULT NULL COMMENT '总附件数量',
  `total_follow_up_num` int(11) NULL DEFAULT NULL COMMENT '总跟进数量',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `creator_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_cpc_partner_sum_id`(`id`) USING BTREE,
  INDEX `FK_cpc_partner_sum_info`(`partner_info_id`) USING BTREE,
  CONSTRAINT `FK_cpc_partner_sum_info` FOREIGN KEY (`partner_info_id`) REFERENCES `cpc_partner_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '伙伴数据汇总' ROW_FORMAT = Compact;

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
