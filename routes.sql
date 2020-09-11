-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: localhost    Database: cms
-- ------------------------------------------------------
-- Server version	8.0.21-0ubuntu0.20.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `route` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `controller` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'main',
  `methods` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '["GET"]',
  `headers` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int unsigned NOT NULL DEFAULT '0',
  `sorting` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `route_UNIQUE` (`route`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (1,'/','App\\Controller\\PageController','home','[\"GET\"]',NULL,'Главная страница',1,0),(2,'/(?<category_url>[0-9a-z-]{2,})/(?<subcategory_url>[0-9a-z-]{2,})','App\\Controller\\PageController','games','[\"GET\"]',NULL,'Вывод списка статей подкатегорий',1,0),(3,'/contacts','App\\Controller\\PageController','contacts','[\"GET\"]',NULL,'Страница контактов',1,0),(4,'/(?<category_url>[0-9a-z-]{2,})/(?<subcategory_url>[0-9a-z-]{2,})/(?<article_url>[0-9a-z-]{2,})','App\\Controller\\PageController','article','[\"GET\"]',NULL,'Вывод статьи полностью определенной категории',1,0),(5,'/sitemap.xml','App\\Controller\\SitemapController','main','[\"GET\"]',NULL,'Генерация данных sitemap.xml',1,0),(6,'/user/registration/confirm/email/(?<token>[0-9a-z]{40})','App\\Controller\\UserController','registrationConfirmEmail','[\"GET\"]',NULL,'Подтверждение email после регистрации пользователя',1,0),(7,'/ajax/user/login','App\\Controller\\Ajax\\UserController','login','[\"POST\"]','{\"X-Requested-With\":\"XMLHttpRequest\"}','Авторизация на сайте',1,0),(8,'/ajax/user/logout','App\\Controller\\Ajax\\UserController','logout','[\"POST\"]','{\"X-Requested-With\":\"XMLHttpRequest\"}','Завершение сессии пользователя',1,0),(9,'/ajax/user/registration','App\\Controller\\Ajax\\UserController','registration','[\"POST\"]','{\"X-Requested-With\":\"XMLHttpRequest\"}','Регистрация на сайте',1,0),(10,'/ajax/user/contacting-technical-support','App\\Controller\\Ajax\\UserController','contactingTechnicalSupport','[\"POST\"]','{\"X-Requested-With\":\"XMLHttpRequest\"}','Обращение в службу поддержки',1,0),(11,'/ajax/articles/like','App\\Controller\\Ajax\\ArticlesController','like','[\"POST\"]','{\"X-Requested-With\":\"XMLHttpRequest\"}','Лайки в статье',1,0),(12,'/ajax/articles/add-to-favourites','App\\Controller\\Ajax\\ArticlesController','addToFavourites','[\"POST\"]','{\"X-Requested-With\":\"XMLHttpRequest\",\"Token\":\"*\"}','Добавление статьи в избранное',1,0);
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cms'
--

--
-- Dumping routines for database 'cms'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-11 15:09:41
