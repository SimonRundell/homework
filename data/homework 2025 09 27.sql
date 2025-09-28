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

 Date: 27/09/2025 10:42:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tblcourse
-- ----------------------------
DROP TABLE IF EXISTS `tblcourse`;
CREATE TABLE `tblcourse`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `courseName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `year` int NOT NULL DEFAULT 1,
  `level` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '3',
  `group` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblcourse
-- ----------------------------
INSERT INTO `tblcourse` VALUES (1, 'Certificate in Understanding Coding', 1, '2', 'B');
INSERT INTO `tblcourse` VALUES (2, 'TLevel DSD', 1, '3', 'A');
INSERT INTO `tblcourse` VALUES (3, 'TLevel DSD', 1, '3', 'B');
INSERT INTO `tblcourse` VALUES (4, 'TLevel DPDD', 2, '3', 'A');
INSERT INTO `tblcourse` VALUES (5, 'BTec IT', 2, '3', 'A');

-- ----------------------------
-- Table structure for tblhomeworkset
-- ----------------------------
DROP TABLE IF EXISTS `tblhomeworkset`;
CREATE TABLE `tblhomeworkset`  (
  `id` int NOT NULL,
  `courseId` int NOT NULL,
  `dateSet` datetime NOT NULL,
  `dateDue` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblhomeworkset
-- ----------------------------

-- ----------------------------
-- Table structure for tblhomeworktracker
-- ----------------------------
DROP TABLE IF EXISTS `tblhomeworktracker`;
CREATE TABLE `tblhomeworktracker`  (
  `id` int NOT NULL,
  `homeworksetId` int NOT NULL,
  `studentId` int NOT NULL,
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'X',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblhomeworktracker
-- ----------------------------

-- ----------------------------
-- Table structure for tblstudents
-- ----------------------------
DROP TABLE IF EXISTS `tblstudents`;
CREATE TABLE `tblstudents`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `studentId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `firstName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `course` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblstudents
-- ----------------------------
INSERT INTO `tblstudents` VALUES (1, '9900617550', 'AIROUD', 'GABRIEL', 'L2 CODING');
INSERT INTO `tblstudents` VALUES (2, '9900615739', 'BELINSKYI', 'OLEH', 'L2 CODING');
INSERT INTO `tblstudents` VALUES (3, '9900615595', 'FRY', 'CHARLIE LUIS ALAN', 'L2 CODING');
INSERT INTO `tblstudents` VALUES (4, '9900595936', 'HILL', 'EVAN', 'L2 CODING');
INSERT INTO `tblstudents` VALUES (5, '9900612877', 'HOPKINS', 'ELLIOT', 'L2 CODING');
INSERT INTO `tblstudents` VALUES (6, '9900612811', 'HUNT', 'TYLER ALEXANDER JOHN', 'L2 CODING');
INSERT INTO `tblstudents` VALUES (7, '9900614838', 'LIULICHEV', 'IVAN', 'L2 CODING');
INSERT INTO `tblstudents` VALUES (8, '9900601750', 'LOKUSOORIYA', 'HASAL BATHISA', 'L2 CODING');
INSERT INTO `tblstudents` VALUES (9, '9900615016', 'MARDELL', 'OLLIE', 'L2 CODING');
INSERT INTO `tblstudents` VALUES (10, '9900614817', 'MARUNYCH', 'ARTEM', 'L2 CODING');
INSERT INTO `tblstudents` VALUES (11, '9900613288', 'MODHWADIA', 'PALAK', 'L2 CODING');
INSERT INTO `tblstudents` VALUES (12, '9900588108', 'MOMAND', 'ISMATULLAH', 'L2 CODING');
INSERT INTO `tblstudents` VALUES (13, '9900615490', 'NICHOLAS', 'ROMEO', 'L2 CODING');
INSERT INTO `tblstudents` VALUES (14, '9900615811', 'SIFANA', 'ETHAN KUDAKWASHE', 'L2 CODING');
INSERT INTO `tblstudents` VALUES (15, '9900613976', 'SILVA-SHAW', 'IAN', 'L2 CODING');
INSERT INTO `tblstudents` VALUES (16, '9900616539', 'SOPER', 'CODY', 'L2 CODING');
INSERT INTO `tblstudents` VALUES (17, '9900610673', 'STELL', 'CONNER', 'L2 CODING');
INSERT INTO `tblstudents` VALUES (18, '9900579598', 'SULEA', 'IONELA-MARIA', 'L2 CODING');
INSERT INTO `tblstudents` VALUES (19, '9900615292', 'TROWER', 'OLLIE', 'L2 CODING');
INSERT INTO `tblstudents` VALUES (20, '9900610962', 'WAKEHAM', 'NUNEZ', 'L2 CODING');
INSERT INTO `tblstudents` VALUES (21, '9900596803', 'AFONSO', 'DIOGO', 'BTEC IT Y2 MOBILE APPS');
INSERT INTO `tblstudents` VALUES (22, '9900601447', 'DIXON', 'CHRISTIAN', 'BTEC IT Y2 MOBILE APPS');
INSERT INTO `tblstudents` VALUES (23, '9900597104', 'DUFFIN-CHAMBERS', 'ZAC', 'BTEC IT Y2 MOBILE APPS');
INSERT INTO `tblstudents` VALUES (24, '9900586210', 'GABRIEL', 'HENRY EDMOND', 'BTEC IT Y2 MOBILE APPS');
INSERT INTO `tblstudents` VALUES (25, '9900595493', 'GRZESIAK', 'ALEC', 'BTEC IT Y2 MOBILE APPS');
INSERT INTO `tblstudents` VALUES (26, '9900596889', 'HUNT', 'THOMAS', 'BTEC IT Y2 MOBILE APPS');
INSERT INTO `tblstudents` VALUES (27, '9900602486', 'JANUSZEWSKI', 'JACOB', 'BTEC IT Y2 MOBILE APPS');
INSERT INTO `tblstudents` VALUES (28, '9900578767', 'MAYNE', 'JASPER', 'BTEC IT Y2 MOBILE APPS');
INSERT INTO `tblstudents` VALUES (29, '9900598624', 'MILLS', 'LEWIS', 'BTEC IT Y2 MOBILE APPS');
INSERT INTO `tblstudents` VALUES (30, '9900595967', 'PRIPA', 'ANDREI', 'BTEC IT Y2 MOBILE APPS');
INSERT INTO `tblstudents` VALUES (31, '9900578905', 'RICHARDSON', 'VAUGHAN', 'BTEC IT Y2 MOBILE APPS');
INSERT INTO `tblstudents` VALUES (32, '9900579592', 'RIDLER', 'ETHAN', 'BTEC IT Y2 MOBILE APPS');
INSERT INTO `tblstudents` VALUES (33, '9900593452', 'STAVES', 'NATHAN', 'BTEC IT Y2 MOBILE APPS');
INSERT INTO `tblstudents` VALUES (34, '9900579897', 'STOUT', 'MARCUS GENE MCKINLAY', 'BTEC IT Y2 MOBILE APPS');
INSERT INTO `tblstudents` VALUES (35, '9900583866', 'VALDER', 'JOSEPH EDWARD JOHN', 'BTEC IT Y2 MOBILE APPS');
INSERT INTO `tblstudents` VALUES (36, '9900576994', 'WALLACE', 'EZEKIEL', 'BTEC IT Y2 MOBILE APPS');
INSERT INTO `tblstudents` VALUES (37, '9900599642', 'WALLACE', 'ELLIOT JAMES', 'BTEC IT Y2 MOBILE APPS');
INSERT INTO `tblstudents` VALUES (38, '9900597741', 'WINNING', 'MATTHEW', 'BTEC IT Y2 MOBILE APPS');
INSERT INTO `tblstudents` VALUES (39, '9900597055', 'WOOLLATT', 'ALFRED', 'BTEC IT Y2 MOBILE APPS');
INSERT INTO `tblstudents` VALUES (40, '9900612789', 'AFZAAL', 'MOHAMMED AHAD', 'T LEVEL Y1 DSD A');
INSERT INTO `tblstudents` VALUES (41, '9900609850', 'BONET RAMIREZ', 'CESAR', 'T LEVEL Y1 DSD A');
INSERT INTO `tblstudents` VALUES (42, '9900598990', 'BROWN', 'ANTHONY', 'T LEVEL Y1 DSD A');
INSERT INTO `tblstudents` VALUES (43, '9900610916', 'CURTIS', 'BRADLEY', 'T LEVEL Y1 DSD A');
INSERT INTO `tblstudents` VALUES (44, '9900615522', 'DOWNHAM', 'LEWIS', 'T LEVEL Y1 DSD A');
INSERT INTO `tblstudents` VALUES (45, '9900618117', 'GLOVER', 'JACK', 'T LEVEL Y1 DSD A');
INSERT INTO `tblstudents` VALUES (46, '9900613202', 'HENDERSON', 'JAYDEN', 'T LEVEL Y1 DSD A');
INSERT INTO `tblstudents` VALUES (47, '9900615492', 'IDOWU', 'MATHEW', 'T LEVEL Y1 DSD A');
INSERT INTO `tblstudents` VALUES (48, '9900615015', 'LE ROUX', 'IDAN', 'T LEVEL Y1 DSD A');
INSERT INTO `tblstudents` VALUES (49, '9900613208', 'MACDONALD', 'HENRY', 'T LEVEL Y1 DSD A');
INSERT INTO `tblstudents` VALUES (50, '9900602904', 'MAKUMBE', 'NIGEL TASHINGA', 'T LEVEL Y1 DSD A');
INSERT INTO `tblstudents` VALUES (51, '9900611965', 'MUSCUTT', 'GEORGE', 'T LEVEL Y1 DSD A');
INSERT INTO `tblstudents` VALUES (52, '9900615213', 'OTOBO', 'PRINCESS', 'T LEVEL Y1 DSD A');
INSERT INTO `tblstudents` VALUES (53, '9900611388', 'PACAR', 'ZACK', 'T LEVEL Y1 DSD A');
INSERT INTO `tblstudents` VALUES (54, '9900611564', 'THOMAS', 'ELLIE JEAN', 'T LEVEL Y1 DSD A');
INSERT INTO `tblstudents` VALUES (55, '9900611238', 'WARRELL', 'AIDEN', 'T LEVEL Y1 DSD A');
INSERT INTO `tblstudents` VALUES (56, '9900577117', 'WILLIAMS', 'JAMES DAVID', 'T LEVEL Y1 DSD A');
INSERT INTO `tblstudents` VALUES (57, '9900607175', 'COLLINS', 'CALLUM', 'T LEVEL Y1 DSD B');
INSERT INTO `tblstudents` VALUES (58, '9900595313', 'COTTER', 'MORGAN GREY KYLE', 'T LEVEL Y1 DSD B');
INSERT INTO `tblstudents` VALUES (59, '9900615358', 'DAUNTON', 'BOBBY FOX', 'T LEVEL Y1 DSD B');
INSERT INTO `tblstudents` VALUES (60, '9900606252', 'HAWKINS', 'EDWARD ANDREW', 'T LEVEL Y1 DSD B');
INSERT INTO `tblstudents` VALUES (61, '9900610481', 'MIDDLETON', 'ROWAN JAMES ISAAC', 'T LEVEL Y1 DSD B');
INSERT INTO `tblstudents` VALUES (62, '9900613283', 'MOCNY', 'SZYMON', 'T LEVEL Y1 DSD B');
INSERT INTO `tblstudents` VALUES (63, '9900596955', 'NORTHAN', 'ISAAC JAMES', 'T LEVEL Y1 DSD B');
INSERT INTO `tblstudents` VALUES (64, '9900600269', 'OBRIEN', 'OWEN TERRENCE', 'T LEVEL Y1 DSD B');
INSERT INTO `tblstudents` VALUES (65, '9900614115', 'REGAN', 'VINCENT', 'T LEVEL Y1 DSD B');
INSERT INTO `tblstudents` VALUES (66, '9900593878', 'WALKER', 'GABRIEL', 'T LEVEL Y1 DSD B');
INSERT INTO `tblstudents` VALUES (67, '9900603188', 'WELSH', 'HAYDON', 'T LEVEL Y1 DSD B');
INSERT INTO `tblstudents` VALUES (68, '9900598659', 'WHITE', 'ELISE PEGGY SAMANTHA', 'T LEVEL Y1 DSD B');
INSERT INTO `tblstudents` VALUES (69, '9900596081', 'ADAMS', 'BARNABY QUINN', 'T LEVEL Y2 DPDD');
INSERT INTO `tblstudents` VALUES (70, '9900595254', 'CLAYTON', 'JOSS OWEN', 'T LEVEL Y2 DPDD');
INSERT INTO `tblstudents` VALUES (71, '9900595027', 'HARDWARE', 'OWEN', 'T LEVEL Y2 DPDD');
INSERT INTO `tblstudents` VALUES (72, '9900595542', 'HLUSHKO', 'NATALIIA', 'T LEVEL Y2 DPDD');
INSERT INTO `tblstudents` VALUES (73, '9900595736', 'KAPUSTA', 'WIKTOR', 'T LEVEL Y2 DPDD');
INSERT INTO `tblstudents` VALUES (74, '9900593160', 'MARKS', 'GRACIE', 'T LEVEL Y2 DPDD');
INSERT INTO `tblstudents` VALUES (75, '9900600768', 'MUZOVAKA', 'TINOTENDA', 'T LEVEL Y2 DPDD');
INSERT INTO `tblstudents` VALUES (76, '9900582558', 'PICKERING', 'JAMES', 'T LEVEL Y2 DPDD');
INSERT INTO `tblstudents` VALUES (77, '9900579889', 'PORTER', 'ADAM', 'T LEVEL Y2 DPDD');
INSERT INTO `tblstudents` VALUES (78, '9900597594', 'SCOTT', 'MCKENZIE LEE', 'T LEVEL Y2 DPDD');
INSERT INTO `tblstudents` VALUES (79, '9900596856', 'TAYLOR', 'GABRIEL', 'T LEVEL Y2 DPDD');
INSERT INTO `tblstudents` VALUES (80, '9900593386', 'TRAN', 'ALEX', 'T LEVEL Y2 DPDD');
INSERT INTO `tblstudents` VALUES (81, '9900590953', 'WHITE', 'MILLER', 'T LEVEL Y2 DPDD');
INSERT INTO `tblstudents` VALUES (82, '9900597908', 'WYATT', 'DOMINIC GEORGE', 'T LEVEL Y2 DPDD');
INSERT INTO `tblstudents` VALUES (83, '9900583535', 'ZHOU', 'KEISON', 'T LEVEL Y2 DPDD');

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
