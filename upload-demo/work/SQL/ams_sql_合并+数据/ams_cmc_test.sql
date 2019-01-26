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

 Date: 19/01/2019 10:11:05
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
-- Records of cmc_act_perf_belong
-- ----------------------------
INSERT INTO `cmc_act_perf_belong` VALUES (6, 17, 23, 1, 0.0, '备注', '超级管理员', 1, '2019-01-15 19:53:54', '超级管理员', 1, NULL, NULL);
INSERT INTO `cmc_act_perf_belong` VALUES (7, 18, 10, 1, 5.7, '备注', '超级管理员', 1, '2019-01-15 19:54:01', '超级管理员', 1, NULL, NULL);
INSERT INTO `cmc_act_perf_belong` VALUES (8, 20, -1, 1, 5.8, '备注', '超级管理员', 1, '2019-01-15 19:54:33', '超级管理员', 1, NULL, NULL);

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
-- Records of cmc_customer_account
-- ----------------------------
INSERT INTO `cmc_customer_account` VALUES (1, 3, '1008611', 1, '', NULL, '', NULL, NULL, '', 0, '2019-01-12 12:50:10', NULL, NULL, NULL, NULL);
INSERT INTO `cmc_customer_account` VALUES (2, 3, '1111', 1, 'ENABLE', 'NEW_ADD', '10031010001', 'GZ-QL', '备注', '', 0, '2019-01-12 12:50:13', '超级管理员', 1, '2019-01-16 09:06:35', NULL);
INSERT INTO `cmc_customer_account` VALUES (3, 3, '1008617', 1, '', NULL, '', NULL, NULL, '', 0, '2019-01-12 12:50:17', NULL, NULL, NULL, NULL);
INSERT INTO `cmc_customer_account` VALUES (4, 1, '1008612', 0, '', NULL, '', NULL, NULL, '', 0, '2019-01-12 12:50:20', NULL, NULL, NULL, NULL);
INSERT INTO `cmc_customer_account` VALUES (5, 5, '1008613', 0, '', NULL, '', NULL, NULL, '', 0, '2019-01-12 12:50:22', NULL, NULL, NULL, NULL);
INSERT INTO `cmc_customer_account` VALUES (17, 2, '10031010002', 1, 'ENABLE', 'NEW_ADD', '10031010001', 'GZ-QL', '备注', '超级管理员', 1, '2019-01-15 19:53:54', '超级管理员', 1, '2019-01-15 19:53:54', NULL);
INSERT INTO `cmc_customer_account` VALUES (18, 2, '10031010002', 1, 'ENABLE', 'NEW_ADD', '10031010001', 'GZ-QL', '备注', '超级管理员', 1, '2019-01-15 19:54:01', '超级管理员', 1, '2019-01-15 19:54:01', NULL);
INSERT INTO `cmc_customer_account` VALUES (19, 2, '10031010002', 1, 'ENABLE', 'NEW_ADD', '10031010001', 'GZ-QL', '备注', '超级管理员', 1, '2019-01-15 19:54:25', '超级管理员', 1, '2019-01-15 19:54:25', NULL);
INSERT INTO `cmc_customer_account` VALUES (20, 2, '10031010002', 1, 'ENABLE', 'NEW_ADD', '10031010001', 'GZ-QL', '备注', '超级管理员', 1, '2019-01-15 19:54:33', '超级管理员', 1, '2019-01-15 19:54:33', NULL);
INSERT INTO `cmc_customer_account` VALUES (21, 2, '10031010002', 1, 'ENABLE', 'NEW_ADD', '10031010001', 'GZ-QL', '备注', '超级管理员', 1, '2019-01-15 20:07:54', '超级管理员', 1, '2019-01-15 20:07:54', NULL);
INSERT INTO `cmc_customer_account` VALUES (22, 2, '10031010002', 1, 'ENABLE', 'NEW_ADD', '10031010001', 'GZ-QL', '备注', '超级管理员', 1, '2019-01-15 20:08:03', '超级管理员', 1, '2019-01-15 20:08:03', NULL);

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
-- Records of cmc_customer_collaborator
-- ----------------------------
INSERT INTO `cmc_customer_collaborator` VALUES (12, 2, 1, '添加客户协作人!', '超级管理员', 1, '2019-01-15 10:34:18', '超级管理员', 1, '2019-01-15 10:34:18', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (13, 2, 2, '添加客户协作人!', '超级管理员', 1, '2019-01-15 10:34:18', '超级管理员', 1, '2019-01-15 10:34:18', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (14, 2, 3, '添加客户协作人!', '超级管理员', 1, '2019-01-15 10:34:18', '超级管理员', 1, '2019-01-15 10:34:18', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (15, 31, 1, '', '超级管理员', 1, '2019-01-16 13:48:35', '超级管理员', 1, '2019-01-16 13:48:35', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (16, 31, 2, '', '超级管理员', 1, '2019-01-16 13:48:35', '超级管理员', 1, '2019-01-16 13:48:35', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (17, 31, 3, '', '超级管理员', 1, '2019-01-16 13:48:35', '超级管理员', 1, '2019-01-16 13:48:35', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (26, 32, 10, '', '超级管理员', 1, '2019-01-16 15:13:52', '超级管理员', 1, '2019-01-16 15:13:52', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (27, 32, 11, '', '超级管理员', 1, '2019-01-16 15:13:52', '超级管理员', 1, '2019-01-16 15:13:52', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (28, 50, 1, '', '超级管理员', 1, '2019-01-18 09:45:39', '超级管理员', 1, '2019-01-18 09:45:39', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (29, 50, 2, '', '超级管理员', 1, '2019-01-18 09:45:39', '超级管理员', 1, '2019-01-18 09:45:39', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (30, 50, 3, '', '超级管理员', 1, '2019-01-18 09:45:39', '超级管理员', 1, '2019-01-18 09:45:39', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (31, 58, 1, '', '超级管理员', 1, '2019-01-18 10:04:01', '超级管理员', 1, '2019-01-18 10:04:01', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (32, 58, 2, '', '超级管理员', 1, '2019-01-18 10:04:01', '超级管理员', 1, '2019-01-18 10:04:01', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (33, 58, 3, '', '超级管理员', 1, '2019-01-18 10:04:01', '超级管理员', 1, '2019-01-18 10:04:01', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (34, 59, 1, '', '超级管理员', 1, '2019-01-18 10:05:03', '超级管理员', 1, '2019-01-18 10:05:03', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (35, 59, 2, '', '超级管理员', 1, '2019-01-18 10:05:03', '超级管理员', 1, '2019-01-18 10:05:03', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (36, 59, 3, '', '超级管理员', 1, '2019-01-18 10:05:03', '超级管理员', 1, '2019-01-18 10:05:03', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (37, 60, 1, '', '超级管理员', 1, '2019-01-18 10:07:20', '超级管理员', 1, '2019-01-18 10:07:20', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (38, 60, 2, '', '超级管理员', 1, '2019-01-18 10:07:20', '超级管理员', 1, '2019-01-18 10:07:20', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (39, 61, 1, '', '超级管理员', 1, '2019-01-18 10:09:45', '超级管理员', 1, '2019-01-18 10:09:45', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (40, 61, 2, '', '超级管理员', 1, '2019-01-18 10:09:45', '超级管理员', 1, '2019-01-18 10:09:45', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (41, 64, 1, '', '超级管理员', 1, '2019-01-18 10:10:43', '超级管理员', 1, '2019-01-18 10:10:43', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (42, 65, 1, '', '超级管理员', 1, '2019-01-18 10:14:55', '超级管理员', 1, '2019-01-18 10:14:55', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (43, 65, 2, '', '超级管理员', 1, '2019-01-18 10:14:55', '超级管理员', 1, '2019-01-18 10:14:55', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (44, 66, 1, '', '超级管理员', 1, '2019-01-18 10:15:33', '超级管理员', 1, '2019-01-18 10:15:33', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (45, 66, 2, '', '超级管理员', 1, '2019-01-18 10:15:33', '超级管理员', 1, '2019-01-18 10:15:33', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (46, 67, 1, '', '超级管理员', 1, '2019-01-18 10:16:19', '超级管理员', 1, '2019-01-18 10:16:19', NULL);
INSERT INTO `cmc_customer_collaborator` VALUES (47, 67, 2, '', '超级管理员', 1, '2019-01-18 10:16:19', '超级管理员', 1, '2019-01-18 10:16:19', NULL);

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
-- Records of cmc_customer_contact
-- ----------------------------
INSERT INTO `cmc_customer_contact` VALUES (14, 3, 'black2', NULL, '13567671111', NULL, NULL, NULL, NULL, '1', 0, NULL, '超级管理员', 1, '2019-01-14 16:27:45', '超级管理员', 1, '2019-01-14 16:27:45', NULL);
INSERT INTO `cmc_customer_contact` VALUES (15, 3, 'black2', NULL, '13567671111', NULL, NULL, NULL, NULL, '1', 0, NULL, '超级管理员', 1, '2019-01-14 16:27:45', '超级管理员', 1, '2019-01-14 16:27:45', NULL);
INSERT INTO `cmc_customer_contact` VALUES (16, 3, 'black2', NULL, '13567671111', NULL, NULL, NULL, NULL, '1', 0, NULL, '超级管理员', 1, '2019-01-14 16:27:45', '超级管理员', 1, '2019-01-14 16:27:45', NULL);
INSERT INTO `cmc_customer_contact` VALUES (17, 3, 'black2', NULL, '13567671111', NULL, NULL, NULL, NULL, '1', 0, NULL, '超级管理员', 1, '2019-01-14 16:27:45', '超级管理员', 1, '2019-01-14 16:27:45', NULL);
INSERT INTO `cmc_customer_contact` VALUES (18, 10, 'black2', NULL, '13567671111', NULL, NULL, NULL, NULL, '1', 0, NULL, '超级管理员', 1, '2019-01-14 19:57:09', '超级管理员', 1, '2019-01-14 19:57:09', NULL);
INSERT INTO `cmc_customer_contact` VALUES (19, 10, 'black2', NULL, '13567671111', NULL, NULL, NULL, NULL, '1', 0, NULL, '超级管理员', 1, '2019-01-14 19:57:39', '超级管理员', 1, '2019-01-14 19:57:39', NULL);

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
-- Records of cmc_customer_follow_up
-- ----------------------------
INSERT INTO `cmc_customer_follow_up` VALUES (4, 2, 10, 'EMAIL', 'COMPLETED', 'xxxxx.txt', '1111.peg', 'nothing', '超级管理员', 1, '2019-01-18 09:56:53', '超级管理员', 1, '2019-01-18 09:56:53', NULL);
INSERT INTO `cmc_customer_follow_up` VALUES (5, 2, 10, 'EMAIL', 'COMPLETED', 'xxxxx.txt', '1111.peg', 'nothing', '超级管理员', 1, '2019-01-18 09:56:54', '超级管理员', 1, '2019-01-18 09:56:54', NULL);
INSERT INTO `cmc_customer_follow_up` VALUES (6, 2, 10, 'EMAIL', 'COMPLETED', 'xxxxx.txt', '1111.peg', 'nothing', '超级管理员', 1, '2019-01-18 09:56:54', '超级管理员', 1, '2019-01-18 09:56:54', NULL);
INSERT INTO `cmc_customer_follow_up` VALUES (7, 2, 10, 'EMAIL', 'COMPLETED', 'xxxxx.txt', '1111.peg', 'nothing', '超级管理员', 1, '2019-01-18 09:56:55', '超级管理员', 1, '2019-01-18 09:56:55', NULL);

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
-- Records of cmc_customer_info
-- ----------------------------
INSERT INTO `cmc_customer_info` VALUES (0, '广州青莲有限公司8', 'CLUE', 'IMPORTANT', 'OWN', 'DISABLE', 0, 0, 10, '陈宇仁', '2', '13979562413', '0797-3811111', '研发创新部', '部门经理', '广州天河', '广州天河', 'IT', 'www.baidu.com', 'IT安全', 11111, 'black', '2019-01-11 15:01:52', '国有企业', 'L7', 11111, '备注', 'L1', 'java', '主要业务已经部署在阿里云', 'mysql', '阿里云服务', 'hahaha', '2019-01-07 15:01:52', NULL, NULL, NULL, 11, NULL, NULL, '超级管理员', 10, '2019-01-11 15:01:52', 'black', 10, '2019-01-12 12:05:07', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (1, 'xxxxxxxxxxx', 'SELF_MINING', 'IMPORTANT', 'OWN', 'ENABLE', 0, 0, 100, '陈宇仁', '2', '13979562413', '0797-3811111', '研发创新部', '部门经理', '广州天河', '广州天河', 'IT', 'www.baidu.com', 'xxx', 11111, 'black', '2019-01-07 15:01:52', '国有企业', 'L7', 11111, '备注', 'L1', 'java', '主要业务已经部署在阿里云', 'mysql', '云', '云云', '2019-01-07 14:58:52', NULL, NULL, NULL, 11, NULL, NULL, '超级管理员', 10, '2019-01-04 17:02:00', '超级管理员', 1, '2019-01-16 15:15:21', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (2, '深圳华为有限公司', 'HISTORICAL', 'IMPORTANT', 'OWN', 'DISABLE', 0, 1, 100, '小花', '2', '13979562413', '0797-3811111', '研发创新部', '部门经理', '广州天河', '广州天河', 'IT', 'www.baidu.com', 'xx', 11111, 'black', '2019-01-07 15:01:52', '国有企业', 'L7', 22222, '备注', 'L1', 'java', '主要业务已经部署在阿里云', 'mysql', '云', '云', '2019-01-31 18:11:11', '超级管理员', '2019-01-18 09:56:55', 'nothing', 11, NULL, NULL, '超级管理员', 10, '2019-01-04 17:05:20', '超级管理员', 1, '2019-01-16 15:15:21', NULL, 0, 1);
INSERT INTO `cmc_customer_info` VALUES (3, '广州青莲有限公司7', 'OTHER', 'IMPORTANT', 'OWN', 'ENABLE', 0, 1, 100, '陈宇仁', '2', '13979562413', '0797-3811111', '研发创新部', '部门经理', '广州天河', '广州天河', 'IT', 'www.baidu.com', 'xxxx', 11111, 'black', '2019-01-07 15:01:52', '国有企业', 'L7', 33333, '备注', 'L1', 'java', '主要业务已经部署在阿里云', 'mysql', '云', '云', '2019-01-07 14:58:52', NULL, NULL, NULL, 11, NULL, NULL, '超级管理员', 10, '2019-01-11 10:15:00', '超级管理员', 1, '2019-01-16 15:15:21', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (4, '广州青莲有限公司', 'CLUE', 'IMPORTANT', 'OWN', 'DISABLE', 0, 0, 100, '陈宇仁', '2', '13979562413', '0797-3811111', '研发创新部', '部门经理', '广州天河', '广州天河', 'IT', 'www.baidu.com', 'xxxxxx', 11111, 'black', '2019-01-11 15:01:52', '国有企业', 'L7', 11111, '备注', 'L1', 'java', '主要业务已经部署在阿里云', 'mysql', '阿里云服务', 'hahaha', '2019-01-07 14:58:52', NULL, NULL, NULL, 11, NULL, NULL, '超级管理员', 10, '2019-01-07 14:58:52', '超级管理员', 1, '2019-01-16 15:15:21', NULL, 0, 1);
INSERT INTO `cmc_customer_info` VALUES (5, '小米有限公司', 'SELF_MINING', 'ORDINARY', 'OWN', 'ENABLE', 0, 1, 1, '陈宇仁', '2', '13979562413', '0797-3811111', '研发创新部', '部门经理', '广州天河', '广州天河', 'IT', 'www.baidu.com', 'xxxxxx', 11111, 'black', '2019-01-07 15:01:52', '国有企业', 'L7', 11111, '备注', 'L1', 'java', '主要业务已经部署在阿里云', 'mysql', '阿里云服务', 'hahaha', '2019-01-07 15:01:52', NULL, NULL, NULL, 11, NULL, NULL, '超级管理员', 10, '2019-01-07 15:01:52', 'black', 10, '2019-01-12 12:05:10', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (6, '广州青莲有限公司4', 'HISTORICAL', 'ORDINARY', 'PARTNER', 'DISABLE', 0, 1, 1, '陈宇仁', '2', '13979562413', '0797-3811111', '研发创新部', '部门经理', '广州天河', '广州天河', 'IT', 'www.baidu.com', 'xxxxxx', 11111, 'black', '2019-01-07 15:06:41', '国有企业', 'L7', 11111, '备注', 'L1', 'java', '主要业务已经部署在阿里云', 'mysql', '阿里云服务', 'hahaha', '2019-01-07 15:06:41', NULL, NULL, NULL, 11, NULL, NULL, '超级管理员', 10, '2019-01-07 15:06:41', 'black', 10, '2019-01-12 12:05:13', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (7, '广州青莲有限公司1', 'OTHER', 'ORDINARY', 'PARTNER', 'ENABLE', 0, 1, 1, '陈宇仁', '2', '13979562413', '0797-3811111', '研发创新部', '部门经理', '广州天河', '广州天河', 'IT', 'www.baidu.com', 'xxxxxx', 11111, 'black', '2019-01-07 15:01:52', '国有企业', 'L7', 11111, '备注', 'L1', 'java', '主要业务已经部署在阿里云', 'mysql', '阿里云服务', 'hahaha', '2019-01-07 15:01:52', NULL, NULL, NULL, 11, NULL, NULL, '超级管理员', 10, '2019-01-07 15:01:52', 'black', 10, '2019-01-09 19:48:44', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (9, '小米有限公司1', 'CLUE', 'POTENTIAL', 'PARTNER', 'DISABLE', 0, 1, 10, '陈宇仁', '2', '13979562413', '0797-3811111', '研发创新部', '部门经理', '广州天河', '广州天河', 'IT', 'www.baidu.com', 'xxxxxx', 11111, 'black', '2019-01-11 15:01:52', '国有企业', 'L7', 11111, '备注', 'L1', 'java', '主要业务已经部署在阿里云', 'mysql', '阿里云服务', 'hahaha', '2019-01-07 15:01:52', NULL, NULL, NULL, 11, NULL, NULL, '超级管理员', 10, '2019-01-11 15:01:52', 'black', 10, '2019-01-09 19:48:44', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (10, '广州青莲有限公司2', 'SELF_MINING', 'POTENTIAL', 'PARTNER', 'ENABLE', 1, 0, 10, '陈宇仁', '2', '13979562413', '0797-3811111', '研发创新部', '部门经理', '广州天河', '广州天河', 'IT', 'www.baidu.com', 'xxxxxx', 11111, 'black', '2019-01-07 15:01:52', '国有企业', 'L7', 11111, '备注', 'L1', 'java', '主要业务已经部署在阿里云', 'mysql', '阿里云服务', 'hahaha', '2019-01-07 15:01:52', NULL, NULL, NULL, 11, NULL, NULL, '超级管理员', 10, '2019-01-07 15:01:52', 'black', 10, '2019-01-11 20:11:41', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (11, '广州青莲有限公司3', 'HISTORICAL', 'POTENTIAL', 'PARTNER', 'DISABLE', 1, 1, 10, '陈宇仁', '2', '13979562413', '0797-3811111', '研发创新部', '部门经理', '广州天河', '广州天河', 'IT', 'www.baidu.com', 'xxxxxx', 11111, 'black', '2019-01-07 15:01:52', '国有企业', 'L7', 11111, '备注', 'L1', 'java', '主要业务已经部署在阿里云', 'mysql', '阿里云服务', 'hahaha', '2019-01-07 15:01:52', NULL, NULL, NULL, 11, NULL, NULL, '超级管理员', 10, '2019-01-07 15:01:52', 'black', 10, '2019-01-12 12:05:15', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (12, '深圳华为有限公司1', 'OTHER', 'POTENTIAL', 'OWN_AND_PARTNER', 'ENABLE', 1, 1, 10, '陈宇仁', '2', '13979562413', '0797-3811111', '研发创新部', '部门经理', '广州天河', '广州天河', 'IT', 'www.baidu.com', 'xxxxxx', 11111, 'black', '2019-01-07 15:01:52', '国有企业', 'L7', 11111, '备注', 'L1', 'java', '主要业务已经部署在阿里云', 'mysql', '阿里云服务', 'hahaha', '2019-01-07 15:01:52', NULL, NULL, NULL, 11, NULL, NULL, '超级管理员', 10, '2019-01-18 15:01:52', 'black', 10, '2019-01-12 12:05:18', NULL, 0, 1);
INSERT INTO `cmc_customer_info` VALUES (16, '广州青莲有限公司5', 'CLUE', 'POTENTIAL', 'OWN_AND_PARTNER', 'DISABLE', 1, 0, 10, '陈宇仁', '2', '13979562413', '0797-3811111', '研发创新部', '部门经理', '广州天河', '广州天河', 'IT', 'www.baidu.com', 'xxxxxx', 11111, 'black', '2019-01-08 18:53:30', '国有企业', 'L7', 11111, '备注', 'L1', 'java', '主要业务已经部署在阿里云', 'mysql', '阿里云服务', 'hahaha', '2019-01-08 18:53:30', NULL, NULL, NULL, 11, NULL, NULL, '超级管理员', 10, '2019-01-08 18:53:30', 'black', 10, '2019-01-08 18:53:30', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (17, '深圳华为有限公司', 'SELF_MINING', 'POTENTIAL', 'OWN_AND_PARTNER', 'ENABLE', 1, 0, 10, '陈宇仁', '2', '13979562413', '0797-3811111', '研发创新部', '部门经理', '广州天河', '广州天河', 'IT', 'www.baidu.com', 'xxxxxx', 11111, 'black', '2019-01-08 18:55:54', '国有企业', 'L7', 11111, '备注', 'L1', 'java', '主要业务已经部署在阿里云', 'mysql', '阿里云服务', 'hahaha', '2019-01-08 18:55:54', NULL, NULL, NULL, 11, NULL, NULL, '超级管理员', 10, '2019-01-08 18:55:54', 'black', 10, '2019-01-08 18:55:54', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (18, '华为有限公司1', 'HISTORICAL', 'LOW_VALUE', 'OWN_AND_PARTNER', 'DISABLE', 1, 0, 6, 'black', '2', '13970111111', '0797-3811111', '研发创新部', '部门经理', '广州天河', '广州天河', 'IT', 'www.baidu.com', NULL, 11111, 'black', '2019-01-12 12:03:41', '国有企业', 'L7', 11111, '备注', 'L1', 'java', '主要业务已经部署在阿里云', 'mysql', NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, '超级管理员', 1, '2019-01-09 15:00:23', '超级管理员', 1, '2019-01-16 15:14:07', NULL, 0, 1);
INSERT INTO `cmc_customer_info` VALUES (19, '华为有限公司2', 'OTHER', 'LOW_VALUE', 'OWN_AND_PARTNER', 'ENABLE', 1, 0, 6, 'black', '2', '13970111111', '0797-3811111', '研发创新部', '部门经理', '广州天河', '广州天河', 'IT', 'www.baidu.com', NULL, 11111, 'black', '2019-01-12 12:03:43', '国有企业', 'L7', 11111, '备注', 'L1', 'java', '主要业务已经部署在阿里云', 'mysql', NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, '超级管理员', 1, '2019-01-09 15:02:35', '超级管理员', 1, '2019-01-09 19:53:08', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (20, '华为有限aa公司', 'CLUE', 'LOW_VALUE', 'OWN_AND_PARTNER', 'DISABLE', 1, 0, 6, 'black', '2', '13970111111', '0797-3811111', '研发创新部', '部门经理', '广州天河', '广州天河', 'IT', 'www.baidu.com', NULL, 11111, 'black', '2019-01-12 12:03:45', '国有企业', 'L7', 11111, '备注', 'L1', 'java', '主要业务已经部署在阿里云', 'mysql', NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, '超级管理员', 1, '2019-01-10 20:31:06', '超级管理员', 1, '2019-01-10 20:31:06', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (21, '华为有限aaaaa公司', 'SELF_MINING', 'LOW_VALUE', 'OWN_AND_PARTNER', 'ENABLE', 1, 0, 6, 'black', '2', '13970111222', '0797-3811111', '研发创新部', '部门经理', '广州天河', '广州天河', 'IT', 'www.baidu.com', NULL, 11111, 'black', '2019-01-12 12:03:47', '国有企业', 'L7', 11111, '备注', 'L1', 'java', '主要业务已经部署在阿里云', 'mysql', NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, '超级管理员', 1, '2019-01-10 20:33:47', '超级管理员', 1, '2019-01-10 20:33:47', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (29, '华为有限aaaaa公司11', '', 'Important', 'OWN', 'ENABLE', 1, NULL, 10, 'black', '2', '13979562413', NULL, '', NULL, '', '', 'IT', '', '', NULL, '', NULL, '', '', NULL, '', '', '', '', '', '', '', NULL, '', NULL, '', 11, NULL, NULL, '超级管理员', 1, '2019-01-12 14:19:37', '超级管理员', 1, '2019-01-12 14:19:37', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (31, '华为有限aaaa', '', 'Important', 'OWN', 'ENABLE', 0, NULL, 10, 'black', '2', '13979562413', NULL, '', NULL, '', '', 'IT', '', '', NULL, '', NULL, '', '', NULL, '', '', '', '', '', '', '', NULL, '', NULL, '', 11, NULL, NULL, '超级管理员', 1, '2019-01-16 13:48:35', '超级管理员', 1, '2019-01-16 13:48:35', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (32, '华为有限aaaabbb', '', 'Important', 'OWN', 'ENABLE', 0, NULL, 10, '小花', '2', '13979562413', NULL, '', NULL, '', '', 'IT', '', '', NULL, '', NULL, '', '', NULL, '', '', '', '', '', '', '', NULL, '', NULL, '', 1, 12, 1, '超级管理员', 1, '2019-01-16 13:50:07', '超级管理员', 1, '2019-01-16 15:13:51', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (50, '华为有限aaaabbb11111111', '', 'Important', 'OWN', 'ENABLE', 0, NULL, 10, 'black', '2', '13979562413', NULL, '', NULL, '', '', 'IT', '', NULL, NULL, '', NULL, '', '', NULL, '', '', '', '', '', '', '', NULL, '', NULL, '', 1, 12, 1, '超级管理员', 1, '2019-01-18 09:45:39', '超级管理员', 1, '2019-01-18 09:45:39', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (53, '华为有限aaa', '', 'Important', 'OWN', 'ENABLE', 0, NULL, 10, 'black', '2', '13979562413', NULL, '', NULL, '', '', 'IT', '', NULL, NULL, '', NULL, '', '', NULL, '', '', '', '', '', '', '', NULL, '', NULL, '', 1, 12, 1, '超级管理员', 1, '2019-01-18 10:00:12', '超级管理员', 1, '2019-01-18 10:00:12', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (56, '华为有限aaabbbbbb', '', 'Important', 'OWN', '1', 0, NULL, NULL, 'black', NULL, '13979562413', NULL, '', NULL, '', '', 'IT', '', NULL, NULL, '', NULL, '', '', NULL, '', '', '', '', '', '', '', NULL, '', NULL, '', NULL, NULL, NULL, '超级管理员', 1, '2019-01-18 10:01:48', '超级管理员', 1, '2019-01-18 10:01:48', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (58, '华为有限aaabbbbbb1111111', '', 'Important', 'OWN', '1', 0, NULL, NULL, 'black', NULL, '13979562413', NULL, '', NULL, '', '', 'IT', '', NULL, NULL, '', NULL, '', '', NULL, '', '', '', '', '', '', '', NULL, '', NULL, '', NULL, NULL, NULL, '超级管理员', 1, '2019-01-18 10:04:01', '超级管理员', 1, '2019-01-18 10:04:01', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (59, '华为有限aaabbbbbb1111111111', '', 'Important', 'OWN', '1', 0, NULL, NULL, 'black', NULL, '13979562413', NULL, '', NULL, '', '', 'IT', '', NULL, NULL, '', NULL, '', '', NULL, '', '', '', '', '', '', '', NULL, '', NULL, '', NULL, NULL, NULL, '超级管理员', 1, '2019-01-18 10:05:03', '超级管理员', 1, '2019-01-18 10:05:03', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (60, '广州科技有效公司', NULL, 'IMPORTANT', 'OWN', '1', 0, NULL, NULL, '张三三', NULL, '13568596428', NULL, NULL, NULL, NULL, NULL, '销售', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '超级管理员', 1, '2019-01-18 10:07:20', '超级管理员', 1, '2019-01-18 10:07:20', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (61, '广州科技有效公司111', NULL, 'IMPORTANT', 'OWN', '1', 0, NULL, NULL, '张三三', NULL, '13568596428', NULL, NULL, NULL, NULL, NULL, '销售', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '超级管理员', 1, '2019-01-18 10:09:45', '超级管理员', 1, '2019-01-18 10:09:45', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (62, '1广州科技有效公司1111', NULL, 'IMPORTANT', 'OWN', '1', 0, NULL, NULL, '张三三', NULL, '13568596428', NULL, NULL, NULL, NULL, NULL, '销售', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '超级管理员', 1, '2019-01-18 10:09:56', '超级管理员', 1, '2019-01-18 10:09:56', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (64, '广州科技有效公司aa', NULL, 'IMPORTANT', 'OWN', '1', 0, NULL, NULL, '张三三', NULL, '13568596428', NULL, NULL, NULL, NULL, NULL, '销售', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '超级管理员', 1, '2019-01-18 10:10:42', '超级管理员', 1, '2019-01-18 10:10:42', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (65, '广州科技技术网', NULL, 'import', 'own', '1', 0, NULL, NULL, '莉莉丝', NULL, '13566987523', NULL, NULL, NULL, NULL, NULL, '销售', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '超级管理员', 1, '2019-01-18 10:14:54', '超级管理员', 1, '2019-01-18 10:14:54', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (66, '广州科技技术网11', NULL, 'import', 'own', '1', 0, NULL, NULL, '莉莉丝', NULL, '13566987523', NULL, NULL, NULL, NULL, NULL, '销售', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '超级管理员', 1, '2019-01-18 10:15:32', '超级管理员', 1, '2019-01-18 10:15:32', NULL, 0, 0);
INSERT INTO `cmc_customer_info` VALUES (67, '广州科技技术网112', NULL, 'import', 'own', '1', 0, NULL, NULL, '莉莉丝', NULL, '13566987523', NULL, NULL, NULL, NULL, NULL, '销售', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '超级管理员', 1, '2019-01-18 10:16:18', '超级管理员', 1, '2019-01-18 10:16:18', NULL, 0, 0);

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
-- Records of cmc_customer_op_log
-- ----------------------------
INSERT INTO `cmc_customer_op_log` VALUES (61, 29, '超级管理员', 'ADD', '2019-01-12 14:19:37', '添加客户信息', '');
INSERT INTO `cmc_customer_op_log` VALUES (62, 2, '超级管理员', 'UPDATE', '2019-01-12 14:27:35', '更新客户信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (63, 2, '超级管理员', 'UPDATE', '2019-01-12 14:41:32', '更新客户信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (64, 18, '超级管理员', 'UPDATE', '2019-01-12 14:43:39', '更新客户状态!', '');
INSERT INTO `cmc_customer_op_log` VALUES (65, 18, '超级管理员', 'UPDATE', '2019-01-12 14:45:28', '更新客户状态为 ENABLE', '');
INSERT INTO `cmc_customer_op_log` VALUES (66, 1, '超级管理员', 'TRANSFER', '2019-01-12 14:48:12', '客户转移,客户ID : 1,接受用户ID : 99', '');
INSERT INTO `cmc_customer_op_log` VALUES (67, 2, '超级管理员', 'TRANSFER', '2019-01-12 14:48:12', '客户转移,客户ID : 2,接受用户ID : 99', '');
INSERT INTO `cmc_customer_op_log` VALUES (68, 3, '超级管理员', 'TRANSFER', '2019-01-12 14:48:12', '客户转移,客户ID : 3,接受用户ID : 99', '');
INSERT INTO `cmc_customer_op_log` VALUES (69, 4, '超级管理员', 'TRANSFER', '2019-01-12 14:48:12', '客户转移,客户ID : 4,接受用户ID : 99', '');
INSERT INTO `cmc_customer_op_log` VALUES (70, 2, '超级管理员', 'DELETE', '2019-01-14 14:08:15', '删除客户信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (71, 4, '超级管理员', 'DELETE', '2019-01-14 14:08:15', '删除客户信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (76, 2, '超级管理员', 'DELETE', '2019-01-14 14:15:03', '删除客户信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (77, 4, '超级管理员', 'DELETE', '2019-01-14 14:15:27', '删除客户信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (78, 2, '超级管理员', 'DELETE', '2019-01-14 14:19:23', '删除客户信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (79, 4, '超级管理员', 'DELETE', '2019-01-14 14:19:23', '删除客户信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (80, 18, '超级管理员', 'DELETE', '2019-01-14 14:23:47', '删除客户信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (81, 10, '超级管理员', 'UPDATE', '2019-01-14 19:57:09', '添加客户联系人信息', '');
INSERT INTO `cmc_customer_op_log` VALUES (82, 10, '超级管理员', 'UPDATE', '2019-01-14 19:57:39', '添加客户联系人信息', '');
INSERT INTO `cmc_customer_op_log` VALUES (83, 5, '超级管理员', 'UPDATE', '2019-01-14 20:01:09', '更新客户联系人信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (84, 4, '超级管理员', 'UPDATE', '2019-01-14 20:02:42', '客户联系人批量删除', '');
INSERT INTO `cmc_customer_op_log` VALUES (85, 4, '超级管理员', 'UPDATE', '2019-01-14 20:03:34', '客户联系人批量删除!', '');
INSERT INTO `cmc_customer_op_log` VALUES (86, 5, '超级管理员', 'UPDATE', '2019-01-14 20:03:34', '客户联系人批量删除!', '');
INSERT INTO `cmc_customer_op_log` VALUES (87, 11, '超级管理员', 'UPDATE', '2019-01-14 20:03:34', '客户联系人批量删除!', '');
INSERT INTO `cmc_customer_op_log` VALUES (90, 2, '超级管理员', 'UPDATE', '2019-01-15 10:33:53', '更新客户协作人!', '');
INSERT INTO `cmc_customer_op_log` VALUES (91, 2, '超级管理员', 'UPDATE', '2019-01-15 10:34:18', '更新客户协作人!', '');
INSERT INTO `cmc_customer_op_log` VALUES (92, 2, '超级管理员', 'UPDATE', '2019-01-15 19:00:59', '添加客户账号信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (93, 2, '超级管理员', 'UPDATE', '2019-01-15 19:04:56', '添加客户账号信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (94, 2, '超级管理员', 'UPDATE', '2019-01-15 19:05:13', '添加客户账号信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (95, 2, '超级管理员', 'UPDATE', '2019-01-15 19:05:35', '添加客户账号信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (96, 2, '超级管理员', 'UPDATE', '2019-01-15 19:39:36', '添加客户账号信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (97, 2, '超级管理员', 'UPDATE', '2019-01-15 19:53:54', '添加客户账号信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (98, 2, '超级管理员', 'UPDATE', '2019-01-15 19:54:01', '添加客户账号信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (99, 2, '超级管理员', 'UPDATE', '2019-01-15 19:54:33', '添加客户账号信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (100, 17, '超级管理员', 'UPDATE', '2019-01-15 19:57:19', '修改客户账号信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (101, 17, '超级管理员', 'UPDATE', '2019-01-15 19:59:44', '修改客户账号信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (102, 17, '超级管理员', 'UPDATE', '2019-01-15 19:59:58', '修改客户账号信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (103, 17, '超级管理员', 'UPDATE', '2019-01-15 20:01:30', '修改客户账号信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (104, 2, '超级管理员', 'UPDATE', '2019-01-15 20:09:26', '添加客户账号信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (105, 2, '超级管理员', 'UPDATE', '2019-01-15 20:12:47', '添加客户账号信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (106, 17, '超级管理员', 'UPDATE', '2019-01-15 20:14:26', '修改客户账号信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (107, 17, '超级管理员', 'UPDATE', '2019-01-15 20:14:39', '修改客户账号信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (108, 2, '超级管理员', 'UPDATE', '2019-01-15 20:19:55', '删除客户账号信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (109, 2, '超级管理员', 'UPDATE', '2019-01-16 09:00:00', '添加客户账号信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (110, 2, '超级管理员', 'UPDATE', '2019-01-16 09:05:04', '删除客户账号信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (111, 17, '超级管理员', 'UPDATE', '2019-01-16 09:05:29', '修改客户账号信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (112, 17, '超级管理员', 'UPDATE', '2019-01-16 09:06:35', '修改客户账号信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (113, 31, '超级管理员', 'UPDATE', '2019-01-16 13:48:35', '更新客户协作人!', '');
INSERT INTO `cmc_customer_op_log` VALUES (114, 31, '超级管理员', 'ADD', '2019-01-16 13:48:35', '添加客户信息', '');
INSERT INTO `cmc_customer_op_log` VALUES (115, 32, '超级管理员', 'UPDATE', '2019-01-16 13:50:07', '更新客户协作人!', '');
INSERT INTO `cmc_customer_op_log` VALUES (116, 32, '超级管理员', 'ADD', '2019-01-16 13:50:07', '添加客户信息', '');
INSERT INTO `cmc_customer_op_log` VALUES (117, 32, '超级管理员', 'UPDATE', '2019-01-16 14:20:48', '更新客户协作人!', '');
INSERT INTO `cmc_customer_op_log` VALUES (118, 32, '超级管理员', 'UPDATE', '2019-01-16 14:20:48', '更新客户信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (119, 32, '超级管理员', 'UPDATE', '2019-01-16 14:21:35', '更新客户协作人!', '');
INSERT INTO `cmc_customer_op_log` VALUES (120, 32, '超级管理员', 'UPDATE', '2019-01-16 14:21:35', '更新客户信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (121, 32, '超级管理员', 'UPDATE', '2019-01-16 15:13:52', '更新客户协作人!', '');
INSERT INTO `cmc_customer_op_log` VALUES (122, 32, '超级管理员', 'UPDATE', '2019-01-16 15:13:52', '更新客户信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (123, 18, '超级管理员', 'UPDATE', '2019-01-16 15:13:59', '更新客户状态为 ENABLE', '');
INSERT INTO `cmc_customer_op_log` VALUES (124, 18, '超级管理员', 'UPDATE', '2019-01-16 15:14:07', '更新客户状态为 DISABLE', '');
INSERT INTO `cmc_customer_op_log` VALUES (125, 1, '超级管理员', 'TRANSFER', '2019-01-16 15:15:21', '客户转移,客户ID : 1,接受用户ID : 100', '');
INSERT INTO `cmc_customer_op_log` VALUES (126, 2, '超级管理员', 'TRANSFER', '2019-01-16 15:15:21', '客户转移,客户ID : 2,接受用户ID : 100', '');
INSERT INTO `cmc_customer_op_log` VALUES (127, 3, '超级管理员', 'TRANSFER', '2019-01-16 15:15:21', '客户转移,客户ID : 3,接受用户ID : 100', '');
INSERT INTO `cmc_customer_op_log` VALUES (128, 4, '超级管理员', 'TRANSFER', '2019-01-16 15:15:21', '客户转移,客户ID : 4,接受用户ID : 100', '');
INSERT INTO `cmc_customer_op_log` VALUES (132, 12, '超级管理员', 'DELETE', '2019-01-16 15:31:15', '删除客户信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (133, 2, '超级管理员', 'UPDATE', '2019-01-17 14:21:32', '添加客户附件!', '');
INSERT INTO `cmc_customer_op_log` VALUES (134, 2, '超级管理员', 'UPDATE', '2019-01-17 14:31:15', '添加客户附件!', '');
INSERT INTO `cmc_customer_op_log` VALUES (135, 2, '超级管理员', 'UPDATE', '2019-01-17 14:40:20', '修改客户附件!', '');
INSERT INTO `cmc_customer_op_log` VALUES (136, 2, '超级管理员', 'UPDATE', '2019-01-17 14:44:52', '修改客户附件!', '');
INSERT INTO `cmc_customer_op_log` VALUES (139, 2, '超级管理员', 'UPDATE', '2019-01-17 14:59:28', '删除客户附件!', '');
INSERT INTO `cmc_customer_op_log` VALUES (140, 50, '超级管理员', 'UPDATE', '2019-01-18 09:45:39', '更新客户协作人!', '');
INSERT INTO `cmc_customer_op_log` VALUES (141, 50, '超级管理员', 'ADD', '2019-01-18 09:45:39', '添加客户信息', '');
INSERT INTO `cmc_customer_op_log` VALUES (142, 2, '超级管理员', 'UPDATE', '2019-01-18 09:50:07', '新增客户跟进信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (143, 2, '超级管理员', 'UPDATE', '2019-01-18 09:55:42', '修改客户跟进信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (144, 2, '超级管理员', 'UPDATE', '2019-01-18 09:56:51', '新增客户跟进信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (145, 2, '超级管理员', 'UPDATE', '2019-01-18 09:56:52', '新增客户跟进信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (146, 2, '超级管理员', 'UPDATE', '2019-01-18 09:56:53', '新增客户跟进信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (147, 2, '超级管理员', 'UPDATE', '2019-01-18 09:56:54', '新增客户跟进信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (148, 2, '超级管理员', 'UPDATE', '2019-01-18 09:56:54', '新增客户跟进信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (149, 2, '超级管理员', 'UPDATE', '2019-01-18 09:56:55', '新增客户跟进信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (150, 2, '超级管理员', 'UPDATE', '2019-01-18 09:57:09', '删除客户跟进信息!', '');
INSERT INTO `cmc_customer_op_log` VALUES (151, 53, '超级管理员', 'ADD', '2019-01-18 10:00:12', '添加客户信息', '');
INSERT INTO `cmc_customer_op_log` VALUES (152, 56, '超级管理员', 'ADD', '2019-01-18 10:01:48', '添加客户信息', '');
INSERT INTO `cmc_customer_op_log` VALUES (153, 58, '超级管理员', 'UPDATE', '2019-01-18 10:04:01', '更新客户协作人!', '');
INSERT INTO `cmc_customer_op_log` VALUES (154, 58, '超级管理员', 'ADD', '2019-01-18 10:04:01', '添加客户信息', '');
INSERT INTO `cmc_customer_op_log` VALUES (155, 59, '超级管理员', 'UPDATE', '2019-01-18 10:05:03', '更新客户协作人!', '');
INSERT INTO `cmc_customer_op_log` VALUES (156, 59, '超级管理员', 'ADD', '2019-01-18 10:05:03', '添加客户信息', '');
INSERT INTO `cmc_customer_op_log` VALUES (157, 60, '超级管理员', 'UPDATE', '2019-01-18 10:07:20', '更新客户协作人!', '');
INSERT INTO `cmc_customer_op_log` VALUES (158, 60, '超级管理员', 'ADD', '2019-01-18 10:07:20', '添加客户信息', '');
INSERT INTO `cmc_customer_op_log` VALUES (159, 61, '超级管理员', 'UPDATE', '2019-01-18 10:09:45', '更新客户协作人!', '');
INSERT INTO `cmc_customer_op_log` VALUES (160, 61, '超级管理员', 'ADD', '2019-01-18 10:09:45', '添加客户信息', '');
INSERT INTO `cmc_customer_op_log` VALUES (161, 62, '超级管理员', 'ADD', '2019-01-18 10:09:56', '添加客户信息', '');
INSERT INTO `cmc_customer_op_log` VALUES (162, 64, '超级管理员', 'UPDATE', '2019-01-18 10:10:43', '更新客户协作人!', '');
INSERT INTO `cmc_customer_op_log` VALUES (163, 64, '超级管理员', 'ADD', '2019-01-18 10:10:43', '添加客户信息', '');
INSERT INTO `cmc_customer_op_log` VALUES (164, 65, '超级管理员', 'UPDATE', '2019-01-18 10:14:55', '更新客户协作人!', '');
INSERT INTO `cmc_customer_op_log` VALUES (165, 65, '超级管理员', 'ADD', '2019-01-18 10:14:55', '添加客户信息', '');
INSERT INTO `cmc_customer_op_log` VALUES (166, 66, '超级管理员', 'UPDATE', '2019-01-18 10:15:33', '更新客户协作人!', '');
INSERT INTO `cmc_customer_op_log` VALUES (167, 66, '超级管理员', 'ADD', '2019-01-18 10:15:33', '添加客户信息', '');
INSERT INTO `cmc_customer_op_log` VALUES (168, 67, '超级管理员', 'UPDATE', '2019-01-18 10:16:19', '更新客户协作人!', '');
INSERT INTO `cmc_customer_op_log` VALUES (169, 67, '超级管理员', 'ADD', '2019-01-18 10:16:19', '添加客户信息', '');

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

-- ----------------------------
-- Records of databasechangeloglock
-- ----------------------------
INSERT INTO `databasechangeloglock` VALUES (1, b'0', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
