/*
SQLyog Ultimate v8.82 
MySQL - 5.1.45-community : Database - office_manager
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`office_manager` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `office_manager`;

/*Table structure for table `emp_attendance` */

DROP TABLE IF EXISTS `emp_attendance`;

CREATE TABLE `emp_attendance` (
  `ecode` int(4) DEFAULT NULL,
  `atnd_date` date DEFAULT NULL,
  `time_in` varchar(30) DEFAULT NULL,
  `time_out` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `emp_attendance` */

insert  into `emp_attendance`(`ecode`,`atnd_date`,`time_in`,`time_out`) values (1002,'2024-03-06','7:11:25','11:2:31'),(1003,'2024-03-08','5:40:36','5:40:42');

/*Table structure for table `emp_mstr` */

DROP TABLE IF EXISTS `emp_mstr`;

CREATE TABLE `emp_mstr` (
  `ecode` int(4) NOT NULL,
  `ename` varchar(30) DEFAULT NULL,
  `edob` date DEFAULT NULL,
  `egender` varchar(30) DEFAULT NULL,
  `epost` varchar(30) DEFAULT NULL,
  `eaddr` varchar(30) DEFAULT NULL,
  `ecity` varchar(30) DEFAULT NULL,
  `econt` decimal(10,0) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `idname` varchar(30) DEFAULT NULL,
  `idno` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`ecode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `emp_mstr` */

insert  into `emp_mstr`(`ecode`,`ename`,`edob`,`egender`,`epost`,`eaddr`,`ecity`,`econt`,`email`,`idname`,`idno`) values (1002,'razi','1999-01-02','mail','kapoopur','kapoopur','lucknow','8299108499','razikhan@gmail.com','razik','2200100153'),(1003,'sajid','2010-01-22','Male','kapoopur','kapoopur','ghazipur','8299208498','sajid8980@gmail.com','sajidk','1900500123'),(1005,'Imtiyaj Ahmad','1995-06-08','Male','kapoopur','kapoopur','ghazipur','1234567891','imtijaz@gmail.com','kimtijaz','1950090000');

/*Table structure for table `emp_status` */

DROP TABLE IF EXISTS `emp_status`;

CREATE TABLE `emp_status` (
  `ecode` int(4) NOT NULL,
  `join_date` date DEFAULT NULL,
  `last_work_date` date DEFAULT NULL,
  `emp_status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ecode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `emp_status` */

insert  into `emp_status`(`ecode`,`join_date`,`last_work_date`,`emp_status`) values (1002,'2024-03-06','2024-03-09','working'),(1003,'2024-03-06',NULL,'working'),(1005,'2024-03-08',NULL,'working');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `user` varchar(30) DEFAULT NULL,
  `pswd` varchar(30) DEFAULT NULL,
  `utype` varchar(30) DEFAULT NULL,
  `ac_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`user`,`pswd`,`utype`,`ac_status`) values ('razi','9090','admin','1'),('1002','1234','Employee','0'),('1003','123456','Employee','1'),('1005','8299','Employee','1'),('1005','8299','Employee','1'),('1005','8299','Employee','1'),('1005','8299','Employee','1'),('1005','8299','Employee','1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
