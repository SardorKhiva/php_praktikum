DROP DATABASE IF EXISTS `news`;

CREATE
    DATABASE IF NOT EXISTS `news`;

USE `news`;

CREATE TABLE IF NOT EXISTS `user`
(
    `id`        int PRIMARY KEY AUTO_INCREMENT,
    `username`  varchar(255),
    `password`  varchar(255),
    `firstname` varchar(255),
    `lastname`  varchar(255),
    `role`      varchar(255)
);

# RENAME TABLE `user` TO `users`;

CREATE TABLE `category`
(
    `id`    int PRIMARY KEY AUTO_INCREMENT,
    `title` varchar(255)
);

CREATE TABLE `post`
(
    `id`            int PRIMARY KEY AUTO_INCREMENT,
    `title`         varchar(255),
    `content`       text,
    `category_id`   int,
    `author_id`     int,
    `created_at`    datetime,
    `updated_at`    datetime,
    `image`         varchar(255),
    `visited_count` int,
    FOREIGN KEY (`category_id`)
        REFERENCES `category` (`id`),
    FOREIGN KEY (`author_id`)
        REFERENCES `user` (`id`)
);

CREATE TABLE `tag`
(
    `id`   int PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(255)
);

CREATE TABLE `post_tag`
(
    `post_id` int,
    `tag_id`  int,
    FOREIGN KEY (`post_id`)
        REFERENCES `post` (`id`),
    FOREIGN KEY (`tag_id`)
        REFERENCES `tag` (`id`)
);