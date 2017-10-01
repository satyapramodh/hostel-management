-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2013 at 07:06 PM
-- Server version: 5.5.16
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vit`
--

-- --------------------------------------------------------

--
-- Table structure for table `1bed`
--

CREATE TABLE IF NOT EXISTS `1bed` (
  `room` varchar(5) NOT NULL,
  `block` varchar(3) NOT NULL,
  `bed1` varchar(10) NOT NULL,
  `ac` tinyint(4) NOT NULL,
  `flag1` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`room`,`block`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `1bed`
--

INSERT INTO `1bed` (`room`, `block`, `bed1`, `ac`, `flag1`) VALUES
('201', 'd', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `2bed`
--

CREATE TABLE IF NOT EXISTS `2bed` (
  `room` varchar(5) NOT NULL,
  `block` varchar(3) NOT NULL,
  `bed1` varchar(10) NOT NULL,
  `bed2` varchar(10) NOT NULL,
  `ac` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '2',
  PRIMARY KEY (`room`,`block`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `2bed`
--

INSERT INTO `2bed` (`room`, `block`, `bed1`, `bed2`, `ac`, `flag`) VALUES
('101', 'd', '', '', 0, 2),
('102', 'd', '', '', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `3bed`
--

CREATE TABLE IF NOT EXISTS `3bed` (
  `room` varchar(5) NOT NULL,
  `block` varchar(3) NOT NULL,
  `bed1` varchar(10) NOT NULL,
  `bed2` varchar(10) NOT NULL,
  `bed3` varchar(10) NOT NULL,
  `ac` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '3',
  PRIMARY KEY (`room`,`block`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `3bed`
--

INSERT INTO `3bed` (`room`, `block`, `bed1`, `bed2`, `bed3`, `ac`, `flag`) VALUES
('101', 'b', '', '', '', 1, 3),
('102', 'b', '', '', '', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `4bed`
--

CREATE TABLE IF NOT EXISTS `4bed` (
  `room` varchar(5) NOT NULL,
  `block` varchar(3) NOT NULL,
  `bed1` varchar(10) NOT NULL,
  `bed2` varchar(10) NOT NULL,
  `bed3` varchar(10) NOT NULL,
  `bed4` varchar(10) NOT NULL,
  `ac` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '4',
  PRIMARY KEY (`room`,`block`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `4bed`
--

INSERT INTO `4bed` (`room`, `block`, `bed1`, `bed2`, `bed3`, `bed4`, `ac`, `flag`) VALUES
('504', 'l', '', '', '', '', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `6bed`
--

CREATE TABLE IF NOT EXISTS `6bed` (
  `room` varchar(5) NOT NULL,
  `block` varchar(3) NOT NULL,
  `bed1` varchar(10) NOT NULL,
  `bed2` varchar(10) NOT NULL,
  `bed3` varchar(10) NOT NULL,
  `bed4` varchar(10) NOT NULL,
  `bed5` varchar(10) NOT NULL,
  `bed6` varchar(10) NOT NULL,
  `ac` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '6',
  PRIMARY KEY (`room`,`block`),
  UNIQUE KEY `bed1` (`bed1`,`bed2`,`bed3`,`bed4`,`bed5`,`bed6`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `6bed`
--

INSERT INTO `6bed` (`room`, `block`, `bed1`, `bed2`, `bed3`, `bed4`, `bed5`, `bed6`, `ac`, `flag`) VALUES
('408', 'k', '', '', '', '', '', '', 1, 6);

-- --------------------------------------------------------

--
-- Stand-in structure for view `block`
--
CREATE TABLE IF NOT EXISTS `block` (
`1bed` decimal(25,0)
);
-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `username` varchar(20) NOT NULL,
  `publickey` varchar(20) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `publickey`) VALUES
('10bce000', '123'),
('a', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE IF NOT EXISTS `registration` (
  `receipt_num` int(11) NOT NULL,
  `id` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `paid` int(7) NOT NULL,
  `sem` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `receipt_num` (`receipt_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `id` varchar(10) NOT NULL,
  `name` varchar(40) NOT NULL,
  `room` varchar(5) NOT NULL,
  `block` varchar(3) NOT NULL,
  `cgpa_rank` int(7) NOT NULL,
  `mess` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `timeslot`
--

CREATE TABLE IF NOT EXISTS `timeslot` (
  `id` varchar(10) NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure for view `block`
--
DROP TABLE IF EXISTS `block`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `block` AS select sum(`1bed`.`flag1`) AS `1bed` from `1bed` union all select sum(`2bed`.`flag`) AS `2bed` from `2bed` union all select sum(`3bed`.`flag`) AS `3bed` from `3bed` union all select sum(`4bed`.`flag`) AS `4bed` from `4bed` union all select sum(`6bed`.`flag`) AS `6bed` from `6bed`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
