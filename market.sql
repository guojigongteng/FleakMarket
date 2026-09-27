/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80042 (8.0.42)
 Source Host           : localhost:3306
 Source Schema         : market

 Target Server Type    : MySQL
 Target Server Version : 80042 (8.0.42)
 File Encoding         : 65001

 Date: 27/09/2026 18:50:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `userid` int NOT NULL COMMENT '用户编号',
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户密码',
  PRIMARY KEY (`userid`, `username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, 'admin', '123456');
INSERT INTO `account` VALUES (2, 'user', '123456');
INSERT INTO `account` VALUES (5, '123', '123456');
INSERT INTO `account` VALUES (15, 'test', '123456');
INSERT INTO `account` VALUES (16, 'test1', '123456');
INSERT INTO `account` VALUES (17, 'test2', '123456');
INSERT INTO `account` VALUES (18, 'root', 'root');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '管理员编号',
  `username` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '登录密码',
  `phone` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '管理员联系方式',
  `tname` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '管理员真实姓名',
  `logintime` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '管理员最后登录时间',
  `lv` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '2' COMMENT '账户级别(1:boss, 2:管理员)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '10086', '拓', '2026-09-27 14:03:57', '1');
INSERT INTO `admin` VALUES (2, 'Zero', '111111', '110', '张三', '2024-04-30 15:40:36', '2');
INSERT INTO `admin` VALUES (3, 'Mr.chen', '123456', '123456', '李四', NULL, '2');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `pid` int NOT NULL COMMENT '商品编号',
  `uid` int NOT NULL COMMENT '用户编号',
  `text` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '评论文本',
  `time` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '发布时间',
  `status` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '1' COMMENT '评论状态(1:正常, 2:屏蔽)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pro_com`(`pid` ASC) USING BTREE,
  INDEX `usr_com`(`uid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 7, 1, '价格可以面谈', '2020-04-16 12:52:53', '1');
INSERT INTO `comment` VALUES (2, 2, 5, '1111', '2020-04-23 14:03:23', '1');
INSERT INTO `comment` VALUES (3, 13, 1, '有需要的速速联系~', '2020-04-26 19:45:26', '1');
INSERT INTO `comment` VALUES (7, 13, 2, '加入购物车', '2020-04-26 21:50:14', '1');
INSERT INTO `comment` VALUES (8, 12, 2, '离散数学', '2020-04-26 21:52:26', '1');
INSERT INTO `comment` VALUES (9, 9, 2, '1', '2020-05-24 00:01:44', '1');
INSERT INTO `comment` VALUES (10, 12, 1, '离散', '2020-06-02 10:43:07', '1');
INSERT INTO `comment` VALUES (11, 18, 1, '便宜点\n', '2020-06-04 13:30:57', '1');
INSERT INTO `comment` VALUES (12, 18, 1, '便宜100有人要没', '2020-06-04 13:32:27', '1');
INSERT INTO `comment` VALUES (13, 18, 1, '面谈也行\n', '2020-06-04 13:32:48', '1');
INSERT INTO `comment` VALUES (14, 17, 18, '不错', '2024-04-30 20:42:38', '1');
INSERT INTO `comment` VALUES (15, 14, 2, '怪便宜嘞', '2026-09-27 13:47:04', '1');

-- ----------------------------
-- Table structure for fc
-- ----------------------------
DROP TABLE IF EXISTS `fc`;
CREATE TABLE `fc`  (
  `id` int NOT NULL COMMENT '一级分类编号',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '一级分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of fc
-- ----------------------------
INSERT INTO `fc` VALUES (1, '书籍资料');
INSERT INTO `fc` VALUES (2, '学习用品');
INSERT INTO `fc` VALUES (3, '电子设备');
INSERT INTO `fc` VALUES (4, '日常家居');
INSERT INTO `fc` VALUES (5, '校园出行');
INSERT INTO `fc` VALUES (6, '体育用品');
INSERT INTO `fc` VALUES (7, '电子配件');
INSERT INTO `fc` VALUES (8, '其他');

-- ----------------------------
-- Table structure for order_product
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '数据编号',
  `oid` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单编号',
  `pid` int NOT NULL COMMENT '商品编号',
  `status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '1' COMMENT '商品状态(1:未发货，2：已发货，3：已收货，4：已申请退款，5：已退款，6：退款失败',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of order_product
-- ----------------------------
INSERT INTO `order_product` VALUES (1, '381ABECC-438C-4B5F-8CC6-C6CC4623E802', 16, '1');
INSERT INTO `order_product` VALUES (2, '381ABECC-438C-4B5F-8CC6-C6CC4623E802', 6, '1');
INSERT INTO `order_product` VALUES (3, '160B5CCD-DFA3-48D0-8790-C7F632E18DD8', 11, '1');
INSERT INTO `order_product` VALUES (4, '00C61EE3-F135-4AED-96E7-28C6461E9FA1', 32, '1');
INSERT INTO `order_product` VALUES (5, '00C61EE3-F135-4AED-96E7-28C6461E9FA1', 19, '1');
INSERT INTO `order_product` VALUES (6, '50610B36-A8A3-4E48-90AB-D7458B6F982D', 18, '1');
INSERT INTO `order_product` VALUES (7, '7BD6B182-1ECA-4980-80F6-A34E56B9D7D2', 3, '1');
INSERT INTO `order_product` VALUES (9, '2F27FC24-24F9-40DF-890F-5CEB0C0F7B61', 12, '1');
INSERT INTO `order_product` VALUES (10, '1B76F0D0-A18A-493A-AC14-9B3D02AAB443', 19, '1');
INSERT INTO `order_product` VALUES (11, 'B59CCDC7-F670-4316-84BC-AFC353159F78', 2, '1');
INSERT INTO `order_product` VALUES (12, '959B6662-30CC-4D74-9CD3-9888351C36B9', 17, '1');
INSERT INTO `order_product` VALUES (13, '9C9C1AB6-B4CB-4303-9AF3-8367FA955B6B', 4, '1');
INSERT INTO `order_product` VALUES (15, '0D35595E-3ABB-461E-AD84-0B5A76559783', 14, '3');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '数据编号',
  `oid` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单编号',
  `cid` int NOT NULL COMMENT '创建人编号',
  `createperson` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '创建人',
  `createtime` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '创建时间',
  `pay` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '1' COMMENT '支付状态（1：未支付，2：已支付）',
  `paytime` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `productnumber` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '商品数量',
  `producttotal` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '商品总价',
  `consignee` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收货人',
  `phone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收货人联系方式',
  `mail` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收货人邮箱',
  `address` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收货地址',
  `remark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '381ABECC-438C-4B5F-8CC6-C6CC4623E802', 0, 'user', '2020-06-10 16:13:26', '2', '2020-06-10 16:13:31', '2', '10', 'user', '18713827231', '2459550727@qq.com', '河北唐山', NULL);
INSERT INTO `orders` VALUES (2, '160B5CCD-DFA3-48D0-8790-C7F632E18DD8', 0, 'user', '2020-06-10 16:14:13', '2', '2020-06-10 16:14:15', '1', '5', 'user', '18713827231', '2459550727@qq.com', '河北唐山', NULL);
INSERT INTO `orders` VALUES (3, '00C61EE3-F135-4AED-96E7-28C6461E9FA1', 0, 'user', '2020-06-10 16:18:30', '2', '2020-06-10 16:18:33', '2', '31', 'user', '18713827231', '2459550727@qq.com', '河北唐山', NULL);
INSERT INTO `orders` VALUES (4, '50610B36-A8A3-4E48-90AB-D7458B6F982D', 2, 'user', '2020-06-10 17:16:19', '2', '2020-06-10 17:16:22', '1', '500', 'user', '18713827231', '2459550727@qq.com', '河北唐山', NULL);
INSERT INTO `orders` VALUES (5, '7BD6B182-1ECA-4980-80F6-A34E56B9D7D2', 2, 'user', '2020-06-10 17:17:28', '2', '2020-06-10 17:17:30', '1', '10', 'user', '18713827231', '2459550727@qq.com', '河北唐山', NULL);
INSERT INTO `orders` VALUES (7, '2F27FC24-24F9-40DF-890F-5CEB0C0F7B61', 2, 'user', '2024-04-19 10:58:41', '2', '2024-04-19 10:58:44', '1', '5', 'user', '10086', '10086@qq.com', '河北唐山', NULL);
INSERT INTO `orders` VALUES (8, '1B76F0D0-A18A-493A-AC14-9B3D02AAB443', 2, 'user', '2024-04-19 12:03:41', '2', '2024-04-19 12:03:44', '1', '30', 'user', '18692014157', '10086@qq.com', '河北唐山', NULL);
INSERT INTO `orders` VALUES (9, 'B59CCDC7-F670-4316-84BC-AFC353159F78', 2, 'user', '2024-04-19 12:07:06', '2', '2024-04-19 12:07:12', '1', '10', 'user', '18692014157', '10086@qq.com', '河北唐山', NULL);
INSERT INTO `orders` VALUES (10, '959B6662-30CC-4D74-9CD3-9888351C36B9', 18, 'root', '2024-04-30 20:43:29', '2', '2024-04-30 20:43:32', '1', '100', 'root', '19856306547', '2015948259@qq.com', '上海', NULL);
INSERT INTO `orders` VALUES (11, '9C9C1AB6-B4CB-4303-9AF3-8367FA955B6B', 18, 'root', '2024-04-30 21:04:44', '2', '2024-04-30 21:04:47', '1', '20', 'root', '19856306547', '2015948259@qq.com', '上海', NULL);
INSERT INTO `orders` VALUES (13, '0D35595E-3ABB-461E-AD84-0B5A76559783', 2, 'user', '2026-09-27 13:53:33', '2', '2026-09-27 13:53:36', '1', '5', 'user', '18692014157', '10086@qq.com', '河北唐山', NULL);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品名称',
  `details` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品描述',
  `images` varchar(9000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品图片',
  `clicks` int NOT NULL DEFAULT 0 COMMENT '商品点击量',
  `creattime` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '创建时间',
  `originalprice` decimal(10, 2) NOT NULL COMMENT '商品原价',
  `currentprice` decimal(10, 2) NOT NULL COMMENT '商品现价',
  `deal` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品交易方式',
  `address` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品交易地址',
  `comments` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '商品留言数',
  `status` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '1' COMMENT '商品状态（1：在线，2：下线)',
  `payed` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '1' COMMENT '交易状态（1：未售，2：已售）',
  `sid` int NOT NULL COMMENT '商品类别编号',
  `uid` int NOT NULL COMMENT '发布人编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (2, '东野圭吾：解忧杂货店', '胡歌、王俊凯、刘昊然倾情推荐，易中天、王安忆盛赞，畅销天王东野圭吾长篇小说代表作，登顶北大图书馆预约榜，5年销量超900万册，豆瓣40万人点评8.5高分', '[\"http://localhost:1024/2024/04/19/1713496430273-O1CN01BSv2dg1FrpBDgJOv5_!!2282640541.jpg\",\"http://localhost:1024/2024/04/19/1713496430273-O1CN01GmzhHi1FrpBDgM5FH_!!2282640541.jpg\",\"http://localhost:1024/2024/04/19/1713496430274-O1CN01XpGe301FrpBEgPplH_!!2282640541.jpg\"]', 14, '2020-04-15 22:41:35', 50.00, 10.00, '线上交易', '潍坊学院南校区图书馆门前', '1', '2', '2', 1, 1);
INSERT INTO `product` VALUES (3, '局外人（诺奖得主作品）', '你格格不入吗？一定要读局外人！收录《局外人》治愈之作《流放与王国》，随书附赠精美书签！对于世界，我永远是个陌生人！', '[\"http://localhost:1024/2024/04/19/1713496650083-O1CN01nWr1TB1CP1OjKqj0A_!!0-item_pic.jpg\",\"http://localhost:1024/2024/04/19/1713496650083-O1CN01t8FeUV1CP1LqwJF45-101450072.jpg\"]', 24, '2020-04-15 22:50:48', 26.00, 10.00, '线上交易', '潍坊学院北校区B大厅', '0', '2', '2', 1, 1);
INSERT INTO `product` VALUES (4, '你想活出怎样的人生', '无论世界变得如何混乱与残酷，我们也能决定以怎样的姿态好好活着。', '[\"http://localhost:1024/2024/04/19/1713496713948-O1CN01xExpqa1WjRCMhc8g5_!!505582824.jpg\",\"http://localhost:1024/2024/04/19/1713496713948-O1CN013hSUxv1WjRCPUr756_!!505582824.jpg\"]', 33, '2020-04-16 11:44:22', 4940.00, 20.00, '线上交易', '潍坊学院北校区图书馆', '0', '2', '2', 1, 1);
INSERT INTO `product` VALUES (5, '平凡的世界', '余华 中国现当代小说经典著作 当代文学作品畅销书籍 新华书店正版', '[\"http://localhost:1024/2024/04/19/1713497159414-O1CN01gRYnDV1eS35C2osP3_!!2208191633869.jpg\",\"http://localhost:1024/2024/04/19/1713497159415-O1CN01YrqAEr1eS3589C9uq_!!2-item_pic.png\"]', 4, '2020-04-16 11:49:19', 7450.00, 30.00, '线上交易', '潍坊学院东校区图书馆', '0', '1', '1', 1, 1);
INSERT INTO `product` VALUES (6, '人间失格', '畅销百万册，日本文学大家“太宰治”灵魂深处的生命绝唱巨著。', '[\"http://localhost:1024/2024/04/19/1713497234306-O1CN01IGIO5Y1cwA2iANzDj_!!0-item_pic.jpg\",\"http://localhost:1024/2024/04/19/1713497234307-O1CN01qNpPcX1cwA2bdxP3L_!!1049653664.jpg\"]', 15, '2020-04-16 11:54:18', 19.00, 5.00, '线下交易', '潍坊学院西校区', '0', '2', '2', 1, 1);
INSERT INTO `product` VALUES (7, '我是猫', '夏目漱石长篇代表作 以猫眼看世界，探索明治时代知识分子心灵的经典之作 穿越百年和风，追寻大师夏目漱石', '[\"http://localhost:1024/2024/04/19/1713497310342-O1CN01AvxQuY2LuTGWLyjUr_!!0-item_pic.jpg\",\"http://localhost:1024/2024/04/19/1713497310343-O1CN01Cm7k6d2LuTGcnQIQm_!!2215177909752.jpg\"]', 13, '2020-04-16 11:54:18', 40.00, 10.00, '线上交易', '潍坊学院北校区', '1', '1', '1', 1, 1);
INSERT INTO `product` VALUES (8, '肖申克的救赎', '惊悚题材永远的王者！畅销霸主！同名电影获奥斯卡奖七项提名，被誉为电影*完美影片之一！', '[\"http://localhost:1024/2024/04/19/1713497468103-O1CN01pqAogS1FrpC0P5om6_!!2282640541.jpg\",\"http://localhost:1024/2024/04/19/1713497468104-O1CN01TMKZqJ1FrpC0P8V4i_!!2282640541.jpg\"]', 9, '2020-04-16 12:08:25', 36.00, 10.00, '线上交易', '潍坊学院南校区', '0', '1', '1', 1, 1);
INSERT INTO `product` VALUES (9, '小王子', '畅销380万册新版，法国“圣埃克苏佩里基金会”官方认可简体中文【果麦经典】', '[\"http://localhost:1024/2024/04/19/1713498196827-O1CN01fHSCSX1cw9mvlSNhq_!!1049653664.jpg\",\"http://localhost:1024/2024/04/19/1713498196828-O1CN01QhhISo1cw9xgS7cLp_!!1049653664.jpg\"]', 14, '2020-04-16 12:08:25', 39.00, 10.00, '线上交易', '潍坊学院西校区', '1', '1', '1', 1, 1);
INSERT INTO `product` VALUES (11, '高等数学（第七版 上册）', '《高等数学（第七版 上册）》分上、下两册出版，上册包括函数与极限、导数与微分、微分中值定理与导数的应用、不定积分、定积分及其应用、微分方程等内容，书末还附有二阶和三阶行列式简介、基本初等函数的图形、几', '[\"http://localhost:1024/2024/04/19/1713498270500-O1CN01QWlZn01OEjnnD0hFg_!!2356231674.png\"]', 13, '2020-04-16 16:28:13', 38.00, 5.00, '线上交易', '潍坊学院南校区', '0', '2', '2', 2, 1);
INSERT INTO `product` VALUES (12, '离散数学学习指导与习题解析', '本书是教育部高等学校“十一五”规划教材《离散数学》（第2版）的配套辅导教学参考书。本书分为数理逻辑、集合论、代数结构、组合数学、图论、初等数论六个部分. 每部分按照章对相关知识点进行了全面的总结，并对', '[\"http://localhost:1024/2024/04/19/1713498349916-O1CN01ELFtiJ1cwA0rXbTVa_!!1049653664.jpg\"]', 21, '2020-04-16 16:31:48', 28.00, 5.00, '线上交易', '潍坊学院北校区', '2', '2', '2', 2, 1);
INSERT INTO `product` VALUES (13, '毛东思想和中国特色社会主义理论', '马克思主义理论研究和建设工程重点教材:思想道德修养与法律基础(修订版)是中宣部、组织专家学者修订编写的“马克思主义理论研究和建设工程重点教材”。本书充分反映了去年以来我们党在理论和实践上的创新成果，特', '[\"http://localhost:1024/2024/04/19/1713498439959-O1CN013rYIv42ADuVWAWOPi_!!2-item_pic.png\"]', 26, '2020-04-16 16:31:48', 28.00, 5.00, '线上交易', '潍坊学院南校区', '2', '1', '1', 2, 1);
INSERT INTO `product` VALUES (14, '数据结构题集（C语言版）', '《清华大学计算机系列教材：数据结构题集（C语言版）》由严蔚敏和吴伟民编著出版的数据结构系列教材有C和Pascal两种描述语言的版本。这本题集是与《数据结构》（C语言版）（清华大学出版社）配套编写的，习', '[\"http://localhost:1024/2024/04/19/1713498482933-O1CN01VGmnwv1cw9tPN3613_!!0-item_pic.jpg\"]', 11, '2020-04-16 16:31:48', 22.00, 5.00, '线上交易', '潍坊学院北校区', '1', '2', '2', 2, 1);
INSERT INTO `product` VALUES (15, '工程数学 线性代数 第六版', '李娜主编的《工程数学线性代数<同济第六版>同 步辅导及习题全解(新版)/高校经典教材同步辅导丛 书/九章丛书》是与高等教育出版社出版，同济大学 数学系编的《工程数学·线性代数》(第六版)一书配 套的同', '[\"http://localhost:1024/2024/04/19/1713498531548-O1CN01Ip5KMJ1cw9v0pTUs5_!!0-item_pic.jpg\"]', 10, '2020-04-16 16:31:48', 29.00, 8.00, '线上交易', '潍坊学院', '0', '1', '1', 2, 1);
INSERT INTO `product` VALUES (16, '中国近现代史纲要2018版', '本书分为从鸦片战争到五四运动前夜(1840-1919)、从五四运动到新中国成立(1919-1949)、从新中国成立到社会主义现代化建设新时期(1949-2018)三部分内容。', '[\"http://localhost:1024/2024/04/19/1713498585258-O1CN01ixdeln1G6TllAaxQm_!!0-item_pic.jpg\"]', 4, '2020-04-16 16:40:50', 44.00, 5.00, '线上交易', '潍坊学院南校区', '0', '2', '2', 2, 1);
INSERT INTO `product` VALUES (17, 'Apple iPhone 11', '128GB 黑色 移动联通电信4G手机  双卡双待', '[\"http://localhost:1024/2024/04/19/1713498652250-O1CN01p6UZwF254gjKB1WKU_!!253007473.jpg\"]', 10, '2020-04-16 16:51:08', 5999.00, 100.00, '线上交易', '潍坊学院南校区', '1', '2', '2', 14, 1);
INSERT INTO `product` VALUES (18, '福运鸽新款新国标电动车', '48V锂电池双人电单代步车 炫酷黑 配官网可验-20A超威或天-能电池跑95公里', '[\"http://localhost:1024/2024/04/19/1713498704763-O1CN01WQSubA1fmUUsTiZvG_!!2215655204049.jpg\"]', 11, '2020-04-16 16:56:43', 1396.00, 500.00, '线上交易', '潍坊学院北校区', '3', '2', '2', 31, 1);
INSERT INTO `product` VALUES (19, '折叠床上懒人笔记本电脑桌', '家用可升降折叠小桌子卧室小型懒人架托床上书桌 A8L加大版', '[\"http://localhost:1024/2024/04/19/1713498784176-O1CN01seQpuj20JjgFjDRmN_!!0-item_pic.jpg\"]', 6, '2020-04-16 16:58:02', 129.00, 30.00, '线上交易', '潍坊学院北校区', '0', '2', '2', 20, 1);
INSERT INTO `product` VALUES (20, '联想小新Pro13锐龙版', '锐龙标压处理器性能更强劲，16G双通道内存响应更快速，超窄边框，“真”全面屏！', '[\"http://localhost:1024/2024/04/19/1713498836689-O1CN01tzvlD320enVuYR2zf_!!2129586875.jpg\"]', 7, '2020-04-17 11:44:23', 4999.00, 1000.00, '线上交易', '潍坊学院北校区', '0', '1', '1', 13, 1);
INSERT INTO `product` VALUES (21, '惠普 Z系列ZBook15G', '惠普（HP）Z系列ZBook15G6-61PA 15.6英寸 设计本笔记本 E-2286M/64G/2T/RTX3000 6G独显/W10P/4K/3年保修', '[\"http://localhost:1024/2024/04/19/1713498972117-O1CN01D624Y32Ca195QLgAq_!!133668489.jpg\"]', 10, '2020-04-17 16:46:55', 39599.00, 5000.00, '线上交易', '潍坊学院南校区', '0', '1', '1', 13, 1);
INSERT INTO `product` VALUES (22, '山地自行车', '山浦 山地自行车男女成人公路赛车网红学生变速单车 高配辐条白黑 26寸21速', '[\"http://localhost:1024/2024/04/19/1713499036556-O1CN01NiXsdB1w2YDc9YdZo_!!2213224086250.jpg\"]', 50, '2020-04-17 17:41:04', 275.00, 50.00, '线下交易', '潍坊学院南校区', '0', '1', '1', 30, 1);

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '数据编号',
  `pid` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品编号',
  `status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '当前状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of recommend
-- ----------------------------
INSERT INTO `recommend` VALUES (4, '6', '1');
INSERT INTO `recommend` VALUES (5, '7', '1');
INSERT INTO `recommend` VALUES (6, '10', '1');
INSERT INTO `recommend` VALUES (7, '12', '1');
INSERT INTO `recommend` VALUES (8, '17', '1');
INSERT INTO `recommend` VALUES (9, '14', '1');
INSERT INTO `recommend` VALUES (12, '2', '1');
INSERT INTO `recommend` VALUES (13, '8', '1');
INSERT INTO `recommend` VALUES (14, '4', '1');
INSERT INTO `recommend` VALUES (15, '18', '1');
INSERT INTO `recommend` VALUES (16, '19', '1');

-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '二级分类编号',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '二级分类名称',
  `fcid` int NOT NULL COMMENT '一级分类编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES (1, '畅销小说', 1);
INSERT INTO `sc` VALUES (2, '教材教辅', 1);
INSERT INTO `sc` VALUES (3, '学习考试', 1);
INSERT INTO `sc` VALUES (4, '经管励志', 1);
INSERT INTO `sc` VALUES (5, '文学文艺', 1);
INSERT INTO `sc` VALUES (6, '钢笔', 2);
INSERT INTO `sc` VALUES (7, '签字笔', 2);
INSERT INTO `sc` VALUES (11, '记事本', 2);
INSERT INTO `sc` VALUES (12, '作图尺规', 2);
INSERT INTO `sc` VALUES (13, '电脑', 3);
INSERT INTO `sc` VALUES (14, '手机', 3);
INSERT INTO `sc` VALUES (15, '耳机', 3);
INSERT INTO `sc` VALUES (16, '键盘', 3);
INSERT INTO `sc` VALUES (17, 'iPad', 3);
INSERT INTO `sc` VALUES (18, '相机', 3);
INSERT INTO `sc` VALUES (19, '智能手环', 3);
INSERT INTO `sc` VALUES (20, '书桌', 4);
INSERT INTO `sc` VALUES (21, '书架', 4);
INSERT INTO `sc` VALUES (22, '灯具', 4);
INSERT INTO `sc` VALUES (23, '插座', 4);
INSERT INTO `sc` VALUES (24, '手提箱', 4);
INSERT INTO `sc` VALUES (25, '收纳箱', 4);
INSERT INTO `sc` VALUES (26, '双肩包', 4);
INSERT INTO `sc` VALUES (27, '手提包', 4);
INSERT INTO `sc` VALUES (28, '雨伞', 4);
INSERT INTO `sc` VALUES (29, '自行车', 5);
INSERT INTO `sc` VALUES (30, '山地车', 5);
INSERT INTO `sc` VALUES (31, '电动车', 5);
INSERT INTO `sc` VALUES (32, '平衡车', 5);
INSERT INTO `sc` VALUES (33, '电动滑板车', 5);
INSERT INTO `sc` VALUES (34, '滑板', 5);
INSERT INTO `sc` VALUES (35, '轮滑鞋', 5);
INSERT INTO `sc` VALUES (36, '足球', 6);
INSERT INTO `sc` VALUES (37, '篮球', 6);
INSERT INTO `sc` VALUES (38, '乒乓球', 6);
INSERT INTO `sc` VALUES (39, '羽毛球', 6);
INSERT INTO `sc` VALUES (40, '网球', 6);
INSERT INTO `sc` VALUES (41, '棋牌', 6);
INSERT INTO `sc` VALUES (42, '移动电源', 7);
INSERT INTO `sc` VALUES (43, '手机壳', 7);
INSERT INTO `sc` VALUES (44, '数据线', 7);
INSERT INTO `sc` VALUES (45, '手机支架', 7);
INSERT INTO `sc` VALUES (46, '自拍杆', 7);
INSERT INTO `sc` VALUES (47, '接口转换器', 7);
INSERT INTO `sc` VALUES (48, '其他', 8);

-- ----------------------------
-- Table structure for statisdata
-- ----------------------------
DROP TABLE IF EXISTS `statisdata`;
CREATE TABLE `statisdata`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '数据编号',
  `dates` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '记录日期',
  `clickNum` int UNSIGNED NOT NULL DEFAULT 1 COMMENT '网站点击量',
  `visitNum` int UNSIGNED NOT NULL DEFAULT 1 COMMENT '网站访问量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of statisdata
-- ----------------------------
INSERT INTO `statisdata` VALUES (1, '2020-01-20', 1, 2);
INSERT INTO `statisdata` VALUES (2, '2020-02-14', 23, 1);
INSERT INTO `statisdata` VALUES (31, '2020-03-30', 172, 20);
INSERT INTO `statisdata` VALUES (32, '2020-03-20', 1, 1);
INSERT INTO `statisdata` VALUES (33, '2020-04-05', 24, 8);
INSERT INTO `statisdata` VALUES (34, '2020-04-12', 37, 19);
INSERT INTO `statisdata` VALUES (35, '2020-04-14', 30, 24);
INSERT INTO `statisdata` VALUES (36, '2020-04-15', 28, 13);
INSERT INTO `statisdata` VALUES (37, '2020-04-16', 94, 47);
INSERT INTO `statisdata` VALUES (38, '2020-04-17', 17, 9);
INSERT INTO `statisdata` VALUES (39, '2020-04-22', 24, 10);
INSERT INTO `statisdata` VALUES (40, '2020-04-23', 65, 34);
INSERT INTO `statisdata` VALUES (41, '2020-04-26', 172, 45);
INSERT INTO `statisdata` VALUES (42, '2020-04-27', 104, 29);
INSERT INTO `statisdata` VALUES (46, '2020-04-28', 28, 6);
INSERT INTO `statisdata` VALUES (47, '2020-04-29', 11, 5);
INSERT INTO `statisdata` VALUES (48, '2020-04-30', 3, 2);
INSERT INTO `statisdata` VALUES (49, '2020-05-01', 2, 2);
INSERT INTO `statisdata` VALUES (50, '2020-05-03', 6, 4);
INSERT INTO `statisdata` VALUES (51, '2020-05-04', 36, 6);
INSERT INTO `statisdata` VALUES (52, '2020-05-05', 35, 1);
INSERT INTO `statisdata` VALUES (53, '2020-05-15', 21, 1);
INSERT INTO `statisdata` VALUES (54, '2020-05-17', 86, 1);
INSERT INTO `statisdata` VALUES (55, '2020-05-19', 28, 1);
INSERT INTO `statisdata` VALUES (56, '2020-05-21', 26, 1);
INSERT INTO `statisdata` VALUES (57, '2020-05-23', 23, 1);
INSERT INTO `statisdata` VALUES (58, '2020-05-24', 18, 1);
INSERT INTO `statisdata` VALUES (59, '2020-06-02', 68, 1);
INSERT INTO `statisdata` VALUES (60, '2020-06-03', 76, 1);
INSERT INTO `statisdata` VALUES (61, '2020-06-04', 250, 18);
INSERT INTO `statisdata` VALUES (62, '2020-06-05', 218, 5);
INSERT INTO `statisdata` VALUES (63, '2020-06-10', 67, 3);
INSERT INTO `statisdata` VALUES (64, '2024-04-19', 86, 4);
INSERT INTO `statisdata` VALUES (65, '2024-04-30', 53, 6);
INSERT INTO `statisdata` VALUES (66, '2026-03-16', 18, 5);
INSERT INTO `statisdata` VALUES (67, '2026-04-07', 3, 1);
INSERT INTO `statisdata` VALUES (68, '2026-09-27', 56, 10);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `username` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名',
  `userimgpath` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户头像链接',
  `phonenumber` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户手机号码',
  `mail` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户邮箱地址',
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户家庭住址',
  `birthday` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户出生日期',
  `sex` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '男' COMMENT '用户性别',
  PRIMARY KEY (`id`, `username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'http://localhost:1024/images/2026/09/27/1790487773496-屏幕截图 2026-08-30 215031.png', '13376556231', '10086@qq.com', '陕西西安周至哑柏', '1998-09-07', '男');
INSERT INTO `user` VALUES (2, 'user', 'http://localhost:1024/2024/04/19/1713495732132-mmexport1640696395640.jpg', '18692014157', '10086@qq.com', '河北唐山', '2015-04-15', '女');
INSERT INTO `user` VALUES (5, '123', NULL, '10086', '10086@qq.com', '河北唐山', '2020-04-07', '女');
INSERT INTO `user` VALUES (15, 'test', NULL, '10086', '10086@qq.com', '河北唐山', '2020-06-10', '男');
INSERT INTO `user` VALUES (16, 'test1', NULL, '10086', '10086@qq.com', 'asdfasdf', '2020-06-09', '男');
INSERT INTO `user` VALUES (17, 'test2', NULL, '10086', '10086@qq.com', '河北111', '2020-06-16', '男');
INSERT INTO `user` VALUES (18, 'root', 'http://localhost:1024/2024/04/30/1714482314391-OIP-C.jpg', '19856306547', '2015948259@qq.com', '上海', '2024-04-23', '男');

-- ----------------------------
-- Table structure for usercart
-- ----------------------------
DROP TABLE IF EXISTS `usercart`;
CREATE TABLE `usercart`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '数据编号',
  `uid` int NOT NULL COMMENT '用户编号',
  `pid` int NOT NULL COMMENT '商品编号',
  `status` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '当前状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of usercart
-- ----------------------------
INSERT INTO `usercart` VALUES (1, 5, 2, '1');
INSERT INTO `usercart` VALUES (23, 2, 21, '1');
INSERT INTO `usercart` VALUES (24, 18, 17, '1');

-- ----------------------------
-- Table structure for userlove
-- ----------------------------
DROP TABLE IF EXISTS `userlove`;
CREATE TABLE `userlove`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '数据编号',
  `uid` int NOT NULL COMMENT '用户编号',
  `pid` int NOT NULL COMMENT '商品编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of userlove
-- ----------------------------
INSERT INTO `userlove` VALUES (4, 5, 3);
INSERT INTO `userlove` VALUES (5, 5, 5);
INSERT INTO `userlove` VALUES (6, 5, 6);
INSERT INTO `userlove` VALUES (10, 2, 16);
INSERT INTO `userlove` VALUES (11, 2, 6);
INSERT INTO `userlove` VALUES (17, 2, 17);
INSERT INTO `userlove` VALUES (27, 2, 2);
INSERT INTO `userlove` VALUES (28, 2, 8);
INSERT INTO `userlove` VALUES (29, 18, 17);

SET FOREIGN_KEY_CHECKS = 1;
