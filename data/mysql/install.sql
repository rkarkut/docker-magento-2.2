# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.20)
# Database: magento
# Generation Time: 2017-11-03 18:26:45 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin_passwords
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_passwords`;

CREATE TABLE `admin_passwords` (
  `password_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Password Id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User Id',
  `password_hash` varchar(100) DEFAULT NULL COMMENT 'Password Hash',
  `expires` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Deprecated',
  `last_updated` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Last Updated',
  PRIMARY KEY (`password_id`),
  KEY `ADMIN_PASSWORDS_USER_ID` (`user_id`),
  CONSTRAINT `ADMIN_PASSWORDS_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin Passwords';

LOCK TABLES `admin_passwords` WRITE;
/*!40000 ALTER TABLE `admin_passwords` DISABLE KEYS */;

INSERT INTO `admin_passwords` (`password_id`, `user_id`, `password_hash`, `expires`, `last_updated`)
VALUES
	(1,1,'fdac8d5af8b7103cfa5e070ffb87deb5d091ac9e1a4e0298bb28c8942a50379f:yodqfVrOxlR6FPWWA4GlbQUuJOlBi7mj:1',0,1509731873);

/*!40000 ALTER TABLE `admin_passwords` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_system_messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_system_messages`;

CREATE TABLE `admin_system_messages` (
  `identity` varchar(100) NOT NULL COMMENT 'Message id',
  `severity` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create date',
  PRIMARY KEY (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin System Messages';

LOCK TABLES `admin_system_messages` WRITE;
/*!40000 ALTER TABLE `admin_system_messages` DISABLE KEYS */;

INSERT INTO `admin_system_messages` (`identity`, `severity`, `created_at`)
VALUES
	('da332d712f3215b9b94bfa268c398323',2,'2017-11-03 18:20:01');

/*!40000 ALTER TABLE `admin_system_messages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_user`;

CREATE TABLE `admin_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'User ID',
  `firstname` varchar(32) DEFAULT NULL COMMENT 'User First Name',
  `lastname` varchar(32) DEFAULT NULL COMMENT 'User Last Name',
  `email` varchar(128) DEFAULT NULL COMMENT 'User Email',
  `username` varchar(40) DEFAULT NULL COMMENT 'User Login',
  `password` varchar(255) NOT NULL COMMENT 'User Password',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'User Created Time',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'User Modified Time',
  `logdate` timestamp NULL DEFAULT NULL COMMENT 'User Last Login Time',
  `lognum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'User Login Number',
  `reload_acl_flag` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Reload ACL',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'User Is Active',
  `extra` text COMMENT 'User Extra Data',
  `rp_token` text COMMENT 'Reset Password Link Token',
  `rp_token_created_at` timestamp NULL DEFAULT NULL COMMENT 'Reset Password Link Token Creation Date',
  `interface_locale` varchar(16) NOT NULL DEFAULT 'en_US' COMMENT 'Backend interface locale',
  `failures_num` smallint(6) DEFAULT '0' COMMENT 'Failure Number',
  `first_failure` timestamp NULL DEFAULT NULL COMMENT 'First Failure',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Expiration Lock Dates',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ADMIN_USER_USERNAME` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin User Table';

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;

INSERT INTO `admin_user` (`user_id`, `firstname`, `lastname`, `email`, `username`, `password`, `created`, `modified`, `logdate`, `lognum`, `reload_acl_flag`, `is_active`, `extra`, `rp_token`, `rp_token_created_at`, `interface_locale`, `failures_num`, `first_failure`, `lock_expires`)
VALUES
	(1,'admin','admin','admin@example.com','admin','fdac8d5af8b7103cfa5e070ffb87deb5d091ac9e1a4e0298bb28c8942a50379f:yodqfVrOxlR6FPWWA4GlbQUuJOlBi7mj:1','2017-11-03 17:57:53','2017-11-03 18:19:56','2017-11-03 18:19:56',1,0,1,NULL,NULL,NULL,'en_US',0,NULL,NULL);

/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_user_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_user_session`;

CREATE TABLE `admin_user_session` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `session_id` varchar(128) NOT NULL COMMENT 'Session id value',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'Admin User ID',
  `status` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Current Session status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `ip` varchar(15) NOT NULL COMMENT 'Remote user IP',
  PRIMARY KEY (`id`),
  KEY `ADMIN_USER_SESSION_SESSION_ID` (`session_id`),
  KEY `ADMIN_USER_SESSION_USER_ID` (`user_id`),
  CONSTRAINT `ADMIN_USER_SESSION_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin User sessions table';

LOCK TABLES `admin_user_session` WRITE;
/*!40000 ALTER TABLE `admin_user_session` DISABLE KEYS */;

INSERT INTO `admin_user_session` (`id`, `session_id`, `user_id`, `status`, `created_at`, `updated_at`, `ip`)
VALUES
	(1,'9e8ab0881ce34fc25b139513d756e649',1,1,'2017-11-03 18:19:56','2017-11-03 18:26:12','172.24.0.1');

/*!40000 ALTER TABLE `admin_user_session` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table adminnotification_inbox
# ------------------------------------------------------------

DROP TABLE IF EXISTS `adminnotification_inbox`;

CREATE TABLE `adminnotification_inbox` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Notification id',
  `severity` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create date',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `description` text COMMENT 'Description',
  `url` varchar(255) DEFAULT NULL COMMENT 'Url',
  `is_read` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification read',
  `is_remove` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification might be removed',
  PRIMARY KEY (`notification_id`),
  KEY `ADMINNOTIFICATION_INBOX_SEVERITY` (`severity`),
  KEY `ADMINNOTIFICATION_INBOX_IS_READ` (`is_read`),
  KEY `ADMINNOTIFICATION_INBOX_IS_REMOVE` (`is_remove`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adminnotification Inbox';



# Dump of table authorization_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `authorization_role`;

CREATE TABLE `authorization_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Role ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Role ID',
  `tree_level` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Role Tree Level',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Role Sort Order',
  `role_type` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Role Type',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User ID',
  `user_type` varchar(16) DEFAULT NULL COMMENT 'User Type',
  `role_name` varchar(50) DEFAULT NULL COMMENT 'Role Name',
  PRIMARY KEY (`role_id`),
  KEY `AUTHORIZATION_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  KEY `AUTHORIZATION_ROLE_TREE_LEVEL` (`tree_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin Role Table';

LOCK TABLES `authorization_role` WRITE;
/*!40000 ALTER TABLE `authorization_role` DISABLE KEYS */;

INSERT INTO `authorization_role` (`role_id`, `parent_id`, `tree_level`, `sort_order`, `role_type`, `user_id`, `user_type`, `role_name`)
VALUES
	(1,0,1,1,'G',0,'2','Administrators'),
	(2,1,2,0,'U',1,'2','admin');

/*!40000 ALTER TABLE `authorization_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table authorization_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `authorization_rule`;

CREATE TABLE `authorization_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule ID',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Role ID',
  `resource_id` varchar(255) DEFAULT NULL COMMENT 'Resource ID',
  `privileges` varchar(20) DEFAULT NULL COMMENT 'Privileges',
  `permission` varchar(10) DEFAULT NULL COMMENT 'Permission',
  PRIMARY KEY (`rule_id`),
  KEY `AUTHORIZATION_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  KEY `AUTHORIZATION_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`),
  CONSTRAINT `AUTHORIZATION_RULE_ROLE_ID_AUTHORIZATION_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `authorization_role` (`role_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin Rule Table';

LOCK TABLES `authorization_rule` WRITE;
/*!40000 ALTER TABLE `authorization_rule` DISABLE KEYS */;

INSERT INTO `authorization_rule` (`rule_id`, `role_id`, `resource_id`, `privileges`, `permission`)
VALUES
	(1,1,'Magento_Backend::all',NULL,'allow');

/*!40000 ALTER TABLE `authorization_rule` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache`;

CREATE TABLE `cache` (
  `id` varchar(200) NOT NULL COMMENT 'Cache Id',
  `data` mediumblob COMMENT 'Cache Data',
  `create_time` int(11) DEFAULT NULL COMMENT 'Cache Creation Time',
  `update_time` int(11) DEFAULT NULL COMMENT 'Time of Cache Updating',
  `expire_time` int(11) DEFAULT NULL COMMENT 'Cache Expiration Time',
  PRIMARY KEY (`id`),
  KEY `CACHE_EXPIRE_TIME` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches';



# Dump of table cache_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_tag`;

CREATE TABLE `cache_tag` (
  `tag` varchar(100) NOT NULL COMMENT 'Tag',
  `cache_id` varchar(200) NOT NULL COMMENT 'Cache Id',
  PRIMARY KEY (`tag`,`cache_id`),
  KEY `CACHE_TAG_CACHE_ID` (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Caches';



# Dump of table captcha_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `captcha_log`;

CREATE TABLE `captcha_log` (
  `type` varchar(32) NOT NULL COMMENT 'Type',
  `value` varchar(32) NOT NULL COMMENT 'Value',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Count',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Count Login Attempts';



# Dump of table catalog_category_entity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_category_entity`;

CREATE TABLE `catalog_category_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attriute Set ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Category ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `path` varchar(255) NOT NULL COMMENT 'Tree Path',
  `position` int(11) NOT NULL COMMENT 'Position',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT 'Tree Level',
  `children_count` int(11) NOT NULL COMMENT 'Child Count',
  PRIMARY KEY (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_LEVEL` (`level`),
  KEY `CATALOG_CATEGORY_ENTITY_PATH` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Table';

LOCK TABLES `catalog_category_entity` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity` DISABLE KEYS */;

INSERT INTO `catalog_category_entity` (`entity_id`, `attribute_set_id`, `parent_id`, `created_at`, `updated_at`, `path`, `position`, `level`, `children_count`)
VALUES
	(1,3,0,'2017-11-03 17:57:40','2017-11-03 17:57:42','1',0,0,1),
	(2,3,1,'2017-11-03 17:57:42','2017-11-03 17:57:42','1/2',1,1,0);

/*!40000 ALTER TABLE `catalog_category_entity` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table catalog_category_entity_datetime
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_category_entity_datetime`;

CREATE TABLE `catalog_category_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_DTIME_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Datetime Attribute Backend Table';



# Dump of table catalog_category_entity_decimal
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_category_entity_decimal`;

CREATE TABLE `catalog_category_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_DEC_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Decimal Attribute Backend Table';



# Dump of table catalog_category_entity_int
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_category_entity_int`;

CREATE TABLE `catalog_category_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_INT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Integer Attribute Backend Table';

LOCK TABLES `catalog_category_entity_int` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_int` DISABLE KEYS */;

INSERT INTO `catalog_category_entity_int` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`)
VALUES
	(1,69,0,1,1),
	(2,46,0,2,1),
	(3,69,0,2,1);

/*!40000 ALTER TABLE `catalog_category_entity_int` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table catalog_category_entity_text
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_category_entity_text`;

CREATE TABLE `catalog_category_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_TEXT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Text Attribute Backend Table';



# Dump of table catalog_category_entity_varchar
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_category_entity_varchar`;

CREATE TABLE `catalog_category_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_VCHR_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Varchar Attribute Backend Table';

LOCK TABLES `catalog_category_entity_varchar` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_varchar` DISABLE KEYS */;

INSERT INTO `catalog_category_entity_varchar` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`)
VALUES
	(1,45,0,1,'Root Catalog'),
	(2,45,0,2,'Default Category'),
	(3,52,0,2,'PRODUCTS');

/*!40000 ALTER TABLE `catalog_category_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table catalog_category_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_category_product`;

CREATE TABLE `catalog_category_product` (
  `entity_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`entity_id`,`category_id`,`product_id`),
  UNIQUE KEY `CATALOG_CATEGORY_PRODUCT_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`),
  KEY `CATALOG_CATEGORY_PRODUCT_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CAT_CTGR_PRD_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_PRD_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Category Linkage Table';



# Dump of table catalog_category_product_index
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_category_product_index`;

CREATE TABLE `catalog_category_product_index` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `CAT_CTGR_PRD_IDX_STORE_ID_CTGR_ID_VISIBILITY_IS_PARENT_POSITION` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index';



# Dump of table catalog_category_product_index_replica
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_category_product_index_replica`;

CREATE TABLE `catalog_category_product_index_replica` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `CAT_CTGR_PRD_IDX_STORE_ID_CTGR_ID_VISIBILITY_IS_PARENT_POSITION` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index';



# Dump of table catalog_category_product_index_tmp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_category_product_index_tmp`;

CREATE TABLE `catalog_category_product_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Indexer temporary table';



# Dump of table catalog_compare_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_compare_item`;

CREATE TABLE `catalog_compare_item` (
  `catalog_compare_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Compare Item ID',
  `visitor_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Visitor ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  PRIMARY KEY (`catalog_compare_item_id`),
  KEY `CATALOG_COMPARE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `CATALOG_COMPARE_ITEM_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  KEY `CATALOG_COMPARE_ITEM_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `CATALOG_COMPARE_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_COMPARE_ITEM_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_COMPARE_ITEM_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_COMPARE_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Compare Table';



# Dump of table catalog_eav_attribute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_eav_attribute`;

CREATE TABLE `catalog_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `frontend_input_renderer` varchar(255) DEFAULT NULL COMMENT 'Frontend Input Renderer',
  `is_global` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Global',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `is_searchable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Searchable',
  `is_filterable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable',
  `is_comparable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Comparable',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `is_html_allowed_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is HTML Allowed On Front',
  `is_used_for_price_rules` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Price Rules',
  `is_filterable_in_search` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable In Search',
  `used_in_product_listing` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used In Product Listing',
  `used_for_sort_by` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Sorting',
  `apply_to` varchar(255) DEFAULT NULL COMMENT 'Apply To',
  `is_visible_in_advanced_search` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible In Advanced Search',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_wysiwyg_enabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is WYSIWYG Enabled',
  `is_used_for_promo_rules` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Promo Rules',
  `is_required_in_admin_store` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Required In Admin Store',
  `is_used_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable in Grid',
  `search_weight` float NOT NULL DEFAULT '1' COMMENT 'Search Weight',
  `additional_data` text COMMENT 'Additional swatch attributes data',
  PRIMARY KEY (`attribute_id`),
  KEY `CATALOG_EAV_ATTRIBUTE_USED_FOR_SORT_BY` (`used_for_sort_by`),
  KEY `CATALOG_EAV_ATTRIBUTE_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`),
  CONSTRAINT `CATALOG_EAV_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog EAV Attribute Table';

LOCK TABLES `catalog_eav_attribute` WRITE;
/*!40000 ALTER TABLE `catalog_eav_attribute` DISABLE KEYS */;

INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`, `is_required_in_admin_store`, `is_used_in_grid`, `is_visible_in_grid`, `is_filterable_in_grid`, `search_weight`, `additional_data`)
VALUES
	(45,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(46,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(47,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,1,0,0,0,0,0,1,NULL),
	(48,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(49,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(50,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(51,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(52,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(53,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(54,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(55,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(56,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(57,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(58,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(59,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(60,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(61,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(62,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(63,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(64,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(65,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(66,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(67,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\Available',0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(68,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\DefaultSortby',0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(69,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(70,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(71,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(72,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Pricestep',0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(73,NULL,0,1,1,0,0,0,0,0,0,1,1,NULL,1,0,0,0,0,0,0,0,5,NULL),
	(74,NULL,1,1,1,0,1,0,0,0,0,0,0,NULL,1,0,0,0,0,0,0,0,6,NULL),
	(75,NULL,0,1,1,0,1,0,1,0,0,0,0,NULL,1,0,1,0,0,0,0,0,1,NULL),
	(76,NULL,0,1,1,0,1,0,1,0,0,1,0,NULL,1,0,1,0,0,1,0,0,1,NULL),
	(77,NULL,1,1,1,1,0,0,0,0,0,1,1,'simple,virtual,bundle,downloadable,configurable',1,0,0,0,0,0,0,0,1,NULL),
	(78,NULL,1,1,0,0,0,0,0,0,0,1,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,1,0,1,1,NULL),
	(79,NULL,2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,1,0,0,1,NULL),
	(80,NULL,2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,1,0,0,1,NULL),
	(81,NULL,1,1,0,0,0,0,0,0,0,0,0,'simple,virtual,downloadable',0,0,0,0,0,1,0,1,1,NULL),
	(82,'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Weight',1,1,0,0,0,0,0,0,0,0,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,1,0,1,1,NULL),
	(83,NULL,1,1,1,1,1,0,0,0,0,0,0,'simple',1,0,0,0,0,1,0,1,1,NULL),
	(84,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,NULL),
	(85,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,NULL),
	(86,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,NULL),
	(87,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(88,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(89,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(90,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(91,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(92,NULL,2,1,0,0,0,0,0,0,0,0,0,'simple,virtual,bundle,downloadable',0,0,0,0,0,0,0,0,1,NULL),
	(93,NULL,1,1,1,1,1,0,0,0,0,0,0,'simple,virtual,configurable',1,0,0,0,0,1,0,1,1,NULL),
	(94,NULL,2,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,1,0,0,1,NULL),
	(95,NULL,2,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,1,0,0,1,NULL),
	(96,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(97,'Magento\\Framework\\Data\\Form\\Element\\Hidden',2,1,1,0,0,0,0,0,0,1,0,NULL,0,0,0,0,1,0,0,0,1,NULL),
	(98,NULL,0,0,0,0,0,0,0,0,0,0,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,0,0,0,1,NULL),
	(99,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,1,0,0,0,1,NULL),
	(100,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,NULL),
	(101,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL),
	(102,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL),
	(103,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(104,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL),
	(105,'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Category',1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(106,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(107,NULL,1,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(108,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(109,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(110,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(111,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(112,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(113,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(114,NULL,2,1,0,0,0,0,0,0,0,0,0,'simple,bundle,grouped,configurable',0,0,0,0,0,1,0,1,1,NULL),
	(115,'Magento\\CatalogInventory\\Block\\Adminhtml\\Form\\Field\\Stock',1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(116,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL),
	(117,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(118,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(119,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,1,0,1,1,NULL),
	(120,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(121,'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type',1,1,0,0,0,0,0,0,0,1,0,'simple,virtual,downloadable,bundle,configurable',0,0,0,0,0,1,0,1,1,NULL),
	(122,'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type\\Price',2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,downloadable,bundle,configurable',0,0,0,0,0,0,0,0,1,NULL),
	(123,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,NULL),
	(124,NULL,1,1,0,0,0,0,0,0,0,0,0,'bundle',0,0,0,0,0,0,0,0,1,NULL),
	(125,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,NULL),
	(126,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,NULL),
	(127,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,NULL),
	(128,NULL,1,0,0,0,0,0,0,0,0,1,0,'downloadable',0,0,0,0,0,0,0,0,1,NULL),
	(129,NULL,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0,0,0,0,0,1,NULL),
	(130,NULL,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0,0,0,0,0,1,NULL),
	(131,NULL,1,0,0,0,0,0,0,0,0,1,0,'downloadable',0,0,0,0,0,0,0,0,1,NULL),
	(132,'Magento\\GiftMessage\\Block\\Adminhtml\\Product\\Helper\\Form\\Config',1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL),
	(133,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),
	(134,NULL,2,1,1,0,0,0,0,0,0,1,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,1,0,1,1,NULL);

/*!40000 ALTER TABLE `catalog_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table catalog_product_bundle_option
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_bundle_option`;

CREATE TABLE `catalog_product_bundle_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `required` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Required',
  `position` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `type` varchar(255) DEFAULT NULL COMMENT 'Type',
  PRIMARY KEY (`option_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_OPTION_PARENT_ID` (`parent_id`),
  CONSTRAINT `CAT_PRD_BNDL_OPT_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option';



# Dump of table catalog_product_bundle_option_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_bundle_option_value`;

CREATE TABLE `catalog_product_bundle_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option Id',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_BNDL_OPT_VAL_OPT_ID_PARENT_PRD_ID_STORE_ID` (`option_id`,`parent_product_id`,`store_id`),
  CONSTRAINT `CAT_PRD_BNDL_OPT_VAL_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option Value';



# Dump of table catalog_product_bundle_price_index
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_bundle_price_index`;

CREATE TABLE `catalog_product_bundle_price_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group Id',
  `min_price` decimal(12,4) NOT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) NOT NULL COMMENT 'Max Price',
  PRIMARY KEY (`entity_id`,`website_id`,`customer_group_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE_ID` (`website_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Price Index';



# Dump of table catalog_product_bundle_selection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_bundle_selection`;

CREATE TABLE `catalog_product_bundle_selection` (
  `selection_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Selection Id',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option Id',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `position` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_default` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  `selection_qty` decimal(12,4) DEFAULT NULL COMMENT 'Selection Qty',
  `selection_can_change_qty` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Selection Can Change Qty',
  PRIMARY KEY (`selection_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION_ID` (`option_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection';



# Dump of table catalog_product_bundle_selection_price
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_bundle_selection_price`;

CREATE TABLE `catalog_product_bundle_selection_price` (
  `selection_id` int(10) unsigned NOT NULL COMMENT 'Selection Id',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  PRIMARY KEY (`selection_id`,`parent_product_id`,`website_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DCF37523AA05D770A70AA4ED7C2616E4` FOREIGN KEY (`selection_id`) REFERENCES `catalog_product_bundle_selection` (`selection_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection Price';



# Dump of table catalog_product_bundle_stock_index
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_bundle_stock_index`;

CREATE TABLE `catalog_product_bundle_stock_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `stock_status` smallint(6) DEFAULT '0' COMMENT 'Stock Status',
  PRIMARY KEY (`entity_id`,`website_id`,`stock_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Stock Index';



# Dump of table catalog_product_entity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_entity`;

CREATE TABLE `catalog_product_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Type ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `has_options` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Has Options',
  `required_options` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Required Options',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  PRIMARY KEY (`entity_id`),
  KEY `CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `CATALOG_PRODUCT_ENTITY_SKU` (`sku`),
  CONSTRAINT `CAT_PRD_ENTT_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Table';



# Dump of table catalog_product_entity_datetime
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_entity_datetime`;

CREATE TABLE `catalog_product_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_DTIME_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Datetime Attribute Backend Table';



# Dump of table catalog_product_entity_decimal
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_entity_decimal`;

CREATE TABLE `catalog_product_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_DEC_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Decimal Attribute Backend Table';



# Dump of table catalog_product_entity_gallery
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_entity_gallery`;

CREATE TABLE `catalog_product_entity_gallery` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_GLR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Gallery Attribute Backend Table';



# Dump of table catalog_product_entity_int
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_entity_int`;

CREATE TABLE `catalog_product_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_INT_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_INT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Integer Attribute Backend Table';



# Dump of table catalog_product_entity_media_gallery
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery`;

CREATE TABLE `catalog_product_entity_media_gallery` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  `media_type` varchar(32) NOT NULL DEFAULT 'image' COMMENT 'Media entry type',
  `disabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Visibility status',
  PRIMARY KEY (`value_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Backend Table';



# Dump of table catalog_product_entity_media_gallery_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value`;

CREATE TABLE `catalog_product_entity_media_gallery_value` (
  `value_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Value ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `position` int(10) unsigned DEFAULT NULL COMMENT 'Position',
  `disabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Disabled',
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Record Id',
  PRIMARY KEY (`record_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_VALUE_ID` (`value_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_VAL_ID_CAT_PRD_ENTT_MDA_GLR_VAL_ID` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Value Table';



# Dump of table catalog_product_entity_media_gallery_value_to_entity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value_to_entity`;

CREATE TABLE `catalog_product_entity_media_gallery_value_to_entity` (
  `value_id` int(10) unsigned NOT NULL COMMENT 'Value media Entry ID',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Product entity ID',
  UNIQUE KEY `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_VAL_ID_ENTT_ID` (`value_id`,`entity_id`),
  KEY `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` (`entity_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A6C6C8FAA386736921D3A7C4B50B1185` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link Media value to Product entity table';



# Dump of table catalog_product_entity_media_gallery_value_video
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value_video`;

CREATE TABLE `catalog_product_entity_media_gallery_value_video` (
  `value_id` int(10) unsigned NOT NULL COMMENT 'Media Entity ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `provider` varchar(32) DEFAULT NULL COMMENT 'Video provider ID',
  `url` text COMMENT 'Video URL',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `description` text COMMENT 'Page Meta Description',
  `metadata` text COMMENT 'Video meta data',
  UNIQUE KEY `CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_VAL_ID_STORE_ID` (`value_id`,`store_id`),
  KEY `CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6FDF205946906B0E653E60AA769899F8` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Video Table';



# Dump of table catalog_product_entity_text
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_entity_text`;

CREATE TABLE `catalog_product_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_TEXT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Text Attribute Backend Table';



# Dump of table catalog_product_entity_tier_price
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_entity_tier_price`;

CREATE TABLE `catalog_product_entity_tier_price` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `all_groups` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'QTY',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `percentage_value` decimal(5,2) DEFAULT NULL COMMENT 'Percentage value',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_E8AB433B9ACB00343ABB312AD2FAB087` (`entity_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TIER_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Attribute Backend Table';



# Dump of table catalog_product_entity_varchar
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_entity_varchar`;

CREATE TABLE `catalog_product_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_VCHR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Varchar Attribute Backend Table';



# Dump of table catalog_product_frontend_action
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_frontend_action`;

CREATE TABLE `catalog_product_frontend_action` (
  `action_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Action Id',
  `type_id` varchar(64) NOT NULL COMMENT 'Type of product action',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `added_at` bigint(20) NOT NULL COMMENT 'Added At',
  PRIMARY KEY (`action_id`),
  UNIQUE KEY `CATALOG_PRODUCT_FRONTEND_ACTION_VISITOR_ID_PRODUCT_ID_TYPE_ID` (`visitor_id`,`product_id`,`type_id`),
  UNIQUE KEY `CATALOG_PRODUCT_FRONTEND_ACTION_CUSTOMER_ID_PRODUCT_ID_TYPE_ID` (`customer_id`,`product_id`,`type_id`),
  CONSTRAINT `CAT_PRD_FRONTEND_ACTION_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Frontend Action Table';



# Dump of table catalog_product_index_eav
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_eav`;

CREATE TABLE `catalog_product_index_eav` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Index Table';



# Dump of table catalog_product_index_eav_decimal
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal`;

CREATE TABLE `catalog_product_index_eav_decimal` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Index Table';



# Dump of table catalog_product_index_eav_decimal_idx
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_idx`;

CREATE TABLE `catalog_product_index_eav_decimal_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Index Table';



# Dump of table catalog_product_index_eav_decimal_replica
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_replica`;

CREATE TABLE `catalog_product_index_eav_decimal_replica` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Index Table';



# Dump of table catalog_product_index_eav_decimal_tmp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_tmp`;

CREATE TABLE `catalog_product_index_eav_decimal_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Temp Table';



# Dump of table catalog_product_index_eav_idx
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_eav_idx`;

CREATE TABLE `catalog_product_index_eav_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Index Table';



# Dump of table catalog_product_index_eav_replica
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_eav_replica`;

CREATE TABLE `catalog_product_index_eav_replica` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Index Table';



# Dump of table catalog_product_index_eav_tmp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_eav_tmp`;

CREATE TABLE `catalog_product_index_eav_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Temp Table';



# Dump of table catalog_product_index_price
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_price`;

CREATE TABLE `catalog_product_index_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Index Table';



# Dump of table catalog_product_index_price_bundle_idx
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_idx`;

CREATE TABLE `catalog_product_index_price_bundle_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class Id',
  `price_type` smallint(5) unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Idx';



# Dump of table catalog_product_index_price_bundle_opt_idx
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_opt_idx`;

CREATE TABLE `catalog_product_index_price_bundle_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Idx';



# Dump of table catalog_product_index_price_bundle_opt_tmp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_opt_tmp`;

CREATE TABLE `catalog_product_index_price_bundle_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Tmp';



# Dump of table catalog_product_index_price_bundle_sel_idx
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_sel_idx`;

CREATE TABLE `catalog_product_index_price_bundle_sel_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Idx';



# Dump of table catalog_product_index_price_bundle_sel_tmp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_sel_tmp`;

CREATE TABLE `catalog_product_index_price_bundle_sel_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Tmp';



# Dump of table catalog_product_index_price_bundle_tmp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_tmp`;

CREATE TABLE `catalog_product_index_price_bundle_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class Id',
  `price_type` smallint(5) unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Tmp';



# Dump of table catalog_product_index_price_cfg_opt_agr_idx
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_agr_idx`;

CREATE TABLE `catalog_product_index_price_cfg_opt_agr_idx` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Index Table';



# Dump of table catalog_product_index_price_cfg_opt_agr_tmp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_agr_tmp`;

CREATE TABLE `catalog_product_index_price_cfg_opt_agr_tmp` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Temp Table';



# Dump of table catalog_product_index_price_cfg_opt_idx
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_idx`;

CREATE TABLE `catalog_product_index_price_cfg_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Index Table';



# Dump of table catalog_product_index_price_cfg_opt_tmp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_tmp`;

CREATE TABLE `catalog_product_index_price_cfg_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Temp Table';



# Dump of table catalog_product_index_price_downlod_idx
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_price_downlod_idx`;

CREATE TABLE `catalog_product_index_price_downlod_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Indexer Table for price of downloadable products';



# Dump of table catalog_product_index_price_downlod_tmp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_price_downlod_tmp`;

CREATE TABLE `catalog_product_index_price_downlod_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Temporary Indexer Table for price of downloadable products';



# Dump of table catalog_product_index_price_final_idx
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_price_final_idx`;

CREATE TABLE `catalog_product_index_price_final_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Index Table';



# Dump of table catalog_product_index_price_final_tmp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_price_final_tmp`;

CREATE TABLE `catalog_product_index_price_final_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Temp Table';



# Dump of table catalog_product_index_price_idx
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_price_idx`;

CREATE TABLE `catalog_product_index_price_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_WEBSITE_ID` (`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_MIN_PRICE` (`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Index Table';



# Dump of table catalog_product_index_price_opt_agr_idx
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_price_opt_agr_idx`;

CREATE TABLE `catalog_product_index_price_opt_agr_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Index Table';



# Dump of table catalog_product_index_price_opt_agr_tmp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_price_opt_agr_tmp`;

CREATE TABLE `catalog_product_index_price_opt_agr_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Temp Table';



# Dump of table catalog_product_index_price_opt_idx
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_price_opt_idx`;

CREATE TABLE `catalog_product_index_price_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Index Table';



# Dump of table catalog_product_index_price_opt_tmp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_price_opt_tmp`;

CREATE TABLE `catalog_product_index_price_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Temp Table';



# Dump of table catalog_product_index_price_replica
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_price_replica`;

CREATE TABLE `catalog_product_index_price_replica` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Index Table';



# Dump of table catalog_product_index_price_tmp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_price_tmp`;

CREATE TABLE `catalog_product_index_price_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_TMP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_TMP_WEBSITE_ID` (`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_TMP_MIN_PRICE` (`min_price`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Temp Table';



# Dump of table catalog_product_index_tier_price
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_tier_price`;

CREATE TABLE `catalog_product_index_tier_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Index Table';



# Dump of table catalog_product_index_website
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_index_website`;

CREATE TABLE `catalog_product_index_website` (
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `website_date` date DEFAULT NULL COMMENT 'Website Date',
  `rate` float DEFAULT '1' COMMENT 'Rate',
  PRIMARY KEY (`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_WEBSITE_WEBSITE_DATE` (`website_date`),
  CONSTRAINT `CAT_PRD_IDX_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Website Index Table';



# Dump of table catalog_product_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_link`;

CREATE TABLE `catalog_product_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `linked_product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Linked Product ID',
  `link_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `CATALOG_PRODUCT_LINK_LINK_TYPE_ID_PRODUCT_ID_LINKED_PRODUCT_ID` (`link_type_id`,`product_id`,`linked_product_id`),
  KEY `CATALOG_PRODUCT_LINK_PRODUCT_ID` (`product_id`),
  KEY `CATALOG_PRODUCT_LINK_LINKED_PRODUCT_ID` (`linked_product_id`),
  CONSTRAINT `CATALOG_PRODUCT_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_LNK_LNKED_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`linked_product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_LNK_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Product Linkage Table';



# Dump of table catalog_product_link_attribute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_link_attribute`;

CREATE TABLE `catalog_product_link_attribute` (
  `product_link_attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Link Attribute ID',
  `link_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  `product_link_attribute_code` varchar(32) DEFAULT NULL COMMENT 'Product Link Attribute Code',
  `data_type` varchar(32) DEFAULT NULL COMMENT 'Data Type',
  PRIMARY KEY (`product_link_attribute_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_LINK_TYPE_ID` (`link_type_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Attribute Table';

LOCK TABLES `catalog_product_link_attribute` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute` DISABLE KEYS */;

INSERT INTO `catalog_product_link_attribute` (`product_link_attribute_id`, `link_type_id`, `product_link_attribute_code`, `data_type`)
VALUES
	(1,1,'position','int'),
	(2,4,'position','int'),
	(3,5,'position','int'),
	(4,3,'position','int'),
	(5,3,'qty','decimal');

/*!40000 ALTER TABLE `catalog_product_link_attribute` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table catalog_product_link_attribute_decimal
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_link_attribute_decimal`;

CREATE TABLE `catalog_product_link_attribute_decimal` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_DECIMAL_LINK_ID` (`link_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_DEC_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AB2EFA9A14F7BCF1D5400056203D14B6` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Decimal Attribute Table';



# Dump of table catalog_product_link_attribute_int
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_link_attribute_int`;

CREATE TABLE `catalog_product_link_attribute_int` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_INT_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_INT_LINK_ID` (`link_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_INT_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D6D878F8BA2A4282F8DDED7E6E3DE35C` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Integer Attribute Table';



# Dump of table catalog_product_link_attribute_varchar
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_link_attribute_varchar`;

CREATE TABLE `catalog_product_link_attribute_varchar` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_VARCHAR_LINK_ID` (`link_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_VCHR_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DEE9C4DA61CFCC01DFCF50F0D79CEA51` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Varchar Attribute Table';



# Dump of table catalog_product_link_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_link_type`;

CREATE TABLE `catalog_product_link_type` (
  `link_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Type ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  PRIMARY KEY (`link_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Type Table';

LOCK TABLES `catalog_product_link_type` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_type` DISABLE KEYS */;

INSERT INTO `catalog_product_link_type` (`link_type_id`, `code`)
VALUES
	(1,'relation'),
	(3,'super'),
	(4,'up_sell'),
	(5,'cross_sell');

/*!40000 ALTER TABLE `catalog_product_link_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table catalog_product_option
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_option`;

CREATE TABLE `catalog_product_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `type` varchar(50) DEFAULT NULL COMMENT 'Type',
  `is_require` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Required',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `max_characters` int(10) unsigned DEFAULT NULL COMMENT 'Max Characters',
  `file_extension` varchar(50) DEFAULT NULL COMMENT 'File Extension',
  `image_size_x` smallint(5) unsigned DEFAULT NULL COMMENT 'Image Size X',
  `image_size_y` smallint(5) unsigned DEFAULT NULL COMMENT 'Image Size Y',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CAT_PRD_OPT_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Table';



# Dump of table catalog_product_option_price
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_option_price`;

CREATE TABLE `catalog_product_option_price` (
  `option_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Price ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_price_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_OPTION_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_OPT_PRICE_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Price Table';



# Dump of table catalog_product_option_title
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_option_title`;

CREATE TABLE `catalog_product_option_title` (
  `option_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Title ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_title_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_OPTION_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_OPT_TTL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Title Table';



# Dump of table catalog_product_option_type_price
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_option_type_price`;

CREATE TABLE `catalog_product_option_type_price` (
  `option_type_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Price ID',
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_type_price_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B523E3378E8602F376CC415825576B7F` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Price Table';



# Dump of table catalog_product_option_type_title
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_option_type_title`;

CREATE TABLE `catalog_product_option_type_title` (
  `option_type_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Title ID',
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_type_title_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C085B9CF2C2A302E8043FDEA1937D6A2` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Title Table';



# Dump of table catalog_product_option_type_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_option_type_value`;

CREATE TABLE `catalog_product_option_type_value` (
  `option_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION_ID` (`option_id`),
  CONSTRAINT `CAT_PRD_OPT_TYPE_VAL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Value Table';



# Dump of table catalog_product_relation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_relation`;

CREATE TABLE `catalog_product_relation` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  PRIMARY KEY (`parent_id`,`child_id`),
  KEY `CATALOG_PRODUCT_RELATION_CHILD_ID` (`child_id`),
  CONSTRAINT `CAT_PRD_RELATION_CHILD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`child_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_RELATION_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Relation Table';



# Dump of table catalog_product_super_attribute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_super_attribute`;

CREATE TABLE `catalog_product_super_attribute` (
  `product_super_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Super Attribute ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`product_super_attribute_id`),
  UNIQUE KEY `CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRODUCT_ID_ATTRIBUTE_ID` (`product_id`,`attribute_id`),
  CONSTRAINT `CAT_PRD_SPR_ATTR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Table';



# Dump of table catalog_product_super_attribute_label
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_super_attribute_label`;

CREATE TABLE `catalog_product_super_attribute_label` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_super_attribute_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Super Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `use_default` smallint(5) unsigned DEFAULT '0' COMMENT 'Use Default Value',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID_STORE_ID` (`product_super_attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_309442281DF7784210ED82B2CC51E5D5` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Label Table';



# Dump of table catalog_product_super_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_super_link`;

CREATE TABLE `catalog_product_super_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID_PARENT_ID` (`product_id`,`parent_id`),
  KEY `CATALOG_PRODUCT_SUPER_LINK_PARENT_ID` (`parent_id`),
  CONSTRAINT `CAT_PRD_SPR_LNK_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_SPR_LNK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Link Table';



# Dump of table catalog_product_website
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_product_website`;

CREATE TABLE `catalog_product_website` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`product_id`,`website_id`),
  KEY `CATALOG_PRODUCT_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CATALOG_PRODUCT_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_WS_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Website Linkage Table';



# Dump of table catalog_url_rewrite_product_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalog_url_rewrite_product_category`;

CREATE TABLE `catalog_url_rewrite_product_category` (
  `url_rewrite_id` int(10) unsigned NOT NULL COMMENT 'url_rewrite_id',
  `category_id` int(10) unsigned NOT NULL COMMENT 'category_id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'product_id',
  KEY `CATALOG_URL_REWRITE_PRODUCT_CATEGORY_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`),
  KEY `CAT_URL_REWRITE_PRD_CTGR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` (`product_id`),
  KEY `FK_BB79E64705D7F17FE181F23144528FC8` (`url_rewrite_id`),
  CONSTRAINT `CAT_URL_REWRITE_PRD_CTGR_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_URL_REWRITE_PRD_CTGR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_BB79E64705D7F17FE181F23144528FC8` FOREIGN KEY (`url_rewrite_id`) REFERENCES `url_rewrite` (`url_rewrite_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='url_rewrite_relation';



# Dump of table cataloginventory_stock
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cataloginventory_stock`;

CREATE TABLE `cataloginventory_stock` (
  `stock_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Stock Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_name` varchar(255) DEFAULT NULL COMMENT 'Stock Name',
  PRIMARY KEY (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock';

LOCK TABLES `cataloginventory_stock` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock` DISABLE KEYS */;

INSERT INTO `cataloginventory_stock` (`stock_id`, `website_id`, `stock_name`)
VALUES
	(1,0,'Default');

/*!40000 ALTER TABLE `cataloginventory_stock` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cataloginventory_stock_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cataloginventory_stock_item`;

CREATE TABLE `cataloginventory_stock_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `stock_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Stock Id',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `min_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Min Qty',
  `use_config_min_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Qty',
  `is_qty_decimal` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Qty Decimal',
  `backorders` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Backorders',
  `use_config_backorders` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Backorders',
  `min_sale_qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'Min Sale Qty',
  `use_config_min_sale_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Sale Qty',
  `max_sale_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Max Sale Qty',
  `use_config_max_sale_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Max Sale Qty',
  `is_in_stock` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is In Stock',
  `low_stock_date` timestamp NULL DEFAULT NULL COMMENT 'Low Stock Date',
  `notify_stock_qty` decimal(12,4) DEFAULT NULL COMMENT 'Notify Stock Qty',
  `use_config_notify_stock_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Notify Stock Qty',
  `manage_stock` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Manage Stock',
  `use_config_manage_stock` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Manage Stock',
  `stock_status_changed_auto` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Stock Status Changed Automatically',
  `use_config_qty_increments` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Qty Increments',
  `qty_increments` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Increments',
  `use_config_enable_qty_inc` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Enable Qty Increments',
  `enable_qty_increments` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Enable Qty Increments',
  `is_decimal_divided` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Divided into Multiple Boxes for Shipping',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID_STOCK_ID` (`product_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_ITEM_WEBSITE_ID` (`website_id`),
  KEY `CATALOGINVENTORY_STOCK_ITEM_STOCK_ID` (`stock_id`),
  CONSTRAINT `CATINV_STOCK_ITEM_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATINV_STOCK_ITEM_STOCK_ID_CATINV_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `cataloginventory_stock` (`stock_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Item';



# Dump of table cataloginventory_stock_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cataloginventory_stock_status`;

CREATE TABLE `cataloginventory_stock_status` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_STATUS` (`stock_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status';



# Dump of table cataloginventory_stock_status_idx
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cataloginventory_stock_status_idx`;

CREATE TABLE `cataloginventory_stock_status_idx` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_IDX_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_IDX_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Idx';



# Dump of table cataloginventory_stock_status_replica
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cataloginventory_stock_status_replica`;

CREATE TABLE `cataloginventory_stock_status_replica` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_STATUS` (`stock_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status';



# Dump of table cataloginventory_stock_status_tmp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cataloginventory_stock_status_tmp`;

CREATE TABLE `cataloginventory_stock_status_tmp` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_TMP_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_TMP_WEBSITE_ID` (`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Tmp';



# Dump of table catalogrule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalogrule`;

CREATE TABLE `catalogrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From',
  `to_date` date DEFAULT NULL COMMENT 'To',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  PRIMARY KEY (`rule_id`),
  KEY `CATALOGRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule';



# Dump of table catalogrule_customer_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalogrule_customer_group`;

CREATE TABLE `catalogrule_customer_group` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `CATALOGRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `CATALOGRULE_CUSTOMER_GROUP_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `CATRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Customer Groups Relations';



# Dump of table catalogrule_group_website
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalogrule_group_website`;

CREATE TABLE `catalogrule_group_website` (
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Group Website';



# Dump of table catalogrule_group_website_replica
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalogrule_group_website_replica`;

CREATE TABLE `catalogrule_group_website_replica` (
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Group Website';



# Dump of table catalogrule_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalogrule_product`;

CREATE TABLE `catalogrule_product` (
  `rule_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `from_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'From Time',
  `to_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'To time',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Action Amount',
  `action_stop` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Action Stop',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `IDX_EAA51B56FF092A0DCB795D1CEF812B7B` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product';



# Dump of table catalogrule_product_price
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalogrule_product_price`;

CREATE TABLE `catalogrule_product_price` (
  `rule_product_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `rule_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rule Price',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate',
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product Price';



# Dump of table catalogrule_product_price_replica
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalogrule_product_price_replica`;

CREATE TABLE `catalogrule_product_price_replica` (
  `rule_product_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `rule_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rule Price',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate',
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product Price';



# Dump of table catalogrule_product_replica
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalogrule_product_replica`;

CREATE TABLE `catalogrule_product_replica` (
  `rule_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `from_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'From Time',
  `to_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'To time',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Action Amount',
  `action_stop` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Action Stop',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `IDX_EAA51B56FF092A0DCB795D1CEF812B7B` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product';



# Dump of table catalogrule_website
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalogrule_website`;

CREATE TABLE `catalogrule_website` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `CATALOGRULE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CATALOGRULE_WEBSITE_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOGRULE_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Websites Relations';



# Dump of table catalogsearch_fulltext_scope1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catalogsearch_fulltext_scope1`;

CREATE TABLE `catalogsearch_fulltext_scope1` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` int(10) unsigned NOT NULL COMMENT 'Attribute_id',
  `data_index` longtext COMMENT 'Data index',
  PRIMARY KEY (`entity_id`,`attribute_id`),
  FULLTEXT KEY `FTI_FULLTEXT_DATA_INDEX` (`data_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='catalogsearch_fulltext_scope1_tmp';



# Dump of table checkout_agreement
# ------------------------------------------------------------

DROP TABLE IF EXISTS `checkout_agreement`;

CREATE TABLE `checkout_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `content` text COMMENT 'Content',
  `content_height` varchar(25) DEFAULT NULL COMMENT 'Content Height',
  `checkbox_text` text COMMENT 'Checkbox Text',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `is_html` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Html',
  `mode` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Applied mode',
  PRIMARY KEY (`agreement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement';



# Dump of table checkout_agreement_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `checkout_agreement_store`;

CREATE TABLE `checkout_agreement_store` (
  `agreement_id` int(10) unsigned NOT NULL COMMENT 'Agreement Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`agreement_id`,`store_id`),
  KEY `CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CHKT_AGRT_STORE_AGRT_ID_CHKT_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `checkout_agreement` (`agreement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement Store';



# Dump of table cms_block
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_block`;

CREATE TABLE `cms_block` (
  `block_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Block ID',
  `title` varchar(255) NOT NULL COMMENT 'Block Title',
  `identifier` varchar(255) NOT NULL COMMENT 'Block String Identifier',
  `content` mediumtext COMMENT 'Block Content',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Block Creation Time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Block Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Block Active',
  PRIMARY KEY (`block_id`),
  FULLTEXT KEY `CMS_BLOCK_TITLE_IDENTIFIER_CONTENT` (`title`,`identifier`,`content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Block Table';



# Dump of table cms_block_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_block_store`;

CREATE TABLE `cms_block_store` (
  `block_id` smallint(6) NOT NULL COMMENT 'Block ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`block_id`,`store_id`),
  KEY `CMS_BLOCK_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CMS_BLOCK_STORE_BLOCK_ID_CMS_BLOCK_BLOCK_ID` FOREIGN KEY (`block_id`) REFERENCES `cms_block` (`block_id`) ON DELETE CASCADE,
  CONSTRAINT `CMS_BLOCK_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Block To Store Linkage Table';



# Dump of table cms_page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_page`;

CREATE TABLE `cms_page` (
  `page_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Page ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Page Title',
  `page_layout` varchar(255) DEFAULT NULL COMMENT 'Page Layout',
  `meta_keywords` text COMMENT 'Page Meta Keywords',
  `meta_description` text COMMENT 'Page Meta Description',
  `identifier` varchar(100) DEFAULT NULL COMMENT 'Page String Identifier',
  `content_heading` varchar(255) DEFAULT NULL COMMENT 'Page Content Heading',
  `content` mediumtext COMMENT 'Page Content',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Page Creation Time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Page Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Page Active',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Page Sort Order',
  `layout_update_xml` text COMMENT 'Page Layout Update Content',
  `custom_theme` varchar(100) DEFAULT NULL COMMENT 'Page Custom Theme',
  `custom_root_template` varchar(255) DEFAULT NULL COMMENT 'Page Custom Template',
  `custom_layout_update_xml` text COMMENT 'Page Custom Layout Update Content',
  `custom_theme_from` date DEFAULT NULL COMMENT 'Page Custom Theme Active From Date',
  `custom_theme_to` date DEFAULT NULL COMMENT 'Page Custom Theme Active To Date',
  `meta_title` varchar(255) DEFAULT NULL COMMENT 'Page Meta Title',
  PRIMARY KEY (`page_id`),
  KEY `CMS_PAGE_IDENTIFIER` (`identifier`),
  FULLTEXT KEY `CMS_PAGE_TITLE_META_KEYWORDS_META_DESCRIPTION_IDENTIFIER_CONTENT` (`title`,`meta_keywords`,`meta_description`,`identifier`,`content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Page Table';

LOCK TABLES `cms_page` WRITE;
/*!40000 ALTER TABLE `cms_page` DISABLE KEYS */;

INSERT INTO `cms_page` (`page_id`, `title`, `page_layout`, `meta_keywords`, `meta_description`, `identifier`, `content_heading`, `content`, `creation_time`, `update_time`, `is_active`, `sort_order`, `layout_update_xml`, `custom_theme`, `custom_root_template`, `custom_layout_update_xml`, `custom_theme_from`, `custom_theme_to`, `meta_title`)
VALUES
	(1,'404 Not Found','2columns-right','Page keywords','Page description','no-route','Whoops, our bad...','<dl>\r\n<dt>The page you requested was not found, and we have a fine guess why.</dt>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li>If you typed the URL directly, please make sure the spelling is correct.</li>\r\n<li>If you clicked on a link to get here, the link is outdated.</li>\r\n</ul></dd>\r\n</dl>\r\n<dl>\r\n<dt>What can you do?</dt>\r\n<dd>Have no fear, help is near! There are many ways you can get back on track with Magento Store.</dd>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li><a href=\"#\" onclick=\"history.go(-1); return false;\">Go back</a> to the previous page.</li>\r\n<li>Use the search bar at the top of the page to search for your products.</li>\r\n<li>Follow these links to get you back on track!<br /><a href=\"{{store url=\"\"}}\">Store Home</a> <span class=\"separator\">|</span> <a href=\"{{store url=\"customer/account\"}}\">My Account</a></li></ul></dd></dl>\r\n','2017-11-03 17:57:37','2017-11-03 17:57:37',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,'Home page','1column',NULL,NULL,'home','Home Page','<p>CMS homepage content goes here.</p>\r\n','2017-11-03 17:57:37','2017-11-03 17:57:37',1,0,'<!--\n    <referenceContainer name=\"right\">\n        <action method=\"unsetChild\"><argument name=\"alias\" xsi:type=\"string\">right.reports.product.viewed</argument></action>\n        <action method=\"unsetChild\"><argument name=\"alias\" xsi:type=\"string\">right.reports.product.compared</argument></action>\n    </referenceContainer>-->',NULL,NULL,NULL,NULL,NULL,NULL),
	(3,'Enable Cookies','1column',NULL,NULL,'enable-cookies','What are Cookies?','<div class=\"enable-cookies cms-content\">\r\n<p>\"Cookies\" are little pieces of data we send when you visit our store. Cookies help us get to know you better and personalize your experience. Plus they help protect you and other shoppers from fraud.</p>\r\n<p style=\"margin-bottom: 20px;\">Set your browser to accept cookies so you can buy items, save items, and receive customized recommendations. Here’s how:</p>\r\n<ul>\r\n<li><a href=\"https://support.google.com/accounts/answer/61416?hl=en\" target=\"_blank\">Google Chrome</a></li>\r\n<li><a href=\"http://windows.microsoft.com/en-us/internet-explorer/delete-manage-cookies\" target=\"_blank\">Internet Explorer</a></li>\r\n<li><a href=\"http://support.apple.com/kb/PH19214\" target=\"_blank\">Safari</a></li>\r\n<li><a href=\"https://support.mozilla.org/en-US/kb/enable-and-disable-cookies-website-preferences\" target=\"_blank\">Mozilla/Firefox</a></li>\r\n</ul>\r\n</div>','2017-11-03 17:57:37','2017-11-03 17:57:37',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(4,'Privacy and Cookie Policy','1column',NULL,NULL,'privacy-policy-cookie-restriction-mode','Privacy and Cookie Policy','<div class=\"privacy-policy cms-content\">\n    <div class=\"message info\">\n        <span>\n            Please replace this text with you Privacy Policy.\n            Please add any additional cookies your website uses below (e.g. Google Analytics).\n        </span>\n    </div>\n    <p>\n        This privacy policy sets out how this website (hereafter \"the Store\") uses and protects any information that\n        you give the Store while using this website. The Store is committed to ensuring that your privacy is protected.\n        Should we ask you to provide certain information by which you can be identified when using this website, then\n        you can be assured that it will only be used in accordance with this privacy statement. The Store may change\n        this policy from time to time by updating this page. You should check this page from time to time to ensure\n        that you are happy with any changes.\n    </p>\n    <h2>What we collect</h2>\n    <p>We may collect the following information:</p>\n    <ul>\n        <li>name</li>\n        <li>contact information including email address</li>\n        <li>demographic information such as postcode, preferences and interests</li>\n        <li>other information relevant to customer surveys and/or offers</li>\n    </ul>\n    <p>\n        For the exhaustive list of cookies we collect see the <a href=\"#list\">List of cookies we collect</a> section.\n    </p>\n    <h2>What we do with the information we gather</h2>\n    <p>\n        We require this information to understand your needs and provide you with a better service,\n        and in particular for the following reasons:\n    </p>\n    <ul>\n        <li>Internal record keeping.</li>\n        <li>We may use the information to improve our products and services.</li>\n        <li>\n            We may periodically send promotional emails about new products, special offers or other information which we\n            think you may find interesting using the email address which you have provided.\n        </li>\n        <li>\n            From time to time, we may also use your information to contact you for market research purposes.\n            We may contact you by email, phone, fax or mail. We may use the information to customise the website\n            according to your interests.\n        </li>\n    </ul>\n    <h2>Security</h2>\n    <p>\n        We are committed to ensuring that your information is secure. In order to prevent unauthorised access or\n        disclosure, we have put in place suitable physical, electronic and managerial procedures to safeguard and\n        secure the information we collect online.\n    </p>\n    <h2>How we use cookies</h2>\n    <p>\n        A cookie is a small file which asks permission to be placed on your computer\'s hard drive.\n        Once you agree, the file is added and the cookie helps analyse web traffic or lets you know when you visit\n        a particular site. Cookies allow web applications to respond to you as an individual. The web application\n        can tailor its operations to your needs, likes and dislikes by gathering and remembering information about\n        your preferences.\n    </p>\n    <p>\n        We use traffic log cookies to identify which pages are being used. This helps us analyse data about web page\n        traffic and improve our website in order to tailor it to customer needs. We only use this information for\n        statistical analysis purposes and then the data is removed from the system.\n    </p>\n    <p>\n        Overall, cookies help us provide you with a better website, by enabling us to monitor which pages you find\n        useful and which you do not. A cookie in no way gives us access to your computer or any information about you,\n        other than the data you choose to share with us. You can choose to accept or decline cookies.\n        Most web browsers automatically accept cookies, but you can usually modify your browser setting\n        to decline cookies if you prefer. This may prevent you from taking full advantage of the website.\n    </p>\n    <h2>Links to other websites</h2>\n    <p>\n        Our website may contain links to other websites of interest. However, once you have used these links\n        to leave our site, you should note that we do not have any control over that other website.\n        Therefore, we cannot be responsible for the protection and privacy of any information which you provide whilst\n        visiting such sites and such sites are not governed by this privacy statement.\n        You should exercise caution and look at the privacy statement applicable to the website in question.\n    </p>\n    <h2>Controlling your personal information</h2>\n    <p>You may choose to restrict the collection or use of your personal information in the following ways:</p>\n    <ul>\n        <li>\n            whenever you are asked to fill in a form on the website, look for the box that you can click to indicate\n            that you do not want the information to be used by anybody for direct marketing purposes\n        </li>\n        <li>\n            if you have previously agreed to us using your personal information for direct marketing purposes,\n            you may change your mind at any time by letting us know using our Contact Us information\n        </li>\n    </ul>\n    <p>\n        We will not sell, distribute or lease your personal information to third parties unless we have your permission\n        or are required by law to do so. We may use your personal information to send you promotional information\n        about third parties which we think you may find interesting if you tell us that you wish this to happen.\n    </p>\n    <p>\n        You may request details of personal information which we hold about you under the Data Protection Act 1998.\n        A small fee will be payable. If you would like a copy of the information held on you please email us this\n        request using our Contact Us information.\n    </p>\n    <p>\n        If you believe that any information we are holding on you is incorrect or incomplete,\n        please write to or email us as soon as possible, at the above address.\n        We will promptly correct any information found to be incorrect.\n    </p>\n    <h2><a name=\"list\"></a>List of cookies we collect</h2>\n    <p>The table below lists the cookies we collect and what information they store.</p>\n    <table class=\"data-table data-table-definition-list\">\n        <thead>\n        <tr>\n            <th>Cookie Name</th>\n            <th>Cookie Description</th>\n        </tr>\n        </thead>\n        <tbody>\n            <tr>\n                <th>FORM_KEY</th>\n                <td>Stores randomly generated key used to prevent forged requests.</td>\n            </tr>\n            <tr>\n                <th>PHPSESSID</th>\n                <td>Your session ID on the server.</td>\n            </tr>\n            <tr>\n                <th>GUEST-VIEW</th>\n                <td>Allows guests to view and edit their orders.</td>\n            </tr>\n            <tr>\n                <th>PERSISTENT_SHOPPING_CART</th>\n                <td>A link to information about your cart and viewing history, if you have asked for this.</td>\n            </tr>\n            <tr>\n                <th>STF</th>\n                <td>Information on products you have emailed to friends.</td>\n            </tr>\n            <tr>\n                <th>STORE</th>\n                <td>The store view or language you have selected.</td>\n            </tr>\n            <tr>\n                <th>USER_ALLOWED_SAVE_COOKIE</th>\n                <td>Indicates whether a customer allowed to use cookies.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-SESSID</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-STORAGE</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-STORAGE-SECTION-INVALIDATION</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-TIMEOUT</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>SECTION-DATA-IDS</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>PRIVATE_CONTENT_VERSION</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>X-MAGENTO-VARY</th>\n                <td>Facilitates caching of content on the server to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-TRANSLATION-FILE-VERSION</th>\n                <td>Facilitates translation of content to other languages.</td>\n            </tr>\n            <tr>\n                <th>MAGE-TRANSLATION-STORAGE</th>\n                <td>Facilitates translation of content to other languages.</td>\n            </tr>\n        </tbody>\n    </table>\n</div>','2017-11-03 17:57:37','2017-11-03 17:57:37',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `cms_page` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cms_page_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_page_store`;

CREATE TABLE `cms_page_store` (
  `page_id` smallint(6) NOT NULL COMMENT 'Page ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`page_id`,`store_id`),
  KEY `CMS_PAGE_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CMS_PAGE_STORE_PAGE_ID_CMS_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`page_id`) ON DELETE CASCADE,
  CONSTRAINT `CMS_PAGE_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Page To Store Linkage Table';

LOCK TABLES `cms_page_store` WRITE;
/*!40000 ALTER TABLE `cms_page_store` DISABLE KEYS */;

INSERT INTO `cms_page_store` (`page_id`, `store_id`)
VALUES
	(1,0),
	(2,0),
	(3,0),
	(4,0);

/*!40000 ALTER TABLE `cms_page_store` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table core_config_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `core_config_data`;

CREATE TABLE `core_config_data` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Config Id',
  `scope` varchar(8) NOT NULL DEFAULT 'default' COMMENT 'Config Scope',
  `scope_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Config Scope Id',
  `path` varchar(255) NOT NULL DEFAULT 'general' COMMENT 'Config Path',
  `value` text COMMENT 'Config Value',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `CORE_CONFIG_DATA_SCOPE_SCOPE_ID_PATH` (`scope`,`scope_id`,`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Config Data';

LOCK TABLES `core_config_data` WRITE;
/*!40000 ALTER TABLE `core_config_data` DISABLE KEYS */;

INSERT INTO `core_config_data` (`config_id`, `scope`, `scope_id`, `path`, `value`)
VALUES
	(1,'default',0,'web/seo/use_rewrites',NULL),
	(2,'default',0,'web/unsecure/base_url','http://localhost:8000/'),
	(3,'default',0,'web/secure/base_url','https://localhost:8000/'),
	(4,'default',0,'general/locale/code','en_US'),
	(5,'default',0,'web/secure/use_in_frontend',NULL),
	(6,'default',0,'web/secure/use_in_adminhtml',NULL),
	(7,'default',0,'general/locale/timezone','UTC'),
	(8,'default',0,'currency/options/base','USD'),
	(9,'default',0,'currency/options/default','USD'),
	(10,'default',0,'currency/options/allow','USD'),
	(11,'default',0,'general/region/display_all','1'),
	(12,'default',0,'general/region/state_required','AT,BR,CA,CH,EE,ES,FI,HR,LT,LV,RO,US'),
	(13,'default',0,'catalog/category/root_id','2');

/*!40000 ALTER TABLE `core_config_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cron_schedule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cron_schedule`;

CREATE TABLE `cron_schedule` (
  `schedule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Schedule Id',
  `job_code` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Job Code',
  `status` varchar(7) NOT NULL DEFAULT 'pending' COMMENT 'Status',
  `messages` text COMMENT 'Messages',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `scheduled_at` timestamp NULL DEFAULT NULL COMMENT 'Scheduled At',
  `executed_at` timestamp NULL DEFAULT NULL COMMENT 'Executed At',
  `finished_at` timestamp NULL DEFAULT NULL COMMENT 'Finished At',
  PRIMARY KEY (`schedule_id`),
  KEY `CRON_SCHEDULE_JOB_CODE` (`job_code`),
  KEY `CRON_SCHEDULE_SCHEDULED_AT_STATUS` (`scheduled_at`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron Schedule';



# Dump of table customer_address_entity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_address_entity`;

CREATE TABLE `customer_address_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `country_id` varchar(255) NOT NULL COMMENT 'Country',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `firstname` varchar(255) NOT NULL COMMENT 'First Name',
  `lastname` varchar(255) NOT NULL COMMENT 'Last Name',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middle Name',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Zip/Postal Code',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Name Prefix',
  `region` varchar(255) DEFAULT NULL COMMENT 'State/Province',
  `region_id` int(10) unsigned DEFAULT NULL COMMENT 'State/Province',
  `street` text NOT NULL COMMENT 'Street Address',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Name Suffix',
  `telephone` varchar(255) NOT NULL COMMENT 'Phone Number',
  `vat_id` varchar(255) DEFAULT NULL COMMENT 'VAT number',
  `vat_is_valid` int(10) unsigned DEFAULT NULL COMMENT 'VAT number validity',
  `vat_request_date` varchar(255) DEFAULT NULL COMMENT 'VAT number validation request date',
  `vat_request_id` varchar(255) DEFAULT NULL COMMENT 'VAT number validation request ID',
  `vat_request_success` int(10) unsigned DEFAULT NULL COMMENT 'VAT number validation request success',
  PRIMARY KEY (`entity_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_PARENT_ID` (`parent_id`),
  CONSTRAINT `CUSTOMER_ADDRESS_ENTITY_PARENT_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity';



# Dump of table customer_address_entity_datetime
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_address_entity_datetime`;

CREATE TABLE `customer_address_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_DTIME_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Datetime';



# Dump of table customer_address_entity_decimal
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_address_entity_decimal`;

CREATE TABLE `customer_address_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_DEC_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Decimal';



# Dump of table customer_address_entity_int
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_address_entity_int`;

CREATE TABLE `customer_address_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_INT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Int';



# Dump of table customer_address_entity_text
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_address_entity_text`;

CREATE TABLE `customer_address_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CSTR_ADDR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_TEXT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Text';



# Dump of table customer_address_entity_varchar
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_address_entity_varchar`;

CREATE TABLE `customer_address_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_VCHR_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Varchar';



# Dump of table customer_eav_attribute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_eav_attribute`;

CREATE TABLE `customer_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `input_filter` varchar(255) DEFAULT NULL COMMENT 'Input Filter',
  `multiline_count` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Multiline Count',
  `validate_rules` text COMMENT 'Validate Rules',
  `is_system` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `data_model` varchar(255) DEFAULT NULL COMMENT 'Data Model',
  `is_used_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable in Grid',
  `is_searchable_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Searchable in Grid',
  PRIMARY KEY (`attribute_id`),
  CONSTRAINT `CUSTOMER_EAV_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute';

LOCK TABLES `customer_eav_attribute` WRITE;
/*!40000 ALTER TABLE `customer_eav_attribute` DISABLE KEYS */;

INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`, `is_used_in_grid`, `is_visible_in_grid`, `is_filterable_in_grid`, `is_searchable_in_grid`)
VALUES
	(1,1,NULL,0,NULL,1,10,NULL,1,1,1,0),
	(2,0,NULL,0,NULL,1,0,NULL,0,0,0,0),
	(3,1,NULL,0,NULL,1,20,NULL,1,1,0,1),
	(4,0,NULL,0,NULL,0,30,NULL,0,0,0,0),
	(5,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,40,NULL,0,0,0,0),
	(6,0,NULL,0,NULL,0,50,NULL,0,0,0,0),
	(7,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,60,NULL,0,0,0,0),
	(8,0,NULL,0,NULL,0,70,NULL,0,0,0,0),
	(9,1,NULL,0,'{\"input_validation\":\"email\"}',1,80,NULL,1,1,1,1),
	(10,1,NULL,0,NULL,1,25,NULL,1,1,1,0),
	(11,0,'date',0,'{\"input_validation\":\"date\"}',0,90,NULL,1,1,1,0),
	(12,0,NULL,0,NULL,1,0,NULL,0,0,0,0),
	(13,0,NULL,0,NULL,1,0,NULL,0,0,0,0),
	(14,0,NULL,0,'{\"input_validation\":\"date\"}',1,0,NULL,0,0,0,0),
	(15,0,NULL,0,NULL,1,0,NULL,0,0,0,0),
	(16,0,NULL,0,NULL,1,0,NULL,0,0,0,0),
	(17,0,NULL,0,'{\"max_text_length\":255}',0,100,NULL,1,1,0,1),
	(18,0,NULL,0,NULL,1,0,NULL,1,1,1,0),
	(19,0,NULL,0,NULL,0,0,NULL,1,1,1,0),
	(20,0,NULL,0,'[]',0,110,NULL,1,1,1,0),
	(21,1,NULL,0,NULL,1,28,NULL,0,0,0,0),
	(22,0,NULL,0,NULL,0,10,NULL,0,0,0,0),
	(23,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,20,NULL,1,0,0,1),
	(24,0,NULL,0,NULL,0,30,NULL,0,0,0,0),
	(25,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,40,NULL,1,0,0,1),
	(26,0,NULL,0,NULL,0,50,NULL,0,0,0,0),
	(27,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,60,NULL,1,0,0,1),
	(28,1,NULL,2,'{\"max_text_length\":255,\"min_text_length\":1}',1,70,NULL,1,0,0,1),
	(29,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,80,NULL,1,0,0,1),
	(30,1,NULL,0,NULL,1,90,NULL,1,1,1,0),
	(31,1,NULL,0,NULL,1,100,NULL,1,1,0,1),
	(32,1,NULL,0,NULL,1,100,NULL,0,0,0,0),
	(33,1,NULL,0,'[]',1,110,'Magento\\Customer\\Model\\Attribute\\Data\\Postcode',1,1,1,1),
	(34,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,120,NULL,1,1,1,1),
	(35,0,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',0,130,NULL,1,0,0,1),
	(36,1,NULL,0,NULL,1,140,NULL,0,0,0,0),
	(37,0,NULL,0,NULL,1,0,NULL,0,0,0,0),
	(38,0,NULL,0,NULL,1,0,NULL,0,0,0,0),
	(39,0,NULL,0,NULL,1,0,NULL,0,0,0,0),
	(40,0,NULL,0,NULL,1,0,NULL,0,0,0,0),
	(41,0,NULL,0,NULL,0,0,NULL,0,0,0,0),
	(42,0,NULL,0,NULL,1,0,NULL,0,0,0,0),
	(43,0,NULL,0,NULL,1,0,NULL,0,0,0,0),
	(44,0,NULL,0,NULL,1,0,NULL,0,0,0,0);

/*!40000 ALTER TABLE `customer_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customer_eav_attribute_website
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_eav_attribute_website`;

CREATE TABLE `customer_eav_attribute_website` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `is_visible` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Visible',
  `is_required` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Required',
  `default_value` text COMMENT 'Default Value',
  `multiline_count` smallint(5) unsigned DEFAULT NULL COMMENT 'Multiline Count',
  PRIMARY KEY (`attribute_id`,`website_id`),
  KEY `CUSTOMER_EAV_ATTRIBUTE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CSTR_EAV_ATTR_WS_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_EAV_ATTR_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute Website';

LOCK TABLES `customer_eav_attribute_website` WRITE;
/*!40000 ALTER TABLE `customer_eav_attribute_website` DISABLE KEYS */;

INSERT INTO `customer_eav_attribute_website` (`attribute_id`, `website_id`, `is_visible`, `is_required`, `default_value`, `multiline_count`)
VALUES
	(1,1,NULL,NULL,NULL,NULL),
	(3,1,NULL,NULL,NULL,NULL),
	(9,1,NULL,NULL,NULL,NULL),
	(10,1,NULL,NULL,NULL,NULL),
	(11,1,NULL,NULL,NULL,NULL),
	(17,1,NULL,NULL,NULL,NULL),
	(18,1,NULL,NULL,NULL,NULL),
	(19,1,NULL,NULL,NULL,NULL),
	(20,1,NULL,NULL,NULL,NULL),
	(21,1,NULL,NULL,NULL,NULL),
	(23,1,NULL,NULL,NULL,NULL),
	(25,1,NULL,NULL,NULL,NULL),
	(27,1,NULL,NULL,NULL,NULL),
	(28,1,NULL,NULL,NULL,NULL),
	(29,1,NULL,NULL,NULL,NULL),
	(30,1,NULL,NULL,NULL,NULL),
	(31,1,NULL,NULL,NULL,NULL),
	(32,1,NULL,NULL,NULL,NULL),
	(33,1,NULL,NULL,NULL,NULL),
	(34,1,NULL,NULL,NULL,NULL),
	(35,1,NULL,NULL,NULL,NULL),
	(36,1,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `customer_eav_attribute_website` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customer_entity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_entity`;

CREATE TABLE `customer_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Website Id',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Group Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `disable_auto_group_change` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Disable automatic group change based on VAT ID',
  `created_in` varchar(255) DEFAULT NULL COMMENT 'Created From',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Name Prefix',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'First Name',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middle Name/Initial',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Last Name',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Name Suffix',
  `dob` date DEFAULT NULL COMMENT 'Date of Birth',
  `password_hash` varchar(128) DEFAULT NULL COMMENT 'Password_hash',
  `rp_token` varchar(128) DEFAULT NULL COMMENT 'Reset password token',
  `rp_token_created_at` datetime DEFAULT NULL COMMENT 'Reset password token creation time',
  `default_billing` int(10) unsigned DEFAULT NULL COMMENT 'Default Billing Address',
  `default_shipping` int(10) unsigned DEFAULT NULL COMMENT 'Default Shipping Address',
  `taxvat` varchar(50) DEFAULT NULL COMMENT 'Tax/VAT Number',
  `confirmation` varchar(64) DEFAULT NULL COMMENT 'Is Confirmed',
  `gender` smallint(5) unsigned DEFAULT NULL COMMENT 'Gender',
  `failures_num` smallint(6) DEFAULT '0' COMMENT 'Failure Number',
  `first_failure` timestamp NULL DEFAULT NULL COMMENT 'First Failure',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Lock Expiration Date',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_EMAIL_WEBSITE_ID` (`email`,`website_id`),
  KEY `CUSTOMER_ENTITY_STORE_ID` (`store_id`),
  KEY `CUSTOMER_ENTITY_WEBSITE_ID` (`website_id`),
  KEY `CUSTOMER_ENTITY_FIRSTNAME` (`firstname`),
  KEY `CUSTOMER_ENTITY_LASTNAME` (`lastname`),
  CONSTRAINT `CUSTOMER_ENTITY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL,
  CONSTRAINT `CUSTOMER_ENTITY_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity';



# Dump of table customer_entity_datetime
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_entity_datetime`;

CREATE TABLE `customer_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Datetime';



# Dump of table customer_entity_decimal
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_entity_decimal`;

CREATE TABLE `customer_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Decimal';



# Dump of table customer_entity_int
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_entity_int`;

CREATE TABLE `customer_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_INT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_INT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Int';



# Dump of table customer_entity_text
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_entity_text`;

CREATE TABLE `customer_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_TEXT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Text';



# Dump of table customer_entity_varchar
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_entity_varchar`;

CREATE TABLE `customer_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Varchar';



# Dump of table customer_form_attribute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_form_attribute`;

CREATE TABLE `customer_form_attribute` (
  `form_code` varchar(32) NOT NULL COMMENT 'Form Code',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`form_code`,`attribute_id`),
  KEY `CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Form Attribute';

LOCK TABLES `customer_form_attribute` WRITE;
/*!40000 ALTER TABLE `customer_form_attribute` DISABLE KEYS */;

INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`)
VALUES
	('adminhtml_customer',1),
	('adminhtml_customer',3),
	('adminhtml_customer',4),
	('customer_account_create',4),
	('customer_account_edit',4),
	('adminhtml_customer',5),
	('customer_account_create',5),
	('customer_account_edit',5),
	('adminhtml_customer',6),
	('customer_account_create',6),
	('customer_account_edit',6),
	('adminhtml_customer',7),
	('customer_account_create',7),
	('customer_account_edit',7),
	('adminhtml_customer',8),
	('customer_account_create',8),
	('customer_account_edit',8),
	('adminhtml_checkout',9),
	('adminhtml_customer',9),
	('customer_account_create',9),
	('customer_account_edit',9),
	('adminhtml_checkout',10),
	('adminhtml_customer',10),
	('adminhtml_checkout',11),
	('adminhtml_customer',11),
	('customer_account_create',11),
	('customer_account_edit',11),
	('adminhtml_checkout',17),
	('adminhtml_customer',17),
	('customer_account_create',17),
	('customer_account_edit',17),
	('adminhtml_customer',19),
	('customer_account_create',19),
	('customer_account_edit',19),
	('adminhtml_checkout',20),
	('adminhtml_customer',20),
	('customer_account_create',20),
	('customer_account_edit',20),
	('adminhtml_customer',21),
	('adminhtml_customer_address',22),
	('customer_address_edit',22),
	('customer_register_address',22),
	('adminhtml_customer_address',23),
	('customer_address_edit',23),
	('customer_register_address',23),
	('adminhtml_customer_address',24),
	('customer_address_edit',24),
	('customer_register_address',24),
	('adminhtml_customer_address',25),
	('customer_address_edit',25),
	('customer_register_address',25),
	('adminhtml_customer_address',26),
	('customer_address_edit',26),
	('customer_register_address',26),
	('adminhtml_customer_address',27),
	('customer_address_edit',27),
	('customer_register_address',27),
	('adminhtml_customer_address',28),
	('customer_address_edit',28),
	('customer_register_address',28),
	('adminhtml_customer_address',29),
	('customer_address_edit',29),
	('customer_register_address',29),
	('adminhtml_customer_address',30),
	('customer_address_edit',30),
	('customer_register_address',30),
	('adminhtml_customer_address',31),
	('customer_address_edit',31),
	('customer_register_address',31),
	('adminhtml_customer_address',32),
	('customer_address_edit',32),
	('customer_register_address',32),
	('adminhtml_customer_address',33),
	('customer_address_edit',33),
	('customer_register_address',33),
	('adminhtml_customer_address',34),
	('customer_address_edit',34),
	('customer_register_address',34),
	('adminhtml_customer_address',35),
	('customer_address_edit',35),
	('customer_register_address',35),
	('adminhtml_customer_address',36),
	('customer_address_edit',36),
	('customer_register_address',36);

/*!40000 ALTER TABLE `customer_form_attribute` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customer_grid_flat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_grid_flat`;

CREATE TABLE `customer_grid_flat` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `name` text COMMENT 'Name',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` int(11) DEFAULT NULL COMMENT 'Group_id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created_at',
  `website_id` int(11) DEFAULT NULL COMMENT 'Website_id',
  `confirmation` varchar(255) DEFAULT NULL COMMENT 'Confirmation',
  `created_in` text COMMENT 'Created_in',
  `dob` date DEFAULT NULL COMMENT 'Dob',
  `gender` int(11) DEFAULT NULL COMMENT 'Gender',
  `taxvat` varchar(255) DEFAULT NULL COMMENT 'Taxvat',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Lock_expires',
  `shipping_full` text COMMENT 'Shipping_full',
  `billing_full` text COMMENT 'Billing_full',
  `billing_firstname` varchar(255) DEFAULT NULL COMMENT 'Billing_firstname',
  `billing_lastname` varchar(255) DEFAULT NULL COMMENT 'Billing_lastname',
  `billing_telephone` varchar(255) DEFAULT NULL COMMENT 'Billing_telephone',
  `billing_postcode` varchar(255) DEFAULT NULL COMMENT 'Billing_postcode',
  `billing_country_id` varchar(255) DEFAULT NULL COMMENT 'Billing_country_id',
  `billing_region` varchar(255) DEFAULT NULL COMMENT 'Billing_region',
  `billing_street` varchar(255) DEFAULT NULL COMMENT 'Billing_street',
  `billing_city` varchar(255) DEFAULT NULL COMMENT 'Billing_city',
  `billing_fax` varchar(255) DEFAULT NULL COMMENT 'Billing_fax',
  `billing_vat_id` varchar(255) DEFAULT NULL COMMENT 'Billing_vat_id',
  `billing_company` varchar(255) DEFAULT NULL COMMENT 'Billing_company',
  PRIMARY KEY (`entity_id`),
  KEY `CUSTOMER_GRID_FLAT_GROUP_ID` (`group_id`),
  KEY `CUSTOMER_GRID_FLAT_CREATED_AT` (`created_at`),
  KEY `CUSTOMER_GRID_FLAT_WEBSITE_ID` (`website_id`),
  KEY `CUSTOMER_GRID_FLAT_CONFIRMATION` (`confirmation`),
  KEY `CUSTOMER_GRID_FLAT_DOB` (`dob`),
  KEY `CUSTOMER_GRID_FLAT_GENDER` (`gender`),
  KEY `CUSTOMER_GRID_FLAT_BILLING_COUNTRY_ID` (`billing_country_id`),
  FULLTEXT KEY `FTI_8746F705702DD5F6D45B8C7CE7FE9F2F` (`name`,`email`,`created_in`,`taxvat`,`shipping_full`,`billing_full`,`billing_firstname`,`billing_lastname`,`billing_telephone`,`billing_postcode`,`billing_region`,`billing_city`,`billing_fax`,`billing_company`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='customer_grid_flat';



# Dump of table customer_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_group`;

CREATE TABLE `customer_group` (
  `customer_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_code` varchar(32) NOT NULL COMMENT 'Customer Group Code',
  `tax_class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Tax Class Id',
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Group';

LOCK TABLES `customer_group` WRITE;
/*!40000 ALTER TABLE `customer_group` DISABLE KEYS */;

INSERT INTO `customer_group` (`customer_group_id`, `customer_group_code`, `tax_class_id`)
VALUES
	(0,'NOT LOGGED IN',3),
	(1,'General',3),
	(2,'Wholesale',3),
	(3,'Retailer',3);

/*!40000 ALTER TABLE `customer_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customer_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_log`;

CREATE TABLE `customer_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `customer_id` int(11) NOT NULL COMMENT 'Customer ID',
  `last_login_at` timestamp NULL DEFAULT NULL COMMENT 'Last Login Time',
  `last_logout_at` timestamp NULL DEFAULT NULL COMMENT 'Last Logout Time',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `CUSTOMER_LOG_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Log Table';



# Dump of table customer_visitor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_visitor`;

CREATE TABLE `customer_visitor` (
  `visitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `session_id` varchar(64) DEFAULT NULL COMMENT 'Session ID',
  `last_visit_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Visit Time',
  PRIMARY KEY (`visitor_id`),
  KEY `CUSTOMER_VISITOR_CUSTOMER_ID` (`customer_id`),
  KEY `CUSTOMER_VISITOR_LAST_VISIT_AT` (`last_visit_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Visitor Table';

LOCK TABLES `customer_visitor` WRITE;
/*!40000 ALTER TABLE `customer_visitor` DISABLE KEYS */;

INSERT INTO `customer_visitor` (`visitor_id`, `customer_id`, `session_id`, `last_visit_at`)
VALUES
	(1,NULL,'28282ae53c0274bf52618feb33bf78f4','2017-11-03 17:58:32'),
	(2,NULL,'dfe7f22aaf63f26e01ae73130d33d54e','2017-11-03 18:19:46');

/*!40000 ALTER TABLE `customer_visitor` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table design_change
# ------------------------------------------------------------

DROP TABLE IF EXISTS `design_change`;

CREATE TABLE `design_change` (
  `design_change_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Design Change Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `design` varchar(255) DEFAULT NULL COMMENT 'Design',
  `date_from` date DEFAULT NULL COMMENT 'First Date of Design Activity',
  `date_to` date DEFAULT NULL COMMENT 'Last Date of Design Activity',
  PRIMARY KEY (`design_change_id`),
  KEY `DESIGN_CHANGE_STORE_ID` (`store_id`),
  CONSTRAINT `DESIGN_CHANGE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Design Changes';



# Dump of table design_config_grid_flat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `design_config_grid_flat`;

CREATE TABLE `design_config_grid_flat` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `store_website_id` int(11) DEFAULT NULL COMMENT 'Store_website_id',
  `store_group_id` int(11) DEFAULT NULL COMMENT 'Store_group_id',
  `store_id` int(11) DEFAULT NULL COMMENT 'Store_id',
  `theme_theme_id` varchar(255) DEFAULT NULL COMMENT 'Theme_theme_id',
  PRIMARY KEY (`entity_id`),
  KEY `DESIGN_CONFIG_GRID_FLAT_STORE_WEBSITE_ID` (`store_website_id`),
  KEY `DESIGN_CONFIG_GRID_FLAT_STORE_GROUP_ID` (`store_group_id`),
  KEY `DESIGN_CONFIG_GRID_FLAT_STORE_ID` (`store_id`),
  FULLTEXT KEY `DESIGN_CONFIG_GRID_FLAT_THEME_THEME_ID` (`theme_theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='design_config_grid_flat';

LOCK TABLES `design_config_grid_flat` WRITE;
/*!40000 ALTER TABLE `design_config_grid_flat` DISABLE KEYS */;

INSERT INTO `design_config_grid_flat` (`entity_id`, `store_website_id`, `store_group_id`, `store_id`, `theme_theme_id`)
VALUES
	(0,NULL,NULL,NULL,''),
	(1,1,NULL,NULL,''),
	(2,1,1,1,'');

/*!40000 ALTER TABLE `design_config_grid_flat` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table directory_country
# ------------------------------------------------------------

DROP TABLE IF EXISTS `directory_country`;

CREATE TABLE `directory_country` (
  `country_id` varchar(2) NOT NULL COMMENT 'Country Id in ISO-2',
  `iso2_code` varchar(2) DEFAULT NULL COMMENT 'Country ISO-2 format',
  `iso3_code` varchar(3) DEFAULT NULL COMMENT 'Country ISO-3',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country';

LOCK TABLES `directory_country` WRITE;
/*!40000 ALTER TABLE `directory_country` DISABLE KEYS */;

INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`)
VALUES
	('AD','AD','AND'),
	('AE','AE','ARE'),
	('AF','AF','AFG'),
	('AG','AG','ATG'),
	('AI','AI','AIA'),
	('AL','AL','ALB'),
	('AM','AM','ARM'),
	('AN','AN','ANT'),
	('AO','AO','AGO'),
	('AQ','AQ','ATA'),
	('AR','AR','ARG'),
	('AS','AS','ASM'),
	('AT','AT','AUT'),
	('AU','AU','AUS'),
	('AW','AW','ABW'),
	('AX','AX','ALA'),
	('AZ','AZ','AZE'),
	('BA','BA','BIH'),
	('BB','BB','BRB'),
	('BD','BD','BGD'),
	('BE','BE','BEL'),
	('BF','BF','BFA'),
	('BG','BG','BGR'),
	('BH','BH','BHR'),
	('BI','BI','BDI'),
	('BJ','BJ','BEN'),
	('BL','BL','BLM'),
	('BM','BM','BMU'),
	('BN','BN','BRN'),
	('BO','BO','BOL'),
	('BR','BR','BRA'),
	('BS','BS','BHS'),
	('BT','BT','BTN'),
	('BV','BV','BVT'),
	('BW','BW','BWA'),
	('BY','BY','BLR'),
	('BZ','BZ','BLZ'),
	('CA','CA','CAN'),
	('CC','CC','CCK'),
	('CD','CD','COD'),
	('CF','CF','CAF'),
	('CG','CG','COG'),
	('CH','CH','CHE'),
	('CI','CI','CIV'),
	('CK','CK','COK'),
	('CL','CL','CHL'),
	('CM','CM','CMR'),
	('CN','CN','CHN'),
	('CO','CO','COL'),
	('CR','CR','CRI'),
	('CU','CU','CUB'),
	('CV','CV','CPV'),
	('CX','CX','CXR'),
	('CY','CY','CYP'),
	('CZ','CZ','CZE'),
	('DE','DE','DEU'),
	('DJ','DJ','DJI'),
	('DK','DK','DNK'),
	('DM','DM','DMA'),
	('DO','DO','DOM'),
	('DZ','DZ','DZA'),
	('EC','EC','ECU'),
	('EE','EE','EST'),
	('EG','EG','EGY'),
	('EH','EH','ESH'),
	('ER','ER','ERI'),
	('ES','ES','ESP'),
	('ET','ET','ETH'),
	('FI','FI','FIN'),
	('FJ','FJ','FJI'),
	('FK','FK','FLK'),
	('FM','FM','FSM'),
	('FO','FO','FRO'),
	('FR','FR','FRA'),
	('GA','GA','GAB'),
	('GB','GB','GBR'),
	('GD','GD','GRD'),
	('GE','GE','GEO'),
	('GF','GF','GUF'),
	('GG','GG','GGY'),
	('GH','GH','GHA'),
	('GI','GI','GIB'),
	('GL','GL','GRL'),
	('GM','GM','GMB'),
	('GN','GN','GIN'),
	('GP','GP','GLP'),
	('GQ','GQ','GNQ'),
	('GR','GR','GRC'),
	('GS','GS','SGS'),
	('GT','GT','GTM'),
	('GU','GU','GUM'),
	('GW','GW','GNB'),
	('GY','GY','GUY'),
	('HK','HK','HKG'),
	('HM','HM','HMD'),
	('HN','HN','HND'),
	('HR','HR','HRV'),
	('HT','HT','HTI'),
	('HU','HU','HUN'),
	('ID','ID','IDN'),
	('IE','IE','IRL'),
	('IL','IL','ISR'),
	('IM','IM','IMN'),
	('IN','IN','IND'),
	('IO','IO','IOT'),
	('IQ','IQ','IRQ'),
	('IR','IR','IRN'),
	('IS','IS','ISL'),
	('IT','IT','ITA'),
	('JE','JE','JEY'),
	('JM','JM','JAM'),
	('JO','JO','JOR'),
	('JP','JP','JPN'),
	('KE','KE','KEN'),
	('KG','KG','KGZ'),
	('KH','KH','KHM'),
	('KI','KI','KIR'),
	('KM','KM','COM'),
	('KN','KN','KNA'),
	('KP','KP','PRK'),
	('KR','KR','KOR'),
	('KW','KW','KWT'),
	('KY','KY','CYM'),
	('KZ','KZ','KAZ'),
	('LA','LA','LAO'),
	('LB','LB','LBN'),
	('LC','LC','LCA'),
	('LI','LI','LIE'),
	('LK','LK','LKA'),
	('LR','LR','LBR'),
	('LS','LS','LSO'),
	('LT','LT','LTU'),
	('LU','LU','LUX'),
	('LV','LV','LVA'),
	('LY','LY','LBY'),
	('MA','MA','MAR'),
	('MC','MC','MCO'),
	('MD','MD','MDA'),
	('ME','ME','MNE'),
	('MF','MF','MAF'),
	('MG','MG','MDG'),
	('MH','MH','MHL'),
	('MK','MK','MKD'),
	('ML','ML','MLI'),
	('MM','MM','MMR'),
	('MN','MN','MNG'),
	('MO','MO','MAC'),
	('MP','MP','MNP'),
	('MQ','MQ','MTQ'),
	('MR','MR','MRT'),
	('MS','MS','MSR'),
	('MT','MT','MLT'),
	('MU','MU','MUS'),
	('MV','MV','MDV'),
	('MW','MW','MWI'),
	('MX','MX','MEX'),
	('MY','MY','MYS'),
	('MZ','MZ','MOZ'),
	('NA','NA','NAM'),
	('NC','NC','NCL'),
	('NE','NE','NER'),
	('NF','NF','NFK'),
	('NG','NG','NGA'),
	('NI','NI','NIC'),
	('NL','NL','NLD'),
	('NO','NO','NOR'),
	('NP','NP','NPL'),
	('NR','NR','NRU'),
	('NU','NU','NIU'),
	('NZ','NZ','NZL'),
	('OM','OM','OMN'),
	('PA','PA','PAN'),
	('PE','PE','PER'),
	('PF','PF','PYF'),
	('PG','PG','PNG'),
	('PH','PH','PHL'),
	('PK','PK','PAK'),
	('PL','PL','POL'),
	('PM','PM','SPM'),
	('PN','PN','PCN'),
	('PS','PS','PSE'),
	('PT','PT','PRT'),
	('PW','PW','PLW'),
	('PY','PY','PRY'),
	('QA','QA','QAT'),
	('RE','RE','REU'),
	('RO','RO','ROU'),
	('RS','RS','SRB'),
	('RU','RU','RUS'),
	('RW','RW','RWA'),
	('SA','SA','SAU'),
	('SB','SB','SLB'),
	('SC','SC','SYC'),
	('SD','SD','SDN'),
	('SE','SE','SWE'),
	('SG','SG','SGP'),
	('SH','SH','SHN'),
	('SI','SI','SVN'),
	('SJ','SJ','SJM'),
	('SK','SK','SVK'),
	('SL','SL','SLE'),
	('SM','SM','SMR'),
	('SN','SN','SEN'),
	('SO','SO','SOM'),
	('SR','SR','SUR'),
	('ST','ST','STP'),
	('SV','SV','SLV'),
	('SY','SY','SYR'),
	('SZ','SZ','SWZ'),
	('TC','TC','TCA'),
	('TD','TD','TCD'),
	('TF','TF','ATF'),
	('TG','TG','TGO'),
	('TH','TH','THA'),
	('TJ','TJ','TJK'),
	('TK','TK','TKL'),
	('TL','TL','TLS'),
	('TM','TM','TKM'),
	('TN','TN','TUN'),
	('TO','TO','TON'),
	('TR','TR','TUR'),
	('TT','TT','TTO'),
	('TV','TV','TUV'),
	('TW','TW','TWN'),
	('TZ','TZ','TZA'),
	('UA','UA','UKR'),
	('UG','UG','UGA'),
	('UM','UM','UMI'),
	('US','US','USA'),
	('UY','UY','URY'),
	('UZ','UZ','UZB'),
	('VA','VA','VAT'),
	('VC','VC','VCT'),
	('VE','VE','VEN'),
	('VG','VG','VGB'),
	('VI','VI','VIR'),
	('VN','VN','VNM'),
	('VU','VU','VUT'),
	('WF','WF','WLF'),
	('WS','WS','WSM'),
	('YE','YE','YEM'),
	('YT','YT','MYT'),
	('ZA','ZA','ZAF'),
	('ZM','ZM','ZMB'),
	('ZW','ZW','ZWE');

/*!40000 ALTER TABLE `directory_country` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table directory_country_format
# ------------------------------------------------------------

DROP TABLE IF EXISTS `directory_country_format`;

CREATE TABLE `directory_country_format` (
  `country_format_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Country Format Id',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id in ISO-2',
  `type` varchar(30) DEFAULT NULL COMMENT 'Country Format Type',
  `format` text NOT NULL COMMENT 'Country Format',
  PRIMARY KEY (`country_format_id`),
  UNIQUE KEY `DIRECTORY_COUNTRY_FORMAT_COUNTRY_ID_TYPE` (`country_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Format';



# Dump of table directory_country_region
# ------------------------------------------------------------

DROP TABLE IF EXISTS `directory_country_region`;

CREATE TABLE `directory_country_region` (
  `region_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Region Id',
  `country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Country Id in ISO-2',
  `code` varchar(32) DEFAULT NULL COMMENT 'Region code',
  `default_name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`region_id`),
  KEY `DIRECTORY_COUNTRY_REGION_COUNTRY_ID` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Region';

LOCK TABLES `directory_country_region` WRITE;
/*!40000 ALTER TABLE `directory_country_region` DISABLE KEYS */;

INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`)
VALUES
	(1,'US','AL','Alabama'),
	(2,'US','AK','Alaska'),
	(3,'US','AS','American Samoa'),
	(4,'US','AZ','Arizona'),
	(5,'US','AR','Arkansas'),
	(6,'US','AE','Armed Forces Africa'),
	(7,'US','AA','Armed Forces Americas'),
	(8,'US','AE','Armed Forces Canada'),
	(9,'US','AE','Armed Forces Europe'),
	(10,'US','AE','Armed Forces Middle East'),
	(11,'US','AP','Armed Forces Pacific'),
	(12,'US','CA','California'),
	(13,'US','CO','Colorado'),
	(14,'US','CT','Connecticut'),
	(15,'US','DE','Delaware'),
	(16,'US','DC','District of Columbia'),
	(17,'US','FM','Federated States Of Micronesia'),
	(18,'US','FL','Florida'),
	(19,'US','GA','Georgia'),
	(20,'US','GU','Guam'),
	(21,'US','HI','Hawaii'),
	(22,'US','ID','Idaho'),
	(23,'US','IL','Illinois'),
	(24,'US','IN','Indiana'),
	(25,'US','IA','Iowa'),
	(26,'US','KS','Kansas'),
	(27,'US','KY','Kentucky'),
	(28,'US','LA','Louisiana'),
	(29,'US','ME','Maine'),
	(30,'US','MH','Marshall Islands'),
	(31,'US','MD','Maryland'),
	(32,'US','MA','Massachusetts'),
	(33,'US','MI','Michigan'),
	(34,'US','MN','Minnesota'),
	(35,'US','MS','Mississippi'),
	(36,'US','MO','Missouri'),
	(37,'US','MT','Montana'),
	(38,'US','NE','Nebraska'),
	(39,'US','NV','Nevada'),
	(40,'US','NH','New Hampshire'),
	(41,'US','NJ','New Jersey'),
	(42,'US','NM','New Mexico'),
	(43,'US','NY','New York'),
	(44,'US','NC','North Carolina'),
	(45,'US','ND','North Dakota'),
	(46,'US','MP','Northern Mariana Islands'),
	(47,'US','OH','Ohio'),
	(48,'US','OK','Oklahoma'),
	(49,'US','OR','Oregon'),
	(50,'US','PW','Palau'),
	(51,'US','PA','Pennsylvania'),
	(52,'US','PR','Puerto Rico'),
	(53,'US','RI','Rhode Island'),
	(54,'US','SC','South Carolina'),
	(55,'US','SD','South Dakota'),
	(56,'US','TN','Tennessee'),
	(57,'US','TX','Texas'),
	(58,'US','UT','Utah'),
	(59,'US','VT','Vermont'),
	(60,'US','VI','Virgin Islands'),
	(61,'US','VA','Virginia'),
	(62,'US','WA','Washington'),
	(63,'US','WV','West Virginia'),
	(64,'US','WI','Wisconsin'),
	(65,'US','WY','Wyoming'),
	(66,'CA','AB','Alberta'),
	(67,'CA','BC','British Columbia'),
	(68,'CA','MB','Manitoba'),
	(69,'CA','NL','Newfoundland and Labrador'),
	(70,'CA','NB','New Brunswick'),
	(71,'CA','NS','Nova Scotia'),
	(72,'CA','NT','Northwest Territories'),
	(73,'CA','NU','Nunavut'),
	(74,'CA','ON','Ontario'),
	(75,'CA','PE','Prince Edward Island'),
	(76,'CA','QC','Quebec'),
	(77,'CA','SK','Saskatchewan'),
	(78,'CA','YT','Yukon Territory'),
	(79,'DE','NDS','Niedersachsen'),
	(80,'DE','BAW','Baden-Württemberg'),
	(81,'DE','BAY','Bayern'),
	(82,'DE','BER','Berlin'),
	(83,'DE','BRG','Brandenburg'),
	(84,'DE','BRE','Bremen'),
	(85,'DE','HAM','Hamburg'),
	(86,'DE','HES','Hessen'),
	(87,'DE','MEC','Mecklenburg-Vorpommern'),
	(88,'DE','NRW','Nordrhein-Westfalen'),
	(89,'DE','RHE','Rheinland-Pfalz'),
	(90,'DE','SAR','Saarland'),
	(91,'DE','SAS','Sachsen'),
	(92,'DE','SAC','Sachsen-Anhalt'),
	(93,'DE','SCN','Schleswig-Holstein'),
	(94,'DE','THE','Thüringen'),
	(95,'AT','WI','Wien'),
	(96,'AT','NO','Niederösterreich'),
	(97,'AT','OO','Oberösterreich'),
	(98,'AT','SB','Salzburg'),
	(99,'AT','KN','Kärnten'),
	(100,'AT','ST','Steiermark'),
	(101,'AT','TI','Tirol'),
	(102,'AT','BL','Burgenland'),
	(103,'AT','VB','Vorarlberg'),
	(104,'CH','AG','Aargau'),
	(105,'CH','AI','Appenzell Innerrhoden'),
	(106,'CH','AR','Appenzell Ausserrhoden'),
	(107,'CH','BE','Bern'),
	(108,'CH','BL','Basel-Landschaft'),
	(109,'CH','BS','Basel-Stadt'),
	(110,'CH','FR','Freiburg'),
	(111,'CH','GE','Genf'),
	(112,'CH','GL','Glarus'),
	(113,'CH','GR','Graubünden'),
	(114,'CH','JU','Jura'),
	(115,'CH','LU','Luzern'),
	(116,'CH','NE','Neuenburg'),
	(117,'CH','NW','Nidwalden'),
	(118,'CH','OW','Obwalden'),
	(119,'CH','SG','St. Gallen'),
	(120,'CH','SH','Schaffhausen'),
	(121,'CH','SO','Solothurn'),
	(122,'CH','SZ','Schwyz'),
	(123,'CH','TG','Thurgau'),
	(124,'CH','TI','Tessin'),
	(125,'CH','UR','Uri'),
	(126,'CH','VD','Waadt'),
	(127,'CH','VS','Wallis'),
	(128,'CH','ZG','Zug'),
	(129,'CH','ZH','Zürich'),
	(130,'ES','A Coruсa','A Coruña'),
	(131,'ES','Alava','Alava'),
	(132,'ES','Albacete','Albacete'),
	(133,'ES','Alicante','Alicante'),
	(134,'ES','Almeria','Almeria'),
	(135,'ES','Asturias','Asturias'),
	(136,'ES','Avila','Avila'),
	(137,'ES','Badajoz','Badajoz'),
	(138,'ES','Baleares','Baleares'),
	(139,'ES','Barcelona','Barcelona'),
	(140,'ES','Burgos','Burgos'),
	(141,'ES','Caceres','Caceres'),
	(142,'ES','Cadiz','Cadiz'),
	(143,'ES','Cantabria','Cantabria'),
	(144,'ES','Castellon','Castellon'),
	(145,'ES','Ceuta','Ceuta'),
	(146,'ES','Ciudad Real','Ciudad Real'),
	(147,'ES','Cordoba','Cordoba'),
	(148,'ES','Cuenca','Cuenca'),
	(149,'ES','Girona','Girona'),
	(150,'ES','Granada','Granada'),
	(151,'ES','Guadalajara','Guadalajara'),
	(152,'ES','Guipuzcoa','Guipuzcoa'),
	(153,'ES','Huelva','Huelva'),
	(154,'ES','Huesca','Huesca'),
	(155,'ES','Jaen','Jaen'),
	(156,'ES','La Rioja','La Rioja'),
	(157,'ES','Las Palmas','Las Palmas'),
	(158,'ES','Leon','Leon'),
	(159,'ES','Lleida','Lleida'),
	(160,'ES','Lugo','Lugo'),
	(161,'ES','Madrid','Madrid'),
	(162,'ES','Malaga','Malaga'),
	(163,'ES','Melilla','Melilla'),
	(164,'ES','Murcia','Murcia'),
	(165,'ES','Navarra','Navarra'),
	(166,'ES','Ourense','Ourense'),
	(167,'ES','Palencia','Palencia'),
	(168,'ES','Pontevedra','Pontevedra'),
	(169,'ES','Salamanca','Salamanca'),
	(170,'ES','Santa Cruz de Tenerife','Santa Cruz de Tenerife'),
	(171,'ES','Segovia','Segovia'),
	(172,'ES','Sevilla','Sevilla'),
	(173,'ES','Soria','Soria'),
	(174,'ES','Tarragona','Tarragona'),
	(175,'ES','Teruel','Teruel'),
	(176,'ES','Toledo','Toledo'),
	(177,'ES','Valencia','Valencia'),
	(178,'ES','Valladolid','Valladolid'),
	(179,'ES','Vizcaya','Vizcaya'),
	(180,'ES','Zamora','Zamora'),
	(181,'ES','Zaragoza','Zaragoza'),
	(182,'FR','1','Ain'),
	(183,'FR','2','Aisne'),
	(184,'FR','3','Allier'),
	(185,'FR','4','Alpes-de-Haute-Provence'),
	(186,'FR','5','Hautes-Alpes'),
	(187,'FR','6','Alpes-Maritimes'),
	(188,'FR','7','Ardèche'),
	(189,'FR','8','Ardennes'),
	(190,'FR','9','Ariège'),
	(191,'FR','10','Aube'),
	(192,'FR','11','Aude'),
	(193,'FR','12','Aveyron'),
	(194,'FR','13','Bouches-du-Rhône'),
	(195,'FR','14','Calvados'),
	(196,'FR','15','Cantal'),
	(197,'FR','16','Charente'),
	(198,'FR','17','Charente-Maritime'),
	(199,'FR','18','Cher'),
	(200,'FR','19','Corrèze'),
	(201,'FR','2A','Corse-du-Sud'),
	(202,'FR','2B','Haute-Corse'),
	(203,'FR','21','Côte-d\'Or'),
	(204,'FR','22','Côtes-d\'Armor'),
	(205,'FR','23','Creuse'),
	(206,'FR','24','Dordogne'),
	(207,'FR','25','Doubs'),
	(208,'FR','26','Drôme'),
	(209,'FR','27','Eure'),
	(210,'FR','28','Eure-et-Loir'),
	(211,'FR','29','Finistère'),
	(212,'FR','30','Gard'),
	(213,'FR','31','Haute-Garonne'),
	(214,'FR','32','Gers'),
	(215,'FR','33','Gironde'),
	(216,'FR','34','Hérault'),
	(217,'FR','35','Ille-et-Vilaine'),
	(218,'FR','36','Indre'),
	(219,'FR','37','Indre-et-Loire'),
	(220,'FR','38','Isère'),
	(221,'FR','39','Jura'),
	(222,'FR','40','Landes'),
	(223,'FR','41','Loir-et-Cher'),
	(224,'FR','42','Loire'),
	(225,'FR','43','Haute-Loire'),
	(226,'FR','44','Loire-Atlantique'),
	(227,'FR','45','Loiret'),
	(228,'FR','46','Lot'),
	(229,'FR','47','Lot-et-Garonne'),
	(230,'FR','48','Lozère'),
	(231,'FR','49','Maine-et-Loire'),
	(232,'FR','50','Manche'),
	(233,'FR','51','Marne'),
	(234,'FR','52','Haute-Marne'),
	(235,'FR','53','Mayenne'),
	(236,'FR','54','Meurthe-et-Moselle'),
	(237,'FR','55','Meuse'),
	(238,'FR','56','Morbihan'),
	(239,'FR','57','Moselle'),
	(240,'FR','58','Nièvre'),
	(241,'FR','59','Nord'),
	(242,'FR','60','Oise'),
	(243,'FR','61','Orne'),
	(244,'FR','62','Pas-de-Calais'),
	(245,'FR','63','Puy-de-Dôme'),
	(246,'FR','64','Pyrénées-Atlantiques'),
	(247,'FR','65','Hautes-Pyrénées'),
	(248,'FR','66','Pyrénées-Orientales'),
	(249,'FR','67','Bas-Rhin'),
	(250,'FR','68','Haut-Rhin'),
	(251,'FR','69','Rhône'),
	(252,'FR','70','Haute-Saône'),
	(253,'FR','71','Saône-et-Loire'),
	(254,'FR','72','Sarthe'),
	(255,'FR','73','Savoie'),
	(256,'FR','74','Haute-Savoie'),
	(257,'FR','75','Paris'),
	(258,'FR','76','Seine-Maritime'),
	(259,'FR','77','Seine-et-Marne'),
	(260,'FR','78','Yvelines'),
	(261,'FR','79','Deux-Sèvres'),
	(262,'FR','80','Somme'),
	(263,'FR','81','Tarn'),
	(264,'FR','82','Tarn-et-Garonne'),
	(265,'FR','83','Var'),
	(266,'FR','84','Vaucluse'),
	(267,'FR','85','Vendée'),
	(268,'FR','86','Vienne'),
	(269,'FR','87','Haute-Vienne'),
	(270,'FR','88','Vosges'),
	(271,'FR','89','Yonne'),
	(272,'FR','90','Territoire-de-Belfort'),
	(273,'FR','91','Essonne'),
	(274,'FR','92','Hauts-de-Seine'),
	(275,'FR','93','Seine-Saint-Denis'),
	(276,'FR','94','Val-de-Marne'),
	(277,'FR','95','Val-d\'Oise'),
	(278,'RO','AB','Alba'),
	(279,'RO','AR','Arad'),
	(280,'RO','AG','Argeş'),
	(281,'RO','BC','Bacău'),
	(282,'RO','BH','Bihor'),
	(283,'RO','BN','Bistriţa-Năsăud'),
	(284,'RO','BT','Botoşani'),
	(285,'RO','BV','Braşov'),
	(286,'RO','BR','Brăila'),
	(287,'RO','B','Bucureşti'),
	(288,'RO','BZ','Buzău'),
	(289,'RO','CS','Caraş-Severin'),
	(290,'RO','CL','Călăraşi'),
	(291,'RO','CJ','Cluj'),
	(292,'RO','CT','Constanţa'),
	(293,'RO','CV','Covasna'),
	(294,'RO','DB','Dâmboviţa'),
	(295,'RO','DJ','Dolj'),
	(296,'RO','GL','Galaţi'),
	(297,'RO','GR','Giurgiu'),
	(298,'RO','GJ','Gorj'),
	(299,'RO','HR','Harghita'),
	(300,'RO','HD','Hunedoara'),
	(301,'RO','IL','Ialomiţa'),
	(302,'RO','IS','Iaşi'),
	(303,'RO','IF','Ilfov'),
	(304,'RO','MM','Maramureş'),
	(305,'RO','MH','Mehedinţi'),
	(306,'RO','MS','Mureş'),
	(307,'RO','NT','Neamţ'),
	(308,'RO','OT','Olt'),
	(309,'RO','PH','Prahova'),
	(310,'RO','SM','Satu-Mare'),
	(311,'RO','SJ','Sălaj'),
	(312,'RO','SB','Sibiu'),
	(313,'RO','SV','Suceava'),
	(314,'RO','TR','Teleorman'),
	(315,'RO','TM','Timiş'),
	(316,'RO','TL','Tulcea'),
	(317,'RO','VS','Vaslui'),
	(318,'RO','VL','Vâlcea'),
	(319,'RO','VN','Vrancea'),
	(320,'FI','Lappi','Lappi'),
	(321,'FI','Pohjois-Pohjanmaa','Pohjois-Pohjanmaa'),
	(322,'FI','Kainuu','Kainuu'),
	(323,'FI','Pohjois-Karjala','Pohjois-Karjala'),
	(324,'FI','Pohjois-Savo','Pohjois-Savo'),
	(325,'FI','Etelä-Savo','Etelä-Savo'),
	(326,'FI','Etelä-Pohjanmaa','Etelä-Pohjanmaa'),
	(327,'FI','Pohjanmaa','Pohjanmaa'),
	(328,'FI','Pirkanmaa','Pirkanmaa'),
	(329,'FI','Satakunta','Satakunta'),
	(330,'FI','Keski-Pohjanmaa','Keski-Pohjanmaa'),
	(331,'FI','Keski-Suomi','Keski-Suomi'),
	(332,'FI','Varsinais-Suomi','Varsinais-Suomi'),
	(333,'FI','Etelä-Karjala','Etelä-Karjala'),
	(334,'FI','Päijät-Häme','Päijät-Häme'),
	(335,'FI','Kanta-Häme','Kanta-Häme'),
	(336,'FI','Uusimaa','Uusimaa'),
	(337,'FI','Itä-Uusimaa','Itä-Uusimaa'),
	(338,'FI','Kymenlaakso','Kymenlaakso'),
	(339,'FI','Ahvenanmaa','Ahvenanmaa'),
	(340,'EE','EE-37','Harjumaa'),
	(341,'EE','EE-39','Hiiumaa'),
	(342,'EE','EE-44','Ida-Virumaa'),
	(343,'EE','EE-49','Jõgevamaa'),
	(344,'EE','EE-51','Järvamaa'),
	(345,'EE','EE-57','Läänemaa'),
	(346,'EE','EE-59','Lääne-Virumaa'),
	(347,'EE','EE-65','Põlvamaa'),
	(348,'EE','EE-67','Pärnumaa'),
	(349,'EE','EE-70','Raplamaa'),
	(350,'EE','EE-74','Saaremaa'),
	(351,'EE','EE-78','Tartumaa'),
	(352,'EE','EE-82','Valgamaa'),
	(353,'EE','EE-84','Viljandimaa'),
	(354,'EE','EE-86','Võrumaa'),
	(355,'LV','LV-DGV','Daugavpils'),
	(356,'LV','LV-JEL','Jelgava'),
	(357,'LV','Jēkabpils','Jēkabpils'),
	(358,'LV','LV-JUR','Jūrmala'),
	(359,'LV','LV-LPX','Liepāja'),
	(360,'LV','LV-LE','Liepājas novads'),
	(361,'LV','LV-REZ','Rēzekne'),
	(362,'LV','LV-RIX','Rīga'),
	(363,'LV','LV-RI','Rīgas novads'),
	(364,'LV','Valmiera','Valmiera'),
	(365,'LV','LV-VEN','Ventspils'),
	(366,'LV','Aglonas novads','Aglonas novads'),
	(367,'LV','LV-AI','Aizkraukles novads'),
	(368,'LV','Aizputes novads','Aizputes novads'),
	(369,'LV','Aknīstes novads','Aknīstes novads'),
	(370,'LV','Alojas novads','Alojas novads'),
	(371,'LV','Alsungas novads','Alsungas novads'),
	(372,'LV','LV-AL','Alūksnes novads'),
	(373,'LV','Amatas novads','Amatas novads'),
	(374,'LV','Apes novads','Apes novads'),
	(375,'LV','Auces novads','Auces novads'),
	(376,'LV','Babītes novads','Babītes novads'),
	(377,'LV','Baldones novads','Baldones novads'),
	(378,'LV','Baltinavas novads','Baltinavas novads'),
	(379,'LV','LV-BL','Balvu novads'),
	(380,'LV','LV-BU','Bauskas novads'),
	(381,'LV','Beverīnas novads','Beverīnas novads'),
	(382,'LV','Brocēnu novads','Brocēnu novads'),
	(383,'LV','Burtnieku novads','Burtnieku novads'),
	(384,'LV','Carnikavas novads','Carnikavas novads'),
	(385,'LV','Cesvaines novads','Cesvaines novads'),
	(386,'LV','Ciblas novads','Ciblas novads'),
	(387,'LV','LV-CE','Cēsu novads'),
	(388,'LV','Dagdas novads','Dagdas novads'),
	(389,'LV','LV-DA','Daugavpils novads'),
	(390,'LV','LV-DO','Dobeles novads'),
	(391,'LV','Dundagas novads','Dundagas novads'),
	(392,'LV','Durbes novads','Durbes novads'),
	(393,'LV','Engures novads','Engures novads'),
	(394,'LV','Garkalnes novads','Garkalnes novads'),
	(395,'LV','Grobiņas novads','Grobiņas novads'),
	(396,'LV','LV-GU','Gulbenes novads'),
	(397,'LV','Iecavas novads','Iecavas novads'),
	(398,'LV','Ikšķiles novads','Ikšķiles novads'),
	(399,'LV','Ilūkstes novads','Ilūkstes novads'),
	(400,'LV','Inčukalna novads','Inčukalna novads'),
	(401,'LV','Jaunjelgavas novads','Jaunjelgavas novads'),
	(402,'LV','Jaunpiebalgas novads','Jaunpiebalgas novads'),
	(403,'LV','Jaunpils novads','Jaunpils novads'),
	(404,'LV','LV-JL','Jelgavas novads'),
	(405,'LV','LV-JK','Jēkabpils novads'),
	(406,'LV','Kandavas novads','Kandavas novads'),
	(407,'LV','Kokneses novads','Kokneses novads'),
	(408,'LV','Krimuldas novads','Krimuldas novads'),
	(409,'LV','Krustpils novads','Krustpils novads'),
	(410,'LV','LV-KR','Krāslavas novads'),
	(411,'LV','LV-KU','Kuldīgas novads'),
	(412,'LV','Kārsavas novads','Kārsavas novads'),
	(413,'LV','Lielvārdes novads','Lielvārdes novads'),
	(414,'LV','LV-LM','Limbažu novads'),
	(415,'LV','Lubānas novads','Lubānas novads'),
	(416,'LV','LV-LU','Ludzas novads'),
	(417,'LV','Līgatnes novads','Līgatnes novads'),
	(418,'LV','Līvānu novads','Līvānu novads'),
	(419,'LV','LV-MA','Madonas novads'),
	(420,'LV','Mazsalacas novads','Mazsalacas novads'),
	(421,'LV','Mālpils novads','Mālpils novads'),
	(422,'LV','Mārupes novads','Mārupes novads'),
	(423,'LV','Naukšēnu novads','Naukšēnu novads'),
	(424,'LV','Neretas novads','Neretas novads'),
	(425,'LV','Nīcas novads','Nīcas novads'),
	(426,'LV','LV-OG','Ogres novads'),
	(427,'LV','Olaines novads','Olaines novads'),
	(428,'LV','Ozolnieku novads','Ozolnieku novads'),
	(429,'LV','LV-PR','Preiļu novads'),
	(430,'LV','Priekules novads','Priekules novads'),
	(431,'LV','Priekuļu novads','Priekuļu novads'),
	(432,'LV','Pārgaujas novads','Pārgaujas novads'),
	(433,'LV','Pāvilostas novads','Pāvilostas novads'),
	(434,'LV','Pļaviņu novads','Pļaviņu novads'),
	(435,'LV','Raunas novads','Raunas novads'),
	(436,'LV','Riebiņu novads','Riebiņu novads'),
	(437,'LV','Rojas novads','Rojas novads'),
	(438,'LV','Ropažu novads','Ropažu novads'),
	(439,'LV','Rucavas novads','Rucavas novads'),
	(440,'LV','Rugāju novads','Rugāju novads'),
	(441,'LV','Rundāles novads','Rundāles novads'),
	(442,'LV','LV-RE','Rēzeknes novads'),
	(443,'LV','Rūjienas novads','Rūjienas novads'),
	(444,'LV','Salacgrīvas novads','Salacgrīvas novads'),
	(445,'LV','Salas novads','Salas novads'),
	(446,'LV','Salaspils novads','Salaspils novads'),
	(447,'LV','LV-SA','Saldus novads'),
	(448,'LV','Saulkrastu novads','Saulkrastu novads'),
	(449,'LV','Siguldas novads','Siguldas novads'),
	(450,'LV','Skrundas novads','Skrundas novads'),
	(451,'LV','Skrīveru novads','Skrīveru novads'),
	(452,'LV','Smiltenes novads','Smiltenes novads'),
	(453,'LV','Stopiņu novads','Stopiņu novads'),
	(454,'LV','Strenču novads','Strenču novads'),
	(455,'LV','Sējas novads','Sējas novads'),
	(456,'LV','LV-TA','Talsu novads'),
	(457,'LV','LV-TU','Tukuma novads'),
	(458,'LV','Tērvetes novads','Tērvetes novads'),
	(459,'LV','Vaiņodes novads','Vaiņodes novads'),
	(460,'LV','LV-VK','Valkas novads'),
	(461,'LV','LV-VM','Valmieras novads'),
	(462,'LV','Varakļānu novads','Varakļānu novads'),
	(463,'LV','Vecpiebalgas novads','Vecpiebalgas novads'),
	(464,'LV','Vecumnieku novads','Vecumnieku novads'),
	(465,'LV','LV-VE','Ventspils novads'),
	(466,'LV','Viesītes novads','Viesītes novads'),
	(467,'LV','Viļakas novads','Viļakas novads'),
	(468,'LV','Viļānu novads','Viļānu novads'),
	(469,'LV','Vārkavas novads','Vārkavas novads'),
	(470,'LV','Zilupes novads','Zilupes novads'),
	(471,'LV','Ādažu novads','Ādažu novads'),
	(472,'LV','Ērgļu novads','Ērgļu novads'),
	(473,'LV','Ķeguma novads','Ķeguma novads'),
	(474,'LV','Ķekavas novads','Ķekavas novads'),
	(475,'LT','LT-AL','Alytaus Apskritis'),
	(476,'LT','LT-KU','Kauno Apskritis'),
	(477,'LT','LT-KL','Klaipėdos Apskritis'),
	(478,'LT','LT-MR','Marijampolės Apskritis'),
	(479,'LT','LT-PN','Panevėžio Apskritis'),
	(480,'LT','LT-SA','Šiaulių Apskritis'),
	(481,'LT','LT-TA','Tauragės Apskritis'),
	(482,'LT','LT-TE','Telšių Apskritis'),
	(483,'LT','LT-UT','Utenos Apskritis'),
	(484,'LT','LT-VL','Vilniaus Apskritis'),
	(485,'BR','AC','Acre'),
	(486,'BR','AL','Alagoas'),
	(487,'BR','AP','Amapá'),
	(488,'BR','AM','Amazonas'),
	(489,'BR','BA','Bahia'),
	(490,'BR','CE','Ceará'),
	(491,'BR','ES','Espírito Santo'),
	(492,'BR','GO','Goiás'),
	(493,'BR','MA','Maranhão'),
	(494,'BR','MT','Mato Grosso'),
	(495,'BR','MS','Mato Grosso do Sul'),
	(496,'BR','MG','Minas Gerais'),
	(497,'BR','PA','Pará'),
	(498,'BR','PB','Paraíba'),
	(499,'BR','PR','Paraná'),
	(500,'BR','PE','Pernambuco'),
	(501,'BR','PI','Piauí'),
	(502,'BR','RJ','Rio de Janeiro'),
	(503,'BR','RN','Rio Grande do Norte'),
	(504,'BR','RS','Rio Grande do Sul'),
	(505,'BR','RO','Rondônia'),
	(506,'BR','RR','Roraima'),
	(507,'BR','SC','Santa Catarina'),
	(508,'BR','SP','São Paulo'),
	(509,'BR','SE','Sergipe'),
	(510,'BR','TO','Tocantins'),
	(511,'BR','DF','Distrito Federal'),
	(512,'HR','HR-01','Zagrebačka županija'),
	(513,'HR','HR-02','Krapinsko-zagorska županija'),
	(514,'HR','HR-03','Sisačko-moslavačka županija'),
	(515,'HR','HR-04','Karlovačka županija'),
	(516,'HR','HR-05','Varaždinska županija'),
	(517,'HR','HR-06','Koprivničko-križevačka županija'),
	(518,'HR','HR-07','Bjelovarsko-bilogorska županija'),
	(519,'HR','HR-08','Primorsko-goranska županija'),
	(520,'HR','HR-09','Ličko-senjska županija'),
	(521,'HR','HR-10','Virovitičko-podravska županija'),
	(522,'HR','HR-11','Požeško-slavonska županija'),
	(523,'HR','HR-12','Brodsko-posavska županija'),
	(524,'HR','HR-13','Zadarska županija'),
	(525,'HR','HR-14','Osječko-baranjska županija'),
	(526,'HR','HR-15','Šibensko-kninska županija'),
	(527,'HR','HR-16','Vukovarsko-srijemska županija'),
	(528,'HR','HR-17','Splitsko-dalmatinska županija'),
	(529,'HR','HR-18','Istarska županija'),
	(530,'HR','HR-19','Dubrovačko-neretvanska županija'),
	(531,'HR','HR-20','Međimurska županija'),
	(532,'HR','HR-21','Grad Zagreb');

/*!40000 ALTER TABLE `directory_country_region` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table directory_country_region_name
# ------------------------------------------------------------

DROP TABLE IF EXISTS `directory_country_region_name`;

CREATE TABLE `directory_country_region_name` (
  `locale` varchar(8) NOT NULL COMMENT 'Locale',
  `region_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Region Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`locale`,`region_id`),
  KEY `DIRECTORY_COUNTRY_REGION_NAME_REGION_ID` (`region_id`),
  CONSTRAINT `DIR_COUNTRY_REGION_NAME_REGION_ID_DIR_COUNTRY_REGION_REGION_ID` FOREIGN KEY (`region_id`) REFERENCES `directory_country_region` (`region_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Region Name';

LOCK TABLES `directory_country_region_name` WRITE;
/*!40000 ALTER TABLE `directory_country_region_name` DISABLE KEYS */;

INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`)
VALUES
	('en_US',1,'Alabama'),
	('en_US',2,'Alaska'),
	('en_US',3,'American Samoa'),
	('en_US',4,'Arizona'),
	('en_US',5,'Arkansas'),
	('en_US',6,'Armed Forces Africa'),
	('en_US',7,'Armed Forces Americas'),
	('en_US',8,'Armed Forces Canada'),
	('en_US',9,'Armed Forces Europe'),
	('en_US',10,'Armed Forces Middle East'),
	('en_US',11,'Armed Forces Pacific'),
	('en_US',12,'California'),
	('en_US',13,'Colorado'),
	('en_US',14,'Connecticut'),
	('en_US',15,'Delaware'),
	('en_US',16,'District of Columbia'),
	('en_US',17,'Federated States Of Micronesia'),
	('en_US',18,'Florida'),
	('en_US',19,'Georgia'),
	('en_US',20,'Guam'),
	('en_US',21,'Hawaii'),
	('en_US',22,'Idaho'),
	('en_US',23,'Illinois'),
	('en_US',24,'Indiana'),
	('en_US',25,'Iowa'),
	('en_US',26,'Kansas'),
	('en_US',27,'Kentucky'),
	('en_US',28,'Louisiana'),
	('en_US',29,'Maine'),
	('en_US',30,'Marshall Islands'),
	('en_US',31,'Maryland'),
	('en_US',32,'Massachusetts'),
	('en_US',33,'Michigan'),
	('en_US',34,'Minnesota'),
	('en_US',35,'Mississippi'),
	('en_US',36,'Missouri'),
	('en_US',37,'Montana'),
	('en_US',38,'Nebraska'),
	('en_US',39,'Nevada'),
	('en_US',40,'New Hampshire'),
	('en_US',41,'New Jersey'),
	('en_US',42,'New Mexico'),
	('en_US',43,'New York'),
	('en_US',44,'North Carolina'),
	('en_US',45,'North Dakota'),
	('en_US',46,'Northern Mariana Islands'),
	('en_US',47,'Ohio'),
	('en_US',48,'Oklahoma'),
	('en_US',49,'Oregon'),
	('en_US',50,'Palau'),
	('en_US',51,'Pennsylvania'),
	('en_US',52,'Puerto Rico'),
	('en_US',53,'Rhode Island'),
	('en_US',54,'South Carolina'),
	('en_US',55,'South Dakota'),
	('en_US',56,'Tennessee'),
	('en_US',57,'Texas'),
	('en_US',58,'Utah'),
	('en_US',59,'Vermont'),
	('en_US',60,'Virgin Islands'),
	('en_US',61,'Virginia'),
	('en_US',62,'Washington'),
	('en_US',63,'West Virginia'),
	('en_US',64,'Wisconsin'),
	('en_US',65,'Wyoming'),
	('en_US',66,'Alberta'),
	('en_US',67,'British Columbia'),
	('en_US',68,'Manitoba'),
	('en_US',69,'Newfoundland and Labrador'),
	('en_US',70,'New Brunswick'),
	('en_US',71,'Nova Scotia'),
	('en_US',72,'Northwest Territories'),
	('en_US',73,'Nunavut'),
	('en_US',74,'Ontario'),
	('en_US',75,'Prince Edward Island'),
	('en_US',76,'Quebec'),
	('en_US',77,'Saskatchewan'),
	('en_US',78,'Yukon Territory'),
	('en_US',79,'Niedersachsen'),
	('en_US',80,'Baden-Württemberg'),
	('en_US',81,'Bayern'),
	('en_US',82,'Berlin'),
	('en_US',83,'Brandenburg'),
	('en_US',84,'Bremen'),
	('en_US',85,'Hamburg'),
	('en_US',86,'Hessen'),
	('en_US',87,'Mecklenburg-Vorpommern'),
	('en_US',88,'Nordrhein-Westfalen'),
	('en_US',89,'Rheinland-Pfalz'),
	('en_US',90,'Saarland'),
	('en_US',91,'Sachsen'),
	('en_US',92,'Sachsen-Anhalt'),
	('en_US',93,'Schleswig-Holstein'),
	('en_US',94,'Thüringen'),
	('en_US',95,'Wien'),
	('en_US',96,'Niederösterreich'),
	('en_US',97,'Oberösterreich'),
	('en_US',98,'Salzburg'),
	('en_US',99,'Kärnten'),
	('en_US',100,'Steiermark'),
	('en_US',101,'Tirol'),
	('en_US',102,'Burgenland'),
	('en_US',103,'Vorarlberg'),
	('en_US',104,'Aargau'),
	('en_US',105,'Appenzell Innerrhoden'),
	('en_US',106,'Appenzell Ausserrhoden'),
	('en_US',107,'Bern'),
	('en_US',108,'Basel-Landschaft'),
	('en_US',109,'Basel-Stadt'),
	('en_US',110,'Freiburg'),
	('en_US',111,'Genf'),
	('en_US',112,'Glarus'),
	('en_US',113,'Graubünden'),
	('en_US',114,'Jura'),
	('en_US',115,'Luzern'),
	('en_US',116,'Neuenburg'),
	('en_US',117,'Nidwalden'),
	('en_US',118,'Obwalden'),
	('en_US',119,'St. Gallen'),
	('en_US',120,'Schaffhausen'),
	('en_US',121,'Solothurn'),
	('en_US',122,'Schwyz'),
	('en_US',123,'Thurgau'),
	('en_US',124,'Tessin'),
	('en_US',125,'Uri'),
	('en_US',126,'Waadt'),
	('en_US',127,'Wallis'),
	('en_US',128,'Zug'),
	('en_US',129,'Zürich'),
	('en_US',130,'A Coruña'),
	('en_US',131,'Alava'),
	('en_US',132,'Albacete'),
	('en_US',133,'Alicante'),
	('en_US',134,'Almeria'),
	('en_US',135,'Asturias'),
	('en_US',136,'Avila'),
	('en_US',137,'Badajoz'),
	('en_US',138,'Baleares'),
	('en_US',139,'Barcelona'),
	('en_US',140,'Burgos'),
	('en_US',141,'Caceres'),
	('en_US',142,'Cadiz'),
	('en_US',143,'Cantabria'),
	('en_US',144,'Castellon'),
	('en_US',145,'Ceuta'),
	('en_US',146,'Ciudad Real'),
	('en_US',147,'Cordoba'),
	('en_US',148,'Cuenca'),
	('en_US',149,'Girona'),
	('en_US',150,'Granada'),
	('en_US',151,'Guadalajara'),
	('en_US',152,'Guipuzcoa'),
	('en_US',153,'Huelva'),
	('en_US',154,'Huesca'),
	('en_US',155,'Jaen'),
	('en_US',156,'La Rioja'),
	('en_US',157,'Las Palmas'),
	('en_US',158,'Leon'),
	('en_US',159,'Lleida'),
	('en_US',160,'Lugo'),
	('en_US',161,'Madrid'),
	('en_US',162,'Malaga'),
	('en_US',163,'Melilla'),
	('en_US',164,'Murcia'),
	('en_US',165,'Navarra'),
	('en_US',166,'Ourense'),
	('en_US',167,'Palencia'),
	('en_US',168,'Pontevedra'),
	('en_US',169,'Salamanca'),
	('en_US',170,'Santa Cruz de Tenerife'),
	('en_US',171,'Segovia'),
	('en_US',172,'Sevilla'),
	('en_US',173,'Soria'),
	('en_US',174,'Tarragona'),
	('en_US',175,'Teruel'),
	('en_US',176,'Toledo'),
	('en_US',177,'Valencia'),
	('en_US',178,'Valladolid'),
	('en_US',179,'Vizcaya'),
	('en_US',180,'Zamora'),
	('en_US',181,'Zaragoza'),
	('en_US',182,'Ain'),
	('en_US',183,'Aisne'),
	('en_US',184,'Allier'),
	('en_US',185,'Alpes-de-Haute-Provence'),
	('en_US',186,'Hautes-Alpes'),
	('en_US',187,'Alpes-Maritimes'),
	('en_US',188,'Ardèche'),
	('en_US',189,'Ardennes'),
	('en_US',190,'Ariège'),
	('en_US',191,'Aube'),
	('en_US',192,'Aude'),
	('en_US',193,'Aveyron'),
	('en_US',194,'Bouches-du-Rhône'),
	('en_US',195,'Calvados'),
	('en_US',196,'Cantal'),
	('en_US',197,'Charente'),
	('en_US',198,'Charente-Maritime'),
	('en_US',199,'Cher'),
	('en_US',200,'Corrèze'),
	('en_US',201,'Corse-du-Sud'),
	('en_US',202,'Haute-Corse'),
	('en_US',203,'Côte-d\'Or'),
	('en_US',204,'Côtes-d\'Armor'),
	('en_US',205,'Creuse'),
	('en_US',206,'Dordogne'),
	('en_US',207,'Doubs'),
	('en_US',208,'Drôme'),
	('en_US',209,'Eure'),
	('en_US',210,'Eure-et-Loir'),
	('en_US',211,'Finistère'),
	('en_US',212,'Gard'),
	('en_US',213,'Haute-Garonne'),
	('en_US',214,'Gers'),
	('en_US',215,'Gironde'),
	('en_US',216,'Hérault'),
	('en_US',217,'Ille-et-Vilaine'),
	('en_US',218,'Indre'),
	('en_US',219,'Indre-et-Loire'),
	('en_US',220,'Isère'),
	('en_US',221,'Jura'),
	('en_US',222,'Landes'),
	('en_US',223,'Loir-et-Cher'),
	('en_US',224,'Loire'),
	('en_US',225,'Haute-Loire'),
	('en_US',226,'Loire-Atlantique'),
	('en_US',227,'Loiret'),
	('en_US',228,'Lot'),
	('en_US',229,'Lot-et-Garonne'),
	('en_US',230,'Lozère'),
	('en_US',231,'Maine-et-Loire'),
	('en_US',232,'Manche'),
	('en_US',233,'Marne'),
	('en_US',234,'Haute-Marne'),
	('en_US',235,'Mayenne'),
	('en_US',236,'Meurthe-et-Moselle'),
	('en_US',237,'Meuse'),
	('en_US',238,'Morbihan'),
	('en_US',239,'Moselle'),
	('en_US',240,'Nièvre'),
	('en_US',241,'Nord'),
	('en_US',242,'Oise'),
	('en_US',243,'Orne'),
	('en_US',244,'Pas-de-Calais'),
	('en_US',245,'Puy-de-Dôme'),
	('en_US',246,'Pyrénées-Atlantiques'),
	('en_US',247,'Hautes-Pyrénées'),
	('en_US',248,'Pyrénées-Orientales'),
	('en_US',249,'Bas-Rhin'),
	('en_US',250,'Haut-Rhin'),
	('en_US',251,'Rhône'),
	('en_US',252,'Haute-Saône'),
	('en_US',253,'Saône-et-Loire'),
	('en_US',254,'Sarthe'),
	('en_US',255,'Savoie'),
	('en_US',256,'Haute-Savoie'),
	('en_US',257,'Paris'),
	('en_US',258,'Seine-Maritime'),
	('en_US',259,'Seine-et-Marne'),
	('en_US',260,'Yvelines'),
	('en_US',261,'Deux-Sèvres'),
	('en_US',262,'Somme'),
	('en_US',263,'Tarn'),
	('en_US',264,'Tarn-et-Garonne'),
	('en_US',265,'Var'),
	('en_US',266,'Vaucluse'),
	('en_US',267,'Vendée'),
	('en_US',268,'Vienne'),
	('en_US',269,'Haute-Vienne'),
	('en_US',270,'Vosges'),
	('en_US',271,'Yonne'),
	('en_US',272,'Territoire-de-Belfort'),
	('en_US',273,'Essonne'),
	('en_US',274,'Hauts-de-Seine'),
	('en_US',275,'Seine-Saint-Denis'),
	('en_US',276,'Val-de-Marne'),
	('en_US',277,'Val-d\'Oise'),
	('en_US',278,'Alba'),
	('en_US',279,'Arad'),
	('en_US',280,'Argeş'),
	('en_US',281,'Bacău'),
	('en_US',282,'Bihor'),
	('en_US',283,'Bistriţa-Năsăud'),
	('en_US',284,'Botoşani'),
	('en_US',285,'Braşov'),
	('en_US',286,'Brăila'),
	('en_US',287,'Bucureşti'),
	('en_US',288,'Buzău'),
	('en_US',289,'Caraş-Severin'),
	('en_US',290,'Călăraşi'),
	('en_US',291,'Cluj'),
	('en_US',292,'Constanţa'),
	('en_US',293,'Covasna'),
	('en_US',294,'Dâmboviţa'),
	('en_US',295,'Dolj'),
	('en_US',296,'Galaţi'),
	('en_US',297,'Giurgiu'),
	('en_US',298,'Gorj'),
	('en_US',299,'Harghita'),
	('en_US',300,'Hunedoara'),
	('en_US',301,'Ialomiţa'),
	('en_US',302,'Iaşi'),
	('en_US',303,'Ilfov'),
	('en_US',304,'Maramureş'),
	('en_US',305,'Mehedinţi'),
	('en_US',306,'Mureş'),
	('en_US',307,'Neamţ'),
	('en_US',308,'Olt'),
	('en_US',309,'Prahova'),
	('en_US',310,'Satu-Mare'),
	('en_US',311,'Sălaj'),
	('en_US',312,'Sibiu'),
	('en_US',313,'Suceava'),
	('en_US',314,'Teleorman'),
	('en_US',315,'Timiş'),
	('en_US',316,'Tulcea'),
	('en_US',317,'Vaslui'),
	('en_US',318,'Vâlcea'),
	('en_US',319,'Vrancea'),
	('en_US',320,'Lappi'),
	('en_US',321,'Pohjois-Pohjanmaa'),
	('en_US',322,'Kainuu'),
	('en_US',323,'Pohjois-Karjala'),
	('en_US',324,'Pohjois-Savo'),
	('en_US',325,'Etelä-Savo'),
	('en_US',326,'Etelä-Pohjanmaa'),
	('en_US',327,'Pohjanmaa'),
	('en_US',328,'Pirkanmaa'),
	('en_US',329,'Satakunta'),
	('en_US',330,'Keski-Pohjanmaa'),
	('en_US',331,'Keski-Suomi'),
	('en_US',332,'Varsinais-Suomi'),
	('en_US',333,'Etelä-Karjala'),
	('en_US',334,'Päijät-Häme'),
	('en_US',335,'Kanta-Häme'),
	('en_US',336,'Uusimaa'),
	('en_US',337,'Itä-Uusimaa'),
	('en_US',338,'Kymenlaakso'),
	('en_US',339,'Ahvenanmaa'),
	('en_US',340,'Harjumaa'),
	('en_US',341,'Hiiumaa'),
	('en_US',342,'Ida-Virumaa'),
	('en_US',343,'Jõgevamaa'),
	('en_US',344,'Järvamaa'),
	('en_US',345,'Läänemaa'),
	('en_US',346,'Lääne-Virumaa'),
	('en_US',347,'Põlvamaa'),
	('en_US',348,'Pärnumaa'),
	('en_US',349,'Raplamaa'),
	('en_US',350,'Saaremaa'),
	('en_US',351,'Tartumaa'),
	('en_US',352,'Valgamaa'),
	('en_US',353,'Viljandimaa'),
	('en_US',354,'Võrumaa'),
	('en_US',355,'Daugavpils'),
	('en_US',356,'Jelgava'),
	('en_US',357,'Jēkabpils'),
	('en_US',358,'Jūrmala'),
	('en_US',359,'Liepāja'),
	('en_US',360,'Liepājas novads'),
	('en_US',361,'Rēzekne'),
	('en_US',362,'Rīga'),
	('en_US',363,'Rīgas novads'),
	('en_US',364,'Valmiera'),
	('en_US',365,'Ventspils'),
	('en_US',366,'Aglonas novads'),
	('en_US',367,'Aizkraukles novads'),
	('en_US',368,'Aizputes novads'),
	('en_US',369,'Aknīstes novads'),
	('en_US',370,'Alojas novads'),
	('en_US',371,'Alsungas novads'),
	('en_US',372,'Alūksnes novads'),
	('en_US',373,'Amatas novads'),
	('en_US',374,'Apes novads'),
	('en_US',375,'Auces novads'),
	('en_US',376,'Babītes novads'),
	('en_US',377,'Baldones novads'),
	('en_US',378,'Baltinavas novads'),
	('en_US',379,'Balvu novads'),
	('en_US',380,'Bauskas novads'),
	('en_US',381,'Beverīnas novads'),
	('en_US',382,'Brocēnu novads'),
	('en_US',383,'Burtnieku novads'),
	('en_US',384,'Carnikavas novads'),
	('en_US',385,'Cesvaines novads'),
	('en_US',386,'Ciblas novads'),
	('en_US',387,'Cēsu novads'),
	('en_US',388,'Dagdas novads'),
	('en_US',389,'Daugavpils novads'),
	('en_US',390,'Dobeles novads'),
	('en_US',391,'Dundagas novads'),
	('en_US',392,'Durbes novads'),
	('en_US',393,'Engures novads'),
	('en_US',394,'Garkalnes novads'),
	('en_US',395,'Grobiņas novads'),
	('en_US',396,'Gulbenes novads'),
	('en_US',397,'Iecavas novads'),
	('en_US',398,'Ikšķiles novads'),
	('en_US',399,'Ilūkstes novads'),
	('en_US',400,'Inčukalna novads'),
	('en_US',401,'Jaunjelgavas novads'),
	('en_US',402,'Jaunpiebalgas novads'),
	('en_US',403,'Jaunpils novads'),
	('en_US',404,'Jelgavas novads'),
	('en_US',405,'Jēkabpils novads'),
	('en_US',406,'Kandavas novads'),
	('en_US',407,'Kokneses novads'),
	('en_US',408,'Krimuldas novads'),
	('en_US',409,'Krustpils novads'),
	('en_US',410,'Krāslavas novads'),
	('en_US',411,'Kuldīgas novads'),
	('en_US',412,'Kārsavas novads'),
	('en_US',413,'Lielvārdes novads'),
	('en_US',414,'Limbažu novads'),
	('en_US',415,'Lubānas novads'),
	('en_US',416,'Ludzas novads'),
	('en_US',417,'Līgatnes novads'),
	('en_US',418,'Līvānu novads'),
	('en_US',419,'Madonas novads'),
	('en_US',420,'Mazsalacas novads'),
	('en_US',421,'Mālpils novads'),
	('en_US',422,'Mārupes novads'),
	('en_US',423,'Naukšēnu novads'),
	('en_US',424,'Neretas novads'),
	('en_US',425,'Nīcas novads'),
	('en_US',426,'Ogres novads'),
	('en_US',427,'Olaines novads'),
	('en_US',428,'Ozolnieku novads'),
	('en_US',429,'Preiļu novads'),
	('en_US',430,'Priekules novads'),
	('en_US',431,'Priekuļu novads'),
	('en_US',432,'Pārgaujas novads'),
	('en_US',433,'Pāvilostas novads'),
	('en_US',434,'Pļaviņu novads'),
	('en_US',435,'Raunas novads'),
	('en_US',436,'Riebiņu novads'),
	('en_US',437,'Rojas novads'),
	('en_US',438,'Ropažu novads'),
	('en_US',439,'Rucavas novads'),
	('en_US',440,'Rugāju novads'),
	('en_US',441,'Rundāles novads'),
	('en_US',442,'Rēzeknes novads'),
	('en_US',443,'Rūjienas novads'),
	('en_US',444,'Salacgrīvas novads'),
	('en_US',445,'Salas novads'),
	('en_US',446,'Salaspils novads'),
	('en_US',447,'Saldus novads'),
	('en_US',448,'Saulkrastu novads'),
	('en_US',449,'Siguldas novads'),
	('en_US',450,'Skrundas novads'),
	('en_US',451,'Skrīveru novads'),
	('en_US',452,'Smiltenes novads'),
	('en_US',453,'Stopiņu novads'),
	('en_US',454,'Strenču novads'),
	('en_US',455,'Sējas novads'),
	('en_US',456,'Talsu novads'),
	('en_US',457,'Tukuma novads'),
	('en_US',458,'Tērvetes novads'),
	('en_US',459,'Vaiņodes novads'),
	('en_US',460,'Valkas novads'),
	('en_US',461,'Valmieras novads'),
	('en_US',462,'Varakļānu novads'),
	('en_US',463,'Vecpiebalgas novads'),
	('en_US',464,'Vecumnieku novads'),
	('en_US',465,'Ventspils novads'),
	('en_US',466,'Viesītes novads'),
	('en_US',467,'Viļakas novads'),
	('en_US',468,'Viļānu novads'),
	('en_US',469,'Vārkavas novads'),
	('en_US',470,'Zilupes novads'),
	('en_US',471,'Ādažu novads'),
	('en_US',472,'Ērgļu novads'),
	('en_US',473,'Ķeguma novads'),
	('en_US',474,'Ķekavas novads'),
	('en_US',475,'Alytaus Apskritis'),
	('en_US',476,'Kauno Apskritis'),
	('en_US',477,'Klaipėdos Apskritis'),
	('en_US',478,'Marijampolės Apskritis'),
	('en_US',479,'Panevėžio Apskritis'),
	('en_US',480,'Šiaulių Apskritis'),
	('en_US',481,'Tauragės Apskritis'),
	('en_US',482,'Telšių Apskritis'),
	('en_US',483,'Utenos Apskritis'),
	('en_US',484,'Vilniaus Apskritis'),
	('en_US',485,'Acre'),
	('en_US',486,'Alagoas'),
	('en_US',487,'Amapá'),
	('en_US',488,'Amazonas'),
	('en_US',489,'Bahia'),
	('en_US',490,'Ceará'),
	('en_US',491,'Espírito Santo'),
	('en_US',492,'Goiás'),
	('en_US',493,'Maranhão'),
	('en_US',494,'Mato Grosso'),
	('en_US',495,'Mato Grosso do Sul'),
	('en_US',496,'Minas Gerais'),
	('en_US',497,'Pará'),
	('en_US',498,'Paraíba'),
	('en_US',499,'Paraná'),
	('en_US',500,'Pernambuco'),
	('en_US',501,'Piauí'),
	('en_US',502,'Rio de Janeiro'),
	('en_US',503,'Rio Grande do Norte'),
	('en_US',504,'Rio Grande do Sul'),
	('en_US',505,'Rondônia'),
	('en_US',506,'Roraima'),
	('en_US',507,'Santa Catarina'),
	('en_US',508,'São Paulo'),
	('en_US',509,'Sergipe'),
	('en_US',510,'Tocantins'),
	('en_US',511,'Distrito Federal'),
	('en_US',512,'Zagrebačka županija'),
	('en_US',513,'Krapinsko-zagorska županija'),
	('en_US',514,'Sisačko-moslavačka županija'),
	('en_US',515,'Karlovačka županija'),
	('en_US',516,'Varaždinska županija'),
	('en_US',517,'Koprivničko-križevačka županija'),
	('en_US',518,'Bjelovarsko-bilogorska županija'),
	('en_US',519,'Primorsko-goranska županija'),
	('en_US',520,'Ličko-senjska županija'),
	('en_US',521,'Virovitičko-podravska županija'),
	('en_US',522,'Požeško-slavonska županija'),
	('en_US',523,'Brodsko-posavska županija'),
	('en_US',524,'Zadarska županija'),
	('en_US',525,'Osječko-baranjska županija'),
	('en_US',526,'Šibensko-kninska županija'),
	('en_US',527,'Vukovarsko-srijemska županija'),
	('en_US',528,'Splitsko-dalmatinska županija'),
	('en_US',529,'Istarska županija'),
	('en_US',530,'Dubrovačko-neretvanska županija'),
	('en_US',531,'Međimurska županija'),
	('en_US',532,'Grad Zagreb');

/*!40000 ALTER TABLE `directory_country_region_name` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table directory_currency_rate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `directory_currency_rate`;

CREATE TABLE `directory_currency_rate` (
  `currency_from` varchar(3) NOT NULL COMMENT 'Currency Code Convert From',
  `currency_to` varchar(3) NOT NULL COMMENT 'Currency Code Convert To',
  `rate` decimal(24,12) NOT NULL DEFAULT '0.000000000000' COMMENT 'Currency Conversion Rate',
  PRIMARY KEY (`currency_from`,`currency_to`),
  KEY `DIRECTORY_CURRENCY_RATE_CURRENCY_TO` (`currency_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Currency Rate';

LOCK TABLES `directory_currency_rate` WRITE;
/*!40000 ALTER TABLE `directory_currency_rate` DISABLE KEYS */;

INSERT INTO `directory_currency_rate` (`currency_from`, `currency_to`, `rate`)
VALUES
	('EUR','EUR',1.000000000000),
	('EUR','USD',1.415000000000),
	('USD','EUR',0.706700000000),
	('USD','USD',1.000000000000);

/*!40000 ALTER TABLE `directory_currency_rate` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table downloadable_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `downloadable_link`;

CREATE TABLE `downloadable_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  `number_of_downloads` int(11) DEFAULT NULL COMMENT 'Number of downloads',
  `is_shareable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(20) DEFAULT NULL COMMENT 'Link Type',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample Url',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample File',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  PRIMARY KEY (`link_id`),
  KEY `DOWNLOADABLE_LINK_PRODUCT_ID_SORT_ORDER` (`product_id`,`sort_order`),
  CONSTRAINT `DOWNLOADABLE_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Table';



# Dump of table downloadable_link_price
# ------------------------------------------------------------

DROP TABLE IF EXISTS `downloadable_link_price`;

CREATE TABLE `downloadable_link_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Price ID',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  PRIMARY KEY (`price_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_LINK_ID` (`link_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `DOWNLOADABLE_LINK_PRICE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `DOWNLOADABLE_LINK_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Price Table';



# Dump of table downloadable_link_purchased
# ------------------------------------------------------------

DROP TABLE IF EXISTS `downloadable_link_purchased`;

CREATE TABLE `downloadable_link_purchased` (
  `purchased_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Purchased ID',
  `order_id` int(10) unsigned DEFAULT '0' COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Item ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of creation',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of modification',
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product name',
  `product_sku` varchar(255) DEFAULT NULL COMMENT 'Product sku',
  `link_section_title` varchar(255) DEFAULT NULL COMMENT 'Link_section_title',
  PRIMARY KEY (`purchased_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ORDER_ID` (`order_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ORDER_ITEM_ID` (`order_item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `DL_LNK_PURCHASED_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `DOWNLOADABLE_LINK_PURCHASED_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Table';



# Dump of table downloadable_link_purchased_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `downloadable_link_purchased_item`;

CREATE TABLE `downloadable_link_purchased_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `purchased_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Purchased ID',
  `order_item_id` int(10) unsigned DEFAULT '0' COMMENT 'Order Item ID',
  `product_id` int(10) unsigned DEFAULT '0' COMMENT 'Product ID',
  `link_hash` varchar(255) DEFAULT NULL COMMENT 'Link hash',
  `number_of_downloads_bought` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads bought',
  `number_of_downloads_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads used',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `link_title` varchar(255) DEFAULT NULL COMMENT 'Link Title',
  `is_shareable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable Flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(255) DEFAULT NULL COMMENT 'Link Type',
  `status` varchar(50) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  PRIMARY KEY (`item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_LINK_HASH` (`link_hash`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_ORDER_ITEM_ID` (`order_item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_PURCHASED_ID` (`purchased_id`),
  CONSTRAINT `DL_LNK_PURCHASED_ITEM_ORDER_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`order_item_id`) REFERENCES `sales_order_item` (`item_id`) ON DELETE SET NULL,
  CONSTRAINT `DL_LNK_PURCHASED_ITEM_PURCHASED_ID_DL_LNK_PURCHASED_PURCHASED_ID` FOREIGN KEY (`purchased_id`) REFERENCES `downloadable_link_purchased` (`purchased_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Item Table';



# Dump of table downloadable_link_title
# ------------------------------------------------------------

DROP TABLE IF EXISTS `downloadable_link_title`;

CREATE TABLE `downloadable_link_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `DOWNLOADABLE_LINK_TITLE_LINK_ID_STORE_ID` (`link_id`,`store_id`),
  KEY `DOWNLOADABLE_LINK_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `DOWNLOADABLE_LINK_TITLE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `DOWNLOADABLE_LINK_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link Title Table';



# Dump of table downloadable_sample
# ------------------------------------------------------------

DROP TABLE IF EXISTS `downloadable_sample`;

CREATE TABLE `downloadable_sample` (
  `sample_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sample ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample URL',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample file',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`sample_id`),
  KEY `DOWNLOADABLE_SAMPLE_PRODUCT_ID` (`product_id`),
  CONSTRAINT `DOWNLOADABLE_SAMPLE_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Table';



# Dump of table downloadable_sample_title
# ------------------------------------------------------------

DROP TABLE IF EXISTS `downloadable_sample_title`;

CREATE TABLE `downloadable_sample_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `sample_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sample ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID_STORE_ID` (`sample_id`,`store_id`),
  KEY `DOWNLOADABLE_SAMPLE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `DL_SAMPLE_TTL_SAMPLE_ID_DL_SAMPLE_SAMPLE_ID` FOREIGN KEY (`sample_id`) REFERENCES `downloadable_sample` (`sample_id`) ON DELETE CASCADE,
  CONSTRAINT `DOWNLOADABLE_SAMPLE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Title Table';



# Dump of table eav_attribute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eav_attribute`;

CREATE TABLE `eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_code` varchar(255) NOT NULL COMMENT 'Attribute Code',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `backend_model` varchar(255) DEFAULT NULL COMMENT 'Backend Model',
  `backend_type` varchar(8) NOT NULL DEFAULT 'static' COMMENT 'Backend Type',
  `backend_table` varchar(255) DEFAULT NULL COMMENT 'Backend Table',
  `frontend_model` varchar(255) DEFAULT NULL COMMENT 'Frontend Model',
  `frontend_input` varchar(50) DEFAULT NULL COMMENT 'Frontend Input',
  `frontend_label` varchar(255) DEFAULT NULL COMMENT 'Frontend Label',
  `frontend_class` varchar(255) DEFAULT NULL COMMENT 'Frontend Class',
  `source_model` varchar(255) DEFAULT NULL COMMENT 'Source Model',
  `is_required` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Required',
  `is_user_defined` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is User Defined',
  `default_value` text COMMENT 'Default Value',
  `is_unique` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Unique',
  `note` varchar(255) DEFAULT NULL COMMENT 'Note',
  PRIMARY KEY (`attribute_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_ENTITY_TYPE_ID_ATTRIBUTE_CODE` (`entity_type_id`,`attribute_code`),
  CONSTRAINT `EAV_ATTRIBUTE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute';

LOCK TABLES `eav_attribute` WRITE;
/*!40000 ALTER TABLE `eav_attribute` DISABLE KEYS */;

INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`)
VALUES
	(1,1,'website_id',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Website','static',NULL,NULL,'select','Associate to Website',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Website',1,0,NULL,0,NULL),
	(2,1,'store_id',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Store','static',NULL,NULL,'select','Create In',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Store',1,0,NULL,0,NULL),
	(3,1,'created_in',NULL,NULL,'static',NULL,NULL,'text','Created From',NULL,NULL,0,0,NULL,0,NULL),
	(4,1,'prefix',NULL,NULL,'static',NULL,NULL,'text','Name Prefix',NULL,NULL,0,0,NULL,0,NULL),
	(5,1,'firstname',NULL,NULL,'static',NULL,NULL,'text','First Name',NULL,NULL,1,0,NULL,0,NULL),
	(6,1,'middlename',NULL,NULL,'static',NULL,NULL,'text','Middle Name/Initial',NULL,NULL,0,0,NULL,0,NULL),
	(7,1,'lastname',NULL,NULL,'static',NULL,NULL,'text','Last Name',NULL,NULL,1,0,NULL,0,NULL),
	(8,1,'suffix',NULL,NULL,'static',NULL,NULL,'text','Name Suffix',NULL,NULL,0,0,NULL,0,NULL),
	(9,1,'email',NULL,NULL,'static',NULL,NULL,'text','Email',NULL,NULL,1,0,NULL,0,NULL),
	(10,1,'group_id',NULL,NULL,'static',NULL,NULL,'select','Group',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Group',1,0,NULL,0,NULL),
	(11,1,'dob',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','static',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Frontend\\Datetime','date','Date of Birth',NULL,NULL,0,0,NULL,0,NULL),
	(12,1,'password_hash',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Password','static',NULL,NULL,'hidden',NULL,NULL,NULL,0,0,NULL,0,NULL),
	(13,1,'rp_token',NULL,NULL,'static',NULL,NULL,'hidden',NULL,NULL,NULL,0,0,NULL,0,NULL),
	(14,1,'rp_token_created_at',NULL,NULL,'static',NULL,NULL,'date',NULL,NULL,NULL,0,0,NULL,0,NULL),
	(15,1,'default_billing',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Billing','static',NULL,NULL,'text','Default Billing Address',NULL,NULL,0,0,NULL,0,NULL),
	(16,1,'default_shipping',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Shipping','static',NULL,NULL,'text','Default Shipping Address',NULL,NULL,0,0,NULL,0,NULL),
	(17,1,'taxvat',NULL,NULL,'static',NULL,NULL,'text','Tax/VAT Number',NULL,NULL,0,0,NULL,0,NULL),
	(18,1,'confirmation',NULL,NULL,'static',NULL,NULL,'text','Is Confirmed',NULL,NULL,0,0,NULL,0,NULL),
	(19,1,'created_at',NULL,NULL,'static',NULL,NULL,'date','Created At',NULL,NULL,0,0,NULL,0,NULL),
	(20,1,'gender',NULL,NULL,'static',NULL,NULL,'select','Gender',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Table',0,0,NULL,0,NULL),
	(21,1,'disable_auto_group_change',NULL,'Magento\\Customer\\Model\\Attribute\\Backend\\Data\\Boolean','static',NULL,NULL,'boolean','Disable Automatic Group Change Based on VAT ID',NULL,NULL,0,0,NULL,0,NULL),
	(22,2,'prefix',NULL,NULL,'static',NULL,NULL,'text','Name Prefix',NULL,NULL,0,0,NULL,0,NULL),
	(23,2,'firstname',NULL,NULL,'static',NULL,NULL,'text','First Name',NULL,NULL,1,0,NULL,0,NULL),
	(24,2,'middlename',NULL,NULL,'static',NULL,NULL,'text','Middle Name/Initial',NULL,NULL,0,0,NULL,0,NULL),
	(25,2,'lastname',NULL,NULL,'static',NULL,NULL,'text','Last Name',NULL,NULL,1,0,NULL,0,NULL),
	(26,2,'suffix',NULL,NULL,'static',NULL,NULL,'text','Name Suffix',NULL,NULL,0,0,NULL,0,NULL),
	(27,2,'company',NULL,NULL,'static',NULL,NULL,'text','Company',NULL,NULL,0,0,NULL,0,NULL),
	(28,2,'street',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\DefaultBackend','static',NULL,NULL,'multiline','Street Address',NULL,NULL,1,0,NULL,0,NULL),
	(29,2,'city',NULL,NULL,'static',NULL,NULL,'text','City',NULL,NULL,1,0,NULL,0,NULL),
	(30,2,'country_id',NULL,NULL,'static',NULL,NULL,'select','Country',NULL,'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Source\\Country',1,0,NULL,0,NULL),
	(31,2,'region',NULL,'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Backend\\Region','static',NULL,NULL,'text','State/Province',NULL,NULL,0,0,NULL,0,NULL),
	(32,2,'region_id',NULL,NULL,'static',NULL,NULL,'hidden','State/Province',NULL,'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Source\\Region',0,0,NULL,0,NULL),
	(33,2,'postcode',NULL,NULL,'static',NULL,NULL,'text','Zip/Postal Code',NULL,NULL,0,0,NULL,0,NULL),
	(34,2,'telephone',NULL,NULL,'static',NULL,NULL,'text','Phone Number',NULL,NULL,1,0,NULL,0,NULL),
	(35,2,'fax',NULL,NULL,'static',NULL,NULL,'text','Fax',NULL,NULL,0,0,NULL,0,NULL),
	(36,2,'vat_id',NULL,NULL,'static',NULL,NULL,'text','VAT Number',NULL,NULL,0,0,NULL,0,NULL),
	(37,2,'vat_is_valid',NULL,NULL,'static',NULL,NULL,'text','VAT number validity',NULL,NULL,0,0,NULL,0,NULL),
	(38,2,'vat_request_id',NULL,NULL,'static',NULL,NULL,'text','VAT number validation request ID',NULL,NULL,0,0,NULL,0,NULL),
	(39,2,'vat_request_date',NULL,NULL,'static',NULL,NULL,'text','VAT number validation request date',NULL,NULL,0,0,NULL,0,NULL),
	(40,2,'vat_request_success',NULL,NULL,'static',NULL,NULL,'text','VAT number validation request success',NULL,NULL,0,0,NULL,0,NULL),
	(41,1,'updated_at',NULL,NULL,'static',NULL,NULL,'date','Updated At',NULL,NULL,0,0,NULL,0,NULL),
	(42,1,'failures_num',NULL,NULL,'static',NULL,NULL,'hidden','Failures Number',NULL,NULL,0,0,NULL,0,NULL),
	(43,1,'first_failure',NULL,NULL,'static',NULL,NULL,'date','First Failure Date',NULL,NULL,0,0,NULL,0,NULL),
	(44,1,'lock_expires',NULL,NULL,'static',NULL,NULL,'date','Failures Number',NULL,NULL,0,0,NULL,0,NULL),
	(45,3,'name',NULL,NULL,'varchar',NULL,NULL,'text','Name',NULL,NULL,1,0,NULL,0,NULL),
	(46,3,'is_active',NULL,NULL,'int',NULL,NULL,'select','Is Active',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',1,0,NULL,0,NULL),
	(47,3,'description',NULL,NULL,'text',NULL,NULL,'textarea','Description',NULL,NULL,0,0,NULL,0,NULL),
	(48,3,'image',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Image','varchar',NULL,NULL,'image','Image',NULL,NULL,0,0,NULL,0,NULL),
	(49,3,'meta_title',NULL,NULL,'varchar',NULL,NULL,'text','Page Title',NULL,NULL,0,0,NULL,0,NULL),
	(50,3,'meta_keywords',NULL,NULL,'text',NULL,NULL,'textarea','Meta Keywords',NULL,NULL,0,0,NULL,0,NULL),
	(51,3,'meta_description',NULL,NULL,'text',NULL,NULL,'textarea','Meta Description',NULL,NULL,0,0,NULL,0,NULL),
	(52,3,'display_mode',NULL,NULL,'varchar',NULL,NULL,'select','Display Mode',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Mode',0,0,NULL,0,NULL),
	(53,3,'landing_page',NULL,NULL,'int',NULL,NULL,'select','CMS Block',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Page',0,0,NULL,0,NULL),
	(54,3,'is_anchor',NULL,NULL,'int',NULL,NULL,'select','Is Anchor',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',0,0,'1',0,NULL),
	(55,3,'path',NULL,NULL,'static',NULL,NULL,'text','Path',NULL,NULL,0,0,NULL,0,NULL),
	(56,3,'position',NULL,NULL,'static',NULL,NULL,'text','Position',NULL,NULL,0,0,NULL,0,NULL),
	(57,3,'all_children',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),
	(58,3,'path_in_store',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),
	(59,3,'children',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),
	(60,3,'custom_design',NULL,NULL,'varchar',NULL,NULL,'select','Custom Design',NULL,'Magento\\Theme\\Model\\Theme\\Source\\Theme',0,0,NULL,0,NULL),
	(61,3,'custom_design_from','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute','Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Frontend\\Datetime','date','Active From',NULL,NULL,0,0,NULL,0,NULL),
	(62,3,'custom_design_to',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Active To',NULL,NULL,0,0,NULL,0,NULL),
	(63,3,'page_layout',NULL,NULL,'varchar',NULL,NULL,'select','Page Layout',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Layout',0,0,NULL,0,NULL),
	(64,3,'custom_layout_update',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate','text',NULL,NULL,'textarea','Custom Layout Update',NULL,NULL,0,0,NULL,0,NULL),
	(65,3,'level',NULL,NULL,'static',NULL,NULL,'text','Level',NULL,NULL,0,0,NULL,0,NULL),
	(66,3,'children_count',NULL,NULL,'static',NULL,NULL,'text','Children Count',NULL,NULL,0,0,NULL,0,NULL),
	(67,3,'available_sort_by',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Sortby','text',NULL,NULL,'multiselect','Available Product Listing Sort By',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby',1,0,NULL,0,NULL),
	(68,3,'default_sort_by',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Sortby','varchar',NULL,NULL,'select','Default Product Listing Sort By',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby',1,0,NULL,0,NULL),
	(69,3,'include_in_menu',NULL,NULL,'int',NULL,NULL,'select','Include in Navigation Menu',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',1,0,'1',0,NULL),
	(70,3,'custom_use_parent_settings',NULL,NULL,'int',NULL,NULL,'select','Use Parent Category Settings',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',0,0,NULL,0,NULL),
	(71,3,'custom_apply_to_products',NULL,NULL,'int',NULL,NULL,'select','Apply To Products',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',0,0,NULL,0,NULL),
	(72,3,'filter_price_range',NULL,NULL,'decimal',NULL,NULL,'text','Layered Navigation Price Step',NULL,NULL,0,0,NULL,0,NULL),
	(73,4,'name',NULL,NULL,'varchar',NULL,NULL,'text','Product Name','validate-length maximum-length-255',NULL,1,0,NULL,0,NULL),
	(74,4,'sku',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Sku','static',NULL,NULL,'text','SKU','validate-length maximum-length-64',NULL,1,0,NULL,1,NULL),
	(75,4,'description',NULL,NULL,'text',NULL,NULL,'textarea','Description',NULL,NULL,0,0,NULL,0,NULL),
	(76,4,'short_description',NULL,NULL,'text',NULL,NULL,'textarea','Short Description',NULL,NULL,0,0,NULL,0,NULL),
	(77,4,'price',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Price',NULL,NULL,1,0,NULL,0,NULL),
	(78,4,'special_price',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Special Price',NULL,NULL,0,0,NULL,0,NULL),
	(79,4,'special_from_date',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,NULL,'date','Special Price From Date',NULL,NULL,0,0,NULL,0,NULL),
	(80,4,'special_to_date',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Special Price To Date',NULL,NULL,0,0,NULL,0,NULL),
	(81,4,'cost',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Cost',NULL,NULL,0,1,NULL,0,NULL),
	(82,4,'weight',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Weight','decimal',NULL,NULL,'weight','Weight',NULL,NULL,0,0,NULL,0,NULL),
	(83,4,'manufacturer',NULL,NULL,'int',NULL,NULL,'select','Manufacturer',NULL,NULL,0,1,NULL,0,NULL),
	(84,4,'meta_title',NULL,NULL,'varchar',NULL,NULL,'text','Meta Title',NULL,NULL,0,0,NULL,0,NULL),
	(85,4,'meta_keyword',NULL,NULL,'text',NULL,NULL,'textarea','Meta Keywords',NULL,NULL,0,0,NULL,0,NULL),
	(86,4,'meta_description',NULL,NULL,'varchar',NULL,NULL,'textarea','Meta Description',NULL,NULL,0,0,NULL,0,'Maximum 255 chars. Meta Description should optimally be between 150-160 characters'),
	(87,4,'image',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Base',NULL,NULL,0,0,NULL,0,NULL),
	(88,4,'small_image',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Small',NULL,NULL,0,0,NULL,0,NULL),
	(89,4,'thumbnail',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Thumbnail',NULL,NULL,0,0,NULL,0,NULL),
	(90,4,'media_gallery',NULL,NULL,'static',NULL,NULL,'gallery','Media Gallery',NULL,NULL,0,0,NULL,0,NULL),
	(91,4,'old_id',NULL,NULL,'int',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),
	(92,4,'tier_price',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Tierprice','decimal',NULL,NULL,'text','Tier Price',NULL,NULL,0,0,NULL,0,NULL),
	(93,4,'color',NULL,NULL,'int',NULL,NULL,'select','Color',NULL,NULL,0,1,NULL,0,NULL),
	(94,4,'news_from_date',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,NULL,'date','Set Product as New from Date',NULL,NULL,0,0,NULL,0,NULL),
	(95,4,'news_to_date',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Set Product as New to Date',NULL,NULL,0,0,NULL,0,NULL),
	(96,4,'gallery',NULL,NULL,'varchar',NULL,NULL,'gallery','Image Gallery',NULL,NULL,0,0,NULL,0,NULL),
	(97,4,'status',NULL,NULL,'int',NULL,NULL,'select','Enable Product',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Status',0,0,'1',0,NULL),
	(98,4,'minimal_price',NULL,NULL,'decimal',NULL,NULL,'price','Minimal Price',NULL,NULL,0,0,NULL,0,NULL),
	(99,4,'visibility',NULL,NULL,'int',NULL,NULL,'select','Visibility',NULL,'Magento\\Catalog\\Model\\Product\\Visibility',0,0,'4',0,NULL),
	(100,4,'custom_design',NULL,NULL,'varchar',NULL,NULL,'select','New Theme',NULL,'Magento\\Theme\\Model\\Theme\\Source\\Theme',0,0,NULL,0,NULL),
	(101,4,'custom_design_from',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,NULL,'date','Active From',NULL,NULL,0,0,NULL,0,NULL),
	(102,4,'custom_design_to',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Active To',NULL,NULL,0,0,NULL,0,NULL),
	(103,4,'custom_layout_update',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate','text',NULL,NULL,'textarea','Layout Update XML',NULL,NULL,0,0,NULL,0,NULL),
	(104,4,'page_layout',NULL,NULL,'varchar',NULL,NULL,'select','Layout',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Layout',0,0,NULL,0,NULL),
	(105,4,'category_ids',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Category','static',NULL,NULL,'text','Categories',NULL,NULL,0,0,NULL,0,NULL),
	(106,4,'options_container',NULL,NULL,'varchar',NULL,NULL,'select','Display Product Options In',NULL,'Magento\\Catalog\\Model\\Entity\\Product\\Attribute\\Design\\Options\\Container',0,0,'container2',0,NULL),
	(107,4,'required_options',NULL,NULL,'static',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),
	(108,4,'has_options',NULL,NULL,'static',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),
	(109,4,'image_label',NULL,NULL,'varchar',NULL,NULL,'text','Image Label',NULL,NULL,0,0,NULL,0,NULL),
	(110,4,'small_image_label',NULL,NULL,'varchar',NULL,NULL,'text','Small Image Label',NULL,NULL,0,0,NULL,0,NULL),
	(111,4,'thumbnail_label',NULL,NULL,'varchar',NULL,NULL,'text','Thumbnail Label',NULL,NULL,0,0,NULL,0,NULL),
	(112,4,'created_at',NULL,NULL,'static',NULL,NULL,'date',NULL,NULL,NULL,1,0,NULL,0,NULL),
	(113,4,'updated_at',NULL,NULL,'static',NULL,NULL,'date',NULL,NULL,NULL,1,0,NULL,0,NULL),
	(114,4,'country_of_manufacture',NULL,NULL,'varchar',NULL,NULL,'select','Country of Manufacture',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Countryofmanufacture',0,0,NULL,0,NULL),
	(115,4,'quantity_and_stock_status',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Stock','int',NULL,NULL,'select','Quantity',NULL,'Magento\\CatalogInventory\\Model\\Source\\Stock',0,0,'1',0,NULL),
	(116,4,'custom_layout',NULL,NULL,'varchar',NULL,NULL,'select','New Layout',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Layout',0,0,NULL,0,NULL),
	(117,3,'url_key',NULL,NULL,'varchar',NULL,NULL,'text','URL Key',NULL,NULL,0,0,NULL,0,NULL),
	(118,3,'url_path',NULL,NULL,'varchar',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),
	(119,4,'url_key',NULL,NULL,'varchar',NULL,NULL,'text','URL Key',NULL,NULL,0,0,NULL,0,NULL),
	(120,4,'url_path',NULL,NULL,'varchar',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),
	(121,4,'msrp',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Manufacturer\'s Suggested Retail Price',NULL,NULL,0,0,NULL,0,NULL),
	(122,4,'msrp_display_actual_price_type',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean','varchar',NULL,NULL,'select','Display Actual Price',NULL,'Magento\\Msrp\\Model\\Product\\Attribute\\Source\\Type\\Price',0,0,'0',0,NULL),
	(123,4,'price_type',NULL,NULL,'int',NULL,NULL,'boolean','Dynamic Price',NULL,NULL,1,0,'0',0,NULL),
	(124,4,'sku_type',NULL,NULL,'int',NULL,NULL,'boolean','Dynamic SKU',NULL,NULL,1,0,'0',0,NULL),
	(125,4,'weight_type',NULL,NULL,'int',NULL,NULL,'boolean','Dynamic Weight',NULL,NULL,1,0,'0',0,NULL),
	(126,4,'price_view',NULL,NULL,'int',NULL,NULL,'select','Price View',NULL,'Magento\\Bundle\\Model\\Product\\Attribute\\Source\\Price\\View',1,0,NULL,0,NULL),
	(127,4,'shipment_type',NULL,NULL,'int',NULL,NULL,'select','Ship Bundle Items',NULL,'Magento\\Bundle\\Model\\Product\\Attribute\\Source\\Shipment\\Type',1,0,'0',0,NULL),
	(128,4,'links_purchased_separately',NULL,NULL,'int',NULL,NULL,NULL,'Links can be purchased separately',NULL,NULL,1,0,NULL,0,NULL),
	(129,4,'samples_title',NULL,NULL,'varchar',NULL,NULL,NULL,'Samples title',NULL,NULL,1,0,NULL,0,NULL),
	(130,4,'links_title',NULL,NULL,'varchar',NULL,NULL,NULL,'Links title',NULL,NULL,1,0,NULL,0,NULL),
	(131,4,'links_exist',NULL,NULL,'int',NULL,NULL,NULL,NULL,NULL,NULL,0,0,'0',0,NULL),
	(132,4,'gift_message_available',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean','varchar',NULL,NULL,'select','Allow Gift Message',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Boolean',0,0,NULL,0,NULL),
	(133,4,'swatch_image',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Swatch',NULL,NULL,0,0,NULL,0,NULL),
	(134,4,'tax_class_id',NULL,NULL,'int',NULL,NULL,'select','Tax Class',NULL,'Magento\\Tax\\Model\\TaxClass\\Source\\Product',0,0,'2',0,NULL);

/*!40000 ALTER TABLE `eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table eav_attribute_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eav_attribute_group`;

CREATE TABLE `eav_attribute_group` (
  `attribute_group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Group Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Group Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Default Id',
  `attribute_group_code` varchar(255) NOT NULL COMMENT 'Attribute Group Code',
  `tab_group_code` varchar(255) DEFAULT NULL COMMENT 'Tab Group Code',
  PRIMARY KEY (`attribute_group_id`),
  UNIQUE KEY `CATALOG_CATEGORY_PRODUCT_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_CODE` (`attribute_set_id`,`attribute_group_code`),
  UNIQUE KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_NAME` (`attribute_set_id`,`attribute_group_name`),
  KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  CONSTRAINT `EAV_ATTR_GROUP_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Group';

LOCK TABLES `eav_attribute_group` WRITE;
/*!40000 ALTER TABLE `eav_attribute_group` DISABLE KEYS */;

INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`, `attribute_group_code`, `tab_group_code`)
VALUES
	(1,1,'General',1,1,'general',NULL),
	(2,2,'General',1,1,'general',NULL),
	(3,3,'General',10,1,'general',NULL),
	(4,3,'General Information',2,0,'general-information',NULL),
	(5,3,'Display Settings',20,0,'display-settings',NULL),
	(6,3,'Custom Design',30,0,'custom-design',NULL),
	(7,4,'Product Details',10,1,'product-details','basic'),
	(8,4,'Advanced Pricing',40,0,'advanced-pricing','advanced'),
	(9,4,'Search Engine Optimization',30,0,'search-engine-optimization','basic'),
	(10,4,'Images',20,0,'image-management','basic'),
	(11,4,'Design',50,0,'design','advanced'),
	(12,4,'Autosettings',60,0,'autosettings','advanced'),
	(13,4,'Content',15,0,'content','basic'),
	(14,4,'Schedule Design Update',55,0,'schedule-design-update','advanced'),
	(15,4,'Bundle Items',16,0,'bundle-items',NULL),
	(16,5,'General',1,1,'general',NULL),
	(17,6,'General',1,1,'general',NULL),
	(18,7,'General',1,1,'general',NULL),
	(19,8,'General',1,1,'general',NULL),
	(20,4,'Gift Options',61,0,'gift-options',NULL);

/*!40000 ALTER TABLE `eav_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table eav_attribute_label
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eav_attribute_label`;

CREATE TABLE `eav_attribute_label` (
  `attribute_label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Label Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`attribute_label_id`),
  KEY `EAV_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  KEY `EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_STORE_ID` (`attribute_id`,`store_id`),
  CONSTRAINT `EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ATTRIBUTE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Label';



# Dump of table eav_attribute_option
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eav_attribute_option`;

CREATE TABLE `eav_attribute_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option';

LOCK TABLES `eav_attribute_option` WRITE;
/*!40000 ALTER TABLE `eav_attribute_option` DISABLE KEYS */;

INSERT INTO `eav_attribute_option` (`option_id`, `attribute_id`, `sort_order`)
VALUES
	(1,20,0),
	(2,20,1),
	(3,20,3);

/*!40000 ALTER TABLE `eav_attribute_option` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table eav_attribute_option_swatch
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eav_attribute_option_swatch`;

CREATE TABLE `eav_attribute_option_swatch` (
  `swatch_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Swatch ID',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `type` smallint(5) unsigned NOT NULL COMMENT 'Swatch type: 0 - text, 1 - visual color, 2 - visual image',
  `value` varchar(255) DEFAULT NULL COMMENT 'Swatch Value',
  PRIMARY KEY (`swatch_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_OPTION_ID` (`store_id`,`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_SWATCH_SWATCH_ID` (`swatch_id`),
  KEY `EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID` (`option_id`),
  CONSTRAINT `EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `eav_attribute_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Magento Swatches table';



# Dump of table eav_attribute_option_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eav_attribute_option_value`;

CREATE TABLE `eav_attribute_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  KEY `EAV_ATTRIBUTE_OPTION_VALUE_OPTION_ID` (`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ATTR_OPT_VAL_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `eav_attribute_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option Value';

LOCK TABLES `eav_attribute_option_value` WRITE;
/*!40000 ALTER TABLE `eav_attribute_option_value` DISABLE KEYS */;

INSERT INTO `eav_attribute_option_value` (`value_id`, `option_id`, `store_id`, `value`)
VALUES
	(1,1,0,'Male'),
	(2,2,0,'Female'),
	(3,3,0,'Not Specified');

/*!40000 ALTER TABLE `eav_attribute_option_value` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table eav_attribute_set
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eav_attribute_set`;

CREATE TABLE `eav_attribute_set` (
  `attribute_set_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Set Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Set Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`attribute_set_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_ATTRIBUTE_SET_NAME` (`entity_type_id`,`attribute_set_name`),
  KEY `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_SORT_ORDER` (`entity_type_id`,`sort_order`),
  CONSTRAINT `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Set';

LOCK TABLES `eav_attribute_set` WRITE;
/*!40000 ALTER TABLE `eav_attribute_set` DISABLE KEYS */;

INSERT INTO `eav_attribute_set` (`attribute_set_id`, `entity_type_id`, `attribute_set_name`, `sort_order`)
VALUES
	(1,1,'Default',2),
	(2,2,'Default',2),
	(3,3,'Default',1),
	(4,4,'Default',1),
	(5,5,'Default',1),
	(6,6,'Default',1),
	(7,7,'Default',1),
	(8,8,'Default',1);

/*!40000 ALTER TABLE `eav_attribute_set` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table eav_entity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eav_entity`;

CREATE TABLE `eav_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Entity Active',
  PRIMARY KEY (`entity_id`),
  KEY `EAV_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ENTITY_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity';



# Dump of table eav_entity_attribute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eav_entity_attribute`;

CREATE TABLE `eav_entity_attribute` (
  `entity_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Group Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`entity_attribute_id`),
  UNIQUE KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_ATTRIBUTE_ID` (`attribute_set_id`,`attribute_id`),
  UNIQUE KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_GROUP_ID_ATTRIBUTE_ID` (`attribute_group_id`,`attribute_id`),
  KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTT_ATTR_ATTR_GROUP_ID_EAV_ATTR_GROUP_ATTR_GROUP_ID` FOREIGN KEY (`attribute_group_id`) REFERENCES `eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Attributes';

LOCK TABLES `eav_entity_attribute` WRITE;
/*!40000 ALTER TABLE `eav_entity_attribute` DISABLE KEYS */;

INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`)
VALUES
	(1,1,1,1,1,10),
	(2,1,1,1,2,20),
	(3,1,1,1,3,20),
	(4,1,1,1,4,30),
	(5,1,1,1,5,40),
	(6,1,1,1,6,50),
	(7,1,1,1,7,60),
	(8,1,1,1,8,70),
	(9,1,1,1,9,80),
	(10,1,1,1,10,25),
	(11,1,1,1,11,90),
	(12,1,1,1,12,81),
	(13,1,1,1,13,115),
	(14,1,1,1,14,120),
	(15,1,1,1,15,82),
	(16,1,1,1,16,83),
	(17,1,1,1,17,100),
	(18,1,1,1,18,0),
	(19,1,1,1,19,0),
	(20,1,1,1,20,110),
	(21,1,1,1,21,28),
	(22,2,2,2,22,10),
	(23,2,2,2,23,20),
	(24,2,2,2,24,30),
	(25,2,2,2,25,40),
	(26,2,2,2,26,50),
	(27,2,2,2,27,60),
	(28,2,2,2,28,70),
	(29,2,2,2,29,80),
	(30,2,2,2,30,90),
	(31,2,2,2,31,100),
	(32,2,2,2,32,100),
	(33,2,2,2,33,110),
	(34,2,2,2,34,120),
	(35,2,2,2,35,130),
	(36,2,2,2,36,140),
	(37,2,2,2,37,132),
	(38,2,2,2,38,133),
	(39,2,2,2,39,134),
	(40,2,2,2,40,135),
	(41,1,1,1,41,87),
	(42,1,1,1,42,100),
	(43,1,1,1,43,110),
	(44,1,1,1,44,120),
	(45,3,3,4,45,1),
	(46,3,3,4,46,2),
	(47,3,3,4,47,4),
	(48,3,3,4,48,5),
	(49,3,3,4,49,6),
	(50,3,3,4,50,7),
	(51,3,3,4,51,8),
	(52,3,3,5,52,10),
	(53,3,3,5,53,20),
	(54,3,3,5,54,30),
	(55,3,3,4,55,12),
	(56,3,3,4,56,13),
	(57,3,3,4,57,14),
	(58,3,3,4,58,15),
	(59,3,3,4,59,16),
	(60,3,3,6,60,10),
	(61,3,3,6,61,30),
	(62,3,3,6,62,40),
	(63,3,3,6,63,50),
	(64,3,3,6,64,60),
	(65,3,3,4,65,24),
	(66,3,3,4,66,25),
	(67,3,3,5,67,40),
	(68,3,3,5,68,50),
	(69,3,3,4,69,10),
	(70,3,3,6,70,5),
	(71,3,3,6,71,6),
	(72,3,3,5,72,51),
	(73,4,4,7,73,10),
	(74,4,4,7,74,20),
	(75,4,4,13,75,90),
	(76,4,4,13,76,100),
	(77,4,4,7,77,30),
	(78,4,4,8,78,3),
	(79,4,4,8,79,4),
	(80,4,4,8,80,5),
	(81,4,4,8,81,6),
	(82,4,4,7,82,70),
	(83,4,4,9,84,20),
	(84,4,4,9,85,30),
	(85,4,4,9,86,40),
	(86,4,4,10,87,1),
	(87,4,4,10,88,2),
	(88,4,4,10,89,3),
	(89,4,4,10,90,4),
	(90,4,4,7,91,6),
	(91,4,4,8,92,7),
	(92,4,4,7,94,90),
	(93,4,4,7,95,100),
	(94,4,4,10,96,5),
	(95,4,4,7,97,5),
	(96,4,4,8,98,8),
	(97,4,4,7,99,80),
	(98,4,4,14,100,40),
	(99,4,4,14,101,20),
	(100,4,4,14,102,30),
	(101,4,4,11,103,10),
	(102,4,4,11,104,5),
	(103,4,4,7,105,80),
	(104,4,4,11,106,6),
	(105,4,4,7,107,14),
	(106,4,4,7,108,15),
	(107,4,4,7,109,16),
	(108,4,4,7,110,17),
	(109,4,4,7,111,18),
	(110,4,4,7,112,19),
	(111,4,4,7,113,20),
	(112,4,4,7,114,110),
	(113,4,4,7,115,60),
	(114,4,4,14,116,50),
	(115,3,3,4,117,3),
	(116,3,3,4,118,17),
	(117,4,4,9,119,10),
	(118,4,4,7,120,11),
	(119,4,4,8,121,9),
	(120,4,4,8,122,10),
	(121,4,4,7,123,31),
	(122,4,4,7,124,21),
	(123,4,4,7,125,71),
	(124,4,4,8,126,11),
	(125,4,4,15,127,1),
	(126,4,4,7,128,111),
	(127,4,4,7,129,112),
	(128,4,4,7,130,113),
	(129,4,4,7,131,114),
	(130,4,4,20,132,10),
	(131,4,4,10,133,3),
	(132,4,4,7,134,40);

/*!40000 ALTER TABLE `eav_entity_attribute` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table eav_entity_datetime
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eav_entity_datetime`;

CREATE TABLE `eav_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_DATETIME_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_DATETIME_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_DATETIME_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_DATETIME_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTT_DTIME_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';



# Dump of table eav_entity_decimal
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eav_entity_decimal`;

CREATE TABLE `eav_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_DECIMAL_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_DECIMAL_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';



# Dump of table eav_entity_int
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eav_entity_int`;

CREATE TABLE `eav_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_INT_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_INT_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_INT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_INT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';



# Dump of table eav_entity_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eav_entity_store`;

CREATE TABLE `eav_entity_store` (
  `entity_store_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Store Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `increment_prefix` varchar(20) DEFAULT NULL COMMENT 'Increment Prefix',
  `increment_last_id` varchar(50) DEFAULT NULL COMMENT 'Last Incremented Id',
  PRIMARY KEY (`entity_store_id`),
  KEY `EAV_ENTITY_STORE_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ENTITY_STORE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Store';



# Dump of table eav_entity_text
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eav_entity_text`;

CREATE TABLE `eav_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `EAV_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ENTITY_TEXT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_TEXT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';



# Dump of table eav_entity_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eav_entity_type`;

CREATE TABLE `eav_entity_type` (
  `entity_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Type Id',
  `entity_type_code` varchar(50) NOT NULL COMMENT 'Entity Type Code',
  `entity_model` varchar(255) NOT NULL COMMENT 'Entity Model',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `entity_table` varchar(255) DEFAULT NULL COMMENT 'Entity Table',
  `value_table_prefix` varchar(255) DEFAULT NULL COMMENT 'Value Table Prefix',
  `entity_id_field` varchar(255) DEFAULT NULL COMMENT 'Entity Id Field',
  `is_data_sharing` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Data Sharing',
  `data_sharing_key` varchar(100) DEFAULT 'default' COMMENT 'Data Sharing Key',
  `default_attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Attribute Set Id',
  `increment_model` varchar(255) DEFAULT NULL COMMENT 'Increment Model',
  `increment_per_store` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Increment Per Store',
  `increment_pad_length` smallint(5) unsigned NOT NULL DEFAULT '8' COMMENT 'Increment Pad Length',
  `increment_pad_char` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Increment Pad Char',
  `additional_attribute_table` varchar(255) DEFAULT NULL COMMENT 'Additional Attribute Table',
  `entity_attribute_collection` varchar(255) DEFAULT NULL COMMENT 'Entity Attribute Collection',
  PRIMARY KEY (`entity_type_id`),
  KEY `EAV_ENTITY_TYPE_ENTITY_TYPE_CODE` (`entity_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Type';

LOCK TABLES `eav_entity_type` WRITE;
/*!40000 ALTER TABLE `eav_entity_type` DISABLE KEYS */;

INSERT INTO `eav_entity_type` (`entity_type_id`, `entity_type_code`, `entity_model`, `attribute_model`, `entity_table`, `value_table_prefix`, `entity_id_field`, `is_data_sharing`, `data_sharing_key`, `default_attribute_set_id`, `increment_model`, `increment_per_store`, `increment_pad_length`, `increment_pad_char`, `additional_attribute_table`, `entity_attribute_collection`)
VALUES
	(1,'customer','Magento\\Customer\\Model\\ResourceModel\\Customer','Magento\\Customer\\Model\\Attribute','customer_entity',NULL,NULL,1,'default',1,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',0,8,'0','customer_eav_attribute','Magento\\Customer\\Model\\ResourceModel\\Attribute\\Collection'),
	(2,'customer_address','Magento\\Customer\\Model\\ResourceModel\\Address','Magento\\Customer\\Model\\Attribute','customer_address_entity',NULL,NULL,1,'default',2,NULL,0,8,'0','customer_eav_attribute','Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Collection'),
	(3,'catalog_category','Magento\\Catalog\\Model\\ResourceModel\\Category','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute','catalog_category_entity',NULL,NULL,1,'default',3,NULL,0,8,'0','catalog_eav_attribute','Magento\\Catalog\\Model\\ResourceModel\\Category\\Attribute\\Collection'),
	(4,'catalog_product','Magento\\Catalog\\Model\\ResourceModel\\Product','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute','catalog_product_entity',NULL,NULL,1,'default',4,NULL,0,8,'0','catalog_eav_attribute','Magento\\Catalog\\Model\\ResourceModel\\Product\\Attribute\\Collection'),
	(5,'order','Magento\\Sales\\Model\\ResourceModel\\Order',NULL,'sales_order',NULL,NULL,1,'default',5,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL),
	(6,'invoice','Magento\\Sales\\Model\\ResourceModel\\Order',NULL,'sales_invoice',NULL,NULL,1,'default',6,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL),
	(7,'creditmemo','Magento\\Sales\\Model\\ResourceModel\\Order\\Creditmemo',NULL,'sales_creditmemo',NULL,NULL,1,'default',7,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL),
	(8,'shipment','Magento\\Sales\\Model\\ResourceModel\\Order\\Shipment',NULL,'sales_shipment',NULL,NULL,1,'default',8,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL);

/*!40000 ALTER TABLE `eav_entity_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table eav_entity_varchar
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eav_entity_varchar`;

CREATE TABLE `eav_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_VARCHAR_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_VARCHAR_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';



# Dump of table eav_form_element
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eav_form_element`;

CREATE TABLE `eav_form_element` (
  `element_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Element Id',
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `fieldset_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Fieldset Id',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`element_id`),
  UNIQUE KEY `EAV_FORM_ELEMENT_TYPE_ID_ATTRIBUTE_ID` (`type_id`,`attribute_id`),
  KEY `EAV_FORM_ELEMENT_FIELDSET_ID` (`fieldset_id`),
  KEY `EAV_FORM_ELEMENT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `EAV_FORM_ELEMENT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_FORM_ELEMENT_FIELDSET_ID_EAV_FORM_FIELDSET_FIELDSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE SET NULL,
  CONSTRAINT `EAV_FORM_ELEMENT_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Element';

LOCK TABLES `eav_form_element` WRITE;
/*!40000 ALTER TABLE `eav_form_element` DISABLE KEYS */;

INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`)
VALUES
	(1,1,NULL,23,0),
	(2,1,NULL,25,1),
	(3,1,NULL,27,2),
	(4,1,NULL,9,3),
	(5,1,NULL,28,4),
	(6,1,NULL,29,5),
	(7,1,NULL,31,6),
	(8,1,NULL,33,7),
	(9,1,NULL,30,8),
	(10,1,NULL,34,9),
	(11,1,NULL,35,10),
	(12,2,NULL,23,0),
	(13,2,NULL,25,1),
	(14,2,NULL,27,2),
	(15,2,NULL,9,3),
	(16,2,NULL,28,4),
	(17,2,NULL,29,5),
	(18,2,NULL,31,6),
	(19,2,NULL,33,7),
	(20,2,NULL,30,8),
	(21,2,NULL,34,9),
	(22,2,NULL,35,10),
	(23,3,NULL,23,0),
	(24,3,NULL,25,1),
	(25,3,NULL,27,2),
	(26,3,NULL,28,3),
	(27,3,NULL,29,4),
	(28,3,NULL,31,5),
	(29,3,NULL,33,6),
	(30,3,NULL,30,7),
	(31,3,NULL,34,8),
	(32,3,NULL,35,9),
	(33,4,NULL,23,0),
	(34,4,NULL,25,1),
	(35,4,NULL,27,2),
	(36,4,NULL,28,3),
	(37,4,NULL,29,4),
	(38,4,NULL,31,5),
	(39,4,NULL,33,6),
	(40,4,NULL,30,7),
	(41,4,NULL,34,8),
	(42,4,NULL,35,9);

/*!40000 ALTER TABLE `eav_form_element` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table eav_form_fieldset
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eav_form_fieldset`;

CREATE TABLE `eav_form_fieldset` (
  `fieldset_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Fieldset Id',
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`fieldset_id`),
  UNIQUE KEY `EAV_FORM_FIELDSET_TYPE_ID_CODE` (`type_id`,`code`),
  CONSTRAINT `EAV_FORM_FIELDSET_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset';



# Dump of table eav_form_fieldset_label
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eav_form_fieldset_label`;

CREATE TABLE `eav_form_fieldset_label` (
  `fieldset_id` smallint(5) unsigned NOT NULL COMMENT 'Fieldset Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`fieldset_id`,`store_id`),
  KEY `EAV_FORM_FIELDSET_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_FORM_FIELDSET_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_FORM_FSET_LBL_FSET_ID_EAV_FORM_FSET_FSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset Label';



# Dump of table eav_form_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eav_form_type`;

CREATE TABLE `eav_form_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  `is_system` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `theme` varchar(64) DEFAULT NULL COMMENT 'Theme',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `EAV_FORM_TYPE_CODE_THEME_STORE_ID` (`code`,`theme`,`store_id`),
  KEY `EAV_FORM_TYPE_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_FORM_TYPE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Type';

LOCK TABLES `eav_form_type` WRITE;
/*!40000 ALTER TABLE `eav_form_type` DISABLE KEYS */;

INSERT INTO `eav_form_type` (`type_id`, `code`, `label`, `is_system`, `theme`, `store_id`)
VALUES
	(1,'checkout_onepage_register','checkout_onepage_register',1,'',0),
	(2,'checkout_onepage_register_guest','checkout_onepage_register_guest',1,'',0),
	(3,'checkout_onepage_billing_address','checkout_onepage_billing_address',1,'',0),
	(4,'checkout_onepage_shipping_address','checkout_onepage_shipping_address',1,'',0);

/*!40000 ALTER TABLE `eav_form_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table eav_form_type_entity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eav_form_type_entity`;

CREATE TABLE `eav_form_type_entity` (
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `entity_type_id` smallint(5) unsigned NOT NULL COMMENT 'Entity Type Id',
  PRIMARY KEY (`type_id`,`entity_type_id`),
  KEY `EAV_FORM_TYPE_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  CONSTRAINT `EAV_FORM_TYPE_ENTITY_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_FORM_TYPE_ENTT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Type Entity';

LOCK TABLES `eav_form_type_entity` WRITE;
/*!40000 ALTER TABLE `eav_form_type_entity` DISABLE KEYS */;

INSERT INTO `eav_form_type_entity` (`type_id`, `entity_type_id`)
VALUES
	(1,1),
	(2,1),
	(1,2),
	(2,2),
	(3,2),
	(4,2);

/*!40000 ALTER TABLE `eav_form_type_entity` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table email_template
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_template`;

CREATE TABLE `email_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template ID',
  `template_code` varchar(150) NOT NULL COMMENT 'Template Name',
  `template_text` text NOT NULL COMMENT 'Template Content',
  `template_styles` text COMMENT 'Templste Styles',
  `template_type` int(10) unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) NOT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of Template Creation',
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Template Modification',
  `orig_template_code` varchar(200) DEFAULT NULL COMMENT 'Original Template Code',
  `orig_template_variables` text COMMENT 'Original Template Variables',
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `EMAIL_TEMPLATE_TEMPLATE_CODE` (`template_code`),
  KEY `EMAIL_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `EMAIL_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email Templates';



# Dump of table flag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `flag`;

CREATE TABLE `flag` (
  `flag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Flag Id',
  `flag_code` varchar(255) NOT NULL COMMENT 'Flag Code',
  `state` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag State',
  `flag_data` text COMMENT 'Flag Data',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Last Flag Update',
  PRIMARY KEY (`flag_id`),
  KEY `FLAG_LAST_UPDATE` (`last_update`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Flag';



# Dump of table getresponse_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `getresponse_account`;

CREATE TABLE `getresponse_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `id_shop` int(11) NOT NULL COMMENT 'Id shop',
  `account_id` text COMMENT 'Id',
  `first_name` text COMMENT 'First name',
  `last_name` text COMMENT 'Last name',
  `email` text NOT NULL COMMENT 'Email',
  `company_name` text COMMENT 'Company name',
  `phone` text COMMENT 'Phone',
  `state` text COMMENT 'First name',
  `city` text COMMENT 'First name',
  `street` text COMMENT 'First name',
  `zip_code` text COMMENT 'First name',
  `country_code` text COMMENT 'First name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='getresponse_account';



# Dump of table getresponse_automation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `getresponse_automation`;

CREATE TABLE `getresponse_automation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `id_shop` int(11) NOT NULL COMMENT 'Id shop',
  `category_id` int(11) NOT NULL COMMENT 'Category id',
  `campaign_id` text NOT NULL COMMENT 'Campaign id',
  `action` text NOT NULL COMMENT 'Action type',
  `cycle_day` text COMMENT 'GR campaign cycle day',
  `active` tinyint(1) NOT NULL COMMENT 'active flag',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='getresponse_automation';



# Dump of table getresponse_customs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `getresponse_customs`;

CREATE TABLE `getresponse_customs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `id_shop` int(11) NOT NULL COMMENT 'Id shop',
  `custom_field` text NOT NULL COMMENT 'Custom field',
  `custom_value` text NOT NULL COMMENT 'Custom field value',
  `custom_name` text NOT NULL COMMENT 'Custom field name',
  `default` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'default field',
  `active_custom` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Active custom field',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='getresponse_customs';

LOCK TABLES `getresponse_customs` WRITE;
/*!40000 ALTER TABLE `getresponse_customs` DISABLE KEYS */;

INSERT INTO `getresponse_customs` (`id`, `id_shop`, `custom_field`, `custom_value`, `custom_name`, `default`, `active_custom`)
VALUES
	(1,1,'firstname','firstname','firstname',1,1),
	(2,1,'lastname','lastname','lastname',1,1),
	(3,1,'email','email','email',1,1),
	(4,1,'street','street','magento_street',0,0),
	(5,1,'postcode','postcode','magento_postcode',0,0),
	(6,1,'city','city','magento_city',0,0),
	(7,1,'telephone','telephone','magento_telephone',0,0),
	(8,1,'country','country','magento_country',0,0),
	(9,1,'birthday','birthday','magento_birthday',0,0);

/*!40000 ALTER TABLE `getresponse_customs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table getresponse_product_map
# ------------------------------------------------------------

DROP TABLE IF EXISTS `getresponse_product_map`;

CREATE TABLE `getresponse_product_map` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `gr_shop_id` varchar(32) DEFAULT NULL COMMENT 'GetResponse shop ID',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `gr_product_id` varchar(32) DEFAULT NULL COMMENT 'GetResponse product ID',
  PRIMARY KEY (`id`),
  KEY `GETRESPONSE_PRD_MAP_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` (`entity_id`),
  CONSTRAINT `GETRESPONSE_PRD_MAP_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='getresponse_product_map';



# Dump of table getresponse_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `getresponse_settings`;

CREATE TABLE `getresponse_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `id_shop` int(11) NOT NULL COMMENT 'Id shop',
  `api_key` text NOT NULL COMMENT 'GR Api Key',
  `api_url` text COMMENT 'GR Api Url',
  `api_domain` text COMMENT 'GR Api Domain',
  `active_subscription` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Active subscription',
  `update` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Update custom fields',
  `cycle_day` text COMMENT 'GR campaign cycle day',
  `campaign_id` text NOT NULL COMMENT 'GR campaign id',
  `feature_tracking` varchar(16) NOT NULL DEFAULT 'disabled' COMMENT 'Tracking feature enabled in GetResponse',
  `web_traffic` varchar(16) NOT NULL DEFAULT 'disabled' COMMENT 'Web tracking enabled in plugin',
  `tracking_code_snippet` text COMMENT 'Tracking code snippet',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='getresponse_settings';



# Dump of table getresponse_webform
# ------------------------------------------------------------

DROP TABLE IF EXISTS `getresponse_webform`;

CREATE TABLE `getresponse_webform` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `id_shop` int(11) NOT NULL COMMENT 'Id shop',
  `webform_id` text NOT NULL COMMENT 'Webform id',
  `active_subscription` tinyint(1) NOT NULL COMMENT 'Active subscription flag',
  `sidebar` text NOT NULL COMMENT 'Sidebar name',
  `style` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Webform style',
  `url` text NOT NULL COMMENT 'Url to webform',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='getresponse_webform';



# Dump of table gift_message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gift_message`;

CREATE TABLE `gift_message` (
  `gift_message_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'GiftMessage Id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `sender` varchar(255) DEFAULT NULL COMMENT 'Sender',
  `recipient` varchar(255) DEFAULT NULL COMMENT 'Registrant',
  `message` text COMMENT 'Message',
  PRIMARY KEY (`gift_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gift Message';



# Dump of table googleoptimizer_code
# ------------------------------------------------------------

DROP TABLE IF EXISTS `googleoptimizer_code`;

CREATE TABLE `googleoptimizer_code` (
  `code_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Google experiment code id',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Optimized entity id product id or catalog id',
  `entity_type` varchar(50) DEFAULT NULL COMMENT 'Optimized entity type',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store id',
  `experiment_script` text COMMENT 'Google experiment script',
  PRIMARY KEY (`code_id`),
  UNIQUE KEY `GOOGLEOPTIMIZER_CODE_STORE_ID_ENTITY_ID_ENTITY_TYPE` (`store_id`,`entity_id`,`entity_type`),
  CONSTRAINT `GOOGLEOPTIMIZER_CODE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Experiment code';



# Dump of table import_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `import_history`;

CREATE TABLE `import_history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'History record Id',
  `started_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Started at',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User ID',
  `imported_file` varchar(255) DEFAULT NULL COMMENT 'Imported file',
  `execution_time` varchar(255) DEFAULT NULL COMMENT 'Execution time',
  `summary` varchar(255) DEFAULT NULL COMMENT 'Summary',
  `error_file` varchar(255) NOT NULL COMMENT 'Imported file with errors',
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Import history table';



# Dump of table importexport_importdata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `importexport_importdata`;

CREATE TABLE `importexport_importdata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `entity` varchar(50) NOT NULL COMMENT 'Entity',
  `behavior` varchar(10) NOT NULL DEFAULT 'append' COMMENT 'Behavior',
  `data` longtext COMMENT 'Data',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Import Data Table';



# Dump of table indexer_state
# ------------------------------------------------------------

DROP TABLE IF EXISTS `indexer_state`;

CREATE TABLE `indexer_state` (
  `state_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Indexer State Id',
  `indexer_id` varchar(255) DEFAULT NULL COMMENT 'Indexer Id',
  `status` varchar(16) DEFAULT 'invalid' COMMENT 'Indexer Status',
  `updated` datetime DEFAULT NULL COMMENT 'Indexer Status',
  `hash_config` varchar(32) NOT NULL COMMENT 'Hash of indexer config',
  PRIMARY KEY (`state_id`),
  KEY `INDEXER_STATE_INDEXER_ID` (`indexer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Indexer State';

LOCK TABLES `indexer_state` WRITE;
/*!40000 ALTER TABLE `indexer_state` DISABLE KEYS */;

INSERT INTO `indexer_state` (`state_id`, `indexer_id`, `status`, `updated`, `hash_config`)
VALUES
	(1,'design_config_grid','valid','2017-11-03 17:57:37','34ec592bfa6c952bed4d0a1d58c98770'),
	(2,'customer_grid','valid','2017-11-03 17:57:37','b9632e06cf957d6e8103eb236ca38cc1'),
	(3,'catalog_category_product','invalid','2017-11-03 17:57:37','2124d5bfcd83b609c67eee94a0e4708c'),
	(4,'catalog_product_category','invalid','2017-11-03 17:57:37','77b6356629f3259568a68ea64c773238'),
	(5,'catalog_product_price','invalid','2017-11-03 17:57:37','2c3434338353a47cb4c5783800c0bdbe'),
	(6,'catalog_product_attribute','invalid','2017-11-03 17:57:37','f73cae77ec4dee3b587a60a2f38dd26a'),
	(7,'cataloginventory_stock','invalid','2017-11-03 17:57:37','1bf66e64558a5171e523b32f25cb99ca'),
	(8,'catalogrule_rule','invalid','2017-11-03 17:57:37','c4f8344a2e6a7d8ebc065631454a4724'),
	(9,'catalogrule_product','invalid','2017-11-03 17:57:37','667205576ee3764b1ee81c4a076d10ae'),
	(10,'catalogsearch_fulltext','valid','2017-11-03 17:57:48','cc2d2701487ee835df4e72b15254852b');

/*!40000 ALTER TABLE `indexer_state` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table integration
# ------------------------------------------------------------

DROP TABLE IF EXISTS `integration`;

CREATE TABLE `integration` (
  `integration_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Integration ID',
  `name` varchar(255) NOT NULL COMMENT 'Integration name is displayed in the admin interface',
  `email` varchar(255) NOT NULL COMMENT 'Email address of the contact person',
  `endpoint` varchar(255) DEFAULT NULL COMMENT 'Endpoint for posting consumer credentials',
  `status` smallint(5) unsigned NOT NULL COMMENT 'Integration status',
  `consumer_id` int(10) unsigned DEFAULT NULL COMMENT 'Oauth consumer',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `setup_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Integration type - manual or config file',
  `identity_link_url` varchar(255) DEFAULT NULL COMMENT 'Identity linking Url',
  PRIMARY KEY (`integration_id`),
  UNIQUE KEY `INTEGRATION_NAME` (`name`),
  UNIQUE KEY `INTEGRATION_CONSUMER_ID` (`consumer_id`),
  CONSTRAINT `INTEGRATION_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_consumer` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='integration';



# Dump of table layout_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `layout_link`;

CREATE TABLE `layout_link` (
  `layout_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme id',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update Id',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Defines whether Layout Update is Temporary',
  PRIMARY KEY (`layout_link_id`),
  KEY `LAYOUT_LINK_LAYOUT_UPDATE_ID` (`layout_update_id`),
  KEY `LAYOUT_LINK_STORE_ID_THEME_ID_LAYOUT_UPDATE_ID_IS_TEMPORARY` (`store_id`,`theme_id`,`layout_update_id`,`is_temporary`),
  KEY `LAYOUT_LINK_THEME_ID_THEME_THEME_ID` (`theme_id`),
  CONSTRAINT `LAYOUT_LINK_LAYOUT_UPDATE_ID_LAYOUT_UPDATE_LAYOUT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `layout_update` (`layout_update_id`) ON DELETE CASCADE,
  CONSTRAINT `LAYOUT_LINK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `LAYOUT_LINK_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`theme_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Link';



# Dump of table layout_update
# ------------------------------------------------------------

DROP TABLE IF EXISTS `layout_update`;

CREATE TABLE `layout_update` (
  `layout_update_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Layout Update Id',
  `handle` varchar(255) DEFAULT NULL COMMENT 'Handle',
  `xml` text COMMENT 'Xml',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp',
  PRIMARY KEY (`layout_update_id`),
  KEY `LAYOUT_UPDATE_HANDLE` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Updates';



# Dump of table mview_state
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mview_state`;

CREATE TABLE `mview_state` (
  `state_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'View State Id',
  `view_id` varchar(255) DEFAULT NULL COMMENT 'View Id',
  `mode` varchar(16) DEFAULT 'disabled' COMMENT 'View Mode',
  `status` varchar(16) DEFAULT 'idle' COMMENT 'View Status',
  `updated` datetime DEFAULT NULL COMMENT 'View updated time',
  `version_id` int(10) unsigned DEFAULT NULL COMMENT 'View Version Id',
  PRIMARY KEY (`state_id`),
  KEY `MVIEW_STATE_VIEW_ID` (`view_id`),
  KEY `MVIEW_STATE_MODE` (`mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='View State';



# Dump of table newsletter_problem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `newsletter_problem`;

CREATE TABLE `newsletter_problem` (
  `problem_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Problem Id',
  `subscriber_id` int(10) unsigned DEFAULT NULL COMMENT 'Subscriber Id',
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `problem_error_code` int(10) unsigned DEFAULT '0' COMMENT 'Problem Error Code',
  `problem_error_text` varchar(200) DEFAULT NULL COMMENT 'Problem Error Text',
  PRIMARY KEY (`problem_id`),
  KEY `NEWSLETTER_PROBLEM_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `NEWSLETTER_PROBLEM_QUEUE_ID` (`queue_id`),
  CONSTRAINT `NEWSLETTER_PROBLEM_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  CONSTRAINT `NLTTR_PROBLEM_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Problems';



# Dump of table newsletter_queue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `newsletter_queue`;

CREATE TABLE `newsletter_queue` (
  `queue_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Id',
  `template_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Template ID',
  `newsletter_type` int(11) DEFAULT NULL COMMENT 'Newsletter Type',
  `newsletter_text` text COMMENT 'Newsletter Text',
  `newsletter_styles` text COMMENT 'Newsletter Styles',
  `newsletter_subject` varchar(200) DEFAULT NULL COMMENT 'Newsletter Subject',
  `newsletter_sender_name` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Name',
  `newsletter_sender_email` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Email',
  `queue_status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Status',
  `queue_start_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Start At',
  `queue_finish_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Finish At',
  PRIMARY KEY (`queue_id`),
  KEY `NEWSLETTER_QUEUE_TEMPLATE_ID` (`template_id`),
  CONSTRAINT `NEWSLETTER_QUEUE_TEMPLATE_ID_NEWSLETTER_TEMPLATE_TEMPLATE_ID` FOREIGN KEY (`template_id`) REFERENCES `newsletter_template` (`template_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue';



# Dump of table newsletter_queue_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `newsletter_queue_link`;

CREATE TABLE `newsletter_queue_link` (
  `queue_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Link Id',
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `subscriber_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Subscriber Id',
  `letter_sent_at` timestamp NULL DEFAULT NULL COMMENT 'Letter Sent At',
  PRIMARY KEY (`queue_link_id`),
  KEY `NEWSLETTER_QUEUE_LINK_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `NEWSLETTER_QUEUE_LINK_QUEUE_ID_LETTER_SENT_AT` (`queue_id`,`letter_sent_at`),
  CONSTRAINT `NEWSLETTER_QUEUE_LINK_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  CONSTRAINT `NLTTR_QUEUE_LNK_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Link';



# Dump of table newsletter_queue_store_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `newsletter_queue_store_link`;

CREATE TABLE `newsletter_queue_store_link` (
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  PRIMARY KEY (`queue_id`,`store_id`),
  KEY `NEWSLETTER_QUEUE_STORE_LINK_STORE_ID` (`store_id`),
  CONSTRAINT `NEWSLETTER_QUEUE_STORE_LINK_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  CONSTRAINT `NEWSLETTER_QUEUE_STORE_LINK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Store Link';



# Dump of table newsletter_subscriber
# ------------------------------------------------------------

DROP TABLE IF EXISTS `newsletter_subscriber`;

CREATE TABLE `newsletter_subscriber` (
  `subscriber_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Subscriber Id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store Id',
  `change_status_at` timestamp NULL DEFAULT NULL COMMENT 'Change Status At',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `subscriber_email` varchar(150) DEFAULT NULL COMMENT 'Subscriber Email',
  `subscriber_status` int(11) NOT NULL DEFAULT '0' COMMENT 'Subscriber Status',
  `subscriber_confirm_code` varchar(32) DEFAULT 'NULL' COMMENT 'Subscriber Confirm Code',
  PRIMARY KEY (`subscriber_id`),
  KEY `NEWSLETTER_SUBSCRIBER_CUSTOMER_ID` (`customer_id`),
  KEY `NEWSLETTER_SUBSCRIBER_STORE_ID` (`store_id`),
  CONSTRAINT `NEWSLETTER_SUBSCRIBER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Subscriber';



# Dump of table newsletter_template
# ------------------------------------------------------------

DROP TABLE IF EXISTS `newsletter_template`;

CREATE TABLE `newsletter_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template ID',
  `template_code` varchar(150) DEFAULT NULL COMMENT 'Template Code',
  `template_text` text COMMENT 'Template Text',
  `template_styles` text COMMENT 'Template Styles',
  `template_type` int(10) unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) DEFAULT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `template_actual` smallint(5) unsigned DEFAULT '1' COMMENT 'Template Actual',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Added At',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Modified At',
  PRIMARY KEY (`template_id`),
  KEY `NEWSLETTER_TEMPLATE_TEMPLATE_ACTUAL` (`template_actual`),
  KEY `NEWSLETTER_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `NEWSLETTER_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Template';



# Dump of table oauth_consumer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_consumer`;

CREATE TABLE `oauth_consumer` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `name` varchar(255) NOT NULL COMMENT 'Name of consumer',
  `key` varchar(32) NOT NULL COMMENT 'Key code',
  `secret` varchar(32) NOT NULL COMMENT 'Secret code',
  `callback_url` text COMMENT 'Callback URL',
  `rejected_callback_url` text NOT NULL COMMENT 'Rejected callback URL',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `OAUTH_CONSUMER_KEY` (`key`),
  UNIQUE KEY `OAUTH_CONSUMER_SECRET` (`secret`),
  KEY `OAUTH_CONSUMER_CREATED_AT` (`created_at`),
  KEY `OAUTH_CONSUMER_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Consumers';



# Dump of table oauth_nonce
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_nonce`;

CREATE TABLE `oauth_nonce` (
  `nonce` varchar(32) NOT NULL COMMENT 'Nonce String',
  `timestamp` int(10) unsigned NOT NULL COMMENT 'Nonce Timestamp',
  `consumer_id` int(10) unsigned NOT NULL COMMENT 'Consumer ID',
  UNIQUE KEY `OAUTH_NONCE_NONCE_CONSUMER_ID` (`nonce`,`consumer_id`),
  KEY `OAUTH_NONCE_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` (`consumer_id`),
  CONSTRAINT `OAUTH_NONCE_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_consumer` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Nonce';



# Dump of table oauth_token
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_token`;

CREATE TABLE `oauth_token` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `consumer_id` int(10) unsigned DEFAULT NULL COMMENT 'Oauth Consumer ID',
  `admin_id` int(10) unsigned DEFAULT NULL COMMENT 'Admin user ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer user ID',
  `type` varchar(16) NOT NULL COMMENT 'Token Type',
  `token` varchar(32) NOT NULL COMMENT 'Token',
  `secret` varchar(32) NOT NULL COMMENT 'Token Secret',
  `verifier` varchar(32) DEFAULT NULL COMMENT 'Token Verifier',
  `callback_url` text NOT NULL COMMENT 'Token Callback URL',
  `revoked` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token revoked',
  `authorized` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token authorized',
  `user_type` int(11) DEFAULT NULL COMMENT 'User type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Token creation timestamp',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `OAUTH_TOKEN_TOKEN` (`token`),
  KEY `OAUTH_TOKEN_CONSUMER_ID` (`consumer_id`),
  KEY `OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` (`admin_id`),
  KEY `OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`customer_id`),
  CONSTRAINT `OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `OAUTH_TOKEN_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_consumer` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Tokens';



# Dump of table oauth_token_request_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_token_request_log`;

CREATE TABLE `oauth_token_request_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log Id',
  `user_name` varchar(255) NOT NULL COMMENT 'Customer email or admin login',
  `user_type` smallint(5) unsigned NOT NULL COMMENT 'User type (admin or customer)',
  `failures_count` smallint(5) unsigned DEFAULT '0' COMMENT 'Number of failed authentication attempts in a row',
  `lock_expires_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Lock expiration time',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `OAUTH_TOKEN_REQUEST_LOG_USER_NAME_USER_TYPE` (`user_name`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log of token request authentication failures.';



# Dump of table password_reset_request_event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_reset_request_event`;

CREATE TABLE `password_reset_request_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `request_type` smallint(5) unsigned NOT NULL COMMENT 'Type of the event under a security control',
  `account_reference` varchar(255) DEFAULT NULL COMMENT 'An identifier for existing account or another target',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp when the event occurs',
  `ip` varchar(15) NOT NULL COMMENT 'Remote user IP',
  PRIMARY KEY (`id`),
  KEY `PASSWORD_RESET_REQUEST_EVENT_ACCOUNT_REFERENCE` (`account_reference`),
  KEY `PASSWORD_RESET_REQUEST_EVENT_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Password Reset Request Event under a security control';



# Dump of table paypal_billing_agreement
# ------------------------------------------------------------

DROP TABLE IF EXISTS `paypal_billing_agreement`;

CREATE TABLE `paypal_billing_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer Id',
  `method_code` varchar(32) NOT NULL COMMENT 'Method Code',
  `reference_id` varchar(32) NOT NULL COMMENT 'Reference Id',
  `status` varchar(20) NOT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `agreement_label` varchar(255) DEFAULT NULL COMMENT 'Agreement Label',
  PRIMARY KEY (`agreement_id`),
  KEY `PAYPAL_BILLING_AGREEMENT_CUSTOMER_ID` (`customer_id`),
  KEY `PAYPAL_BILLING_AGREEMENT_STORE_ID` (`store_id`),
  CONSTRAINT `PAYPAL_BILLING_AGREEMENT_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PAYPAL_BILLING_AGREEMENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement';



# Dump of table paypal_billing_agreement_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `paypal_billing_agreement_order`;

CREATE TABLE `paypal_billing_agreement_order` (
  `agreement_id` int(10) unsigned NOT NULL COMMENT 'Agreement Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  PRIMARY KEY (`agreement_id`,`order_id`),
  KEY `PAYPAL_BILLING_AGREEMENT_ORDER_ORDER_ID` (`order_id`),
  CONSTRAINT `PAYPAL_BILLING_AGREEMENT_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PAYPAL_BILLING_AGRT_ORDER_AGRT_ID_PAYPAL_BILLING_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `paypal_billing_agreement` (`agreement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement Order';



# Dump of table paypal_cert
# ------------------------------------------------------------

DROP TABLE IF EXISTS `paypal_cert`;

CREATE TABLE `paypal_cert` (
  `cert_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Cert Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `content` text COMMENT 'Content',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`cert_id`),
  KEY `PAYPAL_CERT_WEBSITE_ID` (`website_id`),
  CONSTRAINT `PAYPAL_CERT_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Certificate Table';



# Dump of table paypal_payment_transaction
# ------------------------------------------------------------

DROP TABLE IF EXISTS `paypal_payment_transaction`;

CREATE TABLE `paypal_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `PAYPAL_PAYMENT_TRANSACTION_TXN_ID` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='PayPal Payflow Link Payment Transaction';



# Dump of table paypal_settlement_report
# ------------------------------------------------------------

DROP TABLE IF EXISTS `paypal_settlement_report`;

CREATE TABLE `paypal_settlement_report` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Report Id',
  `report_date` date DEFAULT NULL COMMENT 'Report Date',
  `account_id` varchar(64) DEFAULT NULL COMMENT 'Account Id',
  `filename` varchar(24) DEFAULT NULL COMMENT 'Filename',
  `last_modified` timestamp NULL DEFAULT NULL COMMENT 'Last Modified',
  PRIMARY KEY (`report_id`),
  UNIQUE KEY `PAYPAL_SETTLEMENT_REPORT_REPORT_DATE_ACCOUNT_ID` (`report_date`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Table';



# Dump of table paypal_settlement_report_row
# ------------------------------------------------------------

DROP TABLE IF EXISTS `paypal_settlement_report_row`;

CREATE TABLE `paypal_settlement_report_row` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Row Id',
  `report_id` int(10) unsigned NOT NULL COMMENT 'Report Id',
  `transaction_id` varchar(19) DEFAULT NULL COMMENT 'Transaction Id',
  `invoice_id` varchar(127) DEFAULT NULL COMMENT 'Invoice Id',
  `paypal_reference_id` varchar(19) DEFAULT NULL COMMENT 'Paypal Reference Id',
  `paypal_reference_id_type` varchar(3) DEFAULT NULL COMMENT 'Paypal Reference Id Type',
  `transaction_event_code` varchar(5) DEFAULT NULL COMMENT 'Transaction Event Code',
  `transaction_initiation_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Initiation Date',
  `transaction_completion_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Completion Date',
  `transaction_debit_or_credit` varchar(2) NOT NULL DEFAULT 'CR' COMMENT 'Transaction Debit Or Credit',
  `gross_transaction_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Gross Transaction Amount',
  `gross_transaction_currency` varchar(3) DEFAULT NULL COMMENT 'Gross Transaction Currency',
  `fee_debit_or_credit` varchar(2) DEFAULT NULL COMMENT 'Fee Debit Or Credit',
  `fee_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Fee Amount',
  `fee_currency` varchar(3) DEFAULT NULL COMMENT 'Fee Currency',
  `custom_field` varchar(255) DEFAULT NULL COMMENT 'Custom Field',
  `consumer_id` varchar(127) DEFAULT NULL COMMENT 'Consumer Id',
  `payment_tracking_id` varchar(255) DEFAULT NULL COMMENT 'Payment Tracking ID',
  `store_id` varchar(50) DEFAULT NULL COMMENT 'Store ID',
  PRIMARY KEY (`row_id`),
  KEY `PAYPAL_SETTLEMENT_REPORT_ROW_REPORT_ID` (`report_id`),
  CONSTRAINT `FK_E183E488F593E0DE10C6EBFFEBAC9B55` FOREIGN KEY (`report_id`) REFERENCES `paypal_settlement_report` (`report_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Row Table';



# Dump of table persistent_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `persistent_session`;

CREATE TABLE `persistent_session` (
  `persistent_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Session id',
  `key` varchar(50) NOT NULL COMMENT 'Unique cookie key',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `info` text COMMENT 'Session Data',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`persistent_id`),
  UNIQUE KEY `PERSISTENT_SESSION_KEY` (`key`),
  UNIQUE KEY `PERSISTENT_SESSION_CUSTOMER_ID` (`customer_id`),
  KEY `PERSISTENT_SESSION_UPDATED_AT` (`updated_at`),
  KEY `PERSISTENT_SESSION_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `PERSISTENT_SESSION_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PERSISTENT_SESSION_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Persistent Session';



# Dump of table product_alert_price
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_alert_price`;

CREATE TABLE `product_alert_price` (
  `alert_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert price id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price amount',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website id',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `last_send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert last send date',
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert send count',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_price_id`),
  KEY `PRODUCT_ALERT_PRICE_CUSTOMER_ID` (`customer_id`),
  KEY `PRODUCT_ALERT_PRICE_PRODUCT_ID` (`product_id`),
  KEY `PRODUCT_ALERT_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `PRODUCT_ALERT_PRICE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_PRICE_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Price';



# Dump of table product_alert_stock
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_alert_stock`;

CREATE TABLE `product_alert_stock` (
  `alert_stock_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert stock id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website id',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert send date',
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Send Count',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_stock_id`),
  KEY `PRODUCT_ALERT_STOCK_CUSTOMER_ID` (`customer_id`),
  KEY `PRODUCT_ALERT_STOCK_PRODUCT_ID` (`product_id`),
  KEY `PRODUCT_ALERT_STOCK_WEBSITE_ID` (`website_id`),
  CONSTRAINT `PRODUCT_ALERT_STOCK_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_STOCK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_STOCK_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Stock';



# Dump of table quote
# ------------------------------------------------------------

DROP TABLE IF EXISTS `quote`;

CREATE TABLE `quote` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `converted_at` timestamp NULL DEFAULT NULL COMMENT 'Converted At',
  `is_active` smallint(5) unsigned DEFAULT '1' COMMENT 'Is Active',
  `is_virtual` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Virtual',
  `is_multi_shipping` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Multi Shipping',
  `items_count` int(10) unsigned DEFAULT '0' COMMENT 'Items Count',
  `items_qty` decimal(12,4) DEFAULT '0.0000' COMMENT 'Items Qty',
  `orig_order_id` int(10) unsigned DEFAULT '0' COMMENT 'Orig Order Id',
  `store_to_base_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Base Rate',
  `store_to_quote_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Quote Rate',
  `base_currency_code` varchar(255) DEFAULT NULL COMMENT 'Base Currency Code',
  `store_currency_code` varchar(255) DEFAULT NULL COMMENT 'Store Currency Code',
  `quote_currency_code` varchar(255) DEFAULT NULL COMMENT 'Quote Currency Code',
  `grand_total` decimal(12,4) DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `checkout_method` varchar(255) DEFAULT NULL COMMENT 'Checkout Method',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `customer_tax_class_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Tax Class Id',
  `customer_group_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Group Id',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_prefix` varchar(40) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_firstname` varchar(255) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_middlename` varchar(40) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_lastname` varchar(255) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_suffix` varchar(40) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `customer_note` varchar(255) DEFAULT NULL COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT '1' COMMENT 'Customer Note Notify',
  `customer_is_guest` smallint(5) unsigned DEFAULT '0' COMMENT 'Customer Is Guest',
  `remote_ip` varchar(32) DEFAULT NULL COMMENT 'Remote Ip',
  `applied_rule_ids` varchar(255) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `reserved_order_id` varchar(64) DEFAULT NULL COMMENT 'Reserved Order Id',
  `password_hash` varchar(255) DEFAULT NULL COMMENT 'Password Hash',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `global_currency_code` varchar(255) DEFAULT NULL COMMENT 'Global Currency Code',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_quote_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Quote Rate',
  `customer_taxvat` varchar(255) DEFAULT NULL COMMENT 'Customer Taxvat',
  `customer_gender` varchar(255) DEFAULT NULL COMMENT 'Customer Gender',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal With Discount',
  `is_changed` int(10) unsigned DEFAULT NULL COMMENT 'Is Changed',
  `trigger_recollect` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Trigger Recollect',
  `ext_shipping_info` text COMMENT 'Ext Shipping Info',
  `is_persistent` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Quote Persistent',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `getresponse_cart_id` varchar(32) DEFAULT NULL COMMENT 'GetResponse cart id',
  PRIMARY KEY (`entity_id`),
  KEY `QUOTE_CUSTOMER_ID_STORE_ID_IS_ACTIVE` (`customer_id`,`store_id`,`is_active`),
  KEY `QUOTE_STORE_ID` (`store_id`),
  CONSTRAINT `QUOTE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote';



# Dump of table quote_address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `quote_address`;

CREATE TABLE `quote_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `save_in_address_book` smallint(6) DEFAULT '0' COMMENT 'Save In Address Book',
  `customer_address_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Address Id',
  `address_type` varchar(10) DEFAULT NULL COMMENT 'Address Type',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Prefix',
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(40) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(40) DEFAULT NULL COMMENT 'City',
  `region` varchar(40) DEFAULT NULL COMMENT 'Region',
  `region_id` int(10) unsigned DEFAULT NULL COMMENT 'Region Id',
  `postcode` varchar(20) DEFAULT NULL COMMENT 'Postcode',
  `country_id` varchar(30) DEFAULT NULL COMMENT 'Country Id',
  `telephone` varchar(20) DEFAULT NULL COMMENT 'Phone Number',
  `fax` varchar(20) DEFAULT NULL COMMENT 'Fax',
  `same_as_billing` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Same As Billing',
  `collect_shipping_rates` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Collect Shipping Rates',
  `shipping_method` varchar(120) DEFAULT NULL,
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Weight',
  `subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal With Discount',
  `tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Shipping Amount',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Shipping Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `customer_notes` text COMMENT 'Customer Notes',
  `applied_taxes` text COMMENT 'Applied Taxes',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`address_id`),
  KEY `QUOTE_ADDRESS_QUOTE_ID` (`quote_id`),
  CONSTRAINT `QUOTE_ADDRESS_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address';



# Dump of table quote_address_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `quote_address_item`;

CREATE TABLE `quote_address_item` (
  `address_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address Item Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Address Id',
  `quote_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Item Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `super_product_id` int(10) unsigned DEFAULT NULL COMMENT 'Super Product Id',
  `parent_product_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Product Id',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `is_qty_decimal` int(10) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `discount_percent` decimal(12,4) DEFAULT NULL COMMENT 'Discount Percent',
  `no_discount` int(10) unsigned DEFAULT NULL COMMENT 'No Discount',
  `tax_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tax Percent',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `free_shipping` int(10) unsigned DEFAULT NULL COMMENT 'Free Shipping',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`address_item_id`),
  KEY `QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID` (`quote_address_id`),
  KEY `QUOTE_ADDRESS_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID` (`quote_item_id`),
  CONSTRAINT `QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID_QUOTE_ADDRESS_ADDRESS_ID` FOREIGN KEY (`quote_address_id`) REFERENCES `quote_address` (`address_id`) ON DELETE CASCADE,
  CONSTRAINT `QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`quote_item_id`) REFERENCES `quote_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `QUOTE_ADDR_ITEM_PARENT_ITEM_ID_QUOTE_ADDR_ITEM_ADDR_ITEM_ID` FOREIGN KEY (`parent_item_id`) REFERENCES `quote_address_item` (`address_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address Item';



# Dump of table quote_id_mask
# ------------------------------------------------------------

DROP TABLE IF EXISTS `quote_id_mask`;

CREATE TABLE `quote_id_mask` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `quote_id` int(10) unsigned NOT NULL COMMENT 'Quote ID',
  `masked_id` varchar(32) DEFAULT NULL COMMENT 'Masked ID',
  PRIMARY KEY (`entity_id`,`quote_id`),
  KEY `QUOTE_ID_MASK_QUOTE_ID` (`quote_id`),
  KEY `QUOTE_ID_MASK_MASKED_ID` (`masked_id`),
  CONSTRAINT `QUOTE_ID_MASK_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quote ID and masked ID mapping';



# Dump of table quote_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `quote_item`;

CREATE TABLE `quote_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `is_qty_decimal` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) unsigned DEFAULT '0' COMMENT 'No Discount',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Custom Price',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `original_custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Custom Price',
  `redirect_url` varchar(255) DEFAULT NULL COMMENT 'Redirect Url',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`item_id`),
  KEY `QUOTE_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `QUOTE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `QUOTE_ITEM_QUOTE_ID` (`quote_id`),
  KEY `QUOTE_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `QUOTE_ITEM_PARENT_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`parent_item_id`) REFERENCES `quote_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `QUOTE_ITEM_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `QUOTE_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item';



# Dump of table quote_item_option
# ------------------------------------------------------------

DROP TABLE IF EXISTS `quote_item_option`;

CREATE TABLE `quote_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `item_id` int(10) unsigned NOT NULL COMMENT 'Item Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`),
  CONSTRAINT `QUOTE_ITEM_OPTION_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `quote_item` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item Option';



# Dump of table quote_payment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `quote_payment`;

CREATE TABLE `quote_payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Payment Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `cc_type` varchar(255) DEFAULT NULL COMMENT 'Cc Type',
  `cc_number_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_last_4` varchar(255) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_cid_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Cid Enc',
  `cc_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_exp_month` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_exp_year` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Exp Year',
  `cc_ss_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Owner',
  `cc_ss_start_month` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Ss Start Month',
  `cc_ss_start_year` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Ss Start Year',
  `po_number` varchar(255) DEFAULT NULL COMMENT 'Po Number',
  `additional_data` text COMMENT 'Additional Data',
  `cc_ss_issue` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `additional_information` text COMMENT 'Additional Information',
  `paypal_payer_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Id',
  `paypal_payer_status` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Status',
  `paypal_correlation_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Correlation Id',
  PRIMARY KEY (`payment_id`),
  KEY `QUOTE_PAYMENT_QUOTE_ID` (`quote_id`),
  CONSTRAINT `QUOTE_PAYMENT_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Payment';



# Dump of table quote_shipping_rate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `quote_shipping_rate`;

CREATE TABLE `quote_shipping_rate` (
  `rate_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rate Id',
  `address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Address Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `carrier` varchar(255) DEFAULT NULL COMMENT 'Carrier',
  `carrier_title` varchar(255) DEFAULT NULL COMMENT 'Carrier Title',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `method_description` text COMMENT 'Method Description',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `error_message` text COMMENT 'Error Message',
  `method_title` text COMMENT 'Method Title',
  PRIMARY KEY (`rate_id`),
  KEY `QUOTE_SHIPPING_RATE_ADDRESS_ID` (`address_id`),
  CONSTRAINT `QUOTE_SHIPPING_RATE_ADDRESS_ID_QUOTE_ADDRESS_ADDRESS_ID` FOREIGN KEY (`address_id`) REFERENCES `quote_address` (`address_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Shipping Rate';



# Dump of table rating
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rating`;

CREATE TABLE `rating` (
  `rating_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating Id',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `rating_code` varchar(64) NOT NULL COMMENT 'Rating Code',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Position On Storefront',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Rating is active.',
  PRIMARY KEY (`rating_id`),
  UNIQUE KEY `RATING_RATING_CODE` (`rating_code`),
  KEY `RATING_ENTITY_ID` (`entity_id`),
  CONSTRAINT `RATING_ENTITY_ID_RATING_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `rating_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ratings';

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;

INSERT INTO `rating` (`rating_id`, `entity_id`, `rating_code`, `position`, `is_active`)
VALUES
	(1,1,'Quality',0,1),
	(2,1,'Value',0,1),
	(3,1,'Price',0,1);

/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rating_entity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rating_entity`;

CREATE TABLE `rating_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_code` varchar(64) NOT NULL COMMENT 'Entity Code',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `RATING_ENTITY_ENTITY_CODE` (`entity_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating entities';

LOCK TABLES `rating_entity` WRITE;
/*!40000 ALTER TABLE `rating_entity` DISABLE KEYS */;

INSERT INTO `rating_entity` (`entity_id`, `entity_code`)
VALUES
	(1,'product'),
	(2,'product_review'),
	(3,'review');

/*!40000 ALTER TABLE `rating_entity` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rating_option
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rating_option`;

CREATE TABLE `rating_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating Option Id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `code` varchar(32) NOT NULL COMMENT 'Rating Option Code',
  `value` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Option Value',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Ration option position on Storefront',
  PRIMARY KEY (`option_id`),
  KEY `RATING_OPTION_RATING_ID` (`rating_id`),
  CONSTRAINT `RATING_OPTION_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating options';

LOCK TABLES `rating_option` WRITE;
/*!40000 ALTER TABLE `rating_option` DISABLE KEYS */;

INSERT INTO `rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`)
VALUES
	(1,1,'1',1,1),
	(2,1,'2',2,2),
	(3,1,'3',3,3),
	(4,1,'4',4,4),
	(5,1,'5',5,5),
	(6,2,'1',1,1),
	(7,2,'2',2,2),
	(8,2,'3',3,3),
	(9,2,'4',4,4),
	(10,2,'5',5,5),
	(11,3,'1',1,1),
	(12,3,'2',2,2),
	(13,3,'3',3,3),
	(14,3,'4',4,4),
	(15,3,'5',5,5);

/*!40000 ALTER TABLE `rating_option` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rating_option_vote
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rating_option_vote`;

CREATE TABLE `rating_option_vote` (
  `vote_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Vote id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Vote option id',
  `remote_ip` varchar(16) NOT NULL COMMENT 'Customer IP',
  `remote_ip_long` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Customer IP converted to long integer format',
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Id',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `review_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Review id',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Percent amount',
  `value` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote option value',
  PRIMARY KEY (`vote_id`),
  KEY `RATING_OPTION_VOTE_OPTION_ID` (`option_id`),
  KEY `RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` (`review_id`),
  CONSTRAINT `RATING_OPTION_VOTE_OPTION_ID_RATING_OPTION_OPTION_ID` FOREIGN KEY (`option_id`) REFERENCES `rating_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating option values';



# Dump of table rating_option_vote_aggregated
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rating_option_vote_aggregated`;

CREATE TABLE `rating_option_vote_aggregated` (
  `primary_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Vote aggregation id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `vote_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Vote dty',
  `vote_value_sum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'General vote sum',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote percent',
  `percent_approved` smallint(6) DEFAULT '0' COMMENT 'Vote percent approved by admin',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  PRIMARY KEY (`primary_id`),
  KEY `RATING_OPTION_VOTE_AGGREGATED_RATING_ID` (`rating_id`),
  KEY `RATING_OPTION_VOTE_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `RATING_OPTION_VOTE_AGGREGATED_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE,
  CONSTRAINT `RATING_OPTION_VOTE_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating vote aggregated';



# Dump of table rating_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rating_store`;

CREATE TABLE `rating_store` (
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `RATING_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `RATING_STORE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE,
  CONSTRAINT `RATING_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Store';



# Dump of table rating_title
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rating_title`;

CREATE TABLE `rating_title` (
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Rating Label',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `RATING_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `RATING_TITLE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE,
  CONSTRAINT `RATING_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Title';



# Dump of table report_compared_product_index
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report_compared_product_index`;

CREATE TABLE `report_compared_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `REPORT_COMPARED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `REPORT_COMPARED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `REPORT_COMPARED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `REPORT_COMPARED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `REPORT_COMPARED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_CMPD_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_CMPD_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_COMPARED_PRODUCT_INDEX_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Compared Product Index Table';



# Dump of table report_event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report_event`;

CREATE TABLE `report_event` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Id',
  `logged_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Logged At',
  `event_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Event Type Id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Object Id',
  `subject_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Subject Id',
  `subtype` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Subtype',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`event_id`),
  KEY `REPORT_EVENT_EVENT_TYPE_ID` (`event_type_id`),
  KEY `REPORT_EVENT_SUBJECT_ID` (`subject_id`),
  KEY `REPORT_EVENT_OBJECT_ID` (`object_id`),
  KEY `REPORT_EVENT_SUBTYPE` (`subtype`),
  KEY `REPORT_EVENT_STORE_ID` (`store_id`),
  CONSTRAINT `REPORT_EVENT_EVENT_TYPE_ID_REPORT_EVENT_TYPES_EVENT_TYPE_ID` FOREIGN KEY (`event_type_id`) REFERENCES `report_event_types` (`event_type_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_EVENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Event Table';



# Dump of table report_event_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report_event_types`;

CREATE TABLE `report_event_types` (
  `event_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Type Id',
  `event_name` varchar(64) NOT NULL COMMENT 'Event Name',
  `customer_login` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Login',
  PRIMARY KEY (`event_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Event Type Table';

LOCK TABLES `report_event_types` WRITE;
/*!40000 ALTER TABLE `report_event_types` DISABLE KEYS */;

INSERT INTO `report_event_types` (`event_type_id`, `event_name`, `customer_login`)
VALUES
	(1,'catalog_product_view',0),
	(2,'sendfriend_product',0),
	(3,'catalog_product_compare_add_product',0),
	(4,'checkout_cart_add_product',0),
	(5,'wishlist_add_product',0),
	(6,'wishlist_share',0);

/*!40000 ALTER TABLE `report_event_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table report_viewed_product_aggregated_daily
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report_viewed_product_aggregated_daily`;

CREATE TABLE `report_viewed_product_aggregated_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_VIEWED_PRD_AGGRED_DAILY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Daily';



# Dump of table report_viewed_product_aggregated_monthly
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report_viewed_product_aggregated_monthly`;

CREATE TABLE `report_viewed_product_aggregated_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_VIEWED_PRD_AGGRED_MONTHLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Monthly';



# Dump of table report_viewed_product_aggregated_yearly
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report_viewed_product_aggregated_yearly`;

CREATE TABLE `report_viewed_product_aggregated_yearly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_VIEWED_PRD_AGGRED_YEARLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Yearly';



# Dump of table report_viewed_product_index
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report_viewed_product_index`;

CREATE TABLE `report_viewed_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `REPORT_VIEWED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `REPORT_VIEWED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `REPORT_VIEWED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_VIEWED_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRODUCT_INDEX_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Viewed Product Index Table';



# Dump of table reporting_counts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reporting_counts`;

CREATE TABLE `reporting_counts` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `type` varchar(255) DEFAULT NULL COMMENT 'Item Reported',
  `count` int(10) unsigned DEFAULT NULL COMMENT 'Count Value',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for all count related events generated via the cron job';



# Dump of table reporting_module_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reporting_module_status`;

CREATE TABLE `reporting_module_status` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Module Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Module Name',
  `active` varchar(255) DEFAULT NULL COMMENT 'Module Active Status',
  `setup_version` varchar(255) DEFAULT NULL COMMENT 'Module Version',
  `state` varchar(255) DEFAULT NULL COMMENT 'Module State',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Module Status Table';



# Dump of table reporting_orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reporting_orders`;

CREATE TABLE `reporting_orders` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `total` decimal(10,0) unsigned DEFAULT NULL,
  `total_base` decimal(10,0) unsigned DEFAULT NULL,
  `item_count` int(10) unsigned NOT NULL COMMENT 'Line Item Count',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for all orders';



# Dump of table reporting_system_updates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reporting_system_updates`;

CREATE TABLE `reporting_system_updates` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `type` varchar(255) DEFAULT NULL COMMENT 'Update Type',
  `action` varchar(255) DEFAULT NULL COMMENT 'Action Performed',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for system updates';



# Dump of table reporting_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reporting_users`;

CREATE TABLE `reporting_users` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `type` varchar(255) DEFAULT NULL COMMENT 'User Type',
  `action` varchar(255) DEFAULT NULL COMMENT 'Action Performed',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for user actions';



# Dump of table review
# ------------------------------------------------------------

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `review_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Review create date',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity id',
  `entity_pk_value` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `status_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Status code',
  PRIMARY KEY (`review_id`),
  KEY `REVIEW_ENTITY_ID` (`entity_id`),
  KEY `REVIEW_STATUS_ID` (`status_id`),
  KEY `REVIEW_ENTITY_PK_VALUE` (`entity_pk_value`),
  CONSTRAINT `REVIEW_ENTITY_ID_REVIEW_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `review_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REVIEW_STATUS_ID_REVIEW_STATUS_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `review_status` (`status_id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review base information';



# Dump of table review_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `review_detail`;

CREATE TABLE `review_detail` (
  `detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review detail id',
  `review_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Review id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store id',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `detail` text NOT NULL COMMENT 'Detail description',
  `nickname` varchar(128) NOT NULL COMMENT 'User nickname',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  PRIMARY KEY (`detail_id`),
  KEY `REVIEW_DETAIL_REVIEW_ID` (`review_id`),
  KEY `REVIEW_DETAIL_STORE_ID` (`store_id`),
  KEY `REVIEW_DETAIL_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `REVIEW_DETAIL_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `REVIEW_DETAIL_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `REVIEW_DETAIL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review detail information';



# Dump of table review_entity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `review_entity`;

CREATE TABLE `review_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review entity id',
  `entity_code` varchar(32) NOT NULL COMMENT 'Review entity code',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review entities';

LOCK TABLES `review_entity` WRITE;
/*!40000 ALTER TABLE `review_entity` DISABLE KEYS */;

INSERT INTO `review_entity` (`entity_id`, `entity_code`)
VALUES
	(1,'product'),
	(2,'customer'),
	(3,'category');

/*!40000 ALTER TABLE `review_entity` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table review_entity_summary
# ------------------------------------------------------------

DROP TABLE IF EXISTS `review_entity_summary`;

CREATE TABLE `review_entity_summary` (
  `primary_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Summary review entity id',
  `entity_pk_value` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Product id',
  `entity_type` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Entity type id',
  `reviews_count` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Qty of reviews',
  `rating_summary` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Summarized rating',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`primary_id`),
  KEY `REVIEW_ENTITY_SUMMARY_STORE_ID` (`store_id`),
  CONSTRAINT `REVIEW_ENTITY_SUMMARY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review aggregates';



# Dump of table review_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `review_status`;

CREATE TABLE `review_status` (
  `status_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Status id',
  `status_code` varchar(32) NOT NULL COMMENT 'Status code',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review statuses';

LOCK TABLES `review_status` WRITE;
/*!40000 ALTER TABLE `review_status` DISABLE KEYS */;

INSERT INTO `review_status` (`status_id`, `status_code`)
VALUES
	(1,'Approved'),
	(2,'Pending'),
	(3,'Not Approved');

/*!40000 ALTER TABLE `review_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table review_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `review_store`;

CREATE TABLE `review_store` (
  `review_id` bigint(20) unsigned NOT NULL COMMENT 'Review Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`review_id`,`store_id`),
  KEY `REVIEW_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `REVIEW_STORE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `REVIEW_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review Store';



# Dump of table sales_bestsellers_aggregated_daily
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_daily`;

CREATE TABLE `sales_bestsellers_aggregated_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Daily';



# Dump of table sales_bestsellers_aggregated_monthly
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_monthly`;

CREATE TABLE `sales_bestsellers_aggregated_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Monthly';



# Dump of table sales_bestsellers_aggregated_yearly
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_yearly`;

CREATE TABLE `sales_bestsellers_aggregated_yearly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Yearly';



# Dump of table sales_creditmemo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_creditmemo`;

CREATE TABLE `sales_creditmemo` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `creditmemo_status` int(11) DEFAULT NULL COMMENT 'Creditmemo Status',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `invoice_id` int(11) DEFAULT NULL COMMENT 'Invoice Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_CREDITMEMO_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_CREDITMEMO_STORE_ID` (`store_id`),
  KEY `SALES_CREDITMEMO_ORDER_ID` (`order_id`),
  KEY `SALES_CREDITMEMO_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `SALES_CREDITMEMO_STATE` (`state`),
  KEY `SALES_CREDITMEMO_CREATED_AT` (`created_at`),
  KEY `SALES_CREDITMEMO_UPDATED_AT` (`updated_at`),
  KEY `SALES_CREDITMEMO_SEND_EMAIL` (`send_email`),
  KEY `SALES_CREDITMEMO_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `SALES_CREDITMEMO_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_CREDITMEMO_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo';



# Dump of table sales_creditmemo_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_creditmemo_comment`;

CREATE TABLE `sales_creditmemo_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_CREDITMEMO_COMMENT_CREATED_AT` (`created_at`),
  KEY `SALES_CREDITMEMO_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_CREDITMEMO_COMMENT_PARENT_ID_SALES_CREDITMEMO_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_creditmemo` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Comment';



# Dump of table sales_creditmemo_grid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_creditmemo_grid`;

CREATE TABLE `sales_creditmemo_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `state` int(11) DEFAULT NULL COMMENT 'Status',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `order_status` varchar(32) DEFAULT NULL COMMENT 'Order Status',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `customer_name` varchar(128) NOT NULL COMMENT 'Customer Name',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` smallint(6) DEFAULT NULL COMMENT 'Customer Group Id',
  `payment_method` varchar(32) DEFAULT NULL COMMENT 'Payment Method',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(12,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `order_base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Order Grand Total',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_CREDITMEMO_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `SALES_CREDITMEMO_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_CREDITMEMO_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `SALES_CREDITMEMO_GRID_STATE` (`state`),
  KEY `SALES_CREDITMEMO_GRID_BILLING_NAME` (`billing_name`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_STATUS` (`order_status`),
  KEY `SALES_CREDITMEMO_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `SALES_CREDITMEMO_GRID_STORE_ID` (`store_id`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_BASE_GRAND_TOTAL` (`order_base_grand_total`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_ID` (`order_id`),
  FULLTEXT KEY `FTI_32B7BA885941A8254EE84AE650ABDC86` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Grid';



# Dump of table sales_creditmemo_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_creditmemo_item`;

CREATE TABLE `sales_creditmemo_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `tax_ratio` text COMMENT 'Ratio of tax in the creditmemo item over tax of the order item',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_CREDITMEMO_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_CREDITMEMO_ITEM_PARENT_ID_SALES_CREDITMEMO_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_creditmemo` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Item';



# Dump of table sales_invoice
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_invoice`;

CREATE TABLE `sales_invoice` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `is_used_for_refund` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Used For Refund',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `can_void_flag` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Void Flag',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_INVOICE_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_INVOICE_STORE_ID` (`store_id`),
  KEY `SALES_INVOICE_GRAND_TOTAL` (`grand_total`),
  KEY `SALES_INVOICE_ORDER_ID` (`order_id`),
  KEY `SALES_INVOICE_STATE` (`state`),
  KEY `SALES_INVOICE_CREATED_AT` (`created_at`),
  KEY `SALES_INVOICE_UPDATED_AT` (`updated_at`),
  KEY `SALES_INVOICE_SEND_EMAIL` (`send_email`),
  KEY `SALES_INVOICE_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `SALES_INVOICE_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_INVOICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice';



# Dump of table sales_invoice_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_invoice_comment`;

CREATE TABLE `sales_invoice_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_INVOICE_COMMENT_CREATED_AT` (`created_at`),
  KEY `SALES_INVOICE_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_INVOICE_COMMENT_PARENT_ID_SALES_INVOICE_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_invoice` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Comment';



# Dump of table sales_invoice_grid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_invoice_grid`;

CREATE TABLE `sales_invoice_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Customer Name',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` int(11) DEFAULT NULL,
  `payment_method` varchar(128) DEFAULT NULL COMMENT 'Payment Method',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(12,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_INVOICE_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_INVOICE_GRID_STORE_ID` (`store_id`),
  KEY `SALES_INVOICE_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `SALES_INVOICE_GRID_ORDER_ID` (`order_id`),
  KEY `SALES_INVOICE_GRID_STATE` (`state`),
  KEY `SALES_INVOICE_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `SALES_INVOICE_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_INVOICE_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_INVOICE_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `SALES_INVOICE_GRID_BILLING_NAME` (`billing_name`),
  KEY `SALES_INVOICE_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  FULLTEXT KEY `FTI_95D9C924DD6A8734EB8B5D01D60F90DE` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Grid';



# Dump of table sales_invoice_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_invoice_item`;

CREATE TABLE `sales_invoice_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `tax_ratio` text COMMENT 'Ratio of tax invoiced over tax of the order item',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_INVOICE_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_INVOICE_ITEM_PARENT_ID_SALES_INVOICE_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_invoice` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Item';



# Dump of table sales_invoiced_aggregated
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_invoiced_aggregated`;

CREATE TABLE `sales_invoiced_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_INVOICED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_INVOICED_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_INVOICED_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated';



# Dump of table sales_invoiced_aggregated_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_invoiced_aggregated_order`;

CREATE TABLE `sales_invoiced_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_INVOICED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_INVOICED_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_INVOICED_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated Order';



# Dump of table sales_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_order`;

CREATE TABLE `sales_order` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `state` varchar(32) DEFAULT NULL COMMENT 'State',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `protect_code` varchar(255) DEFAULT NULL COMMENT 'Protect Code',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Canceled',
  `base_discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Invoiced',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `base_shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Canceled',
  `base_shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Invoiced',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Refunded',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `base_subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Canceled',
  `base_subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Invoiced',
  `base_subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Refunded',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Canceled',
  `base_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Invoiced',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `base_total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Canceled',
  `base_total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced',
  `base_total_invoiced_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced Cost',
  `base_total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Offline Refunded',
  `base_total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Online Refunded',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `base_total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Qty Ordered',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Discount Canceled',
  `discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Invoiced',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Canceled',
  `shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Invoiced',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Refunded',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Canceled',
  `subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Invoiced',
  `subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Refunded',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Tax Invoiced',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Total Canceled',
  `total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Total Invoiced',
  `total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Offline Refunded',
  `total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Online Refunded',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty Ordered',
  `total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Refunded',
  `can_ship_partially` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Ship Partially',
  `can_ship_partially_item` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Ship Partially Item',
  `customer_is_guest` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Is Guest',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `customer_group_id` int(11) DEFAULT NULL,
  `edit_increment` int(11) DEFAULT NULL COMMENT 'Edit Increment',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `forced_shipment_with_invoice` smallint(5) unsigned DEFAULT NULL COMMENT 'Forced Do Shipment With Invoice',
  `payment_auth_expiration` int(11) DEFAULT NULL COMMENT 'Payment Authorization Expiration',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `quote_id` int(11) DEFAULT NULL COMMENT 'Quote Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `base_total_due` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Due',
  `payment_authorization_amount` decimal(12,4) DEFAULT NULL COMMENT 'Payment Authorization Amount',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `total_due` decimal(12,4) DEFAULT NULL COMMENT 'Total Due',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `increment_id` varchar(32) DEFAULT NULL COMMENT 'Increment Id',
  `applied_rule_ids` varchar(128) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_firstname` varchar(128) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_lastname` varchar(128) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_middlename` varchar(128) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_prefix` varchar(32) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_suffix` varchar(32) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_taxvat` varchar(32) DEFAULT NULL COMMENT 'Customer Taxvat',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `ext_customer_id` varchar(32) DEFAULT NULL COMMENT 'Ext Customer Id',
  `ext_order_id` varchar(32) DEFAULT NULL COMMENT 'Ext Order Id',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `hold_before_state` varchar(32) DEFAULT NULL COMMENT 'Hold Before State',
  `hold_before_status` varchar(32) DEFAULT NULL COMMENT 'Hold Before Status',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `original_increment_id` varchar(32) DEFAULT NULL COMMENT 'Original Increment Id',
  `relation_child_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Id',
  `relation_child_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Real Id',
  `relation_parent_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Id',
  `relation_parent_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Real Id',
  `remote_ip` varchar(32) DEFAULT NULL COMMENT 'Remote Ip',
  `shipping_method` varchar(120) DEFAULT NULL,
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `store_name` varchar(32) DEFAULT NULL COMMENT 'Store Name',
  `x_forwarded_for` varchar(32) DEFAULT NULL COMMENT 'X Forwarded For',
  `customer_note` text COMMENT 'Customer Note',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `total_item_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Total Item Count',
  `customer_gender` int(11) DEFAULT NULL COMMENT 'Customer Gender',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Invoiced',
  `base_discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Invoiced',
  `discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Refunded',
  `base_discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Refunded',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `coupon_rule_name` varchar(255) DEFAULT NULL COMMENT 'Coupon Sales Rule Name',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `paypal_ipn_customer_notified` int(11) DEFAULT '0' COMMENT 'Paypal Ipn Customer Notified',
  `getresponse_order_id` varchar(32) DEFAULT NULL COMMENT 'GetResponse order id',
  `getresponse_order_md5` varchar(64) DEFAULT NULL COMMENT 'GetResponse order md5',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_ORDER_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_ORDER_STATUS` (`status`),
  KEY `SALES_ORDER_STATE` (`state`),
  KEY `SALES_ORDER_STORE_ID` (`store_id`),
  KEY `SALES_ORDER_CREATED_AT` (`created_at`),
  KEY `SALES_ORDER_CUSTOMER_ID` (`customer_id`),
  KEY `SALES_ORDER_EXT_ORDER_ID` (`ext_order_id`),
  KEY `SALES_ORDER_QUOTE_ID` (`quote_id`),
  KEY `SALES_ORDER_UPDATED_AT` (`updated_at`),
  KEY `SALES_ORDER_SEND_EMAIL` (`send_email`),
  KEY `SALES_ORDER_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `SALES_ORDER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `SALES_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order';



# Dump of table sales_order_address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_order_address`;

CREATE TABLE `sales_order_address` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `customer_address_id` int(11) DEFAULT NULL COMMENT 'Customer Address Id',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `region_id` int(11) DEFAULT NULL COMMENT 'Region Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `region` varchar(255) DEFAULT NULL COMMENT 'Region',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Postcode',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Lastname',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `telephone` varchar(255) DEFAULT NULL COMMENT 'Phone Number',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Firstname',
  `address_type` varchar(255) DEFAULT NULL COMMENT 'Address Type',
  `prefix` varchar(255) DEFAULT NULL COMMENT 'Prefix',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middlename',
  `suffix` varchar(255) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_ORDER_ADDRESS_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_ORDER_ADDRESS_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Address';



# Dump of table sales_order_aggregated_created
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_order_aggregated_created`;

CREATE TABLE `sales_order_aggregated_created` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_ORDER_AGGREGATED_CREATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_ORDER_AGGREGATED_CREATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Aggregated Created';



# Dump of table sales_order_aggregated_updated
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_order_aggregated_updated`;

CREATE TABLE `sales_order_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_ORDER_AGGREGATED_UPDATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_ORDER_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Aggregated Updated';



# Dump of table sales_order_grid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_order_grid`;

CREATE TABLE `sales_order_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `order_currency_code` varchar(255) DEFAULT NULL COMMENT 'Order Currency Code',
  `shipping_name` varchar(255) DEFAULT NULL COMMENT 'Shipping Name',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group` varchar(255) DEFAULT NULL COMMENT 'Customer Group',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(12,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Customer Name',
  `payment_method` varchar(255) DEFAULT NULL COMMENT 'Payment Method',
  `total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Refunded',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_ORDER_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_ORDER_GRID_STATUS` (`status`),
  KEY `SALES_ORDER_GRID_STORE_ID` (`store_id`),
  KEY `SALES_ORDER_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `SALES_ORDER_GRID_BASE_TOTAL_PAID` (`base_total_paid`),
  KEY `SALES_ORDER_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `SALES_ORDER_GRID_TOTAL_PAID` (`total_paid`),
  KEY `SALES_ORDER_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `SALES_ORDER_GRID_BILLING_NAME` (`billing_name`),
  KEY `SALES_ORDER_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_ORDER_GRID_CUSTOMER_ID` (`customer_id`),
  KEY `SALES_ORDER_GRID_UPDATED_AT` (`updated_at`),
  FULLTEXT KEY `FTI_65B9E9925EC58F0C7C2E2F6379C233E7` (`increment_id`,`billing_name`,`shipping_name`,`shipping_address`,`billing_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Grid';



# Dump of table sales_order_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_order_item`;

CREATE TABLE `sales_order_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Quote Item Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `product_options` text COMMENT 'Product Options',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `is_qty_decimal` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'No Discount',
  `qty_backordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Backordered',
  `qty_canceled` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Canceled',
  `qty_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Invoiced',
  `qty_ordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `qty_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Refunded',
  `qty_shipped` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Shipped',
  `base_cost` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Cost',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `original_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `base_original_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Original Price',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `tax_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Invoiced',
  `base_tax_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Invoiced',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Invoiced',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Invoiced',
  `amount_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Amount Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Amount Refunded',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Invoiced',
  `base_row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Invoiced',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `ext_order_item_id` varchar(255) DEFAULT NULL COMMENT 'Ext Order Item Id',
  `locked_do_invoice` smallint(5) unsigned DEFAULT NULL COMMENT 'Locked Do Invoice',
  `locked_do_ship` smallint(5) unsigned DEFAULT NULL COMMENT 'Locked Do Ship',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Invoiced',
  `base_discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Invoiced',
  `discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Refunded',
  `base_discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Refunded',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `discount_tax_compensation_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Canceled',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `gift_message_available` int(11) DEFAULT NULL COMMENT 'Gift Message Available',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`item_id`),
  KEY `SALES_ORDER_ITEM_ORDER_ID` (`order_id`),
  KEY `SALES_ORDER_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_ORDER_ITEM_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_ORDER_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Item';



# Dump of table sales_order_payment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_order_payment`;

CREATE TABLE `sales_order_payment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Captured',
  `shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Captured',
  `amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Amount Refunded',
  `base_amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid',
  `amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Amount Canceled',
  `base_amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Authorized',
  `base_amount_paid_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid Online',
  `base_amount_refunded_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded Online',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Amount Paid',
  `amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Amount Authorized',
  `base_amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Ordered',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded',
  `amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Amount Ordered',
  `base_amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Canceled',
  `quote_payment_id` int(11) DEFAULT NULL COMMENT 'Quote Payment Id',
  `additional_data` text COMMENT 'Additional Data',
  `cc_exp_month` varchar(12) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_ss_start_year` varchar(12) DEFAULT NULL COMMENT 'Cc Ss Start Year',
  `echeck_bank_name` varchar(128) DEFAULT NULL COMMENT 'Echeck Bank Name',
  `method` varchar(128) DEFAULT NULL COMMENT 'Method',
  `cc_debug_request_body` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Request Body',
  `cc_secure_verify` varchar(32) DEFAULT NULL COMMENT 'Cc Secure Verify',
  `protection_eligibility` varchar(32) DEFAULT NULL COMMENT 'Protection Eligibility',
  `cc_approval` varchar(32) DEFAULT NULL COMMENT 'Cc Approval',
  `cc_last_4` varchar(100) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_status_description` varchar(32) DEFAULT NULL COMMENT 'Cc Status Description',
  `echeck_type` varchar(32) DEFAULT NULL COMMENT 'Echeck Type',
  `cc_debug_response_serialized` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Response Serialized',
  `cc_ss_start_month` varchar(128) DEFAULT NULL COMMENT 'Cc Ss Start Month',
  `echeck_account_type` varchar(255) DEFAULT NULL COMMENT 'Echeck Account Type',
  `last_trans_id` varchar(32) DEFAULT NULL COMMENT 'Last Trans Id',
  `cc_cid_status` varchar(32) DEFAULT NULL COMMENT 'Cc Cid Status',
  `cc_owner` varchar(128) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_type` varchar(32) DEFAULT NULL COMMENT 'Cc Type',
  `po_number` varchar(32) DEFAULT NULL COMMENT 'Po Number',
  `cc_exp_year` varchar(4) DEFAULT NULL COMMENT 'Cc Exp Year',
  `cc_status` varchar(4) DEFAULT NULL COMMENT 'Cc Status',
  `echeck_routing_number` varchar(32) DEFAULT NULL COMMENT 'Echeck Routing Number',
  `account_status` varchar(32) DEFAULT NULL COMMENT 'Account Status',
  `anet_trans_method` varchar(32) DEFAULT NULL COMMENT 'Anet Trans Method',
  `cc_debug_response_body` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Response Body',
  `cc_ss_issue` varchar(32) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `echeck_account_name` varchar(32) DEFAULT NULL COMMENT 'Echeck Account Name',
  `cc_avs_status` varchar(32) DEFAULT NULL COMMENT 'Cc Avs Status',
  `cc_number_enc` varchar(128) DEFAULT NULL,
  `cc_trans_id` varchar(32) DEFAULT NULL COMMENT 'Cc Trans Id',
  `address_status` varchar(32) DEFAULT NULL COMMENT 'Address Status',
  `additional_information` text COMMENT 'Additional Information',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_ORDER_PAYMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_ORDER_PAYMENT_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Payment';



# Dump of table sales_order_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_order_status`;

CREATE TABLE `sales_order_status` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';

LOCK TABLES `sales_order_status` WRITE;
/*!40000 ALTER TABLE `sales_order_status` DISABLE KEYS */;

INSERT INTO `sales_order_status` (`status`, `label`)
VALUES
	('canceled','Canceled'),
	('closed','Closed'),
	('complete','Complete'),
	('fraud','Suspected Fraud'),
	('holded','On Hold'),
	('payment_review','Payment Review'),
	('paypal_canceled_reversal','PayPal Canceled Reversal'),
	('paypal_reversed','PayPal Reversed'),
	('pending','Pending'),
	('pending_payment','Pending Payment'),
	('pending_paypal','Pending PayPal'),
	('processing','Processing');

/*!40000 ALTER TABLE `sales_order_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sales_order_status_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_order_status_history`;

CREATE TABLE `sales_order_status_history` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `entity_name` varchar(32) DEFAULT NULL COMMENT 'Shows what entity history is bind to.',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_ORDER_STATUS_HISTORY_PARENT_ID` (`parent_id`),
  KEY `SALES_ORDER_STATUS_HISTORY_CREATED_AT` (`created_at`),
  CONSTRAINT `SALES_ORDER_STATUS_HISTORY_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Status History';



# Dump of table sales_order_status_label
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_order_status_label`;

CREATE TABLE `sales_order_status_label` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`,`store_id`),
  KEY `SALES_ORDER_STATUS_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_ORDER_STATUS_LABEL_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE,
  CONSTRAINT `SALES_ORDER_STATUS_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Label Table';



# Dump of table sales_order_status_state
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_order_status_state`;

CREATE TABLE `sales_order_status_state` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `state` varchar(32) NOT NULL COMMENT 'Label',
  `is_default` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Visible on front',
  PRIMARY KEY (`status`,`state`),
  CONSTRAINT `SALES_ORDER_STATUS_STATE_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';

LOCK TABLES `sales_order_status_state` WRITE;
/*!40000 ALTER TABLE `sales_order_status_state` DISABLE KEYS */;

INSERT INTO `sales_order_status_state` (`status`, `state`, `is_default`, `visible_on_front`)
VALUES
	('canceled','canceled',1,1),
	('closed','closed',1,1),
	('complete','complete',1,1),
	('fraud','payment_review',0,1),
	('fraud','processing',0,1),
	('holded','holded',1,1),
	('payment_review','payment_review',1,1),
	('pending','new',1,1),
	('pending_payment','pending_payment',1,0),
	('processing','processing',1,1);

/*!40000 ALTER TABLE `sales_order_status_state` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sales_order_tax
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_order_tax`;

CREATE TABLE `sales_order_tax` (
  `tax_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `percent` decimal(12,4) DEFAULT NULL COMMENT 'Percent',
  `amount` decimal(12,4) DEFAULT NULL COMMENT 'Amount',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `base_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount',
  `process` smallint(6) NOT NULL COMMENT 'Process',
  `base_real_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Real Amount',
  PRIMARY KEY (`tax_id`),
  KEY `SALES_ORDER_TAX_ORDER_ID_PRIORITY_POSITION` (`order_id`,`priority`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Table';



# Dump of table sales_order_tax_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_order_tax_item`;

CREATE TABLE `sales_order_tax_item` (
  `tax_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax Item Id',
  `tax_id` int(10) unsigned NOT NULL COMMENT 'Tax Id',
  `item_id` int(10) unsigned DEFAULT NULL COMMENT 'Item Id',
  `tax_percent` decimal(12,4) NOT NULL COMMENT 'Real Tax Percent For Item',
  `amount` decimal(12,4) NOT NULL COMMENT 'Tax amount for the item and tax rate',
  `base_amount` decimal(12,4) NOT NULL COMMENT 'Base tax amount for the item and tax rate',
  `real_amount` decimal(12,4) NOT NULL COMMENT 'Real tax amount for the item and tax rate',
  `real_base_amount` decimal(12,4) NOT NULL COMMENT 'Real base tax amount for the item and tax rate',
  `associated_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Id of the associated item',
  `taxable_item_type` varchar(32) NOT NULL COMMENT 'Type of the taxable item',
  PRIMARY KEY (`tax_item_id`),
  UNIQUE KEY `SALES_ORDER_TAX_ITEM_TAX_ID_ITEM_ID` (`tax_id`,`item_id`),
  KEY `SALES_ORDER_TAX_ITEM_ITEM_ID` (`item_id`),
  KEY `SALES_ORDER_TAX_ITEM_ASSOCIATED_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` (`associated_item_id`),
  CONSTRAINT `SALES_ORDER_TAX_ITEM_ASSOCIATED_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`associated_item_id`) REFERENCES `sales_order_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_ORDER_TAX_ITEM_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `sales_order_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_ORDER_TAX_ITEM_TAX_ID_SALES_ORDER_TAX_TAX_ID` FOREIGN KEY (`tax_id`) REFERENCES `sales_order_tax` (`tax_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Item';



# Dump of table sales_payment_transaction
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_payment_transaction`;

CREATE TABLE `sales_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Transaction Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `payment_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Payment Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `parent_txn_id` varchar(100) DEFAULT NULL COMMENT 'Parent Txn Id',
  `txn_type` varchar(15) DEFAULT NULL COMMENT 'Txn Type',
  `is_closed` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Closed',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `SALES_PAYMENT_TRANSACTION_ORDER_ID_PAYMENT_ID_TXN_ID` (`order_id`,`payment_id`,`txn_id`),
  KEY `SALES_PAYMENT_TRANSACTION_PARENT_ID` (`parent_id`),
  KEY `SALES_PAYMENT_TRANSACTION_PAYMENT_ID` (`payment_id`),
  CONSTRAINT `FK_B99FF1A06402D725EBDB0F3A7ECD47A2` FOREIGN KEY (`parent_id`) REFERENCES `sales_payment_transaction` (`transaction_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_PAYMENT_TRANSACTION_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_PAYMENT_TRANSACTION_PAYMENT_ID_SALES_ORDER_PAYMENT_ENTT_ID` FOREIGN KEY (`payment_id`) REFERENCES `sales_order_payment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Payment Transaction';



# Dump of table sales_refunded_aggregated
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_refunded_aggregated`;

CREATE TABLE `sales_refunded_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_REFUNDED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_REFUNDED_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_REFUNDED_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated';



# Dump of table sales_refunded_aggregated_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_refunded_aggregated_order`;

CREATE TABLE `sales_refunded_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_REFUNDED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated Order';



# Dump of table sales_sequence_meta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_sequence_meta`;

CREATE TABLE `sales_sequence_meta` (
  `meta_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `entity_type` varchar(32) NOT NULL COMMENT 'Prefix',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `sequence_table` varchar(32) NOT NULL COMMENT 'table for sequence',
  PRIMARY KEY (`meta_id`),
  UNIQUE KEY `SALES_SEQUENCE_META_ENTITY_TYPE_STORE_ID` (`entity_type`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sales_sequence_meta';

LOCK TABLES `sales_sequence_meta` WRITE;
/*!40000 ALTER TABLE `sales_sequence_meta` DISABLE KEYS */;

INSERT INTO `sales_sequence_meta` (`meta_id`, `entity_type`, `store_id`, `sequence_table`)
VALUES
	(1,'order',0,'sequence_order_0'),
	(2,'invoice',0,'sequence_invoice_0'),
	(3,'creditmemo',0,'sequence_creditmemo_0'),
	(4,'shipment',0,'sequence_shipment_0'),
	(5,'order',1,'sequence_order_1'),
	(6,'invoice',1,'sequence_invoice_1'),
	(7,'creditmemo',1,'sequence_creditmemo_1'),
	(8,'shipment',1,'sequence_shipment_1');

/*!40000 ALTER TABLE `sales_sequence_meta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sales_sequence_profile
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_sequence_profile`;

CREATE TABLE `sales_sequence_profile` (
  `profile_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `meta_id` int(10) unsigned NOT NULL COMMENT 'Meta_id',
  `prefix` varchar(32) DEFAULT NULL COMMENT 'Prefix',
  `suffix` varchar(32) DEFAULT NULL COMMENT 'Suffix',
  `start_value` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'Start value for sequence',
  `step` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'Step for sequence',
  `max_value` int(10) unsigned NOT NULL COMMENT 'MaxValue for sequence',
  `warning_value` int(10) unsigned NOT NULL COMMENT 'WarningValue for sequence',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'isActive flag',
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `SALES_SEQUENCE_PROFILE_META_ID_PREFIX_SUFFIX` (`meta_id`,`prefix`,`suffix`),
  CONSTRAINT `SALES_SEQUENCE_PROFILE_META_ID_SALES_SEQUENCE_META_META_ID` FOREIGN KEY (`meta_id`) REFERENCES `sales_sequence_meta` (`meta_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sales_sequence_profile';

LOCK TABLES `sales_sequence_profile` WRITE;
/*!40000 ALTER TABLE `sales_sequence_profile` DISABLE KEYS */;

INSERT INTO `sales_sequence_profile` (`profile_id`, `meta_id`, `prefix`, `suffix`, `start_value`, `step`, `max_value`, `warning_value`, `is_active`)
VALUES
	(1,1,NULL,NULL,1,1,4294967295,4294966295,1),
	(2,2,NULL,NULL,1,1,4294967295,4294966295,1),
	(3,3,NULL,NULL,1,1,4294967295,4294966295,1),
	(4,4,NULL,NULL,1,1,4294967295,4294966295,1),
	(5,5,NULL,NULL,1,1,4294967295,4294966295,1),
	(6,6,NULL,NULL,1,1,4294967295,4294966295,1),
	(7,7,NULL,NULL,1,1,4294967295,4294966295,1),
	(8,8,NULL,NULL,1,1,4294967295,4294966295,1);

/*!40000 ALTER TABLE `sales_sequence_profile` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sales_shipment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_shipment`;

CREATE TABLE `sales_shipment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `total_weight` decimal(12,4) DEFAULT NULL COMMENT 'Total Weight',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `packages` text COMMENT 'Packed Products in Packages',
  `shipping_label` mediumblob COMMENT 'Shipping Label Content',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_SHIPMENT_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_SHIPMENT_STORE_ID` (`store_id`),
  KEY `SALES_SHIPMENT_TOTAL_QTY` (`total_qty`),
  KEY `SALES_SHIPMENT_ORDER_ID` (`order_id`),
  KEY `SALES_SHIPMENT_CREATED_AT` (`created_at`),
  KEY `SALES_SHIPMENT_UPDATED_AT` (`updated_at`),
  KEY `SALES_SHIPMENT_SEND_EMAIL` (`send_email`),
  KEY `SALES_SHIPMENT_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `SALES_SHIPMENT_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_SHIPMENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment';



# Dump of table sales_shipment_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_shipment_comment`;

CREATE TABLE `sales_shipment_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_SHIPMENT_COMMENT_CREATED_AT` (`created_at`),
  KEY `SALES_SHIPMENT_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_SHIPMENT_COMMENT_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_shipment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Comment';



# Dump of table sales_shipment_grid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_shipment_grid`;

CREATE TABLE `sales_shipment_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_increment_id` varchar(32) NOT NULL COMMENT 'Order Increment Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `order_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Order Increment Id',
  `customer_name` varchar(128) NOT NULL COMMENT 'Customer Name',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `order_status` varchar(32) DEFAULT NULL COMMENT 'Order',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `billing_name` varchar(128) DEFAULT NULL COMMENT 'Billing Name',
  `shipping_name` varchar(128) DEFAULT NULL COMMENT 'Shipping Name',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` int(11) DEFAULT NULL,
  `payment_method` varchar(32) DEFAULT NULL COMMENT 'Payment Method',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_SHIPMENT_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_SHIPMENT_GRID_STORE_ID` (`store_id`),
  KEY `SALES_SHIPMENT_GRID_TOTAL_QTY` (`total_qty`),
  KEY `SALES_SHIPMENT_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `SALES_SHIPMENT_GRID_SHIPMENT_STATUS` (`shipment_status`),
  KEY `SALES_SHIPMENT_GRID_ORDER_STATUS` (`order_status`),
  KEY `SALES_SHIPMENT_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_SHIPMENT_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_SHIPMENT_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `SALES_SHIPMENT_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `SALES_SHIPMENT_GRID_BILLING_NAME` (`billing_name`),
  FULLTEXT KEY `FTI_086B40C8955F167B8EA76653437879B4` (`increment_id`,`order_increment_id`,`shipping_name`,`customer_name`,`customer_email`,`billing_address`,`shipping_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Grid';



# Dump of table sales_shipment_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_shipment_item`;

CREATE TABLE `sales_shipment_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_SHIPMENT_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_SHIPMENT_ITEM_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_shipment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Item';



# Dump of table sales_shipment_track
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_shipment_track`;

CREATE TABLE `sales_shipment_track` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `track_number` text COMMENT 'Number',
  `description` text COMMENT 'Description',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT 'Carrier Code',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_SHIPMENT_TRACK_PARENT_ID` (`parent_id`),
  KEY `SALES_SHIPMENT_TRACK_ORDER_ID` (`order_id`),
  KEY `SALES_SHIPMENT_TRACK_CREATED_AT` (`created_at`),
  CONSTRAINT `SALES_SHIPMENT_TRACK_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_shipment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Track';



# Dump of table sales_shipping_aggregated
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_shipping_aggregated`;

CREATE TABLE `sales_shipping_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_SHPP_AGGRED_PERIOD_STORE_ID_ORDER_STS_SHPP_DESCRIPTION` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `SALES_SHIPPING_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_SHIPPING_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated';



# Dump of table sales_shipping_aggregated_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_shipping_aggregated_order`;

CREATE TABLE `sales_shipping_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_C05FAE47282EEA68654D0924E946761F` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated Order';



# Dump of table salesrule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `salesrule`;

CREATE TABLE `salesrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From',
  `to_date` date DEFAULT NULL COMMENT 'To',
  `uses_per_customer` int(11) NOT NULL DEFAULT '0' COMMENT 'Uses Per Customer',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `is_advanced` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Advanced',
  `product_ids` text COMMENT 'Product Ids',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `discount_qty` decimal(12,4) DEFAULT NULL COMMENT 'Discount Qty',
  `discount_step` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Discount Step',
  `apply_to_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Apply To Shipping',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `is_rss` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Rss',
  `coupon_type` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Coupon Type',
  `use_auto_generation` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Use Auto Generation',
  `uses_per_coupon` int(11) NOT NULL DEFAULT '0' COMMENT 'User Per Coupon',
  `simple_free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Simple Free Shipping',
  PRIMARY KEY (`rule_id`),
  KEY `SALESRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule';



# Dump of table salesrule_coupon
# ------------------------------------------------------------

DROP TABLE IF EXISTS `salesrule_coupon`;

CREATE TABLE `salesrule_coupon` (
  `coupon_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Coupon Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `usage_limit` int(10) unsigned DEFAULT NULL COMMENT 'Usage Limit',
  `usage_per_customer` int(10) unsigned DEFAULT NULL COMMENT 'Usage Per Customer',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `expiration_date` timestamp NULL DEFAULT NULL COMMENT 'Expiration Date',
  `is_primary` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Primary',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Coupon Code Creation Date',
  `type` smallint(6) DEFAULT '0' COMMENT 'Coupon Code Type',
  PRIMARY KEY (`coupon_id`),
  UNIQUE KEY `SALESRULE_COUPON_CODE` (`code`),
  UNIQUE KEY `SALESRULE_COUPON_RULE_ID_IS_PRIMARY` (`rule_id`,`is_primary`),
  KEY `SALESRULE_COUPON_RULE_ID` (`rule_id`),
  CONSTRAINT `SALESRULE_COUPON_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon';



# Dump of table salesrule_coupon_aggregated
# ------------------------------------------------------------

DROP TABLE IF EXISTS `salesrule_coupon_aggregated`;

CREATE TABLE `salesrule_coupon_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALESRULE_COUPON_AGGRED_PERIOD_STORE_ID_ORDER_STS_COUPON_CODE` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `SALESRULE_COUPON_AGGREGATED_STORE_ID` (`store_id`),
  KEY `SALESRULE_COUPON_AGGREGATED_RULE_NAME` (`rule_name`),
  CONSTRAINT `SALESRULE_COUPON_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated';



# Dump of table salesrule_coupon_aggregated_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `salesrule_coupon_aggregated_order`;

CREATE TABLE `salesrule_coupon_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_1094D1FBBCBB11704A29DEF3ACC37D2B` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  KEY `SALESRULE_COUPON_AGGREGATED_ORDER_RULE_NAME` (`rule_name`),
  CONSTRAINT `SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated Order';



# Dump of table salesrule_coupon_aggregated_updated
# ------------------------------------------------------------

DROP TABLE IF EXISTS `salesrule_coupon_aggregated_updated`;

CREATE TABLE `salesrule_coupon_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_7196FA120A4F0F84E1B66605E87E213E` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `SALESRULE_COUPON_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  KEY `SALESRULE_COUPON_AGGREGATED_UPDATED_RULE_NAME` (`rule_name`),
  CONSTRAINT `SALESRULE_COUPON_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon Aggregated Updated';



# Dump of table salesrule_coupon_usage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `salesrule_coupon_usage`;

CREATE TABLE `salesrule_coupon_usage` (
  `coupon_id` int(10) unsigned NOT NULL COMMENT 'Coupon Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer Id',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`coupon_id`,`customer_id`),
  KEY `SALESRULE_COUPON_USAGE_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `SALESRULE_COUPON_USAGE_COUPON_ID_SALESRULE_COUPON_COUPON_ID` FOREIGN KEY (`coupon_id`) REFERENCES `salesrule_coupon` (`coupon_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_COUPON_USAGE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon Usage';



# Dump of table salesrule_customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `salesrule_customer`;

CREATE TABLE `salesrule_customer` (
  `rule_customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Customer Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `times_used` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`rule_customer_id`),
  KEY `SALESRULE_CUSTOMER_RULE_ID_CUSTOMER_ID` (`rule_id`,`customer_id`),
  KEY `SALESRULE_CUSTOMER_CUSTOMER_ID_RULE_ID` (`customer_id`,`rule_id`),
  CONSTRAINT `SALESRULE_CUSTOMER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_CUSTOMER_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Customer';



# Dump of table salesrule_customer_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `salesrule_customer_group`;

CREATE TABLE `salesrule_customer_group` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `SALESRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `SALESRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_CUSTOMER_GROUP_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Customer Groups Relations';



# Dump of table salesrule_label
# ------------------------------------------------------------

DROP TABLE IF EXISTS `salesrule_label`;

CREATE TABLE `salesrule_label` (
  `label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Label Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  PRIMARY KEY (`label_id`),
  UNIQUE KEY `SALESRULE_LABEL_RULE_ID_STORE_ID` (`rule_id`,`store_id`),
  KEY `SALESRULE_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `SALESRULE_LABEL_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Label';



# Dump of table salesrule_product_attribute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `salesrule_product_attribute`;

CREATE TABLE `salesrule_product_attribute` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group Id',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`rule_id`,`website_id`,`customer_group_id`,`attribute_id`),
  KEY `SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID` (`website_id`),
  KEY `SALESRULE_PRODUCT_ATTRIBUTE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `SALESRULE_PRODUCT_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `SALESRULE_PRD_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_PRD_ATTR_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_PRODUCT_ATTRIBUTE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Product Attribute';



# Dump of table salesrule_website
# ------------------------------------------------------------

DROP TABLE IF EXISTS `salesrule_website`;

CREATE TABLE `salesrule_website` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `SALESRULE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `SALESRULE_WEBSITE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Websites Relations';



# Dump of table search_query
# ------------------------------------------------------------

DROP TABLE IF EXISTS `search_query`;

CREATE TABLE `search_query` (
  `query_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Query ID',
  `query_text` varchar(255) DEFAULT NULL COMMENT 'Query text',
  `num_results` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Num results',
  `popularity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Popularity',
  `redirect` varchar(255) DEFAULT NULL COMMENT 'Redirect',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `display_in_terms` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Display in terms',
  `is_active` smallint(6) DEFAULT '1' COMMENT 'Active status',
  `is_processed` smallint(6) DEFAULT '0' COMMENT 'Processed status',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated at',
  PRIMARY KEY (`query_id`),
  UNIQUE KEY `SEARCH_QUERY_QUERY_TEXT_STORE_ID` (`query_text`,`store_id`),
  KEY `SEARCH_QUERY_QUERY_TEXT_STORE_ID_POPULARITY` (`query_text`,`store_id`,`popularity`),
  KEY `SEARCH_QUERY_STORE_ID` (`store_id`),
  KEY `SEARCH_QUERY_IS_PROCESSED` (`is_processed`),
  CONSTRAINT `SEARCH_QUERY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Search query table';



# Dump of table search_synonyms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `search_synonyms`;

CREATE TABLE `search_synonyms` (
  `group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Synonyms Group Id',
  `synonyms` text NOT NULL COMMENT 'list of synonyms making up this group',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id - identifies the store view these synonyms belong to',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id - identifies the website id these synonyms belong to',
  PRIMARY KEY (`group_id`),
  KEY `SEARCH_SYNONYMS_STORE_ID` (`store_id`),
  KEY `SEARCH_SYNONYMS_WEBSITE_ID` (`website_id`),
  FULLTEXT KEY `SEARCH_SYNONYMS_SYNONYMS` (`synonyms`),
  CONSTRAINT `SEARCH_SYNONYMS_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `SEARCH_SYNONYMS_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table storing various synonyms groups';



# Dump of table sendfriend_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sendfriend_log`;

CREATE TABLE `sendfriend_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer IP address',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Log time',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`log_id`),
  KEY `SENDFRIEND_LOG_IP` (`ip`),
  KEY `SENDFRIEND_LOG_TIME` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Send to friend function log storage table';



# Dump of table sequence_creditmemo_0
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sequence_creditmemo_0`;

CREATE TABLE `sequence_creditmemo_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table sequence_creditmemo_1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sequence_creditmemo_1`;

CREATE TABLE `sequence_creditmemo_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table sequence_invoice_0
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sequence_invoice_0`;

CREATE TABLE `sequence_invoice_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table sequence_invoice_1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sequence_invoice_1`;

CREATE TABLE `sequence_invoice_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table sequence_order_0
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sequence_order_0`;

CREATE TABLE `sequence_order_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table sequence_order_1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sequence_order_1`;

CREATE TABLE `sequence_order_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table sequence_shipment_0
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sequence_shipment_0`;

CREATE TABLE `sequence_shipment_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table sequence_shipment_1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sequence_shipment_1`;

CREATE TABLE `sequence_shipment_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `session`;

CREATE TABLE `session` (
  `session_id` varchar(255) NOT NULL COMMENT 'Session Id',
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Date of Session Expiration',
  `session_data` mediumblob NOT NULL COMMENT 'Session Data',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Database Sessions Storage';

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;

INSERT INTO `session` (`session_id`, `session_expires`, `session_data`)
VALUES
	('28282ae53c0274bf52618feb33bf78f4',1509731922,X'58334E6C63334E7062323566646D46736157526864473979583252686447463859546F304F6E747A4F6A45784F694A795A573176644756665957526B63694937637A6F784D446F694D5463794C6A49304C6A41754D534937637A6F344F694A6F6448527758335A7059534937637A6F774F6949694F334D364D6A4136496D6830644842666546396D62334A3359584A6B5A5752665A6D3979496A747A4F6A413649694937637A6F784E546F696148523063463931633256795832466E5A573530496A747A4F6A45794D546F695457393661577873595338314C6A41674B45316859326C756447397A61447367535735305A5777675457466A49453954494667674D5442664D544E664D536B6751584277624756585A574A4C615851764E544D334C6A4D324943684C5346524E5443776762476C725A5342485A574E7262796B67513268796232316C4C7A59784C6A41754D7A45324D7934784D4441675532466D59584A704C7A557A4E79347A4E6949376656397A5A584E7A61573975583268766333527A664745364D547037637A6F354F694A7362324E6862476876633351694F3249364D5474395A47566D59585673644878684F6A453665334D364D544936496E5A7063326C3062334A665A4746305953493759546F7A4F6E747A4F6A457A4F694A7359584E3058335A7063326C3058324630496A747A4F6A45354F6949794D4445334C5445784C54417A494445334F6A55344F6A4D79496A747A4F6A45774F694A7A5A584E7A6157397558326C6B496A747A4F6A4D794F6949794F4449344D6D466C4E544E6A4D4449334E474A6D4E5449324D54686D5A57497A4D324A6D4E7A686D4E434937637A6F784D446F69646D6C7A61585276636C39705A434937637A6F784F694978496A743966574E31633352766257567958324A686332563859546F774F6E74395932686C593274766458523859546F774F6E74396257567A6332466E5A5878684F6A41366533316A595852686247396E664745364D44703766513D3D'),
	('9e8ab0881ce34fc25b139513d756e649',1509733573,X'58334E6C63334E7062323566646D46736157526864473979583252686447463859546F304F6E747A4F6A45784F694A795A573176644756665957526B63694937637A6F784D446F694D5463794C6A49304C6A41754D534937637A6F344F694A6F6448527758335A7059534937637A6F774F6949694F334D364D6A4136496D6830644842666546396D62334A3359584A6B5A5752665A6D3979496A747A4F6A413649694937637A6F784E546F696148523063463931633256795832466E5A573530496A747A4F6A45794D546F695457393661577873595338314C6A41674B45316859326C756447397A61447367535735305A5777675457466A49453954494667674D5442664D544E664D536B6751584277624756585A574A4C615851764E544D334C6A4D324943684C5346524E5443776762476C725A5342485A574E7262796B67513268796232316C4C7A59784C6A41754D7A45324D7934784D4441675532466D59584A704C7A557A4E79347A4E6949376656397A5A584E7A61573975583268766333527A664745364D547037637A6F354F694A7362324E6862476876633351694F3249364D547439595752746157356F64473173664745364D6A7037637A6F354F694A665A6D3979625639725A586B694F334D364D545936496B7454557A64494D6B38304E3068484D327443615555694F334D364E6A6F696247396A5957786C496A747A4F6A5536496D567558315654496A7439595752746157353859546F7A4F6E747A4F6A5136496E567A5A5849694F3038364D7A5536496B31685A3256756447396356584E6C636C784E6232526C624678566332567958456C75644756795932567764473979496A6F784E6A7037637A6F784E546F6941436F41583256325A57353055484A6C5A6D6C34496A747A4F6A45774F694A685A473170626C393163325679496A747A4F6A673649674171414639796232786C496A74504F6A51304F694A4E5957646C626E52765845463164476876636D6C3659585270623235635457396B5A577863556D39735A56784A626E526C636D4E6C63485276636949364D54513665334D364D545536496741714146396C646D5675644642795A575A7065434937637A6F784F546F6959585630614739796158706864476C76626C39796232786C63794937637A6F784E546F6941436F41583256325A57353054324A715A574E30496A747A4F6A5936496D3969616D566A64434937637A6F784E546F6941436F4158326C6B526D6C6C6247524F5957316C496A747A4F6A6336496E4A7662475666615751694F334D364D546736496741714146396F59584E455958526851326868626D646C63794937596A6F774F334D364D5449364967417141463976636D6C6E524746305953493759546F344F6E747A4F6A6336496E4A7662475666615751694F334D364D546F694D534937637A6F354F694A7759584A6C626E5266615751694F334D364D546F694D434937637A6F784D446F6964484A6C5A5639735A585A6C62434937637A6F784F694978496A747A4F6A45774F694A7A62334A30583239795A475679496A747A4F6A4536496A45694F334D364F546F69636D39735A5639306558426C496A747A4F6A4536496B63694F334D364E7A6F6964584E6C636C39705A434937637A6F784F694977496A747A4F6A6B36496E567A5A584A6664486C775A534937637A6F784F694979496A747A4F6A6B36496E4A7662475666626D46745A534937637A6F784E446F6951575274615735706333527959585276636E4D694F33317A4F6A457A4F6949414B67426661584E455A57786C6447566B496A74694F6A4137637A6F784E6A6F6941436F4158334A6C63323931636D4E6C546D46745A534937637A6F304E6A6F695457466E5A573530623178426458526F62334A70656D463061573975584531765A47567358464A6C63323931636D4E6C5457396B5A577863556D39735A534937637A6F784F446F6941436F4158324E766247786C593352706232354F5957316C496A747A4F6A55334F694A4E5957646C626E52765845463164476876636D6C3659585270623235635457396B5A577863556D567A623356795932564E6232526C624678536232786C58454E766247786C59335270623234694F334D364D544936496741714146396A59574E6F5A5652685A794937596A6F774F334D364D546B36496741714146396B59585268553246325A554673624739335A5751694F3249364D54747A4F6A45314F6949414B67426661584E50596D706C5933524F5A5863694F303437637A6F794D7A6F6941436F4158335A6862476C6B59585276636B4A6C5A6D39795A564E68646D55694F303437637A6F784D7A6F6941436F4163335276636D566B524746305953493759546F344F6E747A4F6A6336496E4A7662475666615751694F334D364D546F694D534937637A6F354F694A7759584A6C626E5266615751694F334D364D546F694D434937637A6F784D446F6964484A6C5A5639735A585A6C62434937637A6F784F694978496A747A4F6A45774F694A7A62334A30583239795A475679496A747A4F6A4536496A45694F334D364F546F69636D39735A5639306558426C496A747A4F6A4536496B63694F334D364E7A6F6964584E6C636C39705A434937637A6F784F694977496A747A4F6A6B36496E567A5A584A6664486C775A534937637A6F784F694979496A747A4F6A6B36496E4A7662475666626D46745A534937637A6F784E446F6951575274615735706333527959585276636E4D694F33317A4F6A6736496741714146396B59585268496A74684F6A673665334D364E7A6F69636D39735A5639705A434937637A6F784F694978496A747A4F6A6B36496E4268636D5675644639705A434937637A6F784F694977496A747A4F6A45774F694A30636D566C5832786C646D5673496A747A4F6A4536496A45694F334D364D544136496E4E76636E526662334A6B5A5849694F334D364D546F694D534937637A6F354F694A796232786C58335235634755694F334D364D546F6952794937637A6F334F694A316332567958326C6B496A747A4F6A4536496A41694F334D364F546F6964584E6C636C39306558426C496A747A4F6A4536496A49694F334D364F546F69636D39735A5639755957316C496A747A4F6A45304F694A425A473170626D6C7A64484A6864473979637949376658317A4F6A45324F6949414B6742666147467A556D567A623356795932567A496A74694F6A4537637A6F784F446F6941436F41646D46736157526864476C76626C4A316247567A496A74504F6A4D344F694A4E5957646C626E52765846567A5A584A635457396B5A57786356584E6C636C5A6862476C6B59585270623235536457786C637949364D44703766584D364D545536496741714146396C646D567564453969616D566A64434937637A6F324F694A76596D706C593351694F334D364D54553649674171414639705A455A705A57786B546D46745A534937637A6F334F694A316332567958326C6B496A747A4F6A45344F6949414B6742666147467A5247463059554E6F5957356E5A584D694F3249364D44747A4F6A45794F6949414B67426662334A705A305268644745694F3245364D546B3665334D364E7A6F6964584E6C636C39705A434937637A6F784F694978496A747A4F6A6B36496D5A70636E4E30626D46745A534937637A6F314F694A685A47317062694937637A6F344F694A7359584E30626D46745A534937637A6F314F694A685A47317062694937637A6F314F694A6C6257467062434937637A6F784E7A6F6959575274615735415A586868625842735A53356A623230694F334D364F446F6964584E6C636D3568625755694F334D364E546F6959575274615734694F334D364F446F696347467A63336476636D51694F334D364F546B36496D5A6B59574D345A4456685A6A68694E7A45774D324E6D5954566C4D4463775A6D5A694F44646B5A5749315A4441354D57466A4F5755785954526C4D4449354F474A694D6A686A4F446B304D6D45314D444D334F5759366557396B63575A57636B393462464932526C4258563045305232786955565631536B3973516D6B3362576F364D534937637A6F334F694A6A636D56686447566B496A747A4F6A45354F6949794D4445334C5445784C54417A494445334F6A55334F6A557A496A747A4F6A6736496D31765A476C6D6157566B496A747A4F6A45354F6949794D4445334C5445784C54417A494445344F6A45354F6A5532496A747A4F6A6336496D78765A325268644755694F334D364D546B36496A49774D5463744D5445744D444D674D5467364D546B364E5459694F334D364E6A6F696247396E626E5674496A747A4F6A4536496A45694F334D364D545536496E4A6C624739685A463968593278665A6D78685A794937637A6F784F694977496A747A4F6A6B36496D6C7A5832466A64476C325A534937637A6F784F694978496A747A4F6A5536496D563464484A68496A744F4F334D364F446F69636E4266644739725A5734694F303437637A6F784F546F69636E4266644739725A57356659334A6C5958526C5A46396864434937546A747A4F6A45324F694A70626E526C636D5A68593256666247396A5957786C496A747A4F6A5536496D567558315654496A747A4F6A45794F694A6D59576C7364584A6C63313975645730694F334D364D546F694D434937637A6F784D7A6F695A6D6C79633352665A6D4670624856795A534937546A747A4F6A45794F694A7362324E725832563463476C795A584D694F30343766584D364D544D3649674171414639706330526C624756305A5751694F3249364D44747A4F6A45324F6949414B674266636D567A623356795932564F5957316C496A747A4F6A4D334F694A4E5957646C626E52765846567A5A584A635457396B5A577863556D567A623356795932564E6232526C6246785663325679496A747A4F6A45344F6949414B674266593239736247566A64476C76626B3568625755694F334D364E446736496B31685A3256756447396356584E6C636C784E6232526C624678535A584E7664584A6A5A5531765A4756735846567A5A584A63513239736247566A64476C7662694937637A6F784D6A6F6941436F4158324E685932686C5647466E496A74694F6A4137637A6F784F546F6941436F41583252686447465459585A6C515778736233646C5A434937596A6F784F334D364D545536496741714146397063303969616D566A6445356C64794937546A747A4F6A457A4F6949414B67427A644739795A57524559585268496A74684F6A45354F6E747A4F6A6336496E567A5A584A66615751694F334D364D546F694D534937637A6F354F694A6D61584A7A64473568625755694F334D364E546F6959575274615734694F334D364F446F696247467A64473568625755694F334D364E546F6959575274615734694F334D364E546F695A573168615777694F334D364D546336496D466B62576C7551475634595731776247557559323974496A747A4F6A6736496E567A5A584A755957316C496A747A4F6A5536496D466B62576C75496A747A4F6A6736496E426863334E3362334A6B496A747A4F6A6B354F694A6D5A47466A4F47513159575934596A63784D444E6A5A6D45315A5441334D475A6D596A67335A4756694E5751774F544668597A6C6C4D5745305A5441794F546869596A4934597A67354E444A684E54417A4E7A6C6D4F6E6C765A48466D566E4A50654778534E6B5A51563164424E456473596C46566455705062454A704E3231714F6A45694F334D364E7A6F6959334A6C5958526C5A434937637A6F784F546F694D6A41784E7930784D5330774D7941784E7A6F314E7A6F314D794937637A6F344F694A74623252705A6D6C6C5A434937637A6F784F546F694D6A41784E7930784D5330774D7941784F446F784F546F314E694937637A6F334F694A736232646B5958526C496A747A4F6A45354F6949794D4445334C5445784C54417A494445344F6A45354F6A5532496A747A4F6A5936496D78765A32353162534937637A6F784F694978496A747A4F6A45314F694A795A5778765957526659574E7358325A73595763694F334D364D546F694D434937637A6F354F694A706331396859335270646D55694F334D364D546F694D534937637A6F314F694A6C6548527959534937546A747A4F6A6736496E4A775833527661325675496A744F4F334D364D546B36496E4A77583352766132567558324E795A5746305A575266595851694F303437637A6F784E6A6F69615735305A584A6D59574E6C58327876593246735A534937637A6F314F694A6C626C395655794937637A6F784D6A6F695A6D4670624856795A584E66626E5674496A747A4F6A4536496A41694F334D364D544D36496D5A70636E4E3058325A6861577831636D55694F303437637A6F784D6A6F696247396A6131396C65484270636D567A496A744F4F33317A4F6A6736496741714146396B59585268496A74684F6A45354F6E747A4F6A6336496E567A5A584A66615751694F334D364D546F694D534937637A6F354F694A6D61584A7A64473568625755694F334D364E546F6959575274615734694F334D364F446F696247467A64473568625755694F334D364E546F6959575274615734694F334D364E546F695A573168615777694F334D364D546336496D466B62576C7551475634595731776247557559323974496A747A4F6A6736496E567A5A584A755957316C496A747A4F6A5536496D466B62576C75496A747A4F6A6736496E426863334E3362334A6B496A747A4F6A6B354F694A6D5A47466A4F47513159575934596A63784D444E6A5A6D45315A5441334D475A6D596A67335A4756694E5751774F544668597A6C6C4D5745305A5441794F546869596A4934597A67354E444A684E54417A4E7A6C6D4F6E6C765A48466D566E4A50654778534E6B5A51563164424E456473596C46566455705062454A704E3231714F6A45694F334D364E7A6F6959334A6C5958526C5A434937637A6F784F546F694D6A41784E7930784D5330774D7941784E7A6F314E7A6F314D794937637A6F344F694A74623252705A6D6C6C5A434937637A6F784F546F694D6A41784E7930784D5330774D7941784F446F784F546F314E694937637A6F334F694A736232646B5958526C496A747A4F6A45354F6949794D4445334C5445784C54417A494445344F6A45354F6A5532496A747A4F6A5936496D78765A32353162534937637A6F784F694978496A747A4F6A45314F694A795A5778765957526659574E7358325A73595763694F334D364D546F694D434937637A6F354F694A706331396859335270646D55694F334D364D546F694D534937637A6F314F694A6C6548527959534937546A747A4F6A6736496E4A775833527661325675496A744F4F334D364D546B36496E4A77583352766132567558324E795A5746305A575266595851694F303437637A6F784E6A6F69615735305A584A6D59574E6C58327876593246735A534937637A6F314F694A6C626C395655794937637A6F784D6A6F695A6D4670624856795A584E66626E5674496A747A4F6A4536496A41694F334D364D544D36496D5A70636E4E3058325A6861577831636D55694F303437637A6F784D6A6F696247396A6131396C65484270636D567A496A744F4F333139637A6F7A4F694A68593277694F3038364D6A4536496B31685A32567564473963526E4A686257563362334A725845466A624349364E6A7037637A6F784E6A6F6941436F4158334A76624756535A5764706333527965534937547A6F7A4E546F695457466E5A57353062317847636D46745A586476636D746351574E7358464A7662475663556D566E61584E30636E6B694F6A453665334D364F546F6941436F4158334A766247567A496A74684F6A493665326B364D5474684F6A4D3665334D364F446F696157357A64474675593255694F3038364E444936496B31685A3256756447396351585630614739796158706864476C76626C784E6232526C6246784259327863556D39735A567848636D3931634349364D547037637A6F784D446F6941436F4158334A766247564A5A434937637A6F784F694978496A7439637A6F334F694A7759584A6C626E527A496A74684F6A41366533317A4F6A6736496D4E6F6157786B636D5675496A74684F6A453665326B364D6A74504F6A51784F694A4E5957646C626E52765845463164476876636D6C3659585270623235635457396B5A57786351574E7358464A766247566356584E6C636949364D547037637A6F784D446F6941436F4158334A766247564A5A434937637A6F784F694979496A7439665831704F6A493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A457A4D6A747A4F6A6336496E4268636D567564484D694F3245364D54703761546F784F3349364D5449344F33317A4F6A6736496D4E6F6157786B636D5675496A74684F6A4136653331396658317A4F6A457A4F6949414B674266636D567A623356795932567A496A74684F6A45344F547037637A6F794D446F695457466E5A5735306231394359574E725A57356B4F6A7068624777694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794D446F695457466E5A5735306231394359574E725A57356B4F6A7068624777694F33317A4F6A5936496E4268636D567564434937546A747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794D6A6F695457466E5A5735306231394359574E725A57356B4F6A70685A4731706269493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49794F694A4E5957646C626E527658304A685932746C626D51364F6D466B62576C75496A7439637A6F324F694A7759584A6C626E51694F303437637A6F344F694A6A61476C735A484A6C6269493759546F784D6A7037637A6F794E6A6F695457466E5A5735306231394359574E725A57356B4F6A706B59584E6F596D3968636D51694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A5936496B31685A32567564473966516D466A613256755A446F365A47467A61474A7659584A6B496A7439637A6F794D446F695457466E5A573530623139545957786C637A6F36633246735A584D694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A4136496B31685A32567564473966553246735A584D364F6E4E686247567A496A7439637A6F794E446F695457466E5A57353062313944595852686247396E4F6A706A595852686247396E496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49304F694A4E5957646C626E527658304E6864474673623263364F6D4E6864474673623263694F33317A4F6A49324F694A4E5957646C626E527658304E3163335276625756794F6A706A64584E306232316C63694937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794E6A6F695457466E5A5735306231394464584E306232316C636A6F365933567A644739745A5849694F33317A4F6A45344F694A4E5957646C626E527658304E68636E51364F6D4E68636E51694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D546736496B31685A325675644739665132467964446F36593246796443493766584D364D6A5936496B31685A32567564473966516D466A613256755A446F3662586C6859324E7664573530496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49324F694A4E5957646C626E527658304A685932746C626D51364F6D313559574E6A623356756443493766584D364D6A5936496B31685A32567564473966516D466A613256755A446F3662574679613256306157356E496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49324F694A4E5957646C626E527658304A685932746C626D51364F6D3168636D746C64476C755A79493766584D364D6A5136496B31685A32567564473966516D466A613256755A446F36593239756447567564434937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794E446F695457466E5A5735306231394359574E725A57356B4F6A706A623235305A573530496A7439637A6F794D7A6F695457466E5A573530623139535A584276636E527A4F6A70795A584276636E51694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A4D36496B31685A32567564473966556D567762334A30637A6F36636D567762334A30496A7439637A6F794D7A6F695457466E5A5735306231394359574E725A57356B4F6A707A644739795A584D694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A4D36496B31685A32567564473966516D466A613256755A446F3663335276636D567A496A7439637A6F794D7A6F695457466E5A5735306231394359574E725A57356B4F6A707A65584E305A5730694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A4D36496B31685A32567564473966516D466A613256755A446F3663336C7A64475674496A7439637A6F7A4D446F695457466E5A5735306231394359574E725A57356B4F6A706E624739695957786663325668636D4E6F496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A4D774F694A4E5957646C626E527658304A685932746C626D51364F6D647362324A686246397A5A574679593267694F33313966584D364D6A5936496B31685A32567564473966516D466A613256755A446F365A47467A61474A7659584A6B496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D5455774F334D364E6A6F69634746795A573530496A74794F6A45304E6A747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794D446F695457466E5A573530623139545957786C637A6F36633246735A584D694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F784E544937637A6F324F694A7759584A6C626E51694F3349364D5451324F334D364F446F6959326870624752795A5734694F3245364D547037637A6F7A4D446F695457466E5A573530623139545957786C637A6F36633246735A584E666233426C636D463061573975496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A4D774F694A4E5957646C626E527658314E686247567A4F6A707A5957786C633139766347567959585270623234694F33313966584D364D7A4136496B31685A32567564473966553246735A584D364F6E4E686247567A583239775A584A6864476C766269493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A45344D6A747A4F6A5936496E4268636D567564434937636A6F784E544937637A6F344F694A6A61476C735A484A6C6269493759546F324F6E747A4F6A49324F694A4E5957646C626E527658314E686247567A4F6A707A5957786C63313976636D526C63694937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794E6A6F695457466E5A573530623139545957786C637A6F36633246735A584E6662334A6B5A5849694F33317A4F6A49344F694A4E5957646C626E527658314E686247567A4F6A707A5957786C63313970626E5A7661574E6C496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49344F694A4E5957646C626E527658314E686247567A4F6A707A5957786C63313970626E5A7661574E6C496A7439637A6F794D7A6F695457466E5A573530623139545957786C637A6F36633268706347316C626E51694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A4D36496B31685A32567564473966553246735A584D364F6E4E6F615842745A573530496A7439637A6F7A4D546F695457466E5A573530623139545957786C637A6F36633246735A584E6659334A6C5A476C306257567462794937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F7A4D546F695457466E5A573530623139545957786C637A6F36633246735A584E6659334A6C5A476C30625756746279493766584D364D7A4D36496B31685A3256756447396655474635634746734F6A7069615778736157356E5832466E636D566C6257567564434937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F7A4D7A6F695457466E5A5735306231395159586C77595777364F6D4A7062477870626D6466595764795A5756745A573530496A7439637A6F794E7A6F695457466E5A573530623139545957786C637A6F3664484A68626E4E68593352706232357A496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49334F694A4E5957646C626E527658314E686247567A4F6A7030636D46756332466A64476C76626E4D694F33313966584D364D6A5936496B31685A32567564473966553246735A584D364F6E4E686247567A583239795A475679496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D5467344F334D364E6A6F69634746795A573530496A74794F6A45344D6A747A4F6A6736496D4E6F6157786B636D5675496A74684F6A453665334D364D6A4936496B31685A32567564473966553246735A584D364F6D466A64476C76626E4D694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A4936496B31685A32567564473966553246735A584D364F6D466A64476C76626E4D694F33313966584D364D6A4936496B31685A32567564473966553246735A584D364F6D466A64476C76626E4D694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F794D445137637A6F324F694A7759584A6C626E51694F3349364D5467344F334D364F446F6959326870624752795A5734694F3245364D54553665334D364D6A4536496B31685A32567564473966553246735A584D364F6D4E795A5746305A534937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794D546F695457466E5A573530623139545957786C637A6F3659334A6C5958526C496A7439637A6F794E7A6F695457466E5A573530623139545957786C637A6F3659574E30615739756331393261575633496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49334F694A4E5957646C626E527658314E686247567A4F6A7068593352706232357A58335A705A5863694F33317A4F6A49774F694A4E5957646C626E527658314E686247567A4F6A706C6257467062434937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794D446F695457466E5A573530623139545957786C637A6F365A573168615777694F33317A4F6A49794F694A4E5957646C626E527658314E686247567A4F6A70795A5739795A475679496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49794F694A4E5957646C626E527658314E686247567A4F6A70795A5739795A475679496A7439637A6F794E7A6F695457466E5A573530623139545957786C637A6F3659574E30615739756331396C5A476C30496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49334F694A4E5957646C626E527658314E686247567A4F6A7068593352706232357A5832566B615851694F33317A4F6A49784F694A4E5957646C626E527658314E686247567A4F6A706A5957356A5A5777694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A4536496B31685A32567564473966553246735A584D364F6D4E68626D4E6C6243493766584D364D6A6B36496B31685A32567564473966553246735A584D364F6E4A6C646D6C6C6431397759586C745A573530496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49354F694A4E5957646C626E527658314E686247567A4F6A70795A585A705A58646663474635625756756443493766584D364D6A4936496B31685A32567564473966553246735A584D364F6D4E6863485231636D55694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A4936496B31685A32567564473966553246735A584D364F6D4E6863485231636D55694F33317A4F6A49794F694A4E5957646C626E527658314E686247567A4F6A7070626E5A7661574E6C496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49794F694A4E5957646C626E527658314E686247567A4F6A7070626E5A7661574E6C496A7439637A6F794E546F695457466E5A573530623139545957786C637A6F3659334A6C5A476C306257567462794937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794E546F695457466E5A573530623139545957786C637A6F3659334A6C5A476C30625756746279493766584D364D546B36496B31685A32567564473966553246735A584D364F6D6876624751694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D546B36496B31685A32567564473966553246735A584D364F6D6876624751694F33317A4F6A49784F694A4E5957646C626E527658314E686247567A4F6A7031626D6876624751694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A4536496B31685A32567564473966553246735A584D364F6E5675614739735A43493766584D364D546B36496B31685A32567564473966553246735A584D364F6E4E6F615841694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D546B36496B31685A32567564473966553246735A584D364F6E4E6F615841694F33317A4F6A49794F694A4E5957646C626E527658314E686247567A4F6A706A623231745A573530496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49794F694A4E5957646C626E527658314E686247567A4F6A706A623231745A573530496A7439637A6F794D546F695457466E5A573530623139545957786C637A6F365A5731686157787A496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49784F694A4E5957646C626E527658314E686247567A4F6A706C6257467062484D694F33313966584D364D6A4536496B31685A32567564473966553246735A584D364F6D4E795A5746305A53493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A49784D44747A4F6A5936496E4268636D567564434937636A6F794D445137637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A6336496B31685A32567564473966553246735A584D364F6D466A64476C76626E4E66646D6C6C6479493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A49784D6A747A4F6A5936496E4268636D567564434937636A6F794D445137637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A4136496B31685A32567564473966553246735A584D364F6D567459576C73496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D6A45304F334D364E6A6F69634746795A573530496A74794F6A49774E44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794D6A6F695457466E5A573530623139545957786C637A6F36636D5676636D526C6369493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A49784E6A747A4F6A5936496E4268636D567564434937636A6F794D445137637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A6336496B31685A32567564473966553246735A584D364F6D466A64476C76626E4E665A5752706443493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A49784F44747A4F6A5936496E4268636D567564434937636A6F794D445137637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A4536496B31685A32567564473966553246735A584D364F6D4E68626D4E6C6243493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A49794D44747A4F6A5936496E4268636D567564434937636A6F794D445137637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A6B36496B31685A32567564473966553246735A584D364F6E4A6C646D6C6C6431397759586C745A573530496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D6A49794F334D364E6A6F69634746795A573530496A74794F6A49774E44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794D6A6F695457466E5A573530623139545957786C637A6F3659324677644856795A53493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A49794E44747A4F6A5936496E4268636D567564434937636A6F794D445137637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A4936496B31685A32567564473966553246735A584D364F6D6C75646D3970593255694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F794D6A5937637A6F324F694A7759584A6C626E51694F3349364D6A41304F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A49314F694A4E5957646C626E527658314E686247567A4F6A706A636D566B615852745A573176496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D6A49344F334D364E6A6F69634746795A573530496A74794F6A49774E44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F784F546F695457466E5A573530623139545957786C637A6F36614739735A43493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A497A4D44747A4F6A5936496E4268636D567564434937636A6F794D445137637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A4536496B31685A32567564473966553246735A584D364F6E5675614739735A43493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A497A4D6A747A4F6A5936496E4268636D567564434937636A6F794D445137637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D546B36496B31685A32567564473966553246735A584D364F6E4E6F615841694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F794D7A5137637A6F324F694A7759584A6C626E51694F3349364D6A41304F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A49794F694A4E5957646C626E527658314E686247567A4F6A706A623231745A573530496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D6A4D324F334D364E6A6F69634746795A573530496A74794F6A49774E44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794D546F695457466E5A573530623139545957786C637A6F365A5731686157787A496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D6A4D344F334D364E6A6F69634746795A573530496A74794F6A49774E44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794F446F695457466E5A573530623139545957786C637A6F36633246735A584E666157353262326C6A5A53493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A45354D44747A4F6A5936496E4268636D567564434937636A6F784F444937637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A4D36496B31685A32567564473966553246735A584D364F6E4E6F615842745A573530496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D546B794F334D364E6A6F69634746795A573530496A74794F6A45344D6A747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F7A4D546F695457466E5A573530623139545957786C637A6F36633246735A584E6659334A6C5A476C30625756746279493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A45354E44747A4F6A5936496E4268636D567564434937636A6F784F444937637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D7A4D36496B31685A3256756447396655474635634746734F6A7069615778736157356E5832466E636D566C625756756443493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A45354E6A747A4F6A5936496E4268636D567564434937636A6F784F444937637A6F344F694A6A61476C735A484A6C6269493759546F784F6E747A4F6A51784F694A4E5957646C626E5276583142686558426862446F36596D6C7362476C755A3139685A334A6C5A57316C626E526659574E306157397563794937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F304D546F695457466E5A5735306231395159586C77595777364F6D4A7062477870626D6466595764795A5756745A5735305832466A64476C76626E4D694F33313966584D364E444536496B31685A3256756447396655474635634746734F6A7069615778736157356E5832466E636D566C6257567564463968593352706232357A496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D7A45324F334D364E6A6F69634746795A573530496A74794F6A45354E6A747A4F6A6736496D4E6F6157786B636D5675496A74684F6A4D3665334D364E445936496B31685A3256756447396655474635634746734F6A7069615778736157356E5832466E636D566C6257567564463968593352706232357A58335A705A5863694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364E445936496B31685A3256756447396655474635634746734F6A7069615778736157356E5832466E636D566C6257567564463968593352706232357A58335A705A5863694F33317A4F6A4D774F694A4E5957646C626E5276583142686558426862446F3659574E306157397563313974595735685A3255694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D7A4136496B31685A3256756447396655474635634746734F6A7068593352706232357A58323168626D466E5A53493766584D364D546B36496B31685A3256756447396655474635634746734F6A7031633255694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D546B36496B31685A3256756447396655474635634746734F6A7031633255694F33313966584D364E445936496B31685A3256756447396655474635634746734F6A7069615778736157356E5832466E636D566C6257567564463968593352706232357A58335A705A5863694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F7A4D6A4937637A6F324F694A7759584A6C626E51694F3349364D7A45324F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A4D774F694A4E5957646C626E5276583142686558426862446F3659574E306157397563313974595735685A3255694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F7A4D6A5137637A6F324F694A7759584A6C626E51694F3349364D7A45324F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A45354F694A4E5957646C626E5276583142686558426862446F3664584E6C496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D7A49324F334D364E6A6F69634746795A573530496A74794F6A4D784E6A747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794E7A6F695457466E5A573530623139545957786C637A6F3664484A68626E4E68593352706232357A496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D546B344F334D364E6A6F69634746795A573530496A74794F6A45344D6A747A4F6A6736496D4E6F6157786B636D5675496A74684F6A453665334D364D7A4D36496B31685A32567564473966553246735A584D364F6E52795957357A59574E30615739756331396D5A58526A61434937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F7A4D7A6F695457466E5A573530623139545957786C637A6F3664484A68626E4E68593352706232357A58325A6C64474E6F496A74396658317A4F6A4D7A4F694A4E5957646C626E527658314E686247567A4F6A7030636D46756332466A64476C76626E4E665A6D5630593267694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F7A4E445137637A6F324F694A7759584A6C626E51694F3349364D546B344F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A49304F694A4E5957646C626E527658304E6864474673623263364F6D4E6864474673623263694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F784E545137637A6F324F694A7759584A6C626E51694F3349364D5451324F334D364F446F6959326870624752795A5734694F3245364D547037637A6F7A4E446F695457466E5A57353062313944595852686247396E4F6A706A595852686247396E58326C75646D56756447397965534937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F7A4E446F695457466E5A57353062313944595852686247396E4F6A706A595852686247396E58326C75646D5675644739796553493766583139637A6F7A4E446F695457466E5A57353062313944595852686247396E4F6A706A595852686247396E58326C75646D5675644739796553493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A4D314E44747A4F6A5936496E4268636D567564434937636A6F784E545137637A6F344F694A6A61476C735A484A6C6269493759546F794F6E747A4F6A49314F694A4E5957646C626E527658304E6864474673623263364F6E4279623252315933527A496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49314F694A4E5957646C626E527658304E6864474673623263364F6E4279623252315933527A496A7439637A6F794E7A6F695457466E5A57353062313944595852686247396E4F6A706A5958526C5A3239796157567A496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49334F694A4E5957646C626E527658304E6864474673623263364F6D4E686447566E62334A705A584D694F33313966584D364D6A5536496B31685A3256756447396651324630595778765A7A6F3663484A765A48566A64484D694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F7A4E6A4137637A6F324F694A7759584A6C626E51694F3349364D7A55304F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A49334F694A4E5957646C626E527658304E6864474673623263364F6D4E686447566E62334A705A584D694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F7A4E6A4937637A6F324F694A7759584A6C626E51694F3349364D7A55304F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A49324F694A4E5957646C626E527658304E3163335276625756794F6A706A64584E306232316C6369493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A45314E6A747A4F6A5936496E4268636D567564434937636A6F784E445937637A6F344F694A6A61476C735A484A6C6269493759546F794F6E747A4F6A49304F694A4E5957646C626E527658304E3163335276625756794F6A7074595735685A3255694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A5136496B31685A325675644739665133567A644739745A5849364F6D3168626D466E5A53493766584D364D6A5136496B31685A325675644739665133567A644739745A5849364F6D397562476C755A534937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794E446F695457466E5A5735306231394464584E306232316C636A6F36623235736157356C496A74396658317A4F6A49304F694A4E5957646C626E527658304E3163335276625756794F6A7074595735685A3255694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F7A4E7A5937637A6F324F694A7759584A6C626E51694F3349364D5455324F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A49304F694A4E5957646C626E527658304E3163335276625756794F6A7076626D7870626D55694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F7A4E7A6737637A6F324F694A7759584A6C626E51694F3349364D5455324F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A45344F694A4E5957646C626E527658304E68636E51364F6D4E68636E51694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F784E546737637A6F324F694A7759584A6C626E51694F3349364D5451324F334D364F446F6959326870624752795A5734694F3245364D547037637A6F794D446F695457466E5A5735306231394459584A304F6A7074595735685A3255694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A4136496B31685A325675644739665132467964446F36625746755957646C496A74396658317A4F6A49774F694A4E5957646C626E527658304E68636E51364F6D3168626D466E5A53493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A4D354D6A747A4F6A5936496E4268636D567564434937636A6F784E546737637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A5936496B31685A32567564473966516D466A613256755A446F3662586C6859324E7664573530496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D5459774F334D364E6A6F69634746795A573530496A74794F6A45304E6A747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794E6A6F695457466E5A5735306231394359574E725A57356B4F6A707459584A725A585270626D63694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F784E6A4937637A6F324F694A7759584A6C626E51694F3349364D5451324F334D364F446F6959326870624752795A5734694F3245364E447037637A6F794E6A6F695457466E5A57353062313944595852686247396E556E56735A546F3663484A76625738694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A5936496B31685A3256756447396651324630595778765A314A31624755364F6E427962323176496A7439637A6F304D546F695457466E5A5735306231394359574E725A57356B4F6A707459584A725A585270626D6466593239746258567561574E6864476C76626E4D694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364E444536496B31685A32567564473966516D466A613256755A446F3662574679613256306157356E58324E7662573131626D6C6A595852706232357A496A7439637A6F7A4D446F695457466E5A5735306231394359574E725A57356B4F6A707459584A725A585270626D646663325676496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A4D774F694A4E5957646C626E527658304A685932746C626D51364F6D3168636D746C64476C755A31397A5A5738694F33317A4F6A4D354F694A4E5957646C626E527658304A685932746C626D51364F6D3168636D746C64476C755A3139316332567958324E76626E526C626E51694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D7A6B36496B31685A32567564473966516D466A613256755A446F3662574679613256306157356E5833567A5A584A6659323975644756756443493766583139637A6F794E6A6F695457466E5A57353062313944595852686247396E556E56735A546F3663484A76625738694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F304D445937637A6F324F694A7759584A6C626E51694F3349364D5459794F334D364F446F6959326870624752795A5734694F3245364D6A7037637A6F7A4E446F695457466E5A57353062313944595852686247396E556E56735A546F3663484A766257396659324630595778765A794937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F7A4E446F695457466E5A57353062313944595852686247396E556E56735A546F3663484A766257396659324630595778765A79493766584D364D6A5136496B31685A32567564473966553246735A584E536457786C4F6A7078645739305A534937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794E446F695457466E5A573530623139545957786C63314A31624755364F6E46316233526C496A74396658317A4F6A4D304F694A4E5957646C626E527658304E6864474673623264536457786C4F6A7077636D39746231396A595852686247396E496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E4445344F334D364E6A6F69634746795A573530496A74794F6A51774E6A747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794E446F695457466E5A573530623139545957786C63314A31624755364F6E46316233526C496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E4449774F334D364E6A6F69634746795A573530496A74794F6A51774E6A747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F304D546F695457466E5A5735306231394359574E725A57356B4F6A707459584A725A585270626D6466593239746258567561574E6864476C76626E4D694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F304D446737637A6F324F694A7759584A6C626E51694F3349364D5459794F334D364F446F6959326870624752795A5734694F3245364E447037637A6F794D7A6F695457466E5A573530623139466257467062446F366447567463477868644755694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A4D36496B31685A3256756447396652573168615777364F6E526C625842735958526C496A7439637A6F794F446F695457466E5A5735306231394F5A58647A62475630644756794F6A70305A573177624746305A534937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794F446F695457466E5A5735306231394F5A58647A62475630644756794F6A70305A573177624746305A53493766584D364D6A5536496B31685A32567564473966546D56336332786C6448526C636A6F366358566C645755694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A5536496B31685A32567564473966546D56336332786C6448526C636A6F366358566C645755694F33317A4F6A4D774F694A4E5957646C626E52765830356C64334E735A5852305A5849364F6E4E31596E4E6A636D6C695A5849694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D7A4136496B31685A32567564473966546D56336332786C6448526C636A6F366333566963324E7961574A6C6369493766583139637A6F794D7A6F695457466E5A573530623139466257467062446F366447567463477868644755694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F304D7A5137637A6F324F694A7759584A6C626E51694F3349364E4441344F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A49344F694A4E5957646C626E52765830356C64334E735A5852305A5849364F6E526C625842735958526C496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E444D324F334D364E6A6F69634746795A573530496A74794F6A51774F44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794E546F695457466E5A5735306231394F5A58647A62475630644756794F6A7078645756315A53493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A517A4F44747A4F6A5936496E4268636D567564434937636A6F304D446737637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D7A4136496B31685A32567564473966546D56336332786C6448526C636A6F366333566963324E7961574A6C6369493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A51304D44747A4F6A5936496E4268636D567564434937636A6F304D446737637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D7A4136496B31685A32567564473966516D466A613256755A446F3662574679613256306157356E58334E6C6279493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A51784D44747A4F6A5936496E4268636D567564434937636A6F784E6A4937637A6F344F694A6A61476C735A484A6C6269493759546F304F6E747A4F6A49794F694A4E5957646C626E527658314E6C59584A6A61446F3663325668636D4E6F496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49794F694A4E5957646C626E527658314E6C59584A6A61446F3663325668636D4E6F496A7439637A6F794E446F695457466E5A573530623139545A574679593267364F6E4E35626D39756557317A496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49304F694A4E5957646C626E527658314E6C59584A6A61446F3663336C756232353562584D694F33317A4F6A4D774F694A4E5957646C626E52765831567962464A6C64334A70644755364F6E567962484A6C64334A70644755694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D7A4136496B31685A3256756447396656584A73556D5633636D6C305A546F3664584A73636D5633636D6C305A53493766584D364D6A5136496B31685A3256756447396655326C305A57316863446F3663326C305A57316863434937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794E446F695457466E5A573530623139546158526C625746774F6A707A6158526C62574677496A74396658317A4F6A49794F694A4E5957646C626E527658314E6C59584A6A61446F3663325668636D4E6F496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E4459794F334D364E6A6F69634746795A573530496A74794F6A51784D44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794E446F695457466E5A573530623139545A574679593267364F6E4E35626D39756557317A496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E4459304F334D364E6A6F69634746795A573530496A74794F6A51784D44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F7A4D446F695457466E5A57353062313956636D78535A5864796158526C4F6A7031636D78795A5864796158526C496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E4459324F334D364E6A6F69634746795A573530496A74794F6A51784D44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794E446F695457466E5A573530623139546158526C625746774F6A707A6158526C62574677496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E4459344F334D364E6A6F69634746795A573530496A74794F6A51784D44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F7A4F546F695457466E5A5735306231394359574E725A57356B4F6A707459584A725A585270626D646664584E6C636C396A623235305A573530496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E4445794F334D364E6A6F69634746795A573530496A74794F6A45324D6A747A4F6A6736496D4E6F6157786B636D5675496A74684F6A493665334D364D6A6336496B31685A32567564473966556D5632615756334F6A70795A585A705A58647A5832467362434937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794E7A6F695457466E5A573530623139535A585A705A5863364F6E4A6C646D6C6C64334E6659577873496A7439637A6F794D7A6F695457466E5A573530623139535A585A705A5863364F6E426C626D5270626D63694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A4D36496B31685A32567564473966556D5632615756334F6A70775A57356B6157356E496A74396658317A4F6A49334F694A4E5957646C626E527658314A6C646D6C6C647A6F36636D56326157563363313968624777694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F304F544137637A6F324F694A7759584A6C626E51694F3349364E4445794F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A497A4F694A4E5957646C626E527658314A6C646D6C6C647A6F36634756755A476C755A79493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A51354D6A747A4F6A5936496E4268636D567564434937636A6F304D544937637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A5136496B31685A32567564473966516D466A613256755A446F3659323975644756756443493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A45324E44747A4F6A5936496E4268636D567564434937636A6F784E445937637A6F344F694A6A61476C735A484A6C6269493759546F7A4F6E747A4F6A4D7A4F694A4E5957646C626E527658304A685932746C626D51364F6D4E76626E526C626E52665A57786C6257567564484D694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D7A4D36496B31685A32567564473966516D466A613256755A446F3659323975644756756446396C624756745A5735306379493766584D364D6A4D36496B31685A32567564473966516D466A613256755A446F365A47567A61576475496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A497A4F694A4E5957646C626E527658304A685932746C626D51364F6D526C63326C6E6269493766584D364D7A5936496B31685A32567564473966516D466A613256755A446F36593239756447567564463930636D46756332786864476C7662694937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F7A4E6A6F695457466E5A5735306231394359574E725A57356B4F6A706A623235305A573530583352795957357A6247463061573975496A74396658317A4F6A4D7A4F694A4E5957646C626E527658304A685932746C626D51364F6D4E76626E526C626E52665A57786C6257567564484D694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F314D445937637A6F324F694A7759584A6C626E51694F3349364D5459304F334D364F446F6959326870624752795A5734694F3245364E447037637A6F784E7A6F695457466E5A5735306231394462584D364F6E42685A3255694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D546336496B31685A325675644739665132317A4F6A70775957646C496A7439637A6F784F446F695457466E5A5735306231394462584D364F6D4A7362324E72496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A45344F694A4E5957646C626E527658304E74637A6F36596D7876593273694F33317A4F6A4D784F694A4E5957646C626E5276583164705A47646C64446F3664326C6B5A32563058326C7563335268626D4E6C496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A4D784F694A4E5957646C626E5276583164705A47646C64446F3664326C6B5A32563058326C7563335268626D4E6C496A7439637A6F794E6A6F695457466E5A5735306231394462584D364F6D316C5A476C68583264686247786C636E6B694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A5936496B31685A325675644739665132317A4F6A70745A5752705956396E595778735A584A35496A74396658317A4F6A45334F694A4E5957646C626E527658304E74637A6F366347466E5A53493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A55784E6A747A4F6A5936496E4268636D567564434937636A6F314D445937637A6F344F694A6A61476C735A484A6C6269493759546F794F6E747A4F6A45334F694A4E5957646C626E527658304E74637A6F36633246325A534937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F784E7A6F695457466E5A5735306231394462584D364F6E4E68646D55694F33317A4F6A49304F694A4E5957646C626E527658304E74637A6F366347466E5A56396B5A57786C644755694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A5136496B31685A325675644739665132317A4F6A70775957646C5832526C624756305A53493766583139637A6F784E7A6F695457466E5A5735306231394462584D364F6E4E68646D55694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F314D6A6737637A6F324F694A7759584A6C626E51694F3349364E5445324F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A49304F694A4E5957646C626E527658304E74637A6F366347466E5A56396B5A57786C644755694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F314D7A4137637A6F324F694A7759584A6C626E51694F3349364E5445324F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A45344F694A4E5957646C626E527658304E74637A6F36596D7876593273694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F314D546737637A6F324F694A7759584A6C626E51694F3349364E5441324F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A4D784F694A4E5957646C626E5276583164705A47646C64446F3664326C6B5A32563058326C7563335268626D4E6C496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E5449774F334D364E6A6F69634746795A573530496A74794F6A55774E6A747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794E6A6F695457466E5A5735306231394462584D364F6D316C5A476C68583264686247786C636E6B694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F314D6A4937637A6F324F694A7759584A6C626E51694F3349364E5441324F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A497A4F694A4E5957646C626E527658304A685932746C626D51364F6D526C63326C6E6269493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A55774F44747A4F6A5936496E4268636D567564434937636A6F784E6A5137637A6F344F694A6A61476C735A484A6C6269493759546F794F6E747A4F6A49774F694A4E5957646C626E52765831526F5A57316C4F6A7030614756745A534937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794D446F695457466E5A57353062313955614756745A546F366447686C625755694F33317A4F6A49314F694A4E5957646C626E527658304A685932746C626D51364F6E4E6A6147566B6457786C496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49314F694A4E5957646C626E527658304A685932746C626D51364F6E4E6A6147566B6457786C496A74396658317A4F6A49774F694A4E5957646C626E52765831526F5A57316C4F6A7030614756745A53493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A55314E6A747A4F6A5936496E4268636D567564434937636A6F314D446737637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A5536496B31685A32567564473966516D466A613256755A446F3663324E6F5A575231624755694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F314E546737637A6F324F694A7759584A6C626E51694F3349364E5441344F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A4D324F694A4E5957646C626E527658304A685932746C626D51364F6D4E76626E526C626E526664484A68626E4E7359585270623234694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F314D544137637A6F324F694A7759584A6C626E51694F3349364D5459304F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A497A4F694A4E5957646C626E527658314A6C6347397964484D364F6E4A6C634739796443493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A45324E6A747A4F6A5936496E4268636D567564434937636A6F784E445937637A6F344F694A6A61476C735A484A6C6269493759546F324F6E747A4F6A4D7A4F694A4E5957646C626E527658314A6C6347397964484D364F6E4A6C634739796446397459584A725A585270626D63694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D7A4D36496B31685A32567564473966556D567762334A30637A6F36636D567762334A3058323168636D746C64476C755A79493766584D364D6A4D36496B31685A32567564473966556D567762334A30637A6F36636D563261575633496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A497A4F694A4E5957646C626E527658314A6C6347397964484D364F6E4A6C646D6C6C6479493766584D364D6A5936496B31685A32567564473966556D567762334A30637A6F36633246735A584E7962323930496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49324F694A4E5957646C626E527658314A6C6347397964484D364F6E4E686247567A636D39766443493766584D364D6A5936496B31685A32567564473966556D567762334A30637A6F365933567A644739745A584A7A496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49324F694A4E5957646C626E527658314A6C6347397964484D364F6D4E3163335276625756796379493766584D364D7A4936496B31685A32567564473966556D567762334A30637A6F36636D567762334A3058334279623252315933527A496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A4D794F694A4E5957646C626E527658314A6C6347397964484D364F6E4A6C6347397964463977636D396B64574E306379493766584D364D6A6336496B31685A32567564473966556D567762334A30637A6F366333526864476C7A64476C6A63794937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794E7A6F695457466E5A573530623139535A584276636E527A4F6A707A6447463061584E3061574E7A496A74396658317A4F6A4D7A4F694A4E5957646C626E527658314A6C6347397964484D364F6E4A6C634739796446397459584A725A585270626D63694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F314E7A5937637A6F324F694A7759584A6C626E51694F3349364D5459324F334D364F446F6959326870624752795A5734694F3245364D7A7037637A6F794E546F695457466E5A573530623139535A584276636E527A4F6A707A614739775932467964434937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794E546F695457466E5A573530623139535A584276636E527A4F6A707A61473977593246796443493766584D364D7A4136496B31685A32567564473966556D567762334A30637A6F36636D567762334A3058334E6C59584A6A61434937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F7A4D446F695457466E5A573530623139535A584276636E527A4F6A70795A584276636E526663325668636D4E6F496A7439637A6F794E7A6F695457466E5A5735306231394F5A58647A62475630644756794F6A7077636D396962475674496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49334F694A4E5957646C626E52765830356C64334E735A5852305A5849364F6E427962324A735A5730694F33313966584D364D6A5536496B31685A32567564473966556D567762334A30637A6F366332687663474E68636E51694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F314F544937637A6F324F694A7759584A6C626E51694F3349364E5463324F334D364F446F6959326870624752795A5734694F3245364D6A7037637A6F794E446F695457466E5A573530623139535A584276636E527A4F6A7077636D396B64574E30496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49304F694A4E5957646C626E527658314A6C6347397964484D364F6E427962325231593351694F33317A4F6A49324F694A4E5957646C626E527658314A6C6347397964484D364F6D46695957356B6232356C5A434937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794E6A6F695457466E5A573530623139535A584276636E527A4F6A7068596D46755A4739755A5751694F33313966584D364D6A5136496B31685A32567564473966556D567762334A30637A6F3663484A765A48566A6443493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A59774D6A747A4F6A5936496E4268636D567564434937636A6F314F544937637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A5936496B31685A32567564473966556D567762334A30637A6F3659574A68626D5276626D566B496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E6A41304F334D364E6A6F69634746795A573530496A74794F6A55354D6A747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F7A4D446F695457466E5A573530623139535A584276636E527A4F6A70795A584276636E526663325668636D4E6F496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E546B304F334D364E6A6F69634746795A573530496A74794F6A55334E6A747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794E7A6F695457466E5A5735306231394F5A58647A62475630644756794F6A7077636D396962475674496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E546B324F334D364E6A6F69634746795A573530496A74794F6A55334E6A747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794D7A6F695457466E5A573530623139535A584276636E527A4F6A70795A585A705A5863694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F314E7A6737637A6F324F694A7759584A6C626E51694F3349364D5459324F334D364F446F6959326870624752795A5734694F3245364D6A7037637A6F7A4D6A6F695457466E5A573530623139535A584276636E527A4F6A70795A585A705A5864665933567A644739745A5849694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D7A4936496B31685A32567564473966556D567762334A30637A6F36636D56326157563358324E316333527662575679496A7439637A6F7A4D546F695457466E5A573530623139535A584276636E527A4F6A70795A585A705A58646663484A765A48566A64434937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F7A4D546F695457466E5A573530623139535A584276636E527A4F6A70795A585A705A58646663484A765A48566A6443493766583139637A6F7A4D6A6F695457466E5A573530623139535A584276636E527A4F6A70795A585A705A5864665933567A644739745A5849694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F324D6A5937637A6F324F694A7759584A6C626E51694F3349364E5463344F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A4D784F694A4E5957646C626E527658314A6C6347397964484D364F6E4A6C646D6C6C64313977636D396B64574E30496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E6A49344F334D364E6A6F69634746795A573530496A74794F6A55334F44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794E6A6F695457466E5A573530623139535A584276636E527A4F6A707A5957786C63334A76623351694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F314F444137637A6F324F694A7759584A6C626E51694F3349364D5459324F334D364F446F6959326870624752795A5734694F3245364F447037637A6F7A4D6A6F695457466E5A573530623139535A584276636E527A4F6A707A5957786C63334A7662335266633246735A584D694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D7A4936496B31685A32567564473966556D567762334A30637A6F36633246735A584E796232393058334E686247567A496A7439637A6F794D446F695457466E5A573530623139535A584276636E527A4F6A7030595867694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A4136496B31685A32567564473966556D567762334A30637A6F3664474634496A7439637A6F794E546F695457466E5A573530623139535A584276636E527A4F6A7070626E5A7661574E6C5A434937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794E546F695457466E5A573530623139535A584276636E527A4F6A7070626E5A7661574E6C5A43493766584D364D6A5536496B31685A32567564473966556D567762334A30637A6F366332687063484270626D63694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A5536496B31685A32567564473966556D567762334A30637A6F366332687063484270626D63694F33317A4F6A49314F694A4E5957646C626E527658314A6C6347397964484D364F6E4A6C5A6E56755A47566B496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49314F694A4E5957646C626E527658314A6C6347397964484D364F6E4A6C5A6E56755A47566B496A7439637A6F794E446F695457466E5A573530623139535A584276636E527A4F6A706A623356776232357A496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49304F694A4E5957646C626E527658314A6C6347397964484D364F6D4E7664584276626E4D694F33317A4F6A51784F694A4E5957646C626E5276583142686558426862446F36634746356347467358334E6C644852735A57316C626E5266636D567762334A3063794937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F304D546F695457466E5A5735306231395159586C77595777364F6E4268655842686246397A5A585230624756745A57353058334A6C6347397964484D694F33317A4F6A4D324F694A4E5957646C626E527658304A7959576C7564484A6C5A546F36633256306447786C62575675644639795A584276636E51694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D7A5936496B31685A32567564473966516E4A6861573530636D566C4F6A707A5A585230624756745A57353058334A6C634739796443493766583139637A6F7A4D6A6F695457466E5A573530623139535A584276636E527A4F6A707A5957786C63334A7662335266633246735A584D694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F324E444937637A6F324F694A7759584A6C626E51694F3349364E5467774F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A49774F694A4E5957646C626E527658314A6C6347397964484D364F6E52686543493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A59304E44747A4F6A5936496E4268636D567564434937636A6F314F444137637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A5536496B31685A32567564473966556D567762334A30637A6F366157353262326C6A5A5751694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F324E445937637A6F324F694A7759584A6C626E51694F3349364E5467774F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A49314F694A4E5957646C626E527658314A6C6347397964484D364F6E4E6F615842776157356E496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E6A51344F334D364E6A6F69634746795A573530496A74794F6A55344D44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794E546F695457466E5A573530623139535A584276636E527A4F6A70795A575A31626D526C5A43493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A59314D44747A4F6A5936496E4268636D567564434937636A6F314F444137637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A5136496B31685A32567564473966556D567762334A30637A6F3659323931634739756379493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A59314D6A747A4F6A5936496E4268636D567564434937636A6F314F444137637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364E444536496B31685A3256756447396655474635634746734F6A707759586C7759577866633256306447786C62575675644639795A584276636E527A496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E6A55304F334D364E6A6F69634746795A573530496A74794F6A55344D44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A493665334D364E445936496B31685A3256756447396655474635634746734F6A707759586C7759577866633256306447786C62575675644639795A584276636E527A58335A705A5863694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364E445936496B31685A3256756447396655474635634746734F6A707759586C7759577866633256306447786C62575675644639795A584276636E527A58335A705A5863694F33317A4F6A49784F694A4E5957646C626E5276583142686558426862446F365A6D5630593267694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A4536496B31685A3256756447396655474635634746734F6A706D5A58526A6143493766583139637A6F304E6A6F695457466E5A5735306231395159586C77595777364F6E4268655842686246397A5A585230624756745A57353058334A6C6347397964484E66646D6C6C6479493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A59344E6A747A4F6A5936496E4268636D567564434937636A6F324E545137637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A4536496B31685A3256756447396655474635634746734F6A706D5A58526A6143493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A59344F44747A4F6A5936496E4268636D567564434937636A6F324E545137637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D7A5936496B31685A32567564473966516E4A6861573530636D566C4F6A707A5A585230624756745A57353058334A6C634739796443493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A59314E6A747A4F6A5936496E4268636D567564434937636A6F314F444137637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A5936496B31685A32567564473966556D567762334A30637A6F365933567A644739745A584A7A496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E5467794F334D364E6A6F69634746795A573530496A74794F6A45324E6A747A4F6A6736496D4E6F6157786B636D5675496A74684F6A4D3665334D364D6A4D36496B31685A32567564473966556D567762334A30637A6F36644739305957787A496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A497A4F694A4E5957646C626E527658314A6C6347397964484D364F6E5276644746736379493766584D364D7A4D36496B31685A32567564473966556D567762334A30637A6F365933567A644739745A584A7A583239795A47567963794937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F7A4D7A6F695457466E5A573530623139535A584276636E527A4F6A706A64584E306232316C636E4E6662334A6B5A584A7A496A7439637A6F794E546F695457466E5A573530623139535A584276636E527A4F6A706859324E766457353063794937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794E546F695457466E5A573530623139535A584276636E527A4F6A706859324E76645735306379493766583139637A6F794D7A6F695457466E5A573530623139535A584276636E527A4F6A70306233526862484D694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F334D445937637A6F324F694A7759584A6C626E51694F3349364E5467794F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A4D7A4F694A4E5957646C626E527658314A6C6347397964484D364F6D4E31633352766257567963313976636D526C636E4D694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F334D446737637A6F324F694A7759584A6C626E51694F3349364E5467794F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A49314F694A4E5957646C626E527658314A6C6347397964484D364F6D466A59323931626E527A496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E7A45774F334D364E6A6F69634746795A573530496A74794F6A55344D6A747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F7A4D6A6F695457466E5A573530623139535A584276636E527A4F6A70795A584276636E526663484A765A48566A64484D694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F314F445137637A6F324F694A7759584A6C626E51694F3349364D5459324F334D364F446F6959326870624752795A5734694F3245364E547037637A6F794D7A6F695457466E5A573530623139535A584276636E527A4F6A7032615756335A5751694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A4D36496B31685A32567564473966556D567762334A30637A6F36646D6C6C6432566B496A7439637A6F794F446F695457466E5A573530623139535A584276636E527A4F6A70695A584E30633256736247567963794937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794F446F695457466E5A573530623139535A584276636E527A4F6A70695A584E3063325673624756796379493766584D364D6A5536496B31685A32567564473966556D567762334A30637A6F366247393363335276593273694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A5536496B31685A32567564473966556D567762334A30637A6F366247393363335276593273694F33317A4F6A49784F694A4E5957646C626E527658314A6C6347397964484D364F6E4E76624751694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A4536496B31685A32567564473966556D567762334A30637A6F36633239735A43493766584D364D6A5936496B31685A32567564473966556D567762334A30637A6F365A473933626D78765957527A496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49324F694A4E5957646C626E527658314A6C6347397964484D364F6D5276643235736232466B6379493766583139637A6F794D7A6F695457466E5A573530623139535A584276636E527A4F6A7032615756335A5751694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F334D6A6737637A6F324F694A7759584A6C626E51694F3349364E5467304F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A49344F694A4E5957646C626E527658314A6C6347397964484D364F6D4A6C6333527A5A5778735A584A7A496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E7A4D774F334D364E6A6F69634746795A573530496A74794F6A55344E44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794E546F695457466E5A573530623139535A584276636E527A4F6A70736233647A6447396A6179493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A637A4D6A747A4F6A5936496E4268636D567564434937636A6F314F445137637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A4536496B31685A32567564473966556D567762334A30637A6F36633239735A43493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A637A4E44747A4F6A5936496E4268636D567564434937636A6F314F445137637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A5936496B31685A32567564473966556D567762334A30637A6F365A473933626D78765957527A496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E7A4D324F334D364E6A6F69634746795A573530496A74794F6A55344E44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794E7A6F695457466E5A573530623139535A584276636E527A4F6A707A6447463061584E3061574E7A496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E5467324F334D364E6A6F69634746795A573530496A74794F6A45324E6A747A4F6A6736496D4E6F6157786B636D5675496A74684F6A453665334D364D7A5536496B31685A32567564473966556D567762334A30637A6F366333526864476C7A64476C6A633139795A575A795A584E6F496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A4D314F694A4E5957646C626E527658314A6C6347397964484D364F6E4E30595852706333527059334E66636D566D636D567A6143493766583139637A6F7A4E546F695457466E5A573530623139535A584276636E527A4F6A707A6447463061584E3061574E7A58334A6C5A6E4A6C633267694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F334E6A4937637A6F324F694A7759584A6C626E51694F3349364E5467324F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A497A4F694A4E5957646C626E527658304A685932746C626D51364F6E4E3062334A6C6379493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A45324F44747A4F6A5936496E4268636D567564434937636A6F784E445937637A6F344F694A6A61476C735A484A6C6269493759546F314F6E747A4F6A4D794F694A4E5957646C626E527658304A685932746C626D51364F6E4E3062334A6C6331397A5A5852306157356E63794937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F7A4D6A6F695457466E5A5735306231394359574E725A57356B4F6A707A644739795A584E666332563064476C755A334D694F33317A4F6A497A4F694A4E5957646C626E52765831526865446F36625746755957646C5833526865434937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794D7A6F695457466E5A57353062313955595867364F6D3168626D466E5A563930595867694F33317A4F6A4D354F694A4E5957646C626E527658304E31636E4A6C626D4E3555336C74596D39734F6A707A65584E305A57316659335679636D567559336B694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D7A6B36496B31685A3256756447396651335679636D567559336C5465573169623277364F6E4E356333526C6256396A64584A795A57356A6553493766584D364D7A5136496B31685A32567564473966516D466A613256755A446F3663335276636D567A5832463064484A70596E56305A584D694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D7A5136496B31685A32567564473966516D466A613256755A446F3663335276636D567A5832463064484A70596E56305A584D694F33317A4F6A4D344F694A4E5957646C626E527658304A685932746C626D51364F6E4E3062334A6C633139766447686C636C397A5A5852306157356E63794937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F7A4F446F695457466E5A5735306231394359574E725A57356B4F6A707A644739795A584E666233526F5A584A666332563064476C755A334D694F33313966584D364D7A4936496B31685A32567564473966516D466A613256755A446F3663335276636D567A58334E6C64485270626D647A496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E7A63794F334D364E6A6F69634746795A573530496A74794F6A45324F44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A513665334D364D6A4936496B31685A32567564473966516D466A613256755A446F3663335276636D55694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A4936496B31685A32567564473966516D466A613256755A446F3663335276636D55694F33317A4F6A49794F694A4E5957646C626E527658304E76626D5A705A7A6F36593239755A6D6C6E496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49794F694A4E5957646C626E527658304E76626D5A705A7A6F36593239755A6D6C6E496A7439637A6F304E546F695457466E5A573530623139446147566A613239316445466E636D566C6257567564484D364F6D4E6F5A574E7262335630595764795A5756745A573530496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A51314F694A4E5957646C626E527658304E6F5A574E7262335630515764795A5756745A573530637A6F365932686C59327476645852685A334A6C5A57316C626E51694F33317A4F6A49354F694A4E5957646C626E527658314E686247567A4F6A7076636D526C636C397A6447463064584E6C63794937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794F546F695457466E5A573530623139545957786C637A6F3662334A6B5A584A66633352686448567A5A584D694F33313966584D364D6A4936496B31685A32567564473966516D466A613256755A446F3663335276636D55694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F334F445937637A6F324F694A7759584A6C626E51694F3349364E7A63794F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A49794F694A4E5957646C626E527658304E76626D5A705A7A6F36593239755A6D6C6E496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E7A67344F334D364E6A6F69634746795A573530496A74794F6A63334D6A747A4F6A6736496D4E6F6157786B636D5675496A74684F6A4D334F6E747A4F6A4D784F694A4E5957646C626E527658306476623264735A5546755957783564476C6A637A6F365A3239765A32786C496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A4D784F694A4E5957646C626E527658306476623264735A5546755957783564476C6A637A6F365A3239765A32786C496A7439637A6F7A4D546F695457466E5A57353062313944595852686247396E4F6A706A6232356D6157646659324630595778765A794937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F7A4D546F695457466E5A57353062313944595852686247396E4F6A706A6232356D6157646659324630595778765A79493766584D364D6A5136496B31685A32567564473966554746356257567564446F36634746356257567564434937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794E446F695457466E5A5735306231395159586C745A5735304F6A707759586C745A573530496A7439637A6F7A4D7A6F695457466E5A5735306231395159586C745A5735304F6A707759586C745A57353058334E6C636E5A705932567A496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A4D7A4F694A4E5957646C626E5276583142686557316C626E51364F6E42686557316C626E526663325679646D6C6A5A584D694F33317A4F6A497A4F694A4E5957646C626E527658304E74637A6F36593239755A6D6C6E58324E7463794937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794D7A6F695457466E5A5735306231394462584D364F6D4E76626D5A705A31396A62584D694F33317A4F6A4D304F694A4E5957646C626E527658305276643235736232466B59574A735A546F365A473933626D787659575268596D786C496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A4D304F694A4E5957646C626E527658305276643235736232466B59574A735A546F365A473933626D787659575268596D786C496A7439637A6F794E446F695457466E5A573530623139446232353059574E304F6A706A6232353059574E30496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49304F694A4E5957646C626E527658304E76626E5268593351364F6D4E76626E5268593351694F33317A4F6A51794F694A4E5957646C626E527658304E68644746736232644A626E5A6C626E5276636E6B364F6D4E686447467362326470626E5A6C626E5276636E6B694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364E444936496B31685A3256756447396651324630595778765A306C75646D56756447397965546F3659324630595778765A326C75646D5675644739796553493766584D364D7A4136496B31685A32567564473966546D56336332786C6448526C636A6F36626D56336332786C6448526C63694937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F7A4D446F695457466E5A5735306231394F5A58647A62475630644756794F6A70755A58647A6247563064475679496A7439637A6F7A4D7A6F695457466E5A5735306231395461476C7763476C755A7A6F36593239755A6D6C6E58334E6F615842776157356E496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A4D7A4F694A4E5957646C626E527658314E6F615842776157356E4F6A706A6232356D615764666332687063484270626D63694F33317A4F6A4D7A4F694A4E5957646C626E527658314E6F615842776157356E4F6A707A61476C7763476C755A3139776232787059336B694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D7A4D36496B31685A325675644739665532687063484270626D63364F6E4E6F615842776157356E5833427662476C6A6553493766584D364D6A5936496B31685A325675644739665532687063484270626D63364F6D4E68636E4A705A584A7A496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49324F694A4E5957646C626E527658314E6F615842776157356E4F6A706A59584A79615756796379493766584D364E444D36496B31685A325675644739665458567364476C7A61476C7763476C755A7A6F36593239755A6D6C6E58323131624852706332687063484270626D63694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364E444D36496B31685A325675644739665458567364476C7A61476C7763476C755A7A6F36593239755A6D6C6E58323131624852706332687063484270626D63694F33317A4F6A4D774F694A4E5957646C626E527658304E76626D5A705A7A6F36593239755A6D6C6E5832646C626D5679595777694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D7A4136496B31685A32567564473966513239755A6D6C6E4F6A706A6232356D615764665A3256755A584A686243493766584D364D546B36496B31685A32567564473966513239755A6D6C6E4F6A70335A5749694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D546B36496B31685A32567564473966513239755A6D6C6E4F6A70335A5749694F33317A4F6A49354F694A4E5957646C626E527658304E76626D5A705A7A6F36593239755A6D6C6E5832526C63326C6E62694937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794F546F695457466E5A573530623139446232356D615763364F6D4E76626D5A705A31396B5A584E705A3234694F33317A4F6A49794F694A4E5957646C626E5276583142686558426862446F366347463563474673496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49794F694A4E5957646C626E5276583142686558426862446F366347463563474673496A7439637A6F7A4D7A6F695457466E5A5735306231394464584E306232316C636A6F36593239755A6D6C6E58324E316333527662575679496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A4D7A4F694A4E5957646C626E527658304E3163335276625756794F6A706A6232356D615764665933567A644739745A5849694F33317A4F6A497A4F694A4E5957646C626E52765831526865446F36593239755A6D6C6E5833526865434937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794D7A6F695457466E5A57353062313955595867364F6D4E76626D5A705A313930595867694F33317A4F6A49324F694A4E5957646C626E527658304E6F5A574E72623356304F6A706A6147566A6132393164434937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794E6A6F695457466E5A573530623139446147566A6132393164446F365932686C59327476645851694F33317A4F6A4D774F694A4E5957646C626E52765831426C636E4E706333526C626E51364F6E426C636E4E706333526C626E51694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D7A4136496B31685A325675644739665547567963326C7A6447567564446F366347567963326C7A644756756443493766584D364D6A6336496B31685A32567564473966553246735A584D364F6D4E76626D5A705A31397A5957786C63794937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794E7A6F695457466E5A573530623139545957786C637A6F36593239755A6D6C6E58334E686247567A496A7439637A6F794E6A6F695457466E5A573530623139545957786C637A6F36633246735A584E665A573168615777694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A5936496B31685A32567564473966553246735A584D364F6E4E686247567A5832567459576C73496A7439637A6F794E446F695457466E5A573530623139545957786C637A6F36633246735A584E666347526D496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49304F694A4E5957646C626E527658314E686247567A4F6A707A5957786C633139775A4759694F33317A4F6A49304F694A4E5957646C626E527658314A6C6347397964484D364F6E4A6C6347397964484D694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A5136496B31685A32567564473966556D567762334A30637A6F36636D567762334A306379493766584D364D7A4536496B31685A3256756447396655326C305A57316863446F36593239755A6D6C6E58334E7064475674595841694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D7A4536496B31685A3256756447396655326C305A57316863446F36593239755A6D6C6E58334E7064475674595841694F33317A4F6A49354F694A4E5957646C626E527658304E76626D5A705A7A6F36593239755A6D6C6E58334E356333526C62534937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794F546F695457466E5A573530623139446232356D615763364F6D4E76626D5A705A31397A65584E305A5730694F33317A4F6A4D7A4F694A4E5957646C626E5276583164706332687361584E304F6A706A6232356D6157646664326C7A61477870633351694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D7A4D36496B31685A3256756447396656326C7A61477870633351364F6D4E76626D5A705A31393361584E6F62476C7A6443493766584D364D7A4536496B31685A32567564473966553246735A584E536457786C4F6A706A6232356D6157646663484A76625738694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D7A4536496B31685A32567564473966553246735A584E536457786C4F6A706A6232356D6157646663484A76625738694F33317A4F6A49304F694A4E5957646C626E527658304E76626D5A705A7A6F36595752325957356A5A5751694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A5136496B31685A32567564473966513239755A6D6C6E4F6A70685A485A68626D4E6C5A43493766584D364D6A6336496B31685A32567564473966513239755A6D6C6E4F6A7030636D46756331396C6257467062434937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794E7A6F695457466E5A573530623139446232356D615763364F6E52795957357A5832567459576C73496A7439637A6F794F446F695457466E5A573530623139446232356D615763364F6D4E76626D5A705A3139685A47317062694937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794F446F695457466E5A573530623139446232356D615763364F6D4E76626D5A705A3139685A4731706269493766584D364D546B36496B31685A32567564473966513239755A6D6C6E4F6A706B5A5859694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D546B36496B31685A32567564473966513239755A6D6C6E4F6A706B5A5859694F33317A4F6A49304F694A4E5957646C626E527658304E76626D5A705A7A6F3659335679636D567559336B694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A5136496B31685A32567564473966513239755A6D6C6E4F6A706A64584A795A57356A6553493766584D364D545936496B31685A32567564473966556E4E7A4F6A707963334D694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D545936496B31685A32567564473966556E4E7A4F6A707963334D694F33317A4F6A49324F694A4E5957646C626E527658304E76626D5A705A7A6F36633256755A475A79615756755A434937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794E6A6F695457466E5A573530623139446232356D615763364F6E4E6C626D526D636D6C6C626D51694F33317A4F6A55784F694A4E5957646C626E52765830356C64314A6C62476C6A556D567762334A306157356E4F6A706A6232356D61576466626D5633636D567361574E795A584276636E5270626D63694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364E544536496B31685A32567564473966546D5633556D567361574E535A584276636E5270626D63364F6D4E76626D5A705A3139755A5864795A57787059334A6C6347397964476C755A79493766583139637A6F7A4D546F695457466E5A573530623139486232396E62475642626D46736558527059334D364F6D6476623264735A53493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A67774D6A747A4F6A5936496E4268636D567564434937636A6F334F446737637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D7A4536496B31685A3256756447396651324630595778765A7A6F36593239755A6D6C6E58324E6864474673623263694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F344D445137637A6F324F694A7759584A6C626E51694F3349364E7A67344F334D364F446F6959326870624752795A5734694F3245364D547037637A6F304E446F695457466E5A57353062313944595852686247396E55325668636D4E6F4F6A706A6232356D6157646659324630595778765A31397A5A574679593267694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364E445136496B31685A3256756447396651324630595778765A314E6C59584A6A61446F36593239755A6D6C6E58324E68644746736232646663325668636D4E6F496A74396658317A4F6A51304F694A4E5957646C626E527658304E6864474673623264545A574679593267364F6D4E76626D5A705A31396A595852686247396E58334E6C59584A6A6143493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A67344E44747A4F6A5936496E4268636D567564434937636A6F344D445137637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A5136496B31685A32567564473966554746356257567564446F3663474635625756756443493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A67774E6A747A4F6A5936496E4268636D567564434937636A6F334F446737637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D7A4D36496B31685A32567564473966554746356257567564446F3663474635625756756446397A5A584A3261574E6C6379493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A67774F44747A4F6A5936496E4268636D567564434937636A6F334F446737637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A4D36496B31685A325675644739665132317A4F6A706A6232356D615764665932317A496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364F4445774F334D364E6A6F69634746795A573530496A74794F6A63344F44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F7A4E446F695457466E5A5735306231394562336475624739685A474669624755364F6D5276643235736232466B59574A735A53493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A67784D6A747A4F6A5936496E4268636D567564434937636A6F334F446737637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A5136496B31685A32567564473966513239756447466A64446F36593239756447466A6443493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A67784E44747A4F6A5936496E4268636D567564434937636A6F334F446737637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364E444936496B31685A3256756447396651324630595778765A306C75646D56756447397965546F3659324630595778765A326C75646D5675644739796553493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A67784E6A747A4F6A5936496E4268636D567564434937636A6F334F446737637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D7A4136496B31685A32567564473966546D56336332786C6448526C636A6F36626D56336332786C6448526C6369493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A67784F44747A4F6A5936496E4268636D567564434937636A6F334F446737637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D7A4D36496B31685A325675644739665532687063484270626D63364F6D4E76626D5A705A31397A61476C7763476C755A79493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A67794D44747A4F6A5936496E4268636D567564434937636A6F334F446737637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D7A4D36496B31685A325675644739665532687063484270626D63364F6E4E6F615842776157356E5833427662476C6A6553493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A67794D6A747A4F6A5936496E4268636D567564434937636A6F334F446737637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A5936496B31685A325675644739665532687063484270626D63364F6D4E68636E4A705A584A7A496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364F4449304F334D364E6A6F69634746795A573530496A74794F6A63344F44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F304D7A6F695457466E5A5735306231394E6457783061584E6F615842776157356E4F6A706A6232356D615764666258567364476C7A61476C7763476C755A79493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A67794E6A747A4F6A5936496E4268636D567564434937636A6F334F446737637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D7A4136496B31685A32567564473966513239755A6D6C6E4F6A706A6232356D615764665A3256755A584A686243493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A67794F44747A4F6A5936496E4268636D567564434937636A6F334F446737637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D546B36496B31685A32567564473966513239755A6D6C6E4F6A70335A5749694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F344D7A4137637A6F324F694A7759584A6C626E51694F3349364E7A67344F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A49354F694A4E5957646C626E527658304E76626D5A705A7A6F36593239755A6D6C6E5832526C63326C6E6269493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A677A4D6A747A4F6A5936496E4268636D567564434937636A6F334F446737637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A4936496B31685A3256756447396655474635634746734F6A707759586C77595777694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F344D7A5137637A6F324F694A7759584A6C626E51694F3349364E7A67344F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A4D7A4F694A4E5957646C626E527658304E3163335276625756794F6A706A6232356D615764665933567A644739745A5849694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F344D7A5937637A6F324F694A7759584A6C626E51694F3349364E7A67344F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A497A4F694A4E5957646C626E52765831526865446F36593239755A6D6C6E583352686543493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A677A4F44747A4F6A5936496E4268636D567564434937636A6F334F446737637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A5936496B31685A325675644739665132686C59327476645851364F6D4E6F5A574E7262335630496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364F4451774F334D364E6A6F69634746795A573530496A74794F6A63344F44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F7A4D446F695457466E5A573530623139515A584A7A61584E305A5735304F6A70775A584A7A61584E305A573530496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364F4451794F334D364E6A6F69634746795A573530496A74794F6A63344F44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794E7A6F695457466E5A573530623139545957786C637A6F36593239755A6D6C6E58334E686247567A496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364F4451304F334D364E6A6F69634746795A573530496A74794F6A63344F44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794E6A6F695457466E5A573530623139545957786C637A6F36633246735A584E665A573168615777694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F344E445937637A6F324F694A7759584A6C626E51694F3349364E7A67344F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A49304F694A4E5957646C626E527658314E686247567A4F6A707A5957786C633139775A4759694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F344E446737637A6F324F694A7759584A6C626E51694F3349364E7A67344F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A49304F694A4E5957646C626E527658314A6C6347397964484D364F6E4A6C6347397964484D694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F344E544137637A6F324F694A7759584A6C626E51694F3349364E7A67344F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A4D784F694A4E5957646C626E527658314E7064475674595841364F6D4E76626D5A705A31397A6158526C62574677496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364F4455794F334D364E6A6F69634746795A573530496A74794F6A63344F44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794F546F695457466E5A573530623139446232356D615763364F6D4E76626D5A705A31397A65584E305A5730694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F344E545137637A6F324F694A7759584A6C626E51694F3349364E7A67344F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A4D7A4F694A4E5957646C626E5276583164706332687361584E304F6A706A6232356D6157646664326C7A61477870633351694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F344E545937637A6F324F694A7759584A6C626E51694F3349364E7A67344F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A4D784F694A4E5957646C626E527658314E686247567A556E56735A546F36593239755A6D6C6E5833427962323176496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364F4455344F334D364E6A6F69634746795A573530496A74794F6A63344F44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794E446F695457466E5A573530623139446232356D615763364F6D466B646D46755932566B496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364F4459774F334D364E6A6F69634746795A573530496A74794F6A63344F44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794E7A6F695457466E5A573530623139446232356D615763364F6E52795957357A5832567459576C73496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364F4459794F334D364E6A6F69634746795A573530496A74794F6A63344F44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794F446F695457466E5A573530623139446232356D615763364F6D4E76626D5A705A3139685A4731706269493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A67324E44747A4F6A5936496E4268636D567564434937636A6F334F446737637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D546B36496B31685A32567564473966513239755A6D6C6E4F6A706B5A5859694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F344E6A5937637A6F324F694A7759584A6C626E51694F3349364E7A67344F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A49304F694A4E5957646C626E527658304E76626D5A705A7A6F3659335679636D567559336B694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F344E6A6737637A6F324F694A7759584A6C626E51694F3349364E7A67344F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A45324F694A4E5957646C626E527658314A7A637A6F36636E4E7A496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364F4463774F334D364E6A6F69634746795A573530496A74794F6A63344F44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794E6A6F695457466E5A573530623139446232356D615763364F6E4E6C626D526D636D6C6C626D51694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F344E7A4937637A6F324F694A7759584A6C626E51694F3349364E7A67344F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A55784F694A4E5957646C626E52765830356C64314A6C62476C6A556D567762334A306157356E4F6A706A6232356D61576466626D5633636D567361574E795A584276636E5270626D63694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F344E7A5137637A6F324F694A7759584A6C626E51694F3349364E7A67344F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A51314F694A4E5957646C626E527658304E6F5A574E7262335630515764795A5756745A573530637A6F365932686C59327476645852685A334A6C5A57316C626E51694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F334F544137637A6F324F694A7759584A6C626E51694F3349364E7A63794F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A49354F694A4E5957646C626E527658314E686247567A4F6A7076636D526C636C397A6447463064584E6C6379493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A63354D6A747A4F6A5936496E4268636D567564434937636A6F334E7A4937637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A4D36496B31685A32567564473966564746344F6A7074595735685A32566664474634496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E7A63304F334D364E6A6F69634746795A573530496A74794F6A45324F44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F7A4F546F695457466E5A5735306231394464584A795A57356A65564E3562574A7662446F3663336C7A6447567458324E31636E4A6C626D4E35496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E7A63324F334D364E6A6F69634746795A573530496A74794F6A45324F44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A493665334D364D7A6736496B31685A3256756447396651335679636D567559336C5465573169623277364F6D4E31636E4A6C626D4E3558334A686447567A496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A4D344F694A4E5957646C626E527658304E31636E4A6C626D4E3555336C74596D39734F6A706A64584A795A57356A655639795958526C6379493766584D364D7A4536496B31685A3256756447396651335679636D567559336C5465573169623277364F6E4E3562574A7662484D694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D7A4536496B31685A3256756447396651335679636D567559336C5465573169623277364F6E4E3562574A7662484D694F33313966584D364D7A6736496B31685A3256756447396651335679636D567559336C5465573169623277364F6D4E31636E4A6C626D4E3558334A686447567A496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D5441304E6A747A4F6A5936496E4268636D567564434937636A6F334E7A5937637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D7A4536496B31685A3256756447396651335679636D567559336C5465573169623277364F6E4E3562574A7662484D694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F784D4451344F334D364E6A6F69634746795A573530496A74794F6A63334E6A747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F7A4E446F695457466E5A5735306231394359574E725A57356B4F6A707A644739795A584E6659585230636D6C696458526C6379493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A63334F44747A4F6A5936496E4268636D567564434937636A6F784E6A6737637A6F344F694A6A61476C735A484A6C6269493759546F314F6E747A4F6A4D344F694A4E5957646C626E527658304E6864474673623263364F6D463064484A70596E56305A584E6659585230636D6C696458526C63794937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F7A4F446F695457466E5A57353062313944595852686247396E4F6A70686448527961574A316447567A5832463064484A70596E56305A584D694F33317A4F6A4D304F694A4E5957646C626E527658304E6864474673623263364F6E56775A4746305A5639686448527961574A316447567A496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A4D304F694A4E5957646C626E527658304E6864474673623263364F6E56775A4746305A5639686448527961574A316447567A496A7439637A6F794D546F695457466E5A57353062313944595852686247396E4F6A707A5A58527A496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49784F694A4E5957646C626E527658304E6864474673623263364F6E4E6C64484D694F33317A4F6A497A4F694A4E5957646C626E527658314A6C646D6C6C647A6F36636D46306157356E63794937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794D7A6F695457466E5A573530623139535A585A705A5863364F6E4A6864476C755A334D694F33317A4F6A49304F694A4E5957646C626E527658314E335958526A6147567A4F6A70705A6E4A68625755694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A5136496B31685A325675644739665533646864474E6F5A584D364F6D6C6D636D46745A53493766583139637A6F7A4F446F695457466E5A57353062313944595852686247396E4F6A70686448527961574A316447567A5832463064484A70596E56305A584D694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F784D4459794F334D364E6A6F69634746795A573530496A74794F6A63334F44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F7A4E446F695457466E5A57353062313944595852686247396E4F6A7031634752686447566659585230636D6C696458526C6379493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A45774E6A5137637A6F324F694A7759584A6C626E51694F3349364E7A63344F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A49784F694A4E5957646C626E527658304E6864474673623263364F6E4E6C64484D694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F784D4459324F334D364E6A6F69634746795A573530496A74794F6A63334F44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794D7A6F695457466E5A573530623139535A585A705A5863364F6E4A6864476C755A334D694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F784D4459344F334D364E6A6F69634746795A573530496A74794F6A63334F44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794E446F695457466E5A57353062313954643246305932686C637A6F3661575A795957316C496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D5441334D44747A4F6A5936496E4268636D567564434937636A6F334E7A6737637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D7A6736496B31685A32567564473966516D466A613256755A446F3663335276636D567A583239306147567958334E6C64485270626D647A496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364E7A67774F334D364E6A6F69634746795A573530496A74794F6A45324F44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A453665334D364D6A4D36496B31685A325675644739665133567A644739745A5849364F6D647962335677496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A497A4F694A4E5957646C626E527658304E3163335276625756794F6A706E636D39316343493766583139637A6F794D7A6F695457466E5A5735306231394464584E306232316C636A6F365A334A76645841694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F784D446B324F334D364E6A6F69634746795A573530496A74794F6A63344D44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794D7A6F695457466E5A5735306231394359574E725A57356B4F6A707A65584E305A5730694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F784E7A4137637A6F324F694A7759584A6C626E51694F3349364D5451324F334D364F446F6959326870624752795A5734694F3245364E547037637A6F794E446F695457466E5A5735306231394359574E725A57356B4F6A706A623235325A584A30496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49304F694A4E5957646C626E527658304A685932746C626D51364F6D4E76626E5A6C636E51694F33317A4F6A49334F694A4E5957646C626E527658304A685932746C626D51364F6D56346447567563326C76626E4D694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A6336496B31685A32567564473966516D466A613256755A446F365A5868305A57357A615739756379493766584D364D6A4936496B31685A32567564473966516D466A613256755A446F366447397662484D694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A4936496B31685A32567564473966516D466A613256755A446F366447397662484D694F33317A4F6A45334F694A4E5957646C626E52765831567A5A5849364F6D466A62434937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F784E7A6F695457466E5A57353062313956633256794F6A7068593277694F33317A4F6A4D344F694A4E5957646C626E527658304A685932746C626D51364F6E4E356333526C625639766447686C636C397A5A5852306157356E63794937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F7A4F446F695457466E5A5735306231394359574E725A57356B4F6A707A65584E305A5731666233526F5A584A666332563064476C755A334D694F33313966584D364D6A5136496B31685A32567564473966516D466A613256755A446F3659323975646D56796443493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A45784D445937637A6F324F694A7759584A6C626E51694F3349364D5463774F334D364F446F6959326870624752795A5734694F3245364E447037637A6F794F446F695457466E5A5735306231394A62584276636E524665484276636E51364F6D6C746347397964434937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794F446F695457466E5A5735306231394A62584276636E524665484276636E51364F6D6C74634739796443493766584D364D6A6736496B31685A325675644739665357317762334A305258687762334A304F6A706C65484276636E51694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A6736496B31685A325675644739665357317762334A305258687762334A304F6A706C65484276636E51694F33317A4F6A4D344F694A4E5957646C626E52765831526865456C7463473979644556346347397964446F366157317762334A30583256346347397964434937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F7A4F446F695457466E5A573530623139555958684A62584276636E524665484276636E51364F6D6C74634739796446396C65484276636E51694F33317A4F6A49354F694A4E5957646C626E527658306C7463473979644556346347397964446F3661476C7A6447397965534937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794F546F695457466E5A5735306231394A62584276636E524665484276636E51364F6D687063335276636E6B694F33313966584D364D6A6736496B31685A325675644739665357317762334A305258687762334A304F6A707062584276636E51694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F784D5449774F334D364E6A6F69634746795A573530496A74794F6A45784D445937637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A6736496B31685A325675644739665357317762334A305258687762334A304F6A706C65484276636E51694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F784D5449794F334D364E6A6F69634746795A573530496A74794F6A45784D445937637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D7A6736496B31685A32567564473966564746345357317762334A305258687762334A304F6A707062584276636E52665A58687762334A30496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D5445794E44747A4F6A5936496E4268636D567564434937636A6F784D5441324F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A49354F694A4E5957646C626E527658306C7463473979644556346347397964446F3661476C7A644739796553493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A45784D6A5937637A6F324F694A7759584A6C626E51694F3349364D5445774E6A747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794E7A6F695457466E5A5735306231394359574E725A57356B4F6A706C6548526C626E4E706232357A496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D5445774F44747A4F6A5936496E4268636D567564434937636A6F784E7A4137637A6F344F694A6A61476C735A484A6C6269493759546F794F6E747A4F6A49794F694A4E5957646C626E527658304A685932746C626D51364F6D787659324673496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49794F694A4E5957646C626E527658304A685932746C626D51364F6D787659324673496A7439637A6F794D7A6F695457466E5A5735306231394359574E725A57356B4F6A706A64584E30623230694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A4D36496B31685A32567564473966516D466A613256755A446F365933567A64473974496A74396658317A4F6A49794F694A4E5957646C626E527658304A685932746C626D51364F6D787659324673496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D5445304F44747A4F6A5936496E4268636D567564434937636A6F784D5441344F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A497A4F694A4E5957646C626E527658304A685932746C626D51364F6D4E31633352766253493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A45784E544137637A6F324F694A7759584A6C626E51694F3349364D5445774F44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794D6A6F695457466E5A5735306231394359574E725A57356B4F6A7030623239736379493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A45784D544137637A6F324F694A7759584A6C626E51694F3349364D5463774F334D364F446F6959326870624752795A5734694F3245364E547037637A6F794D6A6F695457466E5A5735306231394359574E725A57356B4F6A706A59574E6F5A534937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F794D6A6F695457466E5A5735306231394359574E725A57356B4F6A706A59574E6F5A53493766584D364D6A6B36496B31685A32567564473966516D466A613256755A446F36633256306458426664326C3659584A6B496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49354F694A4E5957646C626E527658304A685932746C626D51364F6E4E6C6448567758336470656D46795A43493766584D364D6A4936496B31685A32567564473966516D466A613356774F6A706959574E72645841694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A4936496B31685A32567564473966516D466A613356774F6A706959574E72645841694F33317A4F6A49794F694A4E5957646C626E527658306C755A4756345A5849364F6D6C755A475634496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49794F694A4E5957646C626E527658306C755A4756345A5849364F6D6C755A475634496A7439637A6F794E7A6F695457466E5A5735306231394A626D526C654756794F6A706A614746755A32564E6232526C496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49334F694A4E5957646C626E527658306C755A4756345A5849364F6D4E6F5957356E5A5531765A4755694F33313966584D364D6A4936496B31685A32567564473966516D466A613256755A446F365932466A614755694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F784D5459304F334D364E6A6F69634746795A573530496A74794F6A45784D544137637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A6B36496B31685A32567564473966516D466A613256755A446F36633256306458426664326C3659584A6B496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D5445324E6A747A4F6A5936496E4268636D567564434937636A6F784D5445774F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A49794F694A4E5957646C626E527658304A685932743163446F36596D466A61335677496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D5445324F44747A4F6A5936496E4268636D567564434937636A6F784D5445774F334D364F446F6959326870624752795A5734694F3245364D547037637A6F794E446F695457466E5A5735306231394359574E72645841364F6E4A766247786959574E72496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A49304F694A4E5957646C626E527658304A685932743163446F36636D397362474A68593273694F33313966584D364D6A5136496B31685A32567564473966516D466A613356774F6A707962327873596D466A6179493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A45784F445937637A6F324F694A7759584A6C626E51694F3349364D5445324F44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794D6A6F695457466E5A5735306231394A626D526C654756794F6A7070626D526C6543493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A45784E7A4137637A6F324F694A7759584A6C626E51694F3349364D5445784D44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F794E7A6F695457466E5A5735306231394A626D526C654756794F6A706A614746755A32564E6232526C496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D5445334D6A747A4F6A5936496E4268636D567564434937636A6F784D5445774F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A45334F694A4E5957646C626E52765831567A5A5849364F6D466A6243493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A45784D544937637A6F324F694A7759584A6C626E51694F3349364D5463774F334D364F446F6959326870624752795A5734694F3245364D7A7037637A6F794D7A6F695457466E5A57353062313956633256794F6A70685932786664584E6C636E4D694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A4D36496B31685A3256756447396656584E6C636A6F3659574E735833567A5A584A7A496A7439637A6F784F546F695457466E5A57353062313956633256794F6A707362324E7263794937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F784F546F695457466E5A57353062313956633256794F6A707362324E726379493766584D364D6A4D36496B31685A3256756447396656584E6C636A6F3659574E7358334A766247567A496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A497A4F694A4E5957646C626E52765831567A5A5849364F6D466A624639796232786C6379493766583139637A6F794D7A6F695457466E5A57353062313956633256794F6A70685932786664584E6C636E4D694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F784D6A41304F334D364E6A6F69634746795A573530496A74794F6A45784D544937637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D546B36496B31685A3256756447396656584E6C636A6F366247396A61334D694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F784D6A41324F334D364E6A6F69634746795A573530496A74794F6A45784D544937637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A4D36496B31685A3256756447396656584E6C636A6F3659574E7358334A766247567A496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D5449774F44747A4F6A5936496E4268636D567564434937636A6F784D5445794F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A4D344F694A4E5957646C626E527658304A685932746C626D51364F6E4E356333526C625639766447686C636C397A5A5852306157356E6379493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A45784D545137637A6F324F694A7759584A6C626E51694F3349364D5463774F334D364F446F6959326870624752795A5734694F3245364D7A7037637A6F304E446F695457466E5A573530623139425A473170626B357664476C6D61574E6864476C76626A6F365957527461573575623352705A6D6C6A59585270623234694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364E445136496B31685A32567564473966515752746157354F623352705A6D6C6A59585270623234364F6D466B62576C75626D393061575A705932463061573975496A7439637A6F794E6A6F695457466E5A5735306231395759584A7059574A735A546F36646D467961574669624755694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D6A5936496B31685A32567564473966566D467961574669624755364F6E5A68636D6C68596D786C496A7439637A6F7A4D6A6F695457466E5A57353062313946626D4E796558423061573975533256354F6A706A636E6C77644639725A586B694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D7A4936496B31685A325675644739665257356A636E6C7764476C76626B746C65546F3659334A356348526661325635496A74396658317A4F6A51304F694A4E5957646C626E52765830466B62576C75546D393061575A7059324630615739754F6A70685A473170626D357664476C6D61574E6864476C766269493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A45794D6A5937637A6F324F694A7759584A6C626E51694F3349364D5445784E44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A513665334D364D7A6B36496B31685A32567564473966515752746157354F623352705A6D6C6A59585270623234364F6E4E6F623364666447397662474A6863694937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F7A4F546F695457466E5A573530623139425A473170626B357664476C6D61574E6864476C76626A6F36633268766431393062323973596D4679496A7439637A6F7A4E6A6F695457466E5A573530623139425A473170626B357664476C6D61574E6864476C76626A6F36633268766431397361584E30496A74504F6A4D7A4F694A4E5957646C626E527658455A795957316C64323979613178425932786351574E73556D567A62335679593255694F6A453665334D364D54513649674171414639795A584E7664584A6A5A556C6B496A747A4F6A4D324F694A4E5957646C626E52765830466B62576C75546D393061575A7059324630615739754F6A707A6147393358327870633351694F33317A4F6A4D354F694A4E5957646C626E52765830466B62576C75546D393061575A7059324630615739754F6A707459584A725832467A58334A6C595751694F3038364D7A4D36496B31685A32567564473963526E4A686257563362334A725845466A62467842593278535A584E7664584A6A5A5349364D547037637A6F784E446F6941436F4158334A6C63323931636D4E6C535751694F334D364D7A6B36496B31685A32567564473966515752746157354F623352705A6D6C6A59585270623234364F6D3168636D746659584E66636D56685A43493766584D364E544536496B31685A32567564473966515752746157354F623352705A6D6C6A59585270623234364F6D466B62576C75626D393061575A70593246306157397558334A6C625739325A534937547A6F7A4D7A6F695457466E5A57353062317847636D46745A586476636D746351574E735845466A62464A6C63323931636D4E6C496A6F784F6E747A4F6A45304F6949414B674266636D567A623356795932564A5A434937637A6F314D546F695457466E5A573530623139425A473170626B357664476C6D61574E6864476C76626A6F365957527461573575623352705A6D6C6A5958527062323566636D567462335A6C496A74396658317A4F6A4D354F694A4E5957646C626E52765830466B62576C75546D393061575A7059324630615739754F6A707A614739335833527662327869595849694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F784D6A4D324F334D364E6A6F69634746795A573530496A74794F6A45794D6A5937637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D7A5936496B31685A32567564473966515752746157354F623352705A6D6C6A59585270623234364F6E4E6F6233646662476C7A6443493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A45794D7A6737637A6F324F694A7759584A6C626E51694F3349364D5449794E6A747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F7A4F546F695457466E5A573530623139425A473170626B357664476C6D61574E6864476C76626A6F366257467961313968633139795A57466B496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D5449304D44747A4F6A5936496E4268636D567564434937636A6F784D6A49324F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A55784F694A4E5957646C626E52765830466B62576C75546D393061575A7059324630615739754F6A70685A473170626D357664476C6D61574E6864476C76626C39795A573176646D55694F3245364D7A7037637A6F344F694A70626E4E305957356A5A534937636A6F784D6A51794F334D364E6A6F69634746795A573530496A74794F6A45794D6A5937637A6F344F694A6A61476C735A484A6C6269493759546F774F6E743966584D364D6A5936496B31685A32567564473966566D467961574669624755364F6E5A68636D6C68596D786C496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D5449794F44747A4F6A5936496E4268636D567564434937636A6F784D5445304F334D364F446F6959326870624752795A5734694F3245364D4470376658317A4F6A4D794F694A4E5957646C626E52765830567559334A35634852706232354C5A586B364F6D4E79655842305832746C6553493759546F7A4F6E747A4F6A6736496D6C7563335268626D4E6C496A74794F6A45794D7A4137637A6F324F694A7759584A6C626E51694F3349364D5445784E44747A4F6A6736496D4E6F6157786B636D5675496A74684F6A413665333139637A6F7A4D446F695457466E5A5735306231394359574E725A57356B4F6A706E624739695957786663325668636D4E6F496A74684F6A4D3665334D364F446F696157357A64474675593255694F3349364D5463794F334D364E6A6F69634746795A573530496A74794F6A45304E6A747A4F6A6736496D4E6F6157786B636D5675496A74684F6A41366533313966584D364D546336496741714146397063304673624739335A5752536232786C496A74794F6A45794F44747A4F6A49784F6949414B67426661584E42624778766432566B556D567A62335679593255694F3349364D5455774F334D364D6A4936496741714146397063304673624739335A575251636D6C326157786C5A3255694F303437637A6F354F6949414B674266636E56735A584D694F3245364D6A7037637A6F784D6A6F6959577873556D567A623356795932567A496A74684F6A493665334D364F446F6959577873556D39735A584D694F3245364D6A7037637A6F784D7A6F695957787355484A70646D6C735A57646C6379493759546F794F6E747A4F6A5136496E5235634755694F334D364F546F6956466C51525639455255355A496A747A4F6A5936496D467A6332567964434937546A7439637A6F784D7A6F69596E6C51636D6C326157786C5A32564A5A43493759546F774F6E743966584D364F446F69596E6C536232786C535751694F3245364D54703761546F784F3245364D6A7037637A6F784D7A6F69596E6C51636D6C326157786C5A32564A5A43493759546F774F6E7439637A6F784D7A6F695957787355484A70646D6C735A57646C6379493759546F794F6E747A4F6A5136496E5235634755694F334D364D544136496C525A554556665155784D543163694F334D364E6A6F6959584E7A5A584A30496A744F4F3331396658317A4F6A45794F694A6965564A6C63323931636D4E6C535751694F3245364D547037637A6F794D446F695457466E5A5735306231394359574E725A57356B4F6A7068624777694F3245364D547037637A6F344F694A6965564A766247564A5A43493759546F784F6E74704F6A453759546F794F6E747A4F6A457A4F694A696556427961585A706247566E5A556C6B496A74684F6A41366533317A4F6A457A4F694A6862477851636D6C326157786C5A32567A496A74684F6A493665334D364E446F6964486C775A534937637A6F784D446F6956466C51525639425445785056794937637A6F324F694A6863334E6C636E51694F303437665831396658313966584D364D544136496E56775A4746305A575266595851694F326B364D5455774F54637A4D7A55334D6A74395A47566D59585673644878684F6A41366533316A64584E306232316C636C396959584E6C664745364D4470376657316C63334E685A32563859546F784F6E747A4F6A6336496D4A685932746C626D51694F3038364D7A5936496B31685A32567564473963526E4A686257563362334A725845316C63334E685A325663513239736247566A64476C76626949364D6A7037637A6F784D546F6941436F416257567A6332466E5A584D694F3245364D44703766584D364D546B364967417141477868633352425A47526C5A45316C63334E685A3255694F3034376658303D'),
	('a39f2f20f7cb2d90595e8a401d8abc5b',1509731922,X'58334E6C63334E7062323566646D46736157526864473979583252686447463859546F304F6E747A4F6A45784F694A795A573176644756665957526B63694937637A6F784D446F694D5463794C6A49304C6A41754D534937637A6F344F694A6F6448527758335A7059534937637A6F774F6949694F334D364D6A4136496D6830644842666546396D62334A3359584A6B5A5752665A6D3979496A747A4F6A413649694937637A6F784E546F696148523063463931633256795832466E5A573530496A747A4F6A45794D546F695457393661577873595338314C6A41674B45316859326C756447397A61447367535735305A5777675457466A49453954494667674D5442664D544E664D536B6751584277624756585A574A4C615851764E544D334C6A4D324943684C5346524E5443776762476C725A5342485A574E7262796B67513268796232316C4C7A59784C6A41754D7A45324D7934784D4441675532466D59584A704C7A557A4E79347A4E6949376656397A5A584E7A61573975583268766333527A664745364D547037637A6F354F694A7362324E6862476876633351694F3249364D547439595752746157356F64473173664745364D7A7037637A6F354F694A665A6D3979625639725A586B694F334D364D545936496A524452457832645746784D336C4857574532636B73694F334D364E6A6F696247396A5957786C496A747A4F6A5536496D567558315654496A747A4F6A457A4F694A7063313931636D7866626D393061574E6C496A74694F6A41376657466B62576C75664745364D4470376657526C5A6D46316248523859546F774F6E74395933567A644739745A584A66596D467A5A5878684F6A4136653331745A584E7A5957646C664745364D547037637A6F334F694A6959574E725A57356B496A74504F6A4D324F694A4E5957646C626E527658455A795957316C643239796131784E5A584E7A5957646C58454E766247786C59335270623234694F6A493665334D364D544536496741714147316C63334E685A32567A496A74684F6A41366533317A4F6A45354F6949414B67427359584E305157526B5A57524E5A584E7A5957646C496A744F4F333139'),
	('dfe7f22aaf63f26e01ae73130d33d54e',1509733188,X'58334E6C63334E7062323566646D46736157526864473979583252686447463859546F304F6E747A4F6A45784F694A795A573176644756665957526B63694937637A6F784D446F694D5463794C6A49304C6A41754D534937637A6F344F694A6F6448527758335A7059534937637A6F774F6949694F334D364D6A4136496D6830644842666546396D62334A3359584A6B5A5752665A6D3979496A747A4F6A413649694937637A6F784E546F696148523063463931633256795832466E5A573530496A747A4F6A45794D546F695457393661577873595338314C6A41674B45316859326C756447397A61447367535735305A5777675457466A49453954494667674D5442664D544E664D536B6751584277624756585A574A4C615851764E544D334C6A4D324943684C5346524E5443776762476C725A5342485A574E7262796B67513268796232316C4C7A59784C6A41754D7A45324D7934784D4441675532466D59584A704C7A557A4E79347A4E6949376656397A5A584E7A61573975583268766333527A664745364D547037637A6F354F694A7362324E6862476876633351694F3249364D5474395A47566D59585673644878684F6A453665334D364D544936496E5A7063326C3062334A665A4746305953493759546F7A4F6E747A4F6A457A4F694A7359584E3058335A7063326C3058324630496A747A4F6A45354F6949794D4445334C5445784C54417A494445344F6A45354F6A5132496A747A4F6A45774F694A7A5A584E7A6157397558326C6B496A747A4F6A4D794F694A6B5A6D55335A6A49795957466D4E6A4E6D4D6A5A6C4D4446685A54637A4D544D775A444D7A5A4455305A534937637A6F784D446F69646D6C7A61585276636C39705A434937637A6F784F694979496A743966574E31633352766257567958324A686332563859546F774F6E74395932686C593274766458523859546F774F6E74396257567A6332466E5A5878684F6A41366533316A595852686247396E664745364D44703766513D3D');

/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table setup_module
# ------------------------------------------------------------

DROP TABLE IF EXISTS `setup_module`;

CREATE TABLE `setup_module` (
  `module` varchar(50) NOT NULL COMMENT 'Module',
  `schema_version` varchar(50) DEFAULT NULL COMMENT 'Schema Version',
  `data_version` varchar(50) DEFAULT NULL COMMENT 'Data Version',
  PRIMARY KEY (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Module versions registry';

LOCK TABLES `setup_module` WRITE;
/*!40000 ALTER TABLE `setup_module` DISABLE KEYS */;

INSERT INTO `setup_module` (`module`, `schema_version`, `data_version`)
VALUES
	('GetResponse_GetResponseIntegration','20.1.0','20.1.0'),
	('Magento_AdminNotification','2.0.0','2.0.0'),
	('Magento_AdvancedPricingImportExport','2.0.0','2.0.0'),
	('Magento_Authorization','2.0.0','2.0.0'),
	('Magento_Authorizenet','2.0.0','2.0.0'),
	('Magento_Backend','2.0.0','2.0.0'),
	('Magento_Backup','2.0.0','2.0.0'),
	('Magento_Braintree','2.0.1','2.0.1'),
	('Magento_Bundle','2.0.4','2.0.4'),
	('Magento_BundleImportExport','2.0.0','2.0.0'),
	('Magento_CacheInvalidate','2.0.0','2.0.0'),
	('Magento_Captcha','2.0.0','2.0.0'),
	('Magento_Catalog','2.2.3','2.2.3'),
	('Magento_CatalogImportExport','2.0.0','2.0.0'),
	('Magento_CatalogInventory','2.3.0','2.3.0'),
	('Magento_CatalogRule','2.1.0','2.1.0'),
	('Magento_CatalogRuleConfigurable','2.0.0','2.0.0'),
	('Magento_CatalogSearch','2.0.0','2.0.0'),
	('Magento_CatalogUrlRewrite','2.0.0','2.0.0'),
	('Magento_CatalogWidget','2.0.0','2.0.0'),
	('Magento_Checkout','2.0.0','2.0.0'),
	('Magento_CheckoutAgreements','2.2.0','2.2.0'),
	('Magento_Cms','2.0.2','2.0.2'),
	('Magento_CmsUrlRewrite','2.0.0','2.0.0'),
	('Magento_Config','2.0.0','2.0.0'),
	('Magento_ConfigurableImportExport','2.0.0','2.0.0'),
	('Magento_ConfigurableProduct','2.2.0','2.2.0'),
	('Magento_ConfigurableProductSales','2.2.0','2.2.0'),
	('Magento_Contact','2.0.0','2.0.0'),
	('Magento_Cookie','2.0.0','2.0.0'),
	('Magento_Cron','2.0.0','2.0.0'),
	('Magento_CurrencySymbol','2.0.1','2.0.1'),
	('Magento_Customer','2.0.12','2.0.12'),
	('Magento_CustomerImportExport','2.0.0','2.0.0'),
	('Magento_Deploy','2.0.0','2.0.0'),
	('Magento_Developer','2.0.0','2.0.0'),
	('Magento_Dhl','2.0.0','2.0.0'),
	('Magento_Directory','2.0.1','2.0.1'),
	('Magento_Downloadable','2.0.2','2.0.2'),
	('Magento_DownloadableImportExport','2.0.0','2.0.0'),
	('Magento_Eav','2.1.1','2.1.1'),
	('Magento_Email','2.0.0','2.0.0'),
	('Magento_EncryptionKey','2.0.0','2.0.0'),
	('Magento_Fedex','2.0.0','2.0.0'),
	('Magento_GiftMessage','2.0.1','2.0.1'),
	('Magento_GoogleAdwords','2.0.0','2.0.0'),
	('Magento_GoogleAnalytics','2.0.0','2.0.0'),
	('Magento_GoogleOptimizer','2.0.0','2.0.0'),
	('Magento_GroupedImportExport','2.0.0','2.0.0'),
	('Magento_GroupedProduct','2.0.1','2.0.1'),
	('Magento_ImportExport','2.0.1','2.0.1'),
	('Magento_Indexer','2.1.0','2.1.0'),
	('Magento_Integration','2.2.0','2.2.0'),
	('Magento_LayeredNavigation','2.0.0','2.0.0'),
	('Magento_Marketplace','1.0.0','1.0.0'),
	('Magento_MediaStorage','2.0.0','2.0.0'),
	('Magento_Msrp','2.1.3','2.1.3'),
	('Magento_Multishipping','2.0.0','2.0.0'),
	('Magento_NewRelicReporting','2.0.1','2.0.1'),
	('Magento_Newsletter','2.0.0','2.0.0'),
	('Magento_OfflinePayments','2.0.0','2.0.0'),
	('Magento_OfflineShipping','2.0.1','2.0.1'),
	('Magento_PageCache','2.0.0','2.0.0'),
	('Magento_Payment','2.0.0','2.0.0'),
	('Magento_Paypal','2.0.1','2.0.1'),
	('Magento_Persistent','2.0.0','2.0.0'),
	('Magento_ProductAlert','2.0.0','2.0.0'),
	('Magento_ProductVideo','2.0.0.2','2.0.0.2'),
	('Magento_Quote','2.0.6','2.0.6'),
	('Magento_Reports','2.0.0','2.0.0'),
	('Magento_RequireJs','2.0.0','2.0.0'),
	('Magento_Review','2.0.0','2.0.0'),
	('Magento_Robots','2.0.0','2.0.0'),
	('Magento_Rss','2.0.0','2.0.0'),
	('Magento_Rule','2.0.0','2.0.0'),
	('Magento_Sales','2.0.7','2.0.7'),
	('Magento_SalesInventory','1.0.0','1.0.0'),
	('Magento_SalesRule','2.0.3','2.0.3'),
	('Magento_SalesSequence','2.0.0','2.0.0'),
	('Magento_SampleData','2.0.0','2.0.0'),
	('Magento_Search','2.0.4','2.0.4'),
	('Magento_Security','2.0.1','2.0.1'),
	('Magento_SendFriend','2.0.0','2.0.0'),
	('Magento_Shipping','2.0.0','2.0.0'),
	('Magento_Sitemap','2.0.0','2.0.0'),
	('Magento_Store','2.1.0','2.1.0'),
	('Magento_Swagger','2.0.0','2.0.0'),
	('Magento_Swatches','2.0.3','2.0.3'),
	('Magento_SwatchesLayeredNavigation','2.0.0','2.0.0'),
	('Magento_Tax','2.0.2','2.0.2'),
	('Magento_TaxImportExport','2.0.0','2.0.0'),
	('Magento_Theme','2.0.2','2.0.2'),
	('Magento_Translation','2.0.0','2.0.0'),
	('Magento_Ui','2.0.0','2.0.0'),
	('Magento_Ups','2.0.0','2.0.0'),
	('Magento_UrlRewrite','2.0.1','2.0.1'),
	('Magento_User','2.0.3','2.0.3'),
	('Magento_Usps','2.0.1','2.0.1'),
	('Magento_Variable','2.0.0','2.0.0'),
	('Magento_Vault','2.0.2','2.0.2'),
	('Magento_Version','2.0.0','2.0.0'),
	('Magento_Webapi','2.0.0','2.0.0'),
	('Magento_WebapiSecurity','2.0.0','2.0.0'),
	('Magento_Weee','2.0.0','2.0.0'),
	('Magento_Widget','2.0.1','2.0.1'),
	('Magento_Wishlist','2.0.1','2.0.1');

/*!40000 ALTER TABLE `setup_module` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shipping_tablerate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shipping_tablerate`;

CREATE TABLE `shipping_tablerate` (
  `pk` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `website_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `dest_country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Destination coutry ISO/2 or ISO/3 code',
  `dest_region_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Destination Region Id',
  `dest_zip` varchar(10) NOT NULL DEFAULT '*' COMMENT 'Destination Post Code (Zip)',
  `condition_name` varchar(20) NOT NULL COMMENT 'Rate Condition name',
  `condition_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rate condition value',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `cost` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Cost',
  PRIMARY KEY (`pk`),
  UNIQUE KEY `UNQ_D60821CDB2AFACEE1566CFC02D0D4CAA` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_zip`,`condition_name`,`condition_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shipping Tablerate';



# Dump of table sitemap
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sitemap`;

CREATE TABLE `sitemap` (
  `sitemap_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sitemap Id',
  `sitemap_type` varchar(32) DEFAULT NULL COMMENT 'Sitemap Type',
  `sitemap_filename` varchar(32) DEFAULT NULL COMMENT 'Sitemap Filename',
  `sitemap_path` varchar(255) DEFAULT NULL COMMENT 'Sitemap Path',
  `sitemap_time` timestamp NULL DEFAULT NULL COMMENT 'Sitemap Time',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`sitemap_id`),
  KEY `SITEMAP_STORE_ID` (`store_id`),
  CONSTRAINT `SITEMAP_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='XML Sitemap';



# Dump of table store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `store`;

CREATE TABLE `store` (
  `store_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Store Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Group Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Name',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Sort Order',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Activity',
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `STORE_CODE` (`code`),
  KEY `STORE_WEBSITE_ID` (`website_id`),
  KEY `STORE_IS_ACTIVE_SORT_ORDER` (`is_active`,`sort_order`),
  KEY `STORE_GROUP_ID` (`group_id`),
  CONSTRAINT `STORE_GROUP_ID_STORE_GROUP_GROUP_ID` FOREIGN KEY (`group_id`) REFERENCES `store_group` (`group_id`) ON DELETE CASCADE,
  CONSTRAINT `STORE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores';

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;

INSERT INTO `store` (`store_id`, `code`, `website_id`, `group_id`, `name`, `sort_order`, `is_active`)
VALUES
	(0,'admin',0,0,'Admin',0,1),
	(1,'default',1,1,'Default Store View',0,1);

/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table store_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `store_group`;

CREATE TABLE `store_group` (
  `group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Store group unique code',
  `name` varchar(255) NOT NULL COMMENT 'Store Group Name',
  `root_category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Root Category Id',
  `default_store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Store Id',
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `STORE_GROUP_CODE` (`code`),
  KEY `STORE_GROUP_WEBSITE_ID` (`website_id`),
  KEY `STORE_GROUP_DEFAULT_STORE_ID` (`default_store_id`),
  CONSTRAINT `STORE_GROUP_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store Groups';

LOCK TABLES `store_group` WRITE;
/*!40000 ALTER TABLE `store_group` DISABLE KEYS */;

INSERT INTO `store_group` (`group_id`, `website_id`, `code`, `name`, `root_category_id`, `default_store_id`)
VALUES
	(0,0,'default','Default',0,0),
	(1,1,'main_website_store','Main Website Store',2,1);

/*!40000 ALTER TABLE `store_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table store_website
# ------------------------------------------------------------

DROP TABLE IF EXISTS `store_website`;

CREATE TABLE `store_website` (
  `website_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Website Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `name` varchar(64) DEFAULT NULL COMMENT 'Website Name',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Group Id',
  `is_default` smallint(5) unsigned DEFAULT '0' COMMENT 'Defines Is Website Default',
  PRIMARY KEY (`website_id`),
  UNIQUE KEY `STORE_WEBSITE_CODE` (`code`),
  KEY `STORE_WEBSITE_SORT_ORDER` (`sort_order`),
  KEY `STORE_WEBSITE_DEFAULT_GROUP_ID` (`default_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Websites';

LOCK TABLES `store_website` WRITE;
/*!40000 ALTER TABLE `store_website` DISABLE KEYS */;

INSERT INTO `store_website` (`website_id`, `code`, `name`, `sort_order`, `default_group_id`, `is_default`)
VALUES
	(0,'admin','Admin',0,0,0),
	(1,'base','Main Website',0,1,1);

/*!40000 ALTER TABLE `store_website` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tax_calculation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tax_calculation`;

CREATE TABLE `tax_calculation` (
  `tax_calculation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `tax_calculation_rule_id` int(11) NOT NULL COMMENT 'Tax Calculation Rule Id',
  `customer_tax_class_id` smallint(6) NOT NULL COMMENT 'Customer Tax Class Id',
  `product_tax_class_id` smallint(6) NOT NULL COMMENT 'Product Tax Class Id',
  PRIMARY KEY (`tax_calculation_id`),
  KEY `TAX_CALCULATION_TAX_CALCULATION_RULE_ID` (`tax_calculation_rule_id`),
  KEY `TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID` (`customer_tax_class_id`),
  KEY `TAX_CALCULATION_PRODUCT_TAX_CLASS_ID` (`product_tax_class_id`),
  KEY `TAX_CALC_TAX_CALC_RATE_ID_CSTR_TAX_CLASS_ID_PRD_TAX_CLASS_ID` (`tax_calculation_rate_id`,`customer_tax_class_id`,`product_tax_class_id`),
  CONSTRAINT `TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`customer_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE,
  CONSTRAINT `TAX_CALCULATION_PRODUCT_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`product_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE,
  CONSTRAINT `TAX_CALC_TAX_CALC_RATE_ID_TAX_CALC_RATE_TAX_CALC_RATE_ID` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE,
  CONSTRAINT `TAX_CALC_TAX_CALC_RULE_ID_TAX_CALC_RULE_TAX_CALC_RULE_ID` FOREIGN KEY (`tax_calculation_rule_id`) REFERENCES `tax_calculation_rule` (`tax_calculation_rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation';



# Dump of table tax_calculation_rate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tax_calculation_rate`;

CREATE TABLE `tax_calculation_rate` (
  `tax_calculation_rate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Id',
  `tax_country_id` varchar(2) NOT NULL COMMENT 'Tax Country Id',
  `tax_region_id` int(11) NOT NULL COMMENT 'Tax Region Id',
  `tax_postcode` varchar(21) DEFAULT NULL COMMENT 'Tax Postcode',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `rate` decimal(12,4) NOT NULL COMMENT 'Rate',
  `zip_is_range` smallint(6) DEFAULT NULL COMMENT 'Zip Is Range',
  `zip_from` int(10) unsigned DEFAULT NULL COMMENT 'Zip From',
  `zip_to` int(10) unsigned DEFAULT NULL COMMENT 'Zip To',
  PRIMARY KEY (`tax_calculation_rate_id`),
  KEY `TAX_CALCULATION_RATE_TAX_COUNTRY_ID_TAX_REGION_ID_TAX_POSTCODE` (`tax_country_id`,`tax_region_id`,`tax_postcode`),
  KEY `TAX_CALCULATION_RATE_CODE` (`code`),
  KEY `IDX_CA799F1E2CB843495F601E56C84A626D` (`tax_calculation_rate_id`,`tax_country_id`,`tax_region_id`,`zip_is_range`,`tax_postcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate';

LOCK TABLES `tax_calculation_rate` WRITE;
/*!40000 ALTER TABLE `tax_calculation_rate` DISABLE KEYS */;

INSERT INTO `tax_calculation_rate` (`tax_calculation_rate_id`, `tax_country_id`, `tax_region_id`, `tax_postcode`, `code`, `rate`, `zip_is_range`, `zip_from`, `zip_to`)
VALUES
	(1,'US',12,'*','US-CA-*-Rate 1',8.2500,NULL,NULL,NULL),
	(2,'US',43,'*','US-NY-*-Rate 1',8.3750,NULL,NULL,NULL);

/*!40000 ALTER TABLE `tax_calculation_rate` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tax_calculation_rate_title
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tax_calculation_rate_title`;

CREATE TABLE `tax_calculation_rate_title` (
  `tax_calculation_rate_title_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Title Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`tax_calculation_rate_title_id`),
  KEY `TAX_CALCULATION_RATE_TITLE_TAX_CALCULATION_RATE_ID_STORE_ID` (`tax_calculation_rate_id`,`store_id`),
  KEY `TAX_CALCULATION_RATE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_37FB965F786AD5897BB3AE90470C42AB` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE,
  CONSTRAINT `TAX_CALCULATION_RATE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate Title';



# Dump of table tax_calculation_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tax_calculation_rule`;

CREATE TABLE `tax_calculation_rule` (
  `tax_calculation_rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rule Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `calculate_subtotal` int(11) NOT NULL COMMENT 'Calculate off subtotal option',
  PRIMARY KEY (`tax_calculation_rule_id`),
  KEY `TAX_CALCULATION_RULE_PRIORITY_POSITION` (`priority`,`position`),
  KEY `TAX_CALCULATION_RULE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rule';



# Dump of table tax_class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tax_class`;

CREATE TABLE `tax_class` (
  `class_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Class Id',
  `class_name` varchar(255) NOT NULL COMMENT 'Class Name',
  `class_type` varchar(8) NOT NULL DEFAULT 'CUSTOMER' COMMENT 'Class Type',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Class';

LOCK TABLES `tax_class` WRITE;
/*!40000 ALTER TABLE `tax_class` DISABLE KEYS */;

INSERT INTO `tax_class` (`class_id`, `class_name`, `class_type`)
VALUES
	(2,'Taxable Goods','PRODUCT'),
	(3,'Retail Customer','CUSTOMER');

/*!40000 ALTER TABLE `tax_class` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tax_order_aggregated_created
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tax_order_aggregated_created`;

CREATE TABLE `tax_order_aggregated_created` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `TAX_ORDER_AGGRED_CREATED_PERIOD_STORE_ID_CODE_PERCENT_ORDER_STS` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `TAX_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`),
  CONSTRAINT `TAX_ORDER_AGGREGATED_CREATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Order Aggregation';



# Dump of table tax_order_aggregated_updated
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tax_order_aggregated_updated`;

CREATE TABLE `tax_order_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `TAX_ORDER_AGGRED_UPDATED_PERIOD_STORE_ID_CODE_PERCENT_ORDER_STS` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `TAX_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  CONSTRAINT `TAX_ORDER_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Order Aggregated Updated';



# Dump of table theme
# ------------------------------------------------------------

DROP TABLE IF EXISTS `theme`;

CREATE TABLE `theme` (
  `theme_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Theme identifier',
  `parent_id` int(11) DEFAULT NULL COMMENT 'Parent Id',
  `theme_path` varchar(255) DEFAULT NULL COMMENT 'Theme Path',
  `theme_title` varchar(255) NOT NULL COMMENT 'Theme Title',
  `preview_image` varchar(255) DEFAULT NULL COMMENT 'Preview Image',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Theme Featured',
  `area` varchar(255) NOT NULL COMMENT 'Theme Area',
  `type` smallint(6) NOT NULL COMMENT 'Theme type: 0:physical, 1:virtual, 2:staging',
  `code` text COMMENT 'Full theme code, including package',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Core theme';

LOCK TABLES `theme` WRITE;
/*!40000 ALTER TABLE `theme` DISABLE KEYS */;

INSERT INTO `theme` (`theme_id`, `parent_id`, `theme_path`, `theme_title`, `preview_image`, `is_featured`, `area`, `type`, `code`)
VALUES
	(1,NULL,'Magento/blank','Magento Blank','preview_image_59fcae0b63864.jpeg',0,'frontend',0,'Magento/blank'),
	(2,1,'Magento/luma','Magento Luma','preview_image_59fcae0b8c6b2.jpeg',0,'frontend',0,'Magento/luma'),
	(3,NULL,'Magento/backend','Magento 2 backend',NULL,0,'adminhtml',0,'Magento/backend');

/*!40000 ALTER TABLE `theme` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table theme_file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `theme_file`;

CREATE TABLE `theme_file` (
  `theme_files_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Theme files identifier',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme Id',
  `file_path` varchar(255) DEFAULT NULL COMMENT 'Relative path to file',
  `file_type` varchar(32) NOT NULL COMMENT 'File Type',
  `content` longtext NOT NULL COMMENT 'File Content',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Temporary File',
  PRIMARY KEY (`theme_files_id`),
  KEY `THEME_FILE_THEME_ID_THEME_THEME_ID` (`theme_id`),
  CONSTRAINT `THEME_FILE_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`theme_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Core theme files';



# Dump of table translation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `translation`;

CREATE TABLE `translation` (
  `key_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Key Id of Translation',
  `string` varchar(255) NOT NULL DEFAULT 'Translate String' COMMENT 'Translation String',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `translate` varchar(255) DEFAULT NULL COMMENT 'Translate',
  `locale` varchar(20) NOT NULL DEFAULT 'en_US' COMMENT 'Locale',
  `crc_string` bigint(20) NOT NULL DEFAULT '1591228201' COMMENT 'Translation String CRC32 Hash',
  PRIMARY KEY (`key_id`),
  UNIQUE KEY `TRANSLATION_STORE_ID_LOCALE_CRC_STRING_STRING` (`store_id`,`locale`,`crc_string`,`string`),
  CONSTRAINT `TRANSLATION_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Translations';



# Dump of table ui_bookmark
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ui_bookmark`;

CREATE TABLE `ui_bookmark` (
  `bookmark_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Bookmark identifier',
  `user_id` int(10) unsigned NOT NULL COMMENT 'User Id',
  `namespace` varchar(255) NOT NULL COMMENT 'Bookmark namespace',
  `identifier` varchar(255) NOT NULL COMMENT 'Bookmark Identifier',
  `current` smallint(6) NOT NULL COMMENT 'Mark current bookmark per user and identifier',
  `title` varchar(255) DEFAULT NULL COMMENT 'Bookmark title',
  `config` longtext COMMENT 'Bookmark config',
  `created_at` datetime NOT NULL COMMENT 'Bookmark created at',
  `updated_at` datetime NOT NULL COMMENT 'Bookmark updated at',
  PRIMARY KEY (`bookmark_id`),
  KEY `UI_BOOKMARK_USER_ID_NAMESPACE_IDENTIFIER` (`user_id`,`namespace`,`identifier`),
  CONSTRAINT `UI_BOOKMARK_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bookmark';



# Dump of table url_rewrite
# ------------------------------------------------------------

DROP TABLE IF EXISTS `url_rewrite`;

CREATE TABLE `url_rewrite` (
  `url_rewrite_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rewrite Id',
  `entity_type` varchar(32) NOT NULL COMMENT 'Entity type code',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `request_path` varchar(255) DEFAULT NULL COMMENT 'Request Path',
  `target_path` varchar(255) DEFAULT NULL COMMENT 'Target Path',
  `redirect_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Redirect Type',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description',
  `is_autogenerated` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is rewrite generated automatically flag',
  `metadata` varchar(255) DEFAULT NULL COMMENT 'Meta data for url rewrite',
  PRIMARY KEY (`url_rewrite_id`),
  UNIQUE KEY `URL_REWRITE_REQUEST_PATH_STORE_ID` (`request_path`,`store_id`),
  KEY `URL_REWRITE_TARGET_PATH` (`target_path`),
  KEY `URL_REWRITE_STORE_ID_ENTITY_ID` (`store_id`,`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Url Rewrites';

LOCK TABLES `url_rewrite` WRITE;
/*!40000 ALTER TABLE `url_rewrite` DISABLE KEYS */;

INSERT INTO `url_rewrite` (`url_rewrite_id`, `entity_type`, `entity_id`, `request_path`, `target_path`, `redirect_type`, `store_id`, `description`, `is_autogenerated`, `metadata`)
VALUES
	(1,'cms-page',1,'no-route','cms/page/view/page_id/1',0,1,NULL,1,NULL),
	(2,'cms-page',2,'home','cms/page/view/page_id/2',0,1,NULL,1,NULL),
	(3,'cms-page',3,'enable-cookies','cms/page/view/page_id/3',0,1,NULL,1,NULL),
	(4,'cms-page',4,'privacy-policy-cookie-restriction-mode','cms/page/view/page_id/4',0,1,NULL,1,NULL);

/*!40000 ALTER TABLE `url_rewrite` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table variable
# ------------------------------------------------------------

DROP TABLE IF EXISTS `variable`;

CREATE TABLE `variable` (
  `variable_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Variable Code',
  `name` varchar(255) DEFAULT NULL COMMENT 'Variable Name',
  PRIMARY KEY (`variable_id`),
  UNIQUE KEY `VARIABLE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variables';



# Dump of table variable_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `variable_value`;

CREATE TABLE `variable_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable Value Id',
  `variable_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Variable Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `plain_value` text COMMENT 'Plain Text Value',
  `html_value` text COMMENT 'Html Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `VARIABLE_VALUE_VARIABLE_ID_STORE_ID` (`variable_id`,`store_id`),
  KEY `VARIABLE_VALUE_STORE_ID` (`store_id`),
  CONSTRAINT `VARIABLE_VALUE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `VARIABLE_VALUE_VARIABLE_ID_VARIABLE_VARIABLE_ID` FOREIGN KEY (`variable_id`) REFERENCES `variable` (`variable_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variable Value';



# Dump of table vault_payment_token
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vault_payment_token`;

CREATE TABLE `vault_payment_token` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `public_hash` varchar(128) NOT NULL COMMENT 'Hash code for using on frontend',
  `payment_method_code` varchar(128) NOT NULL COMMENT 'Payment method code',
  `type` varchar(128) NOT NULL COMMENT 'Type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `expires_at` timestamp NULL DEFAULT NULL COMMENT 'Expires At',
  `gateway_token` varchar(255) NOT NULL COMMENT 'Gateway Token',
  `details` text COMMENT 'Details',
  `is_active` tinyint(1) NOT NULL COMMENT 'Is active flag',
  `is_visible` tinyint(1) NOT NULL COMMENT 'Is visible flag',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `VAULT_PAYMENT_TOKEN_HASH_UNIQUE_INDEX_PUBLIC_HASH` (`public_hash`),
  UNIQUE KEY `UNQ_54DCE14AEAEA03B587F9EF723EB10A10` (`payment_method_code`,`customer_id`,`gateway_token`),
  KEY `VAULT_PAYMENT_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`customer_id`),
  CONSTRAINT `VAULT_PAYMENT_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Vault tokens of payment';



# Dump of table vault_payment_token_order_payment_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vault_payment_token_order_payment_link`;

CREATE TABLE `vault_payment_token_order_payment_link` (
  `order_payment_id` int(10) unsigned NOT NULL COMMENT 'Order payment Id',
  `payment_token_id` int(10) unsigned NOT NULL COMMENT 'Payment token Id',
  PRIMARY KEY (`order_payment_id`,`payment_token_id`),
  KEY `FK_4ED894655446D385894580BECA993862` (`payment_token_id`),
  CONSTRAINT `FK_4ED894655446D385894580BECA993862` FOREIGN KEY (`payment_token_id`) REFERENCES `vault_payment_token` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CF37B9D854256534BE23C818F6291CA2` FOREIGN KEY (`order_payment_id`) REFERENCES `sales_order_payment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Order payments to vault token';



# Dump of table weee_tax
# ------------------------------------------------------------

DROP TABLE IF EXISTS `weee_tax`;

CREATE TABLE `weee_tax` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `country` varchar(2) DEFAULT NULL COMMENT 'Country',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT 'State',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`value_id`),
  KEY `WEEE_TAX_WEBSITE_ID` (`website_id`),
  KEY `WEEE_TAX_ENTITY_ID` (`entity_id`),
  KEY `WEEE_TAX_COUNTRY` (`country`),
  KEY `WEEE_TAX_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `WEEE_TAX_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `WEEE_TAX_COUNTRY_DIRECTORY_COUNTRY_COUNTRY_ID` FOREIGN KEY (`country`) REFERENCES `directory_country` (`country_id`) ON DELETE CASCADE,
  CONSTRAINT `WEEE_TAX_ENTITY_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `WEEE_TAX_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Weee Tax';



# Dump of table widget
# ------------------------------------------------------------

DROP TABLE IF EXISTS `widget`;

CREATE TABLE `widget` (
  `widget_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Widget Id',
  `widget_code` varchar(255) DEFAULT NULL COMMENT 'Widget code for template directive',
  `widget_type` varchar(255) DEFAULT NULL COMMENT 'Widget Type',
  `parameters` text COMMENT 'Parameters',
  PRIMARY KEY (`widget_id`),
  KEY `WIDGET_WIDGET_CODE` (`widget_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Preconfigured Widgets';



# Dump of table widget_instance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `widget_instance`;

CREATE TABLE `widget_instance` (
  `instance_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Instance Id',
  `instance_type` varchar(255) DEFAULT NULL COMMENT 'Instance Type',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Widget Title',
  `store_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Store ids',
  `widget_parameters` text COMMENT 'Widget parameters',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  PRIMARY KEY (`instance_id`),
  KEY `WIDGET_INSTANCE_THEME_ID_THEME_THEME_ID` (`theme_id`),
  CONSTRAINT `WIDGET_INSTANCE_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`theme_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instances of Widget for Package Theme';



# Dump of table widget_instance_page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `widget_instance_page`;

CREATE TABLE `widget_instance_page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Page Id',
  `instance_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Id',
  `page_group` varchar(25) DEFAULT NULL COMMENT 'Block Group Type',
  `layout_handle` varchar(255) DEFAULT NULL COMMENT 'Layout Handle',
  `block_reference` varchar(255) DEFAULT NULL COMMENT 'Container',
  `page_for` varchar(25) DEFAULT NULL COMMENT 'For instance entities',
  `entities` text COMMENT 'Catalog entities (comma separated)',
  `page_template` varchar(255) DEFAULT NULL COMMENT 'Path to widget template',
  PRIMARY KEY (`page_id`),
  KEY `WIDGET_INSTANCE_PAGE_INSTANCE_ID` (`instance_id`),
  CONSTRAINT `WIDGET_INSTANCE_PAGE_INSTANCE_ID_WIDGET_INSTANCE_INSTANCE_ID` FOREIGN KEY (`instance_id`) REFERENCES `widget_instance` (`instance_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instance of Widget on Page';



# Dump of table widget_instance_page_layout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `widget_instance_page_layout`;

CREATE TABLE `widget_instance_page_layout` (
  `page_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Page Id',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update Id',
  UNIQUE KEY `WIDGET_INSTANCE_PAGE_LAYOUT_LAYOUT_UPDATE_ID_PAGE_ID` (`layout_update_id`,`page_id`),
  KEY `WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID` (`page_id`),
  CONSTRAINT `WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID_WIDGET_INSTANCE_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `widget_instance_page` (`page_id`) ON DELETE CASCADE,
  CONSTRAINT `WIDGET_INSTANCE_PAGE_LYT_LYT_UPDATE_ID_LYT_UPDATE_LYT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `layout_update` (`layout_update_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout updates';



# Dump of table wishlist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wishlist`;

CREATE TABLE `wishlist` (
  `wishlist_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist ID',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `shared` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sharing flag (0 or 1)',
  `sharing_code` varchar(32) DEFAULT NULL COMMENT 'Sharing encrypted code',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Last updated date',
  PRIMARY KEY (`wishlist_id`),
  UNIQUE KEY `WISHLIST_CUSTOMER_ID` (`customer_id`),
  KEY `WISHLIST_SHARED` (`shared`),
  CONSTRAINT `WISHLIST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist main Table';



# Dump of table wishlist_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wishlist_item`;

CREATE TABLE `wishlist_item` (
  `wishlist_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist item ID',
  `wishlist_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Wishlist ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Add date and time',
  `description` text COMMENT 'Short description of wish list item',
  `qty` decimal(12,4) NOT NULL COMMENT 'Qty',
  PRIMARY KEY (`wishlist_item_id`),
  KEY `WISHLIST_ITEM_WISHLIST_ID` (`wishlist_id`),
  KEY `WISHLIST_ITEM_PRODUCT_ID` (`product_id`),
  KEY `WISHLIST_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `WISHLIST_ITEM_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `WISHLIST_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL,
  CONSTRAINT `WISHLIST_ITEM_WISHLIST_ID_WISHLIST_WISHLIST_ID` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`wishlist_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist items';



# Dump of table wishlist_item_option
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wishlist_item_option`;

CREATE TABLE `wishlist_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `wishlist_item_id` int(10) unsigned NOT NULL COMMENT 'Wishlist Item Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `FK_A014B30B04B72DD0EAB3EECD779728D6` (`wishlist_item_id`),
  CONSTRAINT `FK_A014B30B04B72DD0EAB3EECD779728D6` FOREIGN KEY (`wishlist_item_id`) REFERENCES `wishlist_item` (`wishlist_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist Item Option Table';




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
