-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 02, 2025 at 08:15 AM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pahana_edu`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
CREATE TABLE IF NOT EXISTS `bills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `bill_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `customer_id`, `bill_date`, `total_amount`, `created_at`) VALUES
(1, 0, '2025-07-25', 6000.00, '2025-07-24 18:39:38'),
(2, 0, '2025-07-25', 3600.00, '2025-07-24 18:41:59'),
(3, 1, '2025-07-27', 10000.00, '2025-07-27 08:12:48'),
(4, 1, '2025-07-27', 2000.00, '2025-07-27 10:30:35'),
(5, 1, '2025-07-27', 0.00, '2025-07-27 10:36:02'),
(11, 2, '2025-08-01', 8000.00, '2025-07-31 19:02:46'),
(8, 1, '2025-08-01', 20000.00, '2025-07-31 18:36:17'),
(9, 2, '2025-08-01', 4000.00, '2025-07-31 18:36:43'),
(12, 2, '2025-08-01', 12000.00, '2025-07-31 19:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `bill_items`
--

DROP TABLE IF EXISTS `bill_items`;
CREATE TABLE IF NOT EXISTS `bill_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bill_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bill_id` (`bill_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bill_items`
--

INSERT INTO `bill_items` (`id`, `bill_id`, `item_id`, `quantity`, `unit_price`, `total_price`) VALUES
(1, 1, 1, 5, 400.00, 2000.00),
(2, 1, 2, 5, 800.00, 4000.00),
(3, 2, 1, 5, 400.00, 2000.00),
(4, 2, 2, 2, 800.00, 1600.00),
(5, 3, 1, 1, 2000.00, 2000.00),
(6, 3, 5, 2, 4000.00, 8000.00),
(7, 4, 1, 1, 2000.00, 2000.00),
(8, 5, 1, 1, 0.00, 0.00),
(17, 11, 5, 1, 4000.00, 4000.00),
(16, 11, 1, 2, 2000.00, 4000.00),
(12, 8, 1, 10, 2000.00, 20000.00),
(13, 9, 1, 2, 2000.00, 4000.00),
(19, 12, 5, 2, 4000.00, 8000.00),
(18, 12, 1, 2, 2000.00, 4000.00),
(20, 13, 1, 2, 100.00, 200.00),
(21, 14, 1, 2, 100.00, 200.00);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_number` varchar(225) NOT NULL,
  `name` varchar(225) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_number` (`account_number`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `account_number`, `name`, `address`, `telephone`) VALUES
(1, '132', 'sefef', 'sfese', '132'),
(2, '143413', 'efsefef', 'dwdwa', '3123'),
(3, '1232', 'FESFEFS', 'sefesf', '12323'),
(4, '010101', 'customer test', 'asbdesfcefedsedse', '079865899');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `stock_quantity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `unit_price`, `stock_quantity`) VALUES
(1, 'Encyclopedia', 2000.00, 15),
(6, 'Manuscript', 400.00, 55),
(5, 'Dictionary', 4000.00, 15);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'test', '1234');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
