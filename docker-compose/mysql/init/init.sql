# ************************************************************
# Sequel Ace SQL dump
# Version 20067
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 8.0.28)
# Database: td27
# Generation Time: 2024-06-10 14:10:04 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table authority_api
# ------------------------------------------------------------

DROP TABLE IF EXISTS `authority_api`;

CREATE TABLE `authority_api` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'api路径',
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'api中文描述',
  `api_group` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'api组',
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'POST' COMMENT '方法',
  PRIMARY KEY (`id`),
  KEY `idx_sys_api_deleted_at` (`deleted_at`),
  KEY `idx_authority_api_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `authority_api` WRITE;
/*!40000 ALTER TABLE `authority_api` DISABLE KEYS */;

INSERT INTO `authority_api` (`id`, `created_at`, `updated_at`, `deleted_at`, `path`, `description`, `api_group`, `method`)
VALUES
	(1,'2023-03-10 06:24:36','2024-01-24 08:59:10',NULL,'/logReg/captcha','获取验证码（必选）','logReg','POST'),
	(2,'2023-03-08 06:36:24','2024-01-24 08:59:21',NULL,'/logReg/login','登录（必选）','logReg','POST'),
	(3,'2024-06-09 15:32:30','2024-06-09 15:32:30',NULL,'/logReg/logout','登出（必选）','logReg','POST'),
	(4,'2023-03-10 07:21:37','2023-03-10 07:21:37',NULL,'/casbin/editCasbin','编辑casbin规则','casbin','POST'),
	(5,'2023-03-08 08:56:13','2023-03-10 07:11:53',NULL,'/user/getUserInfo','获取用户信息（必选）','user','GET'),
	(6,'2023-03-08 08:56:54','2023-03-08 08:56:54',NULL,'/user/getUsers','获取所有用户','user','POST'),
	(7,'2023-03-10 06:41:32','2023-03-10 06:41:32',NULL,'/user/deleteUser','删除用户','user','POST'),
	(8,'2023-03-10 06:42:24','2023-03-10 06:42:24',NULL,'/user/addUser','添加用户','user','POST'),
	(9,'2023-03-10 06:47:18','2023-03-10 06:47:18',NULL,'/user/editUser','编辑用户','user','POST'),
	(10,'2023-03-10 06:47:59','2023-03-10 06:47:59',NULL,'/user/modifyPass','修改用户密码','user','POST'),
	(11,'2023-03-10 06:48:43','2023-03-10 06:48:43',NULL,'/user/switchActive','切换用户状态','user','POST'),
	(12,'2023-03-10 06:58:30','2023-03-10 06:58:30',NULL,'/role/getRoles','获取所有角色','role','POST'),
	(13,'2023-03-10 06:59:08','2023-03-10 06:59:08',NULL,'/role/addRole','添加角色','role','POST'),
	(14,'2023-03-10 06:59:54','2023-03-10 06:59:54',NULL,'/role/deleteRole','删除角色','role','POST'),
	(15,'2023-03-10 07:00:14','2023-03-10 07:00:53',NULL,'/role/editRole','编辑角色','role','POST'),
	(16,'2023-03-10 07:01:44','2023-03-10 07:01:44',NULL,'/role/editRoleMenu','编辑角色菜单','role','POST'),
	(17,'2023-03-10 07:14:44','2023-03-10 07:14:44',NULL,'/menu/getMenus','获取所有菜单','menu','GET'),
	(18,'2023-03-10 07:15:25','2023-03-10 07:15:25',NULL,'/menu/addMenu','添加菜单','menu','POST'),
	(19,'2023-03-10 07:15:50','2023-03-10 07:15:50',NULL,'/menu/editMenu','编辑菜单','menu','POST'),
	(20,'2023-03-10 07:16:18','2023-03-10 07:16:18',NULL,'/menu/deleteMenu','删除菜单','menu','POST'),
	(21,'2023-03-10 07:17:13','2023-03-10 07:17:13',NULL,'/menu/getElTreeMenus','获取所有菜单（el-tree结构）','menu','POST'),
	(22,'2023-03-10 07:23:21','2023-03-10 07:33:01',NULL,'/api/addApi','添加api','api','POST'),
	(23,'2023-03-10 07:24:00','2023-03-10 07:24:00',NULL,'/api/getApis','获取所有api','api','POST'),
	(24,'2023-03-10 07:24:33','2023-03-10 07:24:33',NULL,'/api/deleteApi','删除api','api','POST'),
	(25,'2023-03-10 07:26:15','2023-03-10 07:26:15',NULL,'/api/editApi','编辑api','api','POST'),
	(26,'2023-03-10 07:34:08','2023-03-10 07:35:04',NULL,'/api/getElTreeApis','获取所有api（el-tree结构）','api','POST'),
	(27,'2024-01-03 06:20:38','2024-01-03 06:20:38',NULL,'/api/deleteApiById','批量删除API','api','POST'),
	(28,'2023-07-13 02:32:16','2024-01-20 04:50:50',NULL,'/opl/getOplList','分页获取操作记录','opl','POST'),
	(29,'2023-07-13 02:33:32','2024-01-20 04:54:16',NULL,'/opl/deleteOpl','删除操作记录','opl','POST'),
	(30,'2023-07-13 06:48:47','2024-01-20 04:54:23',NULL,'/opl/deleteOplByIds','批量删除操作记录','opl','POST'),
	(31,'2023-08-27 06:05:00','2023-08-27 06:05:00',NULL,'/file/upload','文件上传','file','POST'),
	(32,'2023-08-27 06:06:43','2023-08-27 06:06:43',NULL,'/file/getFileList','分页获取文件信息','file','POST'),
	(33,'2024-01-04 03:10:15','2024-01-04 03:10:41',NULL,'/file/download','下载文件','file','GET'),
	(34,'2024-01-04 03:16:04','2024-01-04 03:16:04',NULL,'/file/delete','删除文件','file','GET'),
	(35,'2024-02-23 08:31:57','2024-02-23 08:31:57',NULL,'/cron/getCronList','分页获取cron','cron','POST'),
	(36,'2024-02-23 08:33:56','2024-02-23 08:33:56',NULL,'/cron/addCron','添加cron','cron','POST'),
	(37,'2024-02-23 08:34:25','2024-02-23 08:34:25',NULL,'/cron/deleteCron','删除cron','cron','POST'),
	(38,'2024-02-23 08:34:50','2024-02-23 08:34:50',NULL,'/cron/editCron','编辑cron','cron','POST'),
	(39,'2024-02-23 08:35:21','2024-02-23 08:35:21',NULL,'/cron/switchOpen','cron开关','cron','POST');

/*!40000 ALTER TABLE `authority_api` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table authority_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `authority_menu`;

CREATE TABLE `authority_menu` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `pid` bigint unsigned DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `component` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` json DEFAULT NULL,
  `sort` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`),
  KEY `idx_sys_menu_deleted_at` (`deleted_at`),
  KEY `idx_authority_menu_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `authority_menu` WRITE;
