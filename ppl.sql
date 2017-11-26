-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2017 at 05:01 AM
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
(6, 0, 'setnov', '9WG3QVCLQT5D7P68S1CJ7UCDWZQDPLP9', 0, 0, 0),
(7, 0, 'vontes', 'SJH9SXTAHQLID9SUZCPJR6O5EQC92QU4', 0, 0, 0),
(8, 0, 'g', 'XTE7ZBJ0H5JRE5QWETCUG11JWO6WQZ1H', 0, 0, 0),
(9, 0, 's', 'ASVY4TQN4XG743Y3J87TF2V1S5HZKXZN', 0, 0, 0),
(10, 0, 'k', 'D19LTJ02A8N3074TRZO0WNC1DE8TM1PM', 0, 0, 0),
(11, 0, 'hj', 'TXY87EREMSZI9ZZP55A27SE6T9WT6P3Z', 0, 0, 0),
(12, 0, ' m', 'SLQGES3PGRVXHPOZOVS1U6NT52R8GNXO', 0, 0, 0),
(13, 0, 'f', '1Z9M3PMEDU5JMO6CJZK70U0ZV1VE0EO9', 0, 0, 0),
(14, 0, 'jon', 'B1QKB7WXBKVJFMXR8LZ4WYB3LJMSV8U4', 0, 0, 0),
(15, 0, 'vontesa', 'CTXELJCGLB2SJQ51NMTO7OUELVG1NC3V', 0, 0, 0),
(16, 0, 'sda', 'B8344BDPS769ISC9EWZA1A1LZRUYEFEF', 0, 0, 0),
(17, 0, 'dsa', '2U7F2KYPUVX0N5DOKYVYXKLGLDV9ARV7', 0, 0, 0),
(18, 0, 'Sento kabia', 'E55SU6X6V0TOKQX8VHP3WJNM9AIDHEL5', 0, 0, 0),
(19, 200, 'veno', '8B9MNAE1QC3OCVNNHTLVODLQDJDDY7I1', 0, 0, 0),
(20, 0, 'teh', 'YBGZ07IU29Y8OKRADNGGCXOUL4XGQBN1', 0, 0, 0),
(21, 0, 'diktaktor', 'YLVZ7S3HAG54O0VM40JAQA048IV3TB11', 0, 0, 0),
(22, 0, 'xzx', '6VMAQ2EPDRYZS2Q4CZ1DC2RYG5IPNH0T', 0, 0, 0),
(23, 0, 'casdc', 'WQCJ5O6UI5AP8QE2RZHMYG0N1HQ6G6P7', 0, 0, 0),
(24, 0, 'xds', '6JZN3B0QBJNNYGDRJJ59BY1C79GNEJEK', 0, 0, 0),
(25, 0, 'pan', '2O2Q5LGV4ZSVU6H2PD9QPOE5UPWOMNRF', 0, 0, 0),
(26, 0, 'bn', 'XGR76T2OGKO0FTTXI22VPSM3NTWZ4FRQ', 0, 0, 0),
(27, 0, 'gg', 'LK2PUEXAGE42844QCI2V68UBZSPDM462', 0, 0, 0),
(28, 0, 'dasz', 'QNA1AOHITVSWTENQF7H1NDO6RQTM1KH6', 0, 0, 0),
(29, 0, 'cxz', 'YAKKZOTLO6L2AB5A5M5NUZYJHG5K2AIO', 0, 0, 0),
(30, 0, 'sds', '9BOX1ZCI924XF65C75ZU3UEWCXG2HVQ5', 0, 0, 0),
(31, 0, 'asd', 'GT18VTSPUD42K9IRQR88RG7BPR100ND2', 0, 0, 0),
(32, 0, 'fadsf', 'UWF2ND5QS3LU69VA9OC98XX5YWNAC0CN', 0, 0, 0),
(33, 0, 'asdf', '6DN9KE794ZCVTCXHLNRRQ4G94MBTGB4C', 0, 0, 0),
(34, 0, 'fsdf', 'Q1IDMH7OEIC5IOEJ5PTFI9LORF57OXDZ', 0, 0, 0),
(35, 0, 'sxd', '5634L1UWO3Z3R1WJ4XXXFKPG6Y3CBXD8', 0, 0, 0),
(36, 0, 'asdfg', 'KX4Y8918015VKHTQSI2QYM4BWQERV1H8', 0, 0, 0),
(37, 0, 'asdsadlkhnon', 'HMXYI88T9AE4YWHHSHO3365AVU8NBUVQ', 0, 0, 0),
(38, 0, 'asded', '1U5OLR0UHH0AL8B5X8JF80Q2PCQ9JUKR', 0, 0, 0),
(39, 0, 'lkdfm', 'CH7RUDGU47HLWEGO9D7ZXOK2Z9AKT3VT', 0, 0, 0),
(40, 0, 'msmd l', 'EJ83TS2UDUI9KS2OL1OARIW4P6Z4B42K', 0, 0, 0),
(41, 0, 'zasdzsd', 'Y5F1Q37FRA20CIFBTTI1PBZ7S8HOJYXQ', 0, 0, 0),
(42, 0, 'asdkbkjasd', 'GSTOUZ7Q38S31J3ZKZ553Y0N7DIXS301', 0, 0, 0),
(43, 0, 'lknsalkd', 'MADGSLW7D9M35SNFEEUXJ4DXKSJ0CBPR', 0, 0, 0),
(44, 0, 'sldknfl', 'J2GE093USI7GS0Q1OKC6P8SAAGYAFRVL', 0, 0, 0),
(45, 0, 'alsndl', 'E9TAXPAZLUCYO6T18G1HODAYYZFOBZHH', 0, 0, 0),
(46, 0, 'laksndl', 'H762ALYR0WW58ICFJRH6GLWLX7MMHUPP', 0, 0, 0),
(47, 0, 'ansdknk', 'IDGPFU51AGFS2HDOJY0CNPE0EQE0XOIG', 0, 0, 0),
(48, 0, 'jhyfgkh', 'NE0BWB7AORLMOWMCNF40K39QXCN69KWH', 0, 0, 0),
(49, 0, 'lasnmdn', '1U20EF3ZCL07GXB3P0W1PW1OG6145B9M', 0, 0, 0),
(50, 0, 'lknsad', 'V5ZE45BGM00JZRIACYBEM5JBW5BLQ2KV', 0, 0, 0),
(51, 0, 'jasndkj', '2IVF0PYSQIHG4QIKYCQ19SICZONAWC9N', 0, 0, 0),
(52, 0, 'alsdnlkn', '51E7024OHMU21CHTBOGS1FFZF2BG05RR', 0, 0, 0),
(53, 0, 'klnlk', 'D0OLL4RXXI3J8XEC0JPSER61PS6NLUPQ', 0, 0, 0),
(54, 50, 'lnaslkn', 'M0SY8UE89T5PZ2JK1QMP5D68XDJ99X4A', 4, 1, 1),
(55, 0, 'lkasnkdn', 'WYWPEBK7W7R68Q2GHGP6L3UJ3HUBVOJR', 2, 0, 1),
(56, -50, 'askdjn', 'JJRHEDB2NKIGRTVG3RVEMSFRTLX9H8ZP', 0, 0, 0);

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
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

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
