--
-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 6.2.280.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 18.10.2014 3:15:30
-- Версия сервера: 5.7.4-m14-log
-- Версия клиента: 4.1
--


/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

SET NAMES 'utf8';

DROP TABLE IF EXISTS camera;
CREATE TABLE camera (
  username_id BIGINT(20) NOT NULL AUTO_INCREMENT,
  deviceid VARCHAR(45) DEFAULT NULL,
  imgusrtaken VARCHAR(45) DEFAULT NULL,
  imgdateupload VARCHAR(50) DEFAULT NULL,
  pictoactive TINYINT(1) NOT NULL DEFAULT 1,
  imglocation DATETIME DEFAULT NULL,
  imagefirstname TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  img221b VARCHAR(45) DEFAULT NULL,
  imgusrage DATE DEFAULT NULL,
  imgusrgender INT(11) DEFAULT NULL,
  PRIMARY KEY (username_id),
  INDEX IDX_camera_deviceid (deviceid),
  UNIQUE INDEX UK_camera_username_id (username_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

DROP TABLE IF EXISTS city;
CREATE TABLE city (
  city_id BIGINT(20) NOT NULL AUTO_INCREMENT,
  city VARCHAR(255) DEFAULT NULL,
  university_id BIGINT(20) DEFAULT NULL,
  last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (city_id),
  INDEX IDX_city_city (city),
  INDEX IDX_city_country_id (university_id),
  INDEX IDX_city_last_update (last_update),
  UNIQUE INDEX UK_city_city_id (city_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

DROP TABLE IF EXISTS university;
CREATE TABLE university (
  university_id BIGINT(20) NOT NULL AUTO_INCREMENT,
  univeristy VARCHAR(255) DEFAULT NULL,
  last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (university_id),
  INDEX IDX_university_last_update (last_update),
  INDEX IDX_university_univeristy (univeristy),
  UNIQUE INDEX UK_university_university_id (university_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

DROP TABLE IF EXISTS user;
CREATE TABLE user (
  username_id BIGINT(20) NOT NULL AUTO_INCREMENT,
  username VARCHAR(255) DEFAULT NULL,
  password VARCHAR(45) DEFAULT NULL,
  email VARCHAR(45) DEFAULT NULL,
  verifed TINYINT(1) NOT NULL DEFAULT 1,
  create_date DATETIME DEFAULT NULL,
  last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  deviceid VARCHAR(45) DEFAULT NULL,
  birthday DATE DEFAULT NULL,
  gender INT(11) DEFAULT NULL,
  primaryemail VARCHAR(45) DEFAULT NULL,
  secondaryemail VARCHAR(45) DEFAULT NULL,
  datejoined VARCHAR(45) DEFAULT NULL,
  usrschool VARCHAR(45) DEFAULT NULL,
  usrphos VARCHAR(45) DEFAULT NULL,
  usrphmodel VARCHAR(45) DEFAULT NULL,
  usrphversion VARCHAR(45) DEFAULT NULL,
  usrage INT(11) DEFAULT NULL,
  dob_year INT(11) DEFAULT NULL,
  dob_month INT(11) DEFAULT NULL,
  dob_day INT(11) DEFAULT NULL,
  verifiedStatus TINYINT(1) DEFAULT NULL,
  PRIMARY KEY (username_id),
  INDEX IDX_user_email (email),
  INDEX IDX_user_username (username),
  UNIQUE INDEX UK_user_username_id (username_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

DROP TABLE IF EXISTS usrprofile;
CREATE TABLE usrprofile (
  usrname_id BIGINT(20) NOT NULL AUTO_INCREMENT,
  imgname VARCHAR(50) DEFAULT NULL,
  imgnlikes TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  imgnlocation VARCHAR(45) DEFAULT NULL,
  imageobj LONGBLOB DEFAULT NULL,
  PRIMARY KEY (usrname_id),
  INDEX IDX_usrprofile_imgname (imgname),
  UNIQUE INDEX UK_usrprofile_usrname_id (usrname_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

DROP TABLE IF EXISTS usrsaved;
CREATE TABLE usrsaved (
  username_id BIGINT(20) NOT NULL AUTO_INCREMENT,
  imgname VARCHAR(50) DEFAULT NULL,
  imgnlike TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  imglocation VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (username_id),
  INDEX IDX_usrsaved_imglocation (imglocation),
  INDEX IDX_usrsaved_imgname (imgname),
  INDEX IDX_usrsaved_imgnlike (imgnlike),
  UNIQUE INDEX UK_usrsaved_username_id (username_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;


-- Таблица pictolikeii.camera не содержит данных


-- Таблица pictolikeii.city не содержит данных


-- Таблица pictolikeii.university не содержит данных


-- Таблица pictolikeii.user не содержит данных


-- Таблица pictolikeii.usrprofile не содержит данных


-- Таблица pictolikeii.usrsaved не содержит данных

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;