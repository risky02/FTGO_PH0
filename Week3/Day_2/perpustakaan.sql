-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 06, 2023 at 01:07 AM
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
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `ID_Anggota` int(11) NOT NULL,
  `Nama` varchar(100) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `Nomor_Telepon` varchar(15) DEFAULT NULL,
  `Tanggal_Bergabung` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`ID_Anggota`, `Nama`, `Alamat`, `Nomor_Telepon`, `Tanggal_Bergabung`) VALUES
(1, 'Budi', 'Jl. Soekarno Hatta 17', '855667788', '2023-05-11'),
(2, 'Charlie', 'Charlie', '81122223333', '2023-08-15');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `ID_Buku` int(11) NOT NULL,
  `Judul` varchar(100) DEFAULT NULL,
  `Pengarang` varchar(100) DEFAULT NULL,
  `Tahun_Terbit` year(4) DEFAULT NULL,
  `Kategori` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`ID_Buku`, `Judul`, `Pengarang`, `Tahun_Terbit`, `Kategori`) VALUES
(1, 'Buku Teknologi', 'John Doe', '1995', 'Science'),
(2, 'Buku Musik', 'Tony Stark', '2003', 'Music');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `ID_Peminjaman` int(11) NOT NULL,
  `ID_Buku` int(11) DEFAULT NULL,
  `ID_Anggota` int(11) DEFAULT NULL,
  `Tanggal_Peminjaman` date DEFAULT NULL,
  `Tanggal_Pengembalian` date DEFAULT NULL,
  `STATUS` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`ID_Peminjaman`, `ID_Buku`, `ID_Anggota`, `Tanggal_Peminjaman`, `Tanggal_Pengembalian`, `STATUS`) VALUES
(1, 1, 1, '2023-09-01', '2023-09-15', 'Dipinjam'),
(2, 2, 2, '2023-09-01', '2023-09-15', 'Dipinjam');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`ID_Anggota`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`ID_Buku`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`ID_Peminjaman`),
  ADD KEY `ID_Buku` (`ID_Buku`),
  ADD KEY `ID_Anggota` (`ID_Anggota`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `ID_Anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `ID_Buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `ID_Peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`ID_Buku`) REFERENCES `buku` (`ID_Buku`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`ID_Anggota`) REFERENCES `anggota` (`ID_Anggota`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
