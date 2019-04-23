
-- ----------------------------
-- Table structure for sd_template
-- ----------------------------
DROP TABLE IF EXISTS `sd_template`;
CREATE TABLE `sd_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `template` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `thumb` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `libs` varchar(140) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 155 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sd_template
-- ----------------------------

-- ----------------------------
-- Table structure for sd_template_class
-- ----------------------------
DROP TABLE IF EXISTS `sd_template_class`;
CREATE TABLE `sd_template_class`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sd_template_class
-- ----------------------------
INSERT INTO `sd_template_class` VALUES (1, 'business', '商务');
INSERT INTO `sd_template_class` VALUES (2, 'charts', '统计图');
INSERT INTO `sd_template_class` VALUES (3, 'engineering', '工程');
INSERT INTO `sd_template_class` VALUES (4, 'flowcharts', '流程图');
INSERT INTO `sd_template_class` VALUES (5, 'layout', '布局');
INSERT INTO `sd_template_class` VALUES (6, 'maps', '思维导图');
INSERT INTO `sd_template_class` VALUES (7, 'software', '软件');
INSERT INTO `sd_template_class` VALUES (8, 'tables', '表格');
INSERT INTO `sd_template_class` VALUES (9, 'uml', 'UML');
INSERT INTO `sd_template_class` VALUES (10, 'venn', '维恩图');
INSERT INTO `sd_template_class` VALUES (11, 'network', '网络拓扑图');
INSERT INTO `sd_template_class` VALUES (12, 'gcp', '谷歌云平台');
INSERT INTO `sd_template_class` VALUES (13, 'other', '其他');