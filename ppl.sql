-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2017 at 04:27 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ppl`
--

-- --------------------------------------------------------

--
-- Table structure for table `apotek`
--

CREATE TABLE `apotek` (
  `idpenyakit` int(11) DEFAULT NULL,
  `idobat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apotek`
--

INSERT INTO `apotek` (`idpenyakit`, `idobat`) VALUES
(1, 1),
(2, 3),
(1, NULL),
(4, 3),
(5, 5),
(6, 5),
(7, 6),
(8, 8);

-- --------------------------------------------------------

--
-- Stand-in structure for view `apotekview`
-- (See below for the actual view)
--
CREATE TABLE `apotekview` (
`NamaPenyakit` varchar(30)
,`NamaObat` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `gejala`
--

CREATE TABLE `gejala` (
  `idGejala` int(11) NOT NULL,
  `Gejala` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gejala`
--

INSERT INTO `gejala` (`idGejala`, `Gejala`) VALUES
(1, 'terdapat kutu putih'),
(2, 'tangkai buah luka'),
(3, 'buah rontok'),
(4, 'daun layu, gugur '),
(5, 'pucuk daun muda luka'),
(6, 'daun rontok'),
(7, 'buah luka'),
(8, 'daun berlubang'),
(9, 'batang tanaman berlubang'),
(10, 'daun layu dan mengering'),
(11, 'tanaman kecil'),
(12, 'pucuk tanaman mengering'),
(13, 'daun habis');

-- --------------------------------------------------------

--
-- Table structure for table `nilaigejala`
--

