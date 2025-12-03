CREATE TABLE `user` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(255),
  `password` varchar(255),
  `firstname` varchar(255),
  `lastname` varchar(255),
  `role` varchar(255)
);

CREATE TABLE `category` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(255)
);

CREATE TABLE `post` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(255),
  `content` text,
  `category_id` int,
  `author_id` int,
  `created_at` datetime,
  `updated_at` datetime,
  `image` varchar(255),
  `visited_count` int
);

CREATE TABLE `tag` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `post_tag` (
  `post_id` int,
  `tag_id` int
);

ALTER TABLE `post` ADD FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

ALTER TABLE `post` ADD FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);

ALTER TABLE `post_tag` ADD FOREIGN KEY (`post_id`) REFERENCES `post` (`id`);

ALTER TABLE `post_tag` ADD FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`);
