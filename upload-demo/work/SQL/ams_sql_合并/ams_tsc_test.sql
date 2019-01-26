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
