/*
 Navicat Premium Data Transfer

 Source Server         : gbt
 Source Server Type    : MySQL
 Source Server Version : 50670
 Source Host           : rm-wz9w1r3jr728r43xdoo.mysql.rds.aliyuncs.com:3306
 Source Schema         : gbt_test

 Target Server Type    : MySQL
 Target Server Version : 50670
 File Encoding         : 65001

 Date: 19/01/2019 15:14:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for allo_corp_holiday_config
-- ----------------------------
DROP TABLE IF EXISTS `allo_corp_holiday_config`;
CREATE TABLE `allo_corp_holiday_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '企业自定义节假日记录信息表',
  `corp_id` bigint(20) NOT NULL COMMENT '企业id',
  `year` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据年份',
  `month` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据月份',
  `json` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据json',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录更新人',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for allo_grant
-- ----------------------------
DROP TABLE IF EXISTS `allo_grant`;
CREATE TABLE `allo_grant`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '奖励津贴发放记录，目前奖励津贴支持一次发放多人',
  `corp_id` bigint(20) NOT NULL COMMENT '企业id',
  `type` tinyint(2) NULL DEFAULT NULL COMMENT '发放类型 \r\n1:每月津贴\r\n2:奖励津贴\r\n3:加班津贴',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `user_num` int(11) NULL DEFAULT NULL COMMENT '奖励的用户数量',
  `reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '奖励原因',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '发放总金额',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `ding_msg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '同时发送的钉钉消息',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1727 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for allo_grant_detail
-- ----------------------------
DROP TABLE IF EXISTS `allo_grant_detail`;
CREATE TABLE `allo_grant_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '奖励津贴发放明细',
  `user_id` bigint(20) NOT NULL COMMENT '关联ding_user表，收到奖励的员工',
  `grant_id` bigint(20) NOT NULL COMMENT '奖励记录id,关联allo_grant表',
  `type` tinyint(2) NOT NULL COMMENT '发放类型 \r\n1:每月津贴\r\n2:奖励津贴\r\n3:加班津贴',
  `amount` decimal(10, 2) NOT NULL COMMENT '奖励额',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6488 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for allo_new_entry_config
-- ----------------------------
DROP TABLE IF EXISTS `allo_new_entry_config`;
CREATE TABLE `allo_new_entry_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '新员工每月津贴配置表',
  `corp_id` bigint(20) NOT NULL,
  `monthly_allo` decimal(10, 2) NOT NULL COMMENT '新员工默认的每月津贴',
  `first_month_grant` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否自动按日期发放第一个月的津贴  \r\n0-否   1-是',
  `auto_set_allo` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否自动设置新员工每月津贴为默认值    \r\n0--否  1--是',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录更新人',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for allo_overtime_config
-- ----------------------------
DROP TABLE IF EXISTS `allo_overtime_config`;
CREATE TABLE `allo_overtime_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '加班津贴配置表',
  `corp_id` bigint(20) NOT NULL COMMENT '企业id',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '加班开始时间，只取 HH:mm:ss部分',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '加班结束时间，只取 HH:mm:ss部分',
  `cross_day` tinyint(2) NULL DEFAULT 0 COMMENT 'end_time是否跨天，0--否  1--是',
  `holiday_config` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否自定义节假日  0-否  1-是',
  `allo_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '加班津贴额度',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录更新人',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for allo_user_config
-- ----------------------------
DROP TABLE IF EXISTS `allo_user_config`;
CREATE TABLE `allo_user_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户津贴配置表，目前主要记录每月津贴额度和超额津贴额度',
  `ding_user_id` bigint(20) NOT NULL COMMENT '关联ding_user表主键',
  `type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '1-每月津贴额度  2-超额津贴额度',
  `amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '当前额度',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'sys' COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'sys' COMMENT '记录更新人',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ding_user_id_idx`(`ding_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for com_holiday
-- ----------------------------
DROP TABLE IF EXISTS `com_holiday`;
CREATE TABLE `com_holiday`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '法定工作日记录表',
  `date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期，格式为 yyyy-MM-dd',
  `type` tinyint(2) NOT NULL COMMENT '类型  1-法定节假日  2-法定工作日',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
  `has_child` tinyint(2) NULL DEFAULT NULL COMMENT '是否有子部门   1--是   0--否',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 517 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `active` tinyint(2) NULL DEFAULT NULL COMMENT '是否已经激活  0--未激活  1--已激活',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分机号（仅限企业内部开发调用）',
  `work_place` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地点（ISV不可见）',
  `is_ding_admin` tinyint(2) NULL DEFAULT NULL COMMENT '在钉钉侧是否管理员  0--否  1--是',
  `is_boss` tinyint(2) NULL DEFAULT NULL COMMENT '是否为企业的老板 0--否  1--是',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注（ISV不可见）',
  `is_leave` tinyint(2) NULL DEFAULT 0 COMMENT '是否已经离开组织  0--否  1--是',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'sys' COMMENT '记录创建人',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'sys' COMMENT '记录更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ding_user_unique_idx`(`corp_id`, `userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 255 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ding_user_account
-- ----------------------------
DROP TABLE IF EXISTS `ding_user_account`;
CREATE TABLE `ding_user_account`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '员工钱包信息表',
  `user_id` bigint(20) NOT NULL COMMENT '员工id',
  `monthly_allo` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '每月津贴余额',
  `award_allo` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '奖励津贴余额',
  `advance_allo` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '已透支津贴',
  `custom_auth` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否拥有代访客购买权限   \r\n0--无权限\r\n1--有权限',
  `custom_allo` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '待访客购买津贴余额',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'sys' COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'sys' COMMENT '记录更新人',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id_unique_idx`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 181 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ding_user_account_log
-- ----------------------------
DROP TABLE IF EXISTS `ding_user_account_log`;
CREATE TABLE `ding_user_account_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '津贴变更记录表',
  `user_id` bigint(20) NOT NULL,
  `change_item` tinyint(2) NOT NULL COMMENT '变更项    \r\n1:每月津贴\r\n2:奖励津贴\r\n3:透支津贴',
  `change_type` tinyint(2) NOT NULL COMMENT '变更类型\r\n1：支出 \r\n2：收入',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更备注',
  `change_value` decimal(10, 2) NOT NULL COMMENT '变更金额',
  `old_value` decimal(10, 2) NOT NULL COMMENT '原金额',
  `new_value` decimal(10, 2) NOT NULL COMMENT '现金额',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 472 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3890 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for gbt_machine_type
-- ----------------------------
DROP TABLE IF EXISTS `gbt_machine_type`;
CREATE TABLE `gbt_machine_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '机型记录，维护敢吧台对外销售的机型',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机型名称',
  `type` tinyint(2) NOT NULL COMMENT '机器类型 \r\n1：智能柜\r\n2：普通柜',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `row_num` int(11) NOT NULL COMMENT '行数',
  `col_num` int(11) NOT NULL COMMENT '列数',
  `lattice_num` int(11) NOT NULL COMMENT '货位总数',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录更新人',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gbt_shelf_resource
-- ----------------------------
DROP TABLE IF EXISTS `gbt_shelf_resource`;
CREATE TABLE `gbt_shelf_resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '机器资源信息表',
  `machine_type_id` bigint(20) NOT NULL COMMENT '机型ID',
  `terminal_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '终端号，用于调用如今开门功能，非智能柜为null',
  `type` tinyint(2) NOT NULL COMMENT '机器类型 1：智能柜  2:普通柜',
  `status` tinyint(2) NOT NULL COMMENT '状态：1-可用  2-不可用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录更新人',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  `supplier` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '供应商名称，根据这个字段调用不同供应商的开门接口',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for gd_goods
-- ----------------------------
DROP TABLE IF EXISTS `gd_goods`;
CREATE TABLE `gd_goods`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品信息表-主键',
  `corp_id` bigint(20) NOT NULL COMMENT '企业id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '商品类型 0-默认值 \r\n1-零食\r\n2-饮料\r\n3-办公用品\r\n4-其他\r\n\r\n101-主食/面包\r\n102-零食/薯片\r\n103-糖果/巧克力',
  `imgurl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片地址（600x600）',
  `imgurl_middle` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片地址_中（300x300）',
  `imgurl_small` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片地址_小（150x150）',
  `price` decimal(10, 2) NOT NULL COMMENT '商品售价',
  `describe` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品描述',
  `is_del` tinyint(2) NULL DEFAULT 0 COMMENT '是否已删除   0--否  1--是',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录更新人',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gd_goods_op_log
-- ----------------------------
DROP TABLE IF EXISTS `gd_goods_op_log`;
CREATE TABLE `gd_goods_op_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品信息修改记录表',
  `goods_id` bigint(20) NOT NULL COMMENT '关联goods_info表',
  `op_type` tinyint(2) NOT NULL COMMENT '操作类型  1:新增  2:修改  3:删除',
  `op_desc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改时记录修改的字段信息',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gd_goods_stock
-- ----------------------------
DROP TABLE IF EXISTS `gd_goods_stock`;
CREATE TABLE `gd_goods_stock`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品库存信息表',
  `goods_id` bigint(20) NOT NULL COMMENT '关联gd_goods',
  `corp_id` bigint(20) NOT NULL COMMENT '企业ID',
  `total_stock` int(11) NOT NULL DEFAULT 0 COMMENT '总库存',
  `wh_stock` int(11) NOT NULL DEFAULT 0 COMMENT '仓库库存',
  `shelf_stock` int(11) NOT NULL DEFAULT 0 COMMENT '货架库存',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录更新人',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gd_goods_stock_log
-- ----------------------------
DROP TABLE IF EXISTS `gd_goods_stock_log`;
CREATE TABLE `gd_goods_stock_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品库存变更记录表',
  `goods_id` bigint(20) NOT NULL COMMENT '商品id',
  `op_type` int(3) NULL DEFAULT NULL COMMENT '操作类型：1-入库,2-上架,3-下架,4-补货,5-出库,6-手工变更,7-订单支付',
  `before_total_stock` int(11) NOT NULL COMMENT '变更前总数量',
  `after_total_stock` int(11) NOT NULL COMMENT '变更后总数量',
  `before_shelf_stock` int(11) NOT NULL COMMENT '变更前货架数量',
  `after_shelf_stock` int(11) NOT NULL COMMENT '变更后货架数量',
  `before_wh_stock` int(11) NOT NULL COMMENT '变更前仓库库存',
  `after_wh_stock` int(11) NOT NULL COMMENT '变更后仓库库存',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更备注',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'sys' COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 685 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for gd_order
-- ----------------------------
DROP TABLE IF EXISTS `gd_order`;
CREATE TABLE `gd_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单表',
  `order_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `status` tinyint(2) NOT NULL COMMENT '订单状态: 1-待支付 2-已完成 3-已取消',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `user_id` bigint(20) NOT NULL COMMENT '员工id',
  `lattice_id` bigint(20) NULL DEFAULT NULL COMMENT '货架货位ID',
  `shelf_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货架名称',
  `lattice_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货位编号',
  `total_amount` decimal(10, 2) NOT NULL COMMENT '订单总金额',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `goods_num` int(11) NOT NULL COMMENT '商品数量',
  `goods_price` decimal(10, 2) NOT NULL COMMENT '单价',
  `goods_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片地址',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `corp_id` bigint(20) NOT NULL COMMENT '企业ID',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'sys' COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'sys' COMMENT '记录更新人',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 301 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gd_order_payment_info
-- ----------------------------
DROP TABLE IF EXISTS `gd_order_payment_info`;
CREATE TABLE `gd_order_payment_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单支付明细',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '关联ding_user表的主键',
  `order_id` bigint(20) NOT NULL COMMENT '关联订单表',
  `seria_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付流水号',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '支付状态：\r\n1--未支付\r\n  2--已支付',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `pay_type` tinyint(2) NULL DEFAULT NULL COMMENT '支付类型：  1：津贴支付  2：现金支付  3：津贴+现金',
  `total_pay_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单总金额',
  `cash_pay_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '现金支付额',
  `allo_pay_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '津贴支付金额',
  `monthly_allo` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '每月津贴使用',
  `overtime_allo` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '加班津贴使用',
  `award_allo` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '奖励津贴使用',
  `advance_allo` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '透支津贴使用',
  `custom_allo` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '待访客购买津贴使用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录更新人',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录更新时间',
  `corp_id` bigint(20) NULL DEFAULT NULL COMMENT '所属企业',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 298 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gd_stock_in
-- ----------------------------
DROP TABLE IF EXISTS `gd_stock_in`;
CREATE TABLE `gd_stock_in`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品入库记录表',
  `corp_id` bigint(20) NOT NULL COMMENT '企业id',
  `order_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '入库单号',
  `status` int(2) NOT NULL DEFAULT 0 COMMENT '入库单状态：（1：待确认 2：已确认 3：已取消）',
  `total_num` int(11) NOT NULL COMMENT '采购总数',
  `total_cost` decimal(10, 2) NOT NULL COMMENT '采购总额',
  `item_num` int(11) NOT NULL COMMENT '商品种类数量',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '入库备注',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录更新人',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gd_stock_in_detail
-- ----------------------------
DROP TABLE IF EXISTS `gd_stock_in_detail`;
CREATE TABLE `gd_stock_in_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品入库明细表',
  `stock_in_id` bigint(20) NOT NULL COMMENT '关联gd_purchase表',
  `goods_id` bigint(20) NOT NULL COMMENT '关联gd_goods表',
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `num` int(11) NOT NULL COMMENT '入库数量',
  `cost` decimal(10, 2) NOT NULL COMMENT '采购总价',
  `cost_avg` decimal(10, 2) NOT NULL COMMENT '采购均价',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录更新人',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for isv_app
-- ----------------------------
DROP TABLE IF EXISTS `isv_app`;
CREATE TABLE `isv_app`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'pl',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `suite_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微应用套件key',
  `app_id` bigint(20) NOT NULL COMMENT 'appid,此id来自于开发者中心',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_suite_app`(`suite_key`, `app_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'isv创建的app' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for isv_biz_lock
-- ----------------------------
DROP TABLE IF EXISTS `isv_biz_lock`;
CREATE TABLE `isv_biz_lock`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `lock_key` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '锁key',
  `expire` datetime(0) NULL DEFAULT NULL COMMENT '过期时间,null表示不过期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_lock_key`(`lock_key`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5766 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'db锁' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for isv_channel
-- ----------------------------
DROP TABLE IF EXISTS `isv_channel`;
CREATE TABLE `isv_channel`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'pl',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `suite_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微应用套件key',
  `app_id` bigint(20) NOT NULL COMMENT '服务窗appid,此id来自于开发者中心',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_suite_app`(`suite_key`, `app_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'isv创建的服务窗app' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for isv_corp
-- ----------------------------
DROP TABLE IF EXISTS `isv_corp`;
CREATE TABLE `isv_corp`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `ding_corp_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '钉钉企业ID',
  `invite_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业邀请码',
  `industry` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业所属行业',
  `corp_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业名称',
  `invite_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业邀请链接',
  `corp_logo_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业logo链接',
  `profile` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_corp_id`(`ding_corp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 169 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '企业信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for isv_corp_app
-- ----------------------------
DROP TABLE IF EXISTS `isv_corp_app`;
CREATE TABLE `isv_corp_app`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `agent_id` bigint(20) NOT NULL COMMENT '钉钉企业使用的微应用ID',
  `agent_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '钉钉企业使用的微应用名称',
  `logo_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钉钉企业使用的微应用图标',
  `app_id` bigint(20) NOT NULL COMMENT '钉钉企业使用的微应用原始ID',
  `corp_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '使用微应用的企业ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_corp_app`(`corp_id`, `app_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 165 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '企业微应用信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for isv_corp_channel_app
-- ----------------------------
DROP TABLE IF EXISTS `isv_corp_channel_app`;
CREATE TABLE `isv_corp_channel_app`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `agent_id` bigint(20) NOT NULL COMMENT '钉钉企业使用的服务窗应用ID',
  `agent_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '钉钉企业使用的服务窗应用名称',
  `logo_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钉钉企业使用的服务窗应用图标',
  `app_id` bigint(20) NOT NULL COMMENT '钉钉企业使用的服务窗应用原始ID',
  `corp_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '使用微应用的企业ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_corp_app`(`corp_id`, `app_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '企业服务窗应用信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for isv_corp_channel_token
-- ----------------------------
DROP TABLE IF EXISTS `isv_corp_channel_token`;
CREATE TABLE `isv_corp_channel_token`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '企业访问开放平台服务窗token信息，该表暂时没有使用，增加此表是为了防止接入的isvdemo代码报错',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `suite_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套件key',
  `corp_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钉钉平台企业ID',
  `corp_channel_token` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业授权套件服务窗token',
  `expired_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for isv_corp_dept
-- ----------------------------
DROP TABLE IF EXISTS `isv_corp_dept`;
CREATE TABLE `isv_corp_dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `corp_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dept_id` bigint(20) NOT NULL,
  `dept_parent_id` bigint(20) NULL DEFAULT NULL,
  `dept_sub_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `org_dept_manager` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `auto_create_group` tinyint(4) NOT NULL,
  `auto_add_user` tinyint(4) NOT NULL,
  `dept_group_owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dept_order` int(11) NOT NULL,
  `dept_hiding` tinyint(4) NOT NULL,
  `dept_perimit_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `outer_dept` tinyint(4) NOT NULL,
  `outer_permit_user` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `outer_permit_dept` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_corp_dept`(`corp_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '企业部门详情表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for isv_corp_suite_auth
-- ----------------------------
DROP TABLE IF EXISTS `isv_corp_suite_auth`;
CREATE TABLE `isv_corp_suite_auth`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `corp_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业corpid',
  `suite_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套件key',
  `permanent_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '临时授权码或永久授权码value',
  `ch_permanent_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业服务窗永久授权码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_corp_suite`(`corp_id`(191), `suite_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 151 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '企业对套件的授权记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for isv_corp_suite_auth_faile
-- ----------------------------
DROP TABLE IF EXISTS `isv_corp_suite_auth_faile`;
CREATE TABLE `isv_corp_suite_auth_faile`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `suite_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套件key',
  `corp_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `faile_info` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失败信息',
  `auth_faile_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '授权失败类型',
  `suite_push_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推送类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_c_s_f_p`(`suite_key`, `corp_id`, `auth_faile_type`, `suite_push_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '企业对套件的授权失败记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for isv_corp_suite_callback
-- ----------------------------
DROP TABLE IF EXISTS `isv_corp_suite_callback`;
CREATE TABLE `isv_corp_suite_callback`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `corp_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业corpid',
  `suite_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套件key',
  `callback_tag` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注册事件tag,json结构存储',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '企业注册回调事件' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for isv_corp_suite_jsapi_channel_ticket
-- ----------------------------
DROP TABLE IF EXISTS `isv_corp_suite_jsapi_channel_ticket`;
CREATE TABLE `isv_corp_suite_jsapi_channel_ticket`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `suite_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套件key',
  `corp_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '钉钉企业id',
  `corp_channel_jsapi_ticket` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业服务窗js_ticket',
  `expired_time` datetime(0) NOT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_suite_corp`(`suite_key`, `corp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '企业使用服务窗jsapi的js ticket表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for isv_corp_suite_jsapi_ticket
-- ----------------------------
DROP TABLE IF EXISTS `isv_corp_suite_jsapi_ticket`;
CREATE TABLE `isv_corp_suite_jsapi_ticket`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `suite_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套件key',
  `corp_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '钉钉企业id',
  `corp_jsapi_ticket` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业js_ticket',
  `expired_time` datetime(0) NOT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_suite_corp`(`suite_key`, `corp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15361 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '企业使用jsapi的js ticket表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for isv_corp_token
-- ----------------------------
DROP TABLE IF EXISTS `isv_corp_token`;
CREATE TABLE `isv_corp_token`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `suite_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套件key',
  `corp_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '钉钉企业id',
  `corp_token` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业token',
  `expired_time` datetime(0) NOT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_suite_corp`(`suite_key`, `corp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2468 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '套件能够访问企业数据的accesstoken' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for isv_suite
-- ----------------------------
DROP TABLE IF EXISTS `isv_suite`;
CREATE TABLE `isv_suite`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `suite_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套件名字',
  `suite_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'suite 的唯一key',
  `suite_secret` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'suite的唯一secrect，与key对应',
  `encoding_aes_key` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回调信息加解密参数',
  `token` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '已填写用于生成签名和校验毁掉请求的合法性',
  `event_receive_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回调地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_suite_key`(`suite_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '套件信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for isv_suite_ticket
-- ----------------------------
DROP TABLE IF EXISTS `isv_suite_ticket`;
CREATE TABLE `isv_suite_ticket`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `suite_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套件suitekey',
  `ticket` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套件ticket',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_suite_key`(`suite_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 827 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用于接收推送的套件ticket' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for isv_suite_token
-- ----------------------------
DROP TABLE IF EXISTS `isv_suite_token`;
CREATE TABLE `isv_suite_token`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `suite_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套件key',
  `suite_token` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套件token',
  `expired_time` datetime(0) NOT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_suite_key`(`suite_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 537 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '套件的accesstoken表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lms_locker
-- ----------------------------
DROP TABLE IF EXISTS `lms_locker`;
CREATE TABLE `lms_locker`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '储物柜对象表',
  `corp_id` bigint(20) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '储物柜名称',
  `source_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '渠道名称，目前只有沐腾',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录更新人',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  `tag` tinyint(2) NOT NULL DEFAULT 1 COMMENT '柜子所属地标签，1-广州',
  `col_num` tinyint(2) NOT NULL DEFAULT 0 COMMENT '柜子列数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lms_locker_cell
-- ----------------------------
DROP TABLE IF EXISTS `lms_locker_cell`;
CREATE TABLE `lms_locker_cell`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) NOT NULL DEFAULT 62,
  `locker_id` bigint(20) NOT NULL COMMENT '柜子id，关联lms_locker',
  `type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '类型   0-共享位  1-固定位',
  `index` int(11) NOT NULL COMMENT '顺序',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态  0-未借出  1-已借出',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '所属用户id，status是0时为null，关联ding_user表',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '柜子编号',
  `last_lend_time` datetime(0) NULL DEFAULT NULL COMMENT '上次借出时间(共享位开通时间)',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'sys' COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'sys' COMMENT '记录更新人',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lms_menu
-- ----------------------------
DROP TABLE IF EXISTS `lms_menu`;
CREATE TABLE `lms_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_position` int(1) NULL DEFAULT NULL COMMENT '菜单位置（1：管理后台  2：移动后台）',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 214 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lms_open_log
-- ----------------------------
DROP TABLE IF EXISTS `lms_open_log`;
CREATE TABLE `lms_open_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `locker_id` bigint(20) NOT NULL,
  `cell_id` bigint(20) NOT NULL,
  `locker_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `cell_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` tinyint(2) NOT NULL COMMENT '操作类型  0-员工共享位  1-员工固定位  2-管理员开门',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 158 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lms_role
-- ----------------------------
DROP TABLE IF EXISTS `lms_role`;
CREATE TABLE `lms_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint(255) NULL DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `type` tinyint(2) NULL DEFAULT 0 COMMENT '角色类型： 0-平台后台角色   1-企业后台角色',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lms_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `lms_role_menu`;
CREATE TABLE `lms_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17127 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lms_share_config
-- ----------------------------
DROP TABLE IF EXISTS `lms_share_config`;
CREATE TABLE `lms_share_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) NOT NULL,
  `max_time` int(11) NULL DEFAULT NULL COMMENT '共享位可用最大时间(秒)',
  `max_num` int(11) NULL DEFAULT 0 COMMENT '最大借用数量',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录更新人',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lms_share_log
-- ----------------------------
DROP TABLE IF EXISTS `lms_share_log`;
CREATE TABLE `lms_share_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cell_id` bigint(20) NOT NULL COMMENT '关联lms_locker_cell表',
  `user_id` bigint(20) NOT NULL COMMENT '关联ding_user',
  `lend_time` datetime(0) NOT NULL COMMENT '借出时间',
  `return_time` datetime(0) NULL DEFAULT NULL COMMENT '归还时间，还未归还为null',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录更新人',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  `locker_id` bigint(20) NOT NULL COMMENT '柜子id',
  `locker_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '柜子名称',
  `cell_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '柜子编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lms_task
-- ----------------------------
DROP TABLE IF EXISTS `lms_task`;
CREATE TABLE `lms_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务调用的方法名',
  `is_concurrent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务是否有状态',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务描述',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `bean_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `job_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务状态',
  `job_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务分组',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `spring_bean` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Spring bean',
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lms_user_role
-- ----------------------------
DROP TABLE IF EXISTS `lms_user_role`;
CREATE TABLE `lms_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mt_locker_mapper
-- ----------------------------
DROP TABLE IF EXISTS `mt_locker_mapper`;
CREATE TABLE `mt_locker_mapper`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cell_id` bigint(20) NOT NULL COMMENT '格子id',
  `mt_locker_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '沐腾柜子id',
  `mt_cell_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '沐腾格子锁id',
  `type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '柜子类型，决定关联哪张表   \r\n0-关联 lms_locker_cell表',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录更新人',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for no_sequence
-- ----------------------------
DROP TABLE IF EXISTS `no_sequence`;
CREATE TABLE `no_sequence`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号名称',
  `length` int(11) NULL DEFAULT NULL COMMENT '长度',
  `PREFIX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '前缀',
  `SEQ` int(11) NOT NULL DEFAULT 0 COMMENT '序列值',
  `SEQ_DATE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '序列日期 yyyyMMdd',
  `increment` int(11) NOT NULL DEFAULT 1 COMMENT '序列步长',
  `version` bigint(20) NULL DEFAULT NULL COMMENT '版本号',
  `corp_id` bigint(20) NULL DEFAULT NULL COMMENT '企业ID',
  PRIMARY KEY (`id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_notify
-- ----------------------------
DROP TABLE IF EXISTS `oa_notify`;
CREATE TABLE `oa_notify`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类型',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '内容',
  `files` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '附件',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '状态',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oa_notify_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_notify_record
-- ----------------------------
DROP TABLE IF EXISTS `oa_notify_record`;
CREATE TABLE `oa_notify_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `notify_id` bigint(20) NULL DEFAULT NULL COMMENT '通知通告ID',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '接受人',
  `is_read` tinyint(1) NULL DEFAULT 0 COMMENT '阅读标记',
  `read_date` date NULL DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oa_notify_record_notify_id`(`notify_id`) USING BTREE,
  INDEX `oa_notify_record_user_id`(`user_id`) USING BTREE,
  INDEX `oa_notify_record_read_flag`(`is_read`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `PROC_INS_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程实例ID',
  `USER_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '变动用户',
  `OFFICE_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '归属部门',
  `POST` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '岗位',
  `AGE` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `EDU` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '学历',
  `CONTENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '调整原因',
  `OLDA` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '现行标准 薪酬档级',
  `OLDB` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '现行标准 月工资额',
  `OLDC` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '现行标准 年薪总额',
  `NEWA` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '调整后标准 薪酬档级',
  `NEWB` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '调整后标准 月工资额',
  `NEWC` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '调整后标准 年薪总额',
  `ADD_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '月增资',
  `EXE_DATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '执行时间',
  `HR_TEXT` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '人力资源部门意见',
  `LEAD_TEXT` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '分管领导意见',
  `MAIN_LEAD_TEXT` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '集团主要领导意见',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `OA_TEST_AUDIT_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for shelf_control_log
-- ----------------------------
DROP TABLE IF EXISTS `shelf_control_log`;
CREATE TABLE `shelf_control_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '货柜补货/上架/下架记录表',
  `type` tinyint(2) NOT NULL COMMENT '数据类型：\r\n1-补货记录\r\n2-上架记录\r\n3-下架记录',
  `goods_id` bigint(20) NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `shelf_id` bigint(20) NOT NULL COMMENT '货柜id',
  `shelf_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货柜名称',
  `lattice_id` bigint(20) NOT NULL COMMENT '货位id',
  `lattice_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货位编号',
  `before_num` int(11) NULL DEFAULT NULL COMMENT '操作前的货位商品数量',
  `replenish_num` int(11) NULL DEFAULT NULL COMMENT '操作的商品数量',
  `after_num` int(11) NULL DEFAULT NULL COMMENT '操作后的货位商品数量',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `corp_id` bigint(20) NOT NULL COMMENT '企业ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 462 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for shelf_info
-- ----------------------------
DROP TABLE IF EXISTS `shelf_info`;
CREATE TABLE `shelf_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '货柜信息表',
  `corp_id` bigint(20) NOT NULL COMMENT '企业id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '货柜名称',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '货柜编号',
  `lattice_prefix` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货位编号前缀',
  `resource_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源id，关联gbt_shelf_resource，非智能柜暂不关联',
  `type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '货柜类型\r\n 0：默认值\r\n1：智能柜\r\n2：普通柜',
  `row_num` int(11) NOT NULL COMMENT '行数',
  `col_num` int(11) NOT NULL COMMENT '列数',
  `lattice_num` int(11) NOT NULL COMMENT '货位总数',
  `lattice_used` int(11) NOT NULL DEFAULT 0 COMMENT '已用货位数',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态：1-正常、2-已使用、3-故障、4-无效',
  `lattices_created` int(1) NULL DEFAULT 0 COMMENT '是否创建货位：0-未创建、1-已创建',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录更新人',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `is_del` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否删除：0未删除  1已删除',
  `position_lat` decimal(20, 15) NULL DEFAULT NULL COMMENT '定位-纬度',
  `position_lng` decimal(20, 15) NULL DEFAULT NULL COMMENT '定位-经度',
  `max_distance` int(11) NULL DEFAULT NULL COMMENT '最大购买范围(单位：米)',
  `position_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定位时的名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for shelf_lattice
-- ----------------------------
DROP TABLE IF EXISTS `shelf_lattice`;
CREATE TABLE `shelf_lattice`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '货位商品信息表',
  `shelf_id` bigint(20) NOT NULL COMMENT '货柜id',
  `lattice_index` int(11) NOT NULL COMMENT '货位索引',
  `lattice_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货位编号',
  `goods_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `goods_num` int(11) NULL DEFAULT 0 COMMENT '剩余数量',
  `expect_goods_num` int(11) NULL DEFAULT 0 COMMENT '智能补货时设置的商品数量期望值',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录更新人',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 232 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for shelf_replenish
-- ----------------------------
DROP TABLE IF EXISTS `shelf_replenish`;
CREATE TABLE `shelf_replenish`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) NOT NULL,
  `shelf_id` bigint(20) NOT NULL,
  `shelf_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货柜名称',
  `item` int(11) NOT NULL COMMENT '补货项',
  `total_num` int(11) NOT NULL COMMENT '补货数量',
  `status` tinyint(2) NOT NULL COMMENT '状态：1、待确认  2、已完成  3、已作废',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shelf_replenish_clock
-- ----------------------------
DROP TABLE IF EXISTS `shelf_replenish_clock`;
CREATE TABLE `shelf_replenish_clock`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) NOT NULL,
  `shelf_id` bigint(20) NOT NULL COMMENT '货柜 id',
  `status` tinyint(2) NOT NULL COMMENT '记录状态  0-无效  1-有效',
  `no_goods_alert` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否当商品数量为0时发送提醒   0-否   1-是',
  `alert_user_ids` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提醒的用户id列表，逗号分隔',
  `alert_user_names` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提醒的用户名称列表，逗号分隔',
  `alert_time` datetime(0) NULL DEFAULT NULL COMMENT '提醒时间，只取HH:mm:ss部分',
  `monday` tinyint(2) NULL DEFAULT 0 COMMENT '星期一是否启用  0-否  1-是',
  `tuesday` tinyint(2) NULL DEFAULT 0 COMMENT '星期二是否启用  0-否  1-是',
  `wednesday` tinyint(2) NULL DEFAULT 0 COMMENT '星期三是否启用  0-否  1-是',
  `thursday` tinyint(2) NULL DEFAULT 0 COMMENT '星期四是否启用  0-否  1-是',
  `friday` tinyint(2) NULL DEFAULT 0 COMMENT '星期五是否启用  0-否  1-是',
  `saturday` tinyint(2) NULL DEFAULT 0 COMMENT '星期六是否启用  0-否  1-是',
  `sunday` tinyint(2) NULL DEFAULT 0 COMMENT '星期天是否启用  0-否  1-是',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录更新人',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shelf_replenish_detail
-- ----------------------------
DROP TABLE IF EXISTS `shelf_replenish_detail`;
CREATE TABLE `shelf_replenish_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '货柜补货/上架/下架记录表',
  `replenish_id` bigint(20) NOT NULL COMMENT '关联shelf_replenish表主键',
  `goods_id` bigint(20) NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `shelf_id` bigint(20) NOT NULL COMMENT '货柜id',
  `shelf_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货柜名称',
  `lattice_id` bigint(20) NOT NULL COMMENT '货位id',
  `lattice_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货位编号',
  `before_num` int(11) NULL DEFAULT NULL COMMENT '操作前的货位商品数量',
  `replenish_num` int(11) NULL DEFAULT NULL COMMENT '操作的商品数量',
  `after_num` int(11) NULL DEFAULT NULL COMMENT '操作后的货位商品数量',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `corp_id` bigint(20) NOT NULL COMMENT '企业ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shelf_stocktake
-- ----------------------------
DROP TABLE IF EXISTS `shelf_stocktake`;
CREATE TABLE `shelf_stocktake`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品盘点记录表',
  `shelf_id` bigint(20) NOT NULL COMMENT '货柜id',
  `error_item` int(11) NOT NULL DEFAULT 0 COMMENT '异常商品项',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for shelf_stocktake_detail
-- ----------------------------
DROP TABLE IF EXISTS `shelf_stocktake_detail`;
CREATE TABLE `shelf_stocktake_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品盘点明细表',
  `stocktake_id` bigint(20) NOT NULL COMMENT '盘点记录id',
  `goods_id` bigint(20) NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lattice_id` bigint(20) NOT NULL COMMENT '货位id',
  `lattice_index` int(11) NOT NULL COMMENT '货位编号',
  `system_num` int(11) NOT NULL COMMENT '系统记录的数量',
  `real_num` int(11) NOT NULL COMMENT '实际数量',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for statis_allow_grant
-- ----------------------------
DROP TABLE IF EXISTS `statis_allow_grant`;
CREATE TABLE `statis_allow_grant`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '企业津贴发放-日报',
  `corp_id` bigint(20) NOT NULL COMMENT '企业id',
  `monthly_allo` decimal(10, 2) NULL DEFAULT NULL COMMENT '每月津贴发放额',
  `award_allo` decimal(10, 2) NULL DEFAULT NULL COMMENT '奖励津贴发放额',
  `overtime_allo` decimal(10, 2) NULL DEFAULT NULL COMMENT '加班津贴发放额',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for statis_consume
-- ----------------------------
DROP TABLE IF EXISTS `statis_consume`;
CREATE TABLE `statis_consume`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '企业消费-日报',
  `corp_id` bigint(20) NOT NULL COMMENT '企业id，关联ding_company',
  `monthly_allo` decimal(10, 2) NULL DEFAULT NULL COMMENT '每月津贴使用额',
  `award_allo` decimal(10, 2) NULL DEFAULT NULL COMMENT '奖励津贴使用额',
  `overtime_allo` decimal(10, 2) NULL DEFAULT NULL COMMENT '加班津贴使用额',
  `overdraft_allo` decimal(10, 2) NULL DEFAULT NULL COMMENT '当前已透支津贴总额',
  `cash_use` decimal(10, 2) NULL DEFAULT NULL COMMENT '现金使用额',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类型',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `sort` decimal(10, 0) NULL DEFAULT NULL COMMENT '排序（升序）',
  `parent_id` bigint(64) NULL DEFAULT 0 COMMENT '父级编号',
  `create_by` int(64) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_dict_value`(`value`) USING BTREE,
  INDEX `sys_dict_label`(`name`) USING BTREE,
  INDEX `sys_dict_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `type` int(11) NULL DEFAULT NULL COMMENT '文件类型: 0-图片 1-文档 2-视频 3-音乐',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 203 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `time` int(11) NULL DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17299 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_position` int(1) NULL DEFAULT NULL COMMENT '菜单位置（1：管理后台  2：移动后台）',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 195 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint(255) NULL DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `type` tinyint(2) NULL DEFAULT 0 COMMENT '角色类型： 0-平台后台角色   1-企业后台角色',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16875 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务调用的方法名',
  `is_concurrent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务是否有状态',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务描述',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `bean_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `job_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务状态',
  `job_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务分组',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `spring_bean` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Spring bean',
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `dept_id` bigint(20) NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(255) NULL DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `user_id_create` bigint(255) NULL DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `gmt_create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `gmt_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `sex` bigint(32) NULL DEFAULT NULL COMMENT '性别',
  `birth` datetime(0) NULL DEFAULT NULL COMMENT '出身日期',
  `pic_id` bigint(32) NULL DEFAULT NULL,
  `live_address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现居住地',
  `hobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爱好',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在城市',
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在地区',
  `ding_user_id` bigint(20) NULL DEFAULT NULL COMMENT '关联ding_user表，表示该管理后台账号关联的钉钉账号',
  `corp_id` bigint(20) NULL DEFAULT NULL COMMENT '企业ID，关联isv_corp表ID',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
