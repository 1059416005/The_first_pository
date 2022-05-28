/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.49-community : Database - classnet
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

USE `classnet`;

/*Table structure for table `answer_table` */

DROP TABLE IF EXISTS `answer_table`;

CREATE TABLE `answer_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `status` int(11) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `topicId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC06B980D29D8874D` (`topicId`),
  KEY `FKC06B980D2A868CC3` (`userId`),
  CONSTRAINT `FKC06B980D29D8874D` FOREIGN KEY (`topicId`) REFERENCES `topic_table` (`id`),
  CONSTRAINT `FKC06B980D2A868CC3` FOREIGN KEY (`userId`) REFERENCES `user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `answer_table` */

insert  into `answer_table`(`id`,`content`,`status`,`pubtime`,`topicId`,`userId`) values (2,'&nbsp;是的',1,'2013-04-27 18:51:53',2,3);

/*Table structure for table `clazz_menu` */

DROP TABLE IF EXISTS `clazz_menu`;

CREATE TABLE `clazz_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6CECDAE69F57DC30` (`parentId`),
  CONSTRAINT `FK6CECDAE69F57DC30` FOREIGN KEY (`parentId`) REFERENCES `clazz_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `clazz_menu` */

insert  into `clazz_menu`(`id`,`name`,`parentId`) values (1,'网页基础',NULL),(4,'html',1),(7,'css',1),(8,'javascript',1),(9,'Java基础',NULL),(10,'java语法',9),(11,'java面向对象',9);

/*Table structure for table `clazz_table` */

DROP TABLE IF EXISTS `clazz_table`;

CREATE TABLE `clazz_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `filename` varchar(40) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `author` varchar(10) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `img` varchar(40) DEFAULT NULL,
  `flashFilename` varchar(40) DEFAULT NULL,
  `school` varchar(50) DEFAULT NULL,
  `viewcount` int(11) DEFAULT NULL,
  `filetype` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK310F2727190F8FA5` (`menuId`),
  KEY `FK310F27278CA3DC9E` (`filetype`),
  CONSTRAINT `FK310F2727190F8FA5` FOREIGN KEY (`menuId`) REFERENCES `clazz_menu` (`id`),
  CONSTRAINT `FK310F27278CA3DC9E` FOREIGN KEY (`filetype`) REFERENCES `file_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `clazz_table` */

insert  into `clazz_table`(`id`,`name`,`filename`,`status`,`author`,`pubtime`,`img`,`flashFilename`,`school`,`viewcount`,`filetype`,`menuId`) values (5,'html初级教程','201304271834049284.txt',1,'admin','2013-04-27 18:34:04','201304271836472989.jpg','201304271834051459.swf','哈哈',0,1,4),(6,'css中级','201304271839100285.txt',1,'admin','2013-04-27 18:39:09','201304271839098787.jpg','201304271839101767.swf','aa',0,2,7),(7,'java高级语法','201304271840013347.txt',1,'admin','2013-04-27 18:40:01','201304271840012126.jpg','201304271840014700.swf','aa',0,3,10);

/*Table structure for table `file_type` */

DROP TABLE IF EXISTS `file_type`;

CREATE TABLE `file_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `file_type` */

insert  into `file_type`(`id`,`name`) values (1,'初级类'),(2,'中级类'),(3,'高级类');

/*Table structure for table `homework_title` */

DROP TABLE IF EXISTS `homework_title`;

CREATE TABLE `homework_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pubtime` datetime DEFAULT NULL,
  `description` text,
  `title` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `homework_title` */

insert  into `homework_title`(`id`,`pubtime`,`description`,`title`) values (1,'2013-04-26 14:22:49','完成数组int[] a = {100,40, 60, 87, 34, 11, 56, 0}的快速排序、冒泡排序；','实现快速排序、冒泡排序；'),(2,'2013-04-26 14:24:15','将一个数组中值=0的项去掉,将不为0的值存入一个新的数组,比如:<br />\r\nint a[]={1,3,4,5,0,0,6,6,0,5,4,7,6,7,0,5};<br />\r\n生成的新数组为:<br />\r\nint b[]={1,3,4,5,6,6,5,4,7,6,7,5}<br />','将一个数组中值=0的项去掉,将不为0的值存入一个新的数组');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `source` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(10) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `viewnum` int(11) DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL,
  `menuId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK338AD3817C679E` (`menuId`),
  CONSTRAINT `FK338AD3817C679E` FOREIGN KEY (`menuId`) REFERENCES `news_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`content`,`source`,`status`,`title`,`author`,`pubtime`,`viewnum`,`img`,`menuId`) values (10,'&nbsp;此新闻纯属虚构。','校园网',4,'大一美女新生报道','admin','2013-04-27 17:33:39',0,'201304271733396452.jpg',3),(12,'&nbsp;这个校园动态新闻1，你懂的。','哈哈',1,'这个校园动态新闻1，你懂的。','admin','2013-04-27 17:35:24',0,NULL,3),(13,'&nbsp;这个校园动态新闻1，你懂的。','哈哈',2,'这个校园动态新闻2，你懂的。','admin','2013-04-27 17:35:42',0,NULL,3),(14,'&nbsp;这个校园动态新闻1，你懂的。','哈哈',1,'这个校园动态新闻1，你懂的。','admin','2013-04-27 17:36:34',0,NULL,3),(15,'&nbsp;这个校园风采新闻1，你懂的。','哈哈',1,'这个校园风采新闻1，你懂的。','admin','2013-04-27 17:37:10',0,NULL,4),(16,'&nbsp;这个校园风采新闻1，你懂的。','哈哈',2,'这个校园风采新闻2，你懂的。','admin','2013-04-27 17:37:19',0,NULL,4),(17,'&nbsp;这个校园风采新闻1，你懂的。','哈哈',2,'这个校园风采新闻2，你懂的。','admin','2013-04-27 17:37:19',0,NULL,4),(18,'&nbsp;这个校园风采新闻1，你懂的。','哈哈',2,'这个校园风采新闻1，你懂的。','admin','2013-04-27 17:37:27',0,NULL,4);

