-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 29, 2018 at 09:40 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookClub`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bookId` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `category` varchar(30) NOT NULL,
  `keywords` varchar(20) NOT NULL,
  `author` varchar(50) NOT NULL,
  `language` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `publisher` varchar(50) NOT NULL,
  `publishDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookId`);

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bookId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2325;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bookId`, `title`, `category`, `keywords`, `author`, `language`, `country`, `publisher`, `publishDate`) VALUES
(2324, 'ff', 'dsff', 'dfdf', 'dfdf', 'dfds', 'df', 'dfds', '2018-03-22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `pAddress` varchar(50) NOT NULL,
  `cAddress` varchar(50) NOT NULL,
  `mobile` int(11) NOT NULL,
  `telephone` int(11) NOT NULL,
  `role` varchar(20) NOT NULL,
  `interest` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`firstName`, `lastName`, `dob`, `email`, `password`, `pAddress`, `cAddress`, `mobile`, `telephone`, `role`, `interest`) VALUES
('Madhawa', 'Manchanayake', '1995-05-06', 'madhawa242@gmail.com', '12345678', 'Malabe', 'Dunagaha', 775252085, 312246341, 'Admin', 'IT'),
('Pasan', 'Perera', '1994-09-06', 'pjayendra101@gmail.com', 'pasanpasan', 'Bandaragama', 'Malabe', 770813980, 112822246, 'null', 'Drinking');


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
