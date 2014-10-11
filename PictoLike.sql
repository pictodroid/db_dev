-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 11, 2014 at 06:31 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `PictoLike`
--

-- --------------------------------------------------------

--
-- Table structure for table `Picto`
--

CREATE TABLE IF NOT EXISTS `Picto` (
  `username` varchar(20) DEFAULT NULL,
  `filename` varchar(20) DEFAULT NULL,
  `datecreated` varchar(20) DEFAULT NULL,
  `locationcreated` varchar(20) DEFAULT NULL,
  `noOfLikes` int(30) unsigned DEFAULT NULL,
  `noOfViews` int(30) unsigned DEFAULT NULL,
  `imageobj` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Picto`
--

INSERT INTO `Picto` (`username`, `filename`, `datecreated`, `locationcreated`, `noOfLikes`, `noOfViews`, `imageobj`) VALUES
('arslanshl@gmail.com', 'hello.php', NULL, NULL, NULL, NULL, ''),
('', '', NULL, NULL, NULL, NULL, ''),
('', '', NULL, NULL, NULL, NULL, ''),
('test1', '20140701_202009', '', '', NULL, NULL, ''),
('test1', '20140701_204651', '', '', NULL, NULL, ''),
('test1', '20140701_205622', '', '', NULL, NULL, ''),
('test1', '20140701_210424', '', '', NULL, NULL, ''),
('test1', '20140701_211049', '', '', NULL, NULL, ''),
('test1', '20140701_212039', '', '', NULL, NULL, ''),
('test1', '20140701_213506', '', '', NULL, NULL, ''),
('test1', '20140701_213819', '', '', NULL, NULL, ''),
('test1', '20140701_214352', '', '', NULL, NULL, ''),
('test1', '20140701_215714', '', '', NULL, NULL, ''),
('test1', '20140701_220038', '', '', NULL, NULL, ''),
('test1', '20140701_220657', '', '', NULL, NULL, ''),
('test1', '20140701_132836', '', '', NULL, NULL, ''),
('test1', '20140701_132841', '', '', NULL, NULL, ''),
('test1', '20140701_133013', '', '', NULL, NULL, ''),
('test1', '20140701_133019', '', '', NULL, NULL, ''),
('test1', '20140701_133629', '', '', NULL, NULL, ''),
('test1', '20140701_133639', '', '', NULL, NULL, ''),
('test1', '20140701_133643', '', '', NULL, NULL, ''),
('test1', '20140701_133810', '', '', NULL, NULL, ''),
('test1', '20140702_071117', '', '', NULL, NULL, ''),
('test1', '20140702_071123', '', '', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `username` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`username`, `email`, `password`, `birthday`, `gender`) VALUES
('[test1]', '[test@ps.edu]', '[test1]', '0000-00-00', ''),
('test1', 'test@ps.edu', 'test1', '0000-00-00', ''),
('', 'arslanshl@gmail.com', 'aaaa', '0000-00-00', ''),
('blue345', 'are@a.com', 'aaaa', '0000-00-00', ''),
('test1', '20140701_201330', '', '0000-00-00', ''),
('hoofar', 'hpourzand@gmail.com', '1000', '0000-00-00', ''),
('okroneone', 'okroneone', 'okrone', '0000-00-00', ''),
('testyt', 'testyt', 'tewtttay', '0000-00-00', ''),
('testfinal', 'testfinal', 'testfinal', '0000-00-00', '11111111'),
('test2', 'test2', 'test2', '0000-00-00', '080081999'),
('test3', 'test3', 'test3', '0000-00-00', '11111111'),
('sfdsadfs', 'sfdsadfs', 'fsf', '0000-00-00', 'dfdf'),
('sdsd', 'sdsd', 'sdsdsd', '0000-00-00', 'sdds'),
('hpourzand@gmail.com', 'hpourzand@gmail.com', 'hoofar', '0000-00-00', 'hoofar'),
('jjwjw', 'jjwjw', 'jjjww', '0000-00-00', ''),
('test9', 'test9', 'test9', '0000-00-00', '16 / 2 / 1986');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
