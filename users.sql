-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2026 at 11:14 AM
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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `whatsapp_number` varchar(20) DEFAULT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `account_status` enum('active','inactive','blocked') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password_hash`, `whatsapp_number`, `role`, `account_status`, `created_at`, `updated_at`) VALUES
(1, 'Admin SecondMove', 'admin@secondmove.test', 'DUMMY_HASH_REPLACE_BEFORE_LOGIN', '081200000001', 'admin', 'active', '2026-10-26 10:29:10', '2026-10-26 10:29:10'),
(2, 'Andi Pratama', 'andi@secondmove.test', 'DUMMY_HASH_REPLACE_BEFORE_LOGIN', '081200000002', 'user', 'active', '2026-10-26 10:29:10', '2026-10-26 10:29:10'),
(3, 'Bunga Lestari', 'bunga@secondmove.test', 'DUMMY_HASH_REPLACE_BEFORE_LOGIN', '081200000003', 'user', 'active', '2026-10-26 10:29:10', '2026-10-26 10:29:10'),
(4, 'Citra Amelia', 'citra@secondmove.test', 'DUMMY_HASH_REPLACE_BEFORE_LOGIN', '081200000004', 'user', 'active', '2026-10-26 10:29:10', '2026-10-26 10:29:10'),
(5, 'Dimas Saputra', 'dimas@secondmove.test', 'DUMMY_HASH_REPLACE_BEFORE_LOGIN', '081200000005', 'user', 'active', '2026-10-26 10:29:10', '2026-10-26 10:29:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