/*!40000 ALTER TABLE `authority_menu` DISABLE KEYS */;

INSERT INTO `authority_menu` (`id`, `created_at`, `updated_at`, `deleted_at`, `pid`, `name`, `path`, `redirect`, `component`, `meta`, `sort`)
VALUES
	(1,NULL,'2024-01-22 07:32:30',NULL,0,'Authority','/authority','/authority/user','Layout','{\"title\": \"权限管理\", \"svgIcon\": \"lock\"}',1),
	(2,NULL,'2024-02-05 09:38:41',NULL,1,'User','user','','authority/user/index.vue','{\"title\": \"用户管理\"}',1),
	(3,NULL,'2023-06-28 08:12:06',NULL,1,'Role','role','','authority/role/index.vue','{\"title\": \"角色管理\"}',2),
	(4,NULL,'2023-06-28 08:12:16',NULL,1,'Menu','menu','','authority/menu/index.vue','{\"title\": \"菜单管理\"}',3),
	(5,'2023-03-07 01:50:48','2023-06-28 08:11:38',NULL,1,'Api','api','','authority/api/index.vue','{\"title\": \"接口管理\"}',4),
	(6,NULL,'2023-08-25 09:55:12',NULL,0,'Cenu','/cenu','/cenu/cenu1','Layout','{\"title\": \"多级菜单\", \"svgIcon\": \"menu\", \"alwaysShow\": true}',2),
	(7,NULL,'2023-06-28 08:42:39',NULL,6,'Cenu1','cenu1','/cenu/cenu1/cenu1-1','cenu/cenu1/index.vue','{\"title\": \"cenu1\"}',1),
	(8,NULL,'2023-06-28 08:42:44',NULL,7,'Cenu1-1','cenu1-1','','cenu/cenu1/cenu1-1/index.vue','{\"title\": \"cenu1-1\"}',1),
	(9,'2023-03-13 06:14:27','2023-06-28 08:43:02',NULL,7,'Cenu1-2','cenu1-2','','cenu/cenu1/cenu1-2/index.vue','{\"title\": \"cenu1-2\"}',2),
	(10,'2023-08-26 08:57:01','2023-08-26 09:02:58',NULL,0,'FileM','/fileM','/fileM/file','Layout','{\"title\": \"文件管理\", \"svgIcon\": \"file\", \"alwaysShow\": true}',3),
	(11,'2023-08-26 08:58:51','2023-08-26 08:58:51',NULL,10,'File','/fileM/file','','fileM/file/index.vue','{\"title\": \"文件\"}',1),
	(12,'2024-01-19 07:47:49','2024-03-25 06:14:36',NULL,0,'Monitor','/monitor','/monitor/operationLog','Layout','{\"title\": \"系统监控\", \"svgIcon\": \"monitor\", \"alwaysShow\": true}',5),
	(13,'2023-03-07 01:50:48','2024-01-19 07:48:52',NULL,12,'OperationLog','operationLog','','monitor/operationLog/index.vue','{\"title\": \"操作日志\"}',1),
	(14,'2024-02-05 09:56:33','2024-02-05 09:56:33',NULL,0,'SysTool','/systool','/systool/cron','Layout','{\"title\": \"系统工具\", \"svgIcon\": \"config\", \"alwaysShow\": true}',4),
	(15,'2024-02-06 10:00:00','2024-02-06 10:00:00',NULL,14,'Cron','cron','','sysTool/cron/index.vue','{\"title\": \"定时任务\"}',1);

/*!40000 ALTER TABLE `authority_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table authority_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `authority_role`;

CREATE TABLE `authority_role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `role_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name` (`role_name`),
  KEY `idx_sys_role_deleted_at` (`deleted_at`),
  KEY `idx_authority_role_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `authority_role` WRITE;
/*!40000 ALTER TABLE `authority_role` DISABLE KEYS */;

INSERT INTO `authority_role` (`id`, `created_at`, `updated_at`, `deleted_at`, `role_name`)
VALUES
	(1,NULL,'2024-03-25 07:01:12',NULL,'root');

