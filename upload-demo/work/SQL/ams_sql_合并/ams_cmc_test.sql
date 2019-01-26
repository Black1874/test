/*
 Navicat Premium Data Transfer

 Source Server         : ams-cmc
 Source Server Type    : MySQL
 Source Server Version : 50670
 Source Host           : rm-wz9w1r3jr728r43xdoo.mysql.rds.aliyuncs.com:3306
 Source Schema         : ams_cmc_test

 Target Server Type    : MySQL
 Target Server Version : 50670
 File Encoding         : 65001

 Date: 19/01/2019 09:39:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cmc_act_perf_belong
-- ----------------------------
DROP TABLE IF EXISTS `cmc_act_perf_belong`;
CREATE TABLE `cmc_act_perf_belong`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识主键',
  `customer_account_id` bigint(20) NOT NULL COMMENT '客户账号id（外键关联）',
  `sales_id` bigint(20) NOT NULL COMMENT '关联销售员表id（当业绩关联团队时，为-1）',
  `sales_team_id` bigint(20) NOT NULL COMMENT '关联销售团队表id',
  `share_ratio` decimal(10, 1) NULL DEFAULT NULL COMMENT '分成比例（全部分成为1，其他为小数）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分成备注',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_cmc_account_performance_belong_id`(`id`) USING BTREE,
  INDEX `FK_cmc_aab_customer_account`(`customer_account_id`) USING BTREE,
  CONSTRAINT `FK_cmc_aab_customer_account` FOREIGN KEY (`customer_account_id`) REFERENCES `cmc_customer_account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户账号业绩归属' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cmc_act_perf_belong_effect
-- ----------------------------
DROP TABLE IF EXISTS `cmc_act_perf_belong_effect`;
CREATE TABLE `cmc_act_perf_belong_effect`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识ID',
  `customer_account_id` bigint(20) NOT NULL COMMENT '客户账号id（关联）',
  `year` decimal(10, 0) NOT NULL COMMENT '年份',
  `month` decimal(10, 0) NOT NULL COMMENT '月份',
  `sales_id` bigint(20) NOT NULL COMMENT '销售员表id（当关联团队时，为-1）',
  `sales_iteam_id` bigint(20) NOT NULL COMMENT '销售团队表id',
  `share_ratio` decimal(10, 1) NOT NULL COMMENT '分成比例（全部分成为1，其他为小数）',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_cmc_account_performance_belong_effect_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账号归属生效配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cmc_clue_account
-- ----------------------------
DROP TABLE IF EXISTS `cmc_clue_account`;
CREATE TABLE `cmc_clue_account`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识主键',
  `clue_info_id` bigint(20) NULL DEFAULT NULL COMMENT '线索信息id（外键）',
  `account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号状态：0未关联、1已关联、2未知、3报备、4其他渠道',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号描述',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `creator_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_cmc_clue_account_id`(`id`) USING BTREE,
  INDEX `FK_cmc_clue_account_clue_info`(`clue_info_id`) USING BTREE,
  CONSTRAINT `FK_cmc_clue_account_clue_info` FOREIGN KEY (`clue_info_id`) REFERENCES `cmc_clue_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '线索-账号信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cmc_clue_attachment
-- ----------------------------
DROP TABLE IF EXISTS `cmc_clue_attachment`;
CREATE TABLE `cmc_clue_attachment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '附件ID（主键）',
  `clue_info_id` bigint(20) NOT NULL COMMENT '关联线索信息ID',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件标题',
  `file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称',
  `postfix` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件后缀',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件描述',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `creator_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_cmc_clue_attachment_id`(`id`) USING BTREE,
  INDEX `FK_cmc_clue_attachment_cmc_clue_info`(`clue_info_id`) USING BTREE,
  CONSTRAINT `FK_cmc_clue_attachment_cmc_clue_info` FOREIGN KEY (`clue_info_id`) REFERENCES `cmc_clue_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '线索附件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cmc_clue_follow_up
-- ----------------------------
DROP TABLE IF EXISTS `cmc_clue_follow_up`;
CREATE TABLE `cmc_clue_follow_up`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `clue_info_id` bigint(20) NOT NULL COMMENT '线索信息ID（外键）',
  `user_id` bigint(20) NOT NULL COMMENT '跟进人',
  `fu_mode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跟进方式（关联数据字典：follow-mode）',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跟进状态',
  `attachment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件信息',
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片信息',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跟进描述',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `creator_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_cmc_clue_follow_up_id`(`id`) USING BTREE,
  INDEX `FK_cmc_clue_follow_up_cmc_clue_info`(`clue_info_id`) USING BTREE,
  CONSTRAINT `FK_cmc_clue_follow_up_cmc_clue_info` FOREIGN KEY (`clue_info_id`) REFERENCES `cmc_clue_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '线索跟进记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cmc_clue_info
-- ----------------------------
DROP TABLE IF EXISTS `cmc_clue_info`;
CREATE TABLE `cmc_clue_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识主键',
  `corp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司名称',
  `industry` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属行业',
  `contact_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人姓名',
  `contact_sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人性别',
  `contact_telphone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人固话',
  `contact_mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人手机号码',
  `contact_dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人所在部门',
  `contact_position` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人职位',
  `contact_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人住址',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '负责人ID',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线索状态（关联数据字典：clue_status，线索状态（关联数据字典：clue_status，如：未转化、已转化））',
  `fu_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跟进状态',
  `website` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网址',
  `corp_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业地址',
  `source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据来源（关联数据字典：clue_source）',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `next_fu_time` datetime(0) NULL DEFAULT NULL COMMENT '下次跟进时间',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `creator_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `is_remind` tinyint(1) NULL DEFAULT 0 COMMENT '是否提醒（0：不提醒 1：提醒）',
  `site_area` bigint(20) NULL DEFAULT NULL COMMENT '站点归属（区域关联）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_cmc_clue_info_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '线索信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cmc_clue_op_log
-- ----------------------------
DROP TABLE IF EXISTS `cmc_clue_op_log`;
CREATE TABLE `cmc_clue_op_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识主键',
  `clue_info_id` bigint(20) NOT NULL COMMENT '线索信息（外键关联）',
  `op_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `op_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型（数据字典：clue_op_type）',
  `op_time` datetime(0) NOT NULL COMMENT '操作时间',
  `op_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作描述',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_cmc_clue_op_log_id`(`id`) USING BTREE,
  INDEX `FK_cmc_clue_op_log_id`(`clue_info_id`) USING BTREE,
  CONSTRAINT `FK_cmc_clue_op_log_id` FOREIGN KEY (`clue_info_id`) REFERENCES `cmc_clue_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户操作日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cmc_customer_account
-- ----------------------------
DROP TABLE IF EXISTS `cmc_customer_account`;
CREATE TABLE `cmc_customer_account`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识主键',
  `customer_info_id` bigint(20) NOT NULL COMMENT '客户信息id（外键）',
  `account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `is_active` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否激活（0：未激活、1：已激活）',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号状态：0无效  1有效',
  `relation_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联状态，数据字典（cst_account_relation_status）',
  `belong_account` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '归属账号（关联的归属阿里云账号）',
  `belong_account_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属账号类型（关联数据字典belong_account_type）',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号描述',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `creator_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_cmc_customer_account_id`(`id`) USING BTREE,
  INDEX `FK_cmc_customer_account_customer_info`(`customer_info_id`) USING BTREE,
  CONSTRAINT `FK_cmc_customer_account_customer_info` FOREIGN KEY (`customer_info_id`) REFERENCES `cmc_customer_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户-账号信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cmc_customer_attachment
-- ----------------------------
DROP TABLE IF EXISTS `cmc_customer_attachment`;
CREATE TABLE `cmc_customer_attachment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件ID（主键）',
  `customer_info_id` bigint(20) NOT NULL COMMENT '关联客户信息ID',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件标题',
  `file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称',
  `postfix` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件后缀',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件描述',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `creator_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_cmc_customer_attachment_id`(`id`) USING BTREE,
  INDEX `FK_cmc_customer_attachment_info`(`customer_info_id`) USING BTREE,
  CONSTRAINT `FK_cmc_customer_attachment_info` FOREIGN KEY (`customer_info_id`) REFERENCES `cmc_customer_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户附件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cmc_customer_collaborator
-- ----------------------------
DROP TABLE IF EXISTS `cmc_customer_collaborator`;
CREATE TABLE `cmc_customer_collaborator`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '协作人ID（主键）',
  `customer_info_id` bigint(20) NOT NULL COMMENT '客户信息ID（关联）',
  `user_id` bigint(20) NOT NULL COMMENT '协作人用户id（关联）',
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `creator_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_cmc_customer_collaborator_id`(`id`) USING BTREE,
  INDEX `FK_cmc_customer_collaborator_info`(`customer_info_id`) USING BTREE,
  CONSTRAINT `FK_cmc_customer_collaborator_info` FOREIGN KEY (`customer_info_id`) REFERENCES `cmc_customer_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户协作人' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cmc_customer_contact
-- ----------------------------
DROP TABLE IF EXISTS `cmc_customer_contact`;
CREATE TABLE `cmc_customer_contact`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识ID',
  `customer_info_id` bigint(20) NOT NULL COMMENT '关联客户信息ID（外键）',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `telphone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固话',
  `dept_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `position` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '状态（1有效、2无效）',
  `is_default` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否默认（0：否，1：是）',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `creator_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_cmc_customer_contact_id`(`id`) USING BTREE,
  INDEX `FK_cmc_customer_contact_cmc_customer_info`(`customer_info_id`) USING BTREE,
  CONSTRAINT `FK_cmc_customer_contact_cmc_customer_info` FOREIGN KEY (`customer_info_id`) REFERENCES `cmc_customer_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户联系人' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cmc_customer_follow_up
-- ----------------------------
DROP TABLE IF EXISTS `cmc_customer_follow_up`;
CREATE TABLE `cmc_customer_follow_up`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `customer_info_id` bigint(20) NOT NULL COMMENT '客户信息ID（外键）',
  `user_id` bigint(20) NOT NULL COMMENT '跟进人',
  `fu_mode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跟进方式（关联数据字典：follow-mode）',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跟进状态',
  `attachment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件信息',
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片信息',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跟进描述',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `creator_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_cmc_customer_follow_up_id`(`id`) USING BTREE,
  INDEX `FK_cmc_customer_follow_up_customer_info`(`customer_info_id`) USING BTREE,
  CONSTRAINT `FK_cmc_customer_follow_up_customer_info` FOREIGN KEY (`customer_info_id`) REFERENCES `cmc_customer_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户跟进记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cmc_customer_info
-- ----------------------------
DROP TABLE IF EXISTS `cmc_customer_info`;
CREATE TABLE `cmc_customer_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识主键',
  `corp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司名称',
  `source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户来源（关联数据字典：customer_source）',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户类型，关联数据字典（customer_type）',
  `belong_channel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '渠道归属 (自有、合作伙伴、自有+合作伙伴)\n	（关联数据字典：customer_channel_belong）',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '客户状态（1: 有效、2：无效 ）',
  `do_open` tinyint(4) NOT NULL DEFAULT 0 COMMENT '电销是否可跟（0：否 1：是）',
  `is_active` tinyint(4) NULL DEFAULT NULL COMMENT '是否激活（0：未激活、1：已激活）',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '负责人ID',
  `contact_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人姓名',
  `contact_sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人性别',
  `contact_mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人手机号码',
  `contact_telphone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人固话',
  `contact_dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人所在部门',
  `contact_position` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人职位',
  `contact_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人住址',
  `corp_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业地址',
  `industry` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属行业',
  `website` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网址',
  `main_business` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主营业务描述',
  `business_area` int(11) NULL DEFAULT NULL COMMENT '业务区域（基础表-可考虑小表广播）',
  `legal_person` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人代表',
  `established_time` datetime(0) NULL DEFAULT NULL COMMENT '成立时间',
  `corp_nature` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业性质（数据字典：corp_nature）',
  `corp_size` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业规模（数据字典:corp_size）',
  `area` int(11) NULL DEFAULT NULL COMMENT '所属区域（关联区域表）',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `it_team_size` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IT团队规模（数据字典：it_team_size）',
  `it_language` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主要开发语言',
  `it_cloud_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上云情况',
  `it_database` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主要数据库',
  `core_pro_system` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核心产品和系统',
  `it_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'it补充说明',
  `next_fu_time` datetime(0) NULL DEFAULT NULL COMMENT '下次跟进时间',
  `last_fu_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后跟进人，存储用户名',
  `last_fu_time` datetime(0) NULL DEFAULT NULL COMMENT '最后跟进时间',
  `last_fu_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后跟进内容',
  `technical_engineer_id` bigint(20) NULL DEFAULT NULL COMMENT '架构师负责人（关联：tsc_technical_engineer）',
  `partner_id` bigint(20) NULL DEFAULT NULL COMMENT '伙伴id（关联：cpc_partner_info）',
  `clue_id` bigint(20) NULL DEFAULT NULL COMMENT '线索ID（关联：cmc_clue_info）',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `creator_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `is_remind` tinyint(1) NULL DEFAULT 0 COMMENT '是否设置提醒（0：不提醒、1:提醒）',
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除（0：未删除、1：已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_cmc_customer_info_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '线索信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cmc_customer_op_log
-- ----------------------------
DROP TABLE IF EXISTS `cmc_customer_op_log`;
CREATE TABLE `cmc_customer_op_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识主键',
  `customer_info_id` bigint(20) NOT NULL COMMENT '客户信息ID（外键）',
  `op_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `op_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型（数据字典：customer_op_type）',
  `op_time` datetime(0) NOT NULL COMMENT '创建时间',
  `op_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作描述',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_cmc_customer_op_log_id`(`id`) USING BTREE,
  INDEX `FK_cmc_customer_op_log_info`(`customer_info_id`) USING BTREE,
  CONSTRAINT `FK_cmc_customer_op_log_info` FOREIGN KEY (`customer_info_id`) REFERENCES `cmc_customer_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 170 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户信息操作日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cmc_customer_sum
-- ----------------------------
DROP TABLE IF EXISTS `cmc_customer_sum`;
CREATE TABLE `cmc_customer_sum`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识自增长主键',
  `customer_info_id` bigint(20) NOT NULL COMMENT '客户信息ID（外键）',
  `total_contact_num` decimal(10, 0) NULL DEFAULT 0 COMMENT '总联系人数量',
  `total_account_num` decimal(10, 0) NULL DEFAULT NULL COMMENT '总账号数量',
  `total_bo_num` decimal(10, 0) NULL DEFAULT NULL COMMENT '总商机数量',
  `total_cons_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '总消费金额',
  `total_prepaid_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '总预付费金额',
  `total_postpaid_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '总后付费金额',
  `total_attach_num` decimal(10, 0) NULL DEFAULT NULL COMMENT '总附件数量',
  `total_follow_up_num` decimal(10, 0) NULL DEFAULT NULL COMMENT '总跟进数量',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `creator_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_cmc_customer_sum_id`(`id`) USING BTREE,
  INDEX `FK_cmc_customer_sum_customer_info`(`customer_info_id`) USING BTREE,
  CONSTRAINT `FK_cmc_customer_sum_customer_info` FOREIGN KEY (`customer_info_id`) REFERENCES `cmc_customer_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户数据汇总' ROW_FORMAT = Compact;

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