CREATE TABLE `nilaigejala` (
  `idnilai` int(11) NOT NULL,
  `idTanaman` int(11) NOT NULL,
  `idGejala` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `idObat` int(11) NOT NULL,
  `NamaObat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`idObat`, `NamaObat`) VALUES
(1, 'Dimacide 400 EC'),
(2, 'Decis 25 EC'),
(3, 'Fastac 15 EC'),
(4, 'Dursban 200 EC'),
(5, 'Regent 50 EC'),
(6, 'Demolish 18 EC'),
(7, 'Baycarb 500 EC'),
(8, 'Curacron 500 EC');

-- --------------------------------------------------------

--
-- Table structure for table `pakar`
--

CREATE TABLE `pakar` (
  `id` int(11) NOT NULL,
  `idPenyakit` int(11) NOT NULL,
  `id_gejala` int(11) NOT NULL,
  `CFPakar` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pakar`
--

INSERT INTO `pakar` (`id`, `idPenyakit`, `id_gejala`, `CFPakar`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 0.5),
(3, 1, 3, 1),
(4, 1, 4, 1),
(5, 1, 5, 0),
(6, 1, 6, 0.5),
(7, 1, 7, 1),
(8, 1, 8, 0.7),
(9, 1, 9, 1),
(10, 1, 10, 0.5),
(11, 1, 11, 0.7),
(12, 1, 12, 1),
(13, 1, 13, 1),
(14, 2, 1, 0.5),
(15, 2, 2, 0.5),
(16, 2, 3, 1),
(17, 2, 4, 0.7),
(18, 2, 5, 0.9),
(19, 2, 6, 0.5),
(20, 2, 7, 1),
(21, 2, 8, 1),
(22, 2, 9, 0.5),
(23, 2, 10, 0.7),
(24, 2, 11, 0),
(25, 2, 12, 0.3),
(26, 2, 13, 0.5),
(27, 3, 1, 1),
(28, 3, 2, 0.8),
(29, 3, 3, 0.5),
(30, 3, 4, 0.7),
(31, 3, 5, 1),
(32, 3, 6, 0.5),
(33, 3, 7, 0.7),
(34, 3, 8, 1),
(35, 3, 9, 1),
(36, 3, 10, 0.7),
(37, 3, 11, 0.5),
(38, 3, 12, 1),
(39, 3, 13, 1),
(40, 4, 1, 0.5),
(41, 4, 2, 0.3),
(42, 4, 3, 0.7),
(43, 4, 4, 0),
(44, 4, 5, 0.8),
(45, 4, 6, 0.5),
(46, 4, 7, 0.7),
(47, 4, 8, 0.7),
(48, 4, 9, 0.5),
(49, 4, 10, 1),
(50, 4, 11, 0),
(51, 4, 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE `penyakit` (
  `idPenyakit` int(11) NOT NULL,
  `NamaPenyakit` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penyakit`
--

INSERT INTO `penyakit` (`idPenyakit`, `NamaPenyakit`) VALUES
(1, 'Kutu Putih'),
(2, 'Pseudococcus Citri'),
(3, 'Penghisap daun atau Buah'),
(4, 'Ulat Api'),
(5, 'Rayap Tanah'),
(6, 'Penggerek Batang'),
(7, 'Ulat Kantong'),
(8, 'Diaphorre Citri');

-- --------------------------------------------------------

--
-- Table structure for table `skor`
--

CREATE TABLE `skor` (
  `id_user` int(11) NOT NULL,
  `skor` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `userkey` varchar(32) DEFAULT NULL,
  `kursi` varchar(10) DEFAULT NULL,
  `wifi` varchar(10) DEFAULT NULL,
  `ac` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skor`
--

INSERT INTO `skor` (`id_user`, `skor`, `username`, `userkey`, `kursi`, `wifi`, `ac`) VALUES
(6, 0, 'setnov', '9WG3QVCLQT5D7P68S1CJ7UCDWZQDPLP9', NULL, NULL, NULL),
(7, 0, 'vontes', 'SJH9SXTAHQLID9SUZCPJR6O5EQC92QU4', NULL, NULL, NULL),
(8, 0, 'g', 'XTE7ZBJ0H5JRE5QWETCUG11JWO6WQZ1H', NULL, NULL, NULL),
(9, 0, 's', 'ASVY4TQN4XG743Y3J87TF2V1S5HZKXZN', NULL, NULL, NULL),
(10, 0, 'k', 'D19LTJ02A8N3074TRZO0WNC1DE8TM1PM', NULL, NULL, NULL),
(11, 0, 'hj', 'TXY87EREMSZI9ZZP55A27SE6T9WT6P3Z', NULL, NULL, NULL),
(12, 0, ' m', 'SLQGES3PGRVXHPOZOVS1U6NT52R8GNXO', NULL, NULL, NULL),
(13, 0, 'f', '1Z9M3PMEDU5JMO6CJZK70U0ZV1VE0EO9', NULL, NULL, NULL),
(14, 0, 'jon', 'B1QKB7WXBKVJFMXR8LZ4WYB3LJMSV8U4', NULL, NULL, NULL),
(15, 0, 'vontesa', 'CTXELJCGLB2SJQ51NMTO7OUELVG1NC3V', NULL, NULL, NULL),
(16, 0, 'sda', 'B8344BDPS769ISC9EWZA1A1LZRUYEFEF', NULL, NULL, NULL),
(17, 0, 'dsa', '2U7F2KYPUVX0N5DOKYVYXKLGLDV9ARV7', NULL, NULL, NULL),
(18, 0, 'Sento kabia', 'E55SU6X6V0TOKQX8VHP3WJNM9AIDHEL5', NULL, NULL, NULL),
(19, 200, 'veno', '8B9MNAE1QC3OCVNNHTLVODLQDJDDY7I1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tanaman`
--

CREATE TABLE `tanaman` (
  `idTanaman` int(11) NOT NULL,
  `namaTanaman` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tanaman`
--

INSERT INTO `tanaman` (`idTanaman`, `namaTanaman`) VALUES
(1, 'Kopi'),
(2, 'Kakao'),
(3, 'Kelapa Sawit'),
(4, 'Teh'),
(5, 'Tebu');

-- --------------------------------------------------------

--
-- Structure for view `apotekview`
--
DROP TABLE IF EXISTS `apotekview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `apotekview`  AS  select `penyakit`.`NamaPenyakit` AS `NamaPenyakit`,`obat`.`NamaObat` AS `NamaObat` from ((`apotek` join `obat` on((`apotek`.`idobat` = `obat`.`idObat`))) join `penyakit` on((`penyakit`.`idPenyakit` = `apotek`.`idpenyakit`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gejala`
--
ALTER TABLE `gejala`
  ADD PRIMARY KEY (`idGejala`);

--
-- Indexes for table `nilaigejala`
--
ALTER TABLE `nilaigejala`
  ADD KEY `idTanaman` (`idTanaman`),
  ADD KEY `idGejala` (`idGejala`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`idObat`);

--
-- Indexes for table `pakar`
--
ALTER TABLE `pakar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPenyakit` (`idPenyakit`),
  ADD KEY `id_gejala` (`id_gejala`);

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`idPenyakit`);

--
-- Indexes for table `skor`
--
ALTER TABLE `skor`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `tanaman`
--
ALTER TABLE `tanaman`
  ADD PRIMARY KEY (`idTanaman`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gejala`
--
ALTER TABLE `gejala`
  MODIFY `idGejala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `idObat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pakar`
--
ALTER TABLE `pakar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `penyakit`
--
ALTER TABLE `penyakit`
  MODIFY `idPenyakit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `skor`
--
ALTER TABLE `skor`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tanaman`
--
ALTER TABLE `tanaman`
  MODIFY `idTanaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nilaigejala`
--
ALTER TABLE `nilaigejala`
  ADD CONSTRAINT `nilaigejala_ibfk_1` FOREIGN KEY (`idGejala`) REFERENCES `gejala` (`idGejala`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilaigejala_ibfk_2` FOREIGN KEY (`idTanaman`) REFERENCES `tanaman` (`idTanaman`);

--
-- Constraints for table `pakar`
--
ALTER TABLE `pakar`
  ADD CONSTRAINT `pakar_ibfk_3` FOREIGN KEY (`idPenyakit`) REFERENCES `penyakit` (`idPenyakit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pakar_ibfk_4` FOREIGN KEY (`id_gejala`) REFERENCES `gejala` (`idGejala`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
