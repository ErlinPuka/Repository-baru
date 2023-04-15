-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Apr 2023 pada 09.08
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si scm pt chosik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `ID_Admin` int(7) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Alamat` varchar(30) NOT NULL,
  `NO_HP` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `ID_Barang` int(7) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Jenis` varchar(20) NOT NULL,
  `Berat Barang` varchar(7) NOT NULL,
  `ID_Gudang(FK)` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `ID_Customer` int(7) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Alamat` varchar(30) NOT NULL,
  `NO_HP` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gudang`
--

CREATE TABLE `gudang` (
  `ID_Gudang` int(7) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `No Ruangan` int(5) NOT NULL,
  `Daya Tampung` varchar(10) NOT NULL,
  `ID_Barang(FK)` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `ID_Jadwal` int(7) NOT NULL,
  `ID_Supir(FK)` int(7) NOT NULL,
  `Nama Supir` varchar(30) NOT NULL,
  `Hari` varchar(7) NOT NULL,
  `ID_Barang(FK)` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `outlet`
--

CREATE TABLE `outlet` (
  `ID_Outlet` int(7) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Alamat` varchar(30) NOT NULL,
  `No_HP` int(13) NOT NULL,
  `ID_Barang` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `ID_Pegawai` int(7) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Divisi` varchar(30) NOT NULL,
  `Alamat` varchar(30) NOT NULL,
  `No_HP` int(13) NOT NULL,
  `ID_Distributor(FK)` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengiriman`
--

CREATE TABLE `pengiriman` (
  `ID_Pengiriman` int(7) NOT NULL,
  `Nama Kendaraan` int(30) NOT NULL,
  `Jenis Kendaraan` int(10) NOT NULL,
  `Berat Muatan` varchar(10) NOT NULL,
  `ID_Supir(FK)` int(7) NOT NULL,
  `ID_Rute(FK)` int(7) NOT NULL,
  `ID_Barang(FK)` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rute`
--

CREATE TABLE `rute` (
  `ID_Rute` int(7) NOT NULL,
  `Alur Rute` varchar(45) NOT NULL,
  `Jarak Rute` varchar(10) NOT NULL,
  `ID_Pengiriman` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `supir`
--

CREATE TABLE `supir` (
  `ID_Supir` int(7) NOT NULL,
  `ID_Pegawai(FK)` int(7) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Alamat` varchar(30) NOT NULL,
  `No_HP` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `ID_User` int(7) NOT NULL,
  `ID_Admin(FK)` int(7) NOT NULL,
  `ID_Pegawai(FK)` int(7) NOT NULL,
  `ID_Customer(FK)` int(7) NOT NULL,
  `ID_Outlet(FK)` int(7) NOT NULL,
  `Password` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_Admin`);

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`ID_Barang`),
  ADD KEY `ID_Gudang(FK)` (`ID_Gudang(FK)`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID_Customer`);

--
-- Indeks untuk tabel `gudang`
--
ALTER TABLE `gudang`
  ADD PRIMARY KEY (`ID_Gudang`),
  ADD KEY `gudang_ibfk_1` (`ID_Barang(FK)`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`ID_Jadwal`),
  ADD KEY `ID_Barang(FK)` (`ID_Barang(FK)`),
  ADD KEY `ID_Distributor` (`ID_Supir(FK)`);

--
-- Indeks untuk tabel `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`ID_Outlet`),
  ADD KEY `ID_Barang` (`ID_Barang`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`ID_Pegawai`),
  ADD KEY `pegawai_ibfk_2` (`ID_Distributor(FK)`);

--
-- Indeks untuk tabel `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD PRIMARY KEY (`ID_Pengiriman`),
  ADD KEY `transportasi_ibfk_1` (`ID_Supir(FK)`),
  ADD KEY `transportasi_ibfk_3` (`ID_Rute(FK)`),
  ADD KEY `ID_Barang(FK)` (`ID_Barang(FK)`);

--
-- Indeks untuk tabel `rute`
--
ALTER TABLE `rute`
  ADD PRIMARY KEY (`ID_Rute`),
  ADD KEY `ID_Transportasi` (`ID_Pengiriman`);

--
-- Indeks untuk tabel `supir`
--
ALTER TABLE `supir`
  ADD PRIMARY KEY (`ID_Supir`),
  ADD KEY `ID_Pegawai(FK)` (`ID_Pegawai(FK)`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID_User`),
  ADD KEY `ID_Admin(FK)` (`ID_Admin(FK)`),
  ADD KEY `ID_Customer(FK)` (`ID_Customer(FK)`),
  ADD KEY `ID_Outlet(FK)` (`ID_Outlet(FK)`),
  ADD KEY `ID_Pegawai(FK)` (`ID_Pegawai(FK)`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`ID_Gudang(FK)`) REFERENCES `gudang` (`ID_Gudang`);

--
-- Ketidakleluasaan untuk tabel `gudang`
--
ALTER TABLE `gudang`
  ADD CONSTRAINT `gudang_ibfk_1` FOREIGN KEY (`ID_Barang(FK)`) REFERENCES `barang` (`ID_Barang`);

--
-- Ketidakleluasaan untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`ID_Barang(FK)`) REFERENCES `barang` (`ID_Barang`),
  ADD CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`ID_Supir(FK)`) REFERENCES `supir` (`ID_Supir`);

--
-- Ketidakleluasaan untuk tabel `outlet`
--
ALTER TABLE `outlet`
  ADD CONSTRAINT `outlet_ibfk_1` FOREIGN KEY (`ID_Barang`) REFERENCES `barang` (`ID_Barang`);

--
-- Ketidakleluasaan untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_2` FOREIGN KEY (`ID_Distributor(FK)`) REFERENCES `supir` (`ID_Supir`);

--
-- Ketidakleluasaan untuk tabel `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD CONSTRAINT `pengiriman_ibfk_1` FOREIGN KEY (`ID_Supir(FK)`) REFERENCES `supir` (`ID_Supir`),
  ADD CONSTRAINT `pengiriman_ibfk_3` FOREIGN KEY (`ID_Rute(FK)`) REFERENCES `rute` (`ID_Rute`),
  ADD CONSTRAINT `pengiriman_ibfk_4` FOREIGN KEY (`ID_Barang(FK)`) REFERENCES `barang` (`ID_Barang`);

--
-- Ketidakleluasaan untuk tabel `rute`
--
ALTER TABLE `rute`
  ADD CONSTRAINT `rute_ibfk_1` FOREIGN KEY (`ID_Pengiriman`) REFERENCES `pengiriman` (`ID_Pengiriman`);

--
-- Ketidakleluasaan untuk tabel `supir`
--
ALTER TABLE `supir`
  ADD CONSTRAINT `supir_ibfk_2` FOREIGN KEY (`ID_Pegawai(FK)`) REFERENCES `pegawai` (`ID_Pegawai`);

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`ID_Admin(FK)`) REFERENCES `admin` (`ID_Admin`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`ID_Customer(FK)`) REFERENCES `customer` (`ID_Customer`),
  ADD CONSTRAINT `user_ibfk_3` FOREIGN KEY (`ID_Outlet(FK)`) REFERENCES `outlet` (`ID_Outlet`),
  ADD CONSTRAINT `user_ibfk_4` FOREIGN KEY (`ID_Pegawai(FK)`) REFERENCES `pegawai` (`ID_Pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
