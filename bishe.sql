/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : bishe

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-09-12 15:48:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add user', '3', 'add_user');
INSERT INTO `auth_permission` VALUES ('8', 'Can change user', '3', 'change_user');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete user', '3', 'delete_user');
INSERT INTO `auth_permission` VALUES ('10', 'Can add group', '4', 'add_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can change group', '4', 'change_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete group', '4', 'delete_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add company_ info', '7', 'add_company_info');
INSERT INTO `auth_permission` VALUES ('20', 'Can change company_ info', '7', 'change_company_info');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete company_ info', '7', 'delete_company_info');
INSERT INTO `auth_permission` VALUES ('22', 'Can add img', '8', 'add_img');
INSERT INTO `auth_permission` VALUES ('23', 'Can change img', '8', 'change_img');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete img', '8', 'delete_img');
INSERT INTO `auth_permission` VALUES ('25', 'Can add people_ discuss', '9', 'add_people_discuss');
INSERT INTO `auth_permission` VALUES ('26', 'Can change people_ discuss', '9', 'change_people_discuss');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete people_ discuss', '9', 'delete_people_discuss');
INSERT INTO `auth_permission` VALUES ('28', 'Can add positions_info', '10', 'add_positions_info');
INSERT INTO `auth_permission` VALUES ('29', 'Can change positions_info', '10', 'change_positions_info');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete positions_info', '10', 'delete_positions_info');
INSERT INTO `auth_permission` VALUES ('31', 'Can add root_ user', '11', 'add_root_user');
INSERT INTO `auth_permission` VALUES ('32', 'Can change root_ user', '11', 'change_root_user');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete root_ user', '11', 'delete_root_user');
INSERT INTO `auth_permission` VALUES ('34', 'Can add school_ info', '12', 'add_school_info');
INSERT INTO `auth_permission` VALUES ('35', 'Can change school_ info', '12', 'change_school_info');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete school_ info', '12', 'delete_school_info');
INSERT INTO `auth_permission` VALUES ('37', 'Can add student_ employment_ info', '13', 'add_student_employment_info');
INSERT INTO `auth_permission` VALUES ('38', 'Can change student_ employment_ info', '13', 'change_student_employment_info');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete student_ employment_ info', '13', 'delete_student_employment_info');
INSERT INTO `auth_permission` VALUES ('40', 'Can add user_ info', '14', 'add_user_info');
INSERT INTO `auth_permission` VALUES ('41', 'Can change user_ info', '14', 'change_user_info');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete user_ info', '14', 'delete_user_info');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$30000$IsMXaf0sZZaj$mqGEVrlyEktqes9xQB+8M27IgDVBRzp0STNACNmbw88=', '2018-09-12 07:39:53.799000', '0', 'guan', '', '', '', '0', '1', '2018-09-06 09:45:32.345000');
INSERT INTO `auth_user` VALUES ('2', 'pbkdf2_sha256$30000$P2ZFCHgFDccL$ZDuL6lXOVoWrl4OCVCA7oC/L6ADGWzZnv1lfciIgBZo=', '2018-09-12 06:19:11.873000', '0', 'zetta', '', '', '', '0', '1', '2018-09-06 09:46:39.844000');

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `company_info`
-- ----------------------------
DROP TABLE IF EXISTS `company_info`;
CREATE TABLE `company_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `company_address` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `set_time` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `company_introduction` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `tag` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of company_info
-- ----------------------------
INSERT INTO `company_info` VALUES ('1', 'zetta', 'zetta', '牡丹园', '工程师', '2014-11-22', 'GPU，云计算', '2');
INSERT INTO `company_info` VALUES ('2', 'zetta', 'zetta', '牡丹园', '工程师', '2014-11-22', 'GPU，云计算', '');
INSERT INTO `company_info` VALUES ('3', 'zetta', 'zetta', '牡丹园', '工程师', '2014-11-22', 'GPU，云计算', '');

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('7', 'app01', 'company_info');
INSERT INTO `django_content_type` VALUES ('8', 'app01', 'img');
INSERT INTO `django_content_type` VALUES ('9', 'app01', 'people_discuss');
INSERT INTO `django_content_type` VALUES ('10', 'app01', 'positions_info');
INSERT INTO `django_content_type` VALUES ('11', 'app01', 'root_user');
INSERT INTO `django_content_type` VALUES ('12', 'app01', 'school_info');
INSERT INTO `django_content_type` VALUES ('13', 'app01', 'student_employment_info');
INSERT INTO `django_content_type` VALUES ('14', 'app01', 'user_info');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-09-06 09:39:07.461000');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2018-09-06 09:39:16.466000');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2018-09-06 09:39:18.673000');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2018-09-06 09:39:18.720000');
INSERT INTO `django_migrations` VALUES ('5', 'app01', '0001_initial', '2018-09-06 09:39:21.546000');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2018-09-06 09:39:22.700000');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2018-09-06 09:39:23.535000');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2018-09-06 09:39:24.265000');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2018-09-06 09:39:24.325000');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2018-09-06 09:39:24.914000');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2018-09-06 09:39:24.961000');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2018-09-06 09:39:25.071000');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2018-09-06 09:39:25.821000');
INSERT INTO `django_migrations` VALUES ('14', 'sessions', '0001_initial', '2018-09-06 09:39:26.352000');
INSERT INTO `django_migrations` VALUES ('15', 'app01', '0002_auto_20180912_1354', '2018-09-12 05:55:51.151000');
INSERT INTO `django_migrations` VALUES ('16', 'app01', '0003_auto_20180912_1355', '2018-09-12 05:55:52.341000');
INSERT INTO `django_migrations` VALUES ('17', 'app01', '0004_auto_20180912_1417', '2018-09-12 06:17:42.195000');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('wqbvd1p4rtpsinbio8syimzkkq24p9ae', 'ZjVjMDY5NWU4ZTcyNmE3ZjgxZTQxODQ3YjU5ZDYxNWU3MjY3OTA4Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlNTBlODhiNTI1MTU2Y2ZlNzU5ZGU1ZjU3YjUwZmU2NTNhYjE0YTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-09-26 07:39:53.878000');

-- ----------------------------
-- Table structure for `img`
-- ----------------------------
DROP TABLE IF EXISTS `img`;
CREATE TABLE `img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of img
-- ----------------------------
INSERT INTO `img` VALUES ('1', '', 'static\\auth_user.sql');
INSERT INTO `img` VALUES ('2', '', 'static\\school_info.sql');
INSERT INTO `img` VALUES ('3', '', 'static\\upload\\user_info.sql');
INSERT INTO `img` VALUES ('4', '', 'static\\upload\\关凯心的知页简历.docx');
INSERT INTO `img` VALUES ('5', '', 'static\\upload\\关凯心的知页简历.pdf');