/*!40000 ALTER TABLE `authority_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table authority_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `authority_user`;

CREATE TABLE `authority_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `active` tinyint(1) DEFAULT NULL,
  `role_model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `idx_sys_user_deleted_at` (`deleted_at`),
  KEY `idx_sys_user_username` (`username`),
  KEY `idx_base_user_deleted_at` (`deleted_at`),
  KEY `idx_base_user_username` (`username`),
  KEY `idx_authority_user_deleted_at` (`deleted_at`),
  KEY `idx_authority_user_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `authority_user` WRITE;
/*!40000 ALTER TABLE `authority_user` DISABLE KEYS */;

INSERT INTO `authority_user` (`id`, `created_at`, `updated_at`, `deleted_at`, `username`, `password`, `phone`, `email`, `active`, `role_model_id`)
VALUES
	(1,'2023-02-20 12:51:58','2024-03-25 09:29:30',NULL,'admin','e10adc3949ba59abbe56e057f20f883e','11111111111','pddzl5@163.com',1,1);

/*!40000 ALTER TABLE `authority_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table casbin_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `casbin_rule`;

CREATE TABLE `casbin_rule` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ptype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `v0` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `v1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `v2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `v3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `v4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `v5` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_casbin_rule` (`ptype`,`v0`,`v1`,`v2`,`v3`,`v4`,`v5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `casbin_rule` WRITE;
/*!40000 ALTER TABLE `casbin_rule` DISABLE KEYS */;

INSERT INTO `casbin_rule` (`id`, `ptype`, `v0`, `v1`, `v2`, `v3`, `v4`, `v5`)
VALUES
	(173,'p','1','/api/addApi','POST','','',''),
	(175,'p','1','/api/deleteApi','POST','','',''),
	(178,'p','1','/api/deleteApiById','POST','','',''),
	(176,'p','1','/api/editApi','POST','','',''),
	(174,'p','1','/api/getApis','POST','','',''),
	(177,'p','1','/api/getElTreeApis','POST','','',''),
	(155,'p','1','/casbin/editCasbin','POST','','',''),
	(187,'p','1','/cron/addCron','POST','','',''),
	(188,'p','1','/cron/deleteCron','POST','','',''),
	(189,'p','1','/cron/editCron','POST','','',''),
	(186,'p','1','/cron/getCronList','POST','','',''),
	(190,'p','1','/cron/switchOpen','POST','','',''),
	(185,'p','1','/file/delete','GET','','',''),
	(184,'p','1','/file/download','GET','','',''),
	(183,'p','1','/file/getFileList','POST','','',''),
	(182,'p','1','/file/upload','POST','','',''),
	(152,'p','1','/logReg/captcha','POST','','',''),
	(153,'p','1','/logReg/login','POST','','',''),
	(154,'p','1','/logReg/logout','POST','','',''),
	(169,'p','1','/menu/addMenu','POST','','',''),
	(171,'p','1','/menu/deleteMenu','POST','','',''),
	(170,'p','1','/menu/editMenu','POST','','',''),
	(172,'p','1','/menu/getElTreeMenus','POST','','',''),
	(168,'p','1','/menu/getMenus','GET','','',''),
	(180,'p','1','/opl/deleteOpl','POST','','',''),
	(181,'p','1','/opl/deleteOplByIds','POST','','',''),
	(179,'p','1','/opl/getOplList','POST','','',''),
	(164,'p','1','/role/addRole','POST','','',''),
	(165,'p','1','/role/deleteRole','POST','','',''),
	(166,'p','1','/role/editRole','POST','','',''),
	(167,'p','1','/role/editRoleMenu','POST','','',''),
	(163,'p','1','/role/getRoles','POST','','',''),
	(159,'p','1','/user/addUser','POST','','',''),
	(158,'p','1','/user/deleteUser','POST','','',''),
	(160,'p','1','/user/editUser','POST','','',''),
	(156,'p','1','/user/getUserInfo','GET','','',''),
	(157,'p','1','/user/getUsers','POST','','',''),
	(161,'p','1','/user/modifyPass','POST','','',''),
	(162,'p','1','/user/switchActive','POST','','','');

/*!40000 ALTER TABLE `casbin_rule` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fileM_file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fileM_file`;

CREATE TABLE `fileM_file` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件名',
  `full_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件完整路径',
  `mime` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`id`),
  KEY `idx_fileM_file_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table monitor_operationLog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `monitor_operationLog`;

CREATE TABLE `monitor_operationLog` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求ip',
  `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求方法',
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求路径',
  `status` bigint DEFAULT NULL COMMENT '请求状态',
  `user_agent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `req_param` text COLLATE utf8mb4_unicode_ci COMMENT '请求Body',
  `resp_data` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '响应数据',
  `resp_time` bigint DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名称',
  PRIMARY KEY (`id`),
  KEY `idx_monitor_operationLog_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table role_menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_menus`;

CREATE TABLE `role_menus` (
  `menu_model_id` bigint unsigned NOT NULL,
  `role_model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`menu_model_id`,`role_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `role_menus` WRITE;
/*!40000 ALTER TABLE `role_menus` DISABLE KEYS */;

INSERT INTO `role_menus` (`menu_model_id`, `role_model_id`)
VALUES
	(1,1),
	(2,1),
	(3,1),
	(4,1),
	(5,1),
	(6,1),
	(7,1),
	(8,1),
	(9,1),
	(10,1),
	(11,1),
	(12,1),
	(13,1),
	(14,1),
	(15,1);

