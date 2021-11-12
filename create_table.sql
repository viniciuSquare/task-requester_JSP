CREATE TABLE `tasks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject` varchar(150) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `category` varchar(25) DEFAULT NULL,
  `executor` varchar(30) DEFAULT NULL,
  `state` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci