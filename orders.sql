-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2026 at 11:29 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `secondmove`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `buyer_id` int(10) UNSIGNED NOT NULL,
  `seller_id` int(10) UNSIGNED NOT NULL,
  `order_status` enum('pending','approved','cancelled','completed') NOT NULL DEFAULT 'pending',
  `cod_datetime` datetime DEFAULT NULL,
  `cod_location` varchar(255) DEFAULT NULL,
  `payment_method` enum('cash','non_cash') DEFAULT NULL,
  `ordered_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `completed_at` datetime DEFAULT NULL
) ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `buyer_id`, `seller_id`, `order_status`, `cod_datetime`, `cod_location`, `payment_method`, `ordered_at`, `completed_at`) VALUES
(1, 3, 2, 'completed', '2026-10-20 10:00:00', 'Area kampus - Perpustakaan', 'cash', '2026-10-18 02:00:00', '2026-10-20 10:30:00'),
(2, 2, 3, 'completed', '2026-10-21 11:00:00', 'Area kampus - Kantin', 'non_cash', '2026-10-19 06:00:00', '2026-10-21 11:20:00'),
(3, 2, 4, 'pending', NULL, NULL, NULL, '2026-10-22 01:30:00', NULL),
(4, 3, 5, 'completed', '2026-10-23 14:00:00', 'Area kampus - Gerbang utama', 'cash', '2026-10-20 08:00:00', '2026-10-23 14:15:00'),
(5, 4, 3, 'cancelled', NULL, NULL, NULL, '2026-10-24 03:00:00', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `idx_orders_buyer` (`buyer_id`),
  ADD KEY `idx_orders_seller_status` (`seller_id`,`order_status`),
  ADD KEY `idx_orders_completed` (`completed_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_buyer` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orders_seller` FOREIGN KEY (`seller_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
