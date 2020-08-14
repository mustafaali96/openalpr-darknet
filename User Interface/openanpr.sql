-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2020 at 12:54 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `openanpr`
--

-- --------------------------------------------------------

--
-- Table structure for table `cardata`
--

CREATE TABLE `cardata` (
  `id` int(11) NOT NULL,
  `plate` varchar(45) DEFAULT NULL,
  `make` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `path` varchar(400) DEFAULT NULL,
  `plate_path` varchar(50) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cardata`
--

INSERT INTO `cardata` (`id`, `plate`, `make`, `color`, `type`, `path`, `plate_path`, `is_read`) VALUES
(1, 'BGH-061', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/1.jpg', NULL, 1),
(2, 'BNA=201', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/25.jpg', NULL, 1),
(3, 'BGH-061', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/1_yolo_out_py.jpg', NULL, 1),
(4, 'BGH-061', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/1.jpg', NULL, 1),
(5, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/10.jpg', NULL, 1),
(6, 'BNA=201', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/25.jpg', NULL, 1),
(7, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/3.jpg', NULL, 1),
(8, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/5.jpg', NULL, 1),
(9, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/6.jpg', NULL, 1),
(10, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/7.jpg', NULL, 1),
(11, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/8.jpg', NULL, 1),
(12, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/ID14576_VEHICLE_TIME28-27-446.jpg', NULL, 1),
(13, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/ID14885_VEHICLE_TIME22-53-413.jpg', NULL, 1),
(14, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/10_yolo_out_py.jpg', NULL, 1),
(15, 'BGH-061', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/1_yolo_out_py.jpg', NULL, 1),
(16, 'BGH-061', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/25_yolo_out_py.jpg', NULL, 1),
(17, 'BGH-061', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/3_yolo_out_py.jpg', NULL, 1),
(18, 'BGH-061', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/5_yolo_out_py.jpg', NULL, 1),
(19, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/6_yolo_out_py.jpg', NULL, 1),
(20, 'NAVE=04 i{|', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/7_yolo_out_py.jpg', NULL, 1),
(21, '|BFB-345)', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/8_yolo_out_py.jpg', NULL, 1),
(22, 'BGH-061', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/1.jpg', NULL, 1),
(23, 'BNA=201', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/25.jpg', NULL, 1),
(24, 'BGH-061', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/1.jpg', NULL, 1),
(25, 'BNA=201', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/25.jpg', NULL, 1),
(26, 'BNA=201', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/ID14576_VEHICLE_TIME28-27-446.jpg', NULL, 1),
(27, 'BGH-061', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/1.jpg', NULL, 1),
(28, 'BNA=201', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/25.jpg', NULL, 1),
(29, 'BNA=201', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/5.jpg', NULL, 1),
(30, '| cv2803 |', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/9.jpg', NULL, 1),
(31, 'BGH-061', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/1.jpg', NULL, 1),
(32, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/10.jpg', NULL, 1),
(33, 'BNA=201', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/25.jpg', NULL, 1),
(34, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/4.jpg', NULL, 1),
(35, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/5.jpg', NULL, 1),
(36, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/6.jpg', NULL, 1),
(37, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/8.jpg', NULL, 1),
(38, 'BGH-061', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/1.jpg', NULL, 1),
(39, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/10.jpg', NULL, 1),
(40, 'BNA=201', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/25.jpg', NULL, 1),
(41, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/4.jpg', NULL, 1),
(42, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/5.jpg', NULL, 1),
(43, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/6.jpg', NULL, 1),
(44, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/8.jpg', NULL, 1),
(45, 'BGH-061', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/1.jpg', NULL, 1),
(46, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/10.jpg', NULL, 1),
(47, 'BNA=201', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/25.jpg', NULL, 1),
(48, 'BGH-061', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/1.jpg', NULL, 1),
(49, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/10.jpg', NULL, 1),
(50, 'BNA=201', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/25.jpg', NULL, 1),
(51, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/4.jpg', NULL, 1),
(52, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/5.jpg', NULL, 1),
(53, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/6.jpg', NULL, 1),
(54, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/8.jpg', NULL, 1),
(55, 'BGH-061', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/1.jpg', NULL, 1),
(56, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/10.jpg', NULL, 1),
(57, 'BNA=201', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/25.jpg', NULL, 1),
(58, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/3.jpg', NULL, 1),
(59, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/6.jpg', NULL, 1),
(60, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/7.jpg', NULL, 1),
(61, '', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/8.jpg', NULL, 1),
(62, 'BGH-061', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/1.jpg', NULL, 1),
(63, 'BNA=201', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/25.jpg', NULL, 1),
(64, 'BNA=201', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/erosion 416.jpg', NULL, 1),
(65, 'BNA=201', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/ID14576_VEHICLE_TIME28-27-446.jpg', NULL, 1),
(66, 'BGH-061', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/1.jpg', NULL, 1),
(67, 'BNA=201', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/25.jpg', NULL, 1),
(68, 'BNA=201', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/erosion 416.jpg', NULL, 1),
(69, 'BNA=201', NULL, NULL, NULL, 'C:/Users/musta/Xclusive_solutions/openANPR/openalpr/processed/ID14576_VEHICLE_TIME28-27-446.jpg', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `is_admin`) VALUES
(1, 'haris', 'haris123', 0),
(2, 'admin', 'admin123', 1),
(3, 'mustafa', 'mustafa123', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cardata`
--
ALTER TABLE `cardata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cardata`
--
ALTER TABLE `cardata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
