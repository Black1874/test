/*
 Navicat Premium Data Transfer

 Source Server         : ams-bmc
 Source Server Type    : MySQL
 Source Server Version : 50670
 Source Host           : rm-wz9w1r3jr728r43xdoo.mysql.rds.aliyuncs.com:3306
 Source Schema         : ams_bmc_test

 Target Server Type    : MySQL
 Target Server Version : 50670
 File Encoding         : 65001

 Date: 19/01/2019 09:38:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bmc_address
-- ----------------------------
DROP TABLE IF EXISTS `bmc_address`;
CREATE TABLE `bmc_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本号',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '父ID',
  `city_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '城市编码',
  `ad_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '区域编码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '地址名称',
  `level` tinyint(4) NOT NULL COMMENT '级别（省市区县）',
  `polyline` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '行政区边界坐标点',
  `center` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '城市中心点',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 368100203770552321 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bmc_dict
-- ----------------------------
DROP TABLE IF EXISTS `bmc_dict`;
CREATE TABLE `bmc_dict`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识主键',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `type` int(11) NULL DEFAULT NULL COMMENT '字典类型 -0 目录 - 1 文件',
  `dict_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '枚举编码',
  `extend_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '枚举拓展字段',
  `dict_value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '枚举值',
  `dict_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典编码',
  `dict_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典名称',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '父ID',
  `number` int(11) NULL DEFAULT NULL COMMENT '序号',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态 -10 可用 - 20 禁用',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后更新人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_bmc_dict`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bmc_exception_log
-- ----------------------------
DROP TABLE IF EXISTS `bmc_exception_log`;
CREATE TABLE `bmc_exception_log`  (
  `id` bigint(20) NULL DEFAULT NULL COMMENT 'ID',
  `application_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统应用名',
  `exception_simple_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常类型',
  `exception_message` varchar(4500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常信息(通过exception.getMessage()获取到的内容)',
  `exception_cause` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常原因(通过exception.getCause()获取到的内容)',
  `exception_stack` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '异常堆栈信息',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作者',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '操作者id',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bmc_product
-- ----------------------------
DROP TABLE IF EXISTS `bmc_product`;
CREATE TABLE `bmc_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `product_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品编号',
  `rake_back_pro_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '返佣产品名称（阿里云反馈的名称可能不一样）',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品类型',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态（关联数据字典：product_status）',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '产品分类id（关联）',
  `is_month_rake_back` tinyint(4) NULL DEFAULT NULL COMMENT '是否月度返佣',
  `is_quarter_rake_back` tinyint(4) NULL DEFAULT NULL,
  `is_year_rake_back` tinyint(4) NULL DEFAULT NULL COMMENT '是否年度返佣',
  `is_safe_product` tinyint(4) NULL DEFAULT NULL COMMENT '是否为安全产品',
  `pro_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品链接',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_bc_product_id`(`id`) USING BTREE,
  INDEX `FK_bc_product_aly_pro_category`(`category_id`) USING BTREE,
  CONSTRAINT `FK_bc_product_aly_pro_category` FOREIGN KEY (`category_id`) REFERENCES `bmc_product_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bmc_product_category
-- ----------------------------
DROP TABLE IF EXISTS `bmc_product_category`;
CREATE TABLE `bmc_product_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `img_id` bigint(20) NULL DEFAULT NULL COMMENT '图片ID',
  `parent_id` bigint(20) NOT NULL DEFAULT -1 COMMENT '父级id（如顶级则为-1）',
  `sort_num` int(11) NULL DEFAULT NULL COMMENT '排序编号',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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







/*
 Navicat Premium Data Transfer

 Source Server         : ams-tsc
 Source Server Type    : MySQL
 Source Server Version : 50670
 Source Host           : rm-wz9w1r3jr728r43xdoo.mysql.rds.aliyuncs.com:3306
 Source Schema         : ams_tsc_test

 Target Server Type    : MySQL
 Target Server Version : 50670
 File Encoding         : 65001

 Date: 19/01/2019 09:42:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tsc_technical_engineer
-- ----------------------------
DROP TABLE IF EXISTS `tsc_technical_engineer`;
CREATE TABLE `tsc_technical_engineer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工程师名字',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工程师头衔',
  `group_id` bigint(20) NOT NULL COMMENT '所在技术团队',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（关联数据字典：tsc_te_status，如：有效、无效）',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_tsc_technical_engineer_group`(`group_id`) USING BTREE,
  CONSTRAINT `FK_tsc_technical_engineer_group` FOREIGN KEY (`group_id`) REFERENCES `tsc_technical_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '技术工程师' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tsc_technical_group
-- ----------------------------
DROP TABLE IF EXISTS `tsc_technical_group`;
CREATE TABLE `tsc_technical_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '团队名称',
  `leader` bigint(20) NULL DEFAULT NULL COMMENT '团队领导（关联用户ID）',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态（tsc_tg_status:有效、无效）',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '技术团队' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;








/*
 Navicat Premium Data Transfer

 Source Server         : ams-tpc
 Source Server Type    : MySQL
 Source Server Version : 50670
 Source Host           : rm-wz9w1r3jr728r43xdoo.mysql.rds.aliyuncs.com:3306
 Source Schema         : ams_tpc_test

 Target Server Type    : MySQL
 Target Server Version : 50670
 File Encoding         : 65001

 Date: 19/01/2019 09:42:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
-- Table structure for job_execution_log
-- ----------------------------
DROP TABLE IF EXISTS `job_execution_log`;
CREATE TABLE `job_execution_log`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `task_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sharding_item` int(11) NOT NULL,
  `execution_source` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `failure_cause` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_success` int(11) NOT NULL,
  `start_time` timestamp(0) NULL DEFAULT NULL,
  `complete_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for job_status_trace_log
-- ----------------------------
DROP TABLE IF EXISTS `job_status_trace_log`;
CREATE TABLE `job_status_trace_log`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `original_task_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `task_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slave_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `execution_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sharding_item` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `state` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `message` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creation_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `TASK_ID_STATE_INDEX`(`task_id`(191), `state`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tpc_job_task
-- ----------------------------
DROP TABLE IF EXISTS `tpc_job_task`;
CREATE TABLE `tpc_job_task`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `version` int(11) NULL DEFAULT 0,
  `ref_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '关联业务单号',
  `task_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '业务类型',
  `task_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '任务数据',
  `task_exe_count` int(11) NULL DEFAULT 0 COMMENT '执行次数',
  `dead` int(11) NULL DEFAULT 0 COMMENT '是否死亡 0 - 活着; 1-死亡',
  `status` int(11) NULL DEFAULT 0 COMMENT '状态',
  `exe_instance_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行实例IP',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `exe_time` int(11) NULL DEFAULT NULL COMMENT '执行时间',
  `yn` int(255) NULL DEFAULT 0 COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_REF_NO`(`ref_no`) USING BTREE,
  INDEX `index_CREATE_TIME`(`create_time`) USING BTREE,
  INDEX `idx_TASKTYPE_STATUS_YN`(`task_type`, `status`, `yn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'worker任务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tpc_mq_confirm
-- ----------------------------
DROP TABLE IF EXISTS `tpc_mq_confirm`;
CREATE TABLE `tpc_mq_confirm`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本号',
  `message_id` bigint(20) NULL DEFAULT NULL COMMENT '任务ID',
  `message_key` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '消息唯一标识',
  `consumer_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '消费者组编码',
  `consume_count` int(11) NULL DEFAULT 0 COMMENT '消费的数次',
  `status` int(255) NULL DEFAULT 10 COMMENT '状态, 10 - 未确认 ; 20 - 已确认; 30 已消费',
  `created_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_message_key`(`message_key`) USING BTREE,
  INDEX `idx_created_time`(`created_time`) USING BTREE,
  INDEX `idx_update_time`(`update_time`) USING BTREE,
  INDEX `idx_task_id`(`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 318176547489979394 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订阅者状态确认表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tpc_mq_consumer
-- ----------------------------
DROP TABLE IF EXISTS `tpc_mq_consumer`;
CREATE TABLE `tpc_mq_consumer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本号',
  `aplication_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '微服务名称',
  `consumer_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '消费者编码',
  `consumer_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '消费者名称',
  `status` int(255) NULL DEFAULT 10 COMMENT '状态, 10生效,20,失效',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消费者表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tpc_mq_message
-- ----------------------------
DROP TABLE IF EXISTS `tpc_mq_message`;
CREATE TABLE `tpc_mq_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本号',
  `message_key` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '消息key',
  `message_topic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'topic',
  `message_tag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'tag',
  `message_body` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消息内容',
  `message_type` int(11) NULL DEFAULT 10 COMMENT '消息类型: 10 - 有序消息 ; 20 - 无序消息',
  `producer_group` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '生产者PID',
  `delay_level` int(11) NULL DEFAULT 0 COMMENT '延时级别 1s 5s 10s 30s 1m 2m 3m 4m 5m 6m 7m 8m 9m 10m 20m 30m 1h 2h',
  `order_type` int(11) NULL DEFAULT 0 COMMENT '顺序类型 0有序 1无序',
  `message_status` int(11) NULL DEFAULT 10 COMMENT '消息状态',
  `task_status` int(11) NULL DEFAULT 0 COMMENT '状态',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `resend_times` int(11) NULL DEFAULT 0 COMMENT '重发次数',
  `dead` int(11) NULL DEFAULT 0 COMMENT '是否死亡 0 - 活着; 1-死亡',
  `next_exe_time` int(11) NULL DEFAULT NULL COMMENT '执行时间',
  `yn` int(11) NULL DEFAULT 0 COMMENT '是否删除 -0 未删除 -1 已删除',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_message_key`(`message_key`) USING BTREE,
  INDEX `idx_created_time`(`created_time`) USING BTREE,
  INDEX `idx_update_time`(`update_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 318176547104103425 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '可靠消息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tpc_mq_producer
-- ----------------------------
DROP TABLE IF EXISTS `tpc_mq_producer`;
CREATE TABLE `tpc_mq_producer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本号',
  `aplication_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '微服务名称',
  `producer_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '城市编码',
  `producer_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '区域编码',
  `query_message_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提供查询对账的地址',
  `status` int(255) NULL DEFAULT 10 COMMENT '状态, 10生效,20,失效',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '生产者表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tpc_mq_publish
-- ----------------------------
DROP TABLE IF EXISTS `tpc_mq_publish`;
CREATE TABLE `tpc_mq_publish`  (
  `producer_id` bigint(20) NOT NULL COMMENT '生产者ID',
  `topic_id` bigint(20) NOT NULL COMMENT 'TOPIC_ID',
  PRIMARY KEY (`producer_id`, `topic_id`) USING BTREE,
  INDEX `FKfe9od4909llybiub42s3ifvcl`(`topic_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发布关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tpc_mq_resend_log
-- ----------------------------
DROP TABLE IF EXISTS `tpc_mq_resend_log`;
CREATE TABLE `tpc_mq_resend_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本号',
  `message_id` bigint(20) NULL DEFAULT NULL COMMENT '任务id',
  `message_key` int(11) NULL DEFAULT 10 COMMENT '消息唯一标识',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_message_key`(`message_key`) USING BTREE,
  INDEX `idx_task_id`(`message_id`) USING BTREE,
  INDEX `idx_created_time`(`created_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '重发日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tpc_mq_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `tpc_mq_subscribe`;
CREATE TABLE `tpc_mq_subscribe`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `consumer_id` bigint(20) NOT NULL COMMENT '消费者ID',
  `consumer_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '消费者组',
  `topic_id` bigint(20) NOT NULL COMMENT 'TOPIC_ID',
  `topic_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主题编码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKfe9od4909llybiub42s3ifvcl`(`topic_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订阅关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tpc_mq_subscribe_tag
-- ----------------------------
DROP TABLE IF EXISTS `tpc_mq_subscribe_tag`;
CREATE TABLE `tpc_mq_subscribe_tag`  (
  `subscribe_id` bigint(20) NOT NULL COMMENT '消费者ID',
  `tag_id` bigint(20) NOT NULL COMMENT 'TAG_ID',
  PRIMARY KEY (`subscribe_id`, `tag_id`) USING BTREE,
  INDEX `FKfe9od4909llybiub42s3ifvcl`(`tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消费者和TAG中间表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tpc_mq_tag
-- ----------------------------
DROP TABLE IF EXISTS `tpc_mq_tag`;
CREATE TABLE `tpc_mq_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本号',
  `topic_id` bigint(20) NULL DEFAULT NULL COMMENT '主题ID',
  `tag_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '城市编码',
  `tag_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '区域编码',
  `status` int(255) NULL DEFAULT 10 COMMENT '状态, 10生效,20,失效',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'MQ主题的标签表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tpc_mq_topic
-- ----------------------------
DROP TABLE IF EXISTS `tpc_mq_topic`;
CREATE TABLE `tpc_mq_topic`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本号',
  `producer_id` bigint(20) NULL DEFAULT NULL COMMENT '生产者ID',
  `topic_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '城市编码',
  `topic_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '区域编码',
  `mq_type` int(11) NOT NULL DEFAULT 10 COMMENT 'MQ类型, 10 rocketmq 20 kafka',
  `msg_type` int(11) NOT NULL DEFAULT 10 COMMENT '消息类型, 10 无序消息, 20 无序消息',
  `status` int(255) NULL DEFAULT 10 COMMENT '状态, 10生效,20,失效',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'MQ主题表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;






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

 Date: 19/01/2019 09:41:44
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







/*
 Navicat Premium Data Transfer

 Source Server         : ams-opc
 Source Server Type    : MySQL
 Source Server Version : 50670
 Source Host           : rm-wz9w1r3jr728r43xdoo.mysql.rds.aliyuncs.com:3306
 Source Schema         : ams_opc_test

 Target Server Type    : MySQL
 Target Server Version : 50670
 File Encoding         : 65001

 Date: 19/01/2019 09:41:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ding_dept
-- ----------------------------
DROP TABLE IF EXISTS `ding_dept`;
CREATE TABLE `ding_dept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '钉钉部门信息表，使用钉钉的部门id',
  `ding_dept_id` bigint(20) NULL DEFAULT NULL COMMENT '钉钉的部门id，用户表是通过此字段关联的',
  `corp_id` bigint(20) NOT NULL COMMENT '企业id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `parentid` bigint(20) NULL DEFAULT NULL COMMENT '父部门id，根部门为1',
  `order` int(11) NULL DEFAULT NULL COMMENT '在父部门中的次序值',
  `manager_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门的主管列表,取值为由主管的userid组成的字符串，不同的userid使用|符号进行分割',
  `has_child` tinyint(4) NULL DEFAULT NULL COMMENT '是否有子部门   1--是   0--否',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录更新人',
  `update_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ding_msg_template
-- ----------------------------
DROP TABLE IF EXISTS `ding_msg_template`;
CREATE TABLE `ding_msg_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息标题',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息内容',
  `redirect_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转地址，不含域名',
  `forms` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单对象，json字符串格式',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ding_user
-- ----------------------------
DROP TABLE IF EXISTS `ding_user`;
CREATE TABLE `ding_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) NOT NULL COMMENT '企业id',
  `userid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '钉钉员工唯一标识ID（不可修改）',
  `openid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '在本服务窗运营服务商 范围内,唯一标识关注者身份的id（不可修改）',
  `ding_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钉钉Id,在钉钉全局范围内标识用户的身份（不可修改）。',
  `unionid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '在当前isv全局范围内唯一标识一个用户的身份,用户无法修改',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成员姓名',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工的电子邮箱（ISV不可见）',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码（ISV不可见）',
  `org_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工的企业邮箱，如果员工已经开通了企业邮箱，接口会返回，否则不会返回（ISV不可见）',
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成员所属部门id列表，关联的是钉钉的部门id',
  `position` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位信息',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像url',
  `hired_date` datetime(0) NULL DEFAULT NULL COMMENT '入职时间',
  `jobnumber` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工工号',
  `active` tinyint(4) NULL DEFAULT NULL COMMENT '是否已经激活  0--未激活  1--已激活',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分机号（仅限企业内部开发调用）',
  `work_place` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地点（ISV不可见）',
  `is_ding_admin` tinyint(4) NULL DEFAULT NULL COMMENT '在钉钉侧是否管理员  0--否  1--是',
  `is_boss` tinyint(4) NULL DEFAULT NULL COMMENT '是否为企业的老板 0--否  1--是',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注（ISV不可见）',
  `is_leave` tinyint(4) NULL DEFAULT 0 COMMENT '是否已经离开组织  0--否  1--是',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'sys' COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'sys' COMMENT '记录更新人',
  `update_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ding_user_unique_idx`(`corp_id`, `userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ding_user_dept
-- ----------------------------
DROP TABLE IF EXISTS `ding_user_dept`;
CREATE TABLE `ding_user_dept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '关联ding_user表',
  `dept_id` bigint(20) NOT NULL COMMENT '关联ding_dept表',
  `ding_dept_id` bigint(20) NOT NULL COMMENT '钉钉方的部门id',
  `dept_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `index` int(11) NULL DEFAULT NULL COMMENT '在部门中的顺序，非必填',
  `create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` datetime(0) NOT NULL COMMENT '记录创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mq_message_data
-- ----------------------------
DROP TABLE IF EXISTS `mq_message_data`;
CREATE TABLE `mq_message_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本号',
  `message_key` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '消息key',
  `message_topic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'topic',
  `message_tag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'tag',
  `message_body` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消息内容',
  `message_type` int(11) NULL DEFAULT 10 COMMENT '消息类型: 10 - 生产者 ; 20 - 消费者',
  `delay_level` int(11) NULL DEFAULT 0 COMMENT '延时级别 1s 5s 10s 30s 1m 2m 3m 4m 5m 6m 7m 8m 9m 10m 20m 30m 1h 2h',
  `order_type` int(11) NULL DEFAULT 0 COMMENT '顺序类型 0有序 1无序',
  `status` int(11) NULL DEFAULT 10 COMMENT '消息状态',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最近操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `yn` int(11) NULL DEFAULT 0 COMMENT '是否删除 -0 未删除 -1 已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for opc_attachment
-- ----------------------------
DROP TABLE IF EXISTS `opc_attachment`;
CREATE TABLE `opc_attachment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ref_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '上传附件的相关业务流水号',
  `center_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '中心名称(英文简写)',
  `bucket_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '文件服务器根目录',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '附件名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '附件存储相对路径',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '附件类型',
  `format` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '附件格式',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `version` bigint(20) NULL DEFAULT 0 COMMENT '版本号',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `last_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业务附件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for opc_sms_setting
-- ----------------------------
DROP TABLE IF EXISTS `opc_sms_setting`;
CREATE TABLE `opc_sms_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '版本号',
  `again_send_time` int(11) NULL DEFAULT NULL COMMENT '可再次发送时间（毫秒）',
  `invalid_time` int(11) NULL DEFAULT NULL COMMENT '失效时间（分钟）',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '短信类型',
  `type_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '类型描述',
  `templet_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模板code',
  `templet_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模板内容',
  `send_max_num` int(11) NULL DEFAULT NULL COMMENT '一天中可发送的最大数量',
  `ip_send_max_num` int(11) NULL DEFAULT NULL COMMENT '一个IP一天中可发送的最大数量',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最近操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `yn` int(11) NULL DEFAULT 0 COMMENT '删除标识(1-已删除；0-未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `un_type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '短信模板设置表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;





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






/*
 Navicat Premium Data Transfer

 Source Server         : ams-uac
 Source Server Type    : MySQL
 Source Server Version : 50670
 Source Host           : rm-wz9w1r3jr728r43xdoo.mysql.rds.aliyuncs.com:3306
 Source Schema         : ams_uac_test

 Target Server Type    : MySQL
 Target Server Version : 50670
 File Encoding         : 65001

 Date: 19/01/2019 09:42:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
-- Table structure for mq_message_data
-- ----------------------------
DROP TABLE IF EXISTS `mq_message_data`;
CREATE TABLE `mq_message_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本号',
  `message_key` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息key',
  `message_topic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'topic',
  `message_tag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'tag',
  `message_body` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消息内容',
  `message_type` int(11) NULL DEFAULT 10 COMMENT '消息类型: 10 - 生产者 ; 20 - 消费者',
  `delay_level` int(11) NULL DEFAULT 0 COMMENT '延时级别 1s 5s 10s 30s 1m 2m 3m 4m 5m 6m 7m 8m 9m 10m 20m 30m 1h 2h',
  `order_type` int(11) NULL DEFAULT 0 COMMENT '顺序类型 0有序 1无序',
  `status` int(11) NULL DEFAULT 10 COMMENT '消息状态',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `yn` int(11) NULL DEFAULT 0 COMMENT '是否删除 -0 未删除 -1 已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins`  (
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `series` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_used` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`series`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uac_action
-- ----------------------------
DROP TABLE IF EXISTS `uac_action`;
CREATE TABLE `uac_action`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本号',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '资源路径',
  `action_name` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限名称',
  `action_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最近操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `system_id`(`action_code`) USING BTREE,
  UNIQUE INDEX `system_id_2`(`action_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uac_application
-- ----------------------------
DROP TABLE IF EXISTS `uac_application`;
CREATE TABLE `uac_application`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本号',
  `application_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '角色编码',
  `application_name` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '角色名称',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '状态',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最近操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '应用表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uac_group
-- ----------------------------
DROP TABLE IF EXISTS `uac_group`;
CREATE TABLE `uac_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT 'VERSION',
  `group_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '组织编码',
  `group_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '组织名称',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组织类型 1：仓库 2：基地',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '父ID',
  `level` int(11) NULL DEFAULT 1 COMMENT '层级',
  `leaf` int(11) NULL DEFAULT 0 COMMENT '是否叶子节点,1不是0是',
  `contact` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '联系人',
  `group_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组织地址',
  `province_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '省名称',
  `province_id` bigint(20) NULL DEFAULT NULL COMMENT '省编码',
  `city_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '城市名称',
  `city_id` bigint(20) NULL DEFAULT NULL COMMENT '城市编码',
  `area_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区名称',
  `area_id` bigint(20) NULL DEFAULT NULL COMMENT '区编码',
  `street_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '街道名称',
  `street_id` bigint(20) NULL DEFAULT NULL COMMENT '街道编码',
  `detail_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '详细地址',
  `contact_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '联系人手机号',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最近操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `number` int(11) NULL DEFAULT 0 COMMENT '预留排序字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uac_group_user
-- ----------------------------
DROP TABLE IF EXISTS `uac_group_user`;
CREATE TABLE `uac_group_user`  (
  `group_id` bigint(20) NOT NULL COMMENT '角色ID',
  `user_id` bigint(20) NOT NULL COMMENT '菜单ID'
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单与角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uac_log
-- ----------------------------
DROP TABLE IF EXISTS `uac_log`;
CREATE TABLE `uac_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` bigint(20) NULL DEFAULT NULL COMMENT '组织流水号',
  `group_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组织名称',
  `log_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '日志类型',
  `log_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '日志类型名称',
  `action_id` bigint(20) NULL DEFAULT NULL COMMENT '权限ID',
  `action_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '权限编码',
  `action_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '权限名称',
  `os` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'IP地址',
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录位置',
  `mac` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '物理地址',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '详细描述',
  `request_data` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `request_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求地址',
  `response_data` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '响应结果',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '类名',
  `method_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名',
  `start_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '开始时间',
  `end_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `excute_time` int(11) NULL DEFAULT NULL COMMENT '耗时,秒',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最近操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 542408882140488705 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uac_menu
-- ----------------------------
DROP TABLE IF EXISTS `uac_menu`;
CREATE TABLE `uac_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本号',
  `menu_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单编码',
  `menu_name` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单名称',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '状态',
  `url` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单URL',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '图标',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '父ID',
  `level` int(11) NULL DEFAULT 1 COMMENT '层级(最多三级1,2,3)',
  `leaf` int(11) NULL DEFAULT 0 COMMENT '是否叶子节点,1不是0是',
  `number` int(11) NULL DEFAULT 0 COMMENT '序号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `application_id` bigint(20) NULL DEFAULT 1 COMMENT '系统编码',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最近操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1115 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uac_role
-- ----------------------------
DROP TABLE IF EXISTS `uac_role`;
CREATE TABLE `uac_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本号',
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '角色编码',
  `role_name` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '角色名称',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '状态',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最近操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 541895839111455745 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uac_role_action
-- ----------------------------
DROP TABLE IF EXISTS `uac_role_action`;
CREATE TABLE `uac_role_action`  (
  `role_id` bigint(20) NOT NULL,
  `action_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `action_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限中间表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uac_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `uac_role_menu`;
CREATE TABLE `uac_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单中间表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uac_role_user
-- ----------------------------
DROP TABLE IF EXISTS `uac_role_user`;
CREATE TABLE `uac_role_user`  (
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色用户中间表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uac_user
-- ----------------------------
DROP TABLE IF EXISTS `uac_user`;
CREATE TABLE `uac_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本号',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录名',
  `login_pwd` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录密码',
  `salt` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐,用于shiro加密, 字段停用',
  `user_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '工号',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '姓名',
  `mobile_no` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '邮件地址',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '状态',
  `user_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户来源',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作员类型（2000伙伴，3000客户，1000运营）',
  `last_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP地址',
  `last_login_location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录位置',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '描述',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `is_changed_pwd` smallint(6) NULL DEFAULT 0 COMMENT '是否更改过密码',
  `pwd_error_count` smallint(6) NULL DEFAULT 0 COMMENT '连续输错密码次数（连续5次输错就冻结帐号）',
  `pwd_error_time` datetime(0) NULL DEFAULT NULL COMMENT '最后输错密码时间',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最近操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 534454785160520705 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uac_user_menu
-- ----------------------------
DROP TABLE IF EXISTS `uac_user_menu`;
CREATE TABLE `uac_user_menu`  (
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单id',
  `number` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户菜单中间表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uac_user_token
-- ----------------------------
DROP TABLE IF EXISTS `uac_user_token`;
CREATE TABLE `uac_user_token`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本号',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '父ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录名',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '姓名',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `os` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器',
  `login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登陆人Ip地址',
  `login_location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地址',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  `access_token` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '访问token',
  `refresh_token` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '刷新token',
  `token_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'token类型',
  `access_token_validity` int(11) NULL DEFAULT NULL COMMENT '访问token的生效时间(秒)',
  `refresh_token_validity` int(11) NULL DEFAULT NULL COMMENT '刷新token的生效时间(秒)',
  `status` int(11) NULL DEFAULT 0 COMMENT '0 在线 10已刷新 20 离线',
  `group_id` bigint(20) NULL DEFAULT NULL COMMENT '组织ID',
  `group_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组织名称',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最近操作人',
  `last_operator_id` bigint(20) NULL DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 542408881595229185 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户Token统计表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;


