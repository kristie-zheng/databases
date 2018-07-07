CREATE DATABASE IF NOT EXISTS chat;

USE chat;

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  /* Describe your table here.*/
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `text` MEDIUMTEXT NOT NULL,
  `created by id` INTEGER NOT NULL,
  `room id` INTEGER NOT NULL,
  `timestamp` TIMESTAMP NOT NULL,
   PRIMARY KEY (`id`)
);

/* Create other tables and define schemas for them here! */
-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'user'
-- 
-- ---
SET foreign_key_checks = 0;
DROP TABLE `user`;
SET foreign_key_checks = 1;

DROP TABLE IF EXISTS `user`;
    
CREATE TABLE `user` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(20) NOT NULL,
  `current room id` INTEGER NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'room'
-- 
-- ---

DROP TABLE IF EXISTS `room`;
    
CREATE TABLE `room` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(15) NOT NULL,
  `created by id` INTEGER NOT NULL,
  `created at` TIMESTAMP NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'user/user'ß
-- 
-- ---

DROP TABLE IF EXISTS `user/user`;
    
CREATE TABLE `user/user` (
  `user id` INT NOT NULL,
  `friend id` INT(20) NOT NULL,
  PRIMARY KEY (`user id`)
);

-- ---
-- Table 'users and rooms'
-- 
-- ---

DROP TABLE IF EXISTS `users and rooms`;
    
CREATE TABLE `users and rooms` (
  `user id` INTEGER NOT NULL,
  `room id` INTEGER NOT NULL,
  PRIMARY KEY (`user id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `room` ADD FOREIGN KEY (`created by id`) REFERENCES `user` (`id`);
ALTER TABLE `messages` ADD FOREIGN KEY (`created by id`) REFERENCES `user` (`id`);
ALTER TABLE `messages` ADD FOREIGN KEY (`room id`) REFERENCES `room` (`id`);
ALTER TABLE `user/user` ADD FOREIGN KEY (`user id`) REFERENCES `user` (`id`);
ALTER TABLE `user/user` ADD FOREIGN KEY (`friend id`) REFERENCES `user` (`id`);
ALTER TABLE `users and rooms` ADD FOREIGN KEY (`user id`) REFERENCES `user` (`id`);
ALTER TABLE `users and rooms` ADD FOREIGN KEY (`room id`) REFERENCES `room` (`id`);




-- ---
-- Table Properties
-- ---

-- ALTER TABLE `user` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `room` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `messages` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `user/user` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `users and rooms` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `user` (`id`,`username`,`current room`) VALUES
-- ('','','');
-- INSERT INTO `room` (`id`,`name `,`created by`,`created at`) VALUES
-- ('','','','');
-- INSERT INTO `messages` (`id`,`text`,`created by`,`room id`,`timestamp`) VALUES
-- ('','','','','');
-- INSERT INTO `user/user` (`user id`,`friend id`) VALUES
-- ('','');
-- INSERT INTO `users and rooms` (`user id`,`room id`) VALUES
-- ('','');



/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

