/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 100128
 Source Host           : localhost:3306
 Source Schema         : ecommerce-laravel

 Target Server Type    : MySQL
 Target Server Version : 100128
 File Encoding         : 65001

 Date: 31/07/2020 12:30:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_languages
-- ----------------------------
DROP TABLE IF EXISTS `admin_languages`;
CREATE TABLE `admin_languages`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rtl` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_languages
-- ----------------------------
INSERT INTO `admin_languages` VALUES (1, 1, 'English', '1567232745AoOcvCtY.json', '1567232745AoOcvCtY', 0);
INSERT INTO `admin_languages` VALUES (2, 0, 'RTL English', '1584887310NzfWDhO8.json', '1584887310NzfWDhO8', 1);

-- ----------------------------
-- Table structure for admin_user_conversations
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_conversations`;
CREATE TABLE `admin_user_conversations`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `type` enum('Ticket','Dispute') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `order_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_user_conversations
-- ----------------------------
INSERT INTO `admin_user_conversations` VALUES (1, 'Order Confirmation', 22, 'rfgdfgfd', '2020-01-20 17:18:38', '2020-01-20 17:18:38', 'Ticket', NULL);

-- ----------------------------
-- Table structure for admin_user_messages
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_messages`;
CREATE TABLE `admin_user_messages`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `conversation_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(191) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_user_messages
-- ----------------------------
INSERT INTO `admin_user_messages` VALUES (1, 1, 'rfgdfgfd', 22, '2020-01-20 17:18:38', '2020-01-20 17:18:38');

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(191) NOT NULL DEFAULT 0,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `shop_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admins_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES (1, 'Admin', 'admin@gmail.com', '01629552892', 0, '1556780563user.png', '$2y$10$p35S2FczpEfpbe41CX4j4.XE548tHBtF5weGLPxZ56MX5dsOFtaCC', 1, 'JYUaTo87bcOV6I1mWaCWFFQOYaJJNbi2FNz0JGcgd3prudAQ2DkO2XBvxvPp', '2018-02-28 15:27:08', '2019-07-26 13:21:32', 'Genius Store');
INSERT INTO `admins` VALUES (5, 'Mr Mamun', 'mamun@gmail.com', '34534534', 17, '1568803644User.png', '$2y$10$3AEjcvFBiQHECgtH9ivXTeQZfMf.rw318G820TtVBsYaCt7UNOwGC', 1, NULL, '2019-09-17 20:47:24', '2019-09-18 13:21:49', NULL);
INSERT INTO `admins` VALUES (6, 'Mr. Manik', 'manik@gmail.com', '5079956958', 18, '1568863361user-admin.png', '$2y$10$Z3Jx5jHjV2m4HtZHzeaKMuwxkLAKfJ1AX3Ed5MPACvFJLFkEWN9L.', 1, NULL, '2019-09-18 13:22:41', '2019-09-18 13:22:41', NULL);
INSERT INTO `admins` VALUES (7, 'Mr. Pratik', 'pratik@gmail.com', '34534534', 16, '1568863396user-admin.png', '$2y$10$u.93l4y6wOz6vq3BlAxvU.LuJ16/uBQ9s2yesRGTWUtLRiQSwoH1C', 1, 'iZPbEaxjSWBJMvncLqeMtAQsG7VoSirVMJ1EBfdJogvgXK2DM5mw236fBCOq', '2019-09-18 13:23:16', '2019-09-18 13:23:16', NULL);

-- ----------------------------
-- Table structure for attribute_options
-- ----------------------------
DROP TABLE IF EXISTS `attribute_options`;
CREATE TABLE `attribute_options`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 256 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of attribute_options
-- ----------------------------
INSERT INTO `attribute_options` VALUES (107, 14, 'No Warranty', '2019-09-23 14:56:07', '2019-09-23 14:56:07');
INSERT INTO `attribute_options` VALUES (108, 14, 'Local seller Warranty', '2019-09-23 14:56:07', '2019-09-23 14:56:07');
INSERT INTO `attribute_options` VALUES (109, 14, 'Non local warranty', '2019-09-23 14:56:07', '2019-09-23 14:56:07');
INSERT INTO `attribute_options` VALUES (110, 14, 'International Manufacturer Warranty', '2019-09-23 14:56:07', '2019-09-23 14:56:07');
INSERT INTO `attribute_options` VALUES (111, 14, 'International Seller Warranty', '2019-09-23 14:56:07', '2019-09-23 14:56:07');
INSERT INTO `attribute_options` VALUES (157, 22, 'Black', '2019-09-23 16:46:26', '2019-09-23 16:46:26');
INSERT INTO `attribute_options` VALUES (158, 22, 'White', '2019-09-23 16:46:26', '2019-09-23 16:46:26');
INSERT INTO `attribute_options` VALUES (159, 22, 'Sliver', '2019-09-23 16:46:26', '2019-09-23 16:46:26');
INSERT INTO `attribute_options` VALUES (160, 22, 'Red', '2019-09-23 16:46:26', '2019-09-23 16:46:26');
INSERT INTO `attribute_options` VALUES (161, 22, 'Dark Grey', '2019-09-23 16:46:26', '2019-09-23 16:46:26');
INSERT INTO `attribute_options` VALUES (162, 22, 'Dark Blue', '2019-09-23 16:46:26', '2019-09-23 16:46:26');
INSERT INTO `attribute_options` VALUES (163, 22, 'Brown', '2019-09-23 16:46:26', '2019-09-23 16:46:26');
INSERT INTO `attribute_options` VALUES (172, 24, '40', '2019-09-23 17:25:32', '2019-09-23 17:25:32');
INSERT INTO `attribute_options` VALUES (173, 24, '22', '2019-09-23 17:25:32', '2019-09-23 17:25:32');
INSERT INTO `attribute_options` VALUES (174, 24, '24', '2019-09-23 17:25:32', '2019-09-23 17:25:32');
INSERT INTO `attribute_options` VALUES (175, 24, '32', '2019-09-23 17:25:32', '2019-09-23 17:25:32');
INSERT INTO `attribute_options` VALUES (176, 24, '21', '2019-09-23 17:25:32', '2019-09-23 17:25:32');
INSERT INTO `attribute_options` VALUES (187, 30, 'Yellow', '2019-09-23 20:31:44', '2019-09-23 20:31:44');
INSERT INTO `attribute_options` VALUES (188, 30, 'White', '2019-09-23 20:31:44', '2019-09-23 20:31:44');
INSERT INTO `attribute_options` VALUES (189, 31, '22', '2019-09-23 20:34:35', '2019-09-23 20:34:35');
INSERT INTO `attribute_options` VALUES (190, 31, '34', '2019-09-23 20:34:35', '2019-09-23 20:34:35');
INSERT INTO `attribute_options` VALUES (191, 31, '45', '2019-09-23 20:34:35', '2019-09-23 20:34:35');
INSERT INTO `attribute_options` VALUES (195, 20, 'Local seller warranty', '2019-10-02 16:18:54', '2019-10-02 16:18:54');
INSERT INTO `attribute_options` VALUES (196, 20, 'No warranty', '2019-10-02 16:18:54', '2019-10-02 16:18:54');
INSERT INTO `attribute_options` VALUES (197, 20, 'international manufacturer warranty', '2019-10-02 16:18:54', '2019-10-02 16:18:54');
INSERT INTO `attribute_options` VALUES (198, 20, 'Non-local warranty', '2019-10-02 16:18:54', '2019-10-02 16:18:54');
INSERT INTO `attribute_options` VALUES (199, 21, 'Symphony', '2019-10-02 16:19:13', '2019-10-02 16:19:13');
INSERT INTO `attribute_options` VALUES (200, 21, 'Oppo', '2019-10-02 16:19:13', '2019-10-02 16:19:13');
INSERT INTO `attribute_options` VALUES (201, 21, 'EStore', '2019-10-02 16:19:13', '2019-10-02 16:19:13');
INSERT INTO `attribute_options` VALUES (202, 21, 'Infinix', '2019-10-02 16:19:13', '2019-10-02 16:19:13');
INSERT INTO `attribute_options` VALUES (203, 21, 'Apple', '2019-10-02 16:19:13', '2019-10-02 16:19:13');
INSERT INTO `attribute_options` VALUES (243, 33, '1 GB', '2019-10-12 15:30:39', '2019-10-12 15:30:39');
INSERT INTO `attribute_options` VALUES (244, 33, '2 GB', '2019-10-12 15:30:39', '2019-10-12 15:30:39');
INSERT INTO `attribute_options` VALUES (245, 33, '3 GB', '2019-10-12 15:30:39', '2019-10-12 15:30:39');

-- ----------------------------
-- Table structure for attributes
-- ----------------------------
DROP TABLE IF EXISTS `attributes`;
CREATE TABLE `attributes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attributable_id` int(11) NULL DEFAULT NULL,
  `attributable_type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `input_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `price_status` int(3) NOT NULL DEFAULT 1 COMMENT '0 - hide, 1- show	',
  `details_status` int(3) NOT NULL DEFAULT 1 COMMENT '0 - hide, 1- show	',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of attributes
-- ----------------------------
INSERT INTO `attributes` VALUES (14, 5, 'App\\Models\\Category', 'Warranty Type', 'warranty_type', 1, 1, '2019-09-23 14:56:07', '2019-09-23 14:56:07');
INSERT INTO `attributes` VALUES (20, 4, 'App\\Models\\Category', 'Warranty Type', 'warranty_type', 1, 1, '2019-09-23 16:41:46', '2019-10-02 16:18:54');
INSERT INTO `attributes` VALUES (21, 4, 'App\\Models\\Category', 'Brand', 'brand', 1, 1, '2019-09-23 16:44:13', '2019-10-02 16:19:13');
INSERT INTO `attributes` VALUES (22, 2, 'App\\Models\\Subcategory', 'Color Family', 'color_family', 1, 1, '2019-09-23 16:45:45', '2019-09-23 16:45:45');
INSERT INTO `attributes` VALUES (24, 1, 'App\\Models\\Childcategory', 'Display Size', 'display_size', 1, 1, '2019-09-23 16:54:17', '2019-09-23 16:54:17');
INSERT INTO `attributes` VALUES (30, 3, 'App\\Models\\Subcategory', 'Interior Color', 'interior_color', 1, 1, '2019-09-23 20:31:44', '2019-09-23 20:31:44');
INSERT INTO `attributes` VALUES (31, 8, 'App\\Models\\Childcategory', 'Temperature', 'temperature', 1, 1, '2019-09-23 20:34:35', '2019-09-23 20:34:35');
INSERT INTO `attributes` VALUES (33, 4, 'App\\Models\\Category', 'RAM', 'ram', 1, 1, '2019-10-11 19:22:03', '2019-10-12 15:30:39');

-- ----------------------------
-- Table structure for banners
-- ----------------------------
DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` enum('Large','TopSmall','BottomSmall') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of banners
-- ----------------------------
INSERT INTO `banners` VALUES (1, '1568889151top2.jpg', 'https://www.google.com/', 'TopSmall');
INSERT INTO `banners` VALUES (2, '1568889146top1.jpg', NULL, 'TopSmall');
INSERT INTO `banners` VALUES (3, '1568889164bottom1.jpg', 'https://www.google.com/', 'Large');
INSERT INTO `banners` VALUES (4, '1564398600side-triple3.jpg', 'https://www.google.com/', 'BottomSmall');
INSERT INTO `banners` VALUES (5, '1564398579side-triple2.jpg', 'https://www.google.com/', 'BottomSmall');
INSERT INTO `banners` VALUES (6, '1564398571side-triple1.jpg', 'https://www.google.com/', 'BottomSmall');

-- ----------------------------
-- Table structure for blog_categories
-- ----------------------------
DROP TABLE IF EXISTS `blog_categories`;
CREATE TABLE `blog_categories`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_categories
-- ----------------------------
INSERT INTO `blog_categories` VALUES (2, 'Oil & gas', 'oil-and-gas');
INSERT INTO `blog_categories` VALUES (3, 'Manufacturing', 'manufacturing');
INSERT INTO `blog_categories` VALUES (4, 'Chemical Research', 'chemical_research');
INSERT INTO `blog_categories` VALUES (5, 'Agriculture', 'agriculture');
INSERT INTO `blog_categories` VALUES (6, 'Mechanical', 'mechanical');
INSERT INTO `blog_categories` VALUES (7, 'Entrepreneurs', 'entrepreneurs');
INSERT INTO `blog_categories` VALUES (8, 'Technology', 'technology');

-- ----------------------------
-- Table structure for blogs
-- ----------------------------
DROP TABLE IF EXISTS `blogs`;
CREATE TABLE `blogs`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int(191) NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `source` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blogs
-- ----------------------------
INSERT INTO `blogs` VALUES (9, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700986-min.jpg', 'www.geniusocean.com', 36, 1, 'b1,b2,b3', 'Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level.', 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-02-06 01:53:41');
INSERT INTO `blogs` VALUES (10, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700902-min.jpg', 'www.geniusocean.com', 14, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-03-06 01:54:21');
INSERT INTO `blogs` VALUES (12, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700821-min.jpg', 'www.geniusocean.com', 19, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-04-06 14:04:20');
INSERT INTO `blogs` VALUES (13, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700676-min.jpg', 'www.geniusocean.com', 57, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-05-06 14:04:36');
INSERT INTO `blogs` VALUES (14, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700595-min.jpg', 'www.geniusocean.com', 3, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-06-02 22:02:30');
INSERT INTO `blogs` VALUES (15, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700464-min.jpg', 'www.geniusocean.com', 6, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-07-02 22:02:53');
INSERT INTO `blogs` VALUES (16, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700383-min.jpg', 'www.geniusocean.com', 5, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-02 22:03:14');
INSERT INTO `blogs` VALUES (17, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700322-min.jpg', 'www.geniusocean.com', 50, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-02 22:03:37');
INSERT INTO `blogs` VALUES (18, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700251-min.jpg', 'www.geniusocean.com', 152, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-02 22:03:59');
INSERT INTO `blogs` VALUES (20, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542699136-min.jpg', 'www.geniusocean.com', 10, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-02 22:03:14');
INSERT INTO `blogs` VALUES (21, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542699045-min.jpg', 'www.geniusocean.com', 36, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-02 22:03:37');
INSERT INTO `blogs` VALUES (22, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698954-min.jpg', 'www.geniusocean.com', 69, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-02 22:03:59');
INSERT INTO `blogs` VALUES (23, 7, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698893-min.jpg', 'www.geniusocean.com', 5, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-02 22:03:14');
INSERT INTO `blogs` VALUES (24, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698832-min.jpg', 'www.geniusocean.com', 34, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-02 22:03:37');
INSERT INTO `blogs` VALUES (25, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15557542831-min.jpg', 'www.geniusocean.com', 40, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-02 22:03:59');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (4, 'Electronic', 'electric', 0, '1557807287light.png', 1, '1568709131f6.jpg');
INSERT INTO `categories` VALUES (5, 'Fashion & Beauty', 'fashion-and-Beauty', 0, '1557807279fashion.png', 1, '1568709123f1.jpg');
INSERT INTO `categories` VALUES (6, 'Camera & Photo', 'camera-and-photo', 0, '1557807264camera.png', 1, '1568709110f2.jpg');
INSERT INTO `categories` VALUES (7, 'Smart Phone & Table', 'smart-phone-and-table', 0, '1557377810mobile.png', 1, '1568709597f4.jpg');
INSERT INTO `categories` VALUES (8, 'Sport & Outdoor', 'sport-and-Outdoor', 0, '1557807258sports.png', 1, '1568709577f8.jpg');
INSERT INTO `categories` VALUES (10, 'Health & Beauty', 'health-and-beauty', 0, '1557807228trends.png', 1, '1568709067f3.jpg');
INSERT INTO `categories` VALUES (11, 'Books & Office', 'books-and-office', 0, '1557377917bags.png', 1, '1568709050f8.jpg');
INSERT INTO `categories` VALUES (16, 'Furnitures', 'furnitures', 1, '1568708757home.png', 1, '1568709027f12.jpg');
INSERT INTO `categories` VALUES (17, 'Floor Materials', 'floor-materials', 1, '1568878538electronic.jpg', 1, '15961647651568709037f10.jpg');
INSERT INTO `categories` VALUES (18, 'Wall Materials', 'wall-materials', 1, '15961646101568709131f6.jpg', 1, '15961647391568709004f8.jpg');

-- ----------------------------
-- Table structure for childcategories
-- ----------------------------
DROP TABLE IF EXISTS `childcategories`;
CREATE TABLE `childcategories`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `subcategory_id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of childcategories
-- ----------------------------
INSERT INTO `childcategories` VALUES (1, 2, 'LCD TV', 'lcd-tv', 1);
INSERT INTO `childcategories` VALUES (7, 3, 'Counter-Depth', 'counter-depth', 1);
INSERT INTO `childcategories` VALUES (8, 3, 'Mini Fridge', 'mini-fridge', 1);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) UNSIGNED NOT NULL,
  `product_id` int(191) UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for conversations
