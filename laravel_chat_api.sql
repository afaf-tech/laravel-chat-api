-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2020 at 11:22 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_chat_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(7, '2020_12_24_110209_create_table_messages', 2),
(8, '2020_12_24_113121_create_table_conversations', 2),
(9, '2020_12_24_121105_create_table_chat_group', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_chat_group`
--

CREATE TABLE `table_chat_group` (
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `groupname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_conversations`
--

CREATE TABLE `table_conversations` (
  `conversation_id` bigint(20) UNSIGNED NOT NULL,
  `group_id` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_name` int(11) NOT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_messages`
--

CREATE TABLE `table_messages` (
  `message_id` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_messages`
--

INSERT INTO `table_messages` (`message_id`, `message`, `from_user_id`, `to_user_id`, `is_read`, `sent_at`) VALUES
(1, 'hello', 2, 1, 1, '2020-12-24 06:07:49'),
(2, 'hai', 1, 2, 1, '2020-12-24 06:30:01'),
(4, 'apa kabar', 2, 1, 1, '2020-12-24 06:32:14'),
(5, 'baik sekali. ibuku juga sehat', 1, 2, 1, '2020-12-24 06:34:15'),
(6, 'alhamdulillah kalau begitu', 2, 1, 1, '2020-12-24 06:34:25'),
(7, 'Kapan kita bisa ketemu untuk reuni kecil2an?', 1, 2, 1, '2020-12-24 06:46:43'),
(8, 'oo', 2, 1, 1, '2020-12-24 07:19:28'),
(9, 'Kenalan YUk siapa nih namanya?', 2, 3, 1, '2020-12-24 07:44:13'),
(10, 'Aku Fikri dari Gresik.', 2, 3, 1, '2020-12-24 07:44:37'),
(11, 'Hai, Aku Halim dari Mojokerto. ada perlu apa?', 3, 2, 1, '2020-12-24 09:08:54'),
(12, 'Hai, Aku Halim dari Mojokerto. ada perlu apa? kata riski', 1, 3, 0, '2020-12-24 09:16:39'),
(13, 'Ini nomor ku baru', 1, 3, 0, '2020-12-24 09:16:49'),
(14, 'oke2', 2, 1, 0, '2020-12-24 09:29:28'),
(15, 'Morning', 3, 1, 0, '2020-12-24 09:32:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'user1', 'user@gmail.com', NULL, '$2y$10$M1L7qoJFupNhmJtE6/8R.uqQQ1u9OlHzAuKhopEwWkAKRf7AANjni', NULL, '2020-12-23 08:30:32', '2020-12-23 08:30:32'),
(2, 'user2', 'user2@gmail.com', NULL, '$2y$10$JyCHHMKv5T8CXVJloVvYRuYhBM4Ze7KBe2oapytAtszIBHa4ydF1W', NULL, '2020-12-24 06:04:30', '2020-12-24 06:04:30'),
(3, 'user3', 'user3@gmail.com', NULL, '$2y$10$xPN6qnx5Ekl4KUqtDUNhzu7oMZPbZnBxrS0PXW6sMgi1ZaceciTMy', NULL, '2020-12-24 07:43:32', '2020-12-24 07:43:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `table_chat_group`
--
ALTER TABLE `table_chat_group`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `table_conversations`
--
ALTER TABLE `table_conversations`
  ADD PRIMARY KEY (`conversation_id`);

--
-- Indexes for table `table_messages`
--
ALTER TABLE `table_messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `table_chat_group`
--
ALTER TABLE `table_chat_group`
  MODIFY `group_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_conversations`
--
ALTER TABLE `table_conversations`
  MODIFY `conversation_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_messages`
--
ALTER TABLE `table_messages`
  MODIFY `message_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
