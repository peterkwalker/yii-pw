-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 31, 2018 at 04:38 PM
-- Server version: 5.7.21
-- PHP Version: 7.0.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yiipw`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(40) NOT NULL,
  PRIMARY KEY (`groupid`),
  UNIQUE KEY `groupname` (`groupname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`groupid`, `groupname`) VALUES
(2, 'Kevan\'s group'),
(1, 'Pete\'s group');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
CREATE TABLE IF NOT EXISTS `subscribers` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `groupid` int(11) NOT NULL,
  `town` varchar(50) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `groupid` (`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`userid`, `username`, `groupid`, `town`) VALUES
(1, 'Peter', 1, 'Bolton'),
(2, 'Bob', 1, 'Manchester'),
(3, 'Kevan', 1, 'kjh h'),
(4, 'cdxdxc', 2, 'xvxvxcv'),
(5, 'dsfssdf', 1, 'fsdfdsf'),
(6, 'kjhjh', 2, 'jkjlkjl'),
(7, '566575', 2, '567657');

-- --------------------------------------------------------

--
-- Stand-in structure for view `viewsubscribers`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `viewsubscribers`;
CREATE TABLE IF NOT EXISTS `viewsubscribers` (
`userid` int(11)
,`username` varchar(50)
,`groupid` int(11)
,`town` varchar(50)
,`groupname` varchar(40)
);

-- --------------------------------------------------------

--
-- Structure for view `viewsubscribers`
--
DROP TABLE IF EXISTS `viewsubscribers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewsubscribers`  AS  select `subscribers`.`userid` AS `userid`,`subscribers`.`username` AS `username`,`subscribers`.`groupid` AS `groupid`,`subscribers`.`town` AS `town`,`groups`.`groupname` AS `groupname` from (`groups` join `subscribers` on((`subscribers`.`groupid` = `groups`.`groupid`))) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD CONSTRAINT `subscribers_ibfk_1` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
