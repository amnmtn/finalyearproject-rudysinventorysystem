-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2024 at 11:58 PM
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
-- Database: `rudys_inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID` int(11) NOT NULL,
  `AdminName` varchar(120) DEFAULT NULL,
  `UserName` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(20) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`) VALUES
(1, 'Admin Mastora', 'Admin', 1121112524, 'mas.esmael@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `ID` int(11) NOT NULL,
  `Type` int(11) DEFAULT NULL,
  `LogDate` date DEFAULT NULL,
  `LogTime` time DEFAULT NULL,
  `SupplierName` varchar(50) DEFAULT NULL,
  `ProductName` varchar(50) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`ID`, `Type`, `LogDate`, `LogTime`, `SupplierName`, `ProductName`, `Quantity`, `Notes`, `AdminID`) VALUES
(48, 0, '2024-11-20', '22:37:21', '-', 'Nenas', 100, '-', 1),
(49, 0, '2024-11-20', '23:03:48', '-', 'Kedondong', 15, '-', 1),
(50, 1, '2024-11-21', '09:18:22', 'Haji Sawal', 'Nenas', 250, 'Buah Tertinggal\r\n', 1),
(51, 0, '2024-11-21', '09:19:07', '-', 'Betik', 50, '-', 1),
(52, 0, '2024-11-21', '11:41:43', '-', 'Langsat', 150, '-', 1),
(53, 0, '2024-11-26', '14:08:48', '-', 'Nenas', 150, '-', 1),
(54, 1, '2024-11-26', '14:14:25', 'Haji Sawal', 'Nenas', 55, 'Buah Tertinggal', 1),
(55, 0, '2024-11-26', '14:15:19', '-', 'Nenas', 20, '-', 1),
(56, 1, '2024-11-26', '19:46:09', 'Haji Sawal', 'Nenas', 200, 'Tertinggal', 1),
(57, 0, '2024-11-26', '19:46:45', '-', 'Nenas', 150, '-', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `ProductName` varchar(50) DEFAULT NULL,
  `Price` double(10,2) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ID`, `ProductName`, `Price`, `Quantity`) VALUES
(13, 'Nenas', 4.00, 195),
(14, 'Kedondong', 2.00, 15),
(15, 'Jambu Batu', 5.00, 20),
(16, 'Betik', 4.00, 150),
(17, 'Langsat', 4.00, 50),
(18, 'Tembikai', 6.00, 200);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `ID` int(11) NOT NULL,
  `SupplierName` varchar(255) DEFAULT NULL,
  `Contact` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`ID`, `SupplierName`, `Contact`) VALUES
(7, 'Haji Sawal', '0197137212'),
(8, 'Hajjah Asmah', '074394343');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_log_product` (`ProductName`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProductName` (`ProductName`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SupplierName` (`SupplierName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `FK_log_product` FOREIGN KEY (`ProductName`) REFERENCES `product` (`ProductName`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