-- ----------------------------
DROP TABLE IF EXISTS `conversations`;
CREATE TABLE `conversations`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_user` int(191) NOT NULL,
  `recieved_user` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for counters
-- ----------------------------
DROP TABLE IF EXISTS `counters`;
CREATE TABLE `counters`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('referral','browser') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'referral',
  `referral` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `total_count` int(11) NOT NULL DEFAULT 0,
  `todays_count` int(11) NOT NULL DEFAULT 0,
  `today` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of counters
-- ----------------------------
INSERT INTO `counters` VALUES (1, 'referral', 'www.facebook.com', 5, 0, NULL);
INSERT INTO `counters` VALUES (2, 'referral', 'geniusocean.com', 2, 0, NULL);
INSERT INTO `counters` VALUES (3, 'browser', 'Windows 10', 874, 0, NULL);
INSERT INTO `counters` VALUES (4, 'browser', 'Linux', 221, 0, NULL);
INSERT INTO `counters` VALUES (5, 'browser', 'Unknown OS Platform', 384, 0, NULL);
INSERT INTO `counters` VALUES (6, 'browser', 'Windows 7', 415, 0, NULL);
INSERT INTO `counters` VALUES (7, 'referral', 'yandex.ru', 15, 0, NULL);
INSERT INTO `counters` VALUES (8, 'browser', 'Windows 8.1', 577, 0, NULL);
INSERT INTO `counters` VALUES (9, 'referral', 'www.google.com', 6, 0, NULL);
INSERT INTO `counters` VALUES (10, 'browser', 'Android', 355, 0, NULL);
INSERT INTO `counters` VALUES (11, 'browser', 'Mac OS X', 502, 0, NULL);
INSERT INTO `counters` VALUES (12, 'referral', 'l.facebook.com', 1, 0, NULL);
INSERT INTO `counters` VALUES (13, 'referral', 'codecanyon.net', 6, 0, NULL);
INSERT INTO `counters` VALUES (14, 'browser', 'Windows XP', 2, 0, NULL);
INSERT INTO `counters` VALUES (15, 'browser', 'Windows 8', 1, 0, NULL);
INSERT INTO `counters` VALUES (16, 'browser', 'iPad', 4, 0, NULL);
INSERT INTO `counters` VALUES (17, 'browser', 'Ubuntu', 1, 0, NULL);
INSERT INTO `counters` VALUES (18, 'browser', 'iPhone', 4, 0, NULL);

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `country_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 247 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of countries
-- ----------------------------
INSERT INTO `countries` VALUES (1, 'AF', 'Afghanistan');
INSERT INTO `countries` VALUES (2, 'AL', 'Albania');
INSERT INTO `countries` VALUES (3, 'DZ', 'Algeria');
INSERT INTO `countries` VALUES (4, 'DS', 'American Samoa');
INSERT INTO `countries` VALUES (5, 'AD', 'Andorra');
INSERT INTO `countries` VALUES (6, 'AO', 'Angola');
INSERT INTO `countries` VALUES (7, 'AI', 'Anguilla');
INSERT INTO `countries` VALUES (8, 'AQ', 'Antarctica');
INSERT INTO `countries` VALUES (9, 'AG', 'Antigua and Barbuda');
INSERT INTO `countries` VALUES (10, 'AR', 'Argentina');
INSERT INTO `countries` VALUES (11, 'AM', 'Armenia');
INSERT INTO `countries` VALUES (12, 'AW', 'Aruba');
INSERT INTO `countries` VALUES (13, 'AU', 'Australia');
INSERT INTO `countries` VALUES (14, 'AT', 'Austria');
INSERT INTO `countries` VALUES (15, 'AZ', 'Azerbaijan');
INSERT INTO `countries` VALUES (16, 'BS', 'Bahamas');
INSERT INTO `countries` VALUES (17, 'BH', 'Bahrain');
INSERT INTO `countries` VALUES (18, 'BD', 'Bangladesh');
INSERT INTO `countries` VALUES (19, 'BB', 'Barbados');
INSERT INTO `countries` VALUES (20, 'BY', 'Belarus');
INSERT INTO `countries` VALUES (21, 'BE', 'Belgium');
INSERT INTO `countries` VALUES (22, 'BZ', 'Belize');
INSERT INTO `countries` VALUES (23, 'BJ', 'Benin');
INSERT INTO `countries` VALUES (24, 'BM', 'Bermuda');
INSERT INTO `countries` VALUES (25, 'BT', 'Bhutan');
INSERT INTO `countries` VALUES (26, 'BO', 'Bolivia');
INSERT INTO `countries` VALUES (27, 'BA', 'Bosnia and Herzegovina');
INSERT INTO `countries` VALUES (28, 'BW', 'Botswana');
INSERT INTO `countries` VALUES (29, 'BV', 'Bouvet Island');
INSERT INTO `countries` VALUES (30, 'BR', 'Brazil');
INSERT INTO `countries` VALUES (31, 'IO', 'British Indian Ocean Territory');
INSERT INTO `countries` VALUES (32, 'BN', 'Brunei Darussalam');
INSERT INTO `countries` VALUES (33, 'BG', 'Bulgaria');
INSERT INTO `countries` VALUES (34, 'BF', 'Burkina Faso');
INSERT INTO `countries` VALUES (35, 'BI', 'Burundi');
INSERT INTO `countries` VALUES (36, 'KH', 'Cambodia');
INSERT INTO `countries` VALUES (37, 'CM', 'Cameroon');
INSERT INTO `countries` VALUES (38, 'CA', 'Canada');
INSERT INTO `countries` VALUES (39, 'CV', 'Cape Verde');
INSERT INTO `countries` VALUES (40, 'KY', 'Cayman Islands');
INSERT INTO `countries` VALUES (41, 'CF', 'Central African Republic');
INSERT INTO `countries` VALUES (42, 'TD', 'Chad');
INSERT INTO `countries` VALUES (43, 'CL', 'Chile');
INSERT INTO `countries` VALUES (44, 'CN', 'China');
INSERT INTO `countries` VALUES (45, 'CX', 'Christmas Island');
INSERT INTO `countries` VALUES (46, 'CC', 'Cocos (Keeling) Islands');
INSERT INTO `countries` VALUES (47, 'CO', 'Colombia');
INSERT INTO `countries` VALUES (48, 'KM', 'Comoros');
INSERT INTO `countries` VALUES (49, 'CD', 'Democratic Republic of the Congo');
INSERT INTO `countries` VALUES (50, 'CG', 'Republic of Congo');
INSERT INTO `countries` VALUES (51, 'CK', 'Cook Islands');
INSERT INTO `countries` VALUES (52, 'CR', 'Costa Rica');
INSERT INTO `countries` VALUES (53, 'HR', 'Croatia (Hrvatska)');
INSERT INTO `countries` VALUES (54, 'CU', 'Cuba');
INSERT INTO `countries` VALUES (55, 'CY', 'Cyprus');
INSERT INTO `countries` VALUES (56, 'CZ', 'Czech Republic');
INSERT INTO `countries` VALUES (57, 'DK', 'Denmark');
INSERT INTO `countries` VALUES (58, 'DJ', 'Djibouti');
INSERT INTO `countries` VALUES (59, 'DM', 'Dominica');
INSERT INTO `countries` VALUES (60, 'DO', 'Dominican Republic');
INSERT INTO `countries` VALUES (61, 'TP', 'East Timor');
INSERT INTO `countries` VALUES (62, 'EC', 'Ecuador');
INSERT INTO `countries` VALUES (63, 'EG', 'Egypt');
INSERT INTO `countries` VALUES (64, 'SV', 'El Salvador');
INSERT INTO `countries` VALUES (65, 'GQ', 'Equatorial Guinea');
INSERT INTO `countries` VALUES (66, 'ER', 'Eritrea');
INSERT INTO `countries` VALUES (67, 'EE', 'Estonia');
INSERT INTO `countries` VALUES (68, 'ET', 'Ethiopia');
INSERT INTO `countries` VALUES (69, 'FK', 'Falkland Islands (Malvinas)');
INSERT INTO `countries` VALUES (70, 'FO', 'Faroe Islands');
INSERT INTO `countries` VALUES (71, 'FJ', 'Fiji');
INSERT INTO `countries` VALUES (72, 'FI', 'Finland');
INSERT INTO `countries` VALUES (73, 'FR', 'France');
INSERT INTO `countries` VALUES (74, 'FX', 'France, Metropolitan');
INSERT INTO `countries` VALUES (75, 'GF', 'French Guiana');
INSERT INTO `countries` VALUES (76, 'PF', 'French Polynesia');
INSERT INTO `countries` VALUES (77, 'TF', 'French Southern Territories');
INSERT INTO `countries` VALUES (78, 'GA', 'Gabon');
INSERT INTO `countries` VALUES (79, 'GM', 'Gambia');
INSERT INTO `countries` VALUES (80, 'GE', 'Georgia');
INSERT INTO `countries` VALUES (81, 'DE', 'Germany');
INSERT INTO `countries` VALUES (82, 'GH', 'Ghana');
INSERT INTO `countries` VALUES (83, 'GI', 'Gibraltar');
INSERT INTO `countries` VALUES (84, 'GK', 'Guernsey');
INSERT INTO `countries` VALUES (85, 'GR', 'Greece');
INSERT INTO `countries` VALUES (86, 'GL', 'Greenland');
INSERT INTO `countries` VALUES (87, 'GD', 'Grenada');
INSERT INTO `countries` VALUES (88, 'GP', 'Guadeloupe');
INSERT INTO `countries` VALUES (89, 'GU', 'Guam');
INSERT INTO `countries` VALUES (90, 'GT', 'Guatemala');
INSERT INTO `countries` VALUES (91, 'GN', 'Guinea');
INSERT INTO `countries` VALUES (92, 'GW', 'Guinea-Bissau');
INSERT INTO `countries` VALUES (93, 'GY', 'Guyana');
INSERT INTO `countries` VALUES (94, 'HT', 'Haiti');
INSERT INTO `countries` VALUES (95, 'HM', 'Heard and Mc Donald Islands');
INSERT INTO `countries` VALUES (96, 'HN', 'Honduras');
INSERT INTO `countries` VALUES (97, 'HK', 'Hong Kong');
INSERT INTO `countries` VALUES (98, 'HU', 'Hungary');
INSERT INTO `countries` VALUES (99, 'IS', 'Iceland');
INSERT INTO `countries` VALUES (100, 'IN', 'India');
INSERT INTO `countries` VALUES (101, 'IM', 'Isle of Man');
INSERT INTO `countries` VALUES (102, 'ID', 'Indonesia');
INSERT INTO `countries` VALUES (103, 'IR', 'Iran (Islamic Republic of)');
INSERT INTO `countries` VALUES (104, 'IQ', 'Iraq');
INSERT INTO `countries` VALUES (105, 'IE', 'Ireland');
INSERT INTO `countries` VALUES (106, 'IL', 'Israel');
INSERT INTO `countries` VALUES (107, 'IT', 'Italy');
INSERT INTO `countries` VALUES (108, 'CI', 'Ivory Coast');
INSERT INTO `countries` VALUES (109, 'JE', 'Jersey');
INSERT INTO `countries` VALUES (110, 'JM', 'Jamaica');
INSERT INTO `countries` VALUES (111, 'JP', 'Japan');
INSERT INTO `countries` VALUES (112, 'JO', 'Jordan');
INSERT INTO `countries` VALUES (113, 'KZ', 'Kazakhstan');
INSERT INTO `countries` VALUES (114, 'KE', 'Kenya');
INSERT INTO `countries` VALUES (115, 'KI', 'Kiribati');
INSERT INTO `countries` VALUES (116, 'KP', 'Korea, Democratic People\'s Republic of');
INSERT INTO `countries` VALUES (117, 'KR', 'Korea, Republic of');
INSERT INTO `countries` VALUES (118, 'XK', 'Kosovo');
INSERT INTO `countries` VALUES (119, 'KW', 'Kuwait');
INSERT INTO `countries` VALUES (120, 'KG', 'Kyrgyzstan');
INSERT INTO `countries` VALUES (121, 'LA', 'Lao People\'s Democratic Republic');
INSERT INTO `countries` VALUES (122, 'LV', 'Latvia');
INSERT INTO `countries` VALUES (123, 'LB', 'Lebanon');
INSERT INTO `countries` VALUES (124, 'LS', 'Lesotho');
INSERT INTO `countries` VALUES (125, 'LR', 'Liberia');
INSERT INTO `countries` VALUES (126, 'LY', 'Libyan Arab Jamahiriya');
INSERT INTO `countries` VALUES (127, 'LI', 'Liechtenstein');
INSERT INTO `countries` VALUES (128, 'LT', 'Lithuania');
INSERT INTO `countries` VALUES (129, 'LU', 'Luxembourg');
INSERT INTO `countries` VALUES (130, 'MO', 'Macau');
INSERT INTO `countries` VALUES (131, 'MK', 'North Macedonia');
INSERT INTO `countries` VALUES (132, 'MG', 'Madagascar');
INSERT INTO `countries` VALUES (133, 'MW', 'Malawi');
INSERT INTO `countries` VALUES (134, 'MY', 'Malaysia');
INSERT INTO `countries` VALUES (135, 'MV', 'Maldives');
INSERT INTO `countries` VALUES (136, 'ML', 'Mali');
INSERT INTO `countries` VALUES (137, 'MT', 'Malta');
INSERT INTO `countries` VALUES (138, 'MH', 'Marshall Islands');
INSERT INTO `countries` VALUES (139, 'MQ', 'Martinique');
INSERT INTO `countries` VALUES (140, 'MR', 'Mauritania');
INSERT INTO `countries` VALUES (141, 'MU', 'Mauritius');
INSERT INTO `countries` VALUES (142, 'TY', 'Mayotte');
INSERT INTO `countries` VALUES (143, 'MX', 'Mexico');
INSERT INTO `countries` VALUES (144, 'FM', 'Micronesia, Federated States of');
INSERT INTO `countries` VALUES (145, 'MD', 'Moldova, Republic of');
INSERT INTO `countries` VALUES (146, 'MC', 'Monaco');
INSERT INTO `countries` VALUES (147, 'MN', 'Mongolia');
INSERT INTO `countries` VALUES (148, 'ME', 'Montenegro');
INSERT INTO `countries` VALUES (149, 'MS', 'Montserrat');
INSERT INTO `countries` VALUES (150, 'MA', 'Morocco');
INSERT INTO `countries` VALUES (151, 'MZ', 'Mozambique');
INSERT INTO `countries` VALUES (152, 'MM', 'Myanmar');
INSERT INTO `countries` VALUES (153, 'NA', 'Namibia');
INSERT INTO `countries` VALUES (154, 'NR', 'Nauru');
INSERT INTO `countries` VALUES (155, 'NP', 'Nepal');
INSERT INTO `countries` VALUES (156, 'NL', 'Netherlands');
INSERT INTO `countries` VALUES (157, 'AN', 'Netherlands Antilles');
INSERT INTO `countries` VALUES (158, 'NC', 'New Caledonia');
INSERT INTO `countries` VALUES (159, 'NZ', 'New Zealand');
INSERT INTO `countries` VALUES (160, 'NI', 'Nicaragua');
INSERT INTO `countries` VALUES (161, 'NE', 'Niger');
INSERT INTO `countries` VALUES (162, 'NG', 'Nigeria');
INSERT INTO `countries` VALUES (163, 'NU', 'Niue');
INSERT INTO `countries` VALUES (164, 'NF', 'Norfolk Island');
INSERT INTO `countries` VALUES (165, 'MP', 'Northern Mariana Islands');
INSERT INTO `countries` VALUES (166, 'NO', 'Norway');
INSERT INTO `countries` VALUES (167, 'OM', 'Oman');
INSERT INTO `countries` VALUES (168, 'PK', 'Pakistan');
INSERT INTO `countries` VALUES (169, 'PW', 'Palau');
INSERT INTO `countries` VALUES (170, 'PS', 'Palestine');
INSERT INTO `countries` VALUES (171, 'PA', 'Panama');
INSERT INTO `countries` VALUES (172, 'PG', 'Papua New Guinea');
INSERT INTO `countries` VALUES (173, 'PY', 'Paraguay');
INSERT INTO `countries` VALUES (174, 'PE', 'Peru');
INSERT INTO `countries` VALUES (175, 'PH', 'Philippines');
INSERT INTO `countries` VALUES (176, 'PN', 'Pitcairn');
INSERT INTO `countries` VALUES (177, 'PL', 'Poland');
INSERT INTO `countries` VALUES (178, 'PT', 'Portugal');
INSERT INTO `countries` VALUES (179, 'PR', 'Puerto Rico');
INSERT INTO `countries` VALUES (180, 'QA', 'Qatar');
INSERT INTO `countries` VALUES (181, 'RE', 'Reunion');
INSERT INTO `countries` VALUES (182, 'RO', 'Romania');
INSERT INTO `countries` VALUES (183, 'RU', 'Russian Federation');
INSERT INTO `countries` VALUES (184, 'RW', 'Rwanda');
INSERT INTO `countries` VALUES (185, 'KN', 'Saint Kitts and Nevis');
INSERT INTO `countries` VALUES (186, 'LC', 'Saint Lucia');
INSERT INTO `countries` VALUES (187, 'VC', 'Saint Vincent and the Grenadines');
INSERT INTO `countries` VALUES (188, 'WS', 'Samoa');
INSERT INTO `countries` VALUES (189, 'SM', 'San Marino');
INSERT INTO `countries` VALUES (190, 'ST', 'Sao Tome and Principe');
INSERT INTO `countries` VALUES (191, 'SA', 'Saudi Arabia');
INSERT INTO `countries` VALUES (192, 'SN', 'Senegal');
INSERT INTO `countries` VALUES (193, 'RS', 'Serbia');
INSERT INTO `countries` VALUES (194, 'SC', 'Seychelles');
INSERT INTO `countries` VALUES (195, 'SL', 'Sierra Leone');
INSERT INTO `countries` VALUES (196, 'SG', 'Singapore');
INSERT INTO `countries` VALUES (197, 'SK', 'Slovakia');
INSERT INTO `countries` VALUES (198, 'SI', 'Slovenia');
INSERT INTO `countries` VALUES (199, 'SB', 'Solomon Islands');
INSERT INTO `countries` VALUES (200, 'SO', 'Somalia');
INSERT INTO `countries` VALUES (201, 'ZA', 'South Africa');
INSERT INTO `countries` VALUES (202, 'GS', 'South Georgia South Sandwich Islands');
INSERT INTO `countries` VALUES (203, 'SS', 'South Sudan');
INSERT INTO `countries` VALUES (204, 'ES', 'Spain');
INSERT INTO `countries` VALUES (205, 'LK', 'Sri Lanka');
INSERT INTO `countries` VALUES (206, 'SH', 'St. Helena');
INSERT INTO `countries` VALUES (207, 'PM', 'St. Pierre and Miquelon');
INSERT INTO `countries` VALUES (208, 'SD', 'Sudan');
INSERT INTO `countries` VALUES (209, 'SR', 'Suriname');
INSERT INTO `countries` VALUES (210, 'SJ', 'Svalbard and Jan Mayen Islands');
INSERT INTO `countries` VALUES (211, 'SZ', 'Swaziland');
INSERT INTO `countries` VALUES (212, 'SE', 'Sweden');
INSERT INTO `countries` VALUES (213, 'CH', 'Switzerland');
INSERT INTO `countries` VALUES (214, 'SY', 'Syrian Arab Republic');
INSERT INTO `countries` VALUES (215, 'TW', 'Taiwan');
INSERT INTO `countries` VALUES (216, 'TJ', 'Tajikistan');
INSERT INTO `countries` VALUES (217, 'TZ', 'Tanzania, United Republic of');
INSERT INTO `countries` VALUES (218, 'TH', 'Thailand');
INSERT INTO `countries` VALUES (219, 'TG', 'Togo');
INSERT INTO `countries` VALUES (220, 'TK', 'Tokelau');
INSERT INTO `countries` VALUES (221, 'TO', 'Tonga');
INSERT INTO `countries` VALUES (222, 'TT', 'Trinidad and Tobago');
INSERT INTO `countries` VALUES (223, 'TN', 'Tunisia');
INSERT INTO `countries` VALUES (224, 'TR', 'Turkey');
INSERT INTO `countries` VALUES (225, 'TM', 'Turkmenistan');
INSERT INTO `countries` VALUES (226, 'TC', 'Turks and Caicos Islands');
INSERT INTO `countries` VALUES (227, 'TV', 'Tuvalu');
INSERT INTO `countries` VALUES (228, 'UG', 'Uganda');
INSERT INTO `countries` VALUES (229, 'UA', 'Ukraine');
INSERT INTO `countries` VALUES (230, 'AE', 'United Arab Emirates');
INSERT INTO `countries` VALUES (231, 'GB', 'United Kingdom');
INSERT INTO `countries` VALUES (232, 'US', 'United States');
INSERT INTO `countries` VALUES (233, 'UM', 'United States minor outlying islands');
INSERT INTO `countries` VALUES (234, 'UY', 'Uruguay');
INSERT INTO `countries` VALUES (235, 'UZ', 'Uzbekistan');
INSERT INTO `countries` VALUES (236, 'VU', 'Vanuatu');
INSERT INTO `countries` VALUES (237, 'VA', 'Vatican City State');
INSERT INTO `countries` VALUES (238, 'VE', 'Venezuela');
INSERT INTO `countries` VALUES (239, 'VN', 'Vietnam');
INSERT INTO `countries` VALUES (240, 'VG', 'Virgin Islands (British)');
INSERT INTO `countries` VALUES (241, 'VI', 'Virgin Islands (U.S.)');
INSERT INTO `countries` VALUES (242, 'WF', 'Wallis and Futuna Islands');
INSERT INTO `countries` VALUES (243, 'EH', 'Western Sahara');
INSERT INTO `countries` VALUES (244, 'YE', 'Yemen');
INSERT INTO `countries` VALUES (245, 'ZM', 'Zambia');
INSERT INTO `countries` VALUES (246, 'ZW', 'Zimbabwe');

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `price` double NOT NULL,
  `times` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `used` int(191) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coupons
