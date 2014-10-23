--
-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 6.2.280.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 23.10.2014 4:14:48
-- Версия сервера: 5.7.4-m14-log
-- Версия клиента: 4.1
--


-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

--
-- Описание для таблицы camera
--
DROP TABLE IF EXISTS camera;
CREATE TABLE camera (
  username_id BIGINT(20) NOT NULL AUTO_INCREMENT,
  device_id VARCHAR(45) DEFAULT NULL,
  imgusrtaken VARCHAR(45) DEFAULT NULL,
  imgdateupload VARCHAR(50) DEFAULT NULL,
  pictoactive TINYINT(1) NOT NULL DEFAULT 1,
  imglocation DATETIME DEFAULT NULL,
  imagefirstname TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  img221b VARCHAR(45) DEFAULT NULL,
  imgusrage DATE DEFAULT NULL,
  imgusrgender INT(11) DEFAULT NULL,
  PRIMARY KEY (username_id),
  INDEX IDX_camera_deviceid (device_id),
  UNIQUE INDEX UK_camera_username_id (username_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы city
--
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

--
-- Описание для таблицы location
--
DROP TABLE IF EXISTS location;
CREATE TABLE location (
  staff_id BIGINT(20) NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) DEFAULT NULL,
  last_name VARCHAR(50) DEFAULT NULL,
  address_id BIGINT(20) DEFAULT NULL,
  picture LONGBLOB DEFAULT NULL,
  email VARCHAR(50) DEFAULT NULL,
  store_id BIGINT(20) DEFAULT NULL,
  active TINYINT(1) DEFAULT NULL,
  username VARCHAR(255) DEFAULT NULL,
  password VARCHAR(255) DEFAULT NULL,
  last_update TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (staff_id),
  INDEX IDX_location_active (active),
  INDEX IDX_location_address_id (address_id),
  INDEX IDX_location_email (email),
  INDEX IDX_location_first_name (first_name),
  INDEX IDX_location_last_name (last_name),
  INDEX IDX_location_last_update (last_update),
  INDEX IDX_location_password (password),
  INDEX IDX_location_store_id (store_id),
  INDEX IDX_location_username (username),
  UNIQUE INDEX UK_location_staff_id (staff_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы picto_category
--
DROP TABLE IF EXISTS picto_category;
CREATE TABLE picto_category (
  id INT(11) NOT NULL AUTO_INCREMENT,
  picto_id BIGINT(20) DEFAULT NULL,
  pictocategory VARCHAR(45) DEFAULT NULL,
  last_update TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX IDX_picto_category_last_update (last_update),
  INDEX IDX_picto_category_picto_id (picto_id),
  INDEX IDX_picto_category_pictocategory (pictocategory),
  UNIQUE INDEX UK_picto_category_id (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы picto_d0
--
DROP TABLE IF EXISTS picto_d0;
CREATE TABLE picto_d0 (
  imgname VARCHAR(255) DEFAULT NULL,
  imgnlikes INT(11) DEFAULT NULL,
  imgnviews VARCHAR(255) DEFAULT NULL,
  imgnsaves VARCHAR(255) DEFAULT NULL,
  imgnreported VARCHAR(255) DEFAULT NULL,
  imgreported_status VARCHAR(255) DEFAULT NULL,
  imageobj LONGBLOB DEFAULT NULL,
  INDEX IDX_picto_d0_imgname (imgname),
  INDEX IDX_picto_d0_imgnlikes (imgnlikes),
  INDEX IDX_picto_d0_imgnreported (imgnreported),
  INDEX IDX_picto_d0_imgnsaves (imgnsaves),
  INDEX IDX_picto_d0_imgnviews (imgnviews),
  INDEX IDX_picto_d0_imgreported_status (imgreported_status)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы picto_pcu
--
DROP TABLE IF EXISTS picto_pcu;
CREATE TABLE picto_pcu (
  picto_id BIGINT(20) NOT NULL AUTO_INCREMENT,
  imageobj LONGBLOB DEFAULT NULL,
  img221b TEXT DEFAULT NULL,
  imgnlikes YEAR(4) DEFAULT NULL,
  imgnviews TINYINT(4) DEFAULT NULL,
  imgnsaves TINYINT(4) DEFAULT NULL,
  imgnskips SMALLINT(6) DEFAULT NULL,
  imgnreported INT(11) DEFAULT NULL,
  imgreportedstatus VARCHAR(255) DEFAULT NULL,
  last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (picto_id),
  FULLTEXT INDEX IDX_picto_pcu_img221b (img221b),
  INDEX IDX_picto_pcu_last_update (last_update),
  UNIQUE INDEX UK_picto_pcu_picto_id (picto_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы picto_stream
--
DROP TABLE IF EXISTS picto_stream;
CREATE TABLE picto_stream (
  stream_id BIGINT(20) NOT NULL AUTO_INCREMENT,
  imgname VARCHAR(255) DEFAULT NULL,
  imgnlikes VARCHAR(255) DEFAULT NULL,
  imageobj LONGBLOB DEFAULT NULL,
  PRIMARY KEY (stream_id),
  INDEX IDX_picto_stream_imgname (imgname),
  INDEX IDX_picto_stream_imgnlikes (imgnlikes),
  UNIQUE INDEX UK_picto_stream_stream_id (stream_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы university
--
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

--
-- Описание для таблицы user
--
DROP TABLE IF EXISTS user;
CREATE TABLE user (
  username_id BIGINT(20) NOT NULL AUTO_INCREMENT,
  username VARCHAR(255) DEFAULT NULL,
  password VARCHAR(45) DEFAULT NULL,
  email VARCHAR(45) DEFAULT NULL,
  verifed TINYINT(1) NOT NULL DEFAULT 0,
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
  verified_status TINYINT(1) DEFAULT NULL,
  verifed_code VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (username_id),
  INDEX IDX_user_email (email),
  INDEX IDX_user_username (username),
  UNIQUE INDEX UK_user_username_id (username_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы usr_home
--
DROP TABLE IF EXISTS usr_home;
CREATE TABLE usr_home (
  id BIGINT(20) NOT NULL AUTO_INCREMENT,
  username_id BIGINT(20) DEFAULT NULL,
  user221B VARCHAR(255) DEFAULT NULL,
  actionswipe VARCHAR(255) DEFAULT NULL,
  imgshield VARCHAR(255) DEFAULT NULL,
  device_id INT(11) DEFAULT NULL,
  last_update TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX IDX_usr_home_device_id (device_id),
  INDEX IDX_usr_home_last_update (last_update),
  FULLTEXT INDEX IDX_usr_home_user221B (user221B),
  INDEX IDX_usr_home_username_id (username_id),
  UNIQUE INDEX UK_usr_home_id (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы usrprofile
--
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

--
-- Описание для таблицы usrsaved
--
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

-- 
-- Вывод данных для таблицы camera
--

-- Таблица pictolikeii.camera не содержит данных

-- 
-- Вывод данных для таблицы city
--

-- Таблица pictolikeii.city не содержит данных

-- 
-- Вывод данных для таблицы location
--

-- Таблица pictolikeii.location не содержит данных

-- 
-- Вывод данных для таблицы picto_category
--

-- Таблица pictolikeii.picto_category не содержит данных

-- 
-- Вывод данных для таблицы picto_d0
--

-- Таблица pictolikeii.picto_d0 не содержит данных

-- 
-- Вывод данных для таблицы picto_pcu
--

-- Таблица pictolikeii.picto_pcu не содержит данных

-- 
-- Вывод данных для таблицы picto_stream
--

-- Таблица pictolikeii.picto_stream не содержит данных

-- 
-- Вывод данных для таблицы university
--

-- Таблица pictolikeii.university не содержит данных

-- 
-- Вывод данных для таблицы user
--
INSERT INTO user VALUES
(3, 'hoofar', '123', 'hpourzand@gmail.com', 1, '2014-10-22 12:33:51', '2014-10-22 16:33:24', NULL, '1981-10-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');

-- 
-- Вывод данных для таблицы usr_home
--

-- Таблица pictolikeii.usr_home не содержит данных

-- 
-- Вывод данных для таблицы usrprofile
--

-- Таблица pictolikeii.usrprofile не содержит данных

-- 
-- Вывод данных для таблицы usrsaved
--

-- Таблица pictolikeii.usrsaved не содержит данных


-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;