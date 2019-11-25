/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 100408
Source Host           : localhost:3306
Source Database       : bloglaravel

Target Server Type    : MYSQL
Target Server Version : 100408
File Encoding         : 65001

Date: 2019-11-25 18:55:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cates
-- ----------------------------
DROP TABLE IF EXISTS `cates`;
CREATE TABLE `cates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '分类名称',
  `pid` int(11) NOT NULL COMMENT '父级分类id',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '路径',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cates
-- ----------------------------
INSERT INTO `cates` VALUES ('1', 'php ', '0', '0', '2019-11-19 11:19:33', '2019-11-19 11:19:33');
INSERT INTO `cates` VALUES ('2', 'ui', '0', '0', '2019-11-19 11:19:47', '2019-11-19 11:19:47');
INSERT INTO `cates` VALUES ('3', 'laravel', '1', '0,1', '2019-11-19 11:20:08', '2019-11-19 11:20:08');
INSERT INTO `cates` VALUES ('4', 'javascript', '2', '0,2', '2019-11-19 11:20:25', '2019-11-19 11:20:25');
INSERT INTO `cates` VALUES ('5', 'java', '0', '0', '2019-11-19 11:20:32', '2019-11-19 11:20:32');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户的id',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '评论内容',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '父级评论的id  0代表的是评论 大于0的话 是回复',
  `post_id` int(11) NOT NULL COMMENT '文章id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_reserved_at_index` (`queue`,`reserved`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('2016_10_25_115858_create_posts_table', '1');
INSERT INTO `migrations` VALUES ('2016_10_25_115934_create_cates_table', '1');
INSERT INTO `migrations` VALUES ('2016_10_25_115947_create_comments_table', '1');
INSERT INTO `migrations` VALUES ('2016_10_25_120003_create_tags_table', '1');
INSERT INTO `migrations` VALUES ('2016_10_25_120759_create_post_tag', '1');
INSERT INTO `migrations` VALUES ('2016_11_21_083009_create_jobs_table', '1');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '文章标题',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '文章内容',
  `user_id` int(11) NOT NULL COMMENT '作者的id',
  `cate_id` int(11) NOT NULL COMMENT '分类id',
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '文章主图',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('1', '12456', '<p>scgasgcsl</p>', '1', '3', '/Upload/2019-11-21/1574307891733012.jpg', '2019-11-21 03:44:52', '2019-11-25 04:33:26');
INSERT INTO `posts` VALUES ('2', '12456', '<p>scgasgcs</p>', '1', '3', '/Upload/2019-11-21/1574307934568396.jpg', '2019-11-21 03:45:34', '2019-11-21 03:45:34');
INSERT INTO `posts` VALUES ('3', 'dscsdsdv', '<p>fbdfbbefdvdf</p>', '1', '1', '/Upload/2019-11-21/1574328405180465.jpg', '2019-11-21 09:26:45', '2019-11-21 09:26:45');
INSERT INTO `posts` VALUES ('4', 'fdvdsv', '<p>fbdfbbefdvdf</p>', '1', '3', '/Upload/2019-11-21/1574328831880868.jpg', '2019-11-21 09:33:51', '2019-11-21 09:33:51');
INSERT INTO `posts` VALUES ('5', '小', '<p>fbdfbbefdvdf</p>', '1', '2', '/Upload/2019-11-21/1574328937794752.jpg', '2019-11-21 09:35:37', '2019-11-21 09:35:37');
INSERT INTO `posts` VALUES ('6', '小计划表', '<p>fbdfbbefdvdf与欧丽</p>', '1', '1', '/Upload/2019-11-21/1574329013441593.jpg', '2019-11-21 09:36:53', '2019-11-21 09:36:53');
INSERT INTO `posts` VALUES ('7', '小计划表1', '<p>fbdfbbefdvdf与欧丽</p>', '1', '1', '/Upload/2019-11-21/1574329035247822.jpg', '2019-11-21 09:37:15', '2019-11-21 09:37:15');
INSERT INTO `posts` VALUES ('8', '小计划表1的深V', '<p>是吃饱饭工程部</p>', '1', '1', '/Upload/2019-11-21/1574329248646288.jpg', '2019-11-21 09:40:48', '2019-11-21 09:40:48');
INSERT INTO `posts` VALUES ('9', '小计划表1的深V', '<p>是吃饱饭工程部界面</p>', '1', '4', '/Upload/2019-11-21/1574329306128523.jpg', '2019-11-21 09:41:46', '2019-11-21 09:41:46');
INSERT INTO `posts` VALUES ('10', '都会更好的', '<p>是吃饱饭工程部界面存放</p>', '1', '4', '/Upload/2019-11-21/1574329336910180.jpg', '2019-11-21 09:42:16', '2019-11-21 11:33:34');

-- ----------------------------
-- Table structure for post_tag
-- ----------------------------
DROP TABLE IF EXISTS `post_tag`;
CREATE TABLE `post_tag` (
  `post_id` int(11) NOT NULL COMMENT '文章id',
  `tag_id` int(11) NOT NULL COMMENT '标签id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of post_tag
-- ----------------------------
INSERT INTO `post_tag` VALUES ('1', '10');
INSERT INTO `post_tag` VALUES ('1', '9');
INSERT INTO `post_tag` VALUES ('2', '10');
INSERT INTO `post_tag` VALUES ('2', '9');
INSERT INTO `post_tag` VALUES ('4', '10');
INSERT INTO `post_tag` VALUES ('4', '9');
INSERT INTO `post_tag` VALUES ('4', '8');
INSERT INTO `post_tag` VALUES ('5', '10');
INSERT INTO `post_tag` VALUES ('5', '8');
INSERT INTO `post_tag` VALUES ('6', '10');
INSERT INTO `post_tag` VALUES ('6', '8');
INSERT INTO `post_tag` VALUES ('7', '10');
INSERT INTO `post_tag` VALUES ('7', '8');
INSERT INTO `post_tag` VALUES ('8', '10');
INSERT INTO `post_tag` VALUES ('8', '8');
INSERT INTO `post_tag` VALUES ('9', '9');
INSERT INTO `post_tag` VALUES ('9', '8');
INSERT INTO `post_tag` VALUES ('10', '10');
INSERT INTO `post_tag` VALUES ('10', '9');
INSERT INTO `post_tag` VALUES ('10', '8');
INSERT INTO `post_tag` VALUES ('11', '10');
INSERT INTO `post_tag` VALUES ('11', '9');

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '标签的名称',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('1', '学校', '2019-11-19 11:21:25', '2019-11-19 11:21:25');
INSERT INTO `tags` VALUES ('2', '生活', '2019-11-19 11:21:47', '2019-11-19 11:21:47');
INSERT INTO `tags` VALUES ('3', 'a', '2019-11-21 02:16:01', '2019-11-21 02:16:01');
INSERT INTO `tags` VALUES ('4', 'b', '2019-11-21 02:16:09', '2019-11-21 02:16:09');
INSERT INTO `tags` VALUES ('5', '123', '2019-11-21 02:19:45', '2019-11-21 02:19:45');
INSERT INTO `tags` VALUES ('6', 'php', '2019-11-21 02:44:21', '2019-11-21 02:44:21');
INSERT INTO `tags` VALUES ('7', 'laravel', '2019-11-21 02:44:30', '2019-11-21 02:44:30');
INSERT INTO `tags` VALUES ('8', 'javascript', '2019-11-21 02:44:41', '2019-11-21 02:44:41');
INSERT INTO `tags` VALUES ('9', 'jq', '2019-11-21 02:44:53', '2019-11-21 02:44:53');
INSERT INTO `tags` VALUES ('10', 'html', '2019-11-21 02:45:05', '2019-11-21 02:45:05');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '头像',
  `intro` text COLLATE utf8_unicode_ci NOT NULL COMMENT '个人介绍',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin123456', '2455@qq.com', '$2y$10$SRxWWhu4PQ0HqwGdR04JCOtXQf60Q0sd8jXNLC7YAwv1UJltBWp2m', 'wVAF0MJdtEq5DLBksoCETJBOZNwlnQSTcs2xWZNJf8AAsFbSu6', '/Uploads/20191119/1574162458253596.jpg', 'kjshch', '2019-11-19 11:20:58', '2019-11-21 12:33:42', '2019-11-21 12:33:42');
INSERT INTO `users` VALUES ('2', 'admin123', 'admin@qq.com', '$2y$10$bRycuKRUSZ3Nz6coJFLYT.UFZ76U2kcyoer298Qz6.PqRCl.SAU3u', 'nQOWcLLE7oV3qNJdrqHX02SiuZGLqpbihkeMh46nP8Pr6DaMtt', '/Uploads/20191121/1574338594867678.jpg', 'safasfafetfewfew', '2019-11-21 12:16:34', '2019-11-21 12:16:34', null);
INSERT INTO `users` VALUES ('3', 'LHTong', '245dsafd5@qq.com', '$2y$10$ufLRY57OMN7OicD535PGQ.R1eRvUFzHi1Ob3l4Gypkm5So8csDyNG', '1OsNS2NJpK1TfdLSg35MlG6r8FtWj5G2GXR8ndJSNoyDDPW5cH', '/Uploads/20191121/1574339426428849.jpg', 'sdvdsvsdds', '2019-11-21 12:30:26', '2019-11-21 12:30:26', null);
