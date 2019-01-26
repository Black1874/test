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

 Date: 19/01/2019 10:11:41
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
-- Records of databasechangeloglock
-- ----------------------------
INSERT INTO `databasechangeloglock` VALUES (1, b'0', NULL, NULL);

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