-- ----------------------------
INSERT INTO `coupons` VALUES (1, 'eqwe', 1, 12.22, '990', 18, 1, '2019-01-15', '2026-08-20');
INSERT INTO `coupons` VALUES (2, 'sdsdsasd', 0, 11, NULL, 2, 1, '2019-05-23', '2022-05-26');
INSERT INTO `coupons` VALUES (3, 'werwd', 0, 22, NULL, 3, 1, '2019-05-23', '2023-06-08');
INSERT INTO `coupons` VALUES (4, 'asdasd', 1, 23.5, NULL, 1, 1, '2019-05-23', '2020-05-28');
INSERT INTO `coupons` VALUES (5, 'kopakopakopa', 0, 40, NULL, 3, 1, '2019-05-23', '2032-05-20');
INSERT INTO `coupons` VALUES (6, 'rererere', 1, 9, '665', 1, 1, '2019-05-23', '2022-05-26');

-- ----------------------------
-- Table structure for currencies
-- ----------------------------
DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of currencies
-- ----------------------------
INSERT INTO `currencies` VALUES (1, 'USD', '$', 1, 1);
INSERT INTO `currencies` VALUES (4, 'BDT', '৳', 84.63, 0);
INSERT INTO `currencies` VALUES (6, 'EUR', '€', 0.89, 0);
INSERT INTO `currencies` VALUES (8, 'INR', '₹', 68.95, 0);
INSERT INTO `currencies` VALUES (9, 'NGN', '₦', 363.919, 0);

-- ----------------------------
-- Table structure for email_templates
-- ----------------------------
DROP TABLE IF EXISTS `email_templates`;
CREATE TABLE `email_templates`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email_subject` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `email_body` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of email_templates
-- ----------------------------
INSERT INTO `email_templates` VALUES (1, 'new_order', 'Your Order Placed Successfully', '<p>Hello {customer_name},<br>Your Order Number is {order_number}<br>Your order has been placed successfully</p>', 1);
INSERT INTO `email_templates` VALUES (2, 'new_registration', 'Welcome To Royal Commerce', '<p>Hello {customer_name},<br>You have successfully registered to {website_title}, We wish you will have a wonderful experience using our service.</p><p>Thank You<br></p>', 1);
INSERT INTO `email_templates` VALUES (3, 'vendor_accept', 'Your Vendor Account Activated', '<p>Hello {customer_name},<br>Your Vendor Account Activated Successfully. Please Login to your account and build your own shop.</p><p>Thank You<br></p>', 1);
INSERT INTO `email_templates` VALUES (4, 'subscription_warning', 'Your subscrption plan will end after five days', '<p>Hello {customer_name},<br>Your subscription plan duration will end after five days. Please renew your plan otherwise all of your products will be deactivated.</p><p>Thank You<br></p>', 1);
INSERT INTO `email_templates` VALUES (5, 'vendor_verification', 'Request for verification.', '<p>Hello {customer_name},<br>You are requested verify your account. Please send us photo of your passport.</p><p>Thank You<br></p>', 1);

-- ----------------------------
-- Table structure for faqs
-- ----------------------------
DROP TABLE IF EXISTS `faqs`;
CREATE TABLE `faqs`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of faqs
-- ----------------------------
INSERT INTO `faqs` VALUES (1, 'Right my front it wound cause fully', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 1);
INSERT INTO `faqs` VALUES (3, 'Man particular insensible celebrated', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 1);
INSERT INTO `faqs` VALUES (4, 'Civilly why how end viewing related', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 0);
INSERT INTO `faqs` VALUES (5, 'Six started far placing saw respect', '<span style=\"color: rgb(70, 85, 65); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 0);
INSERT INTO `faqs` VALUES (6, 'She jointure goodness interest debat', '<div style=\"text-align: center;\"><div style=\"text-align: center;\"><br></div></div><div style=\"text-align: center;\"><span style=\"color: rgb(70, 85, 65); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.<br></span></div>', 0);

-- ----------------------------
-- Table structure for favorite_sellers
-- ----------------------------
DROP TABLE IF EXISTS `favorite_sellers`;
CREATE TABLE `favorite_sellers`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NOT NULL,
  `vendor_id` int(191) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of favorite_sellers
-- ----------------------------
INSERT INTO `favorite_sellers` VALUES (1, 22, 13);

-- ----------------------------
-- Table structure for galleries
-- ----------------------------
DROP TABLE IF EXISTS `galleries`;
CREATE TABLE `galleries`  (
  `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(191) UNSIGNED NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 232 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of galleries
-- ----------------------------
INSERT INTO `galleries` VALUES (6, 93, '156801646314-min.jpg');
INSERT INTO `galleries` VALUES (7, 93, '156801646315-min.jpg');
INSERT INTO `galleries` VALUES (8, 93, '156801646316-min.jpg');
INSERT INTO `galleries` VALUES (22, 129, '15680254328Ei8T0MB.jpg');
INSERT INTO `galleries` VALUES (23, 129, '1568025432wRmpve8d.jpg');
INSERT INTO `galleries` VALUES (24, 129, '1568025432kkRYzLsF.jpg');
INSERT INTO `galleries` VALUES (25, 129, '1568025432zxQBe6Gk.jpg');
INSERT INTO `galleries` VALUES (26, 128, '1568025537sJbDPnFk.jpg');
INSERT INTO `galleries` VALUES (27, 128, '1568025537NBmHxJOz.jpg');
INSERT INTO `galleries` VALUES (28, 128, '1568025537hxqeFbS8.jpg');
INSERT INTO `galleries` VALUES (29, 128, '1568025538zK3tJpmL.jpg');
INSERT INTO `galleries` VALUES (34, 126, '1568025693kKLReNYO.jpg');
INSERT INTO `galleries` VALUES (35, 126, '1568025694Iv3pkz1q.jpg');
INSERT INTO `galleries` VALUES (36, 126, '1568025694T8HhdLVS.jpg');
INSERT INTO `galleries` VALUES (37, 126, '1568025695vTdg7ndt.jpg');
INSERT INTO `galleries` VALUES (38, 125, '15680257894Waz2tuN.jpg');
INSERT INTO `galleries` VALUES (39, 125, '1568025789vd0P4TBv.jpg');
INSERT INTO `galleries` VALUES (40, 125, '15680257899bih5sGh.jpg');
INSERT INTO `galleries` VALUES (41, 125, '156802578924sLIgzl.jpg');
INSERT INTO `galleries` VALUES (42, 124, '1568025825cC2Pmuit.jpg');
INSERT INTO `galleries` VALUES (43, 124, '1568025825EACzLFld.jpg');
INSERT INTO `galleries` VALUES (44, 124, '1568025825MfCyCqtD.jpg');
INSERT INTO `galleries` VALUES (45, 124, '15680258252yabMeAz.jpg');
INSERT INTO `galleries` VALUES (46, 123, '15680258512fKQla5g.jpg');
INSERT INTO `galleries` VALUES (47, 123, '1568025851pIjl0mWp.jpg');
INSERT INTO `galleries` VALUES (48, 123, '1568025851tQw7JXXG.jpg');
INSERT INTO `galleries` VALUES (49, 123, '1568025851ewjtSDkZ.jpg');
INSERT INTO `galleries` VALUES (50, 96, '1568025891wWAAbOjc.jpg');
INSERT INTO `galleries` VALUES (51, 96, '1568025891fyMNeXRy.jpg');
INSERT INTO `galleries` VALUES (52, 96, '1568025891OdV64Tw1.jpg');
INSERT INTO `galleries` VALUES (53, 96, '1568025891xQF7Zufe.jpg');
INSERT INTO `galleries` VALUES (62, 101, '1568026331Y6UMgMcI.jpg');
INSERT INTO `galleries` VALUES (63, 101, '1568026331xZbT4OWG.jpg');
INSERT INTO `galleries` VALUES (64, 101, '1568026331y7eIFJXZ.jpg');
INSERT INTO `galleries` VALUES (65, 101, '1568026331i2wH8RI0.jpg');
INSERT INTO `galleries` VALUES (66, 100, '1568026374xCTjQYZ8.jpg');
INSERT INTO `galleries` VALUES (67, 100, '1568026374DzmvqA9d.jpg');
INSERT INTO `galleries` VALUES (68, 100, '1568026374OEH73u5X.jpg');
INSERT INTO `galleries` VALUES (69, 100, '1568026374vZhqRv8c.jpg');
INSERT INTO `galleries` VALUES (70, 99, '15680264120LdBSU1v.jpg');
INSERT INTO `galleries` VALUES (71, 99, '1568026412eMjsI940.jpg');
INSERT INTO `galleries` VALUES (72, 99, '1568026412GFjvHiZv.jpg');
INSERT INTO `galleries` VALUES (73, 99, '15680264122fwGi20d.jpg');
INSERT INTO `galleries` VALUES (78, 97, '1568026469hSlmBpzE.jpg');
INSERT INTO `galleries` VALUES (79, 97, '15680264697AI8LicQ.jpg');
INSERT INTO `galleries` VALUES (80, 97, '15680264691xyFt5Y6.jpg');
INSERT INTO `galleries` VALUES (81, 97, '1568026469dC3hrMz0.jpg');
INSERT INTO `galleries` VALUES (86, 109, '1568026737EBGSE78G.jpg');
INSERT INTO `galleries` VALUES (87, 109, '1568026737B8hO1RRr.jpg');
INSERT INTO `galleries` VALUES (88, 109, '1568026737tf0rwVoz.jpg');
INSERT INTO `galleries` VALUES (89, 109, '1568026737GGIPSqYo.jpg');
INSERT INTO `galleries` VALUES (95, 107, '1568026797FFNrNPxK.jpg');
INSERT INTO `galleries` VALUES (96, 107, '1568026797UwY9ZLfQ.jpg');
INSERT INTO `galleries` VALUES (97, 107, '1568026797Kl6eZLx5.jpg');
INSERT INTO `galleries` VALUES (98, 107, '1568026797h3R48VaO.jpg');
INSERT INTO `galleries` VALUES (99, 107, '15680267989kXwH40I.jpg');
INSERT INTO `galleries` VALUES (100, 106, '1568026836ErM5FJxg.jpg');
INSERT INTO `galleries` VALUES (101, 106, '1568026836VLrxIk0u.jpg');
INSERT INTO `galleries` VALUES (102, 106, '1568026836lgLuMV6p.jpg');
INSERT INTO `galleries` VALUES (103, 106, '1568026836JBUTQX8v.jpg');
INSERT INTO `galleries` VALUES (104, 105, '1568026861YorsLvUa.jpg');
INSERT INTO `galleries` VALUES (105, 105, '1568026861PikoX1Qb.jpg');
INSERT INTO `galleries` VALUES (106, 105, '1568026861SBJqjw66.jpg');
INSERT INTO `galleries` VALUES (107, 105, '1568026861WYh54Arp.jpg');
INSERT INTO `galleries` VALUES (108, 104, '1568026885rmo0LDoo.jpg');
INSERT INTO `galleries` VALUES (109, 104, '15680268851m939o7O.jpg');
INSERT INTO `galleries` VALUES (110, 104, '1568026885fVXYCGKu.jpg');
INSERT INTO `galleries` VALUES (111, 104, '1568026885GDRL3thY.jpg');
INSERT INTO `galleries` VALUES (112, 103, '1568026903LbVQUxIr.jpg');
INSERT INTO `galleries` VALUES (113, 103, '1568026914IpRVYDV4.jpg');
INSERT INTO `galleries` VALUES (114, 103, '15680269141gKO8x5X.jpg');
INSERT INTO `galleries` VALUES (115, 103, '1568026914Q938xXM2.jpg');
INSERT INTO `galleries` VALUES (116, 93, '1568026950y7ihS4wE.jpg');
INSERT INTO `galleries` VALUES (125, 122, '1568027503rFK94cnU.jpg');
INSERT INTO `galleries` VALUES (126, 122, '1568027503i1X2FtIi.jpg');
INSERT INTO `galleries` VALUES (127, 122, '156802750316jxawoZ.jpg');
INSERT INTO `galleries` VALUES (128, 122, '1568027503QRBf290F.jpg');
INSERT INTO `galleries` VALUES (129, 121, '1568027539SQqUc8Bu.jpg');
INSERT INTO `galleries` VALUES (130, 121, '1568027539Zs5OTzjq.jpg');
INSERT INTO `galleries` VALUES (131, 121, '1568027539C45VRZq1.jpg');
INSERT INTO `galleries` VALUES (132, 121, '15680275398ovCzFnJ.jpg');
INSERT INTO `galleries` VALUES (133, 120, '1568027565bJgX744G.jpg');
INSERT INTO `galleries` VALUES (134, 120, '1568027565j0RPFUgX.jpg');
INSERT INTO `galleries` VALUES (135, 120, '1568027565QGi6Lhyo.jpg');
INSERT INTO `galleries` VALUES (136, 120, '15680275658MAY3VKp.jpg');
INSERT INTO `galleries` VALUES (137, 119, '1568027610p9R6ivC6.jpg');
INSERT INTO `galleries` VALUES (138, 119, '1568027610t2Aq7E5D.jpg');
INSERT INTO `galleries` VALUES (139, 119, '1568027611ikz4n0fx.jpg');
INSERT INTO `galleries` VALUES (140, 119, '15680276117BLgrCub.jpg');
INSERT INTO `galleries` VALUES (141, 118, '156802763634t0c8tG.jpg');
INSERT INTO `galleries` VALUES (142, 118, '1568027636fuJplSf3.jpg');
INSERT INTO `galleries` VALUES (143, 118, '1568027636MXcgCQHU.jpg');
INSERT INTO `galleries` VALUES (144, 118, '1568027636lfexGTpt.jpg');
INSERT INTO `galleries` VALUES (145, 117, '1568027665rFHWlsAJ.jpg');
INSERT INTO `galleries` VALUES (146, 117, '15680276655LPktA9k.jpg');
INSERT INTO `galleries` VALUES (147, 117, '1568027665vcNWWq3u.jpg');
INSERT INTO `galleries` VALUES (148, 117, '1568027665gQnqKhCw.jpg');
INSERT INTO `galleries` VALUES (149, 116, '1568027692FPQpwtWN.jpg');
INSERT INTO `galleries` VALUES (150, 116, '1568027692zBaGjOIC.jpg');
INSERT INTO `galleries` VALUES (151, 116, '1568027692UXpDx63F.jpg');
INSERT INTO `galleries` VALUES (152, 116, '1568027692KdIWbIGK.jpg');
INSERT INTO `galleries` VALUES (153, 95, '1568027743xS8gHocM.jpg');
INSERT INTO `galleries` VALUES (154, 95, '1568027743aVUOljdD.jpg');
INSERT INTO `galleries` VALUES (155, 95, '156802774327OOA1Zj.jpg');
INSERT INTO `galleries` VALUES (156, 95, '1568027743kGBx6mxa.jpg');
INSERT INTO `galleries` VALUES (172, 130, '1568029084hQT5ZO0j.jpg');
INSERT INTO `galleries` VALUES (173, 130, '1568029084ncGXxQzN.jpg');
INSERT INTO `galleries` VALUES (174, 130, '1568029084b0OonKFy.jpg');
INSERT INTO `galleries` VALUES (175, 130, '15680290857TD4iOWP.jpg');
INSERT INTO `galleries` VALUES (180, 114, '1568029158brS7xQCe.jpg');
INSERT INTO `galleries` VALUES (181, 114, '1568029158QlC0tg5a.jpg');
INSERT INTO `galleries` VALUES (182, 114, '1568029158RrN4AEtQ.jpg');
INSERT INTO `galleries` VALUES (187, 112, '1568029210JSAwjRPr.jpg');
INSERT INTO `galleries` VALUES (188, 112, '1568029210EiVUkcK6.jpg');
INSERT INTO `galleries` VALUES (189, 112, '1568029210fJSo5hya.jpg');
INSERT INTO `galleries` VALUES (190, 112, '15680292101vCcGfq8.jpg');
INSERT INTO `galleries` VALUES (191, 111, '1568029272lB0JETcn.jpg');
INSERT INTO `galleries` VALUES (192, 111, '1568029272wF3ldKgv.jpg');
INSERT INTO `galleries` VALUES (193, 111, '1568029272NI33ExCu.jpg');
INSERT INTO `galleries` VALUES (194, 111, '15680292724TXrpokz.jpg');
INSERT INTO `galleries` VALUES (197, 134, '15693932021.jpg');
INSERT INTO `galleries` VALUES (198, 134, '15693932022.jpg');
INSERT INTO `galleries` VALUES (199, 135, '15698200931.jpg');
INSERT INTO `galleries` VALUES (217, 159, '1570085246audi-automobile-car-909907.jpg');
INSERT INTO `galleries` VALUES (218, 159, '1570085246automobile-automotive-car-112460.jpg');
INSERT INTO `galleries` VALUES (219, 160, '1570085654asphalt-auto-automobile-575386.jpg');
INSERT INTO `galleries` VALUES (220, 160, '1570085654asphalt-auto-automobile-831475.jpg');
INSERT INTO `galleries` VALUES (221, 161, '1570086479audi-automobile-car-909907.jpg');
INSERT INTO `galleries` VALUES (224, 167, '1570874976asphalt-auto-automobile-831475.jpg');
INSERT INTO `galleries` VALUES (225, 167, '1570874976audi-automobile-car-909907.jpg');
INSERT INTO `galleries` VALUES (226, 167, '1570874976automobile-automotive-car-112460.jpg');
INSERT INTO `galleries` VALUES (227, 168, '1570875445automobile-automotive-car-112460.jpg');
INSERT INTO `galleries` VALUES (228, 168, '1570875445automobile-automotive-car-358070.jpg');
INSERT INTO `galleries` VALUES (231, 185, '1596178803thumbnail_Blu-Dot-Shale-Bedside-Table.jpg');

