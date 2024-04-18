-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2024 at 08:03 AM
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
-- Database: `website_topup`
--

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `id_game` int(5) NOT NULL,
  `nama_game` varchar(255) NOT NULL,
  `produk` varchar(255) NOT NULL,
  `harga` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`id_game`, `nama_game`, `produk`, `harga`) VALUES
(14, 'valorant', '300 Point', 26000),
(15, 'valorant', '625 Point', 52000),
(16, 'valorant', '1075 Point', 86000),
(17, 'valorant', '2200 Point', 172000),
(18, 'valorant', '4700 Point', 368000),
(19, 'mobile legend', '172 Diamond', 36000),
(20, 'mobile legend', '514 Diamond', 110000),
(21, 'mobile legend', '1049 Diamond', 220000),
(22, 'mobile legend', '2194 Diamond', 446000),
(23, 'mobile legend', '3688 Diamond', 742000),
(24, 'pubg', '263 Uc', 50000),
(26, 'pubg', '630 Uc', 115000),
(27, 'pubg', '800 Uc', 150000),
(28, 'pubg', '1000 Uc', 185000),
(33, 'pubg', '1800 Uc', 397500),
(36, 'apex', '1000 Coin', 159000),
(37, 'apex', '2150 Coin', 310000),
(38, 'apex', '4350 Coin', 581000),
(39, 'apex', '6700 Coin', 891000),
(40, 'apex', '11500 Coin', 1482000),
(41, 'free fire ', '5 Diamond', 1000),
(42, 'free fire', '12 Diamond', 2000),
(43, 'free fire', '50 Diamond', 8000),
(44, 'free fire', '70 Diamond', 10000),
(45, 'free fire', '140 Diamond', 20000),
(46, 'free fire', '355 Diamond', 50000),
(47, 'free fire', '720 Diamond', 100000),
(48, 'genshin', '60 Genesys', 16500),
(49, 'genshin', '300+30 Genesys', 81000),
(50, 'genshin', '980+110 Genesys', 255000),
(51, 'genshin', '1980+260 Genesys', 489000),
(52, 'genshin', '3280+600 Genesys', 815000),
(53, 'coc', '80+8 Gems', 16000),
(54, 'coc', '500+50 Gems', 79000),
(55, 'coc', '1200+120 Gems', 329000),
(56, 'coc', '2500+250 Gems', 329000),
(57, 'coc', '6500+650 Gems', 799000),
(58, 'codm', '31 Cp', 5000),
(59, 'codm', '62 Cp', 10000),
(60, 'codm', '127 Cp', 20000),
(61, 'codm', '320 Cp', 50000),
(62, 'codm', '645 Cp', 100000);

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `id_user` int(50) NOT NULL,
  `id_game` int(50) NOT NULL,
  `gameid` varchar(50) NOT NULL,
  `jumlah` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keranjang`
--

INSERT INTO `keranjang` (`id_keranjang`, `id_user`, `id_game`, `gameid`, `jumlah`) VALUES
(68, 26, 33, '', 1),
(69, 26, 21, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_game` int(11) NOT NULL,
  `gameid` varchar(50) NOT NULL,
  `jumlah` int(10) NOT NULL,
  `total` int(50) NOT NULL,
  `tanggal_bayar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_user`, `id_game`, `gameid`, `jumlah`, `total`, `tanggal_bayar`) VALUES
(234, 26, 36, '17324', 4, 636000, '2024-04-03'),
(236, 27, 61, '70733', 1, 50000, '2024-04-18'),
(237, 26, 49, '12333', 2, 162000, '2024-04-18');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `email`) VALUES
(26, 'putri', '$2y$10$CCuFqH92LXpki9IEp5GWq.U7bh2syyigjT9znigaDYrgJQPQHoZJq', 'putrinm@gmail.com'),
(27, 'nadilla', '$2y$10$e6672pLSvMaEEE0fgNGdAOuEcW21VuLiGLe2jPPLxYYVxSqQR.5Bi', 'nadilla@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id_game`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`),
  ADD KEY `fk_id_user_kj` (`id_user`),
  ADD KEY `fk_id_game_kj` (`id_game`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `fk_id_user` (`id_user`),
  ADD KEY `fk_id_game` (`id_game`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `id_game` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=238;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `fk_id_game_kj` FOREIGN KEY (`id_game`) REFERENCES `game` (`id_game`),
  ADD CONSTRAINT `fk_id_user_kj` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `fk_id_game` FOREIGN KEY (`id_game`) REFERENCES `game` (`id_game`),
  ADD CONSTRAINT `fk_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
