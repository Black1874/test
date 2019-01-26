-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '�ϼ�����ID��һ������Ϊ0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��������',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '����',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '�Ƿ�ɾ��  -1����ɾ��  0������',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '���',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '��ǩ��',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '����ֵ',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '����',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '����',
  `sort` decimal(10, 0) NULL DEFAULT NULL COMMENT '��������',
  `parent_id` bigint(64) NULL DEFAULT 0 COMMENT '�������',
  `create_by` int(64) NULL DEFAULT NULL COMMENT '������',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '����ʱ��',
  `update_by` bigint(64) NULL DEFAULT NULL COMMENT '������',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '����ʱ��',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '��ע��Ϣ',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT 'ɾ�����',
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '�ļ�id',
  `type` int(11) NULL DEFAULT NULL COMMENT '�ļ�����: 0-ͼƬ 1-�ĵ� 2-��Ƶ 3-����',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL��ַ',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 203 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '�û�id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�û���',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�û�����',
  `time` int(11) NULL DEFAULT NULL COMMENT '��Ӧʱ��',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '���󷽷�',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�������',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP��ַ',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17299 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_position` int(1) NULL DEFAULT NULL COMMENT '�˵�λ�ã�1�������̨  2���ƶ���̨��',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '���˵�ID��һ���˵�Ϊ0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�˵�����',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�˵�URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ȩ(����ö��ŷָ����磺user:list,user:create)',
  `type` int(11) NULL DEFAULT NULL COMMENT '����   0��Ŀ¼   1���˵�   2����ť',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�˵�ͼ��',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '����',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '����ʱ��',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '�޸�ʱ��',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 195 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ɫ����',
  `role_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ɫ��ʶ',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ע',
  `user_id_create` bigint(255) NULL DEFAULT NULL COMMENT '�����û�id',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '����ʱ��',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '����ʱ��',
  `type` tinyint(2) NULL DEFAULT 0 COMMENT '��ɫ���ͣ� 0-ƽ̨��̨��ɫ   1-��ҵ��̨��ɫ',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '��ɫID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '�˵�ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16875 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron���ʽ',
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '������õķ�����',
  `is_concurrent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�����Ƿ���״̬',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��������',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '������',
  `bean_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '����ִ��ʱ�����ĸ���ķ��� ����+����',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '����ʱ��',
  `job_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '����״̬',
  `job_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�������',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '����ʱ��',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '������',
  `spring_bean` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Spring bean',
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '������',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�û���',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '����',
  `dept_id` bigint(20) NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '����',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ֻ���',
  `status` tinyint(255) NULL DEFAULT NULL COMMENT '״̬ 0:���ã�1:����',
  `user_id_create` bigint(255) NULL DEFAULT NULL COMMENT '�����û�id',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '����ʱ��',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '�޸�ʱ��',
  `gmt_create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '������',
  `gmt_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�޸���',
  `sex` bigint(32) NULL DEFAULT NULL COMMENT '�Ա�',
  `birth` datetime(0) NULL DEFAULT NULL COMMENT '��������',
  `pic_id` bigint(32) NULL DEFAULT NULL,
  `live_address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�־�ס��',
  `hobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '����',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ʡ��',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '���ڳ���',
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '���ڵ���',
  `ding_user_id` bigint(20) NULL DEFAULT NULL COMMENT '����ding_user����ʾ�ù����̨�˺Ź����Ķ����˺�',
  `corp_id` bigint(20) NULL DEFAULT NULL COMMENT '��ҵID������isv_corp��ID',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '�û�ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '��ɫID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;