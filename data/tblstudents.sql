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

 Date: 28/09/2025 09:30:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tblstudents
-- ----------------------------
DROP TABLE IF EXISTS `tblstudents`;
CREATE TABLE `tblstudents`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `studentId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `firstName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `course` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
