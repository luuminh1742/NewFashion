-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: newfashion
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` char(15) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `id_role_idx` (`role_id`),
  CONSTRAINT `fk_account_id_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'admin','123456','Luu Ba Minh','abc','abc@gmail.com','0999888776',_binary '',2),(2,'minh','111111','Minh Lưu Bá','Thanh Hoa','demo','0987654321',_binary '',1);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `receiver_name` varchar(100) NOT NULL,
  `receiver_address` varchar(255) NOT NULL,
  `receiver_phone` char(15) NOT NULL,
  `created_date` datetime NOT NULL,
  `total_money` int(11) DEFAULT NULL,
  `pay_type` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_account_idx` (`account_id`),
  CONSTRAINT `fk_bill_id_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (8,2,'Minh Lưu Bá','demo','0987654321','2021-07-31 11:19:54',NULL,'',_binary ''),(9,2,'Minh Lưu Bá','Thanh Hoa','0987654321','2021-07-31 14:59:38',NULL,'',_binary '');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_detail`
--

DROP TABLE IF EXISTS `bill_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bill_detail` (
  `product_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` smallint(6) DEFAULT NULL,
  `currently_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`bill_id`),
  KEY `fk_bill_detail_id_bill_idx` (`bill_id`),
  CONSTRAINT `fk_bill_detail_id_bill` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`id`),
  CONSTRAINT `fk_bill_detail_id_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_detail`
--

