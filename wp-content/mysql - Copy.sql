-- MySQL dump 10.13  Distrib 5.5.41-37.0, for debian-linux-gnu (i686)
--
-- Host: 127.0.0.1    Database: wp_kaluahb2c
-- ------------------------------------------------------
-- Server version	5.5.41-37.0-log

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
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
INSERT INTO `wp_comments` VALUES (2,103,'froblm','jbpftq@adgzay.com','http://yygbmocksmgc.com/','213.238.175.29','2015-01-27 08:41:38','2015-01-26 19:56:38','9sef0n  <a href=\"http://exwljaikubsm.com/\" rel=\"nofollow\">exwljaikubsm</a>, [url=http://jkkwfnblkcgk.com/]jkkwfnblkcgk[/url], [link=http://vdurhprfemam.com/]vdurhprfemam[/link], http://zkleiqrsasvd.com/',0,'0','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)','',0,0);
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES (1,'siteurl','http://localhost/kaluahb2c/','yes');
INSERT INTO `wp_options` VALUES (2,'blogname','Kaluah','yes');
INSERT INTO `wp_options` VALUES (3,'blogdescription','Just another WordPress site','yes');
INSERT INTO `wp_options` VALUES (4,'users_can_register','0','yes');
INSERT INTO `wp_options` VALUES (5,'admin_email','bruno@conceptsol.com','yes');
INSERT INTO `wp_options` VALUES (6,'start_of_week','1','yes');
INSERT INTO `wp_options` VALUES (7,'use_balanceTags','0','yes');
INSERT INTO `wp_options` VALUES (8,'use_smilies','1','yes');
INSERT INTO `wp_options` VALUES (9,'require_name_email','1','yes');
INSERT INTO `wp_options` VALUES (10,'comments_notify','1','yes');
INSERT INTO `wp_options` VALUES (11,'posts_per_rss','10','yes');
INSERT INTO `wp_options` VALUES (12,'rss_use_excerpt','0','yes');
INSERT INTO `wp_options` VALUES (13,'mailserver_url','mail.example.com','yes');
INSERT INTO `wp_options` VALUES (14,'mailserver_login','login@example.com','yes');
INSERT INTO `wp_options` VALUES (15,'mailserver_pass','password','yes');
INSERT INTO `wp_options` VALUES (16,'mailserver_port','110','yes');
INSERT INTO `wp_options` VALUES (17,'default_category','1','yes');
INSERT INTO `wp_options` VALUES (18,'default_comment_status','open','yes');
INSERT INTO `wp_options` VALUES (19,'default_ping_status','open','yes');
INSERT INTO `wp_options` VALUES (20,'default_pingback_flag','1','yes');
INSERT INTO `wp_options` VALUES (21,'posts_per_page','10','yes');
INSERT INTO `wp_options` VALUES (22,'date_format','F j, Y','yes');
INSERT INTO `wp_options` VALUES (23,'time_format','g:i a','yes');
INSERT INTO `wp_options` VALUES (24,'links_updated_date_format','F j, Y g:i a','yes');
INSERT INTO `wp_options` VALUES (28,'comment_moderation','0','yes');
INSERT INTO `wp_options` VALUES (29,'moderation_notify','1','yes');
INSERT INTO `wp_options` VALUES (30,'permalink_structure','/%postname%/','yes');
INSERT INTO `wp_options` VALUES (31,'gzipcompression','0','yes');
INSERT INTO `wp_options` VALUES (32,'hack_file','0','yes');
INSERT INTO `wp_options` VALUES (33,'blog_charset','UTF-8','yes');
INSERT INTO `wp_options` VALUES (34,'moderation_keys','','no');
INSERT INTO `wp_options` VALUES (35,'active_plugins','a:6:{i:0;s:29:\"gravityforms/gravityforms.php\";i:1;s:27:\"backupbuddy/backupbuddy.php\";i:2;s:26:\"travel-logic/tl-loader.php\";i:3;s:14:\"types/wpcf.php\";i:4;s:67:\"what-template-file-am-i-viewing/what-template-file-am-i-viewing.php\";i:5;s:41:\"wordpress-importer/wordpress-importer.php\";}','yes');
INSERT INTO `wp_options` VALUES (36,'home','http://localhost/kaluahb2c/','yes');
INSERT INTO `wp_options` VALUES (37,'category_base','','yes');
INSERT INTO `wp_options` VALUES (38,'ping_sites','http://rpc.pingomatic.com/','yes');
INSERT INTO `wp_options` VALUES (39,'advanced_edit','0','yes');
INSERT INTO `wp_options` VALUES (40,'comment_max_links','2','yes');
INSERT INTO `wp_options` VALUES (41,'gmt_offset','12.75','yes');
INSERT INTO `wp_options` VALUES (42,'default_email_category','1','yes');
INSERT INTO `wp_options` VALUES (43,'recently_edited','a:5:{i:0;s:112:\"/mnt/target02/348554/www.kaluah.com/web/content/wp-content/plugins/travel-logic/templates/book-room-template.php\";i:1;s:116:\"/mnt/target02/348554/www.kaluah.com/web/content/wp-content/plugins/travel-logic/templates/hotel-details-template.php\";i:2;s:115:\"/mnt/target02/348554/www.kaluah.com/web/content/wp-content/plugins/travel-logic/templates/book-details-template.php\";i:3;s:114:\"/mnt/target02/348554/www.kaluah.com/web/content/wp-content/plugins/travel-logic/templates/hotel-rooms-template.php\";i:4;s:93:\"/mnt/target02/348554/www.kaluah.com/web/content/wp-content/plugins/travel-logic/tl-loader.php\";}','no');
INSERT INTO `wp_options` VALUES (44,'template','travel-logics','yes');
INSERT INTO `wp_options` VALUES (45,'stylesheet','travel-logics','yes');
INSERT INTO `wp_options` VALUES (46,'comment_whitelist','1','yes');
INSERT INTO `wp_options` VALUES (47,'blacklist_keys','','no');
INSERT INTO `wp_options` VALUES (48,'comment_registration','0','yes');
INSERT INTO `wp_options` VALUES (49,'html_type','text/html','yes');
INSERT INTO `wp_options` VALUES (50,'use_trackback','0','yes');
INSERT INTO `wp_options` VALUES (51,'default_role','subscriber','yes');
INSERT INTO `wp_options` VALUES (52,'db_version','30133','yes');
INSERT INTO `wp_options` VALUES (53,'uploads_use_yearmonth_folders','1','yes');
INSERT INTO `wp_options` VALUES (54,'upload_path','','yes');
INSERT INTO `wp_options` VALUES (55,'blog_public','1','yes');
INSERT INTO `wp_options` VALUES (56,'default_link_category','2','yes');
INSERT INTO `wp_options` VALUES (57,'show_on_front','page','yes');
INSERT INTO `wp_options` VALUES (58,'tag_base','','yes');
INSERT INTO `wp_options` VALUES (59,'show_avatars','1','yes');
INSERT INTO `wp_options` VALUES (60,'avatar_rating','G','yes');
INSERT INTO `wp_options` VALUES (61,'upload_url_path','','yes');
INSERT INTO `wp_options` VALUES (62,'thumbnail_size_w','150','yes');
INSERT INTO `wp_options` VALUES (63,'thumbnail_size_h','150','yes');
INSERT INTO `wp_options` VALUES (64,'thumbnail_crop','1','yes');
INSERT INTO `wp_options` VALUES (65,'medium_size_w','300','yes');
INSERT INTO `wp_options` VALUES (66,'medium_size_h','300','yes');
INSERT INTO `wp_options` VALUES (67,'avatar_default','mystery','yes');
INSERT INTO `wp_options` VALUES (68,'large_size_w','1024','yes');
INSERT INTO `wp_options` VALUES (69,'large_size_h','1024','yes');
INSERT INTO `wp_options` VALUES (70,'image_default_link_type','file','yes');
INSERT INTO `wp_options` VALUES (71,'image_default_size','','yes');
INSERT INTO `wp_options` VALUES (72,'image_default_align','','yes');
INSERT INTO `wp_options` VALUES (73,'close_comments_for_old_posts','0','yes');
INSERT INTO `wp_options` VALUES (74,'close_comments_days_old','14','yes');
INSERT INTO `wp_options` VALUES (75,'thread_comments','1','yes');
INSERT INTO `wp_options` VALUES (76,'thread_comments_depth','5','yes');
INSERT INTO `wp_options` VALUES (77,'page_comments','0','yes');
INSERT INTO `wp_options` VALUES (78,'comments_per_page','50','yes');
INSERT INTO `wp_options` VALUES (79,'default_comments_page','newest','yes');
INSERT INTO `wp_options` VALUES (80,'comment_order','asc','yes');
INSERT INTO `wp_options` VALUES (81,'sticky_posts','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (82,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (83,'widget_text','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (84,'widget_rss','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (85,'uninstall_plugins','a:0:{}','no');
INSERT INTO `wp_options` VALUES (86,'timezone_string','','yes');
INSERT INTO `wp_options` VALUES (87,'page_for_posts','69','yes');
INSERT INTO `wp_options` VALUES (88,'page_on_front','5','yes');
INSERT INTO `wp_options` VALUES (89,'default_post_format','0','yes');
INSERT INTO `wp_options` VALUES (90,'link_manager_enabled','0','yes');
INSERT INTO `wp_options` VALUES (91,'initial_db_version','24448','yes');
INSERT INTO `wp_options` VALUES (92,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:9:\"add_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes');
INSERT INTO `wp_options` VALUES (93,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (94,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (95,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (96,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (97,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (98,'sidebars_widgets','a:7:{s:19:\"wp_inactive_widgets\";a:0:{}s:8:\"sidebar1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:8:\"sidebar2\";a:0:{}s:7:\"footer1\";N;s:7:\"footer2\";N;s:7:\"footer3\";N;s:13:\"array_version\";i:3;}','yes');
INSERT INTO `wp_options` VALUES (99,'cron','a:7:{i:1425669960;a:1:{s:20:\"wp_maybe_auto_update\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1425692269;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1425735479;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1425737005;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1425744039;a:1:{s:27:\"pb_backupbuddy_housekeeping\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1425745246;a:1:{s:26:\"importer_scheduled_cleanup\";a:1:{s:32:\"a9d0d3e9057ea8b2b079ee8ebcc565e2\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:1:{i:0;i:111;}}}}s:7:\"version\";i:2;}','yes');
INSERT INTO `wp_options` VALUES (106,'_transient_random_seed','aa61d241507329c3403095fba5069f61','yes');
INSERT INTO `wp_options` VALUES (107,'auth_key','3i?O@:wr|o,pL2#tZ}nsAa_Jg0C8n&^D=a`!u[.b eE>?oV=?vk{}WCQtk*>%nFt','yes');
INSERT INTO `wp_options` VALUES (108,'auth_salt','[WqMy8nNFRE{?m,@]%rVm&)sx[24gk>zI=w^cH*z5)s=sgqp<%R~,>q,,gUurf0.','yes');
INSERT INTO `wp_options` VALUES (109,'logged_in_key','oI&Ri}%0PJeBFl(:Q!tl2eePMUyADR;)J*-m=Nj#RWU->6,0H3&vhs-/Rw?pEk9&','yes');
INSERT INTO `wp_options` VALUES (110,'logged_in_salt','?ki>L{)/-rQJ#tTg+-J$0K0^]~2i6h<VYs4>)a|4taX7[i3_&*RvAdD1PWCzBEJ%','yes');
INSERT INTO `wp_options` VALUES (111,'nonce_key','6C `mutNu{H1SM8^9O_wuS!Mx^5JC0[^[nBCDNp[6_{Y3V(&-qItmu^}*U!<2PWJ','yes');
INSERT INTO `wp_options` VALUES (112,'nonce_salt','`svuJUo)aN>Y5EMd$.UfE%R,`}5iR)cNoE8v*~Q7:e>I Dqh:>~ERwt!QKoOZwRT','yes');
INSERT INTO `wp_options` VALUES (115,'dashboard_widget_options','a:4:{s:25:\"dashboard_recent_comments\";a:1:{s:5:\"items\";i:5;}s:24:\"dashboard_incoming_links\";a:5:{s:4:\"home\";s:57:\"http://www.kaluah.com.php53-18.ord1-1.websitetestlink.com\";s:4:\"link\";s:133:\"http://blogsearch.google.com/blogsearch?scoring=d&partner=wordpress&q=link:http://www.kaluah.com.php53-18.ord1-1.websitetestlink.com/\";s:3:\"url\";s:166:\"http://blogsearch.google.com/blogsearch_feeds?scoring=d&ie=utf-8&num=10&output=rss&partner=wordpress&q=link:http://www.kaluah.com.php53-18.ord1-1.websitetestlink.com/\";s:5:\"items\";i:10;s:9:\"show_date\";b:0;}s:17:\"dashboard_primary\";a:7:{s:4:\"link\";s:26:\"http://wordpress.org/news/\";s:3:\"url\";s:31:\"http://wordpress.org/news/feed/\";s:5:\"title\";s:14:\"WordPress Blog\";s:5:\"items\";i:2;s:12:\"show_summary\";i:1;s:11:\"show_author\";i:0;s:9:\"show_date\";i:1;}s:19:\"dashboard_secondary\";a:7:{s:4:\"link\";s:28:\"http://planet.wordpress.org/\";s:3:\"url\";s:33:\"http://planet.wordpress.org/feed/\";s:5:\"title\";s:20:\"Other WordPress News\";s:5:\"items\";i:5;s:12:\"show_summary\";i:0;s:11:\"show_author\";i:0;s:9:\"show_date\";i:0;}}','yes');
INSERT INTO `wp_options` VALUES (149,'recently_activated','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (152,'theme_mods_twentythirteen','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1383141780;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}}}}','yes');
INSERT INTO `wp_options` VALUES (153,'current_theme','Travel Logic','yes');
INSERT INTO `wp_options` VALUES (154,'theme_mods_travel-logics','a:2:{i:0;b:0;s:18:\"nav_menu_locations\";a:2:{s:8:\"main_nav\";i:2;s:12:\"footer_links\";i:3;}}','yes');
INSERT INTO `wp_options` VALUES (155,'theme_switched','','yes');
INSERT INTO `wp_options` VALUES (156,'optionsframework','a:2:{s:2:\"id\";s:11:\"travellogic\";s:12:\"knownoptions\";a:1:{i:0;s:11:\"travellogic\";}}','yes');
INSERT INTO `wp_options` VALUES (157,'travellogic','a:22:{s:18:\"heading_typography\";a:3:{s:4:\"face\";s:7:\"Default\";s:5:\"style\";s:6:\"Normal\";s:5:\"color\";s:0:\"\";}s:20:\"main_body_typography\";a:3:{s:4:\"face\";s:7:\"Default\";s:5:\"style\";s:6:\"Normal\";s:5:\"color\";s:0:\"\";}s:10:\"link_color\";s:0:\"\";s:16:\"link_hover_color\";s:0:\"\";s:17:\"link_active_color\";s:0:\"\";s:12:\"nav_position\";s:0:\"\";s:16:\"top_nav_bg_color\";s:0:\"\";s:19:\"showhidden_gradient\";s:1:\"0\";s:29:\"top_nav_bottom_gradient_color\";s:0:\"\";s:18:\"top_nav_link_color\";s:0:\"\";s:24:\"top_nav_link_hover_color\";s:0:\"\";s:21:\"top_nav_dropdown_item\";s:0:\"\";s:25:\"top_nav_dropdown_hover_bg\";s:0:\"\";s:10:\"search_bar\";s:1:\"0\";s:17:\"showhidden_themes\";s:1:\"0\";s:10:\"wpbs_theme\";s:7:\"default\";s:24:\"showhidden_slideroptions\";s:1:\"0\";s:14:\"slider_options\";s:1:\"5\";s:18:\"hero_unit_bg_color\";s:0:\"\";s:25:\"suppress_comments_message\";s:1:\"1\";s:9:\"blog_hero\";s:1:\"1\";s:8:\"wpbs_css\";s:0:\"\";}','yes');
INSERT INTO `wp_options` VALUES (161,'tlogic_global_settings','a:12:{s:32:\"tlogic_global_pages_hotel-search\";s:1:\"5\";s:33:\"tlogic_global_pages_hotel-details\";s:1:\"8\";s:29:\"tlogic_global_pages_book-room\";s:2:\"10\";s:29:\"tlogic_global_pages_book-conf\";s:2:\"12\";s:33:\"tlogic_global_pages_ticket-search\";s:3:\"123\";s:34:\"tlogic_global_pages_ticket-details\";s:3:\"124\";s:31:\"tlogic_global_pages_book-ticket\";s:3:\"125\";s:31:\"tlogic_global_pages_ticket-conf\";s:3:\"126\";s:30:\"tlogic_global_pages_car-search\";s:3:\"127\";s:31:\"tlogic_global_pages_car-details\";s:3:\"128\";s:28:\"tlogic_global_pages_book-car\";s:0:\"\";s:28:\"tlogic_global_pages_car-conf\";s:0:\"\";}','yes');
INSERT INTO `wp_options` VALUES (336,'pb_backupbuddy','a:81:{s:12:\"data_version\";s:1:\"8\";s:21:\"importbuddy_pass_hash\";s:32:\"81dc9bdb52d04dc20036dbd8313ed055\";s:23:\"importbuddy_pass_length\";i:4;s:16:\"backup_reminders\";i:1;s:16:\"edits_since_last\";i:0;s:17:\"last_backup_start\";i:1422898002;s:18:\"last_backup_finish\";i:1422896638;s:18:\"last_backup_serial\";s:10:\"vetfa6dubu\";s:17:\"last_backup_stats\";a:10:{s:11:\"archiveFile\";s:85:\"backup-www_kaluah_com_php54-3_ord1-1_websitetestlink_com-2015_02_03-db-9vz5ra708n.zip\";s:10:\"archiveURL\";s:181:\"http://localhost/kaluahb2c/wp-content/uploads/backupbuddy_backups/backup-www_kaluah_com_php54-3_ord1-1_websitetestlink_com-2015_02_03-db-9vz5ra708n.zip\";s:11:\"archiveSize\";i:155996;s:5:\"start\";i:1422896627;s:6:\"finish\";i:1422896638;s:4:\"type\";s:2:\"db\";s:12:\"profileTitle\";s:13:\"Database Only\";s:13:\"scheduleTitle\";s:0:\"\";s:15:\"integrityStatus\";b:1;s:12:\"destinations\";a:0:{}}s:19:\"force_compatibility\";i:0;s:29:\"force_mysqldump_compatibility\";i:0;s:9:\"schedules\";a:0:{}s:9:\"log_level\";s:1:\"1\";s:13:\"high_security\";i:0;s:19:\"next_schedule_index\";i:100;s:13:\"archive_limit\";i:0;s:18:\"archive_limit_size\";i:0;s:17:\"archive_limit_age\";i:0;s:26:\"delete_archives_pre_backup\";i:0;s:23:\"lock_archives_directory\";i:0;s:28:\"email_notify_scheduled_start\";s:0:\"\";s:36:\"email_notify_scheduled_start_subject\";s:49:\"BackupBuddy Scheduled Backup Started - {site_url}\";s:33:\"email_notify_scheduled_start_body\";s:140:\"A scheduled backup has started with BackupBuddy v{backupbuddy_version} on {current_datetime} for the site {site_url}.\n\nDetails:\r\n\r\n{message}\";s:31:\"email_notify_scheduled_complete\";s:0:\"\";s:39:\"email_notify_scheduled_complete_subject\";s:50:\"BackupBuddy Scheduled Backup Complete - {site_url}\";s:36:\"email_notify_scheduled_complete_body\";s:142:\"A scheduled backup has completed with BackupBuddy v{backupbuddy_version} on {current_datetime} for the site {site_url}.\n\nDetails:\r\n\r\n{message}\";s:24:\"email_notify_send_finish\";s:0:\"\";s:32:\"email_notify_send_finish_subject\";s:43:\"BackupBuddy File Send Finished - {site_url}\";s:29:\"email_notify_send_finish_body\";s:146:\"A destination file send has finished with BackupBuddy v{backupbuddy_version} on {current_datetime} for the site {site_url}.\n\nDetails:\r\n\r\n{message}\";s:18:\"email_notify_error\";s:20:\"bruno@conceptsol.com\";s:26:\"email_notify_error_subject\";s:30:\"BackupBuddy Error - {site_url}\";s:23:\"email_notify_error_body\";s:132:\"An error occurred with BackupBuddy v{backupbuddy_version} on {current_datetime} for the site {site_url}. Error details:\r\n\r\n{message}\";s:12:\"email_return\";s:0:\"\";s:19:\"remote_destinations\";a:0:{}s:11:\"role_access\";s:16:\"activate_plugins\";s:16:\"dropboxtemptoken\";s:0:\"\";s:11:\"backup_mode\";s:1:\"2\";s:16:\"multisite_export\";s:1:\"0\";s:16:\"backup_directory\";s:0:\"\";s:14:\"temp_directory\";s:0:\"\";s:13:\"log_directory\";s:0:\"\";s:10:\"log_serial\";s:15:\"s476m0cb9p8171q\";s:13:\"notifications\";a:0:{}s:19:\"zip_method_strategy\";s:1:\"1\";s:24:\"database_method_strategy\";s:3:\"php\";s:17:\"alternative_zip_2\";s:1:\"0\";s:19:\"ignore_zip_warnings\";s:1:\"0\";s:19:\"ignore_zip_symlinks\";s:1:\"1\";s:25:\"disable_zipmethod_caching\";s:1:\"0\";s:19:\"archive_name_format\";s:4:\"date\";s:30:\"disable_https_local_ssl_verify\";s:1:\"0\";s:17:\"save_comment_meta\";s:1:\"1\";s:27:\"ignore_command_length_check\";s:1:\"0\";s:18:\"default_backup_tab\";s:1:\"0\";s:18:\"deployment_allowed\";s:1:\"0\";s:7:\"api_key\";s:0:\"\";s:5:\"stats\";a:6:{s:9:\"site_size\";i:0;s:18:\"site_size_excluded\";i:0;s:17:\"site_size_updated\";i:0;s:7:\"db_size\";i:0;s:16:\"db_size_excluded\";i:0;s:15:\"db_size_updated\";i:0;}s:9:\"disalerts\";a:0:{}s:15:\"breakout_tables\";s:1:\"0\";s:19:\"include_importbuddy\";s:1:\"1\";s:17:\"max_site_log_size\";s:2:\"10\";s:11:\"compression\";i:1;s:25:\"no_new_backups_error_days\";s:2:\"45\";s:15:\"skip_quicksetup\";s:1:\"0\";s:13:\"prevent_flush\";s:1:\"0\";s:17:\"rollback_cleanups\";a:0:{}s:20:\"phpmysqldump_maxrows\";s:0:\"\";s:20:\"disable_localization\";s:1:\"0\";s:18:\"max_execution_time\";s:0:\"\";s:24:\"backup_cron_rescheduling\";s:1:\"0\";s:11:\"deployments\";a:0:{}s:8:\"profiles\";a:3:{i:0;a:8:{s:4:\"type\";s:8:\"defaults\";s:5:\"title\";s:15:\"Global Defaults\";s:18:\"skip_database_dump\";i:0;s:19:\"backup_nonwp_tables\";i:0;s:15:\"integrity_check\";i:1;s:29:\"mysqldump_additional_includes\";s:0:\"\";s:29:\"mysqldump_additional_excludes\";s:0:\"\";s:8:\"excludes\";s:0:\"\";}i:1;a:3:{s:4:\"type\";s:2:\"db\";s:5:\"title\";s:13:\"Database Only\";s:3:\"tip\";s:49:\"Just your database. I like your minimalist style.\";}i:2;a:2:{s:4:\"type\";s:4:\"full\";s:5:\"title\";s:15:\"Complete Backup\";}}s:14:\"include_tables\";a:0:{}s:14:\"exclude_tables\";a:0:{}s:7:\"backups\";a:0:{}s:12:\"remote_sends\";a:0:{}s:14:\"mysqldump_mode\";s:6:\"prefix\";s:29:\"mysqldump_additional_includes\";s:0:\"\";s:29:\"mysqldump_additional_excludes\";s:0:\"\";s:18:\"zip_viewer_enabled\";s:1:\"0\";i:0;b:0;}','yes');
INSERT INTO `wp_options` VALUES (337,'pluginbuddy_plugins','a:1:{s:11:\"backupbuddy\";O:8:\"stdClass\":9:{s:3:\"url\";s:53:\"http://localhost:47920/wp-content/plugins/backupbuddy\";s:4:\"slug\";s:11:\"backupbuddy\";s:7:\"package\";s:0:\"\";s:11:\"new_version\";s:7:\"3.2.0.2\";s:11:\"last_update\";i:1384264839;s:2:\"id\";s:1:\"0\";s:3:\"key\";s:0:\"\";s:10:\"key_status\";s:2:\"ok\";s:4:\"guid\";s:13:\"528234879641e\";}}','yes');
INSERT INTO `wp_options` VALUES (474,'WPLANG','','yes');
INSERT INTO `wp_options` VALUES (475,'db_upgraded','','yes');
INSERT INTO `wp_options` VALUES (478,'nav_menu_options','a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}','yes');
INSERT INTO `wp_options` VALUES (617,'wpcf-messages','a:1:{i:1;a:0:{}}','yes');
INSERT INTO `wp_options` VALUES (618,'wpcf-survey-2014-09','dismiss','yes');
INSERT INTO `wp_options` VALUES (619,'wpcf-custom-taxonomies','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (620,'wpcf-custom-types','a:1:{s:4:\"deal\";a:21:{s:6:\"labels\";a:12:{s:4:\"name\";s:16:\"Deals and Offers\";s:13:\"singular_name\";s:4:\"deal\";s:7:\"add_new\";s:7:\"Add New\";s:12:\"add_new_item\";s:10:\"Add New %s\";s:9:\"edit_item\";s:7:\"Edit %s\";s:8:\"new_item\";s:6:\"New %s\";s:9:\"view_item\";s:7:\"View %s\";s:12:\"search_items\";s:9:\"Search %s\";s:9:\"not_found\";s:11:\"No %s found\";s:18:\"not_found_in_trash\";s:20:\"No %s found in Trash\";s:17:\"parent_item_colon\";s:11:\"Parent text\";s:9:\"all_items\";s:9:\"All items\";}s:4:\"slug\";s:4:\"deal\";s:11:\"description\";s:0:\"\";s:4:\"icon\";s:3:\"tag\";s:6:\"public\";s:6:\"public\";s:13:\"menu_position\";s:0:\"\";s:9:\"menu_icon\";s:0:\"\";s:10:\"taxonomies\";a:1:{s:8:\"category\";s:1:\"1\";}s:8:\"supports\";a:4:{s:5:\"title\";s:1:\"1\";s:6:\"editor\";s:1:\"1\";s:9:\"thumbnail\";s:1:\"1\";s:13:\"custom-fields\";s:1:\"1\";}s:7:\"rewrite\";a:5:{s:7:\"enabled\";s:1:\"1\";s:6:\"custom\";s:6:\"normal\";s:4:\"slug\";s:0:\"\";s:10:\"with_front\";s:1:\"1\";s:5:\"pages\";s:1:\"1\";}s:11:\"has_archive\";s:1:\"1\";s:12:\"show_in_menu\";s:1:\"1\";s:17:\"show_in_menu_page\";s:0:\"\";s:7:\"show_ui\";s:1:\"1\";s:18:\"publicly_queryable\";s:1:\"1\";s:10:\"can_export\";s:1:\"1\";s:17:\"show_in_nav_menus\";s:1:\"1\";s:17:\"query_var_enabled\";s:1:\"1\";s:9:\"query_var\";s:0:\"\";s:16:\"permalink_epmask\";s:12:\"EP_PERMALINK\";s:14:\"wpcf-post-type\";N;}}','yes');
INSERT INTO `wp_options` VALUES (621,'wpcf_post_relationship','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (625,'wpcf-fields','a:1:{s:10:\"save-up-to\";a:8:{s:2:\"id\";s:10:\"save-up-to\";s:4:\"slug\";s:10:\"save-up-to\";s:4:\"type\";s:9:\"textfield\";s:4:\"name\";s:10:\"Save Up To\";s:11:\"description\";s:0:\"\";s:4:\"data\";a:4:{s:10:\"repetitive\";s:1:\"0\";s:6:\"is_new\";s:1:\"1\";s:19:\"conditional_display\";a:0:{}s:16:\"disabled_by_type\";i:0;}s:8:\"meta_key\";s:15:\"wpcf-save-up-to\";s:9:\"meta_type\";s:8:\"postmeta\";}}','yes');
INSERT INTO `wp_options` VALUES (626,'_wpcf_promo_tabs','a:2:{s:8:\"selected\";i:1;s:4:\"time\";i:1412033695;}','yes');
INSERT INTO `wp_options` VALUES (654,'gravityformsaddon_gravityformswebapi_version','1.0','yes');
INSERT INTO `wp_options` VALUES (655,'rg_form_version','1.8.8.7','yes');
INSERT INTO `wp_options` VALUES (697,'ithemes-updater-cache','a:9:{s:12:\"server-cache\";i:30;s:10:\"expiration\";i:0;s:9:\"timestamp\";i:0;s:8:\"packages\";a:1:{i:0;s:11:\"backupbuddy\";}s:14:\"update_plugins\";a:0:{}s:13:\"update_themes\";a:0:{}s:12:\"use_ca_patch\";b:0;s:7:\"use_ssl\";b:1;s:14:\"quick_releases\";b:0;}','yes');
INSERT INTO `wp_options` VALUES (1401,'rg_gforms_message','<!--GFM--><!-- unregistered copy notice -->\r\n<div style=\\\"margin:10px 0 10px 0; border-bottom:1px solid #D7D7D7; text-align:center; display:block!important; visibility: visible!important; min-width:760px;\\\"><a href=\\\"http://www.gravityforms.com\\\" target=\\\"_blank\\\"><img src=\\\"https://gravityforms.s3.amazonaws.com/banners/gravity-forms-unregistered.png\\\" width=\\\"758\\\" height=\\\"52\\\" alt=\\\"unlicensed copy. please purchase a Gravity Forms license\\\" /></a></div>\r\n<!-- end notice -->','yes');
INSERT INTO `wp_options` VALUES (1658,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:2:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:57:\"https://downloads.wordpress.org/release/wordpress-4.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://downloads.wordpress.org/release/wordpress-4.1.zip\";s:10:\"no_content\";s:68:\"https://downloads.wordpress.org/release/wordpress-4.1-no-content.zip\";s:11:\"new_bundled\";s:69:\"https://downloads.wordpress.org/release/wordpress-4.1-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:3:\"4.1\";s:7:\"version\";s:3:\"4.1\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.1\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:57:\"https://downloads.wordpress.org/release/wordpress-4.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://downloads.wordpress.org/release/wordpress-4.1.zip\";s:10:\"no_content\";s:68:\"https://downloads.wordpress.org/release/wordpress-4.1-no-content.zip\";s:11:\"new_bundled\";s:69:\"https://downloads.wordpress.org/release/wordpress-4.1-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:3:\"4.1\";s:7:\"version\";s:3:\"4.1\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.1\";s:15:\"partial_version\";s:0:\"\";s:13:\"support_email\";s:26:\"updatehelp40@wordpress.org\";}}s:12:\"last_checked\";i:1422890820;s:15:\"version_checked\";s:5:\"4.0.1\";s:12:\"translations\";a:0:{}}','yes');
INSERT INTO `wp_options` VALUES (1661,'auto_core_update_notified','a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:20:\"bruno@conceptsol.com\";s:7:\"version\";s:5:\"4.0.1\";s:9:\"timestamp\";i:1416530012;}','yes');
INSERT INTO `wp_options` VALUES (2951,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1422890822;s:7:\"checked\";a:5:{s:17:\"travel-logic12333\";s:3:\"2.1\";s:13:\"travel-logics\";s:3:\"2.1\";s:14:\"twentyfourteen\";s:3:\"1.2\";s:14:\"twentythirteen\";s:3:\"1.0\";s:12:\"twentytwelve\";s:3:\"1.2\";}s:8:\"response\";a:3:{s:14:\"twentyfourteen\";a:4:{s:5:\"theme\";s:14:\"twentyfourteen\";s:11:\"new_version\";s:3:\"1.3\";s:3:\"url\";s:43:\"https://wordpress.org/themes/twentyfourteen\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentyfourteen.1.3.zip\";}s:14:\"twentythirteen\";a:4:{s:5:\"theme\";s:14:\"twentythirteen\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:43:\"https://wordpress.org/themes/twentythirteen\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentythirteen.1.4.zip\";}s:12:\"twentytwelve\";a:4:{s:5:\"theme\";s:12:\"twentytwelve\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:41:\"https://wordpress.org/themes/twentytwelve\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwelve.1.6.zip\";}}s:12:\"translations\";a:0:{}}','yes');
INSERT INTO `wp_options` VALUES (2952,'_site_transient_update_plugins','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1422890822;s:8:\"response\";a:1:{s:14:\"types/wpcf.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"24557\";s:4:\"slug\";s:5:\"types\";s:6:\"plugin\";s:14:\"types/wpcf.php\";s:11:\"new_version\";s:5:\"1.6.4\";s:3:\"url\";s:36:\"https://wordpress.org/plugins/types/\";s:7:\"package\";s:54:\"https://downloads.wordpress.org/plugin/types.1.6.4.zip\";}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:3:{s:9:\"hello.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:4:\"3564\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip\";}s:31:\"what-template/what-template.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"32555\";s:4:\"slug\";s:13:\"what-template\";s:6:\"plugin\";s:31:\"what-template/what-template.php\";s:11:\"new_version\";s:3:\"0.1\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/what-template/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/what-template.zip\";}s:67:\"what-template-file-am-i-viewing/what-template-file-am-i-viewing.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"30280\";s:4:\"slug\";s:31:\"what-template-file-am-i-viewing\";s:6:\"plugin\";s:67:\"what-template-file-am-i-viewing/what-template-file-am-i-viewing.php\";s:11:\"new_version\";s:3:\"1.2\";s:3:\"url\";s:62:\"https://wordpress.org/plugins/what-template-file-am-i-viewing/\";s:7:\"package\";s:78:\"https://downloads.wordpress.org/plugin/what-template-file-am-i-viewing.1.2.zip\";}}}','yes');
INSERT INTO `wp_options` VALUES (2985,'_transient_doing_cron','1422898003.3447160720825195312500','yes');
INSERT INTO `wp_options` VALUES (2986,'limit_login_retries','a:1:{s:13:\"67.79.179.114\";i:3;}','no');
INSERT INTO `wp_options` VALUES (2987,'limit_login_retries_valid','a:1:{s:13:\"67.79.179.114\";i:1423023260;}','no');
INSERT INTO `wp_options` VALUES (2989,'wpe_notices','a:2:{s:4:\"read\";s:0:\"\";s:8:\"messages\";a:0:{}}','yes');
INSERT INTO `wp_options` VALUES (2990,'wpe_notices_ttl','1425662086','yes');
INSERT INTO `wp_options` VALUES (2992,'can_compress_scripts','0','yes');
INSERT INTO `wp_options` VALUES (2993,'wp_installer_settings','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','yes');
INSERT INTO `wp_options` VALUES (2999,'category_children','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (3000,'rewrite_rules','a:113:{s:7:\"deal/?$\";s:24:\"index.php?post_type=deal\";s:24:\"deal/page/([0-9]{1,})/?$\";s:42:\"index.php?post_type=deal&paged=$matches[1]\";s:42:\"wp-types-group/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:52:\"wp-types-group/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:72:\"wp-types-group/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:67:\"wp-types-group/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:67:\"wp-types-group/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:35:\"wp-types-group/([^/]+)/trackback/?$\";s:41:\"index.php?wp-types-group=$matches[1]&tb=1\";s:43:\"wp-types-group/([^/]+)/page/?([0-9]{1,})/?$\";s:54:\"index.php?wp-types-group=$matches[1]&paged=$matches[2]\";s:50:\"wp-types-group/([^/]+)/comment-page-([0-9]{1,})/?$\";s:54:\"index.php?wp-types-group=$matches[1]&cpage=$matches[2]\";s:35:\"wp-types-group/([^/]+)(/[0-9]+)?/?$\";s:53:\"index.php?wp-types-group=$matches[1]&page=$matches[2]\";s:31:\"wp-types-group/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:41:\"wp-types-group/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:61:\"wp-types-group/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:56:\"wp-types-group/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:56:\"wp-types-group/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:47:\"wp-types-user-group/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"wp-types-user-group/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"wp-types-user-group/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"wp-types-user-group/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"wp-types-user-group/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"wp-types-user-group/([^/]+)/trackback/?$\";s:46:\"index.php?wp-types-user-group=$matches[1]&tb=1\";s:48:\"wp-types-user-group/([^/]+)/page/?([0-9]{1,})/?$\";s:59:\"index.php?wp-types-user-group=$matches[1]&paged=$matches[2]\";s:55:\"wp-types-user-group/([^/]+)/comment-page-([0-9]{1,})/?$\";s:59:\"index.php?wp-types-user-group=$matches[1]&cpage=$matches[2]\";s:40:\"wp-types-user-group/([^/]+)(/[0-9]+)?/?$\";s:58:\"index.php?wp-types-user-group=$matches[1]&page=$matches[2]\";s:36:\"wp-types-user-group/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:46:\"wp-types-user-group/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:66:\"wp-types-user-group/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"wp-types-user-group/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"wp-types-user-group/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:32:\"deal/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:42:\"deal/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:62:\"deal/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"deal/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"deal/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:25:\"deal/([^/]+)/trackback/?$\";s:31:\"index.php?deal=$matches[1]&tb=1\";s:33:\"deal/([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?deal=$matches[1]&paged=$matches[2]\";s:40:\"deal/([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?deal=$matches[1]&cpage=$matches[2]\";s:25:\"deal/([^/]+)(/[0-9]+)?/?$\";s:43:\"index.php?deal=$matches[1]&page=$matches[2]\";s:21:\"deal/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:31:\"deal/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:51:\"deal/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:46:\"deal/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:46:\"deal/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=5&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)(/[0-9]+)?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:20:\"([^/]+)(/[0-9]+)?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";}','yes');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (4,5,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (5,5,'_wp_page_template','page-full-width.php');
INSERT INTO `wp_postmeta` VALUES (6,5,'_edit_lock','1420577901:1');
INSERT INTO `wp_postmeta` VALUES (7,8,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (8,8,'_edit_lock','1420569498:1');
INSERT INTO `wp_postmeta` VALUES (9,8,'_wp_page_template','page-full-width.php');
INSERT INTO `wp_postmeta` VALUES (10,10,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (11,10,'_edit_lock','1421708937:1');
INSERT INTO `wp_postmeta` VALUES (12,10,'_wp_page_template','template-booking.php');
INSERT INTO `wp_postmeta` VALUES (13,12,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (14,12,'_edit_lock','1416244252:2');
INSERT INTO `wp_postmeta` VALUES (15,12,'_wp_page_template','page-full-width.php');
INSERT INTO `wp_postmeta` VALUES (16,15,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (17,15,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (18,15,'_menu_item_object_id','15');
INSERT INTO `wp_postmeta` VALUES (19,15,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (20,15,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (21,15,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (22,15,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (23,15,'_menu_item_url','#');
INSERT INTO `wp_postmeta` VALUES (25,16,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (26,16,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (27,16,'_menu_item_object_id','16');
INSERT INTO `wp_postmeta` VALUES (28,16,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (29,16,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (30,16,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (31,16,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (32,16,'_menu_item_url','#');
INSERT INTO `wp_postmeta` VALUES (34,17,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (35,17,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (36,17,'_menu_item_object_id','17');
INSERT INTO `wp_postmeta` VALUES (37,17,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (38,17,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (39,17,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (40,17,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (41,17,'_menu_item_url','#');
INSERT INTO `wp_postmeta` VALUES (43,18,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (44,18,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (45,18,'_menu_item_object_id','18');
INSERT INTO `wp_postmeta` VALUES (46,18,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (47,18,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (48,18,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (49,18,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (50,18,'_menu_item_url','#');
INSERT INTO `wp_postmeta` VALUES (52,19,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (53,19,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (54,19,'_menu_item_object_id','19');
INSERT INTO `wp_postmeta` VALUES (55,19,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (56,19,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (57,19,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (58,19,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (59,19,'_menu_item_url','#');
INSERT INTO `wp_postmeta` VALUES (61,20,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (62,20,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (63,20,'_menu_item_object_id','20');
INSERT INTO `wp_postmeta` VALUES (64,20,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (65,20,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (66,20,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (67,20,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (68,20,'_menu_item_url','#');
INSERT INTO `wp_postmeta` VALUES (70,21,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (71,21,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (72,21,'_menu_item_object_id','21');
INSERT INTO `wp_postmeta` VALUES (73,21,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (74,21,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (75,21,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (76,21,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (77,21,'_menu_item_url','#');
INSERT INTO `wp_postmeta` VALUES (79,22,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (80,22,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (81,22,'_menu_item_object_id','22');
INSERT INTO `wp_postmeta` VALUES (82,22,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (83,22,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (84,22,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (85,22,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (86,22,'_menu_item_url','#');
INSERT INTO `wp_postmeta` VALUES (88,23,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (89,23,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (90,23,'_menu_item_object_id','23');
INSERT INTO `wp_postmeta` VALUES (91,23,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (92,23,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (93,23,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (94,23,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (95,23,'_menu_item_url','#');
INSERT INTO `wp_postmeta` VALUES (97,24,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (98,24,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (99,24,'_menu_item_object_id','24');
INSERT INTO `wp_postmeta` VALUES (100,24,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (101,24,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (102,24,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (103,24,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (104,24,'_menu_item_url','#');
INSERT INTO `wp_postmeta` VALUES (115,26,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (116,26,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (117,26,'_menu_item_object_id','26');
INSERT INTO `wp_postmeta` VALUES (118,26,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (119,26,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (120,26,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (121,26,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (122,26,'_menu_item_url','#');
INSERT INTO `wp_postmeta` VALUES (123,28,'_wp_types_group_filters_association','any');
INSERT INTO `wp_postmeta` VALUES (124,28,'_wp_types_group_fields',',save-up-to,');
INSERT INTO `wp_postmeta` VALUES (125,28,'_wp_types_group_post_types',',deal,');
INSERT INTO `wp_postmeta` VALUES (126,28,'_wp_types_group_terms','all');
INSERT INTO `wp_postmeta` VALUES (127,28,'_wp_types_group_admin_styles','');
INSERT INTO `wp_postmeta` VALUES (128,28,'_wp_types_group_templates','all');
INSERT INTO `wp_postmeta` VALUES (129,28,'_wpcf_conditional_display','a:3:{s:10:\"custom_use\";s:1:\"0\";s:8:\"relation\";s:3:\"AND\";s:6:\"custom\";s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (130,29,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (131,29,'_edit_lock','1418142489:2');
INSERT INTO `wp_postmeta` VALUES (132,30,'_wp_attached_file','2014/09/africa.jpg');
INSERT INTO `wp_postmeta` VALUES (133,30,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:324;s:6:\"height\";i:237;s:4:\"file\";s:18:\"2014/09/africa.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"africa-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"africa-300x219.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:219;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"bones-thumb-600\";a:4:{s:4:\"file\";s:18:\"africa-205x150.jpg\";s:5:\"width\";i:205;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"bones-thumb-300\";a:4:{s:4:\"file\";s:18:\"africa-300x100.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:18:\"africa-125x125.jpg\";s:5:\"width\";i:125;s:6:\"height\";i:125;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:0;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}');
INSERT INTO `wp_postmeta` VALUES (134,31,'_wp_attached_file','2014/09/dubai.jpg');
INSERT INTO `wp_postmeta` VALUES (135,31,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:450;s:6:\"height\";i:302;s:4:\"file\";s:17:\"2014/09/dubai.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:17:\"dubai-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:17:\"dubai-300x201.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:201;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"wpbs-featured\";a:4:{s:4:\"file\";s:17:\"dubai-450x300.jpg\";s:5:\"width\";i:450;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"bones-thumb-600\";a:4:{s:4:\"file\";s:17:\"dubai-223x150.jpg\";s:5:\"width\";i:223;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"bones-thumb-300\";a:4:{s:4:\"file\";s:17:\"dubai-300x100.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:17:\"dubai-125x125.jpg\";s:5:\"width\";i:125;s:6:\"height\";i:125;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:0;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}');
INSERT INTO `wp_postmeta` VALUES (136,32,'_wp_attached_file','2014/09/egipt.jpg');
INSERT INTO `wp_postmeta` VALUES (137,32,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:268;s:6:\"height\";i:196;s:4:\"file\";s:17:\"2014/09/egipt.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:17:\"egipt-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"bones-thumb-600\";a:4:{s:4:\"file\";s:17:\"egipt-205x150.jpg\";s:5:\"width\";i:205;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"bones-thumb-300\";a:4:{s:4:\"file\";s:17:\"egipt-268x100.jpg\";s:5:\"width\";i:268;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:17:\"egipt-125x125.jpg\";s:5:\"width\";i:125;s:6:\"height\";i:125;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:0;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}');
INSERT INTO `wp_postmeta` VALUES (138,33,'_wp_attached_file','2014/09/greece.jpg');
INSERT INTO `wp_postmeta` VALUES (139,33,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:430;s:6:\"height\";i:286;s:4:\"file\";s:18:\"2014/09/greece.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"greece-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"greece-300x199.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:199;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"bones-thumb-600\";a:4:{s:4:\"file\";s:18:\"greece-225x150.jpg\";s:5:\"width\";i:225;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"bones-thumb-300\";a:4:{s:4:\"file\";s:18:\"greece-300x100.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:18:\"greece-125x125.jpg\";s:5:\"width\";i:125;s:6:\"height\";i:125;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:0;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}');
INSERT INTO `wp_postmeta` VALUES (140,34,'_wp_attached_file','2014/09/hawaii.jpg');
INSERT INTO `wp_postmeta` VALUES (141,34,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:438;s:6:\"height\";i:292;s:4:\"file\";s:18:\"2014/09/hawaii.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"hawaii-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"hawaii-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"bones-thumb-600\";a:4:{s:4:\"file\";s:18:\"hawaii-225x150.jpg\";s:5:\"width\";i:225;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"bones-thumb-300\";a:4:{s:4:\"file\";s:18:\"hawaii-300x100.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:18:\"hawaii-125x125.jpg\";s:5:\"width\";i:125;s:6:\"height\";i:125;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:0;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}');
INSERT INTO `wp_postmeta` VALUES (142,35,'_wp_attached_file','2014/09/machu.jpg');
INSERT INTO `wp_postmeta` VALUES (143,35,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:290;s:6:\"height\";i:201;s:4:\"file\";s:17:\"2014/09/machu.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:17:\"machu-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"bones-thumb-600\";a:4:{s:4:\"file\";s:17:\"machu-216x150.jpg\";s:5:\"width\";i:216;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"bones-thumb-300\";a:4:{s:4:\"file\";s:17:\"machu-290x100.jpg\";s:5:\"width\";i:290;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:17:\"machu-125x125.jpg\";s:5:\"width\";i:125;s:6:\"height\";i:125;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:0;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}');
INSERT INTO `wp_postmeta` VALUES (144,29,'_thumbnail_id','33');
INSERT INTO `wp_postmeta` VALUES (146,36,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (147,36,'_edit_lock','1412032115:1');
INSERT INTO `wp_postmeta` VALUES (148,36,'_thumbnail_id','34');
INSERT INTO `wp_postmeta` VALUES (149,36,'wpcf-save-up-to','30%');
INSERT INTO `wp_postmeta` VALUES (150,37,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (151,37,'_edit_lock','1412032142:1');
INSERT INTO `wp_postmeta` VALUES (152,37,'_thumbnail_id','31');
INSERT INTO `wp_postmeta` VALUES (153,37,'wpcf-save-up-to','30%');
INSERT INTO `wp_postmeta` VALUES (154,38,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (155,38,'_edit_lock','1412032169:1');
INSERT INTO `wp_postmeta` VALUES (156,38,'_thumbnail_id','30');
INSERT INTO `wp_postmeta` VALUES (157,38,'wpcf-save-up-to','30%');
INSERT INTO `wp_postmeta` VALUES (158,39,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (159,39,'_edit_lock','1412032199:1');
INSERT INTO `wp_postmeta` VALUES (160,39,'_thumbnail_id','32');
INSERT INTO `wp_postmeta` VALUES (161,39,'wpcf-save-up-to','30%');
INSERT INTO `wp_postmeta` VALUES (162,40,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (163,40,'_edit_lock','1412032225:1');
INSERT INTO `wp_postmeta` VALUES (164,40,'_thumbnail_id','35');
INSERT INTO `wp_postmeta` VALUES (165,40,'wpcf-save-up-to','30%');
INSERT INTO `wp_postmeta` VALUES (166,29,'wpcf-save-up-to','35%');
INSERT INTO `wp_postmeta` VALUES (167,41,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (168,41,'_edit_lock','1412106024:1');
INSERT INTO `wp_postmeta` VALUES (169,41,'_thumbnail_id','32');
INSERT INTO `wp_postmeta` VALUES (171,41,'wpcf-save-up-to','12');
INSERT INTO `wp_postmeta` VALUES (172,42,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (173,42,'_edit_lock','1420768940:1');
INSERT INTO `wp_postmeta` VALUES (174,42,'_wp_page_template','page-concierge.php');
INSERT INTO `wp_postmeta` VALUES (175,42,'Subtitle','Sed nisl urna, semper tristique gravida scelerisque, rutrum in mi. Integer fermentum bibendum nibh, ac condimentum leo aliquet et. Curabitur aliquet suscipit sodales.');
INSERT INTO `wp_postmeta` VALUES (176,47,'_wp_attached_file','2014/09/dining.png');
INSERT INTO `wp_postmeta` VALUES (177,47,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:186;s:6:\"height\";i:186;s:4:\"file\";s:18:\"2014/09/dining.png\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"dining-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:15:\"bones-thumb-600\";a:4:{s:4:\"file\";s:18:\"dining-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:15:\"bones-thumb-300\";a:4:{s:4:\"file\";s:18:\"dining-186x100.png\";s:5:\"width\";i:186;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:18:\"dining-125x125.png\";s:5:\"width\";i:125;s:6:\"height\";i:125;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:0;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}');
INSERT INTO `wp_postmeta` VALUES (178,48,'_wp_attached_file','2014/09/gifts1.png');
INSERT INTO `wp_postmeta` VALUES (179,48,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:186;s:6:\"height\";i:186;s:4:\"file\";s:18:\"2014/09/gifts1.png\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"gifts1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:15:\"bones-thumb-600\";a:4:{s:4:\"file\";s:18:\"gifts1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:15:\"bones-thumb-300\";a:4:{s:4:\"file\";s:18:\"gifts1-186x100.png\";s:5:\"width\";i:186;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:18:\"gifts1-125x125.png\";s:5:\"width\";i:125;s:6:\"height\";i:125;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:0;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}');
INSERT INTO `wp_postmeta` VALUES (180,49,'_wp_attached_file','2014/09/honeymoon.png');
INSERT INTO `wp_postmeta` VALUES (181,49,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:186;s:6:\"height\";i:186;s:4:\"file\";s:21:\"2014/09/honeymoon.png\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"honeymoon-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:15:\"bones-thumb-600\";a:4:{s:4:\"file\";s:21:\"honeymoon-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:15:\"bones-thumb-300\";a:4:{s:4:\"file\";s:21:\"honeymoon-186x100.png\";s:5:\"width\";i:186;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:21:\"honeymoon-125x125.png\";s:5:\"width\";i:125;s:6:\"height\";i:125;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:0;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}');
INSERT INTO `wp_postmeta` VALUES (182,50,'_wp_attached_file','2014/09/pic1.png');
INSERT INTO `wp_postmeta` VALUES (183,50,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:515;s:6:\"height\";i:343;s:4:\"file\";s:16:\"2014/09/pic1.png\";s:5:\"sizes\";a:7:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"pic1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:16:\"pic1-300x199.png\";s:5:\"width\";i:300;s:6:\"height\";i:199;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"wpbs-featured\";a:4:{s:4:\"file\";s:16:\"pic1-515x300.png\";s:5:\"width\";i:515;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"wpbs-featured-home\";a:4:{s:4:\"file\";s:16:\"pic1-515x311.png\";s:5:\"width\";i:515;s:6:\"height\";i:311;s:9:\"mime-type\";s:9:\"image/png\";}s:15:\"bones-thumb-600\";a:4:{s:4:\"file\";s:16:\"pic1-225x150.png\";s:5:\"width\";i:225;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:15:\"bones-thumb-300\";a:4:{s:4:\"file\";s:16:\"pic1-300x100.png\";s:5:\"width\";i:300;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:16:\"pic1-125x125.png\";s:5:\"width\";i:125;s:6:\"height\";i:125;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:0;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}');
INSERT INTO `wp_postmeta` VALUES (184,54,'_edit_last','2');
INSERT INTO `wp_postmeta` VALUES (185,54,'_edit_lock','1416431160:2');
INSERT INTO `wp_postmeta` VALUES (186,54,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (187,58,'_edit_last','2');
INSERT INTO `wp_postmeta` VALUES (188,58,'_edit_lock','1420754627:1');
INSERT INTO `wp_postmeta` VALUES (189,58,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (190,60,'_edit_last','2');
INSERT INTO `wp_postmeta` VALUES (191,60,'_edit_lock','1418136790:2');
INSERT INTO `wp_postmeta` VALUES (192,60,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (193,67,'_edit_last','2');
INSERT INTO `wp_postmeta` VALUES (194,67,'_edit_lock','1416245589:2');
INSERT INTO `wp_postmeta` VALUES (197,69,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (198,69,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (199,69,'_edit_lock','1420755061:1');
INSERT INTO `wp_postmeta` VALUES (200,71,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (201,71,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (202,71,'_menu_item_object_id','69');
INSERT INTO `wp_postmeta` VALUES (203,71,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (204,71,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (205,71,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (206,71,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (207,71,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (209,67,'_thumbnail_id','84');
INSERT INTO `wp_postmeta` VALUES (212,1,'_edit_lock','1416246198:2');
INSERT INTO `wp_postmeta` VALUES (213,79,'_wp_attached_file','2014/09/e760bace24567e8be6df31d27f118d5a1100b3c210879d6ff688be05fb710442.jpg');
INSERT INTO `wp_postmeta` VALUES (214,79,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:789;s:6:\"height\";i:394;s:4:\"file\";s:76:\"2014/09/e760bace24567e8be6df31d27f118d5a1100b3c210879d6ff688be05fb710442.jpg\";s:5:\"sizes\";a:7:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:76:\"e760bace24567e8be6df31d27f118d5a1100b3c210879d6ff688be05fb710442-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:76:\"e760bace24567e8be6df31d27f118d5a1100b3c210879d6ff688be05fb710442-300x149.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:149;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"wpbs-featured\";a:4:{s:4:\"file\";s:76:\"e760bace24567e8be6df31d27f118d5a1100b3c210879d6ff688be05fb710442-638x300.jpg\";s:5:\"width\";i:638;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:18:\"wpbs-featured-home\";a:4:{s:4:\"file\";s:76:\"e760bace24567e8be6df31d27f118d5a1100b3c210879d6ff688be05fb710442-789x311.jpg\";s:5:\"width\";i:789;s:6:\"height\";i:311;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"bones-thumb-600\";a:4:{s:4:\"file\";s:76:\"e760bace24567e8be6df31d27f118d5a1100b3c210879d6ff688be05fb710442-300x150.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"bones-thumb-300\";a:4:{s:4:\"file\";s:76:\"e760bace24567e8be6df31d27f118d5a1100b3c210879d6ff688be05fb710442-300x100.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:76:\"e760bace24567e8be6df31d27f118d5a1100b3c210879d6ff688be05fb710442-125x125.jpg\";s:5:\"width\";i:125;s:6:\"height\";i:125;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:11:{s:8:\"aperture\";d:4.5;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:13:\"Canon EOS 50D\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:1332439213;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:2:\"22\";s:3:\"iso\";s:3:\"640\";s:13:\"shutter_speed\";s:3:\"0.3\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:1;}}');
INSERT INTO `wp_postmeta` VALUES (215,84,'_wp_attached_file','2014/10/os-os-i-drive-live-jpg-20131219.jpeg');
INSERT INTO `wp_postmeta` VALUES (216,84,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:2048;s:6:\"height\";i:1376;s:4:\"file\";s:44:\"2014/10/os-os-i-drive-live-jpg-20131219.jpeg\";s:5:\"sizes\";a:9:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:44:\"os-os-i-drive-live-jpg-20131219-150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:44:\"os-os-i-drive-live-jpg-20131219-300x201.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:201;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:45:\"os-os-i-drive-live-jpg-20131219-1024x688.jpeg\";s:5:\"width\";i:1024;s:6:\"height\";i:688;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"wpbs-featured\";a:4:{s:4:\"file\";s:44:\"os-os-i-drive-live-jpg-20131219-638x300.jpeg\";s:5:\"width\";i:638;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:18:\"wpbs-featured-home\";a:4:{s:4:\"file\";s:44:\"os-os-i-drive-live-jpg-20131219-970x311.jpeg\";s:5:\"width\";i:970;s:6:\"height\";i:311;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:22:\"wpbs-featured-carousel\";a:4:{s:4:\"file\";s:44:\"os-os-i-drive-live-jpg-20131219-970x400.jpeg\";s:5:\"width\";i:970;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"bones-thumb-600\";a:4:{s:4:\"file\";s:44:\"os-os-i-drive-live-jpg-20131219-223x150.jpeg\";s:5:\"width\";i:223;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"bones-thumb-300\";a:4:{s:4:\"file\";s:44:\"os-os-i-drive-live-jpg-20131219-300x100.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:44:\"os-os-i-drive-live-jpg-20131219-125x125.jpeg\";s:5:\"width\";i:125;s:6:\"height\";i:125;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:0;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}');
INSERT INTO `wp_postmeta` VALUES (219,1,'_edit_last','2');
INSERT INTO `wp_postmeta` VALUES (222,88,'_wp_attached_file','2013/10/europa-vistos.jpg');
INSERT INTO `wp_postmeta` VALUES (223,88,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:500;s:6:\"height\";i:300;s:4:\"file\";s:25:\"2013/10/europa-vistos.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"europa-vistos-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:25:\"europa-vistos-300x180.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:180;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"bones-thumb-600\";a:4:{s:4:\"file\";s:25:\"europa-vistos-250x150.jpg\";s:5:\"width\";i:250;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"bones-thumb-300\";a:4:{s:4:\"file\";s:25:\"europa-vistos-300x100.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:25:\"europa-vistos-125x125.jpg\";s:5:\"width\";i:125;s:6:\"height\";i:125;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:0;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}');
INSERT INTO `wp_postmeta` VALUES (224,1,'_thumbnail_id','88');
INSERT INTO `wp_postmeta` VALUES (235,103,'_edit_lock','1420754069:1');
INSERT INTO `wp_postmeta` VALUES (236,103,'_thumbnail_id','32');
INSERT INTO `wp_postmeta` VALUES (237,103,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (240,105,'_wp_attached_file','2015/01/photo-1.png');
INSERT INTO `wp_postmeta` VALUES (241,105,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:640;s:6:\"height\";i:1136;s:4:\"file\";s:19:\"2015/01/photo-1.png\";s:5:\"sizes\";a:9:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"photo-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:19:\"photo-1-169x300.png\";s:5:\"width\";i:169;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:20:\"photo-1-576x1024.png\";s:5:\"width\";i:576;s:6:\"height\";i:1024;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"wpbs-featured\";a:4:{s:4:\"file\";s:19:\"photo-1-638x300.png\";s:5:\"width\";i:638;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"wpbs-featured-home\";a:4:{s:4:\"file\";s:19:\"photo-1-640x311.png\";s:5:\"width\";i:640;s:6:\"height\";i:311;s:9:\"mime-type\";s:9:\"image/png\";}s:22:\"wpbs-featured-carousel\";a:4:{s:4:\"file\";s:19:\"photo-1-640x400.png\";s:5:\"width\";i:640;s:6:\"height\";i:400;s:9:\"mime-type\";s:9:\"image/png\";}s:15:\"bones-thumb-600\";a:4:{s:4:\"file\";s:18:\"photo-1-84x150.png\";s:5:\"width\";i:84;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:15:\"bones-thumb-300\";a:4:{s:4:\"file\";s:19:\"photo-1-300x100.png\";s:5:\"width\";i:300;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:19:\"photo-1-125x125.png\";s:5:\"width\";i:125;s:6:\"height\";i:125;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:0;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}');
INSERT INTO `wp_postmeta` VALUES (242,107,'_edit_lock','1420754660:1');
INSERT INTO `wp_postmeta` VALUES (243,107,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (244,107,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (247,29,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (248,29,'_thumbnail_id','33');
INSERT INTO `wp_postmeta` VALUES (249,29,'wpcf-save-up-to','35%');
INSERT INTO `wp_postmeta` VALUES (250,36,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (251,36,'_thumbnail_id','34');
INSERT INTO `wp_postmeta` VALUES (252,36,'wpcf-save-up-to','30%');
INSERT INTO `wp_postmeta` VALUES (253,37,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (254,37,'_thumbnail_id','31');
INSERT INTO `wp_postmeta` VALUES (255,37,'wpcf-save-up-to','30%');
INSERT INTO `wp_postmeta` VALUES (256,38,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (257,38,'_thumbnail_id','30');
INSERT INTO `wp_postmeta` VALUES (258,38,'wpcf-save-up-to','30%');
INSERT INTO `wp_postmeta` VALUES (259,39,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (260,39,'_thumbnail_id','32');
INSERT INTO `wp_postmeta` VALUES (261,39,'wpcf-save-up-to','30%');
INSERT INTO `wp_postmeta` VALUES (262,40,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (263,40,'_thumbnail_id','35');
INSERT INTO `wp_postmeta` VALUES (264,40,'wpcf-save-up-to','30%');
INSERT INTO `wp_postmeta` VALUES (265,5,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (266,5,'_wp_page_template','page-full-width.php');
INSERT INTO `wp_postmeta` VALUES (267,8,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (268,8,'_wp_page_template','page-full-width.php');
INSERT INTO `wp_postmeta` VALUES (269,10,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (270,10,'_wp_page_template','template-booking.php');
INSERT INTO `wp_postmeta` VALUES (271,12,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (272,12,'_wp_page_template','page-full-width.php');
INSERT INTO `wp_postmeta` VALUES (273,112,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (274,112,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (275,112,'_menu_item_object_id','112');
INSERT INTO `wp_postmeta` VALUES (276,112,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (277,112,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (278,112,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (279,112,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (280,112,'_menu_item_url','#');
INSERT INTO `wp_postmeta` VALUES (281,113,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (282,113,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (283,113,'_menu_item_object_id','113');
INSERT INTO `wp_postmeta` VALUES (284,113,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (285,113,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (286,113,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (287,113,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (288,113,'_menu_item_url','#');
INSERT INTO `wp_postmeta` VALUES (289,114,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (290,114,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (291,114,'_menu_item_object_id','114');
INSERT INTO `wp_postmeta` VALUES (292,114,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (293,114,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (294,114,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (295,114,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (296,114,'_menu_item_url','#');
INSERT INTO `wp_postmeta` VALUES (297,115,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (298,115,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (299,115,'_menu_item_object_id','115');
INSERT INTO `wp_postmeta` VALUES (300,115,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (301,115,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (302,115,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (303,115,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (304,115,'_menu_item_url','#');
INSERT INTO `wp_postmeta` VALUES (305,116,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (306,116,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (307,116,'_menu_item_object_id','116');
INSERT INTO `wp_postmeta` VALUES (308,116,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (309,116,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (310,116,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (311,116,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (312,116,'_menu_item_url','#');
INSERT INTO `wp_postmeta` VALUES (313,117,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (314,117,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (315,117,'_menu_item_object_id','117');
INSERT INTO `wp_postmeta` VALUES (316,117,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (317,117,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (318,117,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (319,117,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (320,117,'_menu_item_url','#');
INSERT INTO `wp_postmeta` VALUES (321,118,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (322,118,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (323,118,'_menu_item_object_id','118');
INSERT INTO `wp_postmeta` VALUES (324,118,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (325,118,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (326,118,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (327,118,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (328,118,'_menu_item_url','#');
INSERT INTO `wp_postmeta` VALUES (329,119,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (330,119,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (331,119,'_menu_item_object_id','119');
INSERT INTO `wp_postmeta` VALUES (332,119,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (333,119,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (334,119,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (335,119,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (336,119,'_menu_item_url','#');
INSERT INTO `wp_postmeta` VALUES (337,120,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (338,120,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (339,120,'_menu_item_object_id','120');
INSERT INTO `wp_postmeta` VALUES (340,120,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (341,120,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (342,120,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (343,120,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (344,120,'_menu_item_url','#');
INSERT INTO `wp_postmeta` VALUES (345,121,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (346,121,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (347,121,'_menu_item_object_id','121');
INSERT INTO `wp_postmeta` VALUES (348,121,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (349,121,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (350,121,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (351,121,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (352,121,'_menu_item_url','#');
INSERT INTO `wp_postmeta` VALUES (353,122,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (354,122,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (355,122,'_menu_item_object_id','122');
INSERT INTO `wp_postmeta` VALUES (356,122,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (357,122,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (358,122,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (359,122,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (360,122,'_menu_item_url','#');
INSERT INTO `wp_postmeta` VALUES (361,41,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (362,41,'_thumbnail_id','32');
INSERT INTO `wp_postmeta` VALUES (363,41,'wpcf-save-up-to','12');
INSERT INTO `wp_postmeta` VALUES (364,42,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (365,42,'_wp_page_template','page-concierge.php');
INSERT INTO `wp_postmeta` VALUES (366,42,'Subtitle','Sed nisl urna, semper tristique gravida scelerisque, rutrum in mi. Integer fermentum bibendum nibh, ac condimentum leo aliquet et. Curabitur aliquet suscipit sodales.');
INSERT INTO `wp_postmeta` VALUES (367,54,'_edit_last','2');
INSERT INTO `wp_postmeta` VALUES (368,54,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (369,58,'_edit_last','2');
INSERT INTO `wp_postmeta` VALUES (370,58,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (371,1,'_edit_last','2');
INSERT INTO `wp_postmeta` VALUES (372,1,'_thumbnail_id','88');
INSERT INTO `wp_postmeta` VALUES (373,60,'_edit_last','2');
INSERT INTO `wp_postmeta` VALUES (374,60,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (375,67,'_edit_last','2');
INSERT INTO `wp_postmeta` VALUES (376,67,'_thumbnail_id','84');
INSERT INTO `wp_postmeta` VALUES (377,69,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (378,69,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (379,103,'_thumbnail_id','32');
INSERT INTO `wp_postmeta` VALUES (380,103,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (381,107,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (382,107,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (383,123,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (384,123,'_wp_page_template','page-full-width.php');
INSERT INTO `wp_postmeta` VALUES (385,124,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (386,124,'_wp_page_template','page-full-width.php');
INSERT INTO `wp_postmeta` VALUES (387,125,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (388,125,'_wp_page_template','template-booking.php');
INSERT INTO `wp_postmeta` VALUES (389,126,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (390,126,'_wp_page_template','page-full-width.php');
INSERT INTO `wp_postmeta` VALUES (391,127,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (392,127,'_wp_page_template','page-full-width.php');
INSERT INTO `wp_postmeta` VALUES (393,128,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (394,128,'_wp_page_template','page-full-width.php');
INSERT INTO `wp_postmeta` VALUES (395,129,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (396,129,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (397,129,'_menu_item_object_id','69');
INSERT INTO `wp_postmeta` VALUES (398,129,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (399,129,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (400,129,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (401,129,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (402,129,'_menu_item_url','');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (1,1,'2013-10-30 13:37:36','2013-10-30 13:37:36','Varanda.com! é o resultado de 20 anos de experiência na área de turismo e viagens. Idéia criada por uma dupla de empresárias já engajadas no ramo, o site surgiu com o intuito de proporcionar uma experiência única e inovadora na arte de viajar.\r\n\r\nTurismólogas de corpo, alma e coração, as empreendedoras de sucesso investiram no projeto do varanda.com com o intuito de superar as expectativas de seus consumidores, aliando a facilidade e agilidade da tecnologia com a personalização e o suporte de uma agência de viagens.\r\n\r\nVaranda.com nada mais é que a porta de entrada para o mundo; é a tecnologia de ponta aliada à parceiros de sucesso; é o suporte diário sem fronteiras. Muito mais que um site de venda de produtos e serviços, o Varanda.com é o elo entre o consumidor e a continuidade na realização de seus sonhos!\r\n\r\nEmbarque nesta você também!','Bem-vindo ao Varanda.com!','','publish','open','open','','hello-world','','','2014-11-17 17:39:55','2014-11-17 17:39:55','',0,'http://localhost:47920/?p=1',0,'post','',0);
INSERT INTO `wp_posts` VALUES (5,1,'2013-10-30 14:03:56','2013-10-30 14:03:56','[tlogic_hotel_search]','Hotel Search','','publish','open','open','','hotel-search','','','2013-10-30 14:07:36','2013-10-30 14:07:36','',0,'http://localhost:47920/?page_id=5',0,'page','',0);
INSERT INTO `wp_posts` VALUES (8,1,'2013-10-30 14:06:01','2013-10-30 14:06:01','[tlogic_hotel_details]','Hotel Details','','publish','open','open','','hotel-details','','','2013-10-30 14:07:39','2013-10-30 14:07:39','',0,'http://localhost:47920/?page_id=8',0,'page','',0);
INSERT INTO `wp_posts` VALUES (10,1,'2013-10-30 14:06:25','2013-10-30 14:06:25','[tlogic_book_room]','Room Booking','','publish','open','open','','room-booking','','','2015-01-20 11:17:39','2015-01-19 22:32:39','',0,'http://localhost:47920/?page_id=10',0,'page','',0);
INSERT INTO `wp_posts` VALUES (12,1,'2013-10-30 14:06:36','2013-10-30 14:06:36','[tlogic_book_conf]','Confirmation','','publish','open','open','','confirmation','','','2013-10-30 14:07:25','2013-10-30 14:07:25','',0,'http://localhost:47920/?page_id=12',0,'page','',0);
INSERT INTO `wp_posts` VALUES (15,1,'2014-09-23 20:06:53','2014-09-23 20:06:53','','Home','','publish','open','open','','home','','','2014-09-23 20:06:59','2014-09-23 20:06:59','',0,'http://localhost:8888/Concepta/Kaluah-WP/?p=15',1,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (16,1,'2014-09-23 20:06:53','2014-09-23 20:06:53','','Vacation Packages','','publish','open','open','','vacation-packages','','','2014-09-23 20:06:59','2014-09-23 20:06:59','',0,'http://localhost:8888/Concepta/Kaluah-WP/?p=16',2,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (17,1,'2014-09-23 20:06:53','2014-09-23 20:06:53','','Hotels','','publish','open','open','','hotels','','','2014-09-23 20:06:59','2014-09-23 20:06:59','',0,'http://localhost:8888/Concepta/Kaluah-WP/?p=17',3,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (18,1,'2014-09-23 20:06:53','2014-09-23 20:06:53','','Things To Do','','publish','open','open','','things-to-do','','','2014-09-23 20:06:59','2014-09-23 20:06:59','',0,'http://localhost:8888/Concepta/Kaluah-WP/?p=18',4,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (19,1,'2014-09-23 20:06:53','2014-09-23 20:06:53','','Rewards','','publish','open','open','','rewards','','','2014-09-23 20:06:59','2014-09-23 20:06:59','',0,'http://localhost:8888/Concepta/Kaluah-WP/?p=19',5,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (20,1,'2014-09-25 14:14:17','2014-09-25 14:14:17','','Home','','publish','open','open','','home-2','','','2014-10-20 19:51:18','2014-10-20 19:51:18','',0,'http://localhost:8888/Concepta/Kaluah-WP/?p=20',1,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (21,1,'2014-09-25 14:14:17','2014-09-25 14:14:17','','About','','publish','open','open','','about','','','2014-10-20 19:51:18','2014-10-20 19:51:18','',0,'http://localhost:8888/Concepta/Kaluah-WP/?p=21',2,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (22,1,'2014-09-25 14:14:17','2014-09-25 14:14:17','','Last Minute','','publish','open','open','','last-minute','','','2014-10-20 19:51:18','2014-10-20 19:51:18','',0,'http://localhost:8888/Concepta/Kaluah-WP/?p=22',3,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (23,1,'2014-09-25 14:14:17','2014-09-25 14:14:17','','Early Booking','','publish','open','open','','early-booking','','','2014-10-20 19:51:18','2014-10-20 19:51:18','',0,'http://localhost:8888/Concepta/Kaluah-WP/?p=23',4,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (24,1,'2014-09-25 14:14:17','2014-09-25 14:14:17','','Special Offers','','publish','open','open','','special-offers','','','2014-10-20 19:51:18','2014-10-20 19:51:18','',0,'http://localhost:8888/Concepta/Kaluah-WP/?p=24',5,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (26,1,'2014-09-25 14:14:17','2014-09-25 14:14:17','','Contact','','publish','open','open','','contact','','','2014-10-20 19:51:18','2014-10-20 19:51:18','',0,'http://localhost:8888/Concepta/Kaluah-WP/?p=26',7,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (28,1,'2014-09-29 23:05:12','2014-09-29 23:05:12','','Save Up To','','publish','open','open','','save-up-to','','','2014-09-29 23:05:12','2014-09-29 23:05:12','',0,'http://192.168.2.118:8888/Concepta/Kaluah-WP/?wp-types-group=save-up-to',0,'wp-types-group','',0);
INSERT INTO `wp_posts` VALUES (29,1,'2014-09-29 23:09:46','2014-09-29 23:09:46','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at tellus turpis. Suspendisse a est nulla. Vestibulum vitae ante sodales leo semper auctor. Quisque ultrices diam vel justo facilisis, sed posuere nibh pharetra. Cras posuere imperdiet suscipit. Pellentesque sit amet placerat nulla. Curabitur vel aliquet dui. Aenean in placerat orci. Duis vitae feugiat magna, id faucibus lacus. Nam sed turpis venenatis, blandit erat id, vehicula lorem. Fusce vestibulum mauris nec est mollis mollis. Donec at velit eu enim iaculis fringilla.\r\n\r\nNulla facilisis risus ipsum, eu viverra urna suscipit nec. Vestibulum orci ex, dignissim quis viverra et, posuere ac turpis. In ipsum elit, auctor vitae elementum a, condimentum non sem. Sed rutrum dictum elit, vel tempor erat aliquam in. Vivamus venenatis et metus accumsan venenatis. Nam accumsan dui eget dapibus lobortis. Mauris augue turpis, euismod a elementum vel, dictum at lacus. Vivamus commodo neque ac elit pharetra tempus sit amet non tellus. Quisque quis dui sollicitudin, dapibus tellus eget, pulvinar enim. Vivamus efficitur enim sed quam lobortis hendrerit. Suspendisse cursus ante id sapien pulvinar lacinia. Quisque tincidunt interdum arcu ut bibendum. Sed dapibus mollis erat sed euismod.\r\n\r\nNulla sit amet enim augue. Sed mi odio, condimentum nec hendrerit sed, vestibulum et tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas volutpat eleifend quam. Quisque est orci, molestie non ultricies et, egestas et lorem. Pellentesque tortor enim, ultrices eu diam ac, fringilla porta ante. Phasellus ac dictum dolor.\r\n\r\nNulla at sapien sit amet enim ornare pretium. Sed maximus hendrerit mollis. Cras dapibus imperdiet odio eget vulputate. Maecenas sed sem sed justo posuere luctus vel sit amet ante. Vivamus mattis lectus ligula, pretium tincidunt orci rhoncus nec. Vivamus vel nisl euismod, luctus justo et, iaculis diam. Morbi ullamcorper maximus mattis. Ut accumsan leo vitae elementum egestas. Fusce at ornare neque. Pellentesque pulvinar rhoncus augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam dapibus risus ac nibh feugiat, nec varius odio condimentum. Sed risus velit, condimentum nec maximus eget, molestie pulvinar est.','Visit the Hawaii Beaches','','publish','closed','closed','','visit-the-hawaii-beaches','','','2014-09-29 23:35:51','2014-09-29 23:35:51','',0,'http://192.168.2.118:8888/Concepta/Kaluah-WP/?post_type=deal&#038;p=29',0,'deal','',0);
INSERT INTO `wp_posts` VALUES (30,1,'2014-09-29 23:09:31','2014-09-29 23:09:31','','africa','','inherit','open','open','','africa','','','2014-09-29 23:09:31','2014-09-29 23:09:31','',29,'http://192.168.2.118:8888/Concepta/Kaluah-WP/wp-content/uploads/2014/09/africa.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (31,1,'2014-09-29 23:09:32','2014-09-29 23:09:32','','dubai','','inherit','open','open','','dubai','','','2014-09-29 23:09:32','2014-09-29 23:09:32','',29,'http://192.168.2.118:8888/Concepta/Kaluah-WP/wp-content/uploads/2014/09/dubai.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (32,1,'2014-09-29 23:09:33','2014-09-29 23:09:33','','egipt','','inherit','open','open','','egipt','','','2014-09-29 23:09:33','2014-09-29 23:09:33','',29,'http://192.168.2.118:8888/Concepta/Kaluah-WP/wp-content/uploads/2014/09/egipt.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (33,1,'2014-09-29 23:09:34','2014-09-29 23:09:34','','greece','','inherit','open','open','','greece','','','2014-09-29 23:09:34','2014-09-29 23:09:34','',29,'http://192.168.2.118:8888/Concepta/Kaluah-WP/wp-content/uploads/2014/09/greece.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (34,1,'2014-09-29 23:09:35','2014-09-29 23:09:35','','hawaii','','inherit','open','open','','hawaii','','','2014-09-29 23:09:35','2014-09-29 23:09:35','',29,'http://192.168.2.118:8888/Concepta/Kaluah-WP/wp-content/uploads/2014/09/hawaii.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (35,1,'2014-09-29 23:09:36','2014-09-29 23:09:36','','machu','','inherit','open','open','','machu','','','2014-09-29 23:09:36','2014-09-29 23:09:36','',29,'http://192.168.2.118:8888/Concepta/Kaluah-WP/wp-content/uploads/2014/09/machu.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (36,1,'2014-09-29 23:10:44','2014-09-29 23:10:44','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at tellus turpis. Suspendisse a est nulla. Vestibulum vitae ante sodales leo semper auctor. Quisque ultrices diam vel justo facilisis, sed posuere nibh pharetra. Cras posuere imperdiet suscipit. Pellentesque sit amet placerat nulla. Curabitur vel aliquet dui. Aenean in placerat orci. Duis vitae feugiat magna, id faucibus lacus. Nam sed turpis venenatis, blandit erat id, vehicula lorem. Fusce vestibulum mauris nec est mollis mollis. Donec at velit eu enim iaculis fringilla.\r\n\r\nNulla facilisis risus ipsum, eu viverra urna suscipit nec. Vestibulum orci ex, dignissim quis viverra et, posuere ac turpis. In ipsum elit, auctor vitae elementum a, condimentum non sem. Sed rutrum dictum elit, vel tempor erat aliquam in. Vivamus venenatis et metus accumsan venenatis. Nam accumsan dui eget dapibus lobortis. Mauris augue turpis, euismod a elementum vel, dictum at lacus. Vivamus commodo neque ac elit pharetra tempus sit amet non tellus. Quisque quis dui sollicitudin, dapibus tellus eget, pulvinar enim. Vivamus efficitur enim sed quam lobortis hendrerit. Suspendisse cursus ante id sapien pulvinar lacinia. Quisque tincidunt interdum arcu ut bibendum. Sed dapibus mollis erat sed euismod.\r\n\r\nNulla sit amet enim augue. Sed mi odio, condimentum nec hendrerit sed, vestibulum et tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas volutpat eleifend quam. Quisque est orci, molestie non ultricies et, egestas et lorem. Pellentesque tortor enim, ultrices eu diam ac, fringilla porta ante. Phasellus ac dictum dolor.\r\n\r\nNulla at sapien sit amet enim ornare pretium. Sed maximus hendrerit mollis. Cras dapibus imperdiet odio eget vulputate. Maecenas sed sem sed justo posuere luctus vel sit amet ante. Vivamus mattis lectus ligula, pretium tincidunt orci rhoncus nec. Vivamus vel nisl euismod, luctus justo et, iaculis diam. Morbi ullamcorper maximus mattis. Ut accumsan leo vitae elementum egestas. Fusce at ornare neque. Pellentesque pulvinar rhoncus augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam dapibus risus ac nibh feugiat, nec varius odio condimentum. Sed risus velit, condimentum nec maximus eget, molestie pulvinar est.','Santorini - Greece','','publish','closed','closed','','santorini-greece','','','2014-09-29 23:10:44','2014-09-29 23:10:44','',0,'http://192.168.2.118:8888/Concepta/Kaluah-WP/?post_type=deal&#038;p=36',0,'deal','',0);
INSERT INTO `wp_posts` VALUES (37,1,'2014-09-29 23:11:21','2014-09-29 23:11:21','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at tellus turpis. Suspendisse a est nulla. Vestibulum vitae ante sodales leo semper auctor. Quisque ultrices diam vel justo facilisis, sed posuere nibh pharetra. Cras posuere imperdiet suscipit. Pellentesque sit amet placerat nulla. Curabitur vel aliquet dui. Aenean in placerat orci. Duis vitae feugiat magna, id faucibus lacus. Nam sed turpis venenatis, blandit erat id, vehicula lorem. Fusce vestibulum mauris nec est mollis mollis. Donec at velit eu enim iaculis fringilla.\r\n\r\nNulla facilisis risus ipsum, eu viverra urna suscipit nec. Vestibulum orci ex, dignissim quis viverra et, posuere ac turpis. In ipsum elit, auctor vitae elementum a, condimentum non sem. Sed rutrum dictum elit, vel tempor erat aliquam in. Vivamus venenatis et metus accumsan venenatis. Nam accumsan dui eget dapibus lobortis. Mauris augue turpis, euismod a elementum vel, dictum at lacus. Vivamus commodo neque ac elit pharetra tempus sit amet non tellus. Quisque quis dui sollicitudin, dapibus tellus eget, pulvinar enim. Vivamus efficitur enim sed quam lobortis hendrerit. Suspendisse cursus ante id sapien pulvinar lacinia. Quisque tincidunt interdum arcu ut bibendum. Sed dapibus mollis erat sed euismod.\r\n\r\nNulla sit amet enim augue. Sed mi odio, condimentum nec hendrerit sed, vestibulum et tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas volutpat eleifend quam. Quisque est orci, molestie non ultricies et, egestas et lorem. Pellentesque tortor enim, ultrices eu diam ac, fringilla porta ante. Phasellus ac dictum dolor.\r\n\r\nNulla at sapien sit amet enim ornare pretium. Sed maximus hendrerit mollis. Cras dapibus imperdiet odio eget vulputate. Maecenas sed sem sed justo posuere luctus vel sit amet ante. Vivamus mattis lectus ligula, pretium tincidunt orci rhoncus nec. Vivamus vel nisl euismod, luctus justo et, iaculis diam. Morbi ullamcorper maximus mattis. Ut accumsan leo vitae elementum egestas. Fusce at ornare neque. Pellentesque pulvinar rhoncus augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam dapibus risus ac nibh feugiat, nec varius odio condimentum. Sed risus velit, condimentum nec maximus eget, molestie pulvinar est.','Dubai','','publish','closed','closed','','dubai','','','2014-09-29 23:11:21','2014-09-29 23:11:21','',0,'http://192.168.2.118:8888/Concepta/Kaluah-WP/?post_type=deal&#038;p=37',0,'deal','',0);
INSERT INTO `wp_posts` VALUES (38,1,'2014-09-29 23:11:49','2014-09-29 23:11:49','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at tellus turpis. Suspendisse a est nulla. Vestibulum vitae ante sodales leo semper auctor. Quisque ultrices diam vel justo facilisis, sed posuere nibh pharetra. Cras posuere imperdiet suscipit. Pellentesque sit amet placerat nulla. Curabitur vel aliquet dui. Aenean in placerat orci. Duis vitae feugiat magna, id faucibus lacus. Nam sed turpis venenatis, blandit erat id, vehicula lorem. Fusce vestibulum mauris nec est mollis mollis. Donec at velit eu enim iaculis fringilla.\r\n\r\nNulla facilisis risus ipsum, eu viverra urna suscipit nec. Vestibulum orci ex, dignissim quis viverra et, posuere ac turpis. In ipsum elit, auctor vitae elementum a, condimentum non sem. Sed rutrum dictum elit, vel tempor erat aliquam in. Vivamus venenatis et metus accumsan venenatis. Nam accumsan dui eget dapibus lobortis. Mauris augue turpis, euismod a elementum vel, dictum at lacus. Vivamus commodo neque ac elit pharetra tempus sit amet non tellus. Quisque quis dui sollicitudin, dapibus tellus eget, pulvinar enim. Vivamus efficitur enim sed quam lobortis hendrerit. Suspendisse cursus ante id sapien pulvinar lacinia. Quisque tincidunt interdum arcu ut bibendum. Sed dapibus mollis erat sed euismod.\r\n\r\nNulla sit amet enim augue. Sed mi odio, condimentum nec hendrerit sed, vestibulum et tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas volutpat eleifend quam. Quisque est orci, molestie non ultricies et, egestas et lorem. Pellentesque tortor enim, ultrices eu diam ac, fringilla porta ante. Phasellus ac dictum dolor.\r\n\r\nNulla at sapien sit amet enim ornare pretium. Sed maximus hendrerit mollis. Cras dapibus imperdiet odio eget vulputate. Maecenas sed sem sed justo posuere luctus vel sit amet ante. Vivamus mattis lectus ligula, pretium tincidunt orci rhoncus nec. Vivamus vel nisl euismod, luctus justo et, iaculis diam. Morbi ullamcorper maximus mattis. Ut accumsan leo vitae elementum egestas. Fusce at ornare neque. Pellentesque pulvinar rhoncus augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam dapibus risus ac nibh feugiat, nec varius odio condimentum. Sed risus velit, condimentum nec maximus eget, molestie pulvinar est.','South Africa Adventures','','publish','closed','closed','','south-africa-adventures','','','2014-09-29 23:11:49','2014-09-29 23:11:49','',0,'http://192.168.2.118:8888/Concepta/Kaluah-WP/?post_type=deal&#038;p=38',0,'deal','',0);
INSERT INTO `wp_posts` VALUES (39,1,'2014-09-29 23:12:10','2014-09-29 23:12:10','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at tellus turpis. Suspendisse a est nulla. Vestibulum vitae ante sodales leo semper auctor. Quisque ultrices diam vel justo facilisis, sed posuere nibh pharetra. Cras posuere imperdiet suscipit. Pellentesque sit amet placerat nulla. Curabitur vel aliquet dui. Aenean in placerat orci. Duis vitae feugiat magna, id faucibus lacus. Nam sed turpis venenatis, blandit erat id, vehicula lorem. Fusce vestibulum mauris nec est mollis mollis. Donec at velit eu enim iaculis fringilla.\r\n\r\nNulla facilisis risus ipsum, eu viverra urna suscipit nec. Vestibulum orci ex, dignissim quis viverra et, posuere ac turpis. In ipsum elit, auctor vitae elementum a, condimentum non sem. Sed rutrum dictum elit, vel tempor erat aliquam in. Vivamus venenatis et metus accumsan venenatis. Nam accumsan dui eget dapibus lobortis. Mauris augue turpis, euismod a elementum vel, dictum at lacus. Vivamus commodo neque ac elit pharetra tempus sit amet non tellus. Quisque quis dui sollicitudin, dapibus tellus eget, pulvinar enim. Vivamus efficitur enim sed quam lobortis hendrerit. Suspendisse cursus ante id sapien pulvinar lacinia. Quisque tincidunt interdum arcu ut bibendum. Sed dapibus mollis erat sed euismod.\r\n\r\nNulla sit amet enim augue. Sed mi odio, condimentum nec hendrerit sed, vestibulum et tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas volutpat eleifend quam. Quisque est orci, molestie non ultricies et, egestas et lorem. Pellentesque tortor enim, ultrices eu diam ac, fringilla porta ante. Phasellus ac dictum dolor.\r\n\r\nNulla at sapien sit amet enim ornare pretium. Sed maximus hendrerit mollis. Cras dapibus imperdiet odio eget vulputate. Maecenas sed sem sed justo posuere luctus vel sit amet ante. Vivamus mattis lectus ligula, pretium tincidunt orci rhoncus nec. Vivamus vel nisl euismod, luctus justo et, iaculis diam. Morbi ullamcorper maximus mattis. Ut accumsan leo vitae elementum egestas. Fusce at ornare neque. Pellentesque pulvinar rhoncus augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam dapibus risus ac nibh feugiat, nec varius odio condimentum. Sed risus velit, condimentum nec maximus eget, molestie pulvinar est.','Egipt','','publish','closed','closed','','egipt','','','2014-09-29 23:12:10','2014-09-29 23:12:10','',0,'http://192.168.2.118:8888/Concepta/Kaluah-WP/?post_type=deal&#038;p=39',0,'deal','',0);
INSERT INTO `wp_posts` VALUES (40,1,'2014-09-29 23:12:44','2014-09-29 23:12:44','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at tellus turpis. Suspendisse a est nulla. Vestibulum vitae ante sodales leo semper auctor. Quisque ultrices diam vel justo facilisis, sed posuere nibh pharetra. Cras posuere imperdiet suscipit. Pellentesque sit amet placerat nulla. Curabitur vel aliquet dui. Aenean in placerat orci. Duis vitae feugiat magna, id faucibus lacus. Nam sed turpis venenatis, blandit erat id, vehicula lorem. Fusce vestibulum mauris nec est mollis mollis. Donec at velit eu enim iaculis fringilla.\r\n\r\nNulla facilisis risus ipsum, eu viverra urna suscipit nec. Vestibulum orci ex, dignissim quis viverra et, posuere ac turpis. In ipsum elit, auctor vitae elementum a, condimentum non sem. Sed rutrum dictum elit, vel tempor erat aliquam in. Vivamus venenatis et metus accumsan venenatis. Nam accumsan dui eget dapibus lobortis. Mauris augue turpis, euismod a elementum vel, dictum at lacus. Vivamus commodo neque ac elit pharetra tempus sit amet non tellus. Quisque quis dui sollicitudin, dapibus tellus eget, pulvinar enim. Vivamus efficitur enim sed quam lobortis hendrerit. Suspendisse cursus ante id sapien pulvinar lacinia. Quisque tincidunt interdum arcu ut bibendum. Sed dapibus mollis erat sed euismod.\r\n\r\nNulla sit amet enim augue. Sed mi odio, condimentum nec hendrerit sed, vestibulum et tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas volutpat eleifend quam. Quisque est orci, molestie non ultricies et, egestas et lorem. Pellentesque tortor enim, ultrices eu diam ac, fringilla porta ante. Phasellus ac dictum dolor.\r\n\r\nNulla at sapien sit amet enim ornare pretium. Sed maximus hendrerit mollis. Cras dapibus imperdiet odio eget vulputate. Maecenas sed sem sed justo posuere luctus vel sit amet ante. Vivamus mattis lectus ligula, pretium tincidunt orci rhoncus nec. Vivamus vel nisl euismod, luctus justo et, iaculis diam. Morbi ullamcorper maximus mattis. Ut accumsan leo vitae elementum egestas. Fusce at ornare neque. Pellentesque pulvinar rhoncus augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam dapibus risus ac nibh feugiat, nec varius odio condimentum. Sed risus velit, condimentum nec maximus eget, molestie pulvinar est.','Machu Picchu','','publish','closed','closed','','machu-picchu','','','2014-09-29 23:12:44','2014-09-29 23:12:44','',0,'http://192.168.2.118:8888/Concepta/Kaluah-WP/?post_type=deal&#038;p=40',0,'deal','',0);
INSERT INTO `wp_posts` VALUES (41,1,'2014-09-29 23:37:17','2014-09-29 23:37:17','test','test','','publish','closed','closed','','test','','','2014-09-30 15:23:55','2014-09-30 15:23:55','',0,'http://192.168.2.118:8888/Concepta/Kaluah-WP/?post_type=deal&#038;p=41',0,'deal','',0);
INSERT INTO `wp_posts` VALUES (42,1,'2014-09-30 15:54:19','2014-09-30 03:09:19','<div class=\"row-fluid text-center\">\r\n<div class=\"span4 txt-center\">\r\n\r\n<a title=\"Dining\" href=\"http://localhost/kaluahb2c/shopping-form/\"><img class=\"alignnone size-full wp-image-47\" src=\"http://localhost/kaluahb2c/wp-content/uploads/2015/01/photo-1.png\" alt=\"dining\" /></a>\r\n<h2 class=\"title-type\">Shopping</h2>\r\nJá pensou em ter uma lista dos melhores restaurantes ao redor do mundo? Melhor ainda é poder chegar no destino e ter tudo preparado esperando por você...\r\n\r\n</div>\r\n<div class=\"span4 txt-center\">\r\n\r\n<a title=\"Gifts\" href=\"http://localhost/kaluahb2c/?page_id=58\"><img class=\"alignnone size-full wp-image-48\" src=\"http://localhost/kaluahb2c/wp-content/uploads/2014/09/gifts1.png\" alt=\"gifts1\" /></a>\r\n<h2 class=\"title-type\">Presentes</h2>\r\n<p class=\"p1\"><span class=\"s1\">Envie arranjos de flores, presentes diversos, ou peça sugestões aos nossos analistas. Nossa equipe se encontra à disposição para ajudá-lo a marcar presença em qualquer parte do mundo</span>...</p>\r\n\r\n</div>\r\n<div class=\"span4 txt-center\">\r\n\r\n<a title=\"Honeymoon\" href=\"http://localhost/kaluahb2c/?page_id=60\"><img class=\"alignnone size-full wp-image-49\" src=\"http://localhost/kaluahb2c/wp-content/uploads/2014/09/honeymoon.png\" alt=\"honeymoon\" /></a>\r\n<h2 class=\"title-type\">Lua de Mel</h2>\r\nUma noite romântica, um momento a dois, uma história de amor. Veja como tornar este momento ainda mais inesquecível e especial...\r\n\r\n</div>\r\n</div>\r\n<div class=\"separator is-spacer\"></div>\r\n<div class=\"row-fluid\">\r\n<div class=\"span6 \"><img class=\"alignnone size-full wp-image-50\" src=\"http://localhost/kaluahb2c/wp-content/uploads/2014/09/pic1.png\" alt=\"pic1\" /></div>\r\n<div class=\"span6 \">\r\n<h2>Assistente de Viagens</h2>\r\n<p class=\"p1\"><span class=\"s1\">Você não precisa se preocupar com a localização do seu hotel,  como reservar uma mesa no melhor restaurante local ou fazer uma surpresa a alguém especial para tornar sua viagem ainda mais inesquecível. Seu Assistente Pessoal Varanda.com! toma conta de tudo isso e ajuda a conseguir aquelas reservas para os eventos do ano!</span></p>\r\n\r\n</div>\r\n</div>\r\n<div class=\"separator is-spacer\"></div>\r\n<div class=\"row-fluid text-center contact-us\">\r\n<div class=\"span12  text-center\">\r\n<h2 class=\"text-center\">Entre em contato com seu especialista agora mesmo</h2>\r\n<p class=\"text-center\">Nossa equipe de especialistas está a disposição 24 horas por dia, 7 dias da semana para atender suas solicitações e fornecer todas as informações necessárias para que sua viagem seja repleta de surpresas.</p>\r\n<a class=\"btn-green\" href=\"#\">Online Chat</a> <a class=\"btn-purple\" href=\"#\">Call Us Now</a>\r\n\r\n</div>\r\n</div>','Varanda Concierge','','publish','open','closed','','varanda-concierge','','','2015-01-09 10:52:08','2015-01-08 22:07:08','',0,'http://192.168.2.118:8888/Concepta/Kaluah-WP/?page_id=42',0,'page','',0);
INSERT INTO `wp_posts` VALUES (45,1,'2015-01-09 10:47:01','2015-01-08 22:02:01','<div class=\"row-fluid text-center\">\n<div class=\"span4 txt-center\">\n\n<a title=\"Dining\" href=\"http://localhost/kaluahb2c/?page_id=54\"><img class=\"alignnone size-full wp-image-47\" src=\"http://localhost/kaluahb2c/wp-content/uploads/2015/01/photo-1.png\" alt=\"dining\" /></a>\n<h2 class=\"title-type\">Shopping</h2>\nJá pensou em ter uma lista dos melhores restaurantes ao redor do mundo? Melhor ainda é poder chegar no destino e ter tudo preparado esperando por você...\n\n</div>\n<div class=\"span4 txt-center\">\n\n<a title=\"Gifts\" href=\"http://localhost/kaluahb2c/?page_id=58\"><img class=\"alignnone size-full wp-image-48\" src=\"http://localhost/kaluahb2c/wp-content/uploads/2014/09/gifts1.png\" alt=\"gifts1\" /></a>\n<h2 class=\"title-type\">Presentes</h2>\n<p class=\"p1\"><span class=\"s1\">Envie arranjos de flores, presentes diversos, ou peça sugestões aos nossos analistas. Nossa equipe se encontra à disposição para ajudá-lo a marcar presença em qualquer parte do mundo</span>...</p>\n\n</div>\n<div class=\"span4 txt-center\">\n\n<a title=\"Honeymoon\" href=\"http://localhost/kaluahb2c/?page_id=60\"><img class=\"alignnone size-full wp-image-49\" src=\"http://localhost/kaluahb2c/wp-content/uploads/2014/09/honeymoon.png\" alt=\"honeymoon\" /></a>\n<h2 class=\"title-type\">Lua de Mel</h2>\nUma noite romântica, um momento a dois, uma história de amor. Veja como tornar este momento ainda mais inesquecível e especial...\n\n</div>\n</div>\n<div class=\"separator is-spacer\"></div>\n<div class=\"row-fluid\">\n<div class=\"span6 \"><img class=\"alignnone size-full wp-image-50\" src=\"http://localhost/kaluahb2c/wp-content/uploads/2014/09/pic1.png\" alt=\"pic1\" /></div>\n<div class=\"span6 \">\n<h2>Assistente de Viagens</h2>\n<p class=\"p1\"><span class=\"s1\">Você não precisa se preocupar com a localização do seu hotel,  como reservar uma mesa no melhor restaurante local ou fazer uma surpresa a alguém especial para tornar sua viagem ainda mais inesquecível. Seu Assistente Pessoal Varanda.com! toma conta de tudo isso e ajuda a conseguir aquelas reservas para os eventos do ano!</span></p>\n\n</div>\n</div>\n<div class=\"separator is-spacer\"></div>\n<div class=\"row-fluid text-center contact-us\">\n<div class=\"span12  text-center\">\n<h2 class=\"text-center\">Entre em contato com seu especialista agora mesmo</h2>\n<p class=\"text-center\">Nossa equipe de especialistas está a disposição 24 horas por dia, 7 dias da semana para atender suas solicitações e fornecer todas as informações necessárias para que sua viagem seja repleta de surpresas.</p>\n<a class=\"btn-green\" href=\"#\">Online Chat</a> <a class=\"btn-purple\" href=\"#\">Call Us Now</a>\n\n</div>\n</div>','Varanda Concierge','','inherit','open','open','','42-autosave-v1','','','2015-01-09 10:47:01','2015-01-08 22:02:01','',42,'http://localhost:8888/Concepta/Kaluah-WP/?p=45',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (47,1,'2014-09-30 19:03:49','2014-09-30 19:03:49','','dining','','inherit','open','open','','dining','','','2014-09-30 19:04:51','2014-09-30 19:04:51','',42,'http://localhost:8888/Concepta/Kaluah-WP/wp-content/uploads/2014/09/dining.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (48,1,'2014-09-30 19:03:50','2014-09-30 19:03:50','','gifts1','','inherit','open','open','','gifts1','','','2014-09-30 19:05:19','2014-09-30 19:05:19','',42,'http://localhost:8888/Concepta/Kaluah-WP/wp-content/uploads/2014/09/gifts1.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (49,1,'2014-09-30 19:03:51','2014-09-30 19:03:51','','honeymoon','','inherit','open','open','','honeymoon','','','2014-09-30 19:05:40','2014-09-30 19:05:40','',42,'http://localhost:8888/Concepta/Kaluah-WP/wp-content/uploads/2014/09/honeymoon.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (50,1,'2014-09-30 19:03:51','2014-09-30 19:03:51','','pic1','','inherit','open','open','','pic1','','','2014-09-30 19:07:16','2014-09-30 19:07:16','',42,'http://localhost:8888/Concepta/Kaluah-WP/wp-content/uploads/2014/09/pic1.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (54,1,'2014-09-30 19:15:51','2014-09-30 06:30:51','[gravityform id=\"2\" title=\"false\" ajax=\"true\" description=\"true\"]','Restaurantes','','publish','open','closed','','restaurantes','','','2014-11-20 09:51:37','2014-11-19 21:06:37','',0,'http://localhost:8888/Concepta/Kaluah-WP/?page_id=54',0,'page','',0);
INSERT INTO `wp_posts` VALUES (58,1,'2014-09-30 19:16:45','2014-09-30 06:31:45','[gravityform id=\"1\" title=\"false\" ajax=\"true\" description=\"true\"]','Presentes','','publish','open','closed','','presentes','','','2014-11-20 09:51:48','2014-11-19 21:06:48','',0,'http://localhost:8888/Concepta/Kaluah-WP/?page_id=58',0,'page','',0);
INSERT INTO `wp_posts` VALUES (60,1,'2014-09-30 19:17:02','2014-09-30 06:32:02','[gravityform id=\"3\" title=\"false\" ajax=\"true\" description=\"true\"]','Lua de Mel','','publish','open','closed','','lua-de-mel','','','2014-11-20 09:52:05','2014-11-19 21:07:05','',0,'http://localhost:8888/Concepta/Kaluah-WP/?page_id=60',0,'page','',0);
INSERT INTO `wp_posts` VALUES (67,1,'2014-10-20 14:59:29','2014-10-20 14:59:29','E quem diria que vir para os parques de Orlando poderia incluir um passeio com vista panorâmica da cidade?\r\n\r\nNão estamos nos referindo aos já conhecidos passeios de helicóptero, e sim, ao mais novo projeto da cidade que até nos fará lembrar um pouco de Londres.\r\n\r\nConhecido como Orlando Eye, o projeto trará a segunda maior roda gigante do mundo para um dos maiores pontos turísticos do planeta.\r\n\r\nMas o projeto não para por aí…\r\n\r\nA roda gigante que foi inspirada nos moldes da London Eye é apenas parte da estrutura multimilionária que ficará conhecida como I-Drive Live. Localizada na International Drive, uma das avenidas mais famosas de Orlando, o I-Drive Live será um centro comercial com lojas, restaurantes e muitas opções de entretenimento.\r\n\r\nCom expectativa de inauguração prevista para a noite de ano novo de 2015, Orlando Eye terá altura equivalente a um prédio de 35 andares, oferecerá aos seus visitantes uma vista panorâmica não apenas da cidade de Orlando como também do complexo Walt Disney World e da base de lançamento da NASA. A roda gigante terá 30 gondolas com capacidade para 15 pessoas cada uma. O passeio pela Orlando Eye terá duração de aproximadamente 20 minutos. Além de diversão garantida, a empresa que responsável pela construção e montagem da roda gigante também se preocupa com a segurança de seus visitantes, o empreendimento que trará componentes da Suíça, terá a capacidade de suportar ventos de até 200km por hora.\r\n\r\nAtrações como o museu de cera Madame Tussaud’s e o Aquário de Vida Marinha também farão parte do complexo junto a restaurantes como Buffalo Wild Wings, Seafood Republic, Yard House, Outback Steakhouse, Carrabas Italian Grill e muitas opções de lojas.\r\n\r\nCom ar metropolitano e urbanístico, I-Drive Live será mais um famoso ponto turístico de Orlando que pretende atrair mais de 3 milhões de visitantes por ano.','A cidade dos parques de diversão ganha vista panorâmica e muito mais','','publish','open','open','','test','','','2014-11-17 17:35:23','2014-11-17 17:35:23','',0,'http://localhost/kaluahb2c/?p=67',0,'post','',0);
INSERT INTO `wp_posts` VALUES (69,1,'2014-10-20 19:50:39','2014-10-20 19:50:39','','Blog','','publish','open','open','','blog','','','2014-10-20 19:50:39','2014-10-20 19:50:39','',0,'http://localhost/kaluahb2c/?page_id=69',0,'page','',0);
INSERT INTO `wp_posts` VALUES (71,1,'2014-10-20 19:51:18','2014-10-20 19:51:18',' ','','','publish','open','open','','71','','','2014-10-20 19:51:18','2014-10-20 19:51:18','',0,'http://localhost/kaluahb2c/?p=71',6,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (79,2,'2014-11-17 16:59:53','2014-11-17 16:59:53','','e760bace24567e8be6df31d27f118d5a1100b3c210879d6ff688be05fb710442','','inherit','open','open','','e760bace24567e8be6df31d27f118d5a1100b3c210879d6ff688be05fb710442','','','2014-11-17 16:59:53','2014-11-17 16:59:53','',42,'http://localhost/kaluahb2c/wp-content/uploads/2014/09/e760bace24567e8be6df31d27f118d5a1100b3c210879d6ff688be05fb710442.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (84,2,'2014-11-17 17:33:12','2014-11-17 17:33:12','','os-os-i-drive-live-jpg-20131219','','inherit','open','open','','os-os-i-drive-live-jpg-20131219','','','2014-11-17 17:33:12','2014-11-17 17:33:12','',67,'http://localhost/kaluahb2c/wp-content/uploads/2014/10/os-os-i-drive-live-jpg-20131219.jpeg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (88,2,'2014-11-17 17:39:12','2014-11-17 17:39:12','','europa-vistos','','inherit','open','open','','europa-vistos','','','2014-11-17 17:39:12','2014-11-17 17:39:12','',1,'http://localhost/kaluahb2c/wp-content/uploads/2013/10/europa-vistos.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (103,1,'2015-01-09 10:38:12','2015-01-08 21:53:12','teste','Postagem Teste','','publish','open','open','','postagem-teste','','','2015-01-09 10:38:12','2015-01-08 21:53:12','',0,'http://localhost/kaluahb2c/?p=103',0,'post','',0);
INSERT INTO `wp_posts` VALUES (104,1,'2015-01-09 10:38:12','2015-01-08 21:53:12','teste','Postagem Teste','','inherit','open','open','','103-revision-v1','','','2015-01-09 10:38:12','2015-01-08 21:53:12','',103,'http://localhost/kaluahb2c/103-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (105,1,'2015-01-09 10:46:28','2015-01-08 22:01:28','','photo 1','','inherit','open','open','','photo-1','','','2015-01-09 10:46:28','2015-01-08 22:01:28','',0,'http://localhost/kaluahb2c/wp-content/uploads/2015/01/photo-1.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (106,1,'2015-01-09 10:47:37','2015-01-08 22:02:37','<div class=\"row-fluid text-center\">\r\n<div class=\"span4 txt-center\">\r\n\r\n<a title=\"Dining\" href=\"http://localhost/kaluahb2c/?page_id=54\"><img class=\"alignnone size-full wp-image-47\" src=\"http://localhost/kaluahb2c/wp-content/uploads/2015/01/photo-1.png\" alt=\"dining\" /></a>\r\n<h2 class=\"title-type\">Shopping</h2>\r\nJá pensou em ter uma lista dos melhores restaurantes ao redor do mundo? Melhor ainda é poder chegar no destino e ter tudo preparado esperando por você...\r\n\r\n</div>\r\n<div class=\"span4 txt-center\">\r\n\r\n<a title=\"Gifts\" href=\"http://localhost/kaluahb2c/?page_id=58\"><img class=\"alignnone size-full wp-image-48\" src=\"http://localhost/kaluahb2c/wp-content/uploads/2014/09/gifts1.png\" alt=\"gifts1\" /></a>\r\n<h2 class=\"title-type\">Presentes</h2>\r\n<p class=\"p1\"><span class=\"s1\">Envie arranjos de flores, presentes diversos, ou peça sugestões aos nossos analistas. Nossa equipe se encontra à disposição para ajudá-lo a marcar presença em qualquer parte do mundo</span>...</p>\r\n\r\n</div>\r\n<div class=\"span4 txt-center\">\r\n\r\n<a title=\"Honeymoon\" href=\"http://localhost/kaluahb2c/?page_id=60\"><img class=\"alignnone size-full wp-image-49\" src=\"http://localhost/kaluahb2c/wp-content/uploads/2014/09/honeymoon.png\" alt=\"honeymoon\" /></a>\r\n<h2 class=\"title-type\">Lua de Mel</h2>\r\nUma noite romântica, um momento a dois, uma história de amor. Veja como tornar este momento ainda mais inesquecível e especial...\r\n\r\n</div>\r\n</div>\r\n<div class=\"separator is-spacer\"></div>\r\n<div class=\"row-fluid\">\r\n<div class=\"span6 \"><img class=\"alignnone size-full wp-image-50\" src=\"http://localhost/kaluahb2c/wp-content/uploads/2014/09/pic1.png\" alt=\"pic1\" /></div>\r\n<div class=\"span6 \">\r\n<h2>Assistente de Viagens</h2>\r\n<p class=\"p1\"><span class=\"s1\">Você não precisa se preocupar com a localização do seu hotel,  como reservar uma mesa no melhor restaurante local ou fazer uma surpresa a alguém especial para tornar sua viagem ainda mais inesquecível. Seu Assistente Pessoal Varanda.com! toma conta de tudo isso e ajuda a conseguir aquelas reservas para os eventos do ano!</span></p>\r\n\r\n</div>\r\n</div>\r\n<div class=\"separator is-spacer\"></div>\r\n<div class=\"row-fluid text-center contact-us\">\r\n<div class=\"span12  text-center\">\r\n<h2 class=\"text-center\">Entre em contato com seu especialista agora mesmo</h2>\r\n<p class=\"text-center\">Nossa equipe de especialistas está a disposição 24 horas por dia, 7 dias da semana para atender suas solicitações e fornecer todas as informações necessárias para que sua viagem seja repleta de surpresas.</p>\r\n<a class=\"btn-green\" href=\"#\">Online Chat</a> <a class=\"btn-purple\" href=\"#\">Call Us Now</a>\r\n\r\n</div>\r\n</div>','Varanda Concierge','','inherit','open','open','','42-revision-v1','','','2015-01-09 10:47:37','2015-01-08 22:02:37','',42,'http://localhost/kaluahb2c/42-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (107,1,'2015-01-09 10:51:25','2015-01-08 22:06:25','[gravityform id=\"5\" title=\"false\" ajax=\"true\" description=\"true\"]','Shopping Form','','publish','open','open','','shopping-form','','','2015-01-09 10:51:25','2015-01-08 22:06:25','',0,'http://localhost/kaluahb2c/?page_id=107',0,'page','',0);
INSERT INTO `wp_posts` VALUES (108,1,'2015-01-09 10:51:25','2015-01-08 22:06:25','[gravityform id=\"5\" title=\"false\" ajax=\"true\" description=\"true\"]','Shopping Form','','inherit','open','open','','107-revision-v1','','','2015-01-09 10:51:25','2015-01-08 22:06:25','',107,'http://localhost/kaluahb2c/107-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (109,1,'2015-01-09 10:52:08','2015-01-08 22:07:08','<div class=\"row-fluid text-center\">\r\n<div class=\"span4 txt-center\">\r\n\r\n<a title=\"Dining\" href=\"http://localhost/kaluahb2c/shopping-form/\"><img class=\"alignnone size-full wp-image-47\" src=\"http://localhost/kaluahb2c/wp-content/uploads/2015/01/photo-1.png\" alt=\"dining\" /></a>\r\n<h2 class=\"title-type\">Shopping</h2>\r\nJá pensou em ter uma lista dos melhores restaurantes ao redor do mundo? Melhor ainda é poder chegar no destino e ter tudo preparado esperando por você...\r\n\r\n</div>\r\n<div class=\"span4 txt-center\">\r\n\r\n<a title=\"Gifts\" href=\"http://localhost/kaluahb2c/?page_id=58\"><img class=\"alignnone size-full wp-image-48\" src=\"http://localhost/kaluahb2c/wp-content/uploads/2014/09/gifts1.png\" alt=\"gifts1\" /></a>\r\n<h2 class=\"title-type\">Presentes</h2>\r\n<p class=\"p1\"><span class=\"s1\">Envie arranjos de flores, presentes diversos, ou peça sugestões aos nossos analistas. Nossa equipe se encontra à disposição para ajudá-lo a marcar presença em qualquer parte do mundo</span>...</p>\r\n\r\n</div>\r\n<div class=\"span4 txt-center\">\r\n\r\n<a title=\"Honeymoon\" href=\"http://localhost/kaluahb2c/?page_id=60\"><img class=\"alignnone size-full wp-image-49\" src=\"http://localhost/kaluahb2c/wp-content/uploads/2014/09/honeymoon.png\" alt=\"honeymoon\" /></a>\r\n<h2 class=\"title-type\">Lua de Mel</h2>\r\nUma noite romântica, um momento a dois, uma história de amor. Veja como tornar este momento ainda mais inesquecível e especial...\r\n\r\n</div>\r\n</div>\r\n<div class=\"separator is-spacer\"></div>\r\n<div class=\"row-fluid\">\r\n<div class=\"span6 \"><img class=\"alignnone size-full wp-image-50\" src=\"http://localhost/kaluahb2c/wp-content/uploads/2014/09/pic1.png\" alt=\"pic1\" /></div>\r\n<div class=\"span6 \">\r\n<h2>Assistente de Viagens</h2>\r\n<p class=\"p1\"><span class=\"s1\">Você não precisa se preocupar com a localização do seu hotel,  como reservar uma mesa no melhor restaurante local ou fazer uma surpresa a alguém especial para tornar sua viagem ainda mais inesquecível. Seu Assistente Pessoal Varanda.com! toma conta de tudo isso e ajuda a conseguir aquelas reservas para os eventos do ano!</span></p>\r\n\r\n</div>\r\n</div>\r\n<div class=\"separator is-spacer\"></div>\r\n<div class=\"row-fluid text-center contact-us\">\r\n<div class=\"span12  text-center\">\r\n<h2 class=\"text-center\">Entre em contato com seu especialista agora mesmo</h2>\r\n<p class=\"text-center\">Nossa equipe de especialistas está a disposição 24 horas por dia, 7 dias da semana para atender suas solicitações e fornecer todas as informações necessárias para que sua viagem seja repleta de surpresas.</p>\r\n<a class=\"btn-green\" href=\"#\">Online Chat</a> <a class=\"btn-purple\" href=\"#\">Call Us Now</a>\r\n\r\n</div>\r\n</div>','Varanda Concierge','','inherit','open','open','','42-revision-v1','','','2015-01-09 10:52:08','2015-01-08 22:07:08','',42,'http://localhost/kaluahb2c/42-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (110,1,'2015-03-07 04:59:22','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2015-03-07 04:59:22','0000-00-00 00:00:00','',0,'http://localhost/kaluahb2c/?p=110',0,'post','',0);
INSERT INTO `wp_posts` VALUES (112,1,'2015-03-07 05:06:07','2015-03-06 16:21:07','','Home','','publish','open','open','','home-3','','','2015-03-07 05:06:07','2015-03-06 16:21:07','',0,'http://localhost/kaluahb2c/home-3/',1,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (113,1,'2015-03-07 05:06:07','2015-03-06 16:21:07','','Vacation Packages','','publish','open','open','','vacation-packages-2','','','2015-03-07 05:06:07','2015-03-06 16:21:07','',0,'http://localhost/kaluahb2c/vacation-packages-2/',2,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (114,1,'2015-03-07 05:06:07','2015-03-06 16:21:07','','Hotels','','publish','open','open','','hotels-2','','','2015-03-07 05:06:07','2015-03-06 16:21:07','',0,'http://localhost/kaluahb2c/hotels-2/',3,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (115,1,'2015-03-07 05:06:07','2015-03-06 16:21:07','','Things To Do','','publish','open','open','','things-to-do-2','','','2015-03-07 05:06:07','2015-03-06 16:21:07','',0,'http://localhost/kaluahb2c/things-to-do-2/',4,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (116,1,'2015-03-07 05:06:07','2015-03-06 16:21:07','','Rewards','','publish','open','open','','rewards-2','','','2015-03-07 05:06:07','2015-03-06 16:21:07','',0,'http://localhost/kaluahb2c/rewards-2/',5,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (117,1,'2015-03-07 05:06:07','2015-03-06 16:21:07','','Home','','publish','open','open','','home-4','','','2015-03-07 05:06:07','2015-03-06 16:21:07','',0,'http://localhost/kaluahb2c/home-4/',1,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (118,1,'2015-03-07 05:06:07','2015-03-06 16:21:07','','About','','publish','open','open','','about-2','','','2015-03-07 05:06:07','2015-03-06 16:21:07','',0,'http://localhost/kaluahb2c/about-2/',2,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (119,1,'2015-03-07 05:06:08','2015-03-06 16:21:08','','Last Minute','','publish','open','open','','last-minute-2','','','2015-03-07 05:06:08','2015-03-06 16:21:08','',0,'http://localhost/kaluahb2c/last-minute-2/',3,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (120,1,'2015-03-07 05:06:08','2015-03-06 16:21:08','','Early Booking','','publish','open','open','','early-booking-2','','','2015-03-07 05:06:08','2015-03-06 16:21:08','',0,'http://localhost/kaluahb2c/early-booking-2/',4,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (121,1,'2015-03-07 05:06:08','2015-03-06 16:21:08','','Special Offers','','publish','open','open','','special-offers-2','','','2015-03-07 05:06:08','2015-03-06 16:21:08','',0,'http://localhost/kaluahb2c/special-offers-2/',5,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (122,1,'2015-03-07 05:06:08','2015-03-06 16:21:08','','Contact','','publish','open','open','','contact-2','','','2015-03-07 05:06:08','2015-03-06 16:21:08','',0,'http://localhost/kaluahb2c/contact-2/',7,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (123,1,'2015-02-17 10:13:03','2015-02-16 21:28:03','[tlogic_ticket_search]','Ticket Search','','publish','open','open','','ticket-search','','','2015-02-17 10:13:03','2015-02-16 21:28:03','',0,'http://kaluah-b2c-wordpress.dev/?page_id=114',0,'page','',0);
INSERT INTO `wp_posts` VALUES (124,1,'2015-02-20 12:45:34','2015-02-20 00:00:34','[tlogic_ticket_details]','Ticket Details','','publish','open','open','','ticket-details','','','2015-02-20 12:45:34','2015-02-20 00:00:34','',0,'http://kaluah-b2c-wordpress.dev/?page_id=116',0,'page','',0);
INSERT INTO `wp_posts` VALUES (125,1,'2015-02-25 07:27:37','2015-02-24 18:42:37','[tlogic_book_ticket]','Ticket Booking','','publish','open','open','','ticket-booking','','','2015-02-25 07:27:37','2015-02-24 18:42:37','',0,'http://kaluah-b2c-wordpress.dev/?page_id=119',0,'page','',0);
INSERT INTO `wp_posts` VALUES (126,1,'2015-02-28 12:51:42','2015-02-28 00:06:42','[tlogic_ticket_conf]','Ticket Confirmation','','publish','open','open','','ticket-confirmation','','','2015-02-28 12:51:42','2015-02-28 00:06:42','',0,'http://kaluah-b2c-wordpress.dev/?page_id=121',0,'page','',0);
INSERT INTO `wp_posts` VALUES (127,1,'2015-03-03 13:24:59','2015-03-03 00:39:59','[tlogic_car_search]','Car Search','','publish','open','open','','car-search','','','2015-03-03 13:24:59','2015-03-03 00:39:59','',0,'http://kaluah-b2c-wordpress.dev/?page_id=123',0,'page','',0);
INSERT INTO `wp_posts` VALUES (128,1,'2015-03-03 13:25:37','2015-03-03 00:40:37','[tlogic_ticket_details]','Car Details','','publish','open','open','','car-details','','','2015-03-03 13:25:37','2015-03-03 00:40:37','',0,'http://kaluah-b2c-wordpress.dev/?page_id=125',0,'page','',0);
INSERT INTO `wp_posts` VALUES (129,1,'2015-03-07 05:06:08','2015-03-06 16:21:08',' ','','','publish','open','open','','129','','','2015-03-07 05:06:08','2015-03-06 16:21:08','',0,'http://localhost/kaluahb2c/129/',6,'nav_menu_item','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_rg_form`
--

DROP TABLE IF EXISTS `wp_rg_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_rg_form` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `date_created` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_trash` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_rg_form`
--

LOCK TABLES `wp_rg_form` WRITE;
/*!40000 ALTER TABLE `wp_rg_form` DISABLE KEYS */;
INSERT INTO `wp_rg_form` VALUES (1,'Presentes','2014-09-30 19:14:18',1,0);
INSERT INTO `wp_rg_form` VALUES (2,'Restaurantes','2014-09-30 19:14:18',1,0);
INSERT INTO `wp_rg_form` VALUES (3,'Lua de Mel','2014-09-30 19:14:18',1,0);
INSERT INTO `wp_rg_form` VALUES (4,'Shopping','2015-01-08 22:04:11',1,1);
INSERT INTO `wp_rg_form` VALUES (5,'Shopping','2015-01-08 22:04:26',1,0);
/*!40000 ALTER TABLE `wp_rg_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_rg_form_meta`
--

DROP TABLE IF EXISTS `wp_rg_form_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_rg_form_meta` (
  `form_id` mediumint(8) unsigned NOT NULL,
  `display_meta` longtext,
  `entries_grid_meta` longtext,
  `confirmations` longtext,
  `notifications` longtext,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_rg_form_meta`
--

LOCK TABLES `wp_rg_form_meta` WRITE;
/*!40000 ALTER TABLE `wp_rg_form_meta` DISABLE KEYS */;
INSERT INTO `wp_rg_form_meta` VALUES (1,'{\"labelPlacement\":\"top_label\",\"useCurrentUserAsAuthor\":\"1\",\"title\":\"Presentes\",\"description\":\"Presenteie algu\\u00e9m especial!\",\"descriptionPlacement\":\"below\",\"button\":{\"type\":\"text\",\"text\":\"Submit\",\"imageUrl\":\"\"},\"fields\":[{\"id\":\"1\",\"type\":\"name\",\"size\":\"medium\",\"label\":\"Name\",\"inputs\":[{\"id\":\"1.3\",\"label\":\"First\"},{\"id\":\"1.6\",\"label\":\"Last\"}],\"formId\":1,\"pageNumber\":1,\"descriptionPlacement\":\"below\"},{\"id\":\"2\",\"type\":\"phone\",\"size\":\"large\",\"phoneFormat\":\"standard\",\"label\":\"Phone Number\",\"formId\":1,\"pageNumber\":1,\"descriptionPlacement\":\"below\"},{\"id\":\"3\",\"type\":\"email\",\"size\":\"large\",\"label\":\"Email Address\",\"formId\":1,\"pageNumber\":1,\"descriptionPlacement\":\"below\"},{\"id\":\"4\",\"type\":\"select\",\"size\":\"large\",\"label\":\"Request Type\",\"choices\":[{\"text\":\"Option 1\",\"value\":\"Option 1\"},{\"text\":\"Option 2\",\"value\":\"Option 2\"},{\"text\":\"Other Request\",\"value\":\"Other Request\"}],\"formId\":1,\"pageNumber\":1,\"descriptionPlacement\":\"below\"},{\"id\":\"5\",\"type\":\"textarea\",\"size\":\"large\",\"label\":\"Special Requests\",\"formId\":1,\"pageNumber\":1,\"descriptionPlacement\":\"below\"}],\"id\":1,\"notifications\":{\"5404913ba4666\":{\"id\":\"5404913ba4666\",\"to\":\"{admin_email}\",\"name\":\"Admin Notification\",\"event\":\"form_submission\",\"toType\":\"email\",\"subject\":\"New submission from {form_title}\",\"message\":\"{all_fields}\"}},\"confirmations\":{\"5404913ba4c7f\":{\"id\":\"5404913ba4c7f\",\"isDefault\":\"1\",\"type\":\"message\",\"name\":\"Default Confirmation\",\"message\":\"Thanks for contacting us! We will get in touch with you shortly.\"}},\"cssClass\":\"\",\"enableHoneypot\":\"\",\"enableAnimation\":\"\",\"limitEntries\":\"\",\"limitEntriesCount\":\"\",\"limitEntriesPeriod\":\"\",\"limitEntriesMessage\":\"\",\"scheduleForm\":\"\",\"scheduleStart\":\"\",\"scheduleStartHour\":\"\",\"scheduleStartMinute\":\"\",\"scheduleStartAmpm\":\"\",\"scheduleEnd\":\"\",\"scheduleEndHour\":\"\",\"scheduleEndMinute\":\"\",\"scheduleEndAmpm\":\"\",\"schedulePendingMessage\":\"\",\"scheduleMessage\":\"\",\"requireLogin\":\"\",\"requireLoginMessage\":\"\"}',NULL,'{\"5404913ba4c7f\":{\"id\":\"5404913ba4c7f\",\"isDefault\":\"1\",\"type\":\"message\",\"name\":\"Default Confirmation\",\"message\":\"Obrigado por nos contactar. Entraremos em contato em breve!!!\",\"disableAutoformat\":\"\",\"pageId\":\"\",\"url\":\"\",\"queryString\":\"\",\"conditionalLogic\":[]}}','{\"5404913ba4666\":{\"id\":\"5404913ba4666\",\"to\":\"{admin_email}\",\"name\":\"Admin Notification\",\"event\":\"form_submission\",\"toType\":\"email\",\"subject\":\"New submission from {form_title}\",\"message\":\"{all_fields}\"}}');
INSERT INTO `wp_rg_form_meta` VALUES (2,'{\"labelPlacement\":\"top_label\",\"useCurrentUserAsAuthor\":\"1\",\"title\":\"Restaurantes\",\"description\":\"Comemore sua viagem em um lugar especial\",\"descriptionPlacement\":\"below\",\"button\":{\"type\":\"text\",\"text\":\"Submit\",\"imageUrl\":\"\"},\"fields\":[{\"adminLabel\":\"\",\"adminOnly\":\"\",\"allowsPrepopulate\":\"\",\"defaultValue\":\"\",\"description\":\"\",\"content\":\"\",\"cssClass\":\"gf_left_half\",\"errorMessage\":\"\",\"id\":\"6\",\"inputName\":\"\",\"isRequired\":\"1\",\"label\":\"First Name\",\"noDuplicates\":\"\",\"size\":\"medium\",\"type\":\"text\",\"postCustomFieldName\":\"\",\"displayAllCategories\":\"\",\"displayCaption\":\"\",\"displayDescription\":\"\",\"displayTitle\":\"\",\"inputType\":\"\",\"rangeMin\":\"\",\"rangeMax\":\"\",\"calendarIconType\":\"\",\"calendarIconUrl\":\"\",\"dateType\":\"\",\"dateFormat\":\"\",\"phoneFormat\":\"\",\"addressType\":\"\",\"defaultCountry\":\"\",\"defaultProvince\":\"\",\"defaultState\":\"\",\"hideAddress2\":\"\",\"hideCountry\":\"\",\"hideState\":\"\",\"inputs\":\"\",\"nameFormat\":\"\",\"allowedExtensions\":\"\",\"captchaType\":\"\",\"pageNumber\":1,\"captchaTheme\":\"\",\"simpleCaptchaSize\":\"\",\"simpleCaptchaFontColor\":\"\",\"simpleCaptchaBackgroundColor\":\"\",\"failed_validation\":\"\",\"productField\":\"\",\"enablePasswordInput\":\"\",\"maxLength\":\"\",\"enablePrice\":\"\",\"basePrice\":\"\",\"formId\":2,\"descriptionPlacement\":\"below\"},{\"adminLabel\":\"\",\"adminOnly\":\"\",\"allowsPrepopulate\":\"\",\"defaultValue\":\"\",\"description\":\"\",\"content\":\"\",\"cssClass\":\"gf_right_half\",\"errorMessage\":\"\",\"id\":\"7\",\"inputName\":\"\",\"isRequired\":\"1\",\"label\":\"Last Name\",\"noDuplicates\":\"\",\"size\":\"medium\",\"type\":\"text\",\"postCustomFieldName\":\"\",\"displayAllCategories\":\"\",\"displayCaption\":\"\",\"displayDescription\":\"\",\"displayTitle\":\"\",\"inputType\":\"\",\"rangeMin\":\"\",\"rangeMax\":\"\",\"calendarIconType\":\"\",\"calendarIconUrl\":\"\",\"dateType\":\"\",\"dateFormat\":\"\",\"phoneFormat\":\"\",\"addressType\":\"\",\"defaultCountry\":\"\",\"defaultProvince\":\"\",\"defaultState\":\"\",\"hideAddress2\":\"\",\"hideCountry\":\"\",\"hideState\":\"\",\"inputs\":\"\",\"nameFormat\":\"\",\"allowedExtensions\":\"\",\"captchaType\":\"\",\"pageNumber\":1,\"captchaTheme\":\"\",\"simpleCaptchaSize\":\"\",\"simpleCaptchaFontColor\":\"\",\"simpleCaptchaBackgroundColor\":\"\",\"failed_validation\":\"\",\"productField\":\"\",\"enablePasswordInput\":\"\",\"maxLength\":\"\",\"enablePrice\":\"\",\"basePrice\":\"\",\"formId\":2,\"descriptionPlacement\":\"below\"},{\"adminLabel\":\"\",\"adminOnly\":\"\",\"allowsPrepopulate\":\"\",\"defaultValue\":\"\",\"description\":\"\",\"content\":\"\",\"cssClass\":\"\",\"errorMessage\":\"\",\"id\":\"2\",\"inputName\":\"\",\"isRequired\":\"1\",\"label\":\"Phone Number\",\"noDuplicates\":\"\",\"size\":\"large\",\"type\":\"phone\",\"postCustomFieldName\":\"\",\"displayAllCategories\":\"\",\"displayCaption\":\"\",\"displayDescription\":\"\",\"displayTitle\":\"\",\"inputType\":\"\",\"rangeMin\":\"\",\"rangeMax\":\"\",\"calendarIconType\":\"\",\"calendarIconUrl\":\"\",\"dateType\":\"\",\"dateFormat\":\"\",\"phoneFormat\":\"standard\",\"addressType\":\"\",\"defaultCountry\":\"\",\"defaultProvince\":\"\",\"defaultState\":\"\",\"hideAddress2\":\"\",\"hideCountry\":\"\",\"hideState\":\"\",\"inputs\":\"\",\"nameFormat\":\"\",\"allowedExtensions\":\"\",\"captchaType\":\"\",\"pageNumber\":1,\"captchaTheme\":\"\",\"simpleCaptchaSize\":\"\",\"simpleCaptchaFontColor\":\"\",\"simpleCaptchaBackgroundColor\":\"\",\"failed_validation\":\"\",\"productField\":\"\",\"enablePasswordInput\":\"\",\"maxLength\":\"\",\"enablePrice\":\"\",\"basePrice\":\"\",\"formId\":2,\"descriptionPlacement\":\"below\"},{\"adminLabel\":\"\",\"adminOnly\":\"\",\"allowsPrepopulate\":\"\",\"defaultValue\":\"\",\"description\":\"\",\"content\":\"\",\"cssClass\":\"\",\"errorMessage\":\"\",\"id\":\"3\",\"inputName\":\"\",\"isRequired\":\"1\",\"label\":\"Email Address\",\"noDuplicates\":\"\",\"size\":\"large\",\"type\":\"email\",\"postCustomFieldName\":\"\",\"displayAllCategories\":\"\",\"displayCaption\":\"\",\"displayDescription\":\"\",\"displayTitle\":\"\",\"inputType\":\"\",\"rangeMin\":\"\",\"rangeMax\":\"\",\"calendarIconType\":\"\",\"calendarIconUrl\":\"\",\"dateType\":\"\",\"dateFormat\":\"\",\"phoneFormat\":\"\",\"addressType\":\"\",\"defaultCountry\":\"\",\"defaultProvince\":\"\",\"defaultState\":\"\",\"hideAddress2\":\"\",\"hideCountry\":\"\",\"hideState\":\"\",\"inputs\":\"\",\"nameFormat\":\"\",\"allowedExtensions\":\"\",\"captchaType\":\"\",\"pageNumber\":1,\"captchaTheme\":\"\",\"simpleCaptchaSize\":\"\",\"simpleCaptchaFontColor\":\"\",\"simpleCaptchaBackgroundColor\":\"\",\"failed_validation\":\"\",\"productField\":\"\",\"enablePasswordInput\":\"\",\"maxLength\":\"\",\"enablePrice\":\"\",\"basePrice\":\"\",\"formId\":2,\"descriptionPlacement\":\"below\"},{\"adminLabel\":\"\",\"adminOnly\":\"\",\"allowsPrepopulate\":\"\",\"defaultValue\":\"\",\"description\":\"\",\"content\":\"\",\"cssClass\":\"\",\"errorMessage\":\"\",\"id\":\"4\",\"inputName\":\"\",\"isRequired\":\"\",\"label\":\"Request Type\",\"noDuplicates\":\"\",\"size\":\"large\",\"type\":\"select\",\"postCustomFieldName\":\"\",\"displayAllCategories\":\"\",\"displayCaption\":\"\",\"displayDescription\":\"\",\"displayTitle\":\"\",\"inputType\":\"\",\"rangeMin\":\"\",\"rangeMax\":\"\",\"calendarIconType\":\"\",\"calendarIconUrl\":\"\",\"dateType\":\"\",\"dateFormat\":\"\",\"phoneFormat\":\"\",\"addressType\":\"\",\"defaultCountry\":\"\",\"defaultProvince\":\"\",\"defaultState\":\"\",\"hideAddress2\":\"\",\"hideCountry\":\"\",\"hideState\":\"\",\"inputs\":\"\",\"nameFormat\":\"\",\"allowedExtensions\":\"\",\"captchaType\":\"\",\"pageNumber\":1,\"captchaTheme\":\"\",\"simpleCaptchaSize\":\"\",\"simpleCaptchaFontColor\":\"\",\"simpleCaptchaBackgroundColor\":\"\",\"failed_validation\":\"\",\"productField\":\"\",\"enablePasswordInput\":\"\",\"maxLength\":\"\",\"enablePrice\":\"\",\"basePrice\":\"\",\"choices\":[{\"text\":\"Option 1\",\"value\":\"Option 1\"},{\"text\":\"Option 2\",\"value\":\"Option 2\"},{\"text\":\"Other Request\",\"value\":\"Other Request\"}],\"formId\":2,\"descriptionPlacement\":\"below\"},{\"adminLabel\":\"\",\"adminOnly\":\"\",\"allowsPrepopulate\":\"\",\"defaultValue\":\"\",\"description\":\"\",\"content\":\"\",\"cssClass\":\"\",\"errorMessage\":\"\",\"id\":\"5\",\"inputName\":\"\",\"isRequired\":\"1\",\"label\":\"Special Requests\",\"noDuplicates\":\"\",\"size\":\"large\",\"type\":\"textarea\",\"postCustomFieldName\":\"\",\"displayAllCategories\":\"\",\"displayCaption\":\"\",\"displayDescription\":\"\",\"displayTitle\":\"\",\"inputType\":\"\",\"rangeMin\":\"\",\"rangeMax\":\"\",\"calendarIconType\":\"\",\"calendarIconUrl\":\"\",\"dateType\":\"\",\"dateFormat\":\"\",\"phoneFormat\":\"\",\"addressType\":\"\",\"defaultCountry\":\"\",\"defaultProvince\":\"\",\"defaultState\":\"\",\"hideAddress2\":\"\",\"hideCountry\":\"\",\"hideState\":\"\",\"inputs\":\"\",\"nameFormat\":\"\",\"allowedExtensions\":\"\",\"captchaType\":\"\",\"pageNumber\":1,\"captchaTheme\":\"\",\"simpleCaptchaSize\":\"\",\"simpleCaptchaFontColor\":\"\",\"simpleCaptchaBackgroundColor\":\"\",\"failed_validation\":\"\",\"productField\":\"\",\"enablePasswordInput\":\"\",\"maxLength\":\"\",\"enablePrice\":\"\",\"basePrice\":\"\",\"formId\":2,\"descriptionPlacement\":\"below\"}],\"id\":2,\"cssClass\":\"\",\"enableHoneypot\":\"\",\"enableAnimation\":\"\",\"limitEntries\":\"\",\"limitEntriesCount\":\"\",\"limitEntriesPeriod\":\"\",\"limitEntriesMessage\":\"\",\"scheduleForm\":\"\",\"scheduleStart\":\"\",\"scheduleStartHour\":\"\",\"scheduleStartMinute\":\"\",\"scheduleStartAmpm\":\"\",\"scheduleEnd\":\"\",\"scheduleEndHour\":\"\",\"scheduleEndMinute\":\"\",\"scheduleEndAmpm\":\"\",\"schedulePendingMessage\":\"\",\"scheduleMessage\":\"\",\"requireLogin\":\"\",\"requireLoginMessage\":\"\",\"postContentTemplateEnabled\":false,\"postTitleTemplateEnabled\":false,\"postTitleTemplate\":\"\",\"postContentTemplate\":\"\",\"lastPageButton\":null,\"pagination\":null,\"firstPageCssClass\":null}',NULL,'{\"5404913ba4c7f\":{\"id\":\"5404913ba4c7f\",\"isDefault\":\"1\",\"type\":\"message\",\"name\":\"Default Confirmation\",\"message\":\"Obrigado pelo contato!  Entraremos em contato em breve!\",\"disableAutoformat\":\"\",\"pageId\":\"\",\"url\":\"\",\"queryString\":\"\",\"conditionalLogic\":[]}}','{\"5404913ba4666\":{\"id\":\"5404913ba4666\",\"to\":\"{admin_email}\",\"name\":\"Admin Notification\",\"event\":\"form_submission\",\"toType\":\"email\",\"subject\":\"New submission from {form_title}\",\"message\":\"{all_fields}\"}}');
INSERT INTO `wp_rg_form_meta` VALUES (3,'{\"labelPlacement\":\"top_label\",\"useCurrentUserAsAuthor\":\"1\",\"title\":\"Lua de Mel\",\"description\":\"Como tornar sua Lua de Mel ainda mais especial...\",\"descriptionPlacement\":\"below\",\"button\":{\"type\":\"text\",\"text\":\"Submit\",\"imageUrl\":\"\"},\"fields\":[{\"id\":\"1\",\"type\":\"name\",\"size\":\"medium\",\"label\":\"Name\",\"inputs\":[{\"id\":\"1.3\",\"label\":\"First\"},{\"id\":\"1.6\",\"label\":\"Last\"}],\"formId\":3,\"pageNumber\":1,\"descriptionPlacement\":\"below\"},{\"id\":\"2\",\"type\":\"phone\",\"size\":\"large\",\"phoneFormat\":\"standard\",\"label\":\"Phone Number\",\"formId\":3,\"pageNumber\":1,\"descriptionPlacement\":\"below\"},{\"id\":\"3\",\"type\":\"email\",\"size\":\"large\",\"label\":\"Email Address\",\"formId\":3,\"pageNumber\":1,\"descriptionPlacement\":\"below\"},{\"id\":\"4\",\"type\":\"select\",\"size\":\"large\",\"label\":\"Request Type\",\"choices\":[{\"text\":\"Option 1\",\"value\":\"Option 1\"},{\"text\":\"Option 2\",\"value\":\"Option 2\"},{\"text\":\"Other Request\",\"value\":\"Other Request\"}],\"formId\":3,\"pageNumber\":1,\"descriptionPlacement\":\"below\"},{\"id\":\"5\",\"type\":\"textarea\",\"size\":\"large\",\"label\":\"Special Requests\",\"formId\":3,\"pageNumber\":1,\"descriptionPlacement\":\"below\"}],\"id\":3,\"notifications\":{\"5404913ba4666\":{\"id\":\"5404913ba4666\",\"to\":\"{admin_email}\",\"name\":\"Admin Notification\",\"event\":\"form_submission\",\"toType\":\"email\",\"subject\":\"New submission from {form_title}\",\"message\":\"{all_fields}\"}},\"confirmations\":{\"5404913ba4c7f\":{\"id\":\"5404913ba4c7f\",\"isDefault\":\"1\",\"type\":\"message\",\"name\":\"Default Confirmation\",\"message\":\"Thanks for contacting us! We will get in touch with you shortly.\"}},\"cssClass\":\"\",\"enableHoneypot\":\"\",\"enableAnimation\":\"\",\"limitEntries\":\"\",\"limitEntriesCount\":\"\",\"limitEntriesPeriod\":\"\",\"limitEntriesMessage\":\"\",\"scheduleForm\":\"\",\"scheduleStart\":\"\",\"scheduleStartHour\":\"\",\"scheduleStartMinute\":\"\",\"scheduleStartAmpm\":\"\",\"scheduleEnd\":\"\",\"scheduleEndHour\":\"\",\"scheduleEndMinute\":\"\",\"scheduleEndAmpm\":\"\",\"schedulePendingMessage\":\"\",\"scheduleMessage\":\"\",\"requireLogin\":\"\",\"requireLoginMessage\":\"\"}',NULL,'{\"5404913ba4c7f\":{\"id\":\"5404913ba4c7f\",\"isDefault\":\"1\",\"type\":\"message\",\"name\":\"Default Confirmation\",\"message\":\"Obrigado por nos contactar. Entraremos em contato em breve!!!\",\"disableAutoformat\":\"\",\"pageId\":\"\",\"url\":\"\",\"queryString\":\"\",\"conditionalLogic\":[]}}','{\"5404913ba4666\":{\"id\":\"5404913ba4666\",\"to\":\"{admin_email}\",\"name\":\"Admin Notification\",\"event\":\"form_submission\",\"toType\":\"email\",\"subject\":\"New submission from {form_title}\",\"message\":\"{all_fields}\"}}');
INSERT INTO `wp_rg_form_meta` VALUES (4,'{\"title\":\"Shopping\",\"description\":\"\",\"labelPlacement\":\"top_label\",\"descriptionPlacement\":\"below\",\"button\":{\"type\":\"text\",\"text\":\"Submit\",\"imageUrl\":\"\"},\"fields\":[],\"id\":4}',NULL,'{\"54aefedb87fde\":{\"id\":\"54aefedb87fde\",\"name\":\"Default Confirmation\",\"isDefault\":true,\"type\":\"message\",\"message\":\"Thanks for contacting us! We will get in touch with you shortly.\",\"url\":\"\",\"pageId\":\"\",\"queryString\":\"\"}}','{\"54aefedb87250\":{\"id\":\"54aefedb87250\",\"to\":\"{admin_email}\",\"name\":\"Admin Notification\",\"event\":\"form_submission\",\"toType\":\"email\",\"subject\":\"New submission from {form_title}\",\"message\":\"{all_fields}\"}}');
INSERT INTO `wp_rg_form_meta` VALUES (5,'{\"labelPlacement\":\"top_label\",\"useCurrentUserAsAuthor\":\"1\",\"title\":\"Shopping\",\"description\":\"Comemore sua viagem em um lugar especial\",\"descriptionPlacement\":\"below\",\"button\":{\"type\":\"text\",\"text\":\"Submit\",\"imageUrl\":\"\"},\"fields\":[{\"adminLabel\":\"\",\"adminOnly\":\"\",\"allowsPrepopulate\":\"\",\"defaultValue\":\"\",\"description\":\"\",\"content\":\"\",\"cssClass\":\"gf_left_half\",\"errorMessage\":\"\",\"id\":\"6\",\"inputName\":\"\",\"isRequired\":\"1\",\"label\":\"First Name\",\"noDuplicates\":\"\",\"size\":\"medium\",\"type\":\"text\",\"postCustomFieldName\":\"\",\"displayAllCategories\":\"\",\"displayCaption\":\"\",\"displayDescription\":\"\",\"displayTitle\":\"\",\"inputType\":\"\",\"rangeMin\":\"\",\"rangeMax\":\"\",\"calendarIconType\":\"\",\"calendarIconUrl\":\"\",\"dateType\":\"\",\"dateFormat\":\"\",\"phoneFormat\":\"\",\"addressType\":\"\",\"defaultCountry\":\"\",\"defaultProvince\":\"\",\"defaultState\":\"\",\"hideAddress2\":\"\",\"hideCountry\":\"\",\"hideState\":\"\",\"inputs\":\"\",\"nameFormat\":\"\",\"allowedExtensions\":\"\",\"captchaType\":\"\",\"pageNumber\":1,\"captchaTheme\":\"\",\"simpleCaptchaSize\":\"\",\"simpleCaptchaFontColor\":\"\",\"simpleCaptchaBackgroundColor\":\"\",\"failed_validation\":\"\",\"productField\":\"\",\"enablePasswordInput\":\"\",\"maxLength\":\"\",\"enablePrice\":\"\",\"basePrice\":\"\",\"formId\":5,\"descriptionPlacement\":\"below\"},{\"adminLabel\":\"\",\"adminOnly\":\"\",\"allowsPrepopulate\":\"\",\"defaultValue\":\"\",\"description\":\"\",\"content\":\"\",\"cssClass\":\"gf_right_half\",\"errorMessage\":\"\",\"id\":\"7\",\"inputName\":\"\",\"isRequired\":\"1\",\"label\":\"Last Name\",\"noDuplicates\":\"\",\"size\":\"medium\",\"type\":\"text\",\"postCustomFieldName\":\"\",\"displayAllCategories\":\"\",\"displayCaption\":\"\",\"displayDescription\":\"\",\"displayTitle\":\"\",\"inputType\":\"\",\"rangeMin\":\"\",\"rangeMax\":\"\",\"calendarIconType\":\"\",\"calendarIconUrl\":\"\",\"dateType\":\"\",\"dateFormat\":\"\",\"phoneFormat\":\"\",\"addressType\":\"\",\"defaultCountry\":\"\",\"defaultProvince\":\"\",\"defaultState\":\"\",\"hideAddress2\":\"\",\"hideCountry\":\"\",\"hideState\":\"\",\"inputs\":\"\",\"nameFormat\":\"\",\"allowedExtensions\":\"\",\"captchaType\":\"\",\"pageNumber\":1,\"captchaTheme\":\"\",\"simpleCaptchaSize\":\"\",\"simpleCaptchaFontColor\":\"\",\"simpleCaptchaBackgroundColor\":\"\",\"failed_validation\":\"\",\"productField\":\"\",\"enablePasswordInput\":\"\",\"maxLength\":\"\",\"enablePrice\":\"\",\"basePrice\":\"\",\"formId\":5,\"descriptionPlacement\":\"below\"},{\"adminLabel\":\"\",\"adminOnly\":\"\",\"allowsPrepopulate\":\"\",\"defaultValue\":\"\",\"description\":\"\",\"content\":\"\",\"cssClass\":\"\",\"errorMessage\":\"\",\"id\":\"2\",\"inputName\":\"\",\"isRequired\":\"1\",\"label\":\"Phone Number\",\"noDuplicates\":\"\",\"size\":\"large\",\"type\":\"phone\",\"postCustomFieldName\":\"\",\"displayAllCategories\":\"\",\"displayCaption\":\"\",\"displayDescription\":\"\",\"displayTitle\":\"\",\"inputType\":\"\",\"rangeMin\":\"\",\"rangeMax\":\"\",\"calendarIconType\":\"\",\"calendarIconUrl\":\"\",\"dateType\":\"\",\"dateFormat\":\"\",\"phoneFormat\":\"standard\",\"addressType\":\"\",\"defaultCountry\":\"\",\"defaultProvince\":\"\",\"defaultState\":\"\",\"hideAddress2\":\"\",\"hideCountry\":\"\",\"hideState\":\"\",\"inputs\":\"\",\"nameFormat\":\"\",\"allowedExtensions\":\"\",\"captchaType\":\"\",\"pageNumber\":1,\"captchaTheme\":\"\",\"simpleCaptchaSize\":\"\",\"simpleCaptchaFontColor\":\"\",\"simpleCaptchaBackgroundColor\":\"\",\"failed_validation\":\"\",\"productField\":\"\",\"enablePasswordInput\":\"\",\"maxLength\":\"\",\"enablePrice\":\"\",\"basePrice\":\"\",\"formId\":5,\"descriptionPlacement\":\"below\"},{\"adminLabel\":\"\",\"adminOnly\":\"\",\"allowsPrepopulate\":\"\",\"defaultValue\":\"\",\"description\":\"\",\"content\":\"\",\"cssClass\":\"\",\"errorMessage\":\"\",\"id\":\"3\",\"inputName\":\"\",\"isRequired\":\"1\",\"label\":\"Email Address\",\"noDuplicates\":\"\",\"size\":\"large\",\"type\":\"email\",\"postCustomFieldName\":\"\",\"displayAllCategories\":\"\",\"displayCaption\":\"\",\"displayDescription\":\"\",\"displayTitle\":\"\",\"inputType\":\"\",\"rangeMin\":\"\",\"rangeMax\":\"\",\"calendarIconType\":\"\",\"calendarIconUrl\":\"\",\"dateType\":\"\",\"dateFormat\":\"\",\"phoneFormat\":\"\",\"addressType\":\"\",\"defaultCountry\":\"\",\"defaultProvince\":\"\",\"defaultState\":\"\",\"hideAddress2\":\"\",\"hideCountry\":\"\",\"hideState\":\"\",\"inputs\":\"\",\"nameFormat\":\"\",\"allowedExtensions\":\"\",\"captchaType\":\"\",\"pageNumber\":1,\"captchaTheme\":\"\",\"simpleCaptchaSize\":\"\",\"simpleCaptchaFontColor\":\"\",\"simpleCaptchaBackgroundColor\":\"\",\"failed_validation\":\"\",\"productField\":\"\",\"enablePasswordInput\":\"\",\"maxLength\":\"\",\"enablePrice\":\"\",\"basePrice\":\"\",\"formId\":5,\"descriptionPlacement\":\"below\"},{\"adminLabel\":\"\",\"adminOnly\":\"\",\"allowsPrepopulate\":\"\",\"defaultValue\":\"\",\"description\":\"\",\"content\":\"\",\"cssClass\":\"\",\"errorMessage\":\"\",\"id\":\"4\",\"inputName\":\"\",\"isRequired\":\"\",\"label\":\"Request Type\",\"noDuplicates\":\"\",\"size\":\"large\",\"type\":\"select\",\"postCustomFieldName\":\"\",\"displayAllCategories\":\"\",\"displayCaption\":\"\",\"displayDescription\":\"\",\"displayTitle\":\"\",\"inputType\":\"\",\"rangeMin\":\"\",\"rangeMax\":\"\",\"calendarIconType\":\"\",\"calendarIconUrl\":\"\",\"dateType\":\"\",\"dateFormat\":\"\",\"phoneFormat\":\"\",\"addressType\":\"\",\"defaultCountry\":\"\",\"defaultProvince\":\"\",\"defaultState\":\"\",\"hideAddress2\":\"\",\"hideCountry\":\"\",\"hideState\":\"\",\"inputs\":\"\",\"nameFormat\":\"\",\"allowedExtensions\":\"\",\"captchaType\":\"\",\"pageNumber\":1,\"captchaTheme\":\"\",\"simpleCaptchaSize\":\"\",\"simpleCaptchaFontColor\":\"\",\"simpleCaptchaBackgroundColor\":\"\",\"failed_validation\":\"\",\"productField\":\"\",\"enablePasswordInput\":\"\",\"maxLength\":\"\",\"enablePrice\":\"\",\"basePrice\":\"\",\"choices\":[{\"text\":\"Option 1\",\"value\":\"Option 1\"},{\"text\":\"Option 2\",\"value\":\"Option 2\"},{\"text\":\"Other Request\",\"value\":\"Other Request\"}],\"formId\":5,\"descriptionPlacement\":\"below\"},{\"adminLabel\":\"\",\"adminOnly\":\"\",\"allowsPrepopulate\":\"\",\"defaultValue\":\"\",\"description\":\"\",\"content\":\"\",\"cssClass\":\"\",\"errorMessage\":\"\",\"id\":\"5\",\"inputName\":\"\",\"isRequired\":\"1\",\"label\":\"Special Requests\",\"noDuplicates\":\"\",\"size\":\"large\",\"type\":\"textarea\",\"postCustomFieldName\":\"\",\"displayAllCategories\":\"\",\"displayCaption\":\"\",\"displayDescription\":\"\",\"displayTitle\":\"\",\"inputType\":\"\",\"rangeMin\":\"\",\"rangeMax\":\"\",\"calendarIconType\":\"\",\"calendarIconUrl\":\"\",\"dateType\":\"\",\"dateFormat\":\"\",\"phoneFormat\":\"\",\"addressType\":\"\",\"defaultCountry\":\"\",\"defaultProvince\":\"\",\"defaultState\":\"\",\"hideAddress2\":\"\",\"hideCountry\":\"\",\"hideState\":\"\",\"inputs\":\"\",\"nameFormat\":\"\",\"allowedExtensions\":\"\",\"captchaType\":\"\",\"pageNumber\":1,\"captchaTheme\":\"\",\"simpleCaptchaSize\":\"\",\"simpleCaptchaFontColor\":\"\",\"simpleCaptchaBackgroundColor\":\"\",\"failed_validation\":\"\",\"productField\":\"\",\"enablePasswordInput\":\"\",\"maxLength\":\"\",\"enablePrice\":\"\",\"basePrice\":\"\",\"formId\":5,\"descriptionPlacement\":\"below\"}],\"id\":5,\"cssClass\":\"\",\"enableHoneypot\":\"\",\"enableAnimation\":\"\",\"limitEntries\":\"\",\"limitEntriesCount\":\"\",\"limitEntriesPeriod\":\"\",\"limitEntriesMessage\":\"\",\"scheduleForm\":\"\",\"scheduleStart\":\"\",\"scheduleStartHour\":\"\",\"scheduleStartMinute\":\"\",\"scheduleStartAmpm\":\"\",\"scheduleEnd\":\"\",\"scheduleEndHour\":\"\",\"scheduleEndMinute\":\"\",\"scheduleEndAmpm\":\"\",\"schedulePendingMessage\":\"\",\"scheduleMessage\":\"\",\"requireLogin\":\"\",\"requireLoginMessage\":\"\",\"postContentTemplateEnabled\":false,\"postTitleTemplateEnabled\":false,\"postTitleTemplate\":\"\",\"postContentTemplate\":\"\",\"lastPageButton\":null,\"pagination\":null,\"firstPageCssClass\":null,\"notifications\":{\"5404913ba4666\":{\"id\":\"5404913ba4666\",\"to\":\"{admin_email}\",\"name\":\"Admin Notification\",\"event\":\"form_submission\",\"toType\":\"email\",\"subject\":\"New submission from {form_title}\",\"message\":\"{all_fields}\"}},\"confirmations\":{\"5404913ba4c7f\":{\"id\":\"5404913ba4c7f\",\"isDefault\":\"1\",\"type\":\"message\",\"name\":\"Default Confirmation\",\"message\":\"Obrigado pelo contato!  Entraremos em contato em breve!\",\"disableAutoformat\":\"\",\"pageId\":\"\",\"url\":\"\",\"queryString\":\"\",\"conditionalLogic\":[]}}}',NULL,'{\"5404913ba4c7f\":{\"id\":\"5404913ba4c7f\",\"isDefault\":\"1\",\"type\":\"message\",\"name\":\"Default Confirmation\",\"message\":\"Obrigado pelo contato!  Entraremos em contato em breve!\",\"disableAutoformat\":\"\",\"pageId\":\"\",\"url\":\"\",\"queryString\":\"\",\"conditionalLogic\":[]}}','{\"5404913ba4666\":{\"id\":\"5404913ba4666\",\"to\":\"{admin_email}\",\"name\":\"Admin Notification\",\"event\":\"form_submission\",\"toType\":\"email\",\"subject\":\"New submission from {form_title}\",\"message\":\"{all_fields}\"}}');
/*!40000 ALTER TABLE `wp_rg_form_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_rg_form_view`
--

DROP TABLE IF EXISTS `wp_rg_form_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_rg_form_view` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `ip` char(15) DEFAULT NULL,
  `count` mediumint(8) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_rg_form_view`
--

LOCK TABLES `wp_rg_form_view` WRITE;
/*!40000 ALTER TABLE `wp_rg_form_view` DISABLE KEYS */;
INSERT INTO `wp_rg_form_view` VALUES (1,1,'2014-11-12 21:56:12','67.79.179.114',1);
INSERT INTO `wp_rg_form_view` VALUES (2,2,'2014-12-23 19:50:50','67.79.179.114',1);
INSERT INTO `wp_rg_form_view` VALUES (3,1,'2014-12-23 19:51:06','67.79.179.114',1);
/*!40000 ALTER TABLE `wp_rg_form_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_rg_lead`
--

DROP TABLE IF EXISTS `wp_rg_lead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_rg_lead` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `is_starred` tinyint(1) NOT NULL DEFAULT '0',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `ip` varchar(39) NOT NULL,
  `source_url` varchar(200) NOT NULL DEFAULT '',
  `user_agent` varchar(250) NOT NULL DEFAULT '',
  `currency` varchar(5) DEFAULT NULL,
  `payment_status` varchar(15) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_amount` decimal(19,2) DEFAULT NULL,
  `payment_method` varchar(30) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `is_fulfilled` tinyint(1) DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `transaction_type` tinyint(1) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_rg_lead`
--

LOCK TABLES `wp_rg_lead` WRITE;
/*!40000 ALTER TABLE `wp_rg_lead` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_rg_lead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_rg_lead_detail`
--

DROP TABLE IF EXISTS `wp_rg_lead_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_rg_lead_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(10) unsigned NOT NULL,
  `form_id` mediumint(8) unsigned NOT NULL,
  `field_number` float NOT NULL,
  `value` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `lead_id` (`lead_id`),
  KEY `lead_field_number` (`lead_id`,`field_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_rg_lead_detail`
--

LOCK TABLES `wp_rg_lead_detail` WRITE;
/*!40000 ALTER TABLE `wp_rg_lead_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_rg_lead_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_rg_lead_detail_long`
--

DROP TABLE IF EXISTS `wp_rg_lead_detail_long`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_rg_lead_detail_long` (
  `lead_detail_id` bigint(20) unsigned NOT NULL,
  `value` longtext,
  PRIMARY KEY (`lead_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_rg_lead_detail_long`
--

LOCK TABLES `wp_rg_lead_detail_long` WRITE;
/*!40000 ALTER TABLE `wp_rg_lead_detail_long` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_rg_lead_detail_long` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_rg_lead_meta`
--

DROP TABLE IF EXISTS `wp_rg_lead_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_rg_lead_meta` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lead_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `meta_key` (`meta_key`),
  KEY `lead_id` (`lead_id`),
  KEY `form_id_meta_key` (`form_id`,`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_rg_lead_meta`
--

LOCK TABLES `wp_rg_lead_meta` WRITE;
/*!40000 ALTER TABLE `wp_rg_lead_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_rg_lead_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_rg_lead_notes`
--

DROP TABLE IF EXISTS `wp_rg_lead_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_rg_lead_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(10) unsigned NOT NULL,
  `user_name` varchar(250) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `value` longtext,
  `note_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_id` (`lead_id`),
  KEY `lead_user_key` (`lead_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_rg_lead_notes`
--

LOCK TABLES `wp_rg_lead_notes` WRITE;
/*!40000 ALTER TABLE `wp_rg_lead_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_rg_lead_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES (1,1,0);
INSERT INTO `wp_term_relationships` VALUES (15,2,0);
INSERT INTO `wp_term_relationships` VALUES (16,2,0);
INSERT INTO `wp_term_relationships` VALUES (17,2,0);
INSERT INTO `wp_term_relationships` VALUES (18,2,0);
INSERT INTO `wp_term_relationships` VALUES (19,2,0);
INSERT INTO `wp_term_relationships` VALUES (20,3,0);
INSERT INTO `wp_term_relationships` VALUES (21,3,0);
INSERT INTO `wp_term_relationships` VALUES (22,3,0);
INSERT INTO `wp_term_relationships` VALUES (23,3,0);
INSERT INTO `wp_term_relationships` VALUES (24,3,0);
INSERT INTO `wp_term_relationships` VALUES (26,3,0);
INSERT INTO `wp_term_relationships` VALUES (29,4,0);
INSERT INTO `wp_term_relationships` VALUES (36,4,0);
INSERT INTO `wp_term_relationships` VALUES (37,4,0);
INSERT INTO `wp_term_relationships` VALUES (38,5,0);
INSERT INTO `wp_term_relationships` VALUES (39,5,0);
INSERT INTO `wp_term_relationships` VALUES (40,5,0);
INSERT INTO `wp_term_relationships` VALUES (41,4,0);
INSERT INTO `wp_term_relationships` VALUES (41,5,0);
INSERT INTO `wp_term_relationships` VALUES (67,1,0);
INSERT INTO `wp_term_relationships` VALUES (71,3,0);
INSERT INTO `wp_term_relationships` VALUES (103,1,0);
INSERT INTO `wp_term_relationships` VALUES (112,2,0);
INSERT INTO `wp_term_relationships` VALUES (113,2,0);
INSERT INTO `wp_term_relationships` VALUES (114,2,0);
INSERT INTO `wp_term_relationships` VALUES (115,2,0);
INSERT INTO `wp_term_relationships` VALUES (116,2,0);
INSERT INTO `wp_term_relationships` VALUES (117,3,0);
INSERT INTO `wp_term_relationships` VALUES (118,3,0);
INSERT INTO `wp_term_relationships` VALUES (119,3,0);
INSERT INTO `wp_term_relationships` VALUES (120,3,0);
INSERT INTO `wp_term_relationships` VALUES (121,3,0);
INSERT INTO `wp_term_relationships` VALUES (122,3,0);
INSERT INTO `wp_term_relationships` VALUES (129,3,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,3);
INSERT INTO `wp_term_taxonomy` VALUES (2,2,'nav_menu','',0,10);
INSERT INTO `wp_term_taxonomy` VALUES (3,3,'nav_menu','',0,14);
INSERT INTO `wp_term_taxonomy` VALUES (4,4,'category','',0,4);
INSERT INTO `wp_term_taxonomy` VALUES (5,5,'category','',0,4);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `name` (`name`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Uncategorized','uncategorized',0);
INSERT INTO `wp_terms` VALUES (2,'Main Menu Navigation','main-menu-navigation',0);
INSERT INTO `wp_terms` VALUES (3,'Nav Footer','nav-footer',0);
INSERT INTO `wp_terms` VALUES (4,'Today\'s Top Deals','top-deals',0);
INSERT INTO `wp_terms` VALUES (5,'Featured Offers','featured-offers',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'first_name','');
INSERT INTO `wp_usermeta` VALUES (2,1,'last_name','');
INSERT INTO `wp_usermeta` VALUES (3,1,'nickname','concepta');
INSERT INTO `wp_usermeta` VALUES (4,1,'description','');
INSERT INTO `wp_usermeta` VALUES (5,1,'rich_editing','true');
INSERT INTO `wp_usermeta` VALUES (6,1,'comment_shortcuts','false');
INSERT INTO `wp_usermeta` VALUES (7,1,'admin_color','fresh');
INSERT INTO `wp_usermeta` VALUES (8,1,'use_ssl','0');
INSERT INTO `wp_usermeta` VALUES (9,1,'show_admin_bar_front','true');
INSERT INTO `wp_usermeta` VALUES (10,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}');
INSERT INTO `wp_usermeta` VALUES (11,1,'wp_user_level','10');
INSERT INTO `wp_usermeta` VALUES (12,1,'dismissed_wp_pointers','wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media,wp360_revisions,wp360_locks');
INSERT INTO `wp_usermeta` VALUES (13,1,'show_welcome_panel','1');
INSERT INTO `wp_usermeta` VALUES (14,1,'wp_user-settings','libraryContent=browse&editor=tinymce&advImgDetails=show&urlbutton=none&imgsize=full&wplink=1');
INSERT INTO `wp_usermeta` VALUES (15,1,'wp_user-settings-time','1421706583');
INSERT INTO `wp_usermeta` VALUES (16,1,'wp_dashboard_quick_press_last_post_id','110');
INSERT INTO `wp_usermeta` VALUES (17,1,'session_tokens','a:1:{s:64:\"a24f6c0d468ac8a09c248601d3d24e7ecfb7b87535a02734a4a7cb6ea66a776c\";a:4:{s:10:\"expiration\";i:1425831257;s:2:\"ip\";s:13:\"67.79.179.114\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36\";s:5:\"login\";i:1425658457;}}');
INSERT INTO `wp_usermeta` VALUES (18,1,'managenav-menuscolumnshidden','a:4:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";}');
INSERT INTO `wp_usermeta` VALUES (19,1,'metaboxhidden_nav-menus','a:3:{i:0;s:8:\"add-post\";i:1;s:12:\"add-post_tag\";i:2;s:15:\"add-post_format\";}');
INSERT INTO `wp_usermeta` VALUES (20,1,'nav_menu_recently_edited','3');
INSERT INTO `wp_usermeta` VALUES (21,1,'closedpostboxes_dashboard','a:0:{}');
INSERT INTO `wp_usermeta` VALUES (22,1,'metaboxhidden_dashboard','a:0:{}');
INSERT INTO `wp_usermeta` VALUES (23,1,'wpcf-group-form-toggle','a:1:{i:28;a:1:{s:19:\"fieldset-save-up-to\";i:1;}}');
INSERT INTO `wp_usermeta` VALUES (24,1,'closedpostboxes_page','a:0:{}');
INSERT INTO `wp_usermeta` VALUES (25,1,'metaboxhidden_page','a:5:{i:0;s:12:\"revisionsdiv\";i:1;s:16:\"commentstatusdiv\";i:2;s:11:\"commentsdiv\";i:3;s:7:\"slugdiv\";i:4;s:9:\"authordiv\";}');
INSERT INTO `wp_usermeta` VALUES (26,2,'nickname','kaluahb2c');
INSERT INTO `wp_usermeta` VALUES (27,2,'first_name','Mariana');
INSERT INTO `wp_usermeta` VALUES (28,2,'last_name','Manigold');
INSERT INTO `wp_usermeta` VALUES (29,2,'description','');
INSERT INTO `wp_usermeta` VALUES (30,2,'rich_editing','true');
INSERT INTO `wp_usermeta` VALUES (31,2,'comment_shortcuts','false');
INSERT INTO `wp_usermeta` VALUES (32,2,'admin_color','fresh');
INSERT INTO `wp_usermeta` VALUES (33,2,'use_ssl','0');
INSERT INTO `wp_usermeta` VALUES (34,2,'show_admin_bar_front','true');
INSERT INTO `wp_usermeta` VALUES (35,2,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}');
INSERT INTO `wp_usermeta` VALUES (36,2,'wp_user_level','10');
INSERT INTO `wp_usermeta` VALUES (37,2,'dismissed_wp_pointers','wp350_media,wp360_revisions,wp360_locks,wp390_widgets');
INSERT INTO `wp_usermeta` VALUES (38,2,'session_tokens','a:1:{s:64:\"ba1ec5efd5a01e0d257adde8ed009ab369bff7921048b09f57b2687fb908e58e\";i:1420926136;}');
INSERT INTO `wp_usermeta` VALUES (39,2,'wp_dashboard_quick_press_last_post_id','98');
INSERT INTO `wp_usermeta` VALUES (40,2,'wp_user-settings','unfold=1&mfold=o&editor=html&libraryContent=browse&advImgDetails=show');
INSERT INTO `wp_usermeta` VALUES (41,2,'wp_user-settings-time','1416429260');
INSERT INTO `wp_usermeta` VALUES (42,2,'closedpostboxes_post','a:0:{}');
INSERT INTO `wp_usermeta` VALUES (43,2,'metaboxhidden_post','a:7:{i:0;s:11:\"postexcerpt\";i:1;s:13:\"trackbacksdiv\";i:2;s:10:\"postcustom\";i:3;s:16:\"commentstatusdiv\";i:4;s:11:\"commentsdiv\";i:5;s:7:\"slugdiv\";i:6;s:9:\"authordiv\";}');
INSERT INTO `wp_usermeta` VALUES (44,2,'nav_menu_recently_edited','2');
INSERT INTO `wp_usermeta` VALUES (45,2,'managenav-menuscolumnshidden','a:4:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";}');
INSERT INTO `wp_usermeta` VALUES (46,2,'metaboxhidden_nav-menus','a:4:{i:0;s:8:\"add-post\";i:1;s:8:\"add-deal\";i:2;s:12:\"add-post_tag\";i:3;s:15:\"add-post_format\";}');
INSERT INTO `wp_usermeta` VALUES (47,1,'meta-box-order_deal','a:3:{s:4:\"side\";s:49:\"wpcf-marketing,submitdiv,categorydiv,postimagediv\";s:6:\"normal\";s:40:\"postcustom,wpcf-group-save-up-to,slugdiv\";s:8:\"advanced\";s:0:\"\";}');
INSERT INTO `wp_usermeta` VALUES (48,1,'screen_layout_deal','2');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES (1,'concepta','$P$BgnFgqSJgO4opBoIcljWRYGU2093ev/','concepta','bruno@conceptsol.com','','2013-10-30 13:37:36','',0,'concepta');
INSERT INTO `wp_users` VALUES (2,'kaluahb2c','$P$Bn0ZXFDVHNHx8LRtCKNRIq/UwMWyBS.','kaluahb2c','m.manigold@kaluahtours.com','','2014-11-10 20:12:56','',0,'Mariana Manigold');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-06 16:41:29