/*Table structure for table `news_menu` */

DROP TABLE IF EXISTS `news_menu`;

CREATE TABLE `news_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `news_menu` */

insert  into `news_menu`(`id`,`name`) values (3,'校园动态'),(4,'校园风采');

/*Table structure for table `source_menu` */

DROP TABLE IF EXISTS `source_menu`;

CREATE TABLE `source_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `source_menu` */

insert  into `source_menu`(`id`,`name`) values (3,'java资源'),(4,'网页基础资源');

/*Table structure for table `source_table` */

DROP TABLE IF EXISTS `source_table`;

CREATE TABLE `source_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `pubtime` datetime DEFAULT NULL,
  `fileSize` varchar(20) NOT NULL,
  `menuId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK639746AADCD8A326` (`menuId`),
  CONSTRAINT `FK639746AADCD8A326` FOREIGN KEY (`menuId`) REFERENCES `source_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `source_table` */

insert  into `source_table`(`id`,`name`,`filename`,`pubtime`,`fileSize`,`menuId`) values (2,'java编程思想','201304271844560452.txt','2013-04-27 18:44:56','10',3),(3,'css基础','201304271845128702.txt','2013-04-27 18:45:12','10',4);

/*Table structure for table `topic_menu` */

DROP TABLE IF EXISTS `topic_menu`;

CREATE TABLE `topic_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `topic_menu` */

insert  into `topic_menu`(`id`,`name`) values (1,'学习交流'),(2,'灌水专区');

/*Table structure for table `topic_table` */

DROP TABLE IF EXISTS `topic_table`;

CREATE TABLE `topic_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `pubtime` datetime DEFAULT NULL,
  `detail` text NOT NULL,
  `replynum` int(11) DEFAULT NULL,
  `edituser` varchar(50) DEFAULT NULL,
  `edittime` datetime DEFAULT NULL,
  `menuId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKFA7A8CBECC9051BC` (`menuId`),
  KEY `FKFA7A8CBE2A868CC3` (`userId`),
  CONSTRAINT `FKFA7A8CBE2A868CC3` FOREIGN KEY (`userId`) REFERENCES `user_table` (`id`),
  CONSTRAINT `FKFA7A8CBECC9051BC` FOREIGN KEY (`menuId`) REFERENCES `topic_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `topic_table` */

insert  into `topic_table`(`id`,`title`,`pubtime`,`detail`,`replynum`,`edituser`,`edittime`,`menuId`,`userId`) values (2,'java好好学啊','2013-04-27 18:51:40','&nbsp;哈哈',1,'user2','2013-04-27 18:51:53',1,3);

/*Table structure for table `user_table` */

DROP TABLE IF EXISTS `user_table`;

CREATE TABLE `user_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `authorite` varchar(50) NOT NULL,
  `enable` bit(1) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user_table` */

insert  into `user_table`(`id`,`username`,`password`,`authorite`,`enable`,`email`) values (1,'admin','123','ROLE_SUPERVISOR','','123@126.com'),(2,'user1','123','ROLE_USER','\0','234@qq.com'),(3,'user2','123','ROLE_USER','','345@qq.com');

/*Table structure for table `userhoumework_table` */

DROP TABLE IF EXISTS `userhoumework_table`;

CREATE TABLE `userhoumework_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `titleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE86B38DB1D35ECEF` (`titleId`),
  KEY `FKE86B38DB2A868CC3` (`userId`),
  CONSTRAINT `FKE86B38DB1D35ECEF` FOREIGN KEY (`titleId`) REFERENCES `homework_title` (`id`),
  CONSTRAINT `FKE86B38DB2A868CC3` FOREIGN KEY (`userId`) REFERENCES `user_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `userhoumework_table` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
