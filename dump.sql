-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: spark
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_post_history` int(11) DEFAULT NULL,
  `comment` text,
  `username` varchar(256) DEFAULT NULL,
  `full_name` varchar(256) DEFAULT NULL,
  `profile_image_url` varchar(256) DEFAULT NULL,
  `id_perfil` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_posts_history_id_fk` (`id_post_history`),
  KEY `comments_perfil_social_id_fk` (`id_perfil`),
  KEY `comments_users_id_fk` (`id_user`),
  CONSTRAINT `comments_perfil_social_id_fk` FOREIGN KEY (`id_perfil`) REFERENCES `perfil_social` (`id`),
  CONSTRAINT `comments_posts_history_id_fk` FOREIGN KEY (`id_post_history`) REFERENCES `posts_history` (`id`),
  CONSTRAINT `comments_users_id_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments_watson`
--

DROP TABLE IF EXISTS `comments_watson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments_watson` (
  `id` int(11) DEFAULT NULL,
  `id_comment` int(11) DEFAULT NULL,
  KEY `comments_watson_comments_id_fk` (`id_comment`),
  CONSTRAINT `comments_watson_comments_id_fk` FOREIGN KEY (`id_comment`) REFERENCES `comments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments_watson`
--

LOCK TABLES `comments_watson` WRITE;
/*!40000 ALTER TABLE `comments_watson` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments_watson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_auth_facebook`
--

DROP TABLE IF EXISTS `perfil_auth_facebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil_auth_facebook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_perfil` int(11) DEFAULT NULL,
  `secret_key` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_auth_facebook_users_id_fk` (`id_user`),
  KEY `perfil_auth_facebook_perfil_social_id_fk` (`id_perfil`),
  CONSTRAINT `perfil_auth_facebook_perfil_social_id_fk` FOREIGN KEY (`id_perfil`) REFERENCES `perfil_social` (`id`),
  CONSTRAINT `users_auth_facebook_users_id_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_auth_facebook`
--

LOCK TABLES `perfil_auth_facebook` WRITE;
/*!40000 ALTER TABLE `perfil_auth_facebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfil_auth_facebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_auth_instagram`
--

DROP TABLE IF EXISTS `perfil_auth_instagram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil_auth_instagram` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_perfil` int(11) DEFAULT NULL,
  `secret_key` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_auth_instagram_users_id_fk` (`id_user`),
  KEY `perfil_auth_instagram_perfil_social_id_fk` (`id_perfil`),
  CONSTRAINT `perfil_auth_instagram_perfil_social_id_fk` FOREIGN KEY (`id_perfil`) REFERENCES `perfil_social` (`id`),
  CONSTRAINT `users_auth_instagram_users_id_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_auth_instagram`
--

LOCK TABLES `perfil_auth_instagram` WRITE;
/*!40000 ALTER TABLE `perfil_auth_instagram` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfil_auth_instagram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_auth_twitter`
--

DROP TABLE IF EXISTS `perfil_auth_twitter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil_auth_twitter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_perfil` int(11) DEFAULT NULL,
  `secret_key` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_auth_twitter_users_id_fk` (`id_user`),
  KEY `users_auth_twitter_perfil_social_id_fk` (`id_perfil`),
  CONSTRAINT `users_auth_twitter_perfil_social_id_fk` FOREIGN KEY (`id_perfil`) REFERENCES `perfil_social` (`id`),
  CONSTRAINT `users_auth_twitter_users_id_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_auth_twitter`
--

LOCK TABLES `perfil_auth_twitter` WRITE;
/*!40000 ALTER TABLE `perfil_auth_twitter` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfil_auth_twitter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_social`
--

DROP TABLE IF EXISTS `perfil_social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil_social` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_perfil` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `tipo` enum('facebook','twitter','instagram') DEFAULT NULL,
  `username` varchar(256) DEFAULT NULL,
  `full_name` varchar(256) DEFAULT NULL,
  `imagem_url` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `perfil_social_users_id_fk` (`id_user`),
  CONSTRAINT `perfil_social_users_id_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_social`
--

LOCK TABLES `perfil_social` WRITE;
/*!40000 ALTER TABLE `perfil_social` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfil_social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_perfil` int(11) DEFAULT NULL,
  `id_content` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_media` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_perfil_social_id_fk` (`id_perfil`),
  KEY `posts_posts_content_id_fk` (`id_content`),
  KEY `posts_users_id_fk_2` (`id_user`),
  CONSTRAINT `posts_perfil_social_id_fk` FOREIGN KEY (`id_perfil`) REFERENCES `perfil_social` (`id`),
  CONSTRAINT `posts_posts_content_id_fk` FOREIGN KEY (`id_content`) REFERENCES `posts_content` (`id`),
  CONSTRAINT `posts_users_id_fk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_content`
--

DROP TABLE IF EXISTS `posts_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `posts_users_id_fk` (`id_user`),
  CONSTRAINT `posts_users_id_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_content`
--

LOCK TABLES `posts_content` WRITE;
/*!40000 ALTER TABLE `posts_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_history`
--

DROP TABLE IF EXISTS `posts_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_media` int(11) DEFAULT NULL,
  `data_publicacao` datetime DEFAULT NULL,
  `like_count` int(11) DEFAULT NULL,
  `content` text,
  `id_user` int(11) DEFAULT NULL,
  `id_perfil` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_history_users_id_fk` (`id_user`),
  KEY `posts_history_perfil_social_id_fk` (`id_perfil`),
  CONSTRAINT `posts_history_perfil_social_id_fk` FOREIGN KEY (`id_perfil`) REFERENCES `perfil_social` (`id`),
  CONSTRAINT `posts_history_users_id_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_history`
--

LOCK TABLES `posts_history` WRITE;
/*!40000 ALTER TABLE `posts_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_history_images`
--

DROP TABLE IF EXISTS `posts_history_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts_history_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_post_history` int(11) DEFAULT NULL,
  `image_url` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_history_images_posts_history_id_fk` (`id_post_history`),
  CONSTRAINT `posts_history_images_posts_history_id_fk` FOREIGN KEY (`id_post_history`) REFERENCES `posts_history` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_history_images`
--

LOCK TABLES `posts_history_images` WRITE;
/*!40000 ALTER TABLE `posts_history_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_history_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_imagens`
--

DROP TABLE IF EXISTS `posts_imagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts_imagens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_posts` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_imagens_posts_id_fk` (`id_posts`),
  CONSTRAINT `posts_imagens_posts_id_fk` FOREIGN KEY (`id_posts`) REFERENCES `posts_content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_imagens`
--

LOCK TABLES `posts_imagens` WRITE;
/*!40000 ALTER TABLE `posts_imagens` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_imagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `full_name` varchar(256) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_dashboard`
--

DROP TABLE IF EXISTS `users_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_dashboard` (
  `id` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  KEY `users_dashboard_users_id_fk` (`id_user`),
  CONSTRAINT `users_dashboard_users_id_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_dashboard`
--

LOCK TABLES `users_dashboard` WRITE;
/*!40000 ALTER TABLE `users_dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_dashboard_coluna`
--

DROP TABLE IF EXISTS `users_dashboard_coluna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_dashboard_coluna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `nome` varchar(256) DEFAULT NULL,
  `tipo` enum('perfil','tag') DEFAULT NULL,
  `id_dashboard_deck` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_dashboard_coluna_users_id_fk` (`id_user`),
  KEY `users_dashboard_coluna_users_dashboard_deck_id_fk` (`id_dashboard_deck`),
  CONSTRAINT `users_dashboard_coluna_users_dashboard_deck_id_fk` FOREIGN KEY (`id_dashboard_deck`) REFERENCES `users_dashboard_deck` (`id`),
  CONSTRAINT `users_dashboard_coluna_users_id_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_dashboard_coluna`
--

LOCK TABLES `users_dashboard_coluna` WRITE;
/*!40000 ALTER TABLE `users_dashboard_coluna` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_dashboard_coluna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_dashboard_coluna_perfil`
--

DROP TABLE IF EXISTS `users_dashboard_coluna_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_dashboard_coluna_perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_coluna` int(11) DEFAULT NULL,
  `id_perfil` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_dashboard_deck_perfil_users_dashboard_coluna_id_fk` (`id_coluna`),
  CONSTRAINT `users_dashboard_deck_perfil_users_dashboard_coluna_id_fk` FOREIGN KEY (`id_coluna`) REFERENCES `users_dashboard_coluna` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_dashboard_coluna_perfil`
--

LOCK TABLES `users_dashboard_coluna_perfil` WRITE;
/*!40000 ALTER TABLE `users_dashboard_coluna_perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_dashboard_coluna_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_dashboard_coluna_tag`
--

DROP TABLE IF EXISTS `users_dashboard_coluna_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_dashboard_coluna_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_coluna` int(11) DEFAULT NULL,
  `tag` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_dashboard_coluna_tag_users_dashboard_coluna_id_fk` (`id_coluna`),
  CONSTRAINT `users_dashboard_coluna_tag_users_dashboard_coluna_id_fk` FOREIGN KEY (`id_coluna`) REFERENCES `users_dashboard_coluna` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_dashboard_coluna_tag`
--

LOCK TABLES `users_dashboard_coluna_tag` WRITE;
/*!40000 ALTER TABLE `users_dashboard_coluna_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_dashboard_coluna_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_dashboard_deck`
--

DROP TABLE IF EXISTS `users_dashboard_deck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_dashboard_deck` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_dashboard_deck_users_id_fk` (`id_user`),
  CONSTRAINT `users_dashboard_deck_users_id_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_dashboard_deck`
--

LOCK TABLES `users_dashboard_deck` WRITE;
/*!40000 ALTER TABLE `users_dashboard_deck` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_dashboard_deck` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-30 15:45:30