-- ----------------------------
-- Table structure for `people_discusses`
-- ----------------------------
DROP TABLE IF EXISTS `people_discusses`;
CREATE TABLE `people_discusses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `datetime` datetime(6) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of people_discusses
-- ----------------------------

-- ----------------------------
-- Table structure for `positions_info`
-- ----------------------------
DROP TABLE IF EXISTS `positions_info`;
CREATE TABLE `positions_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `set_time` datetime(6) NOT NULL,
  `company_address` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `salary` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `datetime` date NOT NULL,
  `company_introduction` longtext COLLATE utf8_unicode_ci NOT NULL,
  `skills` longtext COLLATE utf8_unicode_ci NOT NULL,
  `people_number` int(11) NOT NULL,
  `company_email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of positions_info
-- ----------------------------
INSERT INTO `positions_info` VALUES ('1', 'zetta', 'zetta', '2014-11-20 16:00:00.000000', '牡丹园', 'python', '10000', '2018-09-06', 'GPU，云计算', 'python', '100', '123456789@qq.com', '开发');

-- ----------------------------
-- Table structure for `root_user`
-- ----------------------------
DROP TABLE IF EXISTS `root_user`;
CREATE TABLE `root_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of root_user
-- ----------------------------

-- ----------------------------
-- Table structure for `school_info`
-- ----------------------------
DROP TABLE IF EXISTS `school_info`;
CREATE TABLE `school_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `real_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `school_address` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `college` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `tag` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of school_info
-- ----------------------------

-- ----------------------------
-- Table structure for `student_employment_info`
-- ----------------------------
DROP TABLE IF EXISTS `student_employment_info`;
CREATE TABLE `student_employment_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `realname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `college` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `professional` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `company_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `company_address` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `company_phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `company_header` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `company_header_phone` bigint(20) NOT NULL,
  `phone_self` bigint(20) NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of student_employment_info
-- ----------------------------

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `realname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `college` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `professional` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `phone` bigint(20) NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `signature` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `parent_phone` bigint(20) NOT NULL,
  `birth_date` date NOT NULL,
  `tag` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '关凯心', 'guan', '男', '18', '信工', '信本', '18131372465', '714881079@qq.com', '我就是我，一个不一样的烟火', '18131372465', '1997-01-31', '0');
