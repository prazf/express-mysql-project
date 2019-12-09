-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 09, 2019 at 05:05 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employee`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Transport');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `dept_id` int(100) UNSIGNED NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `dept_id`, `email_id`, `password`) VALUES
(1, 'pradnya shirodkar', 1, 'prads.999@gmail.com', 'Pradnya@123'),
(2, 'manasi chavan', 4, 'manasi.chavan@gmail.com', 'Manasi@123'),
(3, 'Vaibhav', 3, 'vaibhav@gmail.com', '$2a$10$Rm8N/APQzpQvNyNzMTBUSegWOhc5T9Xbe9Ux6D3tVc1xtrXldB3eG'),
(4, 'seema', 3, 'seema@gmail.com', '$2a$10$ps./p.ligeqcaja12QJJE.wQdk181Mxah6aM67U1RvbacZ6cZ8D3C'),
(5, 'shreya', 2, 'shreya@gmail.com', '$2a$10$DTeKZij6yhbeACsToRG5QuM67Dp6nO5b9DiO9hi7zKCQOWKrwnxqa'),
(6, 'sumedh', 2, 'sumedh@gmail.com', '$2a$10$H4tVftt1XtP117jasUbZfOwDhaG4xXLLmTDE5w0IkM/TM6.6wXgXG'),
(7, 'riyansh', 1, 'riyansh@gmail.com', '$2a$10$9ou21wBFC9idSRCkjqhAM.YY4OEAEk/qAgKdENuGVSHXh955Kg6VO'),
(8, 'riyansh', 1, 'riyansh@gmail.com', '$2a$10$Xu..smDXlmVKyJjjUgCIueh8C0NCGE9qEB9KBlUpiC2O9oBgVCppG'),
(9, 'riyansh', 1, 'riyansh@gmail.com', '$2a$10$I1PQP5fIMhVBM8xw6VyMoeYfLf9UGZeX7M1lq2nh0Dl3I58.iGVbO'),
(10, 'riyansh', 1, 'riyansh@gmail.com', '$2a$10$lAGZiVT28/J7sO5FxA2DP.OnEVIf25TNCHolrVmkg2K.DmqyPYTuO');

-- --------------------------------------------------------

--
-- Table structure for table `punch_time`
--

DROP TABLE IF EXISTS `punch_time`;
CREATE TABLE IF NOT EXISTS `punch_time` (
  `id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` int(100) UNSIGNED NOT NULL,
  `dept_id` int(100) UNSIGNED NOT NULL,
  `punch_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `punch_time`
--

INSERT INTO `punch_time` (`id`, `employee_id`, `dept_id`, `punch_time`) VALUES
(1, 1, 1, '2019-12-08 02:30:00'),
(2, 2, 4, '2019-12-07 21:30:00'),
(3, 1, 1, '2019-12-08 17:37:01'),
(4, 1, 1, '2019-12-08 17:37:26'),
(5, 1, 1, '2019-12-06 18:30:00');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `dept_id` FOREIGN KEY (`dept_id`) REFERENCES `department` (`id`);

--
-- Constraints for table `punch_time`
--
ALTER TABLE `punch_time`
  ADD CONSTRAINT `employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