-- ----------------------------
-- Table structure for generalsettings
-- ----------------------------
DROP TABLE IF EXISTS `generalsettings`;
CREATE TABLE `generalsettings`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `favicon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `header_phone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `footer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `copyright` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `colors` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `loader` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_loader` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_talkto` tinyint(1) NOT NULL DEFAULT 1,
  `talkto` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `is_language` tinyint(1) NOT NULL DEFAULT 1,
  `is_loader` tinyint(1) NOT NULL DEFAULT 1,
  `map_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `is_disqus` tinyint(1) NOT NULL DEFAULT 0,
  `disqus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `is_contact` tinyint(1) NOT NULL DEFAULT 0,
  `is_faq` tinyint(1) NOT NULL DEFAULT 0,
  `guest_checkout` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_check` tinyint(1) NOT NULL DEFAULT 0,
  `cod_check` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `stripe_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `currency_format` tinyint(1) NOT NULL DEFAULT 0,
  `withdraw_fee` double NOT NULL DEFAULT 0,
  `withdraw_charge` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `shipping_cost` double NOT NULL DEFAULT 0,
  `smtp_host` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `smtp_port` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `smtp_user` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `smtp_pass` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `from_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `from_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_smtp` tinyint(1) NOT NULL DEFAULT 0,
  `is_comment` tinyint(1) NOT NULL DEFAULT 1,
  `is_currency` tinyint(1) NOT NULL DEFAULT 1,
  `add_cart` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `out_stock` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `add_wish` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `already_wish` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `wish_remove` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `add_compare` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `already_compare` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `compare_remove` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `color_change` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `coupon_found` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `no_coupon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `already_coupon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `order_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `order_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `is_affilate` tinyint(1) NOT NULL DEFAULT 1,
  `affilate_charge` int(100) NOT NULL DEFAULT 0,
  `affilate_banner` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `already_cart` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `fixed_commission` double NOT NULL DEFAULT 0,
  `percentage_commission` double NOT NULL DEFAULT 0,
  `multiple_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `multiple_packaging` tinyint(4) NOT NULL DEFAULT 0,
  `vendor_ship_info` tinyint(1) NOT NULL DEFAULT 0,
  `reg_vendor` tinyint(1) NOT NULL DEFAULT 0,
  `cod_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `paypal_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `stripe_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `header_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `footer_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `copyright_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_admin_loader` tinyint(1) NOT NULL DEFAULT 0,
  `menu_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `menu_hover_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_home` tinyint(1) NOT NULL DEFAULT 0,
  `is_verification_email` tinyint(1) NOT NULL DEFAULT 0,
  `instamojo_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `instamojo_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `instamojo_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `is_instamojo` tinyint(1) NOT NULL DEFAULT 0,
  `instamojo_sandbox` tinyint(1) NOT NULL DEFAULT 0,
  `is_paystack` tinyint(1) NOT NULL DEFAULT 0,
  `paystack_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `paystack_email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `paystack_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `wholesell` int(191) NOT NULL DEFAULT 0,
  `is_capcha` tinyint(1) NOT NULL DEFAULT 0,
  `error_banner` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_popup` tinyint(1) NOT NULL DEFAULT 0,
  `popup_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `popup_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `popup_background` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `invoice_logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `vendor_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_secure` tinyint(1) NOT NULL DEFAULT 0,
  `is_report` tinyint(1) NOT NULL,
  `paypal_check` tinyint(1) NULL DEFAULT 0,
  `paypal_business` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `footer_logo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `email_encryption` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `paytm_merchant` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `paytm_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `paytm_website` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `paytm_industry` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `is_paytm` int(11) NOT NULL DEFAULT 1,
  `paytm_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `paytm_mode` enum('sandbox','live') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `is_molly` tinyint(1) NOT NULL DEFAULT 0,
  `molly_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `molly_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `is_razorpay` int(11) NOT NULL DEFAULT 1,
  `razorpay_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `razorpay_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `razorpay_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `show_stock` tinyint(1) NOT NULL DEFAULT 0,
  `is_maintain` tinyint(1) NOT NULL DEFAULT 0,
  `maintain_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of generalsettings