/*!40000 ALTER TABLE `role_menus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sysTool_cron
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sysTool_cron`;

CREATE TABLE `sysTool_cron` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务名称',
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务方法',
  `expression` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '表达式',
  `strategy` enum('always','once') COLLATE utf8mb4_unicode_ci DEFAULT 'always' COMMENT '执行策略',
  `open` tinyint(1) DEFAULT NULL COMMENT '活跃状态',
  `extraParams` json DEFAULT NULL COMMENT '额外参数',
  `entryId` bigint DEFAULT NULL COMMENT 'cron ID',
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `idx_sysTool_cron_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


create table sys_dictionaries
(
    id         bigint unsigned auto_increment
        primary key,
    created_at datetime(3)  null,
    updated_at datetime(3)  null,
    deleted_at datetime(3)  null,
    name       varchar(191) null comment '字典名（中）',
    type       varchar(191) null comment '字典名（英）',
    status     tinyint(1)   null comment '状态',
    `desc`     varchar(191) null comment '描述'
);

create index idx_sys_dictionaries_deleted_at
    on sys_dictionaries (deleted_at);

INSERT INTO sys_dictionaries (id, created_at, updated_at, deleted_at, name, type, status, `desc`) VALUES (1, '2024-08-17 16:20:55.904', '2024-08-17 19:43:12.381', null, '性别', 'gender', 0, '性别字典');
INSERT INTO sys_dictionaries (id, created_at, updated_at, deleted_at, name, type, status, `desc`) VALUES (2, '2024-08-17 16:20:55.904', '2024-08-17 16:20:55.909', null, '数据库int类型', 'int', 1, 'int类型对应的数据库类型');
INSERT INTO sys_dictionaries (id, created_at, updated_at, deleted_at, name, type, status, `desc`) VALUES (3, '2024-08-17 16:20:55.904', '2024-08-17 16:20:55.912', null, '数据库时间日期类型', 'time.Time', 1, '数据库时间日期类型');
INSERT INTO sys_dictionaries (id, created_at, updated_at, deleted_at, name, type, status, `desc`) VALUES (4, '2024-08-17 16:20:55.904', '2024-08-17 16:20:55.914', null, '数据库浮点型', 'float64', 1, '数据库浮点型');
INSERT INTO sys_dictionaries (id, created_at, updated_at, deleted_at, name, type, status, `desc`) VALUES (5, '2024-08-17 16:20:55.904', '2024-08-17 16:20:55.917', null, '数据库字符串', 'string', 1, '数据库字符串');
INSERT INTO sys_dictionaries (id, created_at, updated_at, deleted_at, name, type, status, `desc`) VALUES (6, '2024-08-17 16:20:55.904', '2024-08-17 16:20:55.919', null, '数据库bool类型', 'bool', 1, '数据库bool类型');
INSERT INTO sys_dictionaries (id, created_at, updated_at, deleted_at, name, type, status, `desc`) VALUES (7, '2024-08-17 19:44:35.074', '2024-08-17 19:44:35.074', null, '测试字典', 'testzd', 1, '测试字典描述');




DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article`
(
    `id`         bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at` datetime     DEFAULT NULL,
    `updated_at` datetime     DEFAULT NULL,
    `deleted_at` datetime     DEFAULT NULL,
    `author`     varchar(64)  DEFAULT NULL COMMENT '作者',
    `content`    text COMMENT '内容',
    `id_channel` bigint(20)      NOT NULL COMMENT '栏目id',
    `img`        varchar(64)  DEFAULT NULL COMMENT '文章题图ID',
    `title`      varchar(128) DEFAULT NULL COMMENT '标题',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 16
  DEFAULT CHARSET = utf8 COMMENT ='文章';


INSERT INTO `cms_article`
VALUES ('1', '2019-03-09 16:24:58', '2019-05-10 13:22:49', null, 'enilu',
        '<div id=\"articleContent\" class=\"content\">\n<div class=\"ad-wrap\">\n<p style=\"margin: 0 0 10px 0;\">一般我们都有这样的需求：我需要知道库中的数据是由谁创建，什么时候创建，最后一次修改时间是什么时候，最后一次修改人是谁。web-flash最新代码已经实现该需求，具体实现方式网上有很多资料，这里做会搬运工，将web-flash的实现步骤罗列如下：%%</p>\n</div>\n<p>在Spring jpa中可以通过在实体bean的属性或者方法上添加以下注解来实现上述需求@CreatedDate、@CreatedBy、@LastModifiedDate、@LastModifiedBy。</p>\n<ul class=\" list-paddingleft-2\">\n<li>\n<p>@CreatedDate 表示该字段为创建时间时间字段，在这个实体被insert的时候，会设置值</p>\n</li>\n<li>\n<p>@CreatedBy 表示该字段为创建人，在这个实体被insert的时候，会设置值</p>\n</li>\n<li>\n<p>@LastModifiedDate 最后修改时间 实体被update的时候会设置</p>\n</li>\n<li>\n<p>@LastModifiedBy 最后修改人 实体被update的时候会设置</p>\n</li>\n</ul>\n<h2>使用方式</h2>\n<h3>实体类添加注解</h3>\n<ul class=\" list-paddingleft-2\">\n<li>\n<p>首先在实体中对应的字段加上上述4个注解</p>\n</li>\n<li>\n<p>在web-flash中我们提取了一个基础实体类BaseEntity，并将对应的字段添加上述4个注解,所有需要记录维护信息的表对应的实体都集成该类</p>\n</li>\n</ul>\n<pre>import&nbsp;org.springframework.data.annotation.CreatedBy;\nimport&nbsp;org.springframework.data.annotation.CreatedDate;\nimport&nbsp;org.springframework.data.annotation.LastModifiedBy;\nimport&nbsp;org.springframework.data.annotation.LastModifiedDate;\nimport&nbsp;javax.persistence.Column;\nimport&nbsp;javax.persistence.GeneratedValue;\nimport&nbsp;javax.persistence.Id;\nimport&nbsp;javax.persistence.MappedSuperclass;\nimport&nbsp;java.io.Serializable;\nimport&nbsp;java.util.Date;\n@MappedSuperclass\n@Data\npublic&nbsp;abstract&nbsp;class&nbsp;BaseEntity&nbsp;implements&nbsp;Serializable&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;@Id\n&nbsp;&nbsp;&nbsp;&nbsp;@GeneratedValue\n&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;Long&nbsp;id;\n&nbsp;&nbsp;&nbsp;&nbsp;@CreatedDate\n&nbsp;&nbsp;&nbsp;&nbsp;@Column(name&nbsp;=&nbsp;\"create_time\",columnDefinition=\"DATETIME&nbsp;COMMENT&nbsp;\'创建时间/注册时间\'\")\n&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;Date&nbsp;createTime;\n&nbsp;&nbsp;&nbsp;&nbsp;@Column(name&nbsp;=&nbsp;\"create_by\",columnDefinition=\"bigint&nbsp;COMMENT&nbsp;\'创建人\'\")\n&nbsp;&nbsp;&nbsp;&nbsp;@CreatedBy\n&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;Long&nbsp;createBy;\n&nbsp;&nbsp;&nbsp;&nbsp;@LastModifiedDate\n&nbsp;&nbsp;&nbsp;&nbsp;@Column(name&nbsp;=&nbsp;\"modify_time\",columnDefinition=\"DATETIME&nbsp;COMMENT&nbsp;\'最后更新时间\'\")\n&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;Date&nbsp;modifyTime;\n&nbsp;&nbsp;&nbsp;&nbsp;@LastModifiedBy\n&nbsp;&nbsp;&nbsp;&nbsp;@Column(name&nbsp;=&nbsp;\"modify_by\",columnDefinition=\"bigint&nbsp;COMMENT&nbsp;\'最后更新人\'\")\n&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;Long&nbsp;modifyBy;\n}</pre>\n<h3>实现AuditorAware接口返回操作人员的id</h3>\n<p>配置完上述4个注解后，在jpa.save方法被调用的时候，时间字段会自动设置并插入数据库，但是CreatedBy和LastModifiedBy并没有赋值 这两个信息需要实现AuditorAware接口来返回操作人员的id</p>\n<ul class=\" list-paddingleft-2\">\n<li>\n<p>首先需要在项目启动类添加@EnableJpaAuditing 注解来启用审计功能</p>\n</li>\n</ul>\n<pre>@SpringBootApplication\n@EnableJpaAuditing\npublic&nbsp;class&nbsp;AdminApplication&nbsp;extends&nbsp;WebMvcConfigurerAdapter&nbsp;{\n&nbsp;//省略\n}</pre>\n<ul class=\" list-paddingleft-2\">\n<li>\n<p>然后实现AuditorAware接口返回操作人员的id</p>\n</li>\n</ul>\n<pre>@Configuration\npublic&nbsp;class&nbsp;UserIDAuditorConfig&nbsp;implements&nbsp;AuditorAware&lt;Long&gt;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;@Override\n&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;Long&nbsp;getCurrentAuditor()&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ShiroUser&nbsp;shiroUser&nbsp;=&nbsp;ShiroKit.getUser();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(shiroUser!=null){\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;shiroUser.getId();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;null;\n&nbsp;&nbsp;&nbsp;&nbsp;}\n}</pre>\n</div>',
        '1', '1', 'web-flash 将所有表增加维护人员和维护时间信息');
INSERT INTO `cms_article`
VALUES ('2', '2019-03-09 16:24:58', '2019-03-23 23:12:16', null, 'enilu.cn',
        '<div id=\"articleContent\" class=\"content\">\n<div class=\"ad-wrap\">\n<p style=\"margin: 0 0 10px 0;\"><a style=\"color: #a00; font-weight: bold;\" href=\"https://my.oschina.net/u/3985214/blog/3018099?tdsourcetag=s_pcqq_aiomsg\" target=\"_blank\" rel=\"noopener\" data-traceid=\"news_detail_above_text_link_1\" data-tracepid=\"news_detail_above_text_link\">开发十年，就只剩下这套架构体系了！ &gt;&gt;&gt;</a>&nbsp;&nbsp;<img style=\"max-height: 32px; max-width: 32px;\" src=\"https://www.oschina.net/img/hot3.png\" align=\"\" /></p>\n</div>\n<h3>国际化</h3>\n<ul class=\" list-paddingleft-2\">\n<li>\n<p>web-flash实现国际化了.</p>\n</li>\n<li>\n<p>不了解上面两个的区别的同学可以再回顾下这个<a href=\"http://www.enilu.cn/web-flash/base/web-flash.html\">文档</a></p>\n</li>\n<li>\n<p>web-flash实现国际化的方式参考vue-element-admin的&nbsp;<a href=\"https://panjiachen.github.io/vue-element-admin-site/zh/guide/advanced/i18n.html\" target=\"_blank\" rel=\"noopener\">官方文档</a>,这里不再赘述,强烈建议你先把文档读了之后再看下面的内容。</p>\n</li>\n</ul>\n<h3>默认约定</h3>\n<p>针对网站资源进行国际园涉及到的国际化资源的管理维护，这里给出一些web-flash的资源分类建议，当然，你也可以根据你的实际情况进行调整。</p>\n<ul class=\" list-paddingleft-2\">\n<li>\n<p>src/lang/为国际化资源目录,目前提供了英文（en.js）和中文(zh.js)的两种语言实现。</p>\n</li>\n<li>\n<p>目前资源语言资源文件中是json配置主要有以下几个节点：</p>\n</li>\n<ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\">\n<li>\n<p>route 左侧菜单资源</p>\n</li>\n<li>\n<p>navbar 顶部导航栏资源</p>\n</li>\n<li>\n<p>button 公共的按钮资源，比如：添加、删除、修改、确定、取消之类等等</p>\n</li>\n<li>\n<p>common 其他公共的资源，比如一些弹出框标题、提示信息、label等等</p>\n</li>\n<li>\n<p>login 登录页面资源</p>\n</li>\n<li>\n<p>config 参数管理界面资源</p>\n</li>\n</ul>\n<li>\n<p>目前针对具体的页面资源只做了登录和参数管理两个页面，其他具体业务界面仅针对公共的按钮做了国际化，你可以参考config页面资源进行配置进行进一步配置：/src/views/cfg/</p>\n</li>\n<li>\n<p>如果你有其他资源在上面对应的节点添加即可，针对每个页面特有的资源以页面名称作为几点进行维护，这样方便记忆和维护，不容易出错。</p>\n</li>\n</ul>\n<h3>添加新的语言支持</h3>\n<p>如果英文和中文两种语言不够，那么你可以通过下面步骤添加语言支持</p>\n<ul class=\" list-paddingleft-2\">\n<li>\n<p>在src/lang/目录下新增对应的资源文件</p>\n</li>\n<li>\n<p>在src/lang/index.js中import对应的资源文件</p>\n</li>\n<li>\n<p>在src/lang/index.js中的messages变量中加入新的语言声明</p>\n</li>\n<li>\n<p>在src/components/LangSelect/index.vue的语言下拉框中增加新的语言选项</p>\n</li>\n</ul>\n<h3>演示地址</h3>\n<ul class=\" list-paddingleft-2\">\n<li>\n<p>vue版本后台管理&nbsp;<a href=\"http://106.75.35.53:8082/vue/#/login\" target=\"_blank\" rel=\"noopener\">http://106.75.35.53:8082/vue/#/login</a></p>\n</li>\n<li>CMS内容管理系统的h5前端demo:<a href=\"http://106.75.35.53:8082/mobile/#/index\" target=\"_blank\" rel=\"noopener\">http://106.75.35.53:8082/mobile/#/index</a></li>\n</ul>\n</div>',
        '1', '2', 'web-flash1.0.1 发布，增加国际化和定时任务管理功能');
INSERT INTO `cms_article`
VALUES ('3', '2019-03-09 16:24:58', '2019-04-28 17:39:52', null, 'enilu.cn',
        '<div class=\"content\" id=\"articleContent\">\r\n                        <div class=\"ad-wrap\">\r\n                                                    <p style=\"margin:0 0 10px 0;\"><a data-traceid=\"news_detail_above_text_link_1\" data-tracepid=\"news_detail_above_text_link\" style=\"color:#A00;font-weight:bold;\" href=\"https://my.oschina.net/u/3985214/blog/3018099?tdsourcetag=s_pcqq_aiomsg\" target=\"_blank\">开发十年，就只剩下这套架构体系了！ &gt;&gt;&gt;</a>&nbsp;&nbsp;<img src=\"https://www.oschina.net/img/hot3.png\" align=\"\" style=\"max-height: 32px; max-width: 32px;\"></p>\r\n                                    </div>\r\n                        <p>web-flash使用的Spring Boot从1.5.1升级到2.1.1</p><p>下面为升级过程</p><ul class=\" list-paddingleft-2\"><li><p>版本升级</p><pre>&lt;spring.boot.version&gt;2.1.1.RELEASE&lt;/spring.boot.version&gt;\r\n&lt;springframework.version&gt;5.1.3.RELEASE&lt;springframework.version&gt;</pre></li><li><p>配置增加</p><pre>spring.main.allow-bean-definition-overriding=true\r\nspring.jpa.hibernate.use-new-id-generator-mappings=false</pre></li></ul><ul class=\" list-paddingleft-2\"><li><p>审计功能调整，调整后代码:</p><pre>@Configuration\r\npublic&nbsp;class&nbsp;UserIDAuditorConfig&nbsp;implements&nbsp;AuditorAware&lt;Long&gt;&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;@Override\r\n&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;Optional&lt;Long&gt;&nbsp;getCurrentAuditor()&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ShiroUser&nbsp;shiroUser&nbsp;=&nbsp;ShiroKit.getUser();\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(shiroUser!=null){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;Optional.of(shiroUser.getId());\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;null;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n}</pre></li><li><p>repository调整</p></li><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>之前的 delete(Long id)方法没有了，替换为：deleteById(Long id)</p></li><li><p>之前的 T findOne(Long id)方法没有了，替换为：		</p><pre>Optional&lt;T&gt;&nbsp;optional&nbsp;=&nbsp;***Repository.findById(id);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(optional.isPresent())&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;optional.get();\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;null;</pre></li></ul><li><p>随着这次Spring Boot的升级也顺便做了一些其他内容的调整和重构</p></li><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>springframework也从4.3.5.RELEASE升级到5.1.3.RELEASE</p></li><li><p>为减小复杂度service去掉接口和实现类的结构，基础功能的service直接使用实现类；当然具体业务中如果有需求你也可以这没用</p></li><li><p>去掉了一些暂时用不到的maven依赖</p></li><li><p>完善了基础功能的审计功能(之前有介绍审计功能的实现翻番，后续会专门发一篇文档来说明审计功能在系统总的具体用法，当然聪明的你看代码就知道了)</p></li></ul></ul>\r\n                    </div>',
        '1', '1', 'web-flash 升级 Spring Boot 到 2.1.1 版本');
INSERT INTO `cms_article`
VALUES ('4', '2019-03-09 16:24:58', '2019-04-28 00:34:21', null, 'enilu.cn', 'H5通用官网系统', '2', '17',
        'H5通用官网系统');
INSERT INTO `cms_article`
VALUES ('5', '2019-03-09 16:24:58', '2019-04-28 00:34:36', null, 'enilu.cn', 'H5通用论坛系统', '2', '18',
        'H5通用论坛系统');
INSERT INTO `cms_article`
VALUES ('6', '2019-03-09 16:24:58', '2019-04-28 00:38:33', null, 'enilu.cn', '官网建设方案', '3', '19', '官网建设方案');
INSERT INTO `cms_article`
VALUES ('7', '2019-03-09 16:24:58', '2019-04-28 00:39:48', null, 'enilu.cn', '论坛建设方案', '3', '22', '论坛建设方案');
INSERT INTO `cms_article`
VALUES ('8', '2019-03-09 16:24:58', '2019-04-28 17:39:52', null, 'enilu.cn', '案例1', '4', '3', '案例1');
INSERT INTO `cms_article`
VALUES ('9', '2019-03-09 16:24:58', '2019-04-28 00:39:11', null, 'enilu.cn', '案例2', '4', '20', '案例2');
INSERT INTO `cms_article`
VALUES ('14', '2019-03-09 16:24:58', '2019-04-28 00:39:25', null, 'test5',
        '<p>aaaaa<img class=\"wscnph\" src=\"http://127.0.0.1:8082/file/download?idFile=12\" /></p>', '4', '21',
        'IDEA的代码生成插件发布啦');
INSERT INTO `cms_article`
VALUES ('15', '2019-04-28 17:39:52', '2019-05-05 15:36:57', null, 'enilu',
        '<p><img class=\"wscnph\" src=\"http://127.0.0.1:8082/file/download?idFile=24\" /></p>', '1', '25',
        '程序员头冷');


DROP TABLE IF EXISTS `cms_banner`;
CREATE TABLE `cms_banner` (
                              `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                              `created_at` datetime DEFAULT NULL,
                              `updated_at` datetime DEFAULT NULL,
                              `deleted_at` datetime DEFAULT NULL,
                              `file_name` varchar(32) DEFAULT NULL COMMENT 'banner图id',
                              `title` varchar(64) DEFAULT NULL COMMENT '标题',
                              `type` varchar(32) DEFAULT NULL COMMENT '类型',
                              `url` varchar(128) DEFAULT NULL COMMENT '点击banner跳转到url',
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='Banner';




INSERT INTO `cms_banner` VALUES ('1', '2019-03-09 16:29:03', null, null, 'gongxiaoshe.jpg', '不打开链接', 'index', 'javascript:');
INSERT INTO `cms_banner` VALUES ('2', '2019-03-09 16:29:03', null, null, 'gongxiaoshe.jpg', '打打开站内链接', 'index', '/contact');
INSERT INTO `cms_banner` VALUES ('3', '2019-03-09 16:29:03', null, null, 'gongxiaoshe.jpg', '打开外部链接', 'index', 'http://www.baidu.com');
INSERT INTO `cms_banner` VALUES ('4', '2019-03-09 16:29:03', null, null, 'gongxiaoshe.jpg', '不打开链接', 'product', 'javascript:');
INSERT INTO `cms_banner` VALUES ('5', '2019-03-09 16:29:03', null, null, 'gongxiaoshe.jpg', '打打开站内链接', 'product', '/contact');
INSERT INTO `cms_banner` VALUES ('6', '2019-03-09 16:29:03', null, null, 'gongxiaoshe.jpg', '打开外部链接', 'product', 'http://www.baidu.com');
INSERT INTO `cms_banner` VALUES ('7', '2019-03-09 16:29:03', null, null, 'gongxiaoshe.jpg', '不打开链接', 'solution', 'javascript:');
INSERT INTO `cms_banner` VALUES ('8', '2019-03-09 16:29:03', null, null, 'gongxiaoshe.jpg', '打打开站内链接', 'solution', '/contact');
INSERT INTO `cms_banner` VALUES ('9', '2019-03-09 16:29:03', null, null, 'gongxiaoshe.jpg', '打开外部链接', 'solution', 'http://www.baidu.com');
INSERT INTO `cms_banner` VALUES ('10', '2019-03-09 16:29:03',null, null, 'gongxiaoshe.jpg', '不打开链接', 'case', 'javascript:');
INSERT INTO `cms_banner` VALUES ('11', '2019-03-09 16:29:03',null, null, 'gongxiaoshe.jpg', '打打开站内链接', 'case', '/contact');
INSERT INTO `cms_banner` VALUES ('12', '2019-03-09 16:29:03', null,null, 'gongxiaoshe.jpg', '打开外部链接', 'case', 'http://www.baidu.com');
INSERT INTO `cms_banner` VALUES ('14', '2019-03-09 16:29:03', null,null, 'gongxiaoshe.jpg', '不打开链接', 'news', 'javascript:');
INSERT INTO `cms_banner` VALUES ('15', '2019-03-09 16:29:03', null,null, 'gongxiaoshe.jpg', '打打开站内链接', 'news', '/contact');
INSERT INTO `cms_banner` VALUES ('16',  '2019-03-09 16:29:03',null,null, 'gongxiaoshe.jpg', '打开外部链接', 'news', 'http://www.baidu.com');


DROP TABLE IF EXISTS `cms_channel`;
CREATE TABLE `cms_channel` (
                               `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                               `created_at` datetime DEFAULT NULL,
                               `updated_at` datetime DEFAULT NULL,
                               `deleted_at` datetime DEFAULT NULL,
                               `code` varchar(64) DEFAULT NULL COMMENT '编码',
                               `name` varchar(64) DEFAULT NULL COMMENT '名称',
                               PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='文章栏目';


INSERT INTO `cms_channel` VALUES ('1', null, null, null,  'news', '动态资讯');
INSERT INTO `cms_channel` VALUES ('2', null, null, null,  'product', '产品服务');
INSERT INTO `cms_channel` VALUES ('3', null, null, null,  'solution', '解决方案');
INSERT INTO `cms_channel` VALUES ('4', null, null, null,  'case', '精选案例');



DROP TABLE IF EXISTS `cms_contacts`;
CREATE TABLE `cms_contacts` (
                                `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                `created_at` datetime DEFAULT NULL,
                                `updated_at` datetime DEFAULT NULL,
                                `deleted_at` datetime DEFAULT NULL,
                                `email` varchar(32) DEFAULT NULL COMMENT '电子邮箱',
                                `mobile` varchar(64) DEFAULT NULL COMMENT '联系电话',
                                `remark` varchar(128) DEFAULT NULL COMMENT '备注',
                                `user_name` varchar(64) DEFAULT NULL COMMENT '邀约人名称',
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='邀约信息';


INSERT INTO `cms_contacts` VALUES ('1', null, null, null,  'test@qq.com', '15011111111', '测试联系，哈哈哈', '张三');



DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
                           `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                           `created_at` datetime DEFAULT NULL,
                           `updated_at` datetime DEFAULT NULL,
                           `deleted_at` datetime DEFAULT NULL,
                           `content` text COMMENT '消息内容',
                           `receiver` varchar(64) DEFAULT NULL COMMENT '接收者',
                           `state` varchar(32) DEFAULT NULL COMMENT '消息类型,0:初始,1:成功,2:失败',
                           `tpl_code` varchar(32) DEFAULT NULL COMMENT '模板编码',
                           `type` varchar(32) DEFAULT NULL COMMENT '消息类型,0:短信,1:邮件',
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='历史消息';



INSERT INTO `message` VALUES ('1', null,  null, null, '【腾讯云】校验码1032，请于5分钟内完成验证，如非本人操作请忽略本短信。', '15011112222', '2', 'REGISTER_CODE', '0');


DROP TABLE IF EXISTS `message_sender`;
CREATE TABLE `message_sender` (
                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                  `created_at` datetime DEFAULT NULL,
                                  `updated_at` datetime DEFAULT NULL,
                                  `deleted_at` datetime DEFAULT NULL,
                                  `class_name` varchar(64) DEFAULT NULL COMMENT '发送类',
                                  `name` varchar(64) DEFAULT NULL COMMENT '名称',
                                  `tpl_code` varchar(64) DEFAULT NULL COMMENT '短信运营商模板编号',
                                  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='消息发送者';


INSERT INTO `message_sender` VALUES ('1', null, null, null, 'tencentSmsSender', ' 腾讯短信服务', null);
INSERT INTO `message_sender` VALUES ('2', null, null, null, 'defaultEmailSender', '默认邮件发送器', null);


DROP TABLE IF EXISTS `message_template`;
CREATE TABLE `message_template` (
                                    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                    `created_at` datetime DEFAULT NULL,
                                    `updated_at` datetime DEFAULT NULL,
                                    `deleted_at` datetime DEFAULT NULL,
                                    `code` varchar(32) DEFAULT NULL COMMENT '编号',
                                    `cond` varchar(32) DEFAULT NULL COMMENT '发送条件',
                                    `content` text COMMENT '内容',
                                    `id_message_sender` bigint(20) NOT NULL COMMENT '发送者id',
                                    `title` varchar(64) DEFAULT NULL COMMENT '标题',
                                    `type` varchar(32) DEFAULT NULL COMMENT '消息类型,0:短信,1:邮件',
                                    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='消息模板';



INSERT INTO `message_template` VALUES ('1', null, null, null,  'REGISTER_CODE', '注册页面，点击获取验证码', '【腾讯云】校验码{1}，请于5分钟内完成验证，如非本人操作请忽略本短信。', '1', '注册验证码', '0');
INSERT INTO `message_template` VALUES ('2', null, null, null,  'EMAIL_TEST', '测试发送', '你好:{1},欢迎使用{2}', '2', '测试邮件', '1');
INSERT INTO `message_template` VALUES ('3', null, null, null,  'EMAIL_HTML_TEMPLATE_TEST', '测试发送模板邮件', '你好<strong>${userName}</strong>欢迎使用<font color=\"red\">${appName}</font>,这是html模板邮件', '2', '测试发送模板邮件', '1');

