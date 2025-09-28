/*
 Navicat Premium Data Transfer

 Source Server         : LOCALHOST
 Source Server Type    : MySQL
 Source Server Version : 80403 (8.4.3)
 Source Host           : localhost:3306
 Source Schema         : homework

 Target Server Type    : MySQL
 Target Server Version : 80403 (8.4.3)
 File Encoding         : 65001

 Date: 27/09/2025 22:00:44
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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblcourse
-- ----------------------------
INSERT INTO `tblcourse` VALUES (1, 1, 'Certificate in Understanding Coding', 1, '2', 'B');
INSERT INTO `tblcourse` VALUES (2, 1, 'TLevel DSD', 1, '3', 'A');
INSERT INTO `tblcourse` VALUES (3, 1, 'TLevel DSD', 1, '3', 'B');
INSERT INTO `tblcourse` VALUES (4, 1, 'TLevel DPDD', 2, '3', 'A');
INSERT INTO `tblcourse` VALUES (5, 1, 'BTec IT', 2, '3', 'A');

-- ----------------------------
-- Table structure for tblhomeworkset
-- ----------------------------
DROP TABLE IF EXISTS `tblhomeworkset`;
CREATE TABLE `tblhomeworkset`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `courseId` int NOT NULL,
  `dateSet` datetime NOT NULL,
  `dateDue` datetime NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `completed` int NOT NULL DEFAULT 0 COMMENT '0 = no 1 = yes ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblhomeworkset
-- ----------------------------
INSERT INTO `tblhomeworkset` VALUES (10, 1, '2025-09-01 17:09:07', '2024-09-15 23:59:00', 'Lesson 1', 0);
INSERT INTO `tblhomeworkset` VALUES (11, 1, '2025-09-27 17:13:31', '2025-10-03 00:00:00', 'Lesson 2', 0);
INSERT INTO `tblhomeworkset` VALUES (12, 1, '2025-09-27 17:17:02', '2025-09-16 09:00:00', 'Lesson 3', 0);
INSERT INTO `tblhomeworkset` VALUES (13, 1, '2025-09-27 17:19:24', '2024-09-17 09:00:00', 'Lesson 4', 0);
INSERT INTO `tblhomeworkset` VALUES (14, 1, '2025-09-27 17:20:38', '2025-09-21 09:00:00', 'Lesson 5', 0);
INSERT INTO `tblhomeworkset` VALUES (15, 1, '2025-09-27 17:22:33', '2025-09-24 09:00:00', 'Lesson 7', 0);
INSERT INTO `tblhomeworkset` VALUES (16, 2, '2025-09-27 17:27:55', '2025-09-07 09:09:00', 'Problem Solving Lesson 1', 0);
INSERT INTO `tblhomeworkset` VALUES (17, 2, '2025-09-27 17:29:58', '2025-09-10 14:00:00', 'Digital Environments Lesson 1', 0);
INSERT INTO `tblhomeworkset` VALUES (18, 2, '2025-09-27 17:33:16', '2025-09-24 09:00:00', 'Problem Solving Lesson 2', 0);
INSERT INTO `tblhomeworkset` VALUES (19, 2, '2025-09-27 17:52:46', '2025-10-01 09:00:00', 'Problem Solving Lesson 3', 0);
INSERT INTO `tblhomeworkset` VALUES (20, 3, '2025-09-27 17:54:11', '2025-09-14 09:00:00', 'Problem Solving Lesson 1', 0);
INSERT INTO `tblhomeworkset` VALUES (21, 3, '2025-09-27 17:58:18', '2025-09-14 09:00:00', 'Digital Environments Lesson 1', 0);
INSERT INTO `tblhomeworkset` VALUES (22, 3, '2025-09-27 18:00:02', '2025-09-21 09:00:00', 'Digital Environments Lesson 2', 0);
INSERT INTO `tblhomeworkset` VALUES (23, 3, '2025-09-27 18:01:29', '2025-09-29 09:00:00', 'Problem Solving Lesson 2', 0);
INSERT INTO `tblhomeworkset` VALUES (24, 3, '2025-09-27 18:14:27', '2025-10-06 09:00:00', 'Problem Solving Lesson 3', 0);
INSERT INTO `tblhomeworkset` VALUES (25, 4, '2025-09-27 18:16:11', '2025-09-14 09:00:00', 'Project Lesson 1', 0);
INSERT INTO `tblhomeworkset` VALUES (26, 4, '2025-09-27 18:18:56', '2025-09-18 09:00:00', 'Testing Lesson 1', 0);
INSERT INTO `tblhomeworkset` VALUES (27, 4, '2025-09-27 18:21:38', '2025-09-22 09:00:00', 'User Requirements Lesson 2', 0);
INSERT INTO `tblhomeworkset` VALUES (28, 4, '2025-09-27 18:23:37', '2025-09-25 09:00:00', 'Testing Lesson 2', 0);
INSERT INTO `tblhomeworkset` VALUES (29, 5, '2025-09-27 18:28:46', '2025-09-16 09:00:00', 'Mobile Apps Lesson 1', 0);
INSERT INTO `tblhomeworkset` VALUES (30, 5, '2025-09-27 18:30:51', '2025-09-18 09:00:00', 'Mobile Apps Lesson 2', 0);
INSERT INTO `tblhomeworkset` VALUES (31, 5, '2025-09-27 18:32:30', '2025-09-23 09:00:00', 'Mobile Apps Lesson 3', 0);
INSERT INTO `tblhomeworkset` VALUES (32, 5, '2025-09-27 18:36:26', '2025-09-25 09:00:00', 'Mobile Apps Lesson 4', 0);
INSERT INTO `tblhomeworkset` VALUES (33, 5, '2025-09-27 18:38:13', '2025-09-25 09:00:00', 'Mobile Apps Lesson 5', 0);

-- ----------------------------
-- Table structure for tblhomeworktracker
-- ----------------------------
DROP TABLE IF EXISTS `tblhomeworktracker`;
CREATE TABLE `tblhomeworktracker`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `homeworksetId` int NOT NULL,
  `studentId` int NOT NULL,
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'X',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 663 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblhomeworktracker
-- ----------------------------
INSERT INTO `tblhomeworktracker` VALUES (63, 10, 1, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (64, 10, 2, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (65, 10, 3, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (66, 10, 4, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (67, 10, 5, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (68, 10, 6, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (69, 10, 7, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (70, 10, 8, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (71, 10, 9, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (72, 10, 10, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (73, 10, 11, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (74, 10, 12, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (75, 10, 13, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (76, 10, 14, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (77, 10, 15, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (78, 10, 16, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (79, 10, 17, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (80, 10, 18, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (81, 10, 19, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (82, 10, 20, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (94, 11, 1, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (95, 11, 2, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (96, 11, 3, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (97, 11, 4, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (98, 11, 5, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (99, 11, 6, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (100, 11, 7, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (101, 11, 8, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (102, 11, 9, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (103, 11, 10, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (104, 11, 11, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (105, 11, 12, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (106, 11, 13, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (107, 11, 14, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (108, 11, 15, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (109, 11, 16, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (110, 11, 17, 'R', NULL);
INSERT INTO `tblhomeworktracker` VALUES (111, 11, 18, 'R', NULL);
INSERT INTO `tblhomeworktracker` VALUES (112, 11, 19, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (113, 11, 20, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (125, 12, 1, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (126, 12, 2, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (127, 12, 3, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (128, 12, 4, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (129, 12, 5, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (130, 12, 6, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (131, 12, 7, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (132, 12, 8, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (133, 12, 9, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (134, 12, 10, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (135, 12, 11, 'R', NULL);
INSERT INTO `tblhomeworktracker` VALUES (136, 12, 12, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (137, 12, 13, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (138, 12, 14, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (139, 12, 15, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (140, 12, 16, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (141, 12, 17, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (142, 12, 18, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (143, 12, 19, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (144, 12, 20, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (156, 13, 1, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (157, 13, 2, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (158, 13, 3, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (159, 13, 4, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (160, 13, 5, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (161, 13, 6, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (162, 13, 7, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (163, 13, 8, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (164, 13, 9, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (165, 13, 10, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (166, 13, 11, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (167, 13, 12, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (168, 13, 13, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (169, 13, 14, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (170, 13, 15, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (171, 13, 16, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (172, 13, 17, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (173, 13, 18, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (174, 13, 19, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (175, 13, 20, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (187, 14, 1, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (188, 14, 2, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (189, 14, 3, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (190, 14, 4, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (191, 14, 5, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (192, 14, 6, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (193, 14, 7, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (194, 14, 8, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (195, 14, 9, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (196, 14, 10, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (197, 14, 11, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (198, 14, 12, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (199, 14, 13, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (200, 14, 14, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (201, 14, 15, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (202, 14, 16, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (203, 14, 17, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (204, 14, 18, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (205, 14, 19, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (206, 14, 20, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (218, 15, 1, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (219, 15, 2, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (220, 15, 3, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (221, 15, 4, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (222, 15, 5, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (223, 15, 6, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (224, 15, 7, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (225, 15, 8, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (226, 15, 9, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (227, 15, 10, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (228, 15, 11, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (229, 15, 12, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (230, 15, 13, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (231, 15, 14, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (232, 15, 15, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (233, 15, 16, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (234, 15, 17, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (235, 15, 18, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (236, 15, 19, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (237, 15, 20, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (249, 16, 40, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (250, 16, 41, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (251, 16, 42, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (252, 16, 43, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (253, 16, 44, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (254, 16, 45, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (255, 16, 46, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (256, 16, 47, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (257, 16, 48, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (258, 16, 49, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (259, 16, 50, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (260, 16, 51, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (261, 16, 52, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (262, 16, 53, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (263, 16, 54, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (264, 16, 55, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (265, 16, 56, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (280, 17, 40, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (281, 17, 41, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (282, 17, 42, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (283, 17, 43, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (284, 17, 44, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (285, 17, 45, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (286, 17, 46, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (287, 17, 47, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (288, 17, 48, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (289, 17, 49, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (290, 17, 50, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (291, 17, 51, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (292, 17, 52, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (293, 17, 53, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (294, 17, 54, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (295, 17, 55, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (296, 17, 56, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (311, 18, 40, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (312, 18, 41, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (313, 18, 42, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (314, 18, 43, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (315, 18, 44, 'R', NULL);
INSERT INTO `tblhomeworktracker` VALUES (316, 18, 45, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (317, 18, 46, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (318, 18, 47, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (319, 18, 48, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (320, 18, 49, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (321, 18, 50, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (322, 18, 51, 'R', NULL);
INSERT INTO `tblhomeworktracker` VALUES (323, 18, 52, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (324, 18, 53, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (325, 18, 54, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (326, 18, 55, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (327, 18, 56, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (342, 19, 40, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (343, 19, 41, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (344, 19, 42, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (345, 19, 43, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (346, 19, 44, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (347, 19, 45, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (348, 19, 46, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (349, 19, 47, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (350, 19, 48, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (351, 19, 49, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (352, 19, 50, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (353, 19, 51, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (354, 19, 52, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (355, 19, 53, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (356, 19, 54, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (357, 19, 55, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (358, 19, 56, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (373, 20, 57, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (374, 20, 58, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (375, 20, 59, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (376, 20, 60, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (377, 20, 61, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (378, 20, 62, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (379, 20, 63, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (380, 20, 64, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (381, 20, 65, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (382, 20, 66, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (383, 20, 67, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (384, 20, 68, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (388, 21, 57, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (389, 21, 58, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (390, 21, 59, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (391, 21, 60, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (392, 21, 61, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (393, 21, 62, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (394, 21, 63, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (395, 21, 64, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (396, 21, 65, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (397, 21, 66, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (398, 21, 67, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (399, 21, 68, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (403, 22, 57, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (404, 22, 58, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (405, 22, 59, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (406, 22, 60, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (407, 22, 61, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (408, 22, 62, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (409, 22, 63, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (410, 22, 64, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (411, 22, 65, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (412, 22, 66, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (413, 22, 67, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (414, 22, 68, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (418, 23, 57, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (419, 23, 58, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (420, 23, 59, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (421, 23, 60, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (422, 23, 61, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (423, 23, 62, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (424, 23, 63, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (425, 23, 64, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (426, 23, 65, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (427, 23, 66, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (428, 23, 67, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (429, 23, 68, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (433, 24, 57, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (434, 24, 58, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (435, 24, 59, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (436, 24, 60, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (437, 24, 61, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (438, 24, 62, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (439, 24, 63, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (440, 24, 64, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (441, 24, 65, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (442, 24, 66, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (443, 24, 67, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (444, 24, 68, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (448, 25, 69, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (449, 25, 70, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (450, 25, 71, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (451, 25, 72, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (452, 25, 73, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (453, 25, 74, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (454, 25, 75, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (455, 25, 76, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (456, 25, 77, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (457, 25, 78, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (458, 25, 79, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (459, 25, 80, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (460, 25, 81, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (461, 25, 82, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (462, 25, 83, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (463, 26, 69, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (464, 26, 70, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (465, 26, 71, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (466, 26, 72, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (467, 26, 73, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (468, 26, 74, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (469, 26, 75, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (470, 26, 76, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (471, 26, 77, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (472, 26, 78, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (473, 26, 79, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (474, 26, 80, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (475, 26, 81, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (476, 26, 82, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (477, 26, 83, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (478, 27, 69, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (479, 27, 70, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (480, 27, 71, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (481, 27, 72, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (482, 27, 73, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (483, 27, 74, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (484, 27, 75, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (485, 27, 76, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (486, 27, 77, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (487, 27, 78, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (488, 27, 79, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (489, 27, 80, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (490, 27, 81, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (491, 27, 82, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (492, 27, 83, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (493, 28, 69, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (494, 28, 70, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (495, 28, 71, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (496, 28, 72, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (497, 28, 73, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (498, 28, 74, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (499, 28, 75, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (500, 28, 76, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (501, 28, 77, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (502, 28, 78, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (503, 28, 79, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (504, 28, 80, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (505, 28, 81, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (506, 28, 82, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (507, 28, 83, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (508, 29, 21, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (509, 29, 22, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (510, 29, 23, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (511, 29, 24, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (512, 29, 25, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (513, 29, 26, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (514, 29, 27, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (515, 29, 28, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (516, 29, 29, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (517, 29, 30, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (518, 29, 31, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (519, 29, 32, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (520, 29, 33, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (521, 29, 34, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (522, 29, 35, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (523, 29, 36, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (524, 29, 37, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (525, 29, 38, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (526, 29, 39, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (539, 30, 21, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (540, 30, 22, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (541, 30, 23, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (542, 30, 24, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (543, 30, 25, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (544, 30, 26, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (545, 30, 27, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (546, 30, 28, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (547, 30, 29, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (548, 30, 30, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (549, 30, 31, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (550, 30, 32, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (551, 30, 33, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (552, 30, 34, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (553, 30, 35, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (554, 30, 36, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (555, 30, 37, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (556, 30, 38, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (557, 30, 39, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (570, 31, 21, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (571, 31, 22, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (572, 31, 23, 'R', NULL);
INSERT INTO `tblhomeworktracker` VALUES (573, 31, 24, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (574, 31, 25, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (575, 31, 26, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (576, 31, 27, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (577, 31, 28, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (578, 31, 29, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (579, 31, 30, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (580, 31, 31, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (581, 31, 32, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (582, 31, 33, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (583, 31, 34, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (584, 31, 35, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (585, 31, 36, 'R', NULL);
INSERT INTO `tblhomeworktracker` VALUES (586, 31, 37, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (587, 31, 38, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (588, 31, 39, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (601, 32, 21, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (602, 32, 22, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (603, 32, 23, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (604, 32, 24, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (605, 32, 25, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (606, 32, 26, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (607, 32, 27, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (608, 32, 28, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (609, 32, 29, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (610, 32, 30, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (611, 32, 31, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (612, 32, 32, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (613, 32, 33, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (614, 32, 34, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (615, 32, 35, 'C', NULL);
INSERT INTO `tblhomeworktracker` VALUES (616, 32, 36, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (617, 32, 37, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (618, 32, 38, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (619, 32, 39, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (632, 33, 21, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (633, 33, 22, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (634, 33, 23, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (635, 33, 24, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (636, 33, 25, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (637, 33, 26, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (638, 33, 27, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (639, 33, 28, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (640, 33, 29, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (641, 33, 30, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (642, 33, 31, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (643, 33, 32, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (644, 33, 33, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (645, 33, 34, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (646, 33, 35, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (647, 33, 36, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (648, 33, 37, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (649, 33, 38, 'X', NULL);
INSERT INTO `tblhomeworktracker` VALUES (650, 33, 39, 'X', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblstudents
-- ----------------------------
INSERT INTO `tblstudents` VALUES (1, '9900617550', 'AIROUD', 'GABRIEL', 1);
INSERT INTO `tblstudents` VALUES (2, '9900615739', 'BELINSKYI', 'OLEH', 1);
INSERT INTO `tblstudents` VALUES (3, '9900615595', 'FRY', 'CHARLIE LUIS ALAN', 1);
INSERT INTO `tblstudents` VALUES (4, '9900595936', 'HILL', 'EVAN', 1);
INSERT INTO `tblstudents` VALUES (5, '9900612877', 'HOPKINS', 'ELLIOT', 1);
INSERT INTO `tblstudents` VALUES (6, '9900612811', 'HUNT', 'TYLER ALEXANDER JOHN', 1);
INSERT INTO `tblstudents` VALUES (7, '9900614838', 'LIULICHEV', 'IVAN', 1);
INSERT INTO `tblstudents` VALUES (8, '9900601750', 'LOKUSOORIYA', 'HASAL BATHISA', 1);
INSERT INTO `tblstudents` VALUES (9, '9900615016', 'MARDELL', 'OLLIE', 1);
INSERT INTO `tblstudents` VALUES (10, '9900614817', 'MARUNYCH', 'ARTEM', 1);
INSERT INTO `tblstudents` VALUES (11, '9900613288', 'MODHWADIA', 'PALAK', 1);
INSERT INTO `tblstudents` VALUES (12, '9900588108', 'MOMAND', 'ISMATULLAH', 1);
INSERT INTO `tblstudents` VALUES (13, '9900615490', 'NICHOLAS', 'ROMEO', 1);
INSERT INTO `tblstudents` VALUES (14, '9900615811', 'SIFANA', 'ETHAN KUDAKWASHE', 1);
INSERT INTO `tblstudents` VALUES (15, '9900613976', 'SILVA-SHAW', 'IAN', 1);
INSERT INTO `tblstudents` VALUES (16, '9900616539', 'SOPER', 'IRIS', 1);
INSERT INTO `tblstudents` VALUES (17, '9900610673', 'STELL', 'CONNER', 1);
INSERT INTO `tblstudents` VALUES (18, '9900579598', 'SULEA', 'IONELA-MARIA', 1);
INSERT INTO `tblstudents` VALUES (19, '9900615292', 'TROWER', 'OLLIE', 1);
INSERT INTO `tblstudents` VALUES (20, '9900610962', 'WAKEHAM', 'NUNEZ', 1);
INSERT INTO `tblstudents` VALUES (21, '9900596803', 'AFONSO', 'DIOGO', 5);
INSERT INTO `tblstudents` VALUES (22, '9900601447', 'DIXON', 'CHRISTIAN', 5);
INSERT INTO `tblstudents` VALUES (23, '9900597104', 'DUFFIN-CHAMBERS', 'ZAC', 5);
INSERT INTO `tblstudents` VALUES (24, '9900586210', 'GABRIEL', 'HENRY EDMOND', 5);
INSERT INTO `tblstudents` VALUES (25, '9900595493', 'GRZESIAK', 'ALEC', 5);
INSERT INTO `tblstudents` VALUES (26, '9900596889', 'HUNT', 'THOMAS', 5);
INSERT INTO `tblstudents` VALUES (27, '9900602486', 'JANUSZEWSKI', 'JACOB', 5);
INSERT INTO `tblstudents` VALUES (28, '9900578767', 'MAYNE', 'JASPER', 5);
INSERT INTO `tblstudents` VALUES (29, '9900598624', 'MILLS', 'LEWIS', 5);
INSERT INTO `tblstudents` VALUES (30, '9900595967', 'PRIPA', 'ANDREI', 5);
INSERT INTO `tblstudents` VALUES (31, '9900578905', 'RICHARDSON', 'VAUGHAN', 5);
INSERT INTO `tblstudents` VALUES (32, '9900579592', 'RIDLER', 'ETHAN', 5);
INSERT INTO `tblstudents` VALUES (33, '9900593452', 'STAVES', 'NATHAN', 5);
INSERT INTO `tblstudents` VALUES (34, '9900579897', 'STOUT', 'MARCUS GENE MCKINLAY', 5);
INSERT INTO `tblstudents` VALUES (35, '9900583866', 'VALDER', 'JOSEPH EDWARD JOHN', 5);
INSERT INTO `tblstudents` VALUES (36, '9900576994', 'WALLACE', 'EZEKIEL', 5);
INSERT INTO `tblstudents` VALUES (37, '9900599642', 'WALLACE', 'ELLIOT JAMES', 5);
INSERT INTO `tblstudents` VALUES (38, '9900597741', 'WINNING', 'MATTHEW', 5);
INSERT INTO `tblstudents` VALUES (39, '9900597055', 'WOOLLATT', 'ALFRED', 5);
INSERT INTO `tblstudents` VALUES (40, '9900612789', 'AFZAAL', 'MOHAMMED AHAD', 2);
INSERT INTO `tblstudents` VALUES (41, '9900609850', 'BONET RAMIREZ', 'CESAR', 2);
INSERT INTO `tblstudents` VALUES (42, '9900598990', 'BROWN', 'ANTHONY', 2);
INSERT INTO `tblstudents` VALUES (43, '9900610916', 'CURTIS', 'BRADLEY', 2);
INSERT INTO `tblstudents` VALUES (44, '9900615522', 'DOWNHAM', 'LEWIS', 2);
INSERT INTO `tblstudents` VALUES (45, '9900618117', 'GLOVER', 'JACK', 2);
INSERT INTO `tblstudents` VALUES (46, '9900613202', 'HENDERSON', 'JAYDEN', 2);
INSERT INTO `tblstudents` VALUES (47, '9900615492', 'IDOWU', 'MATHEW', 2);
INSERT INTO `tblstudents` VALUES (48, '9900615015', 'LE ROUX', 'IDAN', 2);
INSERT INTO `tblstudents` VALUES (49, '9900613208', 'MACDONALD', 'HENRY', 2);
INSERT INTO `tblstudents` VALUES (50, '9900602904', 'MAKUMBE', 'NIGEL TASHINGA', 2);
INSERT INTO `tblstudents` VALUES (51, '9900611965', 'MUSCUTT', 'GEORGE', 2);
INSERT INTO `tblstudents` VALUES (52, '9900615213', 'OTOBO', 'PRINCESS', 2);
INSERT INTO `tblstudents` VALUES (53, '9900611388', 'PACAR', 'ZACK', 2);
INSERT INTO `tblstudents` VALUES (54, '9900611564', 'THOMAS', 'ELLIE JEAN', 2);
INSERT INTO `tblstudents` VALUES (55, '9900611238', 'WARRELL', 'AIDEN', 2);
INSERT INTO `tblstudents` VALUES (56, '9900577117', 'WILLIAMS', 'JAMES DAVID', 2);
INSERT INTO `tblstudents` VALUES (57, '9900607175', 'COLLINS', 'CALLUM', 3);
INSERT INTO `tblstudents` VALUES (58, '9900595313', 'COTTER', 'MORGAN GREY KYLE', 3);
INSERT INTO `tblstudents` VALUES (59, '9900615358', 'DAUNTON', 'BOBBY FOX', 3);
INSERT INTO `tblstudents` VALUES (60, '9900606252', 'HAWKINS', 'EDWARD ANDREW', 3);
INSERT INTO `tblstudents` VALUES (61, '9900610481', 'MIDDLETON', 'ROWAN JAMES ISAAC', 3);
INSERT INTO `tblstudents` VALUES (62, '9900613283', 'MOCNY', 'SZYMON', 3);
INSERT INTO `tblstudents` VALUES (63, '9900596955', 'NORTHAN', 'ISAAC JAMES', 3);
INSERT INTO `tblstudents` VALUES (64, '9900600269', 'OBRIEN', 'OWEN TERRENCE', 3);
INSERT INTO `tblstudents` VALUES (65, '9900614115', 'REGAN', 'VINCENT', 3);
INSERT INTO `tblstudents` VALUES (66, '9900593878', 'WALKER', 'BEA', 3);
INSERT INTO `tblstudents` VALUES (67, '9900603188', 'WELSH', 'HAYDON', 3);
INSERT INTO `tblstudents` VALUES (68, '9900598659', 'WHITE', 'ELISE PEGGY SAMANTHA', 3);
INSERT INTO `tblstudents` VALUES (69, '9900596081', 'ADAMS', 'BARNABY QUINN', 4);
INSERT INTO `tblstudents` VALUES (70, '9900595254', 'CLAYTON', 'JOSS OWEN', 4);
INSERT INTO `tblstudents` VALUES (71, '9900595027', 'HARDWARE', 'OWEN', 4);
INSERT INTO `tblstudents` VALUES (72, '9900595542', 'HLUSHKO', 'NATALIIA', 4);
INSERT INTO `tblstudents` VALUES (73, '9900595736', 'KAPUSTA', 'WIKTOR', 4);
INSERT INTO `tblstudents` VALUES (74, '9900593160', 'MARKS', 'GRACIE', 4);
INSERT INTO `tblstudents` VALUES (75, '9900600768', 'MUZOVAKA', 'TINOTENDA', 4);
INSERT INTO `tblstudents` VALUES (76, '9900582558', 'PICKERING', 'JAMES', 4);
INSERT INTO `tblstudents` VALUES (77, '9900579889', 'PORTER', 'ADAM', 4);
INSERT INTO `tblstudents` VALUES (78, '9900597594', 'SCOTT', 'MCKENZIE LEE', 4);
INSERT INTO `tblstudents` VALUES (79, '9900596856', 'TAYLOR', 'GABRIEL', 4);
INSERT INTO `tblstudents` VALUES (80, '9900593386', 'TRAN', 'ALEX', 4);
INSERT INTO `tblstudents` VALUES (81, '9900590953', 'WHITE', 'MILLER', 4);
INSERT INTO `tblstudents` VALUES (82, '9900597908', 'WYATT', 'DOMINIC GEORGE', 4);
INSERT INTO `tblstudents` VALUES (83, '9900583535', 'ZHOU', 'KEISON', 4);

-- ----------------------------
-- Table structure for tbluser
-- ----------------------------
DROP TABLE IF EXISTS `tbluser`;
CREATE TABLE `tbluser`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `passwordHash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `staffName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `departmentName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `admin` tinyint NOT NULL DEFAULT 0 COMMENT '1 = admin',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbluser
-- ----------------------------
INSERT INTO `tbluser` VALUES (1, 'simon@rundell.org.uk', '81dc9bdb52d04dc20036dbd8313ed055', 'Simon Rundell', 'ITDD', 1);
INSERT INTO `tbluser` VALUES (2, 'test@test.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Test User', 'ITDD', 0);

SET FOREIGN_KEY_CHECKS = 1;
