USE `vk`;

DROP TABLE IF EXISTS `catalogs`;
CREATE TABLE `catalogs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор раздела',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Название раздела',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания раздела',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления раздела',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `unique_name` (`name`(10))
) COMMENT='Разделы интернет-магазина Мегафон';

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор товара',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Название товара',
  `description` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'Описание',
  `price` decimal(11,2) DEFAULT NULL COMMENT 'Цена',
  `catalog_id` int unsigned DEFAULT NULL  COMMENT 'Ссылка на раздел', -- тут будет внешний ключ
  `brand_id` int unsigned DEFAULT NULL  COMMENT 'Ссылка на бренд', -- тут будет внешний ключ
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания товара',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления товара',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
  KEY `index_of_catalog_catalog_id` (`catalog_id`),
  CONSTRAINT `fk_catalog_id` FOREIGN KEY (`catalog_id`) REFERENCES `catalogs` (`id`)
) COMMENT='Таблица товаров';

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор пользователя',
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя', -- тут будет внешний ключ
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания заказа',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления заказа',
  PRIMARY KEY (`id`)
) COMMENT='Заказы';