-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2016 at 04:36 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_tosol`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `ID` int(11) NOT NULL,
  `Name` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Энэхүү table нь катогорын талаар';

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `Name` text COLLATE utf8_unicode_ci NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Энэхүү table нь аль хотод болохыг хэлж өгнө';

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `ID` int(11) NOT NULL,
  `Name` text COLLATE utf8_unicode_ci NOT NULL,
  `Image` blob,
  `Description` text COLLATE utf8_unicode_ci,
  `onDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `LocAddress` text COLLATE utf8_unicode_ci,
  `Price` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Contact` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CatID` int(11) NOT NULL,
  `CityID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `FirstName` text COLLATE utf8_unicode_ci NOT NULL,
  `LastName` text COLLATE utf8_unicode_ci NOT NULL,
  `ID` int(11) NOT NULL,
  `Password` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `FacebokID` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `E-Mail` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Энэхүү table нь хэрэглэгчийн мэдээллийг хадгална';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UNIQUE` (`CatID`),
  ADD UNIQUE KEY `UNIQUE1` (`CityID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`CatID`) REFERENCES `category` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`CityID`) REFERENCES `country` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
