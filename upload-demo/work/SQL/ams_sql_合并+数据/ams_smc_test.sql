/*
 Navicat Premium Data Transfer

 Source Server         : ams-smc
 Source Server Type    : MySQL
 Source Server Version : 50670
 Source Host           : rm-wz9w1r3jr728r43xdoo.mysql.rds.aliyuncs.com:3306
 Source Schema         : ams_smc_test

 Target Server Type    : MySQL
 Target Server Version : 50670
 File Encoding         : 65001

 Date: 19/01/2019 10:11:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for smc_aly_consume_post_order
-- ----------------------------
DROP TABLE IF EXISTS `smc_aly_consume_post_order`;
CREATE TABLE `smc_aly_consume_post_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识主键',
  `cst_account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户阿里云账号',
  `consume_time` datetime(0) NOT NULL COMMENT '消费时间',
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',
  `product_instance_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '云产品实例ID',
  `project_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目编号',
  `pay_amount` decimal(20, 2) NOT NULL COMMENT '应付金额',
  `pay_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付状态',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_smc_aly_consume_post_order_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '阿里云后付费消费订单' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for smc_aly_consume_pre_order
-- ----------------------------
DROP TABLE IF EXISTS `smc_aly_consume_pre_order`;
CREATE TABLE `smc_aly_consume_pre_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识主键',
  `cst_account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户账号',
  `order_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',
  `order_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单类型（数据字典：aly_order_type）',
  `orig_amount` decimal(20, 2) NOT NULL COMMENT '订单原价',
  `discount` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单折扣',
  `pay_amount` decimal(20, 2) NOT NULL COMMENT '应付金额（实付+代金券）',
  `cash_coupon` decimal(20, 2) NOT NULL COMMENT '代金券',
  `actual_pay_amount` decimal(20, 2) NOT NULL COMMENT '实付金额',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '阿里云订单状态（数据字典：aly_order_status）',
  `order_create_time` datetime(0) NOT NULL COMMENT '订单创建时间',
  `order_pay_time` datetime(0) NULL DEFAULT NULL COMMENT '订单支付时间',
  `engine_room` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机房',
  `project_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目ID',
  `order_cst_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单客户类型',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_smc_aly_consume_order_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '阿里云预付费消费数据' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for smc_aly_performance
-- ----------------------------
DROP TABLE IF EXISTS `smc_aly_performance`;
CREATE TABLE `smc_aly_performance`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识主键',
  `cst_info_id` bigint(20) NOT NULL COMMENT '关联客户信息id',
  `cst_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户名称（跨中心查询冗余字段）',
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `cst_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户类型（数据字典：cst_type）',
  `pay_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '付费类型（数据字典：smc_pay_type）',
  `order_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单类型',
  `order_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号（预付费的没有订单号）',
  `product_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',
  `sales_id` bigint(20) NOT NULL COMMENT '销售员ID（关联，当团队时为：-1）',
  `sales_team_id` bigint(20) NOT NULL COMMENT '销售团队ID（当个人时为：-1）',
  `orig_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '订单原价',
  `pay_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '应付金额（代金券+实付金额）',
  `cash_coupon` decimal(20, 2) NULL DEFAULT NULL COMMENT '代金券金额',
  `actual_pay_amount` decimal(20, 2) NOT NULL COMMENT '实付金额',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业绩状态（数据字典，如：有效、无效）',
  `belong_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '归属类型（个人、团队）',
  `belong_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '归属名称（个人或团队名称）',
  `order_create_time` datetime(0) NULL DEFAULT NULL COMMENT '订单创建时间',
  `order_pay_time` datetime(0) NULL DEFAULT NULL COMMENT '订单支付时间',
  `project_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目ID',
  `consume_order_id` bigint(20) NOT NULL COMMENT '消费订单ID（记录业绩核算的原始记录ID，多个归属时一条原始记录可能对应多条业绩记录，这个记录ID可能是预付费，也可能是后付费）',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_smc_aly_performance_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for smc_cfg_month
-- ----------------------------
DROP TABLE IF EXISTS `smc_cfg_month`;
CREATE TABLE `smc_cfg_month`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识主键',
  `po_quarter_id` bigint(20) NOT NULL COMMENT '季度业绩目标ID',
  `year` int(11) NOT NULL COMMENT '年份',
  `month` int(11) NOT NULL COMMENT '月份',
  `work_day_num` decimal(10, 0) NULL DEFAULT NULL COMMENT '工作天数',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_smc_cfg_month_id`(`id`) USING BTREE,
  INDEX `FK_smc_cfg_month_smc_cfg_quarter`(`po_quarter_id`) USING BTREE,
  CONSTRAINT `FK_smc_cfg_month_smc_cfg_quarter` FOREIGN KEY (`po_quarter_id`) REFERENCES `smc_cfg_quarter` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '月度配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for smc_cfg_quarter
-- ----------------------------
DROP TABLE IF EXISTS `smc_cfg_quarter`;
CREATE TABLE `smc_cfg_quarter`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识主键',
  `po_year_id` bigint(20) NOT NULL COMMENT '年度配置（关联）',
  `year` int(11) NULL DEFAULT NULL COMMENT '年',
  `quarter_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '季度类型（数据字典：quarter_type）',
  `ratio` decimal(3, 0) NULL DEFAULT NULL COMMENT '比例（最大值100）',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_smc_cfg_quarter_id`(`id`) USING BTREE,
  INDEX `FK_smc_cfg_quarter_year`(`po_year_id`) USING BTREE,
  CONSTRAINT `FK_smc_cfg_quarter_year` FOREIGN KEY (`po_year_id`) REFERENCES `smc_cfg_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '季度配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for smc_cfg_year
-- ----------------------------
DROP TABLE IF EXISTS `smc_cfg_year`;
CREATE TABLE `smc_cfg_year`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键（标识）',
  `year` int(11) NOT NULL COMMENT '年度',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注信息',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_smc_cfg_year_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '年度配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for smc_performance_calc_task
-- ----------------------------
DROP TABLE IF EXISTS `smc_performance_calc_task`;
CREATE TABLE `smc_performance_calc_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `start_time` datetime(0) NOT NULL COMMENT '开始时间',
  `end_time` datetime(0) NOT NULL COMMENT '结束时间',
  `pay_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '付费类型',
  `filter_condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '过滤条件',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（数据字典维护 smc_calc_task_status，如：待执行、执行中、已完成、已取消）',
  `calc_time` datetime(0) NOT NULL COMMENT '计算时间',
  `upload_attchments` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传附件集（多个用,分割）',
  `download_attchments` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下载附件集（多个用,分割）',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_smc_performance_calc_task_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业绩计算任务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for smc_po_month_sales
-- ----------------------------
DROP TABLE IF EXISTS `smc_po_month_sales`;
CREATE TABLE `smc_po_month_sales`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识主键',
  `cfg_month_id` bigint(20) NOT NULL COMMENT '月度关联',
  `year` int(11) NOT NULL COMMENT '年份',
  `month` int(11) NOT NULL COMMENT '月份',
  `sales_id` bigint(20) NOT NULL COMMENT '销售员ID',
  `value` decimal(20, 2) NULL DEFAULT NULL COMMENT '业绩目标值',
  `avg_day` decimal(10, 2) NULL DEFAULT NULL COMMENT '平均每日完成量',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_smc_po_month_sales`(`id`) USING BTREE,
  INDEX `FK_smc_po_month_sales_smc_cfg_month`(`cfg_month_id`) USING BTREE,
  CONSTRAINT `FK_smc_po_month_sales_smc_cfg_month` FOREIGN KEY (`cfg_month_id`) REFERENCES `smc_cfg_month` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '月-业绩目标-销售员（PO = Performance Objective）' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for smc_po_month_sales_team
-- ----------------------------
DROP TABLE IF EXISTS `smc_po_month_sales_team`;
CREATE TABLE `smc_po_month_sales_team`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识主键',
  `cfg_month_id` bigint(20) NOT NULL COMMENT '月度关联',
  `year` int(11) NOT NULL COMMENT '年份',
  `month` int(11) NOT NULL COMMENT '月份',
  `sales_team_id` bigint(20) NOT NULL COMMENT '销售团队id',
  `value` decimal(20, 2) NULL DEFAULT NULL COMMENT '业绩目标值',
  `avg_day` decimal(10, 2) NULL DEFAULT NULL COMMENT '平均每日完成量',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_smc_po_month_sales_team`(`id`) USING BTREE,
  INDEX `FK_smc_po_month_sales_team_smc_cfg_month`(`cfg_month_id`) USING BTREE,
  CONSTRAINT `FK_smc_po_month_sales_team_smc_cfg_month` FOREIGN KEY (`cfg_month_id`) REFERENCES `smc_cfg_month` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '月-业绩目标-销售团队（PO = Performance Objective）' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for smc_po_quarter_sales
-- ----------------------------
DROP TABLE IF EXISTS `smc_po_quarter_sales`;
CREATE TABLE `smc_po_quarter_sales`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识主键',
  `cfg_quarter_id` bigint(20) NOT NULL COMMENT '季度关联',
  `year` decimal(10, 0) NOT NULL,
  `quarter_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '季度类型（数据字典：quarter_type）',
  `sales_id` bigint(20) NOT NULL COMMENT '销售员id',
  `value` decimal(20, 2) NULL DEFAULT NULL COMMENT '业绩目标值',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_smc_po_quarter_sales`(`id`) USING BTREE,
  INDEX `FK_smc_po_quarter_sales_smc_cfg_quarter`(`cfg_quarter_id`) USING BTREE,
  CONSTRAINT `FK_smc_po_quarter_sales_smc_cfg_quarter` FOREIGN KEY (`cfg_quarter_id`) REFERENCES `smc_cfg_quarter` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '季度-业绩目标-销售员（PO = Performance Objective）' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for smc_po_quarter_sales_team
-- ----------------------------
DROP TABLE IF EXISTS `smc_po_quarter_sales_team`;
CREATE TABLE `smc_po_quarter_sales_team`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识主键',
  `cfg_quarter_id` bigint(20) NOT NULL COMMENT '季度关联',
  `year` decimal(10, 0) NOT NULL,
  `quarter_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '季度类型（数据字典：quarter_type）',
  `sales_team_id` bigint(20) NOT NULL COMMENT '销售团队id（关联，当为个人目标时为：-1）',
  `value` decimal(20, 2) NULL DEFAULT NULL COMMENT '业绩目标值',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_smc_po_quarter_sales_team`(`id`) USING BTREE,
  INDEX `FK_smc_po_quarter_sales_team_smc_cfg_quarter`(`cfg_quarter_id`) USING BTREE,
  CONSTRAINT `FK_smc_po_quarter_sales_team_smc_cfg_quarter` FOREIGN KEY (`cfg_quarter_id`) REFERENCES `smc_cfg_quarter` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '季度-业绩目标-销售团队（PO = Performance Objective）' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for smc_po_year_sales
-- ----------------------------
DROP TABLE IF EXISTS `smc_po_year_sales`;
CREATE TABLE `smc_po_year_sales`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键（标识）',
  `cfg_year_id` bigint(20) NOT NULL COMMENT '年度id（关联）',
  `year` int(11) NULL DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业绩类型（数据字典：po_type）',
  `sales_id` bigint(20) NOT NULL COMMENT '销售员id（关联销售员）',
  `value` decimal(20, 2) NOT NULL COMMENT '目标值',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_smc_po_year_sales_smc_cfg_year`(`cfg_year_id`) USING BTREE,
  CONSTRAINT `FK_smc_po_year_sales_smc_cfg_year` FOREIGN KEY (`cfg_year_id`) REFERENCES `smc_cfg_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '年-业绩目标信息-销售员（PO = Performance Objective）' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for smc_po_year_sales_team
-- ----------------------------
DROP TABLE IF EXISTS `smc_po_year_sales_team`;
CREATE TABLE `smc_po_year_sales_team`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键（标识）',
  `cfg_year_id` bigint(20) NOT NULL COMMENT '年度id（关联）',
  `year` int(11) NULL DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业绩类型（数据字典：po_type）',
  `sales_team_id` bigint(20) NOT NULL COMMENT '销售团队id（关联，当为个人目标时，此项为-1）',
  `value` decimal(20, 2) NOT NULL COMMENT '目标值',
  `is_top` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否为顶级（如果是顶级组织则为：1）',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_smc_po_year_sales_team`(`id`) USING BTREE,
  INDEX `FK_smc_po_year_sales_team_cfg_year`(`cfg_year_id`) USING BTREE,
  CONSTRAINT `FK_smc_po_year_sales_team_cfg_year` FOREIGN KEY (`cfg_year_id`) REFERENCES `smc_cfg_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '年-业绩目标信息-销售团队（PO = Performance Objective）' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for smc_sales
-- ----------------------------
DROP TABLE IF EXISTS `smc_sales`;
CREATE TABLE `smc_sales`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识主键',
  `sales_team_id` bigint(20) NOT NULL DEFAULT -1 COMMENT '销售团队ID（关联，如果无则为：-1）',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '销售员姓名',
  `cst_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户类型（数据字典，smc_cst_type,如：大、中、小）',
  `sales_level` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售级别（数据字典：sales_level）',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '销售员状态，如：有效、禁用中... (数据字典：sales_status)',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_del` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除（0未删除、1已删除）',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_smc_sales_id`(`id`) USING BTREE,
  INDEX `FK_smc_sales_smc_sales_team`(`sales_team_id`) USING BTREE,
  CONSTRAINT `FK_smc_sales_smc_sales_team` FOREIGN KEY (`sales_team_id`) REFERENCES `smc_sales_team` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for smc_sales_team
-- ----------------------------
DROP TABLE IF EXISTS `smc_sales_team`;
CREATE TABLE `smc_sales_team`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识主键',
  `team_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '团队名称',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父级ID',
  `biz_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主业务类型',
  `group_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织类型(数据字典: smc_group_type）',
  `leader` bigint(20) NOT NULL COMMENT '团队领导',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '销售团队状态，如：有效、禁用中（数据字典：sales_team_status）',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '团队描述',
  `is_del` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_smc_sales_team_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售团队表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
