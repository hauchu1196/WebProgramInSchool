-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: travel
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(1000) NOT NULL,
  `content` varchar(255) NOT NULL,
  `url_thumbnail` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `view` int(11) NOT NULL DEFAULT '0',
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `locationDetail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (5,1,'Thu sang, hãy thử \"quên\" lá vàng miền Bắc để về với miền Tây đón mùa nước nổi','thu-sang-hay-thu-quen-la-vang-mien-bac-de-ve-voi-mien-tay-don-mua-nuoc-noi','content','img1.jpg','2017-12-23 00:27:39',0,'20.8468135','106.663727','Hải Phòng'),(6,1,'Nếu một lần được đến Đài Loan, bạn sẽ hiểu hai chữ \"bình yên\" thật sự là như thế nào','','content','img2.jpg','2017-12-23 00:49:15',0,'22.7794408','104.4026033','Hà Giang'),(7,1,'5 công trình bị bỏ hoang tại Việt Nam, muốn có những bức ảnh kì bí \"hết cả hồn\" thì nhất định phải đến!','','content','img3.jpg','2017-12-23 00:50:14',0,'12.2597701','109.1064137','Nha Trang'),(8,1,'5 resort sang chảnh nào tại Việt Nam được hội \"Rich Kid\" ưa thích nhất?','','content','img4.jpg','2017-12-23 00:47:08',0,'20.8468135','106.663727','Hải Phòng'),(9,1,'Check-in 12 địa điểm này ở Việt Nam, nói là \"đi Âu đi Á\" ai cũng tin!','','content','img5.jpg','2017-12-23 00:49:17',0,'22.7794408','104.4026033','Hà Giang'),(10,1,'5 địa điểm du lịch độc đáo trên thế giới đã kịp in dấu chân các bạn trẻ Việt Nam!','','content','img6.jpg','2017-12-23 00:50:12',0,'12.2597701','109.1064137','Nha Trang'),(11,2,'Thu sang, hãy thử \"quên\" lá vàng miền Bắc để về với miền Tây đón mùa nước nổi','','content','img7.jpg','2017-12-23 00:47:11',0,'20.8468135','106.663727','Hải Phòng'),(12,2,'Nếu một lần được đến Đài Loan, bạn sẽ hiểu hai chữ \"bình yên\" thật sự là như thế nào','','content','img8.gif','2017-12-23 00:49:20',0,'22.7794408','104.4026033','Hà Giang'),(13,2,'5 công trình bị bỏ hoang tại Việt Nam, muốn có những bức ảnh kì bí \"hết cả hồn\" thì nhất định phải đến!','','content','img9.jpg','2017-12-23 00:47:14',0,'20.8468135','106.663727','Hải Phòng'),(14,2,'5 resort sang chảnh nào tại Việt Nam được hội \"Rich Kid\" ưa thích nhất?','','content','pic1.jpg','2017-12-23 00:50:09',0,'12.2597701','109.1064137','Nha Trang'),(15,2,'Check-in 12 địa điểm này ở Việt Nam, nói là \"đi Âu đi Á\" ai cũng tin!','','content','pic2.jpg','2017-12-23 00:49:22',0,'22.7794408','104.4026033','Hà Giang'),(16,2,'5 địa điểm du lịch độc đáo trên thế giới đã kịp in dấu chân các bạn trẻ Việt Nam!','','content','pic3.jpg','2017-12-23 00:47:16',0,'20.8468135','106.663727','Hải Phòng'),(17,1,'Hêle','123','<p>Hellaoso</p>\n','travel/images/123.jpg','2017-12-24 18:18:44',0,'21.0277644','105.83415979999995','Hà nội');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `alias` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Du lịch bốn phương','du-lich'),(2,'Ăn cả thế giới','an-uong');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,1,'Bài viết khá hay và chất lượng!','2017-12-22 20:09:22'),(2,5,1,'Chất','2017-12-13 07:11:26'),(3,5,4,'Đáng để đi đấy','2017-12-19 00:13:05'),(4,5,1,'HA ha','2017-12-23 14:47:43'),(5,5,4,'Mai tớ sẽ đi!','2017-12-23 15:29:47'),(6,5,1,'Bài viết khá hay và chi tiết ?','2017-12-23 15:30:01'),(7,5,1,'test','2017-12-23 15:00:19'),(8,5,1,'á','2017-12-23 15:00:25'),(9,5,1,'sao l?i l?i font nh??','2017-12-23 15:03:54'),(10,5,1,'được','2017-12-23 15:30:09'),(11,6,1,'C?ng nh?','2017-12-23 15:14:46'),(12,6,1,'Hay quá anh eiii','2017-12-23 15:21:13'),(13,6,4,'á','2017-12-23 15:25:18'),(14,6,4,'c?ng nh?','2017-12-23 15:26:19'),(15,7,1,'Khá hay và hấp dẫn đấy!','2017-12-23 16:11:40'),(16,7,1,'Hay quá đê','2017-12-23 16:30:16'),(17,7,1,'Đẹp quá!!!!!','2017-12-23 16:30:57'),(18,7,1,'đẹp quá đi','2017-12-23 16:31:53'),(19,9,4,'Kê rồi đó!','2017-12-23 16:33:22'),(20,9,4,'hi hi','2017-12-23 16:34:46'),(21,9,1,'Nice!','2017-12-23 16:35:48'),(22,9,1,'Okey','2017-12-23 16:36:19'),(23,9,1,'Abc','2017-12-23 16:36:48'),(24,9,1,'123','2017-12-23 16:38:37'),(25,11,4,'á á','2017-12-23 16:39:21'),(26,11,4,'hay quá','2017-12-23 16:39:50'),(27,11,4,'hi hi 123','2017-12-23 16:42:50'),(28,11,4,'chất ạ','2017-12-23 16:43:10'),(29,11,1,'Ha ha được rồi nè','2017-12-23 16:44:16'),(30,11,1,'Yep!','2017-12-23 16:45:04'),(31,11,1,'ádas','2017-12-23 16:46:45'),(32,11,1,'ád','2017-12-23 16:48:38'),(33,11,1,'ádsss','2017-12-23 16:50:37'),(34,10,1,'Kê','2017-12-23 16:53:18'),(35,10,1,'Nhất trí','2017-12-23 16:54:39'),(36,10,1,'1','2017-12-23 16:55:42'),(37,10,1,'qwer','2017-12-23 16:58:00'),(38,10,1,'kê','2017-12-23 17:00:39'),(39,5,0,'Ai đấy?','2017-12-23 17:02:53'),(40,5,5,'chất ạ','2017-12-23 17:04:58'),(41,5,5,'huydeptrai123','2017-12-23 17:05:43'),(42,5,5,'Cũng ghê đấy','2017-12-24 08:09:19'),(43,5,5,'123','2017-12-24 08:12:45');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate` (
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate`
--

LOCK TABLES `rate` WRITE;
/*!40000 ALTER TABLE `rate` DISABLE KEYS */;
INSERT INTO `rate` VALUES (5,0,5),(5,1,4),(5,5,5),(10,1,4);
/*!40000 ALTER TABLE `rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `alias` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,1,'Đi và trải nghiệm','di-va-trai-nghiem'),(2,1,'Phải đi','phai-di'),(3,1,'Loanh quanh cafe','loanh-quanh-cafe'),(4,1,'Ở đâu cho sướng','o-dau-cho-suong'),(5,1,'Đi chơi ở đâu','di-choi-o-dau'),(6,2,'Hà nội','ha-noi'),(7,2,'Miền trung','mien-trung'),(8,2,'Tp.Hồ Chí Minh','tp-ho-chi-minh');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_article`
--

DROP TABLE IF EXISTS `tag_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_article`
--

LOCK TABLES `tag_article` WRITE;
/*!40000 ALTER TABLE `tag_article` DISABLE KEYS */;
INSERT INTO `tag_article` VALUES (4,4,8),(5,1,9),(6,2,10),(7,6,11),(8,7,12),(9,8,13),(10,6,13),(11,7,14),(12,7,15),(13,7,16),(49,2,5),(50,3,5);
/*!40000 ALTER TABLE `tag_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Puddin','phucdoit@gmail.com','puddin','phucdv123','2016-06-09 03:05:09','2016-06-18 07:06:27',0),(4,'admin','admin','admin','admin','2017-12-20 15:16:53',NULL,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-24 22:02:37
