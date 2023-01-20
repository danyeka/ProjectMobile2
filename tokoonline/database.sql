-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2023 at 12:54 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `market_place`
--
CREATE DATABASE IF NOT EXISTS `market_place` DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci;
USE `market_place`;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2023_01_01_152259_add_paid_to_users', 2),
(4, '2023_01_02_082615_create_produks_table', 3),
(5, '2023_01_05_151306_create_transaksis_table', 4),
(6, '2023_01_05_151349_create_transaksi_details_table', 4),
(7, '2023_01_14_153856_add_paid_to_transaksis', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produks`
--

CREATE TABLE `produks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produks`
--

INSERT INTO `produks` (`id`, `name`, `harga`, `deskripsi`, `category_id`, `image`, `created_at`, `updated_at`) VALUES
(18, 'oli', '50000', 'dwd', 1, '012023130426842_oli.png', '2023-01-12 21:38:26', '2023-01-12 21:38:26'),
(19, 'Ban', '10000000', 'ban', 1, '012023141445485_Ban.png', '2023-01-14 07:31:45', '2023-01-14 07:31:45'),
(20, 'panbel', '100000', '-', 1, '012023141406656_Panbel_1.png', '2023-01-14 07:32:06', '2023-01-14 07:32:06'),
(21, 'cat motor', '50000', 'cat', 1, '012023141431881_Cat.png', '2023-01-14 07:32:31', '2023-01-14 07:32:31');

-- --------------------------------------------------------

--
-- Table structure for table `transaksis`
--

CREATE TABLE `transaksis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `kode_payment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_trx` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_item` int(10) UNSIGNED NOT NULL,
  `total_harga` bigint(20) UNSIGNED NOT NULL,
  `kode_unik` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resi` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kurir` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail_lokasi` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `jasa_pengiriman` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ongkir` int(10) UNSIGNED NOT NULL,
  `total_transfer` bigint(20) UNSIGNED NOT NULL,
  `bank` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksis`
--

INSERT INTO `transaksis` (`id`, `user_id`, `kode_payment`, `kode_trx`, `total_item`, `total_harga`, `kode_unik`, `status`, `resi`, `kurir`, `name`, `phone`, `detail_lokasi`, `deskripsi`, `metode`, `expired_at`, `created_at`, `updated_at`, `jasa_pengiriman`, `ongkir`, `total_transfer`, `bank`) VALUES
(1, 19, 'INV/PYM/2023-01-05/219', 'INV/PYM/2023-01-05/647', 6, 2850000, 943, 'MENUNGGU', NULL, NULL, 'dany', '08123456', NULL, NULL, NULL, '2023-01-06 10:15:45', '2023-01-05 10:15:45', '2023-01-05 10:15:45', '', 0, 0, ''),
(2, 17, 'INV/PYM/2023-01-05/648', 'INV/PYM/2023-01-05/454', 6, 2850000, 988, 'MENUNGGU', NULL, NULL, 'dany', '08123456', NULL, NULL, NULL, '2023-01-06 11:28:31', '2023-01-05 11:28:31', '2023-01-05 11:28:31', '', 0, 0, ''),
(3, 17, 'INV/PYM/2023-01-05/122', 'INV/PYM/2023-01-05/154', 6, 2850000, 233, 'MENUNGGU', NULL, NULL, 'dany', '08123456', NULL, NULL, NULL, '2023-01-06 11:28:36', '2023-01-05 11:28:36', '2023-01-05 11:28:36', '', 0, 0, ''),
(4, 17, 'INV/PYM/2023-01-14/130', 'INV/PYM/2023-01-14/367', 6, 2850000, 690, 'MENUNGGU', NULL, NULL, 'dany', '08123456', NULL, NULL, NULL, '2023-01-15 08:18:22', '2023-01-14 08:18:22', '2023-01-14 08:18:22', '', 0, 0, ''),
(5, 17, 'INV/PYM/2023-01-14/942', 'INV/PYM/2023-01-14/372', 1, 10000001, 565, 'MENUNGGU', NULL, NULL, 'Rifan Abiyoga', '081366701245', NULL, NULL, NULL, '2023-01-15 08:26:02', '2023-01-14 08:26:02', '2023-01-14 08:26:02', '', 0, 0, ''),
(6, 17, 'INV/PYM/2023-01-14/714', 'INV/PYM/2023-01-14/789', 1, 10000000, 307, 'MENUNGGU', NULL, 'JNE', 'Rifan Abiyoga', '081366701245', NULL, NULL, NULL, '2023-01-15 11:06:14', '2023-01-14 11:06:14', '2023-01-14 11:06:14', 'YES', 72000, 10072000, 'bca'),
(7, 4, 'INV/PYM/2023-01-14/441', 'INV/PYM/2023-01-14/334', 1, 10000000, 621, 'MENUNGGU', NULL, 'JNE', 'Rifan Abiyoga', '081366701245', NULL, NULL, NULL, '2023-01-15 13:13:51', '2023-01-14 13:13:51', '2023-01-14 13:13:51', 'OKE', 36000, 10036000, 'BRI'),
(8, 4, 'INV/PYM/2023-01-14/902', 'INV/PYM/2023-01-14/539', 1, 10000000, 331, 'MENUNGGU', NULL, 'JNE', 'Rifan Abiyoga', '081366701245', NULL, NULL, NULL, '2023-01-15 13:14:14', '2023-01-14 13:14:14', '2023-01-14 13:14:14', 'OKE', 36000, 10036000, 'BRI'),
(9, 4, 'INV/PYM/2023-01-14/857', 'INV/PYM/2023-01-14/750', 1, 10000000, 880, 'MENUNGGU', NULL, 'JNE', 'Rifan Abiyoga', '081366701245', NULL, NULL, NULL, '2023-01-15 13:19:16', '2023-01-14 13:19:16', '2023-01-14 13:19:16', 'REG', 40000, 10040000, 'BRI'),
(10, 4, 'INV/PYM/2023-01-14/991', 'INV/PYM/2023-01-14/355', 1, 10000000, 687, 'MENUNGGU', NULL, 'JNE', 'Rifan Abiyoga', '081366701245', NULL, NULL, NULL, '2023-01-15 13:19:39', '2023-01-14 13:19:39', '2023-01-14 13:19:39', 'REG', 40000, 10040000, 'BCA'),
(11, 4, 'INV/PYM/2023-01-14/721', 'INV/PYM/2023-01-14/498', 1, 10000000, 216, 'MENUNGGU', NULL, 'JNE', 'Rifan Abiyoga', '081366701245', NULL, NULL, NULL, '2023-01-15 13:23:18', '2023-01-14 13:23:18', '2023-01-14 13:23:18', 'REG', 40000, 10040000, 'MANDIRI'),
(12, 4, 'INV/PYM/2023-01-14/272', 'INV/PYM/2023-01-14/708', 1, 10000000, 620, 'MENUNGGU', NULL, 'JNE', 'Rifan Abiyoga', '081366701245', NULL, NULL, NULL, '2023-01-15 13:25:10', '2023-01-14 13:25:10', '2023-01-14 13:25:10', 'YES', 72000, 10072000, 'BCA'),
(13, 4, 'INV/PYM/2023-01-15/271', 'INV/PYM/2023-01-15/983', 1, 10000000, 770, 'MENUNGGU', NULL, 'JNE', 'Rifan Abiyoga', '081366701245', NULL, NULL, NULL, '2023-01-15 18:46:44', '2023-01-14 18:46:44', '2023-01-14 18:46:44', 'OKE', 36000, 10036000, 'BRI'),
(14, 4, 'INV/PYM/2023-01-15/629', 'INV/PYM/2023-01-15/918', 1, 10000000, 887, 'MENUNGGU', NULL, 'JNE', 'Rifan Abiyoga', '081366701245', NULL, NULL, NULL, '2023-01-15 21:09:26', '2023-01-14 21:09:26', '2023-01-14 21:09:26', 'REG', 40000, 10040000, 'BCA'),
(15, 4, 'INV/PYM/2023-01-15/571', 'INV/PYM/2023-01-15/929', 1, 10000000, 494, 'MENUNGGU', NULL, 'JNE', 'Rifan Abiyoga', '081366701245', NULL, NULL, NULL, '2023-01-15 21:09:48', '2023-01-14 21:09:48', '2023-01-14 21:09:48', 'REG', 40000, 10040000, 'BRI'),
(16, 4, 'INV/PYM/2023-01-15/353', 'INV/PYM/2023-01-15/967', 3, 200000, 844, 'MENUNGGU', NULL, 'JNE', 'Rifan Abiyoga', '081366701245', NULL, NULL, NULL, '2023-01-16 04:19:41', '2023-01-15 04:19:41', '2023-01-15 04:19:41', 'OKE', 36000, 236000, 'BCA'),
(17, 4, 'INV/PYM/2023-01-15/789', 'INV/PYM/2023-01-15/624', 2, 10100000, 457, 'MENUNGGU', NULL, 'JNE', 'Rifan Abiyoga', '081366701245', NULL, NULL, NULL, '2023-01-16 04:21:47', '2023-01-15 04:21:47', '2023-01-15 04:21:47', 'REG', 40000, 10140000, 'BCA'),
(18, 4, 'INV/PYM/2023-01-15/753', 'INV/PYM/2023-01-15/654', 2, 10100000, 730, 'MENUNGGU', NULL, 'JNE', 'Rifan Abiyoga', '081366701245', NULL, NULL, NULL, '2023-01-16 04:24:40', '2023-01-15 04:24:40', '2023-01-15 04:24:40', 'OKE', 36000, 10136000, 'BCA');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_details`
--

CREATE TABLE `transaksi_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaksi_id` int(10) UNSIGNED NOT NULL,
  `produk_id` int(10) UNSIGNED NOT NULL,
  `total_item` int(10) UNSIGNED NOT NULL,
  `catatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_harga` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksi_details`
--

INSERT INTO `transaksi_details` (`id`, `transaksi_id`, `produk_id`, `total_item`, `catatan`, `total_harga`, `created_at`, `updated_at`) VALUES
(1, 1, 10, 4, 'catatan ku', 550000, '2023-01-05 10:15:45', '2023-01-05 10:15:45'),
(2, 1, 11, 2, 'catatan ku', 755000, '2023-01-05 10:15:45', '2023-01-05 10:15:45'),
(3, 2, 10, 4, 'catatan ku', 550000, '2023-01-05 11:28:31', '2023-01-05 11:28:31'),
(4, 2, 11, 2, 'catatan ku', 755000, '2023-01-05 11:28:31', '2023-01-05 11:28:31'),
(5, 3, 10, 4, 'catatan ku', 550000, '2023-01-05 11:28:37', '2023-01-05 11:28:37'),
(6, 3, 11, 2, 'catatan ku', 755000, '2023-01-05 11:28:37', '2023-01-05 11:28:37'),
(7, 4, 10, 4, 'catatan ku', 550000, '2023-01-14 08:18:22', '2023-01-14 08:18:22'),
(8, 4, 11, 2, 'catatan ku', 755000, '2023-01-14 08:18:22', '2023-01-14 08:18:22'),
(9, 5, 19, 1, 'catatan baru', 10000001, '2023-01-14 08:26:02', '2023-01-14 08:26:02'),
(10, 6, 19, 1, 'catatan baru', 10000000, '2023-01-14 11:06:14', '2023-01-14 11:06:14'),
(11, 7, 19, 1, 'catatan baru', 10000000, '2023-01-14 13:13:51', '2023-01-14 13:13:51'),
(12, 8, 19, 1, 'catatan baru', 10000000, '2023-01-14 13:14:14', '2023-01-14 13:14:14'),
(13, 9, 19, 1, 'catatan baru', 10000000, '2023-01-14 13:19:16', '2023-01-14 13:19:16'),
(14, 10, 19, 1, 'catatan baru', 10000000, '2023-01-14 13:19:39', '2023-01-14 13:19:39'),
(15, 11, 19, 1, 'catatan baru', 10000000, '2023-01-14 13:23:18', '2023-01-14 13:23:18'),
(16, 12, 19, 1, 'catatan baru', 10000000, '2023-01-14 13:25:10', '2023-01-14 13:25:10'),
(17, 13, 19, 1, 'catatan baru', 10000000, '2023-01-14 18:46:44', '2023-01-14 18:46:44'),
(18, 14, 19, 1, 'catatan baru', 10000000, '2023-01-14 21:09:26', '2023-01-14 21:09:26'),
(19, 15, 19, 1, 'catatan baru', 10000000, '2023-01-14 21:09:49', '2023-01-14 21:09:49'),
(20, 16, 18, 1, 'catatan baru', 50000, '2023-01-15 04:19:41', '2023-01-15 04:19:41'),
(21, 16, 20, 1, 'catatan baru', 100000, '2023-01-15 04:19:41', '2023-01-15 04:19:41'),
(22, 16, 21, 1, 'catatan baru', 50000, '2023-01-15 04:19:41', '2023-01-15 04:19:41'),
(23, 17, 19, 1, 'catatan baru', 10000000, '2023-01-15 04:21:47', '2023-01-15 04:21:47'),
(24, 17, 20, 1, 'catatan baru', 100000, '2023-01-15 04:21:47', '2023-01-15 04:21:47'),
(25, 18, 19, 1, 'catatan baru', 10000000, '2023-01-15 04:24:40', '2023-01-15 04:24:40'),
(26, 18, 20, 1, 'catatan baru', 100000, '2023-01-15 04:24:40', '2023-01-15 04:24:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `photo`, `image`, `fcm`) VALUES
(4, 'admin', 'admin2@gmail.com', '081366701243', NULL, '$2y$10$0DBGFwxLlwM8mlGMjpYQ4eeyopMi4qCHW0iJg3iQxqh7cI.7suf22', NULL, '2022-12-31 23:09:39', '2022-12-31 23:09:39', NULL, NULL, NULL),
(5, 'admin3', 'admin3@gmail.com', '081366701244', NULL, '$2y$10$JhlYbPNM4NfLlgpDd/nDVeNNs4op.cTvvFHa1oO3O5mvoKfUy1eZi', NULL, '2022-12-31 23:17:43', '2022-12-31 23:17:43', NULL, NULL, NULL),
(6, 'admin4', 'admin4@gmail.com', '0813667012445', NULL, '$2y$10$rgUyRlEovkXSt7xyYX3VuuHNPHXWWEkNgAWoKNVJLC5jgMkWcUh1.', NULL, '2022-12-31 23:20:23', '2022-12-31 23:20:23', NULL, NULL, NULL),
(7, 'admin5', 'admin5@gmail.com', '0813667012446', NULL, '$2y$10$u2ZRMw5ZiHRywR3E9JuKPObSeBfDlUZYpIndmXPbOXsvfQSpGurxG', NULL, '2022-12-31 23:21:38', '2022-12-31 23:21:38', NULL, NULL, NULL),
(8, 'admin7', 'admin7@gmail.com', '08136670124462', NULL, '$2y$10$usmSpMSMDSfNTFeVs5nlN..rZVaEII.thN.sk14HZIZEKXAl0cZhy', NULL, '2023-01-01 03:45:16', '2023-01-01 03:45:16', NULL, NULL, NULL),
(9, 'Dany Eka Saputra', 'dany@gmail.com', '0813667012410', NULL, '$2y$10$jG5nQ44othNyE9oOE5Dsnefj8NZUpyZwJBHJuxZMdP6woQ1qZDMVu', NULL, '2023-01-01 03:57:18', '2023-01-01 03:57:18', NULL, NULL, NULL),
(10, 'Dany Eka Saputra', 'danyekas@gmail.com', '081366701249', NULL, '$2y$10$P1u7LB8CEmcLpaGuTsMEXOWa/b7Wpo22Boc6w9A2ufrNE67PaVee.', NULL, '2023-01-01 04:28:51', '2023-01-01 04:28:51', NULL, NULL, NULL),
(11, 'Dany', 'dany!2@gmail.com', '08136641231', NULL, '$2y$10$/kbdFCyqpRU7W1.AcscgSOuQPFudvhnKpVTm7JsITSFZH.Q6ypl6C', NULL, '2023-01-01 05:10:00', '2023-01-01 05:10:00', NULL, NULL, NULL),
(12, 'Dany Eka Saputra', 'danyeka12@gmail.com', '08136670124012', NULL, '$2y$10$nnj.XAKbYbbwpYhjnHSTJuuP3.Jycah2iAnh/ceYKYR8bvNTckiwq', NULL, '2023-01-01 05:23:20', '2023-01-01 05:23:20', NULL, NULL, NULL),
(13, 'Dany Eka Saputra', 'danyeka13@gmail.com', '08136670124015', NULL, '$2y$10$E5Tq6Uuc0pBRA3D2wBtlqezm2U5xbPATDb6AkjDfayDknoDFNYmRG', NULL, '2023-01-01 06:01:53', '2023-01-01 06:01:53', NULL, NULL, NULL),
(14, 'Dany Eka Saputra', 'danyeka133@gmail.com', '081366701246', NULL, '$2y$10$j2Z8F/buRYeLf3C.gEFez.1b7lp1/lLR3QWfsxnNZe6pHomFoLgJy', NULL, '2023-01-01 06:02:31', '2023-01-01 06:02:31', NULL, NULL, NULL),
(15, 'Dany Eka Saputra', 'danyeka16@gmail.com', '08136670124018', NULL, '$2y$10$tjX8H.M.m7BTboIasGhM9.oaAXtY/dj4sEAKhTU6zUGvr8zeSEgqu', NULL, '2023-01-01 06:03:36', '2023-01-01 06:03:36', NULL, NULL, NULL),
(16, 'Dany Eka Saputra', 'danyeka17@gmail.com', '081366701240122', NULL, '$2y$10$i/7DeDQqF3hg9n1gLs1BZObF7ff4ymFXe986Bfg8FpRQzzbkM9Tqq', NULL, '2023-01-01 06:13:48', '2023-01-01 06:13:48', NULL, NULL, NULL),
(17, 'Dany Eka Saputra', 'danyeka18@gmail.com', '0813667012401227', NULL, '$2y$10$d8AA6M5p7qTT4CYSPPcKzerRvBEwD0U93xopTTfLeu9NFzBj94HZS', NULL, '2023-01-01 06:14:09', '2023-01-01 06:14:09', NULL, NULL, NULL),
(18, 'Dany Eka Saputra', 'danyeka19@gmail.com', '0813667012401222', NULL, '$2y$10$1rL721/xAf4z7OC4NBA8f.M7AoXYzA4FOVYNPd2HEqCPYAdAGKP9u', NULL, '2023-01-01 07:53:09', '2023-01-01 07:53:09', NULL, NULL, NULL),
(19, 'dany', 'dany12@gmail.com', '08123456', NULL, '$2y$10$sc./4a5IQp.G5/xGGk9Gz.PsVIhu4VSQZNROuSdMMgdHrX.MmTU5y', NULL, '2023-01-01 21:16:07', '2023-01-01 21:16:07', NULL, NULL, NULL),
(20, 'dany1212', 'dany1212@gmail.com', '139214912', NULL, '$2y$10$d.UoT2hM4c8TVirHt0q.X.VE/j.dnDL366.00.FuFeGMCoojx85Mu', NULL, '2023-01-01 21:17:51', '2023-01-01 21:17:51', NULL, NULL, NULL),
(21, 'admin8', 'admin8@gmail.com', '081366701244629', NULL, '$2y$10$q1iawp/gO.cEiXJez6wsY.kSRhaW0GtsZyO3O3PqmrLZRUxEGDKXK', NULL, '2023-01-04 19:58:56', '2023-01-04 19:58:56', NULL, NULL, NULL),
(22, 'admin10', 'admin10@gmail.com', '081366701249871', NULL, '$2y$10$hpyFiIzmQl8A8y.n34l/Uep7d9RQSEge953F8GcBenxvVJJcaQUaC', NULL, '2023-01-04 22:06:26', '2023-01-04 22:06:26', NULL, NULL, NULL),
(23, 'admin', 'admin@gmail.cm', '0813667012412', NULL, '$2y$10$2lm5ThYNNIYuT.jKnxSVxOsOzlVtk893gXBQdTc06mmG/xsBD4rAO', NULL, '2023-01-05 23:38:48', '2023-01-05 23:38:48', NULL, NULL, NULL),
(24, 'admin11', 'admin11@gmail.com', '048665', NULL, '$2y$10$GxKW9KdHu4tRNXYciegPSO1fC.K3PxX9lZfvGQJyedg7AXMJi94oC', NULL, '2023-01-06 21:39:06', '2023-01-06 21:39:06', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `produks`
--
ALTER TABLE `produks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksis`
--
ALTER TABLE `transaksis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi_details`
--
ALTER TABLE `transaksi_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `produks`
--
ALTER TABLE `produks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `transaksis`
--
ALTER TABLE `transaksis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `transaksi_details`
--
ALTER TABLE `transaksi_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