-- ----------------------------
INSERT INTO `generalsettings` VALUES (1, '1571567292logo.png', '1571567283favicon.png', 'Genius Cart', 'smtp', '0123 456789', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae', 'COPYRIGHT © 2019. All Rights Reserved By <a href=\"http://geniusocean.com/\">GeniusOcean.com</a>', '#0f78f2', '1564224328loading3.gif', '1564224329loading3.gif', 0, '<script type=\"text/javascript\">\r\nvar Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n(function(){\r\nvar s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\ns1.async=true;\r\ns1.src=\'https://embed.tawk.to/5bc2019c61d0b77092512d03/default\';\r\ns1.charset=\'UTF-8\';\r\ns1.setAttribute(\'crossorigin\',\'*\');\r\ns0.parentNode.insertBefore(s1,s0);\r\n})();\r\n</script>', 1, 1, 'AIzaSyB1GpE4qeoJ__70UZxvX9CTMUTZRZNHcu8', 0, '<div id=\"disqus_thread\">         \r\n    <script>\r\n    /**\r\n    *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.\r\n    *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/\r\n    /*\r\n    var disqus_config = function () {\r\n    this.page.url = PAGE_URL;  // Replace PAGE_URL with your page\'s canonical URL variable\r\n    this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page\'s unique identifier variable\r\n    };\r\n    */\r\n    (function() { // DON\'T EDIT BELOW THIS LINE\r\n    var d = document, s = d.createElement(\'script\');\r\n    s.src = \'https://junnun.disqus.com/embed.js\';\r\n    s.setAttribute(\'data-timestamp\', +new Date());\r\n    (d.head || d.body).appendChild(s);\r\n    })();\r\n    </script>\r\n    <noscript>Please enable JavaScript to view the <a href=\"https://disqus.com/?ref_noscript\">comments powered by Disqus.</a></noscript>\r\n    </div>', 1, 1, 1, 1, 1, 'pk_test_UnU1Coi1p5qFGwtpjZMRMgJM', 'sk_test_QQcg3vGsKRPlW6T3dXcNJsor', 0, 5, 5, 0, 5, NULL, NULL, NULL, NULL, 'geniustest11@gmail.com', 'GeniusTest', 0, 1, 1, 'Successfully Added To Cart', 'Out Of Stock', 'Add To Wishlist', 'Already Added To Wishlist', 'Successfully Removed From The Wishlist', 'Successfully Added To Compare', 'Already Added To Compare', 'Successfully Removed From The Compare', 'Successfully Changed The Color', 'Coupon Found', 'No Coupon Found', 'Coupon Already Applied', 'THANK YOU FOR YOUR PURCHASE.', 'We\'ll email you an order confirmation with details and tracking info.', 1, 8, '15587771131554048228onepiece.jpeg', 'Already Added To Cart', 5, 5, 1, 1, 1, 1, 'Pay with cash upon delivery.', 'Pay via your PayPal account.', 'Pay via your Credit Card.', '#ffffff', '#143250', '#02020c', 1, '#ff5500', '#02020c', 0, 0, 'test_172371aa837ae5cad6047dc3052', 'test_4ac5a785e25fc596b67dbc5c267', 'Pay via your Instamojo account.', 1, 1, 1, 'pk_test_162a56d42131cbb01932ed0d2c48f9cb99d8e8e2', 'junnuns@gmail.com', 'Pay via your Paystack account.', 6, 1, '1566878455404.png', 1, 'NEWSLETTER', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Expedita porro ipsa nulla, alias, ab minus.', '1584934329adv-banner.jpg', '1571567295logo.png', '1567655174profile.jpg', '#666666', 0, 1, 1, 'shaon143-facilitator-1@gmail.com', '1571567309footers.png', NULL, 'tkogux49985047638244', 'LhNGUUKE9xCQ9xY8', 'WEBSTAGING', 'Retail', 1, 'Pay via your Paytm account.', 'sandbox', 1, 'test_5HcWVs9qc5pzy36H9Tu9mwAyats33J', 'Pay with Molly Payment.', 1, 'rzp_test_xDH74d48cwl8DF', 'cr0H1BiQ20hVzhpHfHuNbGri', 'Pay via your Razorpay account.', 0, 0, '<div style=\"text-align: center;\"><font size=\"5\"><br></font></div><h1 style=\"text-align: center;\"><font size=\"6\">UNDER MAINTENANCE</font></h1>');

-- ----------------------------
-- Table structure for interior_designs
-- ----------------------------
DROP TABLE IF EXISTS `interior_designs`;
CREATE TABLE `interior_designs`  (
  `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attributes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `thumbnail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `scene` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `price` double NULL DEFAULT NULL,
  `previous_price` double NULL DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `policy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 1,
  `views` int(191) UNSIGNED NOT NULL DEFAULT 0,
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `colors` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `type` enum('Main Room','Kitchen','Bed Room') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Main Room',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  FULLTEXT INDEX `name`(`name`),
  FULLTEXT INDEX `attributes`(`attributes`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of interior_designs
-- ----------------------------
INSERT INTO `interior_designs` VALUES (1, '1', 'test', 'test', 'test.jpg', 'test.jpg', '{}', 1, 1, '1', '1', 1, 0, '1', '1', 'Main Room', '2020-07-31 07:05:33', '2020-07-31 14:16:06');
INSERT INTO `interior_designs` VALUES (2, NULL, 'test design', NULL, NULL, NULL, '{\"floorplan\":{\"corners\":{\"f90da5e3-9e0e-eba7-173d-eb0b071e838e\":{\"x\":0,\"y\":280},\"da026c08-d76a-a944-8e7b-096b752da9ed\":{\"x\":340,\"y\":280},\"4e3d65cb-54c0-0681-28bf-bddcc7bdb571\":{\"x\":340,\"y\":-210},\"71d4f128-ae80-3d58-9bd2-711c6ce6cdf2\":{\"x\":0,\"y\":-210}},\"walls\":[{\"corner1\":\"71d4f128-ae80-3d58-9bd2-711c6ce6cdf2\",\"corner2\":\"f90da5e3-9e0e-eba7-173d-eb0b071e838e\",\"frontTexture\":{\"url\":\"assets/hiplan/mtldb/rooms/textures/wallmap.png\",\"stretch\":true,\"scale\":0},\"backTexture\":{\"url\":\"../../assets/images/textures/15962156542222.jpg\",\"stretch\":false,\"scale\":30}},{\"corner1\":\"f90da5e3-9e0e-eba7-173d-eb0b071e838e\",\"corner2\":\"da026c08-d76a-a944-8e7b-096b752da9ed\",\"frontTexture\":{\"url\":\"assets/hiplan/mtldb/rooms/textures/wallmap.png\",\"stretch\":true,\"scale\":0},\"backTexture\":{\"url\":\"assets/hiplan/mtldb/rooms/textures/wallmap.png\",\"stretch\":true,\"scale\":0}},{\"corner1\":\"da026c08-d76a-a944-8e7b-096b752da9ed\",\"corner2\":\"4e3d65cb-54c0-0681-28bf-bddcc7bdb571\",\"frontTexture\":{\"url\":\"assets/hiplan/mtldb/rooms/textures/wallmap.png\",\"stretch\":true,\"scale\":0},\"backTexture\":{\"url\":\"../../assets/images/textures/15962156542222.jpg\",\"stretch\":false,\"scale\":30}},{\"corner1\":\"4e3d65cb-54c0-0681-28bf-bddcc7bdb571\",\"corner2\":\"71d4f128-ae80-3d58-9bd2-711c6ce6cdf2\",\"frontTexture\":{\"url\":\"assets/hiplan/mtldb/rooms/textures/wallmap.png\",\"stretch\":true,\"scale\":0},\"backTexture\":{\"url\":\"../../assets/images/textures/1596179142light_brick.jpg\",\"stretch\":false,\"scale\":30}}],\"wallTextures\":[],\"floorTextures\":{},\"newFloorTextures\":{\"4e3d65cb-54c0-0681-28bf-bddcc7bdb571,71d4f128-ae80-3d58-9bd2-711c6ce6cdf2,da026c08-d76a-a944-8e7b-096b752da9ed,f90da5e3-9e0e-eba7-173d-eb0b071e838e\":{\"url\":\"../../assets/images/textures/1596209880hardwood.png\",\"scale\":300}}},\"items\":[{\"item_name\":\"shop\",\"item_type\":7,\"model_url\":\"./../../assets/models/1596214545closed-door28x80_baked.js \",\"xpos\":0.500000000000016,\"ypos\":110.80000022010701,\"zpos\":14.890371323466809,\"rotation\":1.5707963267948966,\"scale_x\":1,\"scale_y\":1,\"scale_z\":1,\"fixed\":false},{\"item_name\":\"shop\",\"item_type\":1,\"model_url\":\"./../../assets/models/1596213490ik-ekero-orange_baked.js \",\"xpos\":54.025195452172866,\"ypos\":37.50235073007,\"zpos\":-118.83600898726633,\"rotation\":1.5707963267948966,\"scale_x\":1,\"scale_y\":1,\"scale_z\":1,\"fixed\":false}]}', 10, NULL, NULL, NULL, 1, 0, NULL, NULL, 'Main Room', '2020-07-31 18:02:42', '2020-07-31 18:02:42');
INSERT INTO `interior_designs` VALUES (3, NULL, 'test design', NULL, NULL, NULL, '{\"floorplan\":{\"corners\":{\"f90da5e3-9e0e-eba7-173d-eb0b071e838e\":{\"x\":0,\"y\":280},\"da026c08-d76a-a944-8e7b-096b752da9ed\":{\"x\":340,\"y\":280},\"4e3d65cb-54c0-0681-28bf-bddcc7bdb571\":{\"x\":340,\"y\":-210},\"71d4f128-ae80-3d58-9bd2-711c6ce6cdf2\":{\"x\":0,\"y\":-210}},\"walls\":[{\"corner1\":\"71d4f128-ae80-3d58-9bd2-711c6ce6cdf2\",\"corner2\":\"f90da5e3-9e0e-eba7-173d-eb0b071e838e\",\"frontTexture\":{\"url\":\"assets/hiplan/mtldb/rooms/textures/wallmap.png\",\"stretch\":true,\"scale\":0},\"backTexture\":{\"url\":\"../../assets/images/textures/15962156542222.jpg\",\"stretch\":false,\"scale\":30}},{\"corner1\":\"f90da5e3-9e0e-eba7-173d-eb0b071e838e\",\"corner2\":\"da026c08-d76a-a944-8e7b-096b752da9ed\",\"frontTexture\":{\"url\":\"assets/hiplan/mtldb/rooms/textures/wallmap.png\",\"stretch\":true,\"scale\":0},\"backTexture\":{\"url\":\"assets/hiplan/mtldb/rooms/textures/wallmap.png\",\"stretch\":true,\"scale\":0}},{\"corner1\":\"da026c08-d76a-a944-8e7b-096b752da9ed\",\"corner2\":\"4e3d65cb-54c0-0681-28bf-bddcc7bdb571\",\"frontTexture\":{\"url\":\"assets/hiplan/mtldb/rooms/textures/wallmap.png\",\"stretch\":true,\"scale\":0},\"backTexture\":{\"url\":\"../../assets/images/textures/15962156542222.jpg\",\"stretch\":false,\"scale\":30}},{\"corner1\":\"4e3d65cb-54c0-0681-28bf-bddcc7bdb571\",\"corner2\":\"71d4f128-ae80-3d58-9bd2-711c6ce6cdf2\",\"frontTexture\":{\"url\":\"assets/hiplan/mtldb/rooms/textures/wallmap.png\",\"stretch\":true,\"scale\":0},\"backTexture\":{\"url\":\"../../assets/images/textures/1596179142light_brick.jpg\",\"stretch\":false,\"scale\":30}}],\"wallTextures\":[],\"floorTextures\":{},\"newFloorTextures\":{\"4e3d65cb-54c0-0681-28bf-bddcc7bdb571,71d4f128-ae80-3d58-9bd2-711c6ce6cdf2,da026c08-d76a-a944-8e7b-096b752da9ed,f90da5e3-9e0e-eba7-173d-eb0b071e838e\":{\"url\":\"../../assets/images/textures/1596209880hardwood.png\",\"scale\":300}}},\"items\":[{\"item_name\":\"shop\",\"item_type\":7,\"model_url\":\"./../../assets/models/1596214545closed-door28x80_baked.js \",\"xpos\":0.500000000000016,\"ypos\":110.80000022010701,\"zpos\":14.890371323466809,\"rotation\":1.5707963267948966,\"scale_x\":1,\"scale_y\":1,\"scale_z\":1,\"fixed\":false},{\"item_name\":\"shop\",\"item_type\":1,\"model_url\":\"./../../assets/models/1596213490ik-ekero-orange_baked.js \",\"xpos\":54.025195452172866,\"ypos\":37.50235073007,\"zpos\":-118.83600898726633,\"rotation\":1.5707963267948966,\"scale_x\":1,\"scale_y\":1,\"scale_z\":1,\"fixed\":false}],\"camera\":{\"position\":{\"x\":133.7877610356059,\"y\":150.00000000000003,\"z\":321.0487236239838},\"rotation\":{\"_x\":-9.935967806527942e-17,\"_y\":-0.12592481220789126,\"_z\":-1.2478807783747655e-17,\"_order\":\"XYZ\"},\"quaternion\":{\"_x\":-4.9188811145862973e-17,\"_y\":-0.06292081444184078,\"_z\":-3.101144716530531e-18,\"_w\":0.9980185219158265}}}', 10, NULL, NULL, NULL, 1, 0, NULL, NULL, 'Main Room', '2020-07-31 18:05:16', '2020-07-31 18:05:16');
INSERT INTO `interior_designs` VALUES (4, NULL, 'test design', NULL, NULL, NULL, '{\"floorplan\":{\"corners\":{\"f90da5e3-9e0e-eba7-173d-eb0b071e838e\":{\"x\":0,\"y\":280},\"da026c08-d76a-a944-8e7b-096b752da9ed\":{\"x\":340,\"y\":280},\"4e3d65cb-54c0-0681-28bf-bddcc7bdb571\":{\"x\":340,\"y\":-210},\"71d4f128-ae80-3d58-9bd2-711c6ce6cdf2\":{\"x\":0,\"y\":-210}},\"walls\":[{\"corner1\":\"71d4f128-ae80-3d58-9bd2-711c6ce6cdf2\",\"corner2\":\"f90da5e3-9e0e-eba7-173d-eb0b071e838e\",\"frontTexture\":{\"url\":\"assets/hiplan/mtldb/rooms/textures/wallmap.png\",\"stretch\":true,\"scale\":0},\"backTexture\":{\"url\":\"../../assets/images/textures/15962156542222.jpg\",\"stretch\":false,\"scale\":30}},{\"corner1\":\"f90da5e3-9e0e-eba7-173d-eb0b071e838e\",\"corner2\":\"da026c08-d76a-a944-8e7b-096b752da9ed\",\"frontTexture\":{\"url\":\"assets/hiplan/mtldb/rooms/textures/wallmap.png\",\"stretch\":true,\"scale\":0},\"backTexture\":{\"url\":\"assets/hiplan/mtldb/rooms/textures/wallmap.png\",\"stretch\":true,\"scale\":0}},{\"corner1\":\"da026c08-d76a-a944-8e7b-096b752da9ed\",\"corner2\":\"4e3d65cb-54c0-0681-28bf-bddcc7bdb571\",\"frontTexture\":{\"url\":\"assets/hiplan/mtldb/rooms/textures/wallmap.png\",\"stretch\":true,\"scale\":0},\"backTexture\":{\"url\":\"../../assets/images/textures/15962156542222.jpg\",\"stretch\":false,\"scale\":30}},{\"corner1\":\"4e3d65cb-54c0-0681-28bf-bddcc7bdb571\",\"corner2\":\"71d4f128-ae80-3d58-9bd2-711c6ce6cdf2\",\"frontTexture\":{\"url\":\"assets/hiplan/mtldb/rooms/textures/wallmap.png\",\"stretch\":true,\"scale\":0},\"backTexture\":{\"url\":\"../../assets/images/textures/1596179142light_brick.jpg\",\"stretch\":false,\"scale\":30}}],\"wallTextures\":[],\"floorTextures\":{},\"newFloorTextures\":{\"4e3d65cb-54c0-0681-28bf-bddcc7bdb571,71d4f128-ae80-3d58-9bd2-711c6ce6cdf2,da026c08-d76a-a944-8e7b-096b752da9ed,f90da5e3-9e0e-eba7-173d-eb0b071e838e\":{\"url\":\"../../assets/images/textures/1596209880hardwood.png\",\"scale\":300}}},\"items\":[{\"item_name\":\"shop\",\"item_type\":7,\"model_url\":\"./../../assets/models/1596214545closed-door28x80_baked.js \",\"xpos\":0.500000000000016,\"ypos\":110.80000022010701,\"zpos\":14.890371323466809,\"rotation\":1.5707963267948966,\"scale_x\":1,\"scale_y\":1,\"scale_z\":1,\"fixed\":false},{\"item_name\":\"shop\",\"item_type\":1,\"model_url\":\"./../../assets/models/1596213490ik-ekero-orange_baked.js \",\"xpos\":54.025195452172866,\"ypos\":37.50235073007,\"zpos\":-118.83600898726633,\"rotation\":1.5707963267948966,\"scale_x\":1,\"scale_y\":1,\"scale_z\":1,\"fixed\":false}],\"camera\":{\"position\":{\"x\":156.13555385920134,\"y\":150.00000000000003,\"z\":322.99822164543593},\"rotation\":{\"_x\":-9.868709926811737e-17,\"_y\":-0.04810359825143816,\"_z\":-4.745373942931527e-18,\"_order\":\"XYZ\"},\"quaternion\":{\"_x\":-4.9272216176892296e-17,\"_y\":-0.024049480196349744,\"_z\":-1.1853140026460073e-18,\"_w\":0.9997107713381015}}}', 10, NULL, NULL, NULL, 1, 0, NULL, NULL, 'Main Room', '2020-07-31 18:06:05', '2020-07-31 18:06:05');
INSERT INTO `interior_designs` VALUES (5, NULL, 'test design', NULL, NULL, NULL, '{\"floorplan\":{\"corners\":{\"f90da5e3-9e0e-eba7-173d-eb0b071e838e\":{\"x\":0,\"y\":280},\"da026c08-d76a-a944-8e7b-096b752da9ed\":{\"x\":340,\"y\":280},\"4e3d65cb-54c0-0681-28bf-bddcc7bdb571\":{\"x\":340,\"y\":-210},\"71d4f128-ae80-3d58-9bd2-711c6ce6cdf2\":{\"x\":0,\"y\":-210}},\"walls\":[{\"corner1\":\"71d4f128-ae80-3d58-9bd2-711c6ce6cdf2\",\"corner2\":\"f90da5e3-9e0e-eba7-173d-eb0b071e838e\",\"frontTexture\":{\"url\":\"assets/hiplan/mtldb/rooms/textures/wallmap.png\",\"stretch\":true,\"scale\":0},\"backTexture\":{\"url\":\"../../assets/images/textures/15962156542222.jpg\",\"stretch\":false,\"scale\":30}},{\"corner1\":\"f90da5e3-9e0e-eba7-173d-eb0b071e838e\",\"corner2\":\"da026c08-d76a-a944-8e7b-096b752da9ed\",\"frontTexture\":{\"url\":\"assets/hiplan/mtldb/rooms/textures/wallmap.png\",\"stretch\":true,\"scale\":0},\"backTexture\":{\"url\":\"assets/hiplan/mtldb/rooms/textures/wallmap.png\",\"stretch\":true,\"scale\":0}},{\"corner1\":\"da026c08-d76a-a944-8e7b-096b752da9ed\",\"corner2\":\"4e3d65cb-54c0-0681-28bf-bddcc7bdb571\",\"frontTexture\":{\"url\":\"assets/hiplan/mtldb/rooms/textures/wallmap.png\",\"stretch\":true,\"scale\":0},\"backTexture\":{\"url\":\"../../assets/images/textures/15962156542222.jpg\",\"stretch\":false,\"scale\":30}},{\"corner1\":\"4e3d65cb-54c0-0681-28bf-bddcc7bdb571\",\"corner2\":\"71d4f128-ae80-3d58-9bd2-711c6ce6cdf2\",\"frontTexture\":{\"url\":\"assets/hiplan/mtldb/rooms/textures/wallmap.png\",\"stretch\":true,\"scale\":0},\"backTexture\":{\"url\":\"../../assets/images/textures/1596179142light_brick.jpg\",\"stretch\":false,\"scale\":30}}],\"wallTextures\":[],\"floorTextures\":{},\"newFloorTextures\":{\"4e3d65cb-54c0-0681-28bf-bddcc7bdb571,71d4f128-ae80-3d58-9bd2-711c6ce6cdf2,da026c08-d76a-a944-8e7b-096b752da9ed,f90da5e3-9e0e-eba7-173d-eb0b071e838e\":{\"url\":\"../../assets/images/textures/1596209880hardwood.png\",\"scale\":300}}},\"items\":[{\"item_name\":\"shop\",\"item_type\":7,\"model_url\":\"./../../assets/models/1596214545closed-door28x80_baked.js \",\"xpos\":163.04819060431043,\"ypos\":110.80000022010701,\"zpos\":-209.5,\"rotation\":0,\"scale_x\":1,\"scale_y\":1,\"scale_z\":1,\"fixed\":false},{\"item_name\":\"shop\",\"item_type\":1,\"model_url\":\"./../../assets/models/1596213490ik-ekero-orange_baked.js \",\"xpos\":54.025195452172866,\"ypos\":37.50235073007,\"zpos\":-118.83600898726633,\"rotation\":1.5707963267948966,\"scale_x\":1,\"scale_y\":1,\"scale_z\":1,\"fixed\":false},{\"item_name\":\"Shop\",\"item_type\":1,\"model_url\":\"./../../assets/models/1596213490ik-ekero-orange_baked.js \",\"xpos\":289.77711273258666,\"ypos\":37.50235073007,\"zpos\":-104.69486406626078,\"rotation\":-1.5707963267948966,\"scale_x\":1,\"scale_y\":1,\"scale_z\":1,\"fixed\":false},{\"item_name\":\"Shop\",\"item_type\":7,\"model_url\":\"./../../assets/models/1596214545closed-door28x80_baked.js \",\"xpos\":0.5000000000000151,\"ypos\":110.80000022010701,\"zpos\":35,\"rotation\":1.5707963267948966,\"scale_x\":1,\"scale_y\":1,\"scale_z\":1,\"fixed\":false}],\"camera\":{\"position\":{\"x\":160.81340354887186,\"y\":150.00000000000003,\"z\":323.18536566482464},\"rotation\":{\"_x\":-9.862301317261211e-17,\"_y\":-0.03186659769584147,\"_z\":-3.1422479745318878e-18,\"_order\":\"XYZ\"},\"quaternion\":{\"_x\":-4.9280215044705895e-17,\"_y\":-0.015932624752993958,\"_z\":-7.852628243954423e-19,\"_w\":0.999873063852558}}}', 10, NULL, NULL, NULL, 1, 0, NULL, NULL, 'Main Room', '2020-07-31 18:52:45', '2020-07-31 18:52:45');

-- ----------------------------
-- Table structure for languages
-- ----------------------------
DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of languages
-- ----------------------------
INSERT INTO `languages` VALUES (1, 0, 'English', '1579926860LzpDa1Y7.json');
INSERT INTO `languages` VALUES (2, 0, 'RTL English', '1579927527QjLMUGyj.json');
INSERT INTO `languages` VALUES (3, 1, 'Korean', '1596068833MXxuRQkx.json');

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `conversation_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_user` int(191) NULL DEFAULT NULL,
  `recieved_user` int(191) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `order_id` int(191) UNSIGNED NULL DEFAULT NULL,
  `user_id` int(191) NULL DEFAULT NULL,
  `vendor_id` int(191) NULL DEFAULT NULL,
  `product_id` int(191) NULL DEFAULT NULL,
  `conversation_id` int(191) NULL DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notifications
-- ----------------------------
INSERT INTO `notifications` VALUES (1, NULL, 29, NULL, NULL, NULL, 1, '2020-07-29 23:30:24', '2020-07-30 01:18:01');

-- ----------------------------
-- Table structure for order_tracks
-- ----------------------------
DROP TABLE IF EXISTS `order_tracks`;
CREATE TABLE `order_tracks`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `order_id` int(191) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NULL DEFAULT NULL,
  `cart` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shipping` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pickup_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `totalQty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_amount` float NOT NULL,
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `order_number` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `payment_status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `customer_email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `customer_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `customer_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `customer_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `customer_zip` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `shipping_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `shipping_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shipping_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `shipping_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `shipping_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `shipping_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `shipping_zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `order_note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `coupon_discount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` enum('pending','processing','completed','declined','on delivery') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `affilate_user` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `affilate_charge` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `currency_sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_value` double NOT NULL,
  `shipping_cost` double NOT NULL,
  `packing_cost` double NOT NULL DEFAULT 0,
  `tax` int(191) NOT NULL,
  `dp` tinyint(1) NOT NULL DEFAULT 0,
  `pay_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `vendor_shipping_id` int(191) NOT NULL DEFAULT 0,
  `vendor_packing_id` int(191) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for packages
-- ----------------------------
DROP TABLE IF EXISTS `packages`;
CREATE TABLE `packages`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `subtitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `price` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of packages
-- ----------------------------
INSERT INTO `packages` VALUES (1, 0, 'Default Packaging', 'Default packaging by store', 0);
INSERT INTO `packages` VALUES (2, 0, 'Gift Packaging', 'Exclusive Gift packaging', 15);

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `header` tinyint(1) NOT NULL DEFAULT 0,
  `footer` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES (1, 'About Us', 'about', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 1</font><br></h2><p><span style=\"font-weight: 700;\">Lorem Ipsum</span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 2</font><br></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 3</font><br></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div><h2 helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" line-height:=\"\" 1.1;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" margin:=\"\" 0px=\"\" 15px;=\"\" font-size:=\"\" 30px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" style=\"font-family: \" 51);\"=\"\"><font size=\"6\">Title number 9</font><br></h2><p helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', NULL, NULL, 1, 0);
INSERT INTO `pages` VALUES (2, 'Privacy & Policy', 'privacy', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><img src=\"https://i.imgur.com/BobQuyA.jpg\" width=\"591\"></h2><h2><font size=\"6\">Title number 1</font></h2><p><span style=\"font-weight: 700;\">Lorem Ipsum</span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 2</font><br></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 3</font><br></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div><h2 helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" line-height:=\"\" 1.1;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" margin:=\"\" 0px=\"\" 15px;=\"\" font-size:=\"\" 30px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" 51);\"=\"\" style=\"font-family: \"><font size=\"6\">Title number 9</font><br></h2><p helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'test,test1,test2,test3', 'Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 0, 1);
INSERT INTO `pages` VALUES (3, 'Terms & Condition', 'terms', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 1</font><br></h2><p><span style=\"font-weight: 700;\">Lorem Ipsum</span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 2</font><br></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 3</font><br></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div><h2 helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" line-height:=\"\" 1.1;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" margin:=\"\" 0px=\"\" 15px;=\"\" font-size:=\"\" 30px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" 51);\"=\"\" style=\"font-family: \"><font size=\"6\">Title number 9</font><br></h2><p helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 't1,t2,t3,t4', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 0, 1);

-- ----------------------------
-- Table structure for pagesettings
-- ----------------------------
DROP TABLE IF EXISTS `pagesettings`;
CREATE TABLE `pagesettings`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `contact_success` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `contact_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `side_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `side_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `street` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `phone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `fax` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `site` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `slider` tinyint(1) NOT NULL DEFAULT 1,
  `service` tinyint(1) NOT NULL DEFAULT 1,
  `featured` tinyint(1) NOT NULL DEFAULT 1,
  `small_banner` tinyint(1) NOT NULL DEFAULT 1,
  `best` tinyint(1) NOT NULL DEFAULT 1,
  `top_rated` tinyint(1) NOT NULL DEFAULT 1,
  `large_banner` tinyint(1) NOT NULL DEFAULT 1,
  `big` tinyint(1) NOT NULL DEFAULT 1,
  `hot_sale` tinyint(1) NOT NULL DEFAULT 1,
  `partners` tinyint(1) NOT NULL DEFAULT 0,
  `review_blog` tinyint(1) NOT NULL DEFAULT 1,
  `best_seller_banner` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `best_seller_banner_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `big_save_banner` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `big_save_banner_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `bottom_small` tinyint(1) NOT NULL DEFAULT 0,
  `flash_deal` tinyint(1) NOT NULL DEFAULT 0,
  `best_seller_banner1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `best_seller_banner_link1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `big_save_banner1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `big_save_banner_link1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `featured_category` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pagesettings
-- ----------------------------
INSERT INTO `pagesettings` VALUES (1, 'Success! Thanks for contacting us, we will get back to you shortly.', 'admin@geniusocean.com', '<h4 class=\"subtitle\" style=\"margin-bottom: 6px; font-weight: 600; line-height: 28px; font-size: 28px; text-transform: uppercase;\">WE\'D LOVE TO</h4><h2 class=\"title\" style=\"margin-bottom: 13px;font-weight: 600;line-height: 50px;font-size: 40px;color: #0f78f2;text-transform: uppercase;\">HEAR FROM YOU</h2>', '<span style=\"color: rgb(119, 119, 119);\">Send us a message and we\' ll respond as soon as possible</span><br>', '<h4 class=\"title\" style=\"margin-bottom: 10px; font-weight: 600; line-height: 28px; font-size: 28px;\">Let\'s Connect</h4>', '<span style=\"color: rgb(51, 51, 51);\">Get in touch with us</span>', '3584 Hickory Heights Drive ,Hanover MD 21076, USA', '00 000 000 000', '00 000 000 000', 'admin@geniusocean.com', 'https://geniusocean.com/', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '1568889138banner1.jpg', 'http://google.com', '1565150264banner3.jpg', 'http://google.com', 1, 1, '1568889138banner2.jpg', 'http://google.com', '1565150264banner4.jpg', 'http://google.com', 1);

-- ----------------------------
-- Table structure for partners
-- ----------------------------
DROP TABLE IF EXISTS `partners`;
CREATE TABLE `partners`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of partners
-- ----------------------------
INSERT INTO `partners` VALUES (1, '1563165366brand-1.png', 'https://www.google.com/');
INSERT INTO `partners` VALUES (2, '1563165383brand-2.png', 'https://www.google.com/');
INSERT INTO `partners` VALUES (3, '1563165393brand-3.png', 'https://www.google.com/');
INSERT INTO `partners` VALUES (4, '1563165400brand-1.png', NULL);
INSERT INTO `partners` VALUES (5, '1563165411brand-2.png', NULL);
INSERT INTO `partners` VALUES (6, '1563165444brand-3.png', NULL);

-- ----------------------------
-- Table structure for payment_gateways
-- ----------------------------
DROP TABLE IF EXISTS `payment_gateways`;
CREATE TABLE `payment_gateways`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` tinyint(10) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_gateways
-- ----------------------------
INSERT INTO `payment_gateways` VALUES (46, 'Pay via your Mobile Money.', 'Mobile Money', '<font size=\"3\"><b style=\"\">Mobile Money</b><b>&nbsp;No: 6528068515</b><br><br></font>', 1);

-- ----------------------------
-- Table structure for pickups
-- ----------------------------
DROP TABLE IF EXISTS `pickups`;
CREATE TABLE `pickups`  (
  `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pickups
-- ----------------------------
INSERT INTO `pickups` VALUES (2, 'Azampur');
INSERT INTO `pickups` VALUES (3, 'Dhaka');
INSERT INTO `pickups` VALUES (4, 'Kazipara');
INSERT INTO `pickups` VALUES (5, 'Kamarpara');
INSERT INTO `pickups` VALUES (6, 'Uttara');

-- ----------------------------
-- Table structure for product_clicks
-- ----------------------------
DROP TABLE IF EXISTS `product_clicks`;
CREATE TABLE `product_clicks`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `product_id` int(191) NOT NULL,
  `date` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_clicks
-- ----------------------------
INSERT INTO `product_clicks` VALUES (1, 171, '2020-01-23');
INSERT INTO `product_clicks` VALUES (2, 95, '2020-07-29');
INSERT INTO `product_clicks` VALUES (3, 168, '2020-07-29');
INSERT INTO `product_clicks` VALUES (4, 168, '2020-07-29');
INSERT INTO `product_clicks` VALUES (5, 159, '2020-07-29');
INSERT INTO `product_clicks` VALUES (6, 100, '2020-07-29');
INSERT INTO `product_clicks` VALUES (7, 96, '2020-07-29');
INSERT INTO `product_clicks` VALUES (8, 100, '2020-07-29');
INSERT INTO `product_clicks` VALUES (9, 123, '2020-07-29');
INSERT INTO `product_clicks` VALUES (10, 123, '2020-07-29');
INSERT INTO `product_clicks` VALUES (11, 181, '2020-07-29');
INSERT INTO `product_clicks` VALUES (12, 181, '2020-07-29');
INSERT INTO `product_clicks` VALUES (13, 181, '2020-07-29');
INSERT INTO `product_clicks` VALUES (14, 181, '2020-07-29');
INSERT INTO `product_clicks` VALUES (15, 181, '2020-07-29');
INSERT INTO `product_clicks` VALUES (16, 181, '2020-07-29');
INSERT INTO `product_clicks` VALUES (17, 181, '2020-07-29');
INSERT INTO `product_clicks` VALUES (18, 181, '2020-07-29');
INSERT INTO `product_clicks` VALUES (19, 181, '2020-07-29');
INSERT INTO `product_clicks` VALUES (20, 181, '2020-07-29');
INSERT INTO `product_clicks` VALUES (21, 181, '2020-07-29');
INSERT INTO `product_clicks` VALUES (22, 168, '2020-07-29');
INSERT INTO `product_clicks` VALUES (23, 99, '2020-07-29');
INSERT INTO `product_clicks` VALUES (24, 99, '2020-07-29');
INSERT INTO `product_clicks` VALUES (25, 181, '2020-07-30');
INSERT INTO `product_clicks` VALUES (26, 95, '2020-07-30');
INSERT INTO `product_clicks` VALUES (27, 95, '2020-07-30');
INSERT INTO `product_clicks` VALUES (28, 168, '2020-07-30');
INSERT INTO `product_clicks` VALUES (29, 168, '2020-07-30');
INSERT INTO `product_clicks` VALUES (30, 181, '2020-07-31');
INSERT INTO `product_clicks` VALUES (32, 185, '2020-07-31');
INSERT INTO `product_clicks` VALUES (33, 185, '2020-07-31');
INSERT INTO `product_clicks` VALUES (34, 189, '2020-07-31');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `product_type` enum('normal','affiliate') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'normal',
  `affiliate_link` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `category_id` int(191) UNSIGNED NOT NULL,
  `subcategory_id` int(191) UNSIGNED NULL DEFAULT NULL,
  `childcategory_id` int(191) UNSIGNED NULL DEFAULT NULL,
  `attributes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `size_qty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `size_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `color` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `price` double NOT NULL,
  `previous_price` double NULL DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `stock` int(191) NULL DEFAULT NULL,
  `policy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 1,
  `views` int(191) UNSIGNED NOT NULL DEFAULT 0,
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `features` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `colors` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `product_condition` tinyint(1) NOT NULL DEFAULT 0,
  `ship` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_meta` tinyint(1) NOT NULL DEFAULT 0,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `youtube` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` enum('Physical','Digital','License') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `license` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `license_qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `platform` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `region` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `licence_type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `measure` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `featured` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `best` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `top` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `hot` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `latest` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `big` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `trending` tinyint(1) NOT NULL DEFAULT 0,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `is_discount` tinyint(1) NOT NULL DEFAULT 0,
  `discount_date` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `whole_sell_qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `whole_sell_discount` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `is_catalog` tinyint(1) NOT NULL DEFAULT 0,
  `catalog_id` int(191) NOT NULL DEFAULT 0,
  `texture` varchar(191) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `map` varchar(191) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  FULLTEXT INDEX `name`(`name`),
  FULLTEXT INDEX `attributes`(`attributes`)
) ENGINE = InnoDB AUTO_INCREMENT = 192 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (93, NULL, 'normal', NULL, 0, 11, NULL, NULL, NULL, 'Digital Product Title will Be Here by Name 1', 'digital-product-title-will-be-here-by-name-1-94l93dsn', '15680269303GYKjODW.png', '1568026930poclhyxJ.jpg', '1568016463minimal (16).zip', NULL, NULL, NULL, NULL, 50, 75, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 39, 'book,ebook', NULL, NULL, 0, NULL, 0, 'book,ebook', 'These are ebook from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Digital', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, '2019-09-08 23:07:43', '2019-11-13 18:31:36', 0, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (95, 'pr495jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 95', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027732dTwHda8l.png', '1568027751AidGUyJv.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 51, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 1, '2019-09-08 23:36:06', '2020-07-30 01:55:37', 1, '09/08/2021', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (96, 'pr601jsv', 'normal', NULL, 13, 5, 6, NULL, NULL, 'Top Rated product title will be here according to your wish 96', 'top-rated-product-title-will-be-here-according-to-your-wish-96-rdk96x5b', '1568025872cCRVsp2k.png', '1568025872thPsuRSJ.jpg', NULL, NULL, NULL, NULL, '#000000,#15a0bf,#f5cf07,#2b4cc2,#247d32,#d62727', 100, 500, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 14, 'fashion', NULL, NULL, 2, '5-7 days', 0, 'fashion', 'Fashion meta tag from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 1, 0, 0, 1, '2019-09-09 00:00:05', '2020-07-29 22:32:50', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (97, 'pr602jsv', 'normal', NULL, 13, 5, 7, NULL, NULL, 'Physical Product Title Title will Be Here 97', 'physical-product-title-title-will-be-here-97-pr602jsv', '1568026462TxRJ07FG.png', '1568026462WBWcd7KZ.jpg', NULL, 'S,M,L', '2147483596,2147483597,2147483597', '20,30,40', '#000000,#851818,#ff0d0d,#1feb4c,#d620cf,#186ceb', 100, 200, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 68, 'clothing,bag', NULL, NULL, 2, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 03:59:33', '2019-10-13 18:08:07', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (99, 'pr604jsv', 'normal', NULL, 13, 5, 7, NULL, NULL, 'Physical Product Title Title will Be Here 99', 'physical-product-title-title-will-be-here-99-hjm99shr', '15680264040zpMCpmS.png', '1568026404Hm4kTmnP.jpg', NULL, 'S', '2147483641', '20', '#000000,#851818,#ff0d0d,#1feb4c,#d620cf,#186ceb', 100, 200, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 18, 'clothing,bag', NULL, NULL, 2, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 03:59:33', '2020-07-29 23:14:03', 0, NULL, '10,20,30,40', '5,10,15,20', 1, 0, NULL, NULL);
INSERT INTO `products` VALUES (100, 'pr605jsv', 'normal', NULL, 13, 5, 7, NULL, NULL, 'Physical Product Title Title will Be Here 100', 'physical-product-title-title-will-be-here-100-qqz100nzi', '1568026368qU5AILZo.png', '1568026368CzWwfWLG.jpg', NULL, 'S', '55555555555555555', '20', '#000000,#851818,#ff0d0d,#1feb4c,#d620cf,#186ceb', 100, 200, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 9, 'clothing,bag', NULL, NULL, 2, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 1, 0, 1, 1, '2019-09-09 03:59:33', '2020-07-29 22:32:58', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (101, 'pr606jsv', 'normal', NULL, 13, 5, 7, NULL, NULL, 'Physical Product Title Title will Be Here 101', 'physical-product-title-title-will-be-here-101-8e1101lbq', '1568026326RDSwScJe.png', '1568026326vMlslLz4.jpg', NULL, 'S', '2147483646', '20', '#000000,#851818,#ff0d0d,#1feb4c,#d620cf,#186ceb', 100, 200, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 5, 'clothing,bag', NULL, NULL, 2, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 03:59:33', '2020-03-22 13:37:43', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (103, NULL, 'normal', NULL, 13, 11, NULL, NULL, NULL, 'Digital Product Title will Be Here by Name 1', 'digital-product-title-will-be-here-by-name-1-laj1033wf', '1568026899SLhVRzQv.png', '15680268999fypNo3k.jpg', '1568016463minimal (16).zip', NULL, NULL, NULL, NULL, 50, 75, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 4, 'book,ebook', NULL, NULL, 0, NULL, 0, 'book,ebook', 'These are ebook from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Digital', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, '2019-09-09 04:07:43', '2019-10-02 17:16:24', 0, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (104, NULL, 'normal', NULL, 13, 11, NULL, NULL, NULL, 'Digital Product Title will Be Here by Name 104', 'digital-product-title-will-be-here-by-name-104-ffv1047iv', '1568026881R8KnUyJv.png', '1568026881yy7vilmh.jpg', '1568016463minimal (16).zip', NULL, NULL, NULL, NULL, 50, 75, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 6, 'book,ebook', NULL, NULL, 0, NULL, 0, 'book,ebook', 'These are ebook from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Digital', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, '2019-09-09 04:07:43', '2019-09-10 00:21:46', 0, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (105, NULL, 'normal', NULL, 13, 11, NULL, NULL, NULL, 'Digital Product Title will Be Here by Name 105', 'digital-product-title-will-be-here-by-name-105-xpt105lfz', '1568026853LMtcb9he.png', '1568026853ZnMf5AkF.jpg', '1568016463minimal (16).zip', NULL, NULL, NULL, NULL, 50, 75, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 3, 'book,ebook', NULL, NULL, 0, NULL, 0, 'book,ebook', 'These are ebook from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Digital', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, '2019-09-09 04:07:43', '2019-10-07 14:40:15', 0, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (106, NULL, 'normal', NULL, 13, 11, NULL, NULL, NULL, 'Digital Product Title will Be Here by Name 106', 'digital-product-title-will-be-here-by-name-106-iq4106dr3', '1568026820NnXjzL5e.png', '1568026820j7QX4FZs.jpg', '1568016463minimal (16).zip', NULL, NULL, NULL, NULL, 50, 75, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 3, 'book,ebook', NULL, NULL, 0, NULL, 0, 'book,ebook', 'These are ebook from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Digital', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, '2019-09-09 04:07:43', '2019-10-07 14:40:14', 0, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (107, NULL, 'normal', NULL, 13, 11, NULL, NULL, NULL, 'Digital Product Title will Be Here by Name 107', 'digital-product-title-will-be-here-by-name-107-4ll107cru', '1568026791NGCCXoMs.png', '1568026791O2FR26Va.jpg', '1568016463minimal (16).zip', NULL, NULL, NULL, NULL, 50, 75, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 4, 'book,ebook', NULL, NULL, 0, NULL, 0, 'book,ebook', 'These are ebook from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Digital', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, '2019-09-09 04:07:43', '2019-10-12 14:27:40', 0, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (109, NULL, 'normal', NULL, 13, 11, NULL, NULL, NULL, 'Digital Product Title will Be Here by Name 109', 'digital-product-title-will-be-here-by-name-109-ext109m9m', '15680267308Mckygzw.png', '1568026730uz1TS02K.jpg', '1568016463minimal (16).zip', NULL, NULL, NULL, NULL, 50, 75, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 1, 'book,ebook', NULL, NULL, 0, NULL, 0, 'book,ebook', 'These are ebook from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Digital', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, '2019-09-09 04:07:43', '2019-09-09 07:33:10', 0, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (111, NULL, 'normal', NULL, 13, 8, NULL, NULL, NULL, 'License key title will be here according to your wish 111', 'license-key-title-will-be-here-according-to-your-wish-111-wb3111ubd', '1568029267UZnlkD97.png', '1568029267AY9MRYAQ.jpg', '156801752005.zip', NULL, NULL, NULL, NULL, 80, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 3, 'game', NULL, NULL, 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=HxNydN5tScI', 'License', '888888888888888888888888', '9999999999999999999999999', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 1, 1, '2019-09-09 04:25:20', '2019-09-18 18:39:08', 0, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (112, NULL, 'normal', NULL, 13, 8, NULL, NULL, NULL, 'License key title will be here according to your wish 1', 'license-key-title-will-be-here-according-to-your-wish-1-sct112k8z', '1568029203HHnZu8em.png', '1568029203eAzBjS8a.jpg', '156801752005.zip', NULL, NULL, NULL, NULL, 80, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 3, 'game', 'Keyword 2,Keyword1', '#e80707,#113fe0', 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=HxNydN5tScI', 'License', '888888888888888888888888', '9999999999999999999999999', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, 1, 1, 1, '2019-09-09 04:25:20', '2019-09-09 12:23:17', 0, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (114, NULL, 'normal', NULL, 13, 8, NULL, NULL, NULL, 'License key title will be here according to your wish 1', 'license-key-title-will-be-here-according-to-your-wish-1-bbb114jm9', '1568029152hgFzyOZv.png', '1568029152PVeSE2Ct.jpg', '156801752005.zip', NULL, NULL, NULL, NULL, 80, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 1, 'game', NULL, NULL, 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=HxNydN5tScI', 'License', '888888888888888888888888', '9999999999999999999999999', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, 1, 0, 1, '2019-09-09 04:25:20', '2019-10-01 15:34:27', 0, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (116, 'pr496jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 116', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027684whVhJDrR.png', '1568027717gm0tFzeb.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'watch', 'Keyword1,Keyword 2', '#ff1a1a,#0fbcd4', 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 04:36:06', '2019-09-09 02:15:17', 1, '09/08/2021', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (117, 'pr497jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 117', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027658Up0FIXsW.png', '1568027670dTA7gQml.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 04:36:06', '2019-09-09 02:14:30', 1, '09/08/2021', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (118, 'pr498jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 118', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027631cnmEylRa.png', '1568027643PgYviwVK.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 04:36:06', '2019-09-09 02:14:03', 1, '09/08/2021', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (119, 'pr499jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 1', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027603i5UAZiKB.png', '1568027616O1coe3aV.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 04:36:06', '2019-09-09 02:13:36', 1, '09/08/2021', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (120, 'pr500jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 120', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027558gLSECTIh.png', '1568027591b1oUIo7Q.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 1, 0, '2019-09-09 04:36:06', '2019-09-09 02:53:33', 1, '09/08/2021', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (121, 'pr501jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 121', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027534O1QEBPpR.png', '1568027543P8eoamtf.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 04:36:06', '2019-09-09 02:12:23', 1, '09/08/2021', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (122, 'pr502jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 122', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027493eLqHNoZP.png', '1568027517LGq90luX.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 04:36:06', '2020-03-22 01:07:59', 1, '09/08/2021', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (123, 'pr608jsv', 'normal', NULL, 13, 5, 6, NULL, NULL, 'Top Rated product title will be here according to your wish 123', 'top-rated-product-title-will-be-here-according-to-your-wish-123-0af12392v', '1568025845ksCVo0hg.png', '1568025845bvB0Q0RE.jpg', NULL, NULL, NULL, NULL, '#000000,#15a0bf,#f5cf07,#2b4cc2,#247d32,#d62727', 100, 500, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 9, 'fashion', NULL, NULL, 2, '5-7 days', 0, 'fashion', 'Fashion meta tag from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 1, 0, 0, 1, '2019-09-09 05:00:05', '2020-07-29 22:35:01', 0, NULL, '10,20,30,40', '5,10,15,20', 1, 0, NULL, NULL);
INSERT INTO `products` VALUES (124, 'pr609jsv', 'normal', NULL, 13, 5, 6, NULL, NULL, 'Top Rated product title will be here according to your wish 124', 'top-rated-product-title-will-be-here-according-to-your-wish-124-hua12449x', '1568025818Iu033mHq.png', '1568025818tm9YHIHp.jpg', NULL, NULL, NULL, NULL, '#000000,#15a0bf,#f5cf07,#2b4cc2,#247d32,#d62727', 100, 500, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 3, 'fashion', NULL, NULL, 2, '5-7 days', 0, 'fashion', 'Fashion meta tag from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, 1, '2019-09-09 05:00:05', '2019-10-01 19:39:33', 0, NULL, '10,20,30,40', '5,10,15,20', 1, 0, NULL, NULL);
INSERT INTO `products` VALUES (125, 'pr610jsv', 'normal', NULL, 13, 5, 6, NULL, NULL, 'Top Rated product title will be here according to your wish 125', 'top-rated-product-title-will-be-here-according-to-your-wish-125-lbp125hto', '1568025774B3MU5tJK.png', '1568025774ZsBKNuio.jpg', NULL, NULL, NULL, NULL, '#000000,#15a0bf,#f5cf07,#2b4cc2,#247d32,#d62727', 100, 500, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 1, 'fashion', NULL, NULL, 2, '5-7 days', 0, 'fashion', 'Fashion meta tag from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 1, '2019-09-09 05:00:05', '2019-10-01 13:57:30', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (126, 'pr611jsv', 'normal', NULL, 13, 5, 6, NULL, NULL, 'Top Rated product title will be here according to your wish 1', 'top-rated-product-title-will-be-here-according-to-your-wish-1-7uo96fft', '1568025683HenL6lSt.png', '1568025683ZYvDAf0q.jpg', NULL, NULL, NULL, NULL, '#000000,#15a0bf,#f5cf07,#2b4cc2,#247d32,#d62727', 100, 500, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; padding: 0px; text-align: justify;\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; padding: 0px; text-align: justify;\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 11, 'fashion', NULL, NULL, 2, '5-7 days', 0, 'fashion', 'Fashion meta tag from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, '2019-09-09 05:00:05', '2020-01-04 20:35:36', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (128, 'pr613jsv', 'normal', NULL, 13, 5, 6, NULL, NULL, 'Top Rated product title will be here according to your wish 102', 'top-rated-product-title-will-be-here-according-to-your-wish-102-rgr128igz', '1568025531RbQwgMZ5.png', '1568025531ckSl3TVR.jpg', NULL, NULL, NULL, NULL, '#000000,#15a0bf,#f5cf07,#2b4cc2,#247d32,#d62727', 100, 500, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 2, 'fashion', 'Keyword1,Keyword 2', '#42c406,#f00505', 2, '5-7 days', 0, 'fashion', 'Fashion meta tag from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, 1, 0, 0, 1, '2019-09-09 05:00:05', '2019-10-01 14:13:52', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (129, 'pr614jsv', 'normal', NULL, 13, 5, 6, NULL, NULL, 'Top Rated product title will be here according to your wish 101', 'top-rated-product-title-will-be-here-according-to-your-wish-101-nls129ico', '1568025423UQNFrvNh.png', '15680254230iXcasMb.jpg', NULL, NULL, NULL, NULL, '#000000,#15a0bf,#f5cf07,#2b4cc2,#247d32,#d62727', 100, 500, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 2, 'fashion', NULL, NULL, 2, '5-7 days', 0, 'fashion', 'Fashion meta tag from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, 1, '2019-09-09 05:00:05', '2019-10-01 19:39:25', 0, NULL, '10,20,30,40', '5,10,15,20', 1, 0, NULL, NULL);
INSERT INTO `products` VALUES (130, NULL, 'normal', NULL, 13, 8, NULL, NULL, NULL, 'License key title will be here according to your wish 130', 'license-key-title-will-be-here-according-to-your-wish-130-nwn1300xx', '1568029076fUcMe2QP.png', '1568029076jgoAP4SR.jpg', '156801752005.zip', NULL, NULL, NULL, NULL, 80, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 5, 'game', NULL, NULL, 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=HxNydN5tScI', 'License', '888888888888888888888888', '999', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 1, 1, 1, 1, '2019-09-09 04:25:20', '2019-10-01 13:57:07', 0, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (134, 'OO42939gas', 'normal', NULL, 13, 4, 2, 1, NULL, 'Elite 24\'\' ELITE HD LED TV DN600D', 'elite-24-elite-hd-led-tv-dn600d-oo42939gas', '1570072567FiBwycha.png', '1570072567Cqr5iSzD.jpg', NULL, NULL, NULL, NULL, NULL, 300, 400, '<span style=\"color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" sans-serif;\"=\"\"><font size=\"3\">TVs always get the final say where the couch goes. We want to shake things up and give you the freedom to decorate the way you want to, not the way you have to. It’s fun, playful and unique, and it goes anywhere. It fits your lifestyle, not the other way around. Its smooth, clean design blends in anywhere, yet the playful color doesn’t get buried. Now, you have the freedom to tailor your TV to your own lifestyle. Finally, a TV that fits you. No messy wires. No unsightly air vents. Just one cord for a smooth back that looks great anywhere. This power consumption system will get 90% saving your electrical power.</font></span><br>', 992, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\"><font size=\"3\">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</font></span><br>', 1, 36, 'tv,television', NULL, NULL, 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=MIJBxqzazeM', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-24 16:33:22', '2019-10-11 22:20:27', 0, NULL, NULL, NULL, 1, 0, NULL, NULL);
INSERT INTO `products` VALUES (135, '3uZ9903ofs', 'normal', NULL, 13, 4, 2, 1, NULL, '32 \'\'NAPCO D/GLASS ULTRA SLIM HD lED TV ES700E', '32-napco-dglass-ultra-slim-hd-led-tv-es700e-3uz9903ofs', '1570072554QTCZrnNj.png', '1570072555mZv9XiNP.jpg', NULL, NULL, NULL, NULL, NULL, 300, 500, '<span style=\"color: rgb(0, 0, 0); font-family: calibri, sans-serif;\"><font size=\"4\">NAPCO TV always get the final say where the couch goes. We want to shake things up and give you the freedom to decorate the way you want to, not the way you have to. It’s fun, playful and unique, and it goes anywhere. It fits your lifestyle, not the other way around. Its smooth, clean design blends in anywhere, yet the playful color doesn’t get buried. Now, you have the freedom to tailor your TV to your own lifestyle. Finally, a TV that fits you. No messy wires. No unsightly air vents. Just one cord for a smooth back that looks great anywhere. This power consumption system will get 90% saving your electrical power.</font></span><br>', 396, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span><br>', 1, 80, 'lcd,tv,led', NULL, NULL, 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=LIqQNG_q2us', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-29 15:08:12', '2019-10-11 21:43:18', 0, NULL, NULL, NULL, 1, 0, NULL, NULL);
INSERT INTO `products` VALUES (144, 'vrX2915O5c', 'normal', NULL, 13, 4, 2, 1, NULL, '32 \'\'NAPCO D/GLASS ULTRA SLIM HD lED TV ES700E', '32-napco-dglass-ultra-slim-hd-led-tv-es700e-vrx2915o5c', '1570072918cZGfHP4L.jpg', '1584942848B9z2jIvL.jpg', NULL, NULL, NULL, NULL, NULL, 300, 500, '<span style=\"color: rgb(0, 0, 0); font-family: calibri, sans-serif;\"><font size=\"4\">NAPCO TV always get the final say where the couch goes. We want to shake things up and give you the freedom to decorate the way you want to, not the way you have to. It’s fun, playful and unique, and it goes anywhere. It fits your lifestyle, not the other way around. Its smooth, clean design blends in anywhere, yet the playful color doesn’t get buried. Now, you have the freedom to tailor your TV to your own lifestyle. Finally, a TV that fits you. No messy wires. No unsightly air vents. Just one cord for a smooth back that looks great anywhere. This power consumption system will get 90% saving your electrical power.</font></span><br>', 396, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span><br>', 1, 21, 'lcd,tv,led', NULL, NULL, 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=LIqQNG_q2us', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-02 13:21:58', '2020-03-22 15:54:08', 0, NULL, NULL, NULL, 0, 135, NULL, NULL);
INSERT INTO `products` VALUES (159, 'zhv5144fRY', 'normal', NULL, 13, 4, 2, 1, NULL, 'Revel - Real Estate HTML Template', 'revel-real-estate-html-template-zhv5144fry', '1570085245XVFR2oBZ.png', '1570085246ZA1btIzg.jpg', NULL, NULL, NULL, NULL, NULL, 300, 346, 'dfh', 34634, 'dfh', 1, 9, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=MIJBxqzazeM', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-02 16:47:25', '2020-07-29 22:28:22', 0, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (160, 'o1L5621DiS', 'normal', NULL, 13, 4, 2, 1, NULL, 'Zain - Digital Agency and Startup HTML Template', 'zain-digital-agency-and-startup-html-template-o1l5621dis', '1570085654jsXxCLyC.png', '1570085654jeAoOOo6.jpg', NULL, NULL, NULL, NULL, NULL, 346, 346, 'sgasdg', 34, 'dsgds', 1, 4, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=MIJBxqzazeM', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-02 16:54:14', '2019-10-11 20:54:27', 0, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (161, 'D2e6433Yi0', 'normal', NULL, 13, 4, 2, 1, NULL, 'Revel - Real Estate HTML Template', 'revel-real-estate-html-template-d2e6433yi0', '1570086479WEPC1gt0.png', '1570086479kBZE8u1v.jpg', NULL, NULL, NULL, NULL, NULL, 300, 400, 'hdfhdf', 0, 'dfjdfj', 1, 24, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=MIJBxqzazeM', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-02 17:07:59', '2019-10-11 15:30:04', 0, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (166, 'U1W3579L5k', 'normal', NULL, 0, 4, 2, 1, '{\"warranty_type\":{\"values\":[\"No warranty\",\"Non-local warranty\"],\"prices\":[\"0\",\"30\"],\"details_status\":1},\"brand\":{\"values\":[\"Oppo\",\"Infinix\"],\"prices\":[\"20\",\"40\"],\"details_status\":1},\"ram\":{\"values\":[\"3 GB\"],\"prices\":[\"0\"],\"details_status\":0},\"color_family\":{\"values\":[\"Black\",\"White\",\"Brown\"],\"prices\":[\"0\",\"20\",\"0\"],\"details_status\":1},\"display_size\":{\"values\":[\"40\",\"21\"],\"prices\":[\"12\",\"20\"],\"details_status\":1}}', 'Zain - Digital Agency and Startupuuuu', 'zain-digital-agency-and-startupuuuu-u1w3579l5k', '15708736755B0OtgVI.png', '1570873675mdibaSBp.jpg', NULL, NULL, NULL, NULL, NULL, 300, 436, 'shsdh', 346, 'sdhds', 1, 3, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=MIJBxqzazeM', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-11 19:47:55', '2019-10-16 19:22:21', 0, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (167, 'kE84874xem', 'normal', NULL, 13, 4, 2, 1, NULL, 'Courses', 'courses-ke84874xem', '1570874976y1X2tWVr.png', '15708749764ioXjDWh.jpg', NULL, NULL, NULL, NULL, NULL, 250, 355, 'asgas', 345, 'agsas', 1, 4, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=MIJBxqzazeM', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-11 20:09:36', '2019-10-11 20:55:05', 0, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (168, 'tbs53803yh', 'normal', NULL, 13, 4, 2, 1, '{\"warranty_type\":{\"values\":[\"Local seller warranty\",\"international manufacturer warranty\"],\"prices\":[\"78\",\"45\"],\"details_status\":1},\"brand\":{\"values\":[\"Symphony\",\"Apple\"],\"prices\":[\"0\",\"0\"],\"details_status\":1},\"ram\":{\"values\":[\"1 GB\",\"3 GB\"],\"prices\":[\"0\",\"0\"],\"details_status\":1},\"color_family\":{\"values\":[\"Sliver\",\"Brown\"],\"prices\":[\"67\",\"5\"],\"details_status\":1}}', 'Revel - Real Estate Huuu', 'revel-real-estate-huuu-tbs53803yh', '1570875445mpVQBH3x.png', '15708754456n2CU31X.jpg', NULL, NULL, NULL, NULL, NULL, 300, 345, 'dfshdfs', 5, 'sdgs', 1, 26, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=MIJBxqzazeM', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-11 20:17:25', '2020-07-30 01:55:57', 0, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` VALUES (169, 'TRg5938WNy', 'normal', NULL, 13, 5, 6, NULL, NULL, 'Top Rated product title will be here according to your wish 123', 'top-rated-product-title-will-be-here-according-to-your-wish-123-trg5938wny', '1570875978KD9cRleA.jpg', '15708759789N9Hm1QJ.jpg', NULL, NULL, NULL, NULL, 'Red,#000000,#15a0bf,#f5cf07,#2b4cc2,#247d32,#d62727', 100, 500, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 4, 'fashion', NULL, NULL, 2, '5-7 days', 0, 'fashion', 'Fashion meta tag from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-11 20:26:18', '2019-10-11 20:31:05', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 123, NULL, NULL);
INSERT INTO `products` VALUES (170, '6Vb6172gWR', 'normal', NULL, 13, 5, 6, NULL, NULL, 'Top Rated product title will be here according to your wish 123', 'top-rated-product-title-will-be-here-according-to-your-wish-123-6vb6172gwr', '1570876195YsopRMZ0.jpg', '157087619598Nfs52R.jpg', NULL, NULL, NULL, NULL, 'Black,Red,#000000,#15a0bf,#f5cf07,#2b4cc2,#247d32,#d62727', 100, 500, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'fashion', NULL, NULL, 2, '5-7 days', 0, 'fashion', 'Fashion meta tag from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-11 20:29:55', '2019-10-11 20:29:55', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 123, NULL, NULL);
INSERT INTO `products` VALUES (171, 'zia62030Vj', 'normal', NULL, 13, 5, 6, NULL, NULL, 'Top Rated product title will be here according to your wish 123', 'top-rated-product-title-will-be-here-according-to-your-wish-123-zia62030vj', '1570876207958wem8B.jpg', '1570876207Ri9VVzRq.jpg', NULL, NULL, NULL, NULL, '#000000,#15a0bf,#f5cf07,#2b4cc2,#247d32,#d62727', 100, 500, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 2, 'fashion', NULL, NULL, 2, '5-7 days', 0, 'fashion', 'Fashion meta tag from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-11 20:30:07', '2020-01-22 16:53:22', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 123, NULL, NULL);
INSERT INTO `products` VALUES (173, 'b2Q6258iDf', 'normal', NULL, 13, 5, NULL, NULL, NULL, 'Physical Product Title Title will Be Here 0131 Test', 'physical-product-title-title-will-be-here-0131-test-b2q6258idf', '1570876281siGCkmvP.jpg', '1570876281Wt1wdK8O.jpg', NULL, 'S', '2147483643', '20', 'White,Red,#000000,#851818,#ff0d0d,#1feb4c,#d620cf,#186ceb', 120, 200, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'clothing,bag', 'Keyword1,Keyword 2', '#cf1d1d,#c92be3', 2, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-11 20:31:21', '2019-10-11 20:31:21', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 131, NULL, NULL);
INSERT INTO `products` VALUES (174, 'bXf62830R9', 'normal', NULL, 13, 5, NULL, NULL, NULL, 'Physical Product Title Title will Be Here 0131 Test', 'physical-product-title-title-will-be-here-0131-test-bxf62830r9', '1570876303dcztUot8.jpg', '15708763046Vwtn82r.jpg', NULL, 'S', '2147483643', '20', 'White,Black,#000000,#851818,#ff0d0d,#1feb4c,#d620cf,#186ceb', 120, 200, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'clothing,bag', 'Keyword1,Keyword 2', '#cf1d1d,#c92be3', 2, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-11 20:31:43', '2019-10-11 20:31:44', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 131, NULL, NULL);
INSERT INTO `products` VALUES (175, '9gn6494iUN', 'normal', NULL, 13, 5, 7, NULL, NULL, 'Physical Product Title Title will Be Here 102', 'physical-product-title-title-will-be-here-102-9gn6494iun', '1570876503CUOkgSFD.jpg', '1570876503XgLFnuQi.jpg', NULL, 'S', '55555555555555555', '20', '#ffffff,#000000,#000000,#851818,#ff0d0d,#1feb4c,#d620cf,#186ceb', 100, 200, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 1, 'clothing,bag', NULL, NULL, 1, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-11 20:35:03', '2020-03-22 13:34:59', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 102, NULL, NULL);
INSERT INTO `products` VALUES (178, 'Tcv6794KXS', 'normal', NULL, 13, 5, 7, NULL, NULL, 'Physical Product Title Title will Be Here 99', 'physical-product-title-title-will-be-here-99-tcv6794kxs', '1570876820YXbcdnxW.jpg', '1570876820rpkj3Z6U.jpg', NULL, 'S', '2147483644', '20', 'White,Black,#000000,#851818,#ff0d0d,#1feb4c,#d620cf,#186ceb', 100, 200, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'clothing,bag', NULL, NULL, 2, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-11 20:40:20', '2019-10-11 20:40:20', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 99, NULL, NULL);
INSERT INTO `products` VALUES (179, 'mf56823djs', 'normal', NULL, 13, 5, 7, NULL, NULL, 'Physical Product Title Title will Be Here 99', 'physical-product-title-title-will-be-here-99-mf56823djs', '1570877127ByWwIJUA.jpg', '1570877128HKed4vMT.jpg', NULL, 'S', '2147483644', '20', 'White,Red,#000000,#851818,#ff0d0d,#1feb4c,#d620cf,#186ceb', 100, 200, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'clothing,bag', NULL, NULL, 2, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-11 20:45:27', '2019-10-11 20:45:28', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 99, NULL, NULL);
INSERT INTO `products` VALUES (180, 'myy7236gFD', 'normal', NULL, 13, 5, 7, NULL, NULL, 'Physical Product Title Title will Be Here 99u', 'physical-product-title-title-will-be-here-99u-myy7236gfd', '1570877254IpMreGOE.jpg', '1584942834BQBbShSE.jpg', NULL, 'S', '2147483644', '20', '#ffffff,#ff0000,#000000,#851818,#ff0d0d,#1feb4c,#d620cf,#186ceb', 100, 200, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 2, 'clothing,bag', NULL, NULL, 2, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-11 20:47:34', '2020-03-22 15:59:56', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 99, NULL, NULL);
INSERT INTO `products` VALUES (181, 'C2k2660TQV', 'normal', NULL, 0, 18, NULL, NULL, NULL, '타일-1', '1-c2k2660tqv', '1596165321KeEP82kO.png', '1596165322160FEOdj.jpg', NULL, NULL, NULL, NULL, NULL, 2222, 1111, '<br>', NULL, '<br>', 1, 13, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2020-07-29 22:46:06', '2020-07-31 17:14:14', 0, NULL, NULL, NULL, 0, 0, '15962156542222.jpg', NULL);
INSERT INTO `products` VALUES (185, 'JlP85820EU', 'normal', NULL, 0, 16, 19, NULL, NULL, 'Sofa111', 'sofa111-jlp85820eu', '1596178802wSmmUtuk.png', '1596178803xcilH47U.jpg', '1596213490ik-ekero-orange_baked.js', NULL, NULL, NULL, NULL, 200, 0, '<br>', NULL, '<br>', 1, 2, NULL, 'red,orange', '#ff0000,#ff6b00', 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2020-07-31 07:00:02', '2020-07-31 16:42:01', 0, NULL, NULL, NULL, 0, 0, NULL, 'ik-ekero-orange_baked.png');
INSERT INTO `products` VALUES (186, 'd5a90908f6', 'normal', NULL, 0, 18, NULL, NULL, NULL, '벽타일', '-d5a90908f6', '1596179142wVxEg1tR.png', '15961791430wBNgwMh.jpg', NULL, NULL, NULL, NULL, NULL, 10, 0, '<br>', NULL, '<br>', 1, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2020-07-31 07:05:42', '2020-07-31 07:05:43', 0, NULL, NULL, NULL, 0, 0, '1596179142light_brick.jpg', NULL);
INSERT INTO `products` VALUES (189, 'eyK9818dvI', 'normal', NULL, 0, 17, NULL, NULL, NULL, 'Floor-1', 'floor-1-eyk9818dvi', '1596209880I7tD1gwA.png', '1596209882PuggtJAC.jpg', NULL, NULL, NULL, NULL, NULL, 10, 9, '<br>', NULL, '<br>', 1, 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2020-07-31 15:38:00', '2020-07-31 16:10:23', 0, NULL, NULL, NULL, 0, 0, '1596209880hardwood.png', NULL);
INSERT INTO `products` VALUES (190, 'mi74445bHf', 'normal', NULL, 0, 16, 22, NULL, NULL, 'Door', 'door-mi74445bhf', '15962145459Yx1meiR.png', '159621454649HKKrzp.jpg', '1596214545closed-door28x80_baked.js', NULL, NULL, NULL, NULL, 10, 9, '<br>', NULL, '<br>', 1, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2020-07-31 16:55:45', '2020-07-31 16:55:46', 0, NULL, NULL, NULL, 0, 0, NULL, 'closed-door28x80_baked.png');
INSERT INTO `products` VALUES (191, 'Vwo2701BJa', 'normal', NULL, 0, 17, NULL, NULL, NULL, 'Floor-001', 'floor-001-vwo2701bja', '15962227605MwtEQ3O.png', '1596222760FkOfqKe0.jpg', NULL, NULL, NULL, NULL, NULL, 1, 1, '<br>', NULL, '<br>', 1, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2020-07-31 19:12:40', '2020-07-31 19:12:40', 0, NULL, NULL, NULL, 0, 0, '1596222760light_fine_wood.jpg', NULL);

-- ----------------------------
-- Table structure for ratings
-- ----------------------------
DROP TABLE IF EXISTS `ratings`;
CREATE TABLE `ratings`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `rating` tinyint(2) NOT NULL,
  `review_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for replies
-- ----------------------------
DROP TABLE IF EXISTS `replies`;
CREATE TABLE `replies`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) UNSIGNED NOT NULL,
  `comment_id` int(191) UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for reports
-- ----------------------------
DROP TABLE IF EXISTS `reports`;
CREATE TABLE `reports`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NOT NULL,
  `product_id` int(192) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `subtitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of reviews
-- ----------------------------
INSERT INTO `reviews` VALUES (4, '1557343012img.jpg', 'Jhon Smith', 'CEO & Founder', 'Lorem ipsum dolor sit amet, consectetur elitad adipiscing Cras non placerat mi.');
INSERT INTO `reviews` VALUES (5, '1557343018img.jpg', 'Jhon Smith', 'CEO & Founder', 'Lorem ipsum dolor sit amet, consectetur elitad adipiscing Cras non placerat mi.');
INSERT INTO `reviews` VALUES (6, '1557343024img.jpg', 'Jhon Smith', 'CEO & Founder', 'Lorem ipsum dolor sit amet, consectetur elitad adipiscing Cras non placerat mi.');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `section` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (16, 'Manager', 'orders , products , affilate_products , customers , vendors , vendor_subscription_plans , categories , bulk_product_upload , product_discussion , set_coupons , blog , messages , general_settings , home_page_settings , menu_page_settings , emails_settings , payment_settings , social_settings , language_settings , seo_tools , subscribers , interior_designs');
INSERT INTO `roles` VALUES (17, 'Moderator', 'orders , products , customers , vendors , categories , blog , messages , home_page_settings , payment_settings , social_settings , language_settings , seo_tools , subscribers');
INSERT INTO `roles` VALUES (18, 'Staff', 'orders , products , vendors , vendor_subscription_plans , categories , blog , home_page_settings , menu_page_settings , language_settings , seo_tools , subscribers');

-- ----------------------------
-- Table structure for seotools
-- ----------------------------
DROP TABLE IF EXISTS `seotools`;
CREATE TABLE `seotools`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `google_analytics` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `meta_keys` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of seotools
-- ----------------------------
INSERT INTO `seotools` VALUES (1, '<script>//Google Analytics Scriptfffffffffffffffffffffffssssfffffs</script>', 'Genius,Ocean,Sea,Etc,Genius,Ocean,SeaGenius,Ocean,Sea,Etc,Genius,Ocean,SeaGenius,Ocean,Sea,Etc,Genius,Ocean,Sea');

-- ----------------------------
-- Table structure for services
-- ----------------------------
DROP TABLE IF EXISTS `services`;
CREATE TABLE `services`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of services
-- ----------------------------
INSERT INTO `services` VALUES (2, 0, 'FREE SHIPPING', 'Free Shipping All Order', '1561348133service1.png');
INSERT INTO `services` VALUES (3, 0, 'PAYMENT METHOD', 'Secure Payment', '1561348138service2.png');
INSERT INTO `services` VALUES (4, 0, '30 DAY RETURNS', '30-Day Return Policy', '1561348143service3.png');
INSERT INTO `services` VALUES (5, 0, 'HELP CENTER', '24/7 Support System', '1561348147service4.png');
INSERT INTO `services` VALUES (6, 13, 'FREE SHIPPING', 'Free Shipping All Order', '1563247602brand1.png');
INSERT INTO `services` VALUES (7, 13, 'PAYMENT METHOD', 'Secure Payment', '1563247614brand2.png');
INSERT INTO `services` VALUES (8, 13, '30 DAY RETURNS', '30-Day Return Policy', '1563247620brand3.png');
INSERT INTO `services` VALUES (9, 13, 'HELP CENTER', '24/7 Support System', '1563247670brand4.png');

-- ----------------------------
-- Table structure for shippings
-- ----------------------------
DROP TABLE IF EXISTS `shippings`;
CREATE TABLE `shippings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `title` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `subtitle` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `price` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shippings
-- ----------------------------
INSERT INTO `shippings` VALUES (1, 0, 'Free Shipping', '(10 - 12 days)', 0);
INSERT INTO `shippings` VALUES (2, 0, 'Express Shipping', '(5 - 6 days)', 10);

-- ----------------------------
-- Table structure for sliders
-- ----------------------------
DROP TABLE IF EXISTS `sliders`;
CREATE TABLE `sliders`  (
  `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subtitle_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `subtitle_size` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `subtitle_color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `subtitle_anime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `title_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `title_size` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `title_color` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `title_anime` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `details_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `details_size` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `details_color` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `details_anime` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `link` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sliders
-- ----------------------------
INSERT INTO `sliders` VALUES (8, 'World Fashion', '24', '#ffffff', 'slideInUp', 'Get Up to 40% Off', '60', '#ffffff', 'slideInDown', 'Highlight your personality  and look with these fabulous and exquisite fashion.', '16', '#ffffff', 'slideInRight', '1564224870012.jpg', 'slide-three', 'https://www.google.com/');
INSERT INTO `sliders` VALUES (9, 'World Fashion', '24', '#ffffff', 'slideInUp', 'Get Up to 40% Off', '60', '#ffffff', 'slideInDown', 'Highlight your personality  and look with these fabulous and exquisite fashion.', '16', '#ffffff', 'slideInDown', '1564224753007.jpg', 'slide-one', 'https://www.google.com/');
INSERT INTO `sliders` VALUES (10, 'World Fashion', '24', '#c32d2d', 'slideInUp', 'Get Up to 40% Off', '60', '#bc2727', 'slideInDown', 'Highlight your personality  and look with these fabulous and exquisite fashion.', '16', '#c51d1d', 'slideInLeft', '156422490902.jpg', 'slide-one', 'https://www.google.com/');

-- ----------------------------
-- Table structure for social_providers
-- ----------------------------
DROP TABLE IF EXISTS `social_providers`;
CREATE TABLE `social_providers`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NOT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for socialsettings
-- ----------------------------
DROP TABLE IF EXISTS `socialsettings`;
CREATE TABLE `socialsettings`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `facebook` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gplus` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `twitter` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkedin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dribble` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `f_status` tinyint(4) NOT NULL DEFAULT 1,
  `g_status` tinyint(4) NOT NULL DEFAULT 1,
  `t_status` tinyint(4) NOT NULL DEFAULT 1,
  `l_status` tinyint(4) NOT NULL DEFAULT 1,
  `d_status` tinyint(4) NOT NULL DEFAULT 1,
  `f_check` tinyint(10) NULL DEFAULT NULL,
  `g_check` tinyint(10) NULL DEFAULT NULL,
  `fclient_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `fclient_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `fredirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `gclient_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `gclient_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `gredirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of socialsettings
-- ----------------------------
INSERT INTO `socialsettings` VALUES (1, 'https://www.facebook.com/', 'https://plus.google.com/', 'https://twitter.com/', 'https://www.linkedin.com/', 'https://dribbble.com/', 1, 1, 1, 1, 1, 1, 1, '503140663460329', 'f66cd670ec43d14209a2728af26dcc43', 'https://localhost/ecommerce-laravel/auth/facebook/callback', '904681031719-sh1aolu42k7l93ik0bkiddcboghbpcfi.apps.googleusercontent.com', 'yGBWmUpPtn5yWhDAsXnswEX3', 'http://localhost/ecommerce-laravel/auth/google/callback');

-- ----------------------------
-- Table structure for subcategories
-- ----------------------------
DROP TABLE IF EXISTS `subcategories`;
CREATE TABLE `subcategories`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `category_id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of subcategories
-- ----------------------------
INSERT INTO `subcategories` VALUES (2, 4, 'TELEVISION', 'television', 1);
INSERT INTO `subcategories` VALUES (3, 4, 'REFRIGERATOR', 'refrigerator', 1);
INSERT INTO `subcategories` VALUES (6, 5, 'ACCESSORIES', 'accessories', 1);
INSERT INTO `subcategories` VALUES (7, 5, 'BAGS', 'bags', 1);
INSERT INTO `subcategories` VALUES (9, 5, 'SHOES', 'shoes', 1);
INSERT INTO `subcategories` VALUES (18, 16, 'Item', '0', 1);
INSERT INTO `subcategories` VALUES (19, 16, 'FloorItem', '1', 1);
INSERT INTO `subcategories` VALUES (20, 16, 'WallItem', '2', 1);
INSERT INTO `subcategories` VALUES (21, 16, 'RoofItem', '4', 1);
INSERT INTO `subcategories` VALUES (22, 16, 'InWallFloorItem', '7', 1);
INSERT INTO `subcategories` VALUES (23, 16, 'OnFloorItem', '8', 1);
INSERT INTO `subcategories` VALUES (24, 16, 'WallFloorItem', '9', 1);
INSERT INTO `subcategories` VALUES (25, 16, 'InWallItem', '3', 1);

-- ----------------------------
-- Table structure for subscribers
-- ----------------------------
DROP TABLE IF EXISTS `subscribers`;
CREATE TABLE `subscribers`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for subscriptions
-- ----------------------------
DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE `subscriptions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL DEFAULT 0,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of subscriptions
-- ----------------------------
INSERT INTO `subscriptions` VALUES (5, 'Standard', '$', 'NGN', 60, 45, 25, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>');
INSERT INTO `subscriptions` VALUES (6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>');
INSERT INTO `subscriptions` VALUES (7, 'Unlimited', '$', 'USD', 250, 365, 0, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>');
INSERT INTO `subscriptions` VALUES (8, 'Basic', '$', 'USD', 0, 30, 0, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>');

-- ----------------------------
-- Table structure for user_notifications
-- ----------------------------
DROP TABLE IF EXISTS `user_notifications`;
CREATE TABLE `user_notifications`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NOT NULL,
  `order_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for user_subscriptions
-- ----------------------------
DROP TABLE IF EXISTS `user_subscriptions`;
CREATE TABLE `user_subscriptions`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NOT NULL,
  `subscription_id` int(191) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL DEFAULT 0,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Free',
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `payment_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_subscriptions
-- ----------------------------
INSERT INTO `user_subscriptions` VALUES (81, 27, 5, 'Standard', '$', 'NGN', 60, 45, 25, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>', 'Paystack', '688094995', NULL, '2019-10-09 13:32:57', '2019-10-09 13:32:57', 1, NULL);
INSERT INTO `user_subscriptions` VALUES (84, 13, 5, 'Standard', '$', 'NGN', 60, 45, 500, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>', 'Paystack', '242099342', NULL, '2019-10-09 18:35:29', '2019-10-09 18:35:29', 1, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `zip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fax` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `is_provider` tinyint(10) NOT NULL DEFAULT 0,
  `status` tinyint(10) NOT NULL DEFAULT 0,
  `verification_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `email_verified` enum('Yes','No') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `affilate_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `affilate_income` double NOT NULL DEFAULT 0,
  `shop_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `owner_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `shop_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `shop_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `reg_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `shop_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `shop_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `shop_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `f_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `g_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `t_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `l_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `is_vendor` tinyint(1) NOT NULL DEFAULT 0,
  `f_check` tinyint(1) NOT NULL DEFAULT 0,
  `g_check` tinyint(1) NOT NULL DEFAULT 0,
  `t_check` tinyint(1) NOT NULL DEFAULT 0,
  `l_check` tinyint(1) NOT NULL DEFAULT 0,
  `mail_sent` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_cost` double NOT NULL DEFAULT 0,
  `current_balance` double NOT NULL DEFAULT 0,
  `date` date NULL DEFAULT NULL,
  `ban` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (13, 'Vendor', '1557677677bouquet_PNG62.png', '1234', 'Washington, DC', 'Algeria', 'Space Needle 400 Broad St, Seattles', '3453453345453411', '23123121', 'vendor@gmail.com', '$2y$10$.4NrvXAeyToa4x07EkFvS.XIUEc/aXGsxe1onkQ.Udms4Sl2W9ZYq', 'gFLzrAKKi2usJZCKG4UYcmwp5oem396EtKTCuVqqLTCphxLrgFJ0mT2eLAUF', '2018-03-07 10:05:44', '2020-07-29 21:44:32', 0, 2, '$2y$10$oIf1at.0LwscVwaX/8h.WuSwMKEAAsn8EJ.9P7mWzNUFIcEBQs8ry', 'Yes', '$2y$10$oIf1at.0LwscVwaX/8h.WuSwMKEAAsn8EJ.9P7mWzNUFIcEBQs8rysdfsdfds', 5000, 'Test Stores', 'User', '43543534', 'Space Needle 400 Broad St, Seattles', 'asdasd', 'sdf', '<br>', '15960589652246820_thumbnail1.jpg', 'FaceBook', 'GooglePlus', 'Twitter', 'LickedIn', 2, 0, 0, 0, 0, 1, 0, 4978.02, '2019-11-24', 0);
INSERT INTO `users` VALUES (22, 'User', NULL, '1231', 'Test City', 'United States', 'Test Address', '34534534534', '34534534534', 'user@gmail.com', '$2y$10$.4NrvXAeyToa4x07EkFvS.XIUEc/aXGsxe1onkQ.Udms4Sl2W9ZYq', 'SQnJWlujk3AOb4yieoQ056a7DhByJqtwIhfUw0GTLvSgf1AVTxD0SSin2dej', '2019-06-20 04:26:24', '2020-01-31 17:39:19', 0, 0, '1edae93935fba69d9542192fb854a80a', 'Yes', '8f09b9691613ecb8c3f7e36e34b97b80', 4963.6900000000005, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0);
INSERT INTO `users` VALUES (27, 'Test User', NULL, NULL, NULL, NULL, 'Space Needle 400 Broad St, Seattles', '34534534', NULL, 'junajunnun@gmail.com', '$2y$10$pxNqceuvTvYLuwA.gZ15aejOTtXGHrDT7t2m8wfIZhNO1e52z7aLS', 'RdBI4RFgbKUzSDCo8mhI3LSz4oXURe8RNUizf7DXUEIO4sdVF35qJlLleDHn', '2019-10-04 20:15:08', '2020-03-22 01:09:46', 0, 0, '0521bba4c819528b6a18a581a5842f17', 'Yes', 'bb9d23401cd70f11998fe36ea7677797', 0, 'Test Store', 'User', '43543534', 'Space Needle 400 Broad St, Seattles', 'asdasd', 'ds', '<br>', NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, 0, 1, 0, 0, '2019-11-24', 0);
INSERT INTO `users` VALUES (28, 'User', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'junnun@gmail.com', '$2y$10$YDfElg7O3K6eQK5enu.TBOyo.8TIr6Ynf9hFQ8dsIDeWAfmmg6hA.', 'pNFebTvEQ3jRaky9p7XnCetHs9aNFFG7nqRFho0U7nWrgT7phS6MoX8f9EYz', '2019-10-12 21:39:13', '2019-10-12 21:39:13', 0, 0, '8036978c6d71501e893ba7d3f3ecc15d', 'Yes', '33899bafa30292165430cb90b545728a', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0);
INSERT INTO `users` VALUES (29, 'HI', NULL, NULL, NULL, NULL, 'xyz', '12345678901', NULL, 'hi@gmail.com', '$2y$10$Z2KZmBrmjFpj8Bu1QsvGdOBGbNxxoctcliFhFUO85lAdIkpySPH7y', 'dQRTM5SRhlgnBBykx7PfiIovYbDIzHUyjNPI7eKYHJR314UcNwglHSGEF6Gf', '2020-07-29 23:30:23', '2020-07-29 23:30:24', 0, 0, 'afa886173d23e9d8190b581aa2788b3f', 'Yes', '1e200d00494c55b6c2f747a4779a928f', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0);

-- ----------------------------
-- Table structure for vendor_orders
-- ----------------------------
DROP TABLE IF EXISTS `vendor_orders`;
CREATE TABLE `vendor_orders`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NOT NULL,
  `order_id` int(191) NOT NULL,
  `qty` int(191) NOT NULL,
  `price` double NOT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','processing','completed','declined','on delivery') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for verifications
-- ----------------------------
DROP TABLE IF EXISTS `verifications`;
CREATE TABLE `verifications`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NOT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` enum('Pending','Verified','Declined') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `admin_warning` tinyint(1) NOT NULL DEFAULT 0,
  `warning_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of verifications
-- ----------------------------
INSERT INTO `verifications` VALUES (4, 13, '1573723849Baby.tux-800x800.png,1573723849Baby.tux-800x800.png', 'Verified', 'TEst', 0, NULL, '2019-11-13 19:30:49', '2019-11-13 19:34:06');

-- ----------------------------
-- Table structure for wishlists
-- ----------------------------
DROP TABLE IF EXISTS `wishlists`;
CREATE TABLE `wishlists`  (
  `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(191) UNSIGNED NOT NULL,
  `product_id` int(191) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wishlists
-- ----------------------------
INSERT INTO `wishlists` VALUES (1, 22, 96);
INSERT INTO `wishlists` VALUES (2, 22, 97);
INSERT INTO `wishlists` VALUES (3, 22, 100);

-- ----------------------------
-- Table structure for withdraws
-- ----------------------------
DROP TABLE IF EXISTS `withdraws`;
CREATE TABLE `withdraws`  (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NULL DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `acc_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `iban` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `acc_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `swift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `reference` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `amount` float NULL DEFAULT NULL,
  `fee` float NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` enum('pending','completed','rejected') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'pending',
  `type` enum('user','vendor') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
