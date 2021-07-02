-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Jul 2021 pada 13.39
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uaspemweb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_ka`
--

CREATE TABLE `data_ka` (
  `id_KA` int(11) NOT NULL,
  `nama_KA` varchar(30) NOT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `status` text NOT NULL,
  `jumlahkursi` int(11) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_ka`
--

INSERT INTO `data_ka` (`id_KA`, `nama_KA`, `kelas`, `status`, `jumlahkursi`, `keterangan`) VALUES
(9, 'Kereta 1', 'BIS', 'Aktif', 123, 'Tes');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `id_KA` int(11) NOT NULL,
  `st_asal` text NOT NULL,
  `st_tujuan` text NOT NULL,
  `jamberangkat` time NOT NULL,
  `jamdatang` time NOT NULL,
  `sisa_kursi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `id_KA`, `st_asal`, `st_tujuan`, `jamberangkat`, `jamdatang`, `sisa_kursi`) VALUES
(4, 9, 'Magetan', 'Yogyakarta', '07:34:00', '10:34:00', 119),
(5, 9, 'Magetan', 'Surakarta', '00:04:00', '02:04:00', 122);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelaska`
--

CREATE TABLE `kelaska` (
  `idkelas` varchar(3) NOT NULL,
  `namakelas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kelaska`
--

INSERT INTO `kelaska` (`idkelas`, `namakelas`) VALUES
('BIS', 'Bisnis'),
('EKO', 'Ekonomi'),
('EKS', 'Eksekutif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id_pesan` int(11) NOT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `id_jadwal` int(11) DEFAULT NULL,
  `nama` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `id_KA` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pemesanan`
--

INSERT INTO `pemesanan` (`id_pesan`, `nik`, `id_jadwal`, `nama`, `email`, `alamat`, `tanggal`, `id_KA`) VALUES
(31, ' 123321', NULL, 'wulan', 'admin@gmail.com', 'Jl Ir.Sutami', '2022-05-23', '2'),
(32, ' 123321', NULL, 'wulan', 'admin@gmail.com', 'Jl Ir.Sutami', '2021-03-08', 'Munawarman'),
(37, '0000000000000000', NULL, 'Willy User', 'willyuser@gmail.com', 'Jalan Kartika', '2021-06-24', '9'),
(38, '0000000000000000', NULL, 'Willy User', 'willyuser@gmail.com', 'Bandung', '2021-06-24', '9'),
(39, '0000000000000000', NULL, 'Willy User', 'willyuser@gmail.com', 'Bandung', '2021-06-24', '9'),
(40, '0000000000000000', NULL, 'Willy User', 'willyuser@gmail.com', 'DESA NAGRAK', '2021-06-24', '9'),
(41, '0000000000000000', NULL, 'Willy User', 'willyuser@gmail.com', 'Bandung', '2021-06-19', '4'),
(42, '5', NULL, 'Tri Wulandari', 'wdari0161@gmail.com', 'Jl Ir.Sutami', '2021-05-04', '5'),
(43, '5', NULL, 'Tri Wulandari', 'wdari0161@gmail.com', 'Surakarta', '2021-04-03', '4'),
(44, '5', NULL, 'Tri Wulandari', 'wdari0161@gmail.com', 'Jl Ir.Sutami', '2021-05-31', '4'),
(45, '5', NULL, 'Tri Wulandari', 'wdari0161@gmail.com', 'Jl Ir.Sutami', '2021-09-23', '4');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penumpang`
--

CREATE TABLE `penumpang` (
  `id` int(11) NOT NULL,
  `nik` bigint(16) NOT NULL,
  `nama` varchar(55) NOT NULL,
  `gender` varchar(55) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `email` varchar(55) NOT NULL,
  `alamat` text NOT NULL,
  `st_asal` varchar(55) NOT NULL,
  `st_tujuan` varchar(55) NOT NULL,
  `depart` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penumpang`
--

INSERT INTO `penumpang` (`id`, `nik`, `nama`, `gender`, `no_hp`, `email`, `alamat`, `st_asal`, `st_tujuan`, `depart`) VALUES
(6, 3311092412990002, 'Sari Eka Nur Marifah', 'Perempuan', '085784378582', 'sarieka2001@student.uns.ac.id', 'Magetan', 'Madiun', 'Purwosari', '2021-05-03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `nik` varchar(16) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(1) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`nik`, `name`, `email`, `image`, `password`, `role_id`, `is_active`, `date_created`) VALUES
('0000000000000000', 'Willy User', 'willyuser@gmail.com', 'default.jpg', '$2y$10$gxZRy9ur3xlPq0UeIMZQUut7XeEuR183JmxRagsSghBmm6Dobe1jm', 2, 1, 1624031836),
('1234567890123456', 'Willy', 'willykomara@gmail.com', 'default.jpg', '$2y$10$xy1/S91Z8xFlbhz7y0iuC.qQnyPnXFHXoZAjVoFMWt1ASmA0MwPIS', 1, 1, 1623196529),
('3', 'SARI EKA NUR MARIFAH', 'sarienm2001@gmail.com', 'default.jpg', '$2y$10$3opTN7X/NQA5C4k9sQX3P.dHhnPikzQm7fNAKeAX1wpA0Us.W4oIu', 2, 1, 1622982892),
('5', 'Tri Wulandari', 'wdari0161@gmail.com', 'default.jpg', '$2y$10$S1gP353JZeFW9vbbxoPOc.v62eob7u9ePppuuUcYsisqvl9afhd.K', 1, 1, 1623415757);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Admin'),
(2, 'User');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_ka`
--
ALTER TABLE `data_ka`
  ADD PRIMARY KEY (`id_KA`),
  ADD UNIQUE KEY `nama_KA` (`nama_KA`),
  ADD KEY `kelas` (`kelas`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_KA_FK` (`id_KA`);

--
-- Indeks untuk tabel `kelaska`
--
ALTER TABLE `kelaska`
  ADD PRIMARY KEY (`idkelas`);

--
-- Indeks untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id_pesan`),
  ADD KEY `id_jadwal` (`id_jadwal`),
  ADD KEY `nik` (`nik`);

--
-- Indeks untuk tabel `penumpang`
--
ALTER TABLE `penumpang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`nik`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `data_ka`
--
ALTER TABLE `data_ka`
  MODIFY `id_KA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `penumpang`
--
ALTER TABLE `penumpang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `data_ka`
--
ALTER TABLE `data_ka`
  ADD CONSTRAINT `data_ka_ibfk_1` FOREIGN KEY (`kelas`) REFERENCES `kelaska` (`idkelas`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `id_KA_FK` FOREIGN KEY (`id_KA`) REFERENCES `data_ka` (`id_KA`);

--
-- Ketidakleluasaan untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id_jadwal`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
