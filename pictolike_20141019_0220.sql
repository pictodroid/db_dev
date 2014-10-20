--
-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 6.2.280.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 19.10.2014 2:20:24
-- Версия сервера: 5.7.4-m14-log
-- Версия клиента: 4.1
--


/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

SET NAMES 'utf8';

DROP TABLE IF EXISTS picto;
CREATE TABLE picto (
  username VARCHAR(20) DEFAULT NULL,
  filename VARCHAR(20) DEFAULT NULL,
  datecreated VARCHAR(20) DEFAULT NULL,
  locationcreated VARCHAR(20) DEFAULT NULL,
  nooflikes INT(30) UNSIGNED DEFAULT NULL,
  noofviews INT(30) UNSIGNED DEFAULT NULL,
  imageobj LONGBLOB NOT NULL
)
ENGINE = INNODB
AVG_ROW_LENGTH = 655
CHARACTER SET utf8
COLLATE utf8_general_ci;

DROP TABLE IF EXISTS user;
CREATE TABLE user (
  username VARCHAR(20) DEFAULT NULL,
  email VARCHAR(20) DEFAULT NULL,
  password VARCHAR(20) DEFAULT NULL,
  birthday DATE DEFAULT NULL,
  gender VARCHAR(32) DEFAULT NULL
)
ENGINE = INNODB
AVG_ROW_LENGTH = 1024
CHARACTER SET utf8
COLLATE utf8_general_ci;

INSERT INTO picto VALUES
('arslanshl@gmail.com', 'hello.php', NULL, NULL, NULL, NULL, x''),
('', '', NULL, NULL, NULL, NULL, x''),
('', '', NULL, NULL, NULL, NULL, x''),
('test1', '20140701_202009', '', '', NULL, NULL, x''),
('test1', '20140701_204651', '', '', NULL, NULL, x''),
('test1', '20140701_205622', '', '', NULL, NULL, x''),
('test1', '20140701_210424', '', '', NULL, NULL, x''),
('test1', '20140701_211049', '', '', NULL, NULL, x''),
('test1', '20140701_212039', '', '', NULL, NULL, x''),
('test1', '20140701_213506', '', '', NULL, NULL, x''),
('test1', '20140701_213819', '', '', NULL, NULL, x''),
('test1', '20140701_214352', '', '', NULL, NULL, x''),
('test1', '20140701_215714', '', '', NULL, NULL, x''),
('test1', '20140701_220038', '', '', NULL, NULL, x''),
('test1', '20140701_220657', '', '', NULL, NULL, x''),
('test1', '20140701_132836', '', '', NULL, NULL, x''),
('test1', '20140701_132841', '', '', NULL, NULL, x''),
('test1', '20140701_133013', '', '', NULL, NULL, x''),
('test1', '20140701_133019', '', '', NULL, NULL, x''),
('test1', '20140701_133629', '', '', NULL, NULL, x''),
('test1', '20140701_133639', '', '', NULL, NULL, x''),
('test1', '20140701_133643', '', '', NULL, NULL, x''),
('test1', '20140701_133810', '', '', NULL, NULL, x''),
('test1', '20140702_071117', '', '', NULL, NULL, x''),
('test1', '20140702_071123', '', '', NULL, NULL, x'');

INSERT INTO user VALUES
('[test1]', '[test@ps.edu]', '[test1]', NULL, ''),
('test1', 'test@ps.edu', 'test1', NULL, ''),
('', 'arslanshl@gmail.com', 'aaaa', NULL, ''),
('blue345', 'are@a.com', 'aaaa', NULL, ''),
('test1', '20140701_201330', '', NULL, ''),
('hoofar', 'hpourzand@gmail.com', '1000', NULL, ''),
('okroneone', 'okroneone', 'okrone', NULL, ''),
('testyt', 'testyt', 'tewtttay', NULL, ''),
('testfinal', 'testfinal', 'testfinal', NULL, '11111111'),
('test2', 'test2', 'test2', NULL, '080081999'),
('test3', 'test3', 'test3', NULL, '11111111'),
('sfdsadfs', 'sfdsadfs', 'fsf', NULL, 'dfdf'),
('sdsd', 'sdsd', 'sdsdsd', NULL, 'sdds'),
('hpourzand@gmail.com', 'hpourzand@gmail.com', 'hoofar', NULL, 'hoofar'),
('jjwjw', 'jjwjw', 'jjjww', NULL, ''),
('test9', 'test9', 'test9', NULL, '16 / 2 / 1986');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;