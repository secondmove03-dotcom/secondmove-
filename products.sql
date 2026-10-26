-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2026 at 11:26 AM
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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `seller_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(12,2) NOT NULL,
  `item_condition` enum('new','like_new','good','fair') NOT NULL,
  `product_status` enum('available','sold','hidden') NOT NULL DEFAULT 'available',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `seller_id`, `category_id`, `product_name`, `description`, `price`, `item_condition`, `product_status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Buku Algoritma dan Pemrograman', 'Buku bekas kuliah dengan kondisi baik.', 85000.00, 'good', 'sold', '2026-10-26 10:31:10', '2026-10-26 10:31:10'),
(2, 3, 2, 'Mouse Wireless', 'Mouse nirkabel bekas yang masih berfungsi.', 75000.00, 'like_new', 'sold', '2026-10-26 10:31:10', '2026-10-26 10:31:10'),
(3, 4, 3, 'Jaket Kampus', 'Jaket kampus layak pakai.', 95000.00, 'good', 'available', '2026-10-26 10:31:10', '2026-10-26 10:31:10'),
(4, 5, 4, 'Tas Selempang', 'Tas selempang bekas dengan kondisi baik.', 120000.00, 'good', 'sold', '2026-10-26 10:31:10', '2026-10-26 10:31:10'),
(5, 3, 5, 'Kalkulator Ilmiah', 'Kalkulator untuk kebutuhan perkuliahan.', 65000.00, 'like_new', 'available', '2026-10-26 10:31:10', '2026-10-26 10:31:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `idx_products_seller` (`seller_id`),
  ADD KEY `idx_products_category_status` (`category_id`,`product_status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_products_seller` FOREIGN KEY (`seller_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
