CREATE DATABASE IF NOT EXISTS chat;

USE chat;

-- ---
-- Globals
-- ---
-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;
-- ---
-- Table 'user'
-- 
-- ---
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `user`;
SET FOREIGN_KEY_CHECKS = 1;
        
CREATE TABLE `user` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(20) NOT NULL,
  `currentRoomId` INTEGER NOT NULL,
  PRIMARY KEY (`id`)
);
-- ---
-- Table 'room'
-- 
-- ---
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `room`;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `room` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(15) NOT NULL,
  `createdById` INTEGER NOT NULL,
  `createdAt` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`)
);
-- ---
-- Table 'messages'
-- 
-- ---
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `messages`;
SET FOREIGN_KEY_CHECKS = 1;
        
CREATE TABLE `messages` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `text` MEDIUMTEXT NOT NULL,
  `createdById` INTEGER NOT NULL,
  `roomId` INTEGER NOT NULL,
  `createdAt` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`)
);
-- ---
-- Table 'user/user'
-- 
-- ---
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `userUser`;
SET FOREIGN_KEY_CHECKS = 1;
        
CREATE TABLE `userUser` (
  `userId` INTEGER NOT NULL,
  `friendId` INTEGER NOT NULL
);
-- ---
-- Table 'users and rooms'
-- 
-- ---
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `usersAndRooms`;
SET FOREIGN_KEY_CHECKS = 1;
        
CREATE TABLE `usersAndRooms` (
  `userId` INTEGER NOT NULL,
  `roomId` INTEGER NOT NULL,
  PRIMARY KEY (`userId`)
);
-- ---
-- Foreign Keys 
-- ---
ALTER TABLE `room` ADD FOREIGN KEY (createdById) REFERENCES `user` (`id`);
ALTER TABLE `messages` ADD FOREIGN KEY (createdById) REFERENCES `user` (`id`);
ALTER TABLE `messages` ADD FOREIGN KEY (roomId) REFERENCES `room` (`id`);
ALTER TABLE `userUser` ADD FOREIGN KEY (userId) REFERENCES `user` (`id`);
ALTER TABLE `userUser` ADD FOREIGN KEY (friendId) REFERENCES `user` (`id`);
ALTER TABLE `usersAndRooms` ADD FOREIGN KEY (userId) REFERENCES `user` (`id`);
ALTER TABLE `usersAndRooms` ADD FOREIGN KEY (roomId) REFERENCES `room` (`id`);
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
INSERT INTO `user` (`id`,`username`,`currentRoomId`) VALUES
('','','');
INSERT INTO `room` (`id`,`name `,`createdById`,`createdAt`) VALUES
('','','','');
INSERT INTO `messages` (`id`,`text`,`createdById`,`roomId`,`createdAt`) VALUES
('','','','','');
INSERT INTO `user/user` (`userId`,`friendId`) VALUES
('','');
INSERT INTO `users and rooms` (`userId`,`roomId`) VALUES
('','');

INSERT INTO `user` (`username`,`currentRoomId`) VALUES
('benny','2');
INSERT INTO `room` (`name`,`createdById`,`createdAt`) VALUES
('blah','2','2018-04-03 12:12:12');
INSERT INTO `messages` (`text`,`createdById`,`roomId`,`createdAt`) VALUES
('','','','','');
INSERT INTO `user/user` (`userId`,`friendId`) VALUES
('','');
INSERT INTO `users and rooms` (`userId`,`roomId`) VALUES
('','');



/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

