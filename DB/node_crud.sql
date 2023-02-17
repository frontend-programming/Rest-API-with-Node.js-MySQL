-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2023 at 08:00 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `node_crud`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `created_at`) VALUES
(2, 'Pratik', 'pratik@g.com', '2023-02-15 12:26:17'),
(3, 'John Deo', 'john@g.com', '2023-02-15 12:26:43'),
(4, 'tut', 'tut@g.co', '2023-02-15 12:27:05'),
(5, 'mhd', 'mhd@g.co', '2023-02-15 12:27:22'),
(6, 'Ram Kumar', 'ram@gmail.com', '2023-02-15 16:39:41'),
(7, 'dev', 'dev@gmail.com', '2023-02-15 17:11:36'),
(8, 'Manu', 'ddd@ll.m', '2023-02-15 17:18:59'),
(9, 'DDDD', 'sssss@mm', '2023-02-15 17:19:42'),
(10, 'DDDD', 'sssss@mm', '2023-02-15 17:20:06'),
(11, 'Manu', 'sssss@mm', '2023-02-15 17:21:57'),
(12, 'Ajay', 'il.com', '2023-02-15 17:31:06'),
(13, 'Ajay', 'il.com', '2023-02-15 17:33:31'),
(14, 'Suman', 'suman@g.com', '2023-02-15 17:37:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
