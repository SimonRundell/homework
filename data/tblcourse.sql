/*
 Navicat Premium Data Transfer

 Source Server         : homework.exeter-itdd.com
 Source Server Type    : MySQL
 Source Server Version : 80028 (8.0.28-0ubuntu0.20.04.3)
 Source Host           : mysql.dpdd.examrevision.online:3306
 Source Schema         : homework_exeter_itdd

 Target Server Type    : MySQL
 Target Server Version : 80028 (8.0.28-0ubuntu0.20.04.3)
 File Encoding         : 65001

 Date: 28/09/2025 09:22:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tblcourse
-- ----------------------------
DROP TABLE IF EXISTS `tblcourse`;
CREATE TABLE `tblcourse`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `taughtBy` int NOT NULL DEFAULT 0,
  `courseName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `year` int NOT NULL DEFAULT 1,
  `level` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '3',
  `group` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
