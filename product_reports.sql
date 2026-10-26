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
-- Table structure for table `product_reports`
--

CREATE TABLE `product_reports` (
  `report_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `report_month` tinyint(3) UNSIGNED NOT NULL,
  `report_year` smallint(5) UNSIGNED NOT NULL,
  `total_sold` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_revenue` decimal(14,2) NOT NULL DEFAULT 0.00,
  `generated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `generated_by` int(10) UNSIGNED DEFAULT NULL
) ;

--
-- Dumping data for table `product_reports`
--

INSERT INTO `product_reports` (`report_id`, `category_id`, `report_month`, `report_year`, `total_sold`, `total_revenue`, `generated_at`, `generated_by`) VALUES
(1, 1, 10, 2026, 1, 85000.00, '2026-10-26 10:34:20', 1),
(2, 2, 10, 2026, 1, 75000.00, '2026-10-26 10:34:20', 1),
(3, 3, 10, 2026, 0, 0.00, '2026-10-26 10:34:20', 1),
(4, 4, 10, 2026, 1, 120000.00, '2026-10-26 10:34:20', 1),
(5, 5, 10, 2026, 0, 0.00, '2026-10-26 10:34:20', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product_reports`
--
ALTER TABLE `product_reports`
  ADD PRIMARY KEY (`report_id`),
  ADD UNIQUE KEY `uq_product_reports_period` (`category_id`,`report_month`,`report_year`),
  ADD KEY `fk_product_reports_generator` (`generated_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product_reports`
--
ALTER TABLE `product_reports`
  MODIFY `report_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_reports`
--
ALTER TABLE `product_reports`
  ADD CONSTRAINT `fk_product_reports_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_product_reports_generator` FOREIGN KEY (`generated_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