LOCK TABLES `bill_detail` WRITE;
/*!40000 ALTER TABLE `bill_detail` DISABLE KEYS */;
INSERT INTO `bill_detail` VALUES (17,8,'Quần jean Baggy ống suông, rộng nam, nữ TR01 hottrend hàn quốc 2021',2,159000),(20,8,'Quần Jean Nam Chất Bò Cao Cấp 99AD NHIỀU MẪU HOT',1,135000),(23,9,'Quần jeans nữ lưng cao RÁCH t ôm body lưng siêu cao rách gối xanh nhạt - J20',1,141550);
/*!40000 ALTER TABLE `bill_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart` (
  `product_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `quantity` smallint(6) NOT NULL,
  PRIMARY KEY (`product_id`,`account_id`),
  KEY `id_account_idx` (`account_id`),
  CONSTRAINT `fk_cart_id_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  CONSTRAINT `fk_cart_id_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `discount` tinyint(4) DEFAULT NULL,
  `quantity` smallint(6) DEFAULT NULL,
  `product_detail` text,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(100) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_category_idx` (`category_id`),
  CONSTRAINT `fk_product_id_category` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (17,1,'Quần jean Baggy ống suông, rộng nam, nữ TR01 hottrend hàn quốc 2021',159000,16,131,'<p>⭐⭐⭐ CAM KẾT H&Agrave;NG NHƯ H&Igrave;NH CHỤP - HO&Agrave;N TIỀN NẾU THẤY KH&Ocirc;NG H&Agrave;I L&Ograve;NG.</p>\n\n<p>⭐⭐⭐ H&Atilde;Y INBOX CHO SHOP KHI SẢN PHẨM C&Oacute; VẤN ĐỀ ( ĐỔI SIZE, SP BỊ LỖI...)</p>\n\n<p>ĐỂ HỖ TRỢ TRƯỚC KHI Đ&Aacute;NH GI&Aacute;.</p>\n\n<p>✔️ QUẦN JEANS BAGGY D&Aacute;NG ỐNG SU&Ocirc;NG NAM CAO CẤP</p>\n\n<p>- C&oacute; phải bạn đang muốn t&igrave;m cho m&igrave;nh một chiếc quần jean baggy cao cấp mang style h&agrave;n quốc? May mắn l&agrave; bạn đ&atilde; t&igrave;m thấy ch&uacute;ng t&ocirc;i.</p>\n\n<p>- Chiếc quần jean baggy d&agrave;nh cho nam n&agrave;y cửa h&agrave;ng ch&uacute;ng t&ocirc;i b&aacute;n khoảng 600 chiếc mỗi th&aacute;ng. Đ&atilde; b&aacute;n hơn 6.000 chiếc chỉ t&iacute;nh ri&ecirc;ng tr&ecirc;n hệ thống của Shopee Việt Nam, chưa kể đến những k&ecirc;nh b&aacute;n kh&aacute;c!</p>\n\n<p>- Bạn cũng sẽ l&agrave; một trong số những người sẽ sở hữu chiếc quần jean baggy mang phong c&aacute;ch h&agrave;n quốc n&agrave;y. Bởi v&igrave; đ&acirc;y l&agrave; một chiếc quần jean m&agrave; cực kỳ dễ phối đồ từ &aacute;o thun, hoodie, &aacute;o kho&aacute;c..cho đến c&aacute;c loại sneakers, boots..</p>\n\n<p>✔️ TẠI SAO N&Ecirc;N CHỌN MUA QUẦN JEANS BAGGY NAM, TẠI 20WE?</p>\n\n<p>- CHẤT LƯỢNG: Chất vải jean CH&Iacute;NH PHẨM gồm 95% cotton ( thấm h&uacute;t, vải mềm) v&agrave; 5% spandex ( độ co d&atilde;n).</p>\n\n<p>- GI&Aacute; CẢ : Ch&uacute;ng t&ocirc;i trực tiếp sản xuất với số lượng lớn. N&ecirc;n so với c&aacute;c quần c&ugrave;ng chất lượng gi&aacute; cả của chiếc quần jean baggy th&igrave; gi&aacute; tốt nhất cho bạn hiện tại.</p>\n\n<p>✔️ Th&ocirc;ng Tin Sản Phẩm:</p>\n\n<p>- Kiểu D&aacute;ng: quần jean baggy d&agrave;nh cho nam</p>\n\n<p>- Mầu Sắc: Xanh Sky.</p>\n\n<p>- Chất liệu: jean cao cấp, ko phai mầu</p>\n\n<p>- Số lượng : h&agrave;ng đủ size , xuất khẩu</p>\n\n<p>- gồm c&oacute; đủ size: từ size 27 ( 40kg) -&gt; size 36 (100kg).</p>\n','2021-07-23 16:25:31','Luu Minh','2021-07-23 16:35:13','Luu Minh',_binary ''),(19,1,'Quần Jean Nam Chất Bò Cao Cấp AD1110TG Đen Phối Gối Cao Cấp Thời Trang TG Giá Gốc Tận Xưởng Mẫu Mới (44 - 70KG)',139000,0,1000,'<p>Quần jean nam AD1110TG</p>\n\n<p>Mẫu quần jean nam đẹp v&agrave; c&aacute; t&iacute;nh bậc nhất năm 2020 hiện đang l&agrave; mẫu quần jean nam được rất nhiều bạn trẻ y&ecirc;u th&iacute;ch săn mua .. với mẫu m&atilde; độc đ&aacute;o c&aacute; t&iacute;nh chất liệu jean cotton co gi&atilde;n hứa hện sẽ mang lại cho qu&yacute; kh&aacute;ch một sự sự chọn ho&agrave;n hảo</p>\n\n<p>Bảng chọn size quần jean nam AD20TG</p>\n\n<p>- Size 28 (Từ 43 - 48kg Cao Dưới 1m65) V&ograve;ng bụng 79cm</p>\n\n<p>- Size 29 (Từ 49 - 54kg Cao Dưới 1m65) V&ograve;ng bụng 80cm</p>\n\n<p>- Size 30 (Từ 55 - 59kg Cao Dưới 1m70) V&ograve;ng bụng 81cm</p>\n\n<p>- Size 31 ( Từ 60- 64kg Cao Dưới 1m75) V&ograve;ng bụng 83cm</p>\n\n<p>- Size 32 (Từ 65 - 70kg Cao Dưới 1m78) V&ograve;ng bụng 85cm</p>\n\n<p>LƯU &Yacute;: những bạn c&oacute; bụng n&ecirc;n lấy lớn hơn 1 size so với bảng tr&ecirc;n ạ.</p>\n\n<p>------------------------------------</p>\n\n<p>VỀ SẢN PHẨM:</p>\n\n<p>- Sản phẩm được đặt may ri&ecirc;ng theo mẫu thiết kế của Teen Group shop tại tp HCM.</p>\n\n<p>- Quần jean nam với thiết kế mới thời trang hơn, mang lại sự tự tin tối đa cho người mặc trước những người xung quanh</p>\n\n<p>- Quần may bằng vải denim n&ecirc;n rất mềm v&agrave; thoải m&aacute;i khi mặc, đảm bảo sẽ kh&ocirc;ng hề cảm thấy g&ograve; b&oacute; ngay cả khi di chuyển nhiều.</p>\n\n<p>- D&aacute;ng quần jean ống c&ocirc;n trẻ trung &ocirc;m body tạo n&ecirc;n form cực chuẩn cho người mặc t&uacute;i quần lớn rất thuận tiện cho việc đựng smart phone hoặc v&iacute; cỡ bự.</p>\n\n<p>- M&agrave;u sắc chuẩn được nhuộm kỹ đến hai lần gi&uacute;p hạn chế tối đa việc phai m&agrave;u khi sử dụng.</p>\n\n<p>- V&agrave;i ảnh chụp cận cảnh để l&agrave;m r&otilde; th&ecirc;m sự sắc n&eacute;t của từng đường may, sớ vải.</p>\n\n<p>- Size: 28 đến 32</p>\n\n<p>- Xuất xứ: được thiết kế v&agrave; gia c&ocirc;ng bởi Teen group tại Tp HCM, Việt Nam.</p>\n\n<p>------------------------------------</p>\n\n<p>+ Loại : Quần Jean COTTON Co Giản</p>\n\n<p>+ Kiểu d&aacute;ng : H&agrave;n Quốc, Đi Chơi, C&ocirc;ng Sở, Đời Thường</p>\n\n<p>+Chất liệu : Vải Jean Cotton</p>\n\n<p>+Thương hiệu : VNXK</p>\n\n<p>+Th&iacute;ch hợp : 4 m&ugrave;a</p>\n\n<p>------------------------------------ :</p>\n','2021-07-23 16:42:06','Luu Minh','2021-07-23 16:45:12','Luu Minh',_binary ''),(20,1,'Quần Jean Nam Chất Bò Cao Cấp 99AD NHIỀU MẪU HOT',135000,0,4352,'<p>&nbsp;C&Aacute;CH CHỌN SIZE</p>\n\n<p>- Size 27 : Dưới 40kg</p>\n\n<p>- Size 28 : Từ 41 - 47kg Cao Dưới 1m65</p>\n\n<p>- Size 29 : Từ 48 - 52kg Cao Dưới 1m65</p>\n\n<p>- Size 30 : Từ 53 - 57kg Cao Dưới 1m70</p>\n\n<p>- Size 31 : Từ 58 - 61kg Cao Dưới 1m75</p>\n\n<p>- Size 32 : Từ 62 - 65kg Cao Dưới 1m78</p>\n\n<p>- Size 33 : Từ 66 - 70kg Cao Dưới 1m80</p>\n\n<p>- Size 34 : Từ 71 - 75kg Cao Dưới 1m80</p>\n\n<p>LƯU &Yacute;: những bạn c&oacute; bụng n&ecirc;n lấy lớn hơn 1 size so với bảng tr&ecirc;n ạ. inbox trực tiếp cho shop để được tư vấn ch&iacute;nh x&aacute;c nhất</p>\n\n<p>------------------------------------</p>\n\n<p>&nbsp;VỀ SẢN PHẨM:</p>\n\n<p>- Sản phẩm được đặt may ri&ecirc;ng theo mẫu thiết kế của ADEO STORE shop tại tp HCM.</p>\n\n<p>- Quần jean nam với thiết kế mới thời trang hơn, mang lại sự tự tin tối đa cho người mặc trước những người xung quanh</p>\n\n<p>- Quần may bằng jeann cao cấp n&ecirc;n rất mềm v&agrave; thoải m&aacute;i khi mặc, đảm bảo sẽ kh&ocirc;ng hề cảm thấy g&ograve; b&oacute; ngay cả khi di chuyển nhiều.</p>\n\n<p>- D&aacute;ng quần jean ống c&ocirc;n trẻ trung &ocirc;m body tạo n&ecirc;n form cực chuẩn cho người mặc t&uacute;i quần lớn rất thuận tiện cho việc đựng smart phone hoặc v&iacute; cỡ bự.</p>\n\n<p>- M&agrave;u sắc chuẩn được nhuộm kỹ đến hai lần gi&uacute;p hạn chế tối đa việc phai m&agrave;u khi sử dụng.</p>\n\n<p>- V&agrave;i ảnh chụp cận cảnh để l&agrave;m r&otilde; th&ecirc;m sự sắc n&eacute;t của từng đường may, sớ vải.</p>\n\n<p>- Size: 27 đến 34</p>\n\n<p>- Xuất xứ: được thiết kế v&agrave; gia c&ocirc;ng bởi ADEO STORE tại Tp HCM, Việt Nam.</p>\n\n<p>------------------------------------</p>\n\n<p>- Loại : Quần Jean COTTON Co Giản</p>\n\n<p>- Kiểu d&aacute;ng : H&agrave;n Quốc, Đi Chơi, C&ocirc;ng Sở, Đời Thường</p>\n\n<p>-Chất liệu : Vải Jean Cotton</p>\n\n<p>-Thương hiệu : Muidoi</p>\n\n<p>-Th&iacute;ch hợp : 4 m&ugrave;a</p>\n','2021-07-23 16:49:30','Luu Minh','2021-07-23 16:51:29','Luu Minh',_binary ''),(21,1,'Quần jean nam cao cấp, chất liệu jean ( bò ) mềm mịn, from chuẩn, có nhiều mẫu đi kèm xuongcaocap108',129000,0,112,'<p>Cảm ơn anh/chị đ&atilde; tin tưởng v&agrave; lựa chọn Xưởng Quần &Aacute;o Cao Cấp HA!</p>\n\n<p>Th&ocirc;ng tin sản phẩm:</p>\n\n<p>- Chất liệu: Chất Jean cao cấp</p>\n\n<p>-vải cao cấp, mềm mịn, co gi&atilde;n tốt, mặc cực thoải m&aacute;i</p>\n\n<p>- Kh&ocirc;ng ra m&agrave;u, kh&ocirc;ng x&ugrave; l&ocirc;ng,thấm h&uacute;t mồ h&ocirc;i</p>\n\n<p>- form chuẩn , t&ocirc;n d&aacute;ng, mặc trẻ trung</p>\n\n<p>- Đường may cực tỉ mỉ cực đẹp</p>\n\n<p>- C&oacute; thể mặc đi l&agrave;m, đi chơi, dễ phối đồ, kh&ocirc;ng k&eacute;n người mặc</p>\n\n<p>&nbsp;C&Aacute;CH CHỌN SIZE</p>\n\n<p>- Size 27 : Dưới 39kg</p>\n\n<p>- Size 28 : Từ 40 - 47kg Cao Dưới 1m65</p>\n\n<p>- Size 29 : Từ 48 - 52kg Cao Dưới 1m65</p>\n\n<p>- Size 30 : Từ 53 - 56kg Cao Dưới 1m70</p>\n\n<p>- Size 31 : Từ 57 - 61kg Cao Dưới 1m75</p>\n\n<p>- Size 32 : Từ 62 - 65kg Cao Dưới 1m78</p>\n\n<p>- Size 33 : Từ 66 - 70kg Cao Dưới 1m80</p>\n\n<p>- Size 34 : Từ 71 - 78kg Cao Dưới 1m83</p>\n','2021-07-23 16:55:25','Luu Minh','2021-07-23 16:57:31','Luu Minh',_binary ''),(22,2,'Quần Jeans Ống Rộng Lưng Cao Phong Cách Hàn Quốc Thời Trang Mùa Hè Cho Nữ',147000,0,231,'<p>Size/(CM)</p>\n\n<p>XS：Length:103 Waist：60 Hip：86</p>\n\n<p>S：Length:104 Waist：64 Hip：90</p>\n\n<p>M：Length:105 Waist：68 Hip：94</p>\n\n<p>L：Length: 106 Waist：72 Hip：98</p>\n\n<p>XL：Length:107 Waist：76 Hip：102</p>\n\n<p>-Manual measurement of 1-3CM deviation is purely normal</p>\n\n<p>- Hello dear。welcome to our store</p>\n\n<p>- The fabrics used in this dress are of good quality and fine workmanship</p>\n\n<p>-You can pick up a store coupon before you buy</p>\n\n<p>- Different discount levels for different consumption stages</p>\n\n<p>- Like the style of our store remember to follow us</p>\n\n<p>- like this dress to buy in time. As the labor costs of materials are increasingly different, the product will increase costs and cause prices to rise. The current purchase is the best price</p>\n\n<p>-If you have any questions, please feel free to contact us</p>\n','2021-07-23 17:01:32','Luu Minh','2021-07-23 17:03:53','Luu Minh',_binary ''),(23,2,'Quần jeans nữ lưng cao RÁCH t ôm body lưng siêu cao rách gối xanh nhạt - J20',141550,0,0,'<p>Quần jeans nữ lưng cao R&Aacute;CH t &ocirc;m body lưng si&ecirc;u cao r&aacute;ch gối xanh nhạt - J20</p>\n\n<p>Chất jean thun co giản cao cấp, chuẩn h&agrave;ng shop</p>\n\n<p>Chuẩn h&igrave;nh 100%</p>\n\n<p>Size 26-30 đ&aacute;y 30cm quần d&agrave;i 92cm</p>\n\n<p>Lẻ 170k</p>\n\n<p>Mua tại #shopee được gi&aacute; #sỉ</p>\n\n<p>SHOPEE 1 C&Aacute;I CŨNG ĐƯỢC SỈ - #149k https://shp.ee/rujmruc</p>\n\n<p>- Lu&ocirc;n k&egrave;m h&igrave;nh/ video thật. Đảm bảo h&agrave;ng y h&igrave;nh</p>\n\n<p>- Cam kết ho&agrave;n tiền 100% nếu kh&ocirc;ng giống h&igrave;nh</p>\n\n<p>- Gi&aacute; rẻ nhưng đảm bảo chất lượng, vải đẹp, đường may tỉ mỉ chuẩn h&agrave;ng shop M&agrave;u v&agrave; ph&acirc;n loại Shop đ&atilde; đăng chi tiết kh&aacute;ch vui l&ograve;ng đặt theo ph&acirc;n loại ,Shop Ko nhận đơn theo ghi ch&uacute; ( vd : đặt 2 đỏ, ghi ch&uacute;: 1 đen, 1 đỏ) mọi khiếu nại về vấn đề n&agrave;y shop kh&ocirc;ng giải quyết</p>\n','2021-07-23 17:06:23','Luu Minh','2021-07-23 17:09:29','Luu Minh',_binary '');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'Men\'s','banner-1.jpg'),(2,'Women’s','banner-2.jpg'),(3,'Kid’s','banner-3.jpg');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_image_idx` (`product_id`),
  CONSTRAINT `fk_product_image` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (11,'3cc2f4edb8684905f367f0574c85fda9.jpg',17),(12,'5304369e8d025ea867d59436ec9aff25.jpg',17),(13,'ee55da7a8162b1bec3ed9d9ff4e4a98a.jpg',17),(14,'a59e90205bb68e6e2869491bb7e87f49.jpg',19),(15,'07c19d9f16151659868361c8a53a8dca.jpg',19),(16,'572ee09951ee478999ace1eed2bc911a.jpg',19),(17,'950566628bd627028bba15afc1110f8e.jpg',19),(18,'16c7f871bb8d7edd4e875bebf46a324a.jpg',20),(19,'e2d9f33f23fe0d48c4097d836ebf3485.jpg',20),(20,'7a9f7c8b6e5aa8c0078c6a435371cedf.jpg',20),(21,'820777264869e571086d5c5835a8e3d2.jpg',21),(22,'7c3f2e5d259e696680d3cf5418ac80d4.jpg',21),(23,'f17221904ce30eea99f3585523f45e32.jpg',21),(24,'b87bfae05fafadbeeef1fa8ca570a11d.jpg',22),(25,'dd89ea5d11ece0b81592b74bd85730c4.jpg',22),(26,'0d87e3735cc93c7e4d85e238437ed7e6.jpg',22),(27,'3d7268e685b1d9356482ea1bcd902942.jpg',22),(29,'d5398c7f3f6dac61ecf628e0fe16e6cc.jpg',23),(30,'38cd0a0cb4bebad6b01ef8d34c9df345.jpg',23),(31,'d69f5dd8855a5e5e7fbdf038c2d4e8ce.jpg',23);
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_reviews` (
  `account_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `star` tinyint(4) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`account_id`,`product_id`),
  KEY `id_product_idx` (`product_id`),
  CONSTRAINT `fk_product_reviews_id_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  CONSTRAINT `fk_product_reviews_id_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reviews`
--

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Người dùng','USER'),(2,'Người quản trị','ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-02 19:25:48
