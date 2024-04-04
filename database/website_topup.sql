-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Mar 2024 pada 14.25
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

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
-- Struktur dari tabel `game`
--

CREATE TABLE `game` (
  `id_game` int(5) NOT NULL,
  `nama_game` varchar(255) NOT NULL,
  `produk` varchar(255) NOT NULL,
  `harga` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `game`
--

INSERT INTO `game` (`id_game`, `nama_game`, `produk`, `harga`) VALUES
(14, 'valorant', '300', 26000),
(15, 'valorant', '625', 52000),
(16, 'valorant', '1075', 86000),
(17, 'valorant', '2200', 172000),
(18, 'valorant', '4700', 368000),
(19, 'mobile legend', '172', 36000),
(20, 'mobile legend', '514', 110000),
(21, 'mobile legend', '1049', 220000),
(22, 'mobile legend', '2194', 446000),
(23, 'mobile legend', '3688', 742000),
(24, 'pubg', '263', 50000),
(26, 'pubg', '630', 115000),
(27, 'pubg', '800', 150000),
(28, 'pubg', '1000', 185000),
(33, 'pubg', '1800', 397500),
(36, 'apex', '1000', 159000),
(37, 'apex', '2150', 310000),
(38, 'apex', '4350', 581000),
(39, 'apex', '6700', 891000),
(40, 'apex', '11500', 1482000),
(41, 'free fire', '5', 1000),
(42, 'free fire', '12', 2000),
(43, 'free fire', '50', 8000),
(44, 'free fire', '70', 10000),
(45, 'free fire', '140', 20000),
(46, 'free fire', '355', 50000),
(47, 'free fire', '720', 100000),
(48, 'genshin', '60', 16500),
(49, 'genshin', '300+30', 81000),
(50, 'genshin', '980+110', 255000),
(51, 'genshin', '1980+260', 489000),
(52, 'genshin', '3280+600', 815000),
(53, 'coc', '80+8', 16000),
(54, 'coc', '500+50', 79000),
(55, 'coc', '1200+120', 329000),
(56, 'coc', '2500+250', 329000),
(57, 'coc', '6500+650', 799000),
(58, 'codm', '31', 5000),
(59, 'codm', '62', 10000),
(60, 'codm', '127', 20000),
(61, 'codm', '320', 50000),
(62, 'codm', '645', 100000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `id_user` int(50) NOT NULL,
  `id_game` int(50) NOT NULL,
  `gameid` varchar(50) NOT NULL,
  `jumlah` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `keranjang`
--

INSERT INTO `keranjang` (`id_keranjang`, `id_user`, `id_game`, `gameid`, `jumlah`) VALUES
(63, 26, 62, '', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
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
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_user`, `id_game`, `gameid`, `jumlah`, `total`, `tanggal_bayar`) VALUES
(234, 26, 36, '17324', 4, 636000, '2024-04-03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `email`) VALUES
(26, 'putri', '$2y$10$CCuFqH92LXpki9IEp5GWq.U7bh2syyigjT9znigaDYrgJQPQHoZJq', 'putrinm@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id_game`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`),
  ADD KEY `fk_id_user_kj` (`id_user`),
  ADD KEY `fk_id_game_kj` (`id_game`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `fk_id_user` (`id_user`),
  ADD KEY `fk_id_game` (`id_game`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `game`
--
ALTER TABLE `game`
  MODIFY `id_game` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `fk_id_game_kj` FOREIGN KEY (`id_game`) REFERENCES `game` (`id_game`),
  ADD CONSTRAINT `fk_id_user_kj` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `fk_id_game` FOREIGN KEY (`id_game`) REFERENCES `game` (`id_game`),
  ADD CONSTRAINT `fk_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
