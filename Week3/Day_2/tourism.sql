-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2023 at 04:16 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tourism`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `Bookings_ID` int(11) NOT NULL,
  `Guest_Name` varchar(50) DEFAULT NULL,
  `ID_Hotels` int(11) DEFAULT NULL,
  `Check_In_Date` date NOT NULL,
  `Check_Out_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`Bookings_ID`, `Guest_Name`, `ID_Hotels`, `Check_In_Date`, `Check_Out_Date`) VALUES
(1, 'Mandzukic', 4, '0000-00-00', '2023-09-14'),
(2, 'Didier Drogba', 1, '2023-09-15', '2023-09-16'),
(3, 'Samir Nasri', 3, '2023-09-17', '2023-09-18');

-- --------------------------------------------------------

--
-- Table structure for table `country_all`
--

CREATE TABLE `country_all` (
  `ID_Country` int(11) NOT NULL,
  `Country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `country_all`
--

INSERT INTO `country_all` (`ID_Country`, `Country`) VALUES
(1, 'Amerika Serikat'),
(2, 'Brazil'),
(3, 'Indonesia');

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `ID_Destinations` int(11) NOT NULL,
  `Des_Name` varchar(100) NOT NULL,
  `ID_Country` int(11) DEFAULT NULL,
  `Description` varchar(255) NOT NULL,
  `Ratings` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`ID_Destinations`, `Des_Name`, `ID_Country`, `Description`, `Ratings`) VALUES
(1, 'The Art Institute of Chicago', 1, 'Museum Kesenian Chicago.', 4.90),
(2, 'National Park Yosemite', 1, 'Taman nasional di Timur California', 4.70),
(3, 'Copacabana Beach', 2, 'Pantai di Rio de Janeiro', 4.80),
(4, 'Sugarloaf Mountain', 2, 'Puncak di Rio de Janeiro', 5.00),
(5, 'Danau Toba', 3, 'Danau alami di Sumatera Utara.', 4.80),
(6, 'Pegunungan Jayawijaya', 3, 'Pegunungan Tertinggi di Indonesia.', 4.60);

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `ID_Hotels` int(11) NOT NULL,
  `Hotels_Name` varchar(100) NOT NULL,
  `ID_Country` int(11) DEFAULT NULL,
  `Hotels_Rating` decimal(3,2) NOT NULL,
  `Address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`ID_Hotels`, `Hotels_Name`, `ID_Country`, `Hotels_Rating`, `Address`) VALUES
(1, 'Hotel Tongging Point', 3, 4.60, 'Jl. Raya Merek'),
(2, 'Grand Baliem Hotel', 3, 4.80, 'Jl. Sumbawa No.1, Wamena Kota'),
(3, 'The Peninsula Chicago', 1, 4.70, ' St, Chicago'),
(4, 'Post Ranch Inn', 1, 4.90, 'Big Sur, CA'),
(5, 'Copacabana Palace, A Belmond Hotel', 2, 4.80, 'Av. Atlântica, 1702'),
(6, 'Windsor Excelsior Copacabana', 2, 5.00, 'Av. Atlântica, 1800');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`Bookings_ID`),
  ADD KEY `ID_Hotels` (`ID_Hotels`);

--
-- Indexes for table `country_all`
--
ALTER TABLE `country_all`
  ADD PRIMARY KEY (`ID_Country`);

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`ID_Destinations`),
  ADD KEY `ID_Country` (`ID_Country`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`ID_Hotels`),
  ADD KEY `ID_Country` (`ID_Country`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `Bookings_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `country_all`
--
ALTER TABLE `country_all`
  MODIFY `ID_Country` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `ID_Destinations` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `ID_Hotels` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`ID_Hotels`) REFERENCES `hotels` (`ID_Hotels`);

--
-- Constraints for table `destinations`
--
ALTER TABLE `destinations`
  ADD CONSTRAINT `destinations_ibfk_1` FOREIGN KEY (`ID_Country`) REFERENCES `country_all` (`ID_Country`);

--
-- Constraints for table `hotels`
--
ALTER TABLE `hotels`
  ADD CONSTRAINT `hotels_ibfk_1` FOREIGN KEY (`ID_Country`) REFERENCES `country_all` (`ID_Country`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
