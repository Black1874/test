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
