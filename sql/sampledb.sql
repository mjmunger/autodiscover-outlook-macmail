-- MySQL dump 10.13  Distrib 5.5.59, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: postfix
-- ------------------------------------------------------
-- Server version	5.5.59-0+deb8u1

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Admins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('michael@highpoweredhelp.com','961bca033c4c4d20778ebf0c241da18e4dff4cd81e89420388d154f61456870d','2017-02-06 15:58:25','2017-12-22 14:16:48',1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alias`
--

DROP TABLE IF EXISTS `alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alias` (
  `address` varchar(255) NOT NULL,
  `goto` text NOT NULL,
  `domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`address`),
  KEY `domain` (`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Aliases';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alias`
--

LOCK TABLES `alias` WRITE;
/*!40000 ALTER TABLE `alias` DISABLE KEYS */;
INSERT INTO `alias` VALUES ('ssl@2dogsbottleshoppe.com','ssl@2dogsbottleshoppe.com','2dogsbottleshoppe.com','2017-02-14 14:33:15','2017-02-14 14:33:15',1),('michael@realsmarttech.com','michael@realsmarttech.com','realsmarttech.com','2017-06-19 15:09:28','2017-06-19 15:09:28',1),('testing2@realsmarttech.com','testing2@realsmarttech.com','realsmarttech.com','2017-06-19 15:09:59','2017-06-19 15:09:59',1),('richard.li@realsmarttech.com','richard.li@realsmarttech.com','realsmarttech.com','2017-06-19 15:16:13','2017-06-19 15:16:13',1),('kai.zhao@realsmarttech.com','kai.zhao@realsmarttech.com','realsmarttech.com','2017-06-19 15:18:03','2017-06-19 15:18:03',1),('david.deng@realsmarttech.com','david.deng@realsmarttech.com','realsmarttech.com','2017-06-19 15:22:18','2017-06-19 15:22:18',1),('jeff.yin@realsmarttech.com','jeff.yin@realsmarttech.com','realsmarttech.com','2017-06-19 15:22:42','2017-06-19 15:22:42',1),('tony.hong@realsmarttech.com','tony.hong@realsmarttech.com','realsmarttech.com','2017-06-19 15:23:49','2017-06-19 15:23:49',1),('weiju.chen@realsmarttech.com','weiju.chen@realsmarttech.com','realsmarttech.com','2017-06-19 15:24:09','2017-06-19 15:24:09',1),('michaelmunger@realsmarttech.com','michael@realsmarttech.com','realsmarttech.com','2017-06-19 15:25:42','2017-06-19 15:25:42',1),('michael.munger@realsmarttech.com','michael@realsmarttech.com','realsmarttech.com','2017-06-19 15:28:09','2017-06-19 15:28:09',1),('max-test@realsmarttech.com','max-test@realsmarttech.com','realsmarttech.com','2017-07-11 14:23:57','2017-07-11 14:23:57',1),('abuse@excaliburexhibits.com','abuse@host01.highpoweredhelp.com','excaliburexhibits.com','2017-12-22 13:31:11','2017-12-22 13:31:11',1),('hostmaster@excaliburexhibits.com','hostmaster@host01.highpoweredhelp.com','excaliburexhibits.com','2017-12-22 13:31:11','2017-12-22 13:31:11',1),('postmaster@excaliburexhibits.com','postmaster@host01.highpoweredhelp.com','excaliburexhibits.com','2017-12-22 13:31:11','2017-12-22 13:31:11',1),('webmaster@excaliburexhibits.com','webmaster@host01.highpoweredhelp.com','excaliburexhibits.com','2017-12-22 13:31:11','2017-12-22 13:31:11',1),('pswords@excaliburexhibits.com','pswords@excaliburexhibits.com','excaliburexhibits.com','2017-12-22 13:32:53','2017-12-22 13:32:53',1),('jwellings@excaliburexhibits.com','jwellings@excaliburexhibits.com','excaliburexhibits.com','2017-12-22 14:21:12','2017-12-22 14:21:12',1),('rthreadgill@excaliburexhibits.com','rthreadgill@excaliburexhibits.com','excaliburexhibits.com','2017-12-22 14:42:38','2017-12-22 14:42:38',1),('estreight@excaliburexhibits.com','estreight@excaliburexhibits.com','excaliburexhibits.com','2017-12-22 15:19:33','2017-12-22 15:19:33',1),('jharris@excaliburexhibits.com','jharris@excaliburexhibits.com','excaliburexhibits.com','2017-12-22 15:35:24','2017-12-22 15:35:24',1),('smeeks@excaliburexhibits.com','smeeks@excaliburexhibits.com','excaliburexhibits.com','2017-12-22 15:35:42','2017-12-22 15:35:42',1),('pmoore@excaliburexhibits.com','pmoore@excaliburexhibits.com','excaliburexhibits.com','2017-12-22 15:36:04','2017-12-22 15:36:04',1),('cbarber@excaliburexhibits.com','cbarber@excaliburexhibits.com','excaliburexhibits.com','2017-12-22 15:36:23','2017-12-22 15:36:23',1),('mhitt@excaliburexhibits.com','mhitt@excaliburexhibits.com','excaliburexhibits.com','2017-12-22 15:36:47','2017-12-22 15:36:47',1),('ldiaz@excaliburexhibits.com','ldiaz@excaliburexhibits.com','excaliburexhibits.com','2017-12-22 15:37:09','2017-12-22 15:37:09',1),('kswords@excaliburexhibits.com','kswords@excaliburexhibits.com','excaliburexhibits.com','2017-12-22 15:39:59','2017-12-22 15:39:59',1),('abuse@c317.io','michael@highpoweredhelp.com','c317.io','2018-02-15 18:23:40','2018-02-15 18:28:53',1),('hostmaster@c317.io','michael@highpoweredhelp.com','c317.io','2018-02-15 18:23:40','2018-02-15 18:29:00',1),('postmaster@c317.io','michael@highpoweredhelp.com','c317.io','2018-02-15 18:23:40','2018-02-15 18:29:08',1),('webmaster@c317.io','michael@highpoweredhelp.com','c317.io','2018-02-15 18:23:40','2018-02-15 18:29:15',1),('mjmunger@c317.io','mjmunger@c317.io','c317.io','2018-02-15 18:25:09','2018-02-15 18:25:09',1),('ewmunger@c317.io','ewmunger@c317.io','c317.io','2018-02-15 18:25:23','2018-02-15 18:25:23',1),('lartymovich@c317.io','lartymovich@c317.io','c317.io','2018-02-15 18:26:22','2018-02-15 18:26:22',1),('sartymovich@c317.io','sartymovich@c317.io','c317.io','2018-02-15 18:26:45','2018-02-15 18:26:45',1),('careers@c317.io','mjmunger@c317.io,ewmunger@c317.io,lartymovich@c317.io,sartymovich@c317.io','c317.io','2018-02-15 19:53:52','2018-02-15 20:01:53',1),('hello@c317.io','mjmunger@c317.io','c317.io','2018-02-15 19:54:17','2018-02-15 19:54:17',1),('ptashev@c317.io','ptashev@c317.io','c317.io','2018-03-08 07:04:04','2018-03-08 07:04:04',1);
/*!40000 ALTER TABLE `alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alias_domain`
--

DROP TABLE IF EXISTS `alias_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alias_domain` (
  `alias_domain` varchar(255) NOT NULL,
  `target_domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`alias_domain`),
  KEY `active` (`active`),
  KEY `target_domain` (`target_domain`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Domain Aliases';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alias_domain`
--

LOCK TABLES `alias_domain` WRITE;
/*!40000 ALTER TABLE `alias_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `alias_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `value` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='PostfixAdmin settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'version','740');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domain`
--

DROP TABLE IF EXISTS `domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain` (
  `domain` varchar(255) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `aliases` int(10) NOT NULL DEFAULT '0',
  `mailboxes` int(10) NOT NULL DEFAULT '0',
  `maxquota` bigint(20) NOT NULL DEFAULT '0',
  `quota` bigint(20) NOT NULL DEFAULT '0',
  `transport` varchar(255) NOT NULL,
  `backupmx` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Domains';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain`
--

LOCK TABLES `domain` WRITE;
/*!40000 ALTER TABLE `domain` DISABLE KEYS */;
INSERT INTO `domain` VALUES ('ALL','',0,0,0,0,'',0,'0000-00-00 00:00:00','0000-00-00 00:00:00',1),('realsmarttech.com','',10,10,10,0,'virtual',0,'2017-06-19 15:08:38','2017-06-19 15:08:38',1),('otcexhibits.com','',10,10,10,0,'virtual',0,'2017-02-12 09:35:20','2017-02-12 09:35:20',1),('2dogsbottleshoppe.com','',10,10,10,0,'virtual',0,'2017-02-13 13:51:22','2017-02-13 13:51:22',1),('excaliburexhibits.com','',0,0,10,0,'virtual',0,'2017-12-22 13:31:11','2017-12-22 13:31:11',1),('c317.io','',0,0,10,0,'virtual',0,'2018-02-15 18:23:40','2018-02-15 18:23:40',1);
/*!40000 ALTER TABLE `domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domain_admins`
--

DROP TABLE IF EXISTS `domain_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_admins` (
  `username` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Domain Admins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain_admins`
--

LOCK TABLES `domain_admins` WRITE;
/*!40000 ALTER TABLE `domain_admins` DISABLE KEYS */;
INSERT INTO `domain_admins` VALUES ('michael@highpoweredhelp.com','ALL','2017-02-07 17:40:14',1);
/*!40000 ALTER TABLE `domain_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fetchmail`
--

DROP TABLE IF EXISTS `fetchmail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fetchmail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mailbox` varchar(255) NOT NULL,
  `src_server` varchar(255) NOT NULL,
  `src_auth` enum('password','kerberos_v5','kerberos','kerberos_v4','gssapi','cram-md5','otp','ntlm','msn','ssh','any') DEFAULT NULL,
  `src_user` varchar(255) NOT NULL,
  `src_password` varchar(255) NOT NULL,
  `src_folder` varchar(255) NOT NULL,
  `poll_time` int(11) unsigned NOT NULL DEFAULT '10',
  `fetchall` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keep` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `protocol` enum('POP3','IMAP','POP2','ETRN','AUTO') DEFAULT NULL,
  `usessl` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `extra_options` text,
  `returned_text` text,
  `mda` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fetchmail`
--

LOCK TABLES `fetchmail` WRITE;
/*!40000 ALTER TABLE `fetchmail` DISABLE KEYS */;
/*!40000 ALTER TABLE `fetchmail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `username` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `data` text NOT NULL,
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES ('2017-06-19 15:24:09','michael@highpoweredhelp.com (176.106.67.254)','realsmarttech.com','create_mailbox','weiju.chen@realsmarttech.com'),('2017-06-19 15:23:49','michael@highpoweredhelp.com (176.106.67.254)','realsmarttech.com','create_mailbox','tony.hong@realsmarttech.com'),('2017-06-19 15:22:42','michael@highpoweredhelp.com (176.106.67.254)','realsmarttech.com','create_mailbox','jeff.yin@realsmarttech.com'),('2017-06-19 15:22:18','michael@highpoweredhelp.com (176.106.67.254)','realsmarttech.com','create_mailbox','david.deng@realsmarttech.com'),('2017-06-19 15:18:03','michael@highpoweredhelp.com (176.106.67.254)','realsmarttech.com','create_mailbox','kai.zhao@realsmarttech.com'),('2017-06-19 15:16:13','michael@highpoweredhelp.com (176.106.67.254)','realsmarttech.com','create_mailbox','richard.li@realsmarttech.com'),('2017-06-19 15:09:59','michael@highpoweredhelp.com (176.106.67.254)','realsmarttech.com','create_mailbox','testing2@realsmarttech.com'),('2017-06-19 15:09:28','michael@highpoweredhelp.com (176.106.67.254)','realsmarttech.com','create_mailbox','michael@realsmarttech.com'),('2017-02-14 14:33:15','michael@highpoweredhelp.com (176.106.67.254)','2dogsbottleshoppe.com','create_mailbox','ssl@2dogsbottleshoppe.com'),('2017-06-19 15:25:42','michael@highpoweredhelp.com (176.106.67.254)','realsmarttech.com','create_alias','michaelmunger@realsmarttech.com -> michael@realsmarttech.com'),('2017-06-19 15:28:09','michael@highpoweredhelp.com (176.106.67.254)','realsmarttech.com','create_alias','michael.munger@realsmarttech.com -> michael@realsmarttech.com'),('2017-07-11 14:23:57','michael@highpoweredhelp.com (176.106.67.254)','realsmarttech.com','create_mailbox','max-test@realsmarttech.com'),('2017-07-11 15:18:16','michael@highpoweredhelp.com (176.106.67.254)','realsmarttech.com','edit_mailbox','max-test@realsmarttech.com'),('2017-07-11 15:40:04','michael@highpoweredhelp.com (176.106.67.254)','realsmarttech.com','edit_mailbox','max-test@realsmarttech.com'),('2017-07-11 15:50:34','michael@highpoweredhelp.com (176.106.67.254)','realsmarttech.com','edit_mailbox','max-test@realsmarttech.com'),('2017-12-22 13:32:53','michael@highpoweredhelp.com (173.171.129.52)','excaliburexhibits.com','create_mailbox','pswords@excaliburexhibits.com'),('2017-12-22 13:44:14','michael@highpoweredhelp.com (173.171.129.52)','excaliburexhibits.com','edit_mailbox','pswords@excaliburexhibits.com'),('2017-12-22 13:45:29','michael@highpoweredhelp.com (173.171.129.52)','excaliburexhibits.com','edit_mailbox','pswords@excaliburexhibits.com'),('2017-12-22 14:21:12','michael@highpoweredhelp.com (173.171.129.52)','excaliburexhibits.com','create_mailbox','jwellings@excaliburexhibits.com'),('2017-12-22 14:42:38','michael@highpoweredhelp.com (173.171.129.52)','excaliburexhibits.com','create_mailbox','rthreadgill@excaliburexhibits.com'),('2017-12-22 14:44:05','michael@highpoweredhelp.com (173.171.129.52)','excaliburexhibits.com','edit_mailbox','rthreadgill@excaliburexhibits.com'),('2017-12-22 15:15:14','michael@highpoweredhelp.com (76.216.70.65)','excaliburexhibits.com','edit_mailbox','rthreadgill@excaliburexhibits.com'),('2017-12-22 15:19:33','michael@highpoweredhelp.com (76.216.70.65)','excaliburexhibits.com','create_mailbox','estreight@excaliburexhibits.com'),('2017-12-22 15:35:24','michael@highpoweredhelp.com (76.216.70.65)','excaliburexhibits.com','create_mailbox','jharris@excaliburexhibits.com'),('2017-12-22 15:35:42','michael@highpoweredhelp.com (76.216.70.65)','excaliburexhibits.com','create_mailbox','smeeks@excaliburexhibits.com'),('2017-12-22 15:36:04','michael@highpoweredhelp.com (76.216.70.65)','excaliburexhibits.com','create_mailbox','pmoore@excaliburexhibits.com'),('2017-12-22 15:36:23','michael@highpoweredhelp.com (76.216.70.65)','excaliburexhibits.com','create_mailbox','cbarber@excaliburexhibits.com'),('2017-12-22 15:36:47','michael@highpoweredhelp.com (76.216.70.65)','excaliburexhibits.com','create_mailbox','mhitt@excaliburexhibits.com'),('2017-12-22 15:37:09','michael@highpoweredhelp.com (76.216.70.65)','excaliburexhibits.com','create_mailbox','ldiaz@excaliburexhibits.com'),('2017-12-22 15:39:59','michael@highpoweredhelp.com (76.216.70.65)','excaliburexhibits.com','create_mailbox','kswords@excaliburexhibits.com'),('2017-12-28 11:17:12','michael@highpoweredhelp.com (173.171.140.251)','excaliburexhibits.com','edit_mailbox','jwellings@excaliburexhibits.com'),('2018-01-02 15:10:09','michael@highpoweredhelp.com (176.106.67.254)','excaliburexhibits.com','edit_mailbox','smeeks@excaliburexhibits.com'),('2018-01-05 22:44:03','michael@highpoweredhelp.com (76.216.70.65)','excaliburexhibits.com','edit_mailbox','kswords@excaliburexhibits.com'),('2018-01-05 22:46:44','michael@highpoweredhelp.com (76.216.70.65)','excaliburexhibits.com','edit_mailbox','kswords@excaliburexhibits.com'),('2018-01-06 12:14:16','michael@highpoweredhelp.com (76.216.70.65)','excaliburexhibits.com','edit_mailbox','pmoore@excaliburexhibits.com'),('2018-02-15 18:23:58','michael@highpoweredhelp.com (192.168.250.202)','c317.io','create_mailbox','michael@c317.io'),('2018-02-15 18:24:23','michael@highpoweredhelp.com (192.168.250.202)','c317.io','delete_alias','michael@c317.io'),('2018-02-15 18:24:23','michael@highpoweredhelp.com (192.168.250.202)','c317.io','delete_mailbox','michael@c317.io'),('2018-02-15 18:25:09','michael@highpoweredhelp.com (192.168.250.202)','c317.io','create_mailbox','mjmunger@c317.io'),('2018-02-15 18:25:23','michael@highpoweredhelp.com (192.168.250.202)','c317.io','create_mailbox','ewmunger@c317.io'),('2018-02-15 18:26:22','michael@highpoweredhelp.com (192.168.250.202)','c317.io','create_mailbox','lartymovich@c317.io'),('2018-02-15 18:26:45','michael@highpoweredhelp.com (192.168.250.202)','c317.io','create_mailbox','sartymovich@c317.io'),('2018-02-15 18:28:35','michael@highpoweredhelp.com (192.168.250.202)','c317.io','edit_mailbox','lartymovich@c317.io'),('2018-02-15 18:28:53','michael@highpoweredhelp.com (192.168.250.202)','c317.io','edit_alias','abuse@c317.io -> michael@highpoweredhelp.com'),('2018-02-15 18:29:00','michael@highpoweredhelp.com (192.168.250.202)','c317.io','edit_alias','hostmaster@c317.io -> michael@highpoweredhelp.com'),('2018-02-15 18:29:08','michael@highpoweredhelp.com (192.168.250.202)','c317.io','edit_alias','postmaster@c317.io -> michael@highpoweredhelp.com'),('2018-02-15 18:29:15','michael@highpoweredhelp.com (192.168.250.202)','c317.io','edit_alias','webmaster@c317.io -> michael@highpoweredhelp.com'),('2018-02-15 19:53:52','michael@highpoweredhelp.com (192.168.250.202)','c317.io','create_alias','careers@c317.io -> mjmunger@c317.io,ewmunger@c317.io,lartymovich@c317.io,sartymovich@c317.89'),('2018-02-15 19:54:17','michael@highpoweredhelp.com (192.168.250.202)','c317.io','create_alias','hello@c317.io -> mjmunger@c317.io'),('2018-02-15 19:59:21','michael@highpoweredhelp.com (192.168.250.202)','c317.io','edit_mailbox','sartymovich@c317.io'),('2018-02-15 20:01:53','michael@highpoweredhelp.com (192.168.250.202)','c317.io','edit_alias','careers@c317.io -> mjmunger@c317.io,ewmunger@c317.io,lartymovich@c317.io,sartymovich@c317.io'),('2018-03-08 07:04:04','michael@highpoweredhelp.com (192.168.250.170)','c317.io','create_mailbox','ptashev@c317.io'),('2018-03-08 07:07:11','michael@highpoweredhelp.com (192.168.250.170)','c317.io','edit_mailbox','ptashev@c317.io');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailbox`
--

DROP TABLE IF EXISTS `mailbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailbox` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `maildir` varchar(255) NOT NULL,
  `quota` bigint(20) NOT NULL DEFAULT '0',
  `local_part` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`username`),
  KEY `domain` (`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Mailboxes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailbox`
--

LOCK TABLES `mailbox` WRITE;
/*!40000 ALTER TABLE `mailbox` DISABLE KEYS */;
INSERT INTO `mailbox` VALUES ('ssl@2dogsbottleshoppe.com','961bca033c4c4d20778ebf0c241da18e4dff4cd81e89420388d154f61456870d','','2dogsbottleshoppe.com/ssl/',0,'ssl','2dogsbottleshoppe.com','2017-02-14 14:33:15','2017-02-14 14:33:15',1),('michael@realsmarttech.com','402640ee1ef8b6177e9f8ff5f9b85a213a56894db51e37aeb1b9fafbed455a91','Michael','realsmarttech.com/michael/',0,'michael','realsmarttech.com','2017-06-19 15:09:28','2017-06-19 15:09:28',1),('testing2@realsmarttech.com','ab0069927b9300edb2ff8046e4b17f4b778cb87c98e2f5581909b734c767237c','testing','realsmarttech.com/testing2/',0,'testing2','realsmarttech.com','2017-06-19 15:09:59','2017-06-19 15:09:59',1),('richard.li@realsmarttech.com','$1$c479d058$tekDesR.fFY7xIqs2CRTm.','Richard Li','realsmarttech.com/richard.li/',0,'richard.li','realsmarttech.com','2017-06-19 15:16:13','2017-06-19 15:16:13',1),('kai.zhao@realsmarttech.com','$1$d05673fc$W1KVBoIzWeI2.o6kshbS30','Kai Zhao','realsmarttech.com/kai.zhao/',0,'kai.zhao','realsmarttech.com','2017-06-19 15:18:03','2017-06-19 15:18:03',1),('david.deng@realsmarttech.com','$1$61157ce9$2.h8Cs0vAWazxfLbwNw9L.','David Deng','realsmarttech.com/david.deng/',0,'david.deng','realsmarttech.com','2017-06-19 15:22:18','2017-06-19 15:22:18',1),('jeff.yin@realsmarttech.com','$1$78f6a56d$KvtgJGZjPWFeJjCmXqaP01','Jeff Yin','realsmarttech.com/jeff.yin/',0,'jeff.yin','realsmarttech.com','2017-06-19 15:22:42','2017-06-19 15:22:42',1),('tony.hong@realsmarttech.com','$1$4350abd5$iMAj.eAe1M.onS/t56sV8/','Tony Hong','realsmarttech.com/tony.hong/',0,'tony.hong','realsmarttech.com','2017-06-19 15:23:49','2017-06-19 15:23:49',1),('weiju.chen@realsmarttech.com','$1$b48c09cd$QAnCZMpiHM5rsio8lFOHe0','Wei Ju Chen','realsmarttech.com/weiju.chen/',0,'weiju.chen','realsmarttech.com','2017-06-19 15:24:09','2017-06-19 15:24:09',1),('max-test@realsmarttech.com','$1$bd2e5a91$GC5i1K0DGY0bIZwxswKGS1','','realsmarttech.com/max-test/',0,'max-test','realsmarttech.com','2017-07-11 14:23:57','2017-07-11 15:50:34',1),('pswords@excaliburexhibits.com','a21bd9c67c5610fda43114f3547a7714a365b25f55bca80e76cdfb3dc7fcf771','Peggy Swords','excaliburexhibits.com/pswords/',0,'pswords','excaliburexhibits.com','2017-12-22 13:32:53','2017-12-22 13:45:29',1),('jwellings@excaliburexhibits.com','947fcac102b9d1c84699aca6bcc6351825e15b10e57964fc36886d1a4b22afd7','Jeff Wellings','excaliburexhibits.com/jwellings/',0,'jwellings','excaliburexhibits.com','2017-12-22 14:21:12','2017-12-28 11:17:12',1),('rthreadgill@excaliburexhibits.com','02161f2b9579bb3557799d5712b6f0295a3043a95ec2c877c8df3de5d1161cb1','Rebecca Threadgill','excaliburexhibits.com/rthreadgill/',0,'rthreadgill','excaliburexhibits.com','2017-12-22 14:42:38','2017-12-22 15:15:14',1),('estreight@excaliburexhibits.com','a63dcf96ba12a048ee289d4bebb2b1b2f005e05438e99988f81413662c731293','Erik Streight','excaliburexhibits.com/estreight/',0,'estreight','excaliburexhibits.com','2017-12-22 15:19:33','2017-12-22 15:19:33',1),('jharris@excaliburexhibits.com','faccb1941b7d1592e9bc2f18866443543bdf83ae73dbaec79f95595b98bf9f4a','Jessica Harris','excaliburexhibits.com/jharris/',0,'jharris','excaliburexhibits.com','2017-12-22 15:35:24','2017-12-22 15:35:24',1),('smeeks@excaliburexhibits.com','947fcac102b9d1c84699aca6bcc6351825e15b10e57964fc36886d1a4b22afd7','Stacy Meeks','excaliburexhibits.com/smeeks/',0,'smeeks','excaliburexhibits.com','2017-12-22 15:35:42','2018-01-02 15:10:09',1),('pmoore@excaliburexhibits.com','729fb0558d170e3e67427b8152a8ba5f52267992e2a81247c656933610e7c0db','Phil Moore','excaliburexhibits.com/pmoore/',0,'pmoore','excaliburexhibits.com','2017-12-22 15:36:04','2018-01-06 12:14:16',1),('cbarber@excaliburexhibits.com','62b8df1102a4c48fbee80f9fb149def9a1a14c26fb5acc0d8412685d1de8eaf7','Camie Barber','excaliburexhibits.com/cbarber/',0,'cbarber','excaliburexhibits.com','2017-12-22 15:36:23','2017-12-22 15:36:23',1),('mhitt@excaliburexhibits.com','947fcac102b9d1c84699aca6bcc6351825e15b10e57964fc36886d1a4b22afd7','Matt Hitt','excaliburexhibits.com/mhitt/',0,'mhitt','excaliburexhibits.com','2017-12-22 15:36:47','2017-12-22 15:36:47',1),('ldiaz@excaliburexhibits.com','b773459012491bc94e505b9fb877d9ee89a8fb0a1a5a7fd5d89eac02f48fd7ae','Luis Diaz','excaliburexhibits.com/ldiaz/',0,'ldiaz','excaliburexhibits.com','2017-12-22 15:37:09','2017-12-22 15:37:09',1),('kswords@excaliburexhibits.com','23b41d4650a67f5c013196c6fb90d7adb223f3a5b0f62743a317e2e02a2dfdc2','Kelly Swords','excaliburexhibits.com/kswords/',0,'kswords','excaliburexhibits.com','2017-12-22 15:39:59','2018-01-05 22:46:44',1),('mjmunger@c317.io','51608e8af18faaa3caf8c34ff68876b07fe23c6a4fc353e143177726a9b01fed','Michael J. Munger','c317.io/mjmunger/',0,'mjmunger','c317.io','2018-02-15 18:25:09','2018-02-15 18:25:09',1),('ewmunger@c317.io','7d3742f144f2159b994744cb4f81abb8a148829685b943740085792239fbc588','Erica W. Munger','c317.io/ewmunger/',0,'ewmunger','c317.io','2018-02-15 18:25:23','2018-02-15 18:25:23',1),('lartymovich@c317.io','5ae3b633a1f19be774e1dc6b05a136175001482a6716965967f93621c8ad9865','Lesia Artymovich','c317.io/lartymovich/',0,'lartymovich','c317.io','2018-02-15 18:26:22','2018-02-15 18:28:35',1),('sartymovich@c317.io','839d0445539cdada8c109a3d159b82dabf91f3f7a756a7884580e4e0bc2755d5','Serhiy Artymovich','c317.io/sartymovich/',0,'sartymovich','c317.io','2018-02-15 18:26:45','2018-02-15 19:59:21',1),('ptashev@c317.io','f34245af82e43de9804f0bfad5773d7a2881dc02547891d843cd0b248f8ff0f7','Peter Tashev','c317.io/ptashev/',0,'ptashev','c317.io','2018-03-08 07:04:04','2018-03-08 07:07:11',1);
/*!40000 ALTER TABLE `mailbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quota`
--

DROP TABLE IF EXISTS `quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota` (
  `username` varchar(255) NOT NULL,
  `path` varchar(100) NOT NULL,
  `current` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`username`,`path`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quota`
--

LOCK TABLES `quota` WRITE;
/*!40000 ALTER TABLE `quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quota2`
--

DROP TABLE IF EXISTS `quota2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota2` (
  `username` varchar(100) NOT NULL,
  `bytes` bigint(20) NOT NULL DEFAULT '0',
  `messages` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quota2`
--

LOCK TABLES `quota2` WRITE;
/*!40000 ALTER TABLE `quota2` DISABLE KEYS */;
/*!40000 ALTER TABLE `quota2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacation`
--

DROP TABLE IF EXISTS `vacation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacation` (
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 NOT NULL,
  `body` text CHARACTER SET utf8 NOT NULL,
  `cache` text NOT NULL,
  `domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`email`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Vacation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacation`
--

LOCK TABLES `vacation` WRITE;
/*!40000 ALTER TABLE `vacation` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacation_notification`
--

DROP TABLE IF EXISTS `vacation_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacation_notification` (
  `on_vacation` varchar(255) CHARACTER SET latin1 NOT NULL,
  `notified` varchar(255) CHARACTER SET latin1 NOT NULL,
  `notified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`on_vacation`,`notified`),
  CONSTRAINT `vacation_notification_pkey` FOREIGN KEY (`on_vacation`) REFERENCES `vacation` (`email`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Postfix Admin - Virtual Vacation Notifications';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacation_notification`
--

LOCK TABLES `vacation_notification` WRITE;
/*!40000 ALTER TABLE `vacation_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacation_notification` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-08  7:38:21
