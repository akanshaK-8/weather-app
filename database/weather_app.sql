-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2025 at 09:25 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `weather_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_10_16_093959_create_weathers_table', 1),
(6, '2025_10_16_235029_create_weather_data_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weather_data`
--

CREATE TABLE `weather_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `city_id` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `latitude` decimal(10,7) NOT NULL,
  `longitude` decimal(10,7) NOT NULL,
  `temperature` decimal(5,2) NOT NULL,
  `temp_min` decimal(5,2) NOT NULL,
  `temp_max` decimal(5,2) NOT NULL,
  `humidity` int(11) NOT NULL,
  `pressure` int(11) NOT NULL,
  `weather_date` date NOT NULL,
  `sunrise` time NOT NULL,
  `sunset` time NOT NULL,
  `visibility` int(11) NOT NULL,
  `wind` decimal(5,2) NOT NULL,
  `weather_main` varchar(255) NOT NULL,
  `weather_desc` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `weather_data`
--

INSERT INTO `weather_data` (`id`, `city_id`, `city`, `latitude`, `longitude`, `temperature`, `temp_min`, `temp_max`, `humidity`, `pressure`, `weather_date`, `sunrise`, `sunset`, `visibility`, `wind`, `weather_main`, `weather_desc`, `created_at`, `updated_at`) VALUES
(1, '7279746', 'Noida', '28.5800000', '77.3300000', '22.16', '22.16', '22.16', 34, 1012, '2025-10-17', '06:22:22', '17:49:24', 10000, '1.37', 'Clear', 'clear sky', '2025-10-16 19:06:34', '2025-10-16 19:06:34'),
(2, '7279746', 'Noida', '28.5800000', '77.3300000', '22.11', '22.11', '22.11', 21, 1012, '2025-10-16', '06:21:29', '17:50:14', 10000, '1.67', 'Clear sky', 'There will be clear sky today', '2025-10-16 11:51:33', '2025-10-16 11:51:33'),
(3, '2643743', 'London', '51.5085000', '-0.1257000', '13.84', '12.95', '14.44', 80, 1026, '2025-10-17', '11:56:03', '22:35:42', 10000, '4.12', 'Clouds', 'overcast clouds', '2025-10-16 20:15:04', '2025-10-16 20:15:04'),
(4, '4099753', 'Arkansas', '34.7504000', '-92.5004000', '27.87', '26.40', '29.49', 48, 1014, '2025-10-17', '17:46:33', '05:04:05', 10000, '0.89', 'Clear', 'clear sky', '2025-10-16 20:15:58', '2025-10-16 20:15:58'),
(5, '1269515', 'Jaipur', '26.9167000', '75.8167000', '20.62', '20.62', '20.62', 60, 1012, '2025-10-17', '06:27:06', '17:56:47', 3000, '0.00', 'Haze', 'haze', '2025-10-16 21:24:02', '2025-10-16 21:24:02'),
(6, '1275841', 'Bhopal', '23.2667000', '77.4000000', '23.13', '23.13', '23.13', 83, 1011, '2025-10-17', '06:17:59', '17:53:15', 2000, '2.06', 'Haze', 'haze', '2025-10-16 22:05:42', '2025-10-16 22:05:42'),
(7, '4699066', 'Houston', '29.7633000', '-95.3633000', '23.03', '21.75', '24.50', 83, 1011, '2025-10-17', '17:54:26', '05:18:42', 10000, '2.06', 'Clouds', 'scattered clouds', '2025-10-17 08:40:33', '2025-10-17 08:40:33'),
(8, '5308655', 'Phoenix', '33.4484000', '-112.0740000', '18.28', '16.74', '18.92', 49, 1010, '2025-10-17', '19:04:32', '06:22:16', 10000, '0.00', 'Clear', 'clear sky', '2025-10-17 08:41:20', '2025-10-17 08:41:20'),
(9, '4887398', 'Chicago', '41.8500000', '-87.6500000', '14.43', '13.40', '15.04', 64, 1016, '2025-10-17', '17:35:16', '04:36:10', 10000, '2.57', 'Clouds', 'broken clouds', '2025-10-17 08:41:36', '2025-10-17 08:41:36'),
(10, '1701668', 'Manila', '14.6042000', '120.9822000', '30.75', '29.50', '31.68', 75, 1007, '2025-10-17', '03:17:29', '15:05:07', 10000, '2.68', 'Clouds', 'broken clouds', '2025-10-17 08:42:21', '2025-10-17 08:42:21'),
(11, '5128581', 'New York', '40.7143000', '-74.0060000', '14.02', '12.75', '15.17', 41, 1016, '2025-10-17', '16:39:23', '03:42:54', 10000, '6.69', 'Clear', 'clear sky', '2025-10-17 15:43:39', '2025-10-17 15:43:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `weather_data`
--
ALTER TABLE `weather_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `weather_data_city_weather_date_index` (`city`,`weather_date`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `weather_data`
--
ALTER TABLE `weather_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
