-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2017 at 06:28 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
(1, 2),
(2, 1),
(2, 2),
(3, 3),
(3, 4),
(4, 2),
(4, 3),
(4, 4),
(5, 5),
(6, 5),
(7, 6),
(3, 7),
(8, 8);

-- --------------------------------------------------------

--
-- Stand-in structure for view `apotekview`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `pakar`
--

INSERT INTO `pakar` (`id`, `idPenyakit`, `id_gejala`, `CFPakar`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 0.7),
(3, 1, 3, 0.7),
(4, 1, 4, -1),
(5, 1, 5, -1),
(6, 1, 6, -1),
(7, 1, 7, -0.5),
(8, 1, 8, -1),
(9, 1, 9, -0.5),
(10, 1, 10, -1),
(11, 1, 11, 0),
(12, 1, 12, -1),
(13, 1, 13, -1),
(14, 2, 1, 1),
(15, 2, 2, 0.8),
(16, 2, 3, 0.7),
(17, 2, 4, -1),
(18, 2, 5, -1),
(19, 2, 6, -1),
(20, 2, 7, -0.5),
(21, 2, 8, -1),
(22, 2, 9, -0.5),
(23, 2, 10, -1),
(24, 2, 11, 0),
(25, 2, 12, -1),
(26, 2, 13, -1),
(27, 3, 1, -1),
(28, 3, 2, 0.5),
(29, 3, 3, -0.5),
(30, 3, 4, 1),
(31, 3, 5, -0.5),
(32, 3, 6, 0.7),
(33, 3, 7, 1),
(34, 3, 8, -0.5),
(35, 3, 9, -1),
(36, 3, 10, 1),
(37, 3, 11, 0.5),
(38, 3, 12, -1),
(39, 3, 13, 0.5),
(40, 4, 1, -1),
(41, 4, 2, -1),
(42, 4, 3, -1),
(43, 4, 4, -0.8),
(44, 4, 5, 0.6),
(45, 4, 6, -0.7),
(46, 4, 7, -1),
(47, 4, 8, 0.8),
(48, 4, 9, -1),
(49, 4, 10, -1),
(50, 4, 11, 0),
(51, 4, 12, 0.5),
(52, 4, 13, 0.6),
(53, 5, 1, -1),
(54, 5, 2, -0.2),
(55, 5, 3, -1),
(56, 5, 4, 0.7),
(57, 5, 5, 0.3),
(58, 5, 6, 0.4),
(59, 5, 7, -1),
(60, 5, 8, -0.8),
(61, 5, 9, 1),
(62, 5, 10, 0.8),
(63, 5, 11, -1),
(64, 5, 12, -0.5),
(65, 5, 13, 0.5),
(66, 6, 1, -1),
(67, 6, 2, 0.5),
(68, 6, 3, -1),
(69, 6, 4, -0.8),
(70, 6, 5, -1),
(71, 6, 6, -1),
(72, 6, 7, -1),
(73, 6, 8, -1),
(74, 6, 9, 0.7),
(75, 6, 10, 0.4),
(76, 6, 11, 1),
(77, 6, 12, -1),
(78, 6, 13, -0.8),
(79, 7, 1, -1),
(80, 7, 2, 0.7),
(81, 7, 3, 0),
(82, 7, 4, 0.6),
(83, 7, 5, 0.6),
(84, 7, 6, 0),
(85, 7, 7, -1),
(86, 7, 8, -0.7),
(87, 7, 9, -1),
(88, 7, 10, 0.8),
(89, 7, 11, -1),
(90, 7, 12, 0.6),
(91, 7, 13, -1),
(92, 8, 1, 1),
(93, 8, 2, 0.7),
(94, 8, 3, 0.7),
(95, 8, 4, -1),
(96, 8, 5, -1),
(97, 8, 6, -1),
(98, 8, 7, -0.5),
(99, 8, 8, -1),
(100, 8, 9, -0.5),
(101, 8, 10, -1),
(102, 8, 11, 0),
(103, 8, 12, -1),
(104, 8, 13, -1);

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
  `kursi` tinyint(1) NOT NULL DEFAULT '0',
  `wifi` tinyint(1) NOT NULL DEFAULT '0',
  `ac` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skor`
--

INSERT INTO `skor` (`id_user`, `skor`, `username`, `userkey`, `kursi`, `wifi`, `ac`) VALUES
(59, 79100, 'dssa', 'V2VABEJ8MNMEUCPX1OHSY716XGEI2A0O', 4, 3, 0),
(60, 40000, 'da', 'O52I4ICSRPZIYEUAXAUVRRE0L6S4YPMG', 0, 3, 0),
(61, 698100, 'asdf', '4XBHFHN00XODQQMT2VXWEMXKPZK0KGRM', 5, 3, 2);

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
-- Indexes for table `apotek`
--
ALTER TABLE `apotek`
  ADD KEY `idpenyakit` (`idpenyakit`),
  ADD KEY `idobat` (`idobat`);

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
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idPenyakit` (`idPenyakit`) USING BTREE,
  ADD KEY `id_gejala` (`id_gejala`) USING BTREE;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `penyakit`
--
ALTER TABLE `penyakit`
  MODIFY `idPenyakit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `skor`
--
ALTER TABLE `skor`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `tanaman`
--
ALTER TABLE `tanaman`
  MODIFY `idTanaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `apotek`
--
ALTER TABLE `apotek`
  ADD CONSTRAINT `apotek_ibfk_1` FOREIGN KEY (`idpenyakit`) REFERENCES `penyakit` (`idPenyakit`) ON DELETE CASCADE,
  ADD CONSTRAINT `apotek_ibfk_2` FOREIGN KEY (`idobat`) REFERENCES `obat` (`idObat`) ON DELETE CASCADE;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
