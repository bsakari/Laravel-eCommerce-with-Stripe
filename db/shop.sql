-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 08, 2020 at 10:07 AM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_delivery` tinyint(1) DEFAULT 0,
  `is_billing` tinyint(1) DEFAULT 0,
  `default_delivery` tinyint(1) NOT NULL DEFAULT 0,
  `default_billing` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `name`, `phone`, `address_1`, `address_2`, `city`, `state`, `zipcode`, `is_delivery`, `is_billing`, `default_delivery`, `default_billing`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Jane Smith', '7141234567', '123 Main St', '', 'Westminster', 'CA', '92683', 1, 0, 1, 0, 2, '2016-09-19 06:19:21', '2016-09-19 06:19:21'),
(2, 'Jane Smith', '7141111111', '456 Beach Blvd', '', 'Santa Ana', 'CA', '92704', 0, 1, 0, 1, 2, '2016-09-19 06:20:14', '2016-09-19 06:20:14'),
(3, 'King', '0548788555', 'dsdsdsds', 'dsdsdsdsd', 'Nairobi', 'SD', '434434', 1, 0, 1, 0, 3, '2020-05-07 14:49:37', '2020-05-07 14:49:37');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `appointer_id` int(10) UNSIGNED DEFAULT NULL,
  `appointer_obj` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `appointee_id` int(10) UNSIGNED NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `status` enum('pending','set','canceled') NOT NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display` enum('radio','select') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'radio',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `display`, `created_at`, `updated_at`) VALUES
(1, 'Size (Shoes)', 'select', '2016-09-18 05:39:30', '2016-10-21 07:28:20'),
(2, 'Size (Clothes)', 'radio', '2016-10-21 07:16:43', '2016-10-21 07:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `uri`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'YT Playlist', 'yt-playlist', '<p>Test</p><p><b>test</b></p>', 'lAF29KVMSF.png', '2018-04-02 05:37:27', '2018-04-02 05:37:27');

-- --------------------------------------------------------

--
-- Table structure for table `calendar_events`
--

CREATE TABLE `calendar_events` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('available','custom') NOT NULL DEFAULT 'custom',
  `name` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `description` text DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `menu` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `uri`, `parent_id`, `order`, `menu`, `created_at`, `updated_at`) VALUES
(10, 'LAPTOPS', 'laptops', 0, 0, 0, '2020-05-08 07:29:35', '2020-05-08 07:29:35'),
(11, 'WOOFERS', 'woofers', 0, 0, 0, '2020-05-08 07:30:07', '2020-05-08 07:30:07'),
(12, 'TELEVISIONS', 'televisions', 0, 0, 0, '2020-05-08 07:31:38', '2020-05-08 07:31:38'),
(13, 'PHONES', 'phones', 0, 0, 0, '2020-05-08 07:32:06', '2020-05-08 07:32:06');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('percentage','amount') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_percentage` tinyint(3) UNSIGNED DEFAULT NULL,
  `discount_amount` float UNSIGNED DEFAULT NULL,
  `shipping` tinyint(1) DEFAULT NULL,
  `limited` tinyint(1) NOT NULL DEFAULT 1,
  `limit` int(10) UNSIGNED DEFAULT NULL,
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `discount_percentage`, `discount_amount`, `shipping`, `limited`, `limit`, `usage`, `start`, `end`, `active`, `created_at`, `updated_at`) VALUES
(3, 'SAVE5', 'percentage', 5, NULL, 1, 1, 100, 0, '2016-11-21 07:09:00', '2016-12-13 05:53:00', 1, '2016-11-21 07:13:07', '2016-12-20 07:03:21'),
(4, 'XMAS16', 'percentage', 10, NULL, 1, 1, 100, 1, NULL, '2018-01-01 07:01:00', 1, '2016-11-21 07:38:59', '2016-12-20 07:08:02'),
(5, '10OFF', 'amount', NULL, 10, NULL, 0, NULL, 0, NULL, '2016-12-20 07:02:00', 1, '2016-12-20 07:03:06', '2016-12-20 07:03:06');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_product`
--

CREATE TABLE `coupon_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupon_product`
--

INSERT INTO `coupon_product` (`id`, `coupon_id`, `product_id`, `created_at`, `updated_at`) VALUES
(4, 3, 1, '2016-11-21 07:36:24', '2016-11-21 07:36:24'),
(5, 3, 3, '2016-11-21 07:36:24', '2016-11-21 07:36:24');

-- --------------------------------------------------------

--
-- Table structure for table `custom_order_items`
--

CREATE TABLE `custom_order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `quantity` int(10) NOT NULL DEFAULT 0,
  `order_id` int(10) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_user`
--

CREATE TABLE `group_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` float NOT NULL DEFAULT 0,
  `stock` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_option`
--

CREATE TABLE `inventory_option` (
  `id` int(10) UNSIGNED NOT NULL,
  `inventory_id` int(10) UNSIGNED NOT NULL,
  `option_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory_option`
--

INSERT INTO `inventory_option` (`id`, `inventory_id`, `option_id`, `created_at`, `updated_at`) VALUES
(1, 20, 7, '2016-09-18 05:45:46', '2016-09-18 05:45:46'),
(2, 53, 8, '2016-09-18 05:47:22', '2016-09-18 05:47:22'),
(3, 54, 9, '2016-09-18 05:47:36', '2016-09-18 05:47:36'),
(4, 55, 10, '2016-09-18 05:47:48', '2016-09-18 05:47:48'),
(5, 33, 5, '2016-09-18 05:50:54', '2016-09-18 05:50:54'),
(6, 56, 6, '2016-09-18 05:51:07', '2016-09-18 05:51:07'),
(7, 57, 7, '2016-09-18 05:51:20', '2016-09-18 05:51:20'),
(8, 58, 8, '2016-09-18 05:51:34', '2016-09-18 05:51:34'),
(9, 59, 9, '2016-09-18 05:51:46', '2016-09-18 05:51:46'),
(10, 34, 7, '2016-09-18 05:53:07', '2016-09-18 05:53:07'),
(11, 35, 8, '2016-09-18 05:53:38', '2016-09-18 05:53:38'),
(12, 60, 9, '2016-09-18 05:53:57', '2016-09-18 05:53:57'),
(13, 61, 10, '2016-09-18 05:54:16', '2016-09-18 05:54:16'),
(14, 36, 7, '2016-09-18 05:55:01', '2016-09-18 05:55:01'),
(15, 62, 8, '2016-09-18 05:55:16', '2016-09-18 05:55:16'),
(16, 63, 9, '2016-09-18 05:55:36', '2016-09-18 05:55:36'),
(17, 64, 10, '2016-09-18 05:55:47', '2016-09-18 05:55:47'),
(18, 37, 8, '2016-09-18 05:57:17', '2016-09-18 05:57:17'),
(19, 65, 9, '2016-09-18 05:57:34', '2016-09-18 05:57:34'),
(20, 66, 10, '2016-09-18 05:57:50', '2016-09-18 05:57:50'),
(21, 38, 8, '2016-09-18 05:58:24', '2016-09-18 05:58:24'),
(22, 67, 9, '2016-09-18 05:58:37', '2016-09-18 05:58:37'),
(23, 68, 10, '2016-09-18 06:01:53', '2016-09-18 06:01:53'),
(24, 69, 11, '2016-09-18 06:02:07', '2016-09-18 06:02:07'),
(25, 70, 12, '2016-09-18 06:02:17', '2016-09-18 06:02:17'),
(26, 39, 6, '2016-09-18 06:02:43', '2016-09-18 06:02:43'),
(27, 71, 7, '2016-09-18 06:03:59', '2016-09-18 06:03:59'),
(28, 72, 8, '2016-09-18 06:04:14', '2016-09-18 06:04:14'),
(29, 73, 9, '2016-09-18 06:04:23', '2016-09-18 06:04:23'),
(30, 74, 10, '2016-09-18 06:04:34', '2016-09-18 06:04:34'),
(31, 40, 9, '2016-09-18 06:05:12', '2016-09-18 06:05:12'),
(32, 75, 10, '2016-09-18 06:05:25', '2016-09-18 06:05:25'),
(33, 76, 11, '2016-09-18 06:05:35', '2016-09-18 06:05:35'),
(34, 77, 12, '2016-09-18 06:05:46', '2016-09-18 06:05:46'),
(35, 78, 13, '2016-09-18 06:05:58', '2016-09-18 06:05:58'),
(36, 79, 14, '2016-09-18 06:06:09', '2016-09-18 06:06:09'),
(37, 41, 7, '2016-09-18 06:06:54', '2016-09-18 06:06:54'),
(38, 80, 8, '2016-09-18 06:07:08', '2016-09-18 06:07:08'),
(39, 81, 9, '2016-09-18 06:07:19', '2016-09-18 06:07:19'),
(40, 42, 7, '2016-09-18 06:13:19', '2016-09-18 06:13:19'),
(41, 82, 9, '2016-09-18 06:13:33', '2016-09-18 06:13:33'),
(42, 43, 9, '2016-09-18 06:14:09', '2016-09-18 06:14:09'),
(43, 83, 10, '2016-09-18 06:14:24', '2016-09-18 06:14:24'),
(44, 84, 11, '2016-09-18 06:14:35', '2016-09-18 06:14:35'),
(45, 85, 12, '2016-09-18 06:14:44', '2016-09-18 06:14:44'),
(46, 86, 13, '2016-09-18 06:14:54', '2016-09-18 06:14:54'),
(47, 44, 7, '2016-09-18 06:15:52', '2016-09-18 06:15:52'),
(48, 87, 8, '2016-09-18 06:16:06', '2016-09-18 06:16:06'),
(49, 88, 9, '2016-09-18 06:16:19', '2016-09-18 06:16:19'),
(50, 89, 10, '2016-09-18 06:16:30', '2016-09-18 06:16:30'),
(51, 45, 8, '2016-09-18 06:16:57', '2016-09-18 06:16:57'),
(52, 90, 9, '2016-09-18 06:17:32', '2016-09-18 06:17:32'),
(53, 91, 10, '2016-09-18 06:17:44', '2016-09-18 06:17:44'),
(54, 92, 11, '2016-09-18 06:17:56', '2016-09-18 06:17:56'),
(55, 93, 12, '2016-09-18 06:18:06', '2016-09-18 06:18:06'),
(56, 94, 13, '2016-09-18 06:18:17', '2016-09-18 06:18:17'),
(57, 46, 7, '2016-09-18 06:18:46', '2016-09-18 06:18:46'),
(58, 95, 8, '2016-09-18 06:19:03', '2016-09-18 06:19:03'),
(59, 96, 9, '2016-09-18 06:19:15', '2016-09-18 06:19:15'),
(60, 47, 6, '2016-09-18 06:19:39', '2016-09-18 06:19:39'),
(61, 97, 7, '2016-09-18 06:19:56', '2016-09-18 06:19:56'),
(62, 98, 8, '2016-09-18 06:20:06', '2016-09-18 06:20:06'),
(63, 99, 9, '2016-09-18 06:20:21', '2016-09-18 06:20:21'),
(64, 48, 8, '2016-09-18 06:20:46', '2016-09-18 06:20:46'),
(65, 100, 9, '2016-09-18 06:21:00', '2016-09-18 06:21:00'),
(66, 101, 10, '2016-09-18 06:21:11', '2016-09-18 06:21:11'),
(67, 102, 11, '2016-09-18 06:21:20', '2016-09-18 06:21:20'),
(68, 49, 10, '2016-09-18 06:21:42', '2016-09-18 06:21:42'),
(69, 50, 6, '2016-09-18 06:22:06', '2016-09-18 06:22:06'),
(70, 103, 7, '2016-09-18 06:22:23', '2016-09-18 06:22:23'),
(71, 104, 8, '2016-09-18 06:22:33', '2016-09-18 06:22:33'),
(72, 105, 9, '2016-09-18 06:22:43', '2016-09-18 06:22:43'),
(73, 51, 13, '2016-09-18 06:23:04', '2016-09-18 06:23:04'),
(74, 52, 7, '2016-09-18 06:23:27', '2016-09-18 06:23:27'),
(75, 106, 8, '2016-09-18 06:23:42', '2016-09-18 06:23:42'),
(76, 107, 9, '2016-09-18 06:23:53', '2016-09-18 06:23:53'),
(77, 108, 10, '2016-09-18 06:24:02', '2016-09-18 06:24:02'),
(78, 109, 15, '2016-10-21 07:17:52', '2016-10-21 07:17:52'),
(81, 110, 16, '2016-10-21 07:25:51', '2016-10-21 07:25:51'),
(82, 111, 17, '2016-10-21 07:26:06', '2016-10-21 07:26:06'),
(83, 112, 16, '2016-10-21 07:27:01', '2016-10-21 07:27:01'),
(84, 113, 17, '2016-10-21 07:27:13', '2016-10-21 07:27:13');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_order`
--

CREATE TABLE `inventory_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `sku` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory_order`
--

INSERT INTO `inventory_order` (`id`, `order_id`, `inventory_id`, `product_name`, `price`, `quantity`, `sku`, `created_at`, `updated_at`) VALUES
(1, 1, 53, 'Shoes 1', 89.99, 2, 'SHOES-1_8', '2016-09-19 05:47:22', '2016-09-19 05:47:22'),
(2, 1, 28, 'Bag 8', 49.99, 1, 'BAG-8', '2016-09-19 05:47:22', '2016-09-19 05:47:22'),
(3, 1, 14, 'Watch 14', 80, 1, 'WATCH-14', '2016-09-19 05:47:22', '2016-09-19 05:47:22'),
(4, 2, 3, 'Watch 3', 99.99, 1, 'WATCH-3', '2016-09-19 06:45:00', '2016-09-19 06:45:00'),
(5, 2, 2, 'Watch 2', 299.99, 1, 'WATCH-2', '2016-09-19 06:45:00', '2016-09-19 06:45:00'),
(6, 2, 33, 'Shoes 2', 119.99, 1, 'SHOES-2_5', '2016-09-19 06:45:00', '2016-09-19 06:45:00'),
(7, 2, 26, 'Bag 6', 349.99, 1, 'BAG-6', '2016-09-19 06:45:00', '2016-09-19 06:45:00'),
(8, 3, 115, 'Blazer 2', 29.99, 2, 'BLAZER-2', '2016-12-20 07:08:02', '2016-12-20 07:08:02'),
(9, 4, 50, 'Shoes 19', 69.99, 1, 'SHOES-19_6', '2020-05-07 17:58:26', '2020-05-07 17:58:26');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` smallint(6) NOT NULL,
  `attribute_id` int(10) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name`, `order`, `attribute_id`, `created_at`, `updated_at`) VALUES
(1, '1', 1, 1, '2016-09-18 05:40:12', '2016-09-18 05:40:12'),
(2, '2', 2, 1, '2016-09-18 05:40:18', '2016-09-18 05:40:18'),
(3, '3', 3, 1, '2016-09-18 05:40:24', '2016-09-18 05:40:24'),
(4, '4', 4, 1, '2016-09-18 05:40:31', '2016-09-18 05:40:31'),
(5, '5', 5, 1, '2016-09-18 05:40:37', '2016-09-18 05:40:37'),
(6, '6', 6, 1, '2016-09-18 05:40:44', '2016-09-18 05:40:44'),
(7, '7', 7, 1, '2016-09-18 05:42:32', '2016-09-18 05:42:32'),
(8, '8', 8, 1, '2016-09-18 05:42:38', '2016-09-18 05:42:38'),
(9, '9', 9, 1, '2016-09-18 05:42:45', '2016-09-18 05:42:45'),
(10, '10', 10, 1, '2016-09-18 05:42:50', '2016-09-18 05:42:50'),
(11, '11', 11, 1, '2016-09-18 05:42:55', '2016-09-18 05:42:55'),
(12, '12', 12, 1, '2016-09-18 05:43:01', '2016-09-18 05:43:01'),
(13, '13', 13, 1, '2016-09-18 05:43:11', '2016-09-18 05:43:11'),
(14, '14', 14, 1, '2016-09-18 05:43:17', '2016-09-18 05:43:17'),
(15, 'XS', 1, 2, '2016-10-21 07:16:54', '2016-10-21 07:16:54'),
(16, 'S', 2, 2, '2016-10-21 07:17:02', '2016-10-21 07:17:02'),
(17, 'M', 3, 2, '2016-10-21 07:17:09', '2016-10-21 07:17:09'),
(18, 'L', 4, 2, '2016-10-21 07:17:15', '2016-10-21 07:17:15'),
(19, 'XL', 5, 2, '2016-10-21 07:17:21', '2016-10-21 07:17:21');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `uid` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` bigint(20) NOT NULL,
  `confirmation_code` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_carrier` enum('','usps','ups','fedex') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_plan` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_fee` float DEFAULT NULL,
  `shipping_tracking_number` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `total` float NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `contact_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_address_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_address_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_state` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_zipcode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_state` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_zipcode` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_later` tinyint(1) NOT NULL DEFAULT 0,
  `cash_on_delivery` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('processing','shipped','delivered','cancel_requested','canceled','refunded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'processing',
  `payment_status` enum('not_paid','paid','refunded','free') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not_paid',
  `payment_method` enum('card','paypal','cash') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_charge_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_refund_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_payment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_refund_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `uid`, `order_number`, `confirmation_code`, `token`, `shipping_carrier`, `shipping_plan`, `shipping_fee`, `shipping_tracking_number`, `subtotal`, `tax`, `discount`, `total`, `user_id`, `contact_email`, `delivery_name`, `delivery_address_1`, `delivery_address_2`, `delivery_city`, `delivery_state`, `delivery_zipcode`, `delivery_phone`, `billing_name`, `billing_address_1`, `billing_address_2`, `billing_city`, `billing_state`, `billing_zipcode`, `billing_phone`, `notes`, `pay_later`, `cash_on_delivery`, `status`, `payment_status`, `payment_method`, `custom`, `stripe_charge_id`, `stripe_refund_id`, `paypal_payment_id`, `paypal_refund_id`, `coupon_id`, `created_at`, `updated_at`) VALUES
(1, '81143ddec5', 1365057192, 'LOF57H', 'tok_18vKcfB7PJrd4Q3zVrnmHu2w', 'usps', 'standard', 6.8, '1234567890', 309.97, 24.8, NULL, 341.57, NULL, 'guest@gmail.com', 'Sophia Johnson', '500 Giant Ave', 'Apt 1', 'Los Angles', 'CA', '91678', '9491234567', 'Michelle Williams', '123 Long St', '', 'Stanton', 'CA', '90681', '7143334444', NULL, 0, 0, 'shipped', 'paid', 'card', 0, 'ch_18vKcgB7PJrd4Q3z6Prw2yhM', NULL, NULL, NULL, NULL, '2016-09-19 05:47:22', '2016-09-19 06:57:25'),
(2, 'b8214ab7de', 5631909731, 'JO2CDP', '', 'usps', 'express', 22.95, NULL, 869.96, 69.6, NULL, 962.51, 2, 'customer@gmail.com', 'Jane Smith', '123 Main St', '', 'Westminster', 'CA', '92683', '7141234567', 'Jane Smith', '456 Beach Blvd', '', 'Santa Ana', 'CA', '92704', '7141111111', NULL, 0, 0, 'processing', 'paid', 'card', 0, 'ch_18vLWRB7PJrd4Q3zvSm3SV7i', NULL, NULL, NULL, NULL, '2016-09-19 06:44:59', '2016-09-19 06:44:59'),
(3, '330e1e53ca', 3897848112, 'QPHJ6M', 'tok_19ShjAB7PJrd4Q3z4krKaIch', 'usps', 'standard', 0, NULL, 59.98, 4.32, 6, 58.3, NULL, 'guest1@gmail.com', 'Michael Dell', '123 Main St', '', 'Los Angeles', 'CA', '92683', '7141234567', 'Michael Dell', '123 Main St', '', 'Los Angeles', 'CA', '92683', '7141234567', '#123', 0, 0, 'processing', 'paid', 'card', 0, 'ch_19ShjBB7PJrd4Q3zS9qtwjgJ', NULL, NULL, NULL, 4, '2016-12-20 07:08:02', '2016-12-20 07:08:02'),
(4, NULL, 4809164801, 'YY9FU3', NULL, 'usps', 'express', 23.75, NULL, 69.99, 5.6, 0, 99.34, 3, 'kingwanyama01@gmail.com', 'King', 'dsdsdsds', 'dsdsdsdsd', 'Nairobi', 'SD', '434434', '0548788555', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'King', 1, 0, 'processing', 'not_paid', NULL, 0, NULL, NULL, NULL, NULL, NULL, '2020-05-07 14:58:26', '2020-05-07 14:58:26');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_sources`
--

CREATE TABLE `payment_sources` (
  `id` int(10) UNSIGNED NOT NULL,
  `vendor` enum('stripe') COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_on_card` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last4` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('card') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `vendor_card_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_sources`
--

INSERT INTO `payment_sources` (`id`, `vendor`, `name_on_card`, `last4`, `brand`, `type`, `user_id`, `default`, `vendor_card_id`, `created_at`, `updated_at`) VALUES
(1, 'stripe', 'Jane Smith', '4444', 'MasterCard', 'card', 2, 0, 'card_18vLLVB7PJrd4Q3zYQgQmMVV', '2016-09-19 06:33:41', '2016-09-19 06:33:41'),
(2, 'stripe', 'Jane Smith', '0005', 'American Express', 'card', 2, 1, 'card_18vLVwB7PJrd4Q3zN07GUeQ5', '2016-09-19 06:44:29', '2016-09-19 06:44:29');

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `name`, `original_name`, `product_id`, `default`, `order`, `created_at`, `updated_at`) VALUES
(1, '6255548406.jpg', NULL, 1, 1, 0, '2016-08-24 07:19:21', '2020-05-08 03:39:03'),
(2, '4902884479.jpg', NULL, 2, 1, 0, '2016-08-24 07:26:57', '2016-09-15 07:06:40'),
(3, '6352452997.jpg', NULL, 3, 1, 0, '2016-08-24 07:27:37', '2020-05-08 04:18:48'),
(4, '3685986788.jpg', NULL, 4, 1, 0, '2016-08-24 07:28:06', '2016-09-15 07:07:22'),
(5, '7556968990.jpg', NULL, 5, 1, 0, '2016-08-24 07:29:15', '2016-09-15 07:07:46'),
(6, '4861023364.jpg', NULL, 6, 1, 0, '2016-08-24 07:29:39', '2016-08-26 05:44:11'),
(7, '6820792964.png', NULL, 7, 1, 0, '2016-08-24 07:30:25', '2016-09-15 07:10:59'),
(8, '6103205996.jpg', NULL, 8, 1, 0, '2016-08-24 07:30:54', '2016-09-15 07:12:12'),
(9, '4880515878.jpg', NULL, 9, 1, 0, '2016-08-24 07:31:11', '2016-09-15 07:13:30'),
(10, '8933590726.jpg', NULL, 10, 1, 0, '2016-08-24 07:31:32', '2016-09-15 07:13:47'),
(11, '3396348276.jpg', NULL, 11, 1, 0, '2016-08-24 07:31:49', '2016-09-15 08:03:39'),
(12, '4397835430.jpg', NULL, 12, 1, 0, '2016-08-24 07:32:07', '2016-08-24 07:32:07'),
(13, '8609337800.jpg', NULL, 13, 1, 0, '2016-08-24 07:32:25', '2016-09-15 08:11:27'),
(14, '7151318253.jpg', NULL, 14, 1, 0, '2016-08-24 07:32:40', '2016-09-16 06:01:27'),
(15, '6155663914.jpg', NULL, 15, 1, 0, '2016-08-24 07:32:58', '2016-09-16 06:01:49'),
(16, '1905407589.jpg', NULL, 16, 1, 0, '2016-08-24 07:33:15', '2016-09-16 06:02:16'),
(17, '4562733215.jpg', NULL, 17, 1, 0, '2016-08-24 07:33:33', '2016-09-16 06:02:31'),
(18, '1192755270.jpg', NULL, 18, 1, 0, '2016-08-24 07:33:49', '2016-09-16 06:02:56'),
(19, '2370843738.jpg', NULL, 19, 1, 0, '2016-08-24 07:34:04', '2016-09-16 06:03:22'),
(20, '1608570393.jpg', NULL, 1, 0, 0, '2016-08-24 07:35:22', '2020-05-08 03:39:03'),
(21, '2052804819.jpg', NULL, 1, 0, 0, '2016-08-24 07:35:22', '2020-05-08 03:39:03'),
(22, '7004782523.jpg', NULL, 1, 0, 0, '2016-08-24 07:35:22', '2020-05-08 03:39:03'),
(23, '1234725978.jpg', NULL, 1, 0, 0, '2016-08-24 07:35:23', '2020-05-08 03:39:03'),
(24, '4866404508.jpg', NULL, 1, 0, 0, '2016-08-24 07:35:23', '2020-05-08 03:39:03'),
(25, '2866903426.jpg', NULL, 1, 0, 0, '2016-08-24 07:35:23', '2020-05-08 03:39:03'),
(26, '4378057123.jpg', NULL, 2, 0, 0, '2016-08-26 05:41:25', '2016-09-15 07:06:40'),
(27, '3054430400.jpg', NULL, 3, 0, 0, '2016-08-26 05:42:16', '2020-05-08 04:18:48'),
(28, '5977038488.jpg', NULL, 3, 0, 0, '2016-08-26 05:42:16', '2020-05-08 04:18:48'),
(29, '5161761364.jpg', NULL, 3, 0, 0, '2016-08-26 05:42:16', '2020-05-08 04:18:48'),
(30, '3260484340.jpg', NULL, 3, 0, 0, '2016-08-26 05:42:16', '2020-05-08 04:18:48'),
(31, '6909723217.jpg', NULL, 3, 0, 0, '2016-08-26 05:42:17', '2020-05-08 04:18:48'),
(32, '7406171448.jpg', NULL, 3, 0, 0, '2016-08-26 05:42:17', '2020-05-08 04:18:48'),
(33, '1484794368.jpg', NULL, 3, 0, 0, '2016-08-26 05:42:17', '2020-05-08 04:18:48'),
(34, '6304369719.jpg', NULL, 3, 0, 0, '2016-08-26 05:42:17', '2020-05-08 04:18:48'),
(35, '2472870703.jpg', NULL, 4, 0, 0, '2016-08-26 05:42:56', '2016-09-15 07:07:22'),
(36, '2199702760.jpg', NULL, 4, 0, 0, '2016-08-26 05:42:56', '2016-09-15 07:07:22'),
(37, '2951068790.jpg', NULL, 4, 0, 0, '2016-08-26 05:42:56', '2016-09-15 07:07:22'),
(38, '2260276717.jpg', NULL, 4, 0, 0, '2016-08-26 05:42:56', '2016-09-15 07:07:22'),
(39, '6298004040.jpg', NULL, 4, 0, 0, '2016-08-26 05:42:56', '2016-09-15 07:07:22'),
(40, '8454325288.jpg', NULL, 4, 0, 0, '2016-08-26 05:42:56', '2016-09-15 07:07:22'),
(41, '7648060856.jpg', NULL, 5, 0, 0, '2016-08-26 05:43:38', '2016-09-15 07:07:46'),
(42, '9242022073.jpg', NULL, 5, 0, 0, '2016-08-26 05:43:38', '2016-09-15 07:07:46'),
(43, '3344527566.jpg', NULL, 5, 0, 0, '2016-08-26 05:43:38', '2016-09-15 07:07:46'),
(44, '6244188006.jpg', NULL, 5, 0, 0, '2016-08-26 05:43:38', '2016-09-15 07:07:46'),
(45, '3964997203.jpg', NULL, 6, 0, 0, '2016-08-26 05:44:12', '2016-08-26 05:44:12'),
(46, '2019968852.jpg', NULL, 6, 0, 0, '2016-08-26 05:44:12', '2016-08-26 05:44:12'),
(47, '4047811701.jpg', NULL, 7, 0, 0, '2016-08-26 05:44:53', '2016-09-15 07:10:59'),
(48, '6897551696.jpg', NULL, 7, 0, 0, '2016-08-26 05:44:53', '2016-09-15 07:10:59'),
(49, '7127222859.jpg', NULL, 7, 0, 0, '2016-08-26 05:44:53', '2016-09-15 07:10:59'),
(50, '1550897069.jpg', NULL, 7, 0, 0, '2016-08-26 05:44:53', '2016-09-15 07:10:59'),
(51, '1724288961.jpg', NULL, 7, 0, 0, '2016-08-26 05:44:54', '2016-09-15 07:10:59'),
(52, '3382771265.jpg', NULL, 7, 0, 0, '2016-08-26 05:44:54', '2016-09-15 07:10:59'),
(53, '5453781553.jpg', NULL, 7, 0, 0, '2016-08-26 05:44:54', '2016-09-15 07:10:59'),
(54, '7076741963.jpg', NULL, 7, 0, 0, '2016-08-26 05:44:54', '2016-09-15 07:10:59'),
(55, '4644678828.jpg', NULL, 8, 0, 0, '2016-08-26 05:48:16', '2016-09-15 07:12:12'),
(56, '8749309841.jpg', NULL, 8, 0, 0, '2016-08-26 05:48:16', '2016-09-15 07:12:12'),
(57, '8622954926.jpg', NULL, 8, 0, 0, '2016-08-26 05:48:17', '2016-09-15 07:12:12'),
(58, '9565452978.jpg', NULL, 8, 0, 0, '2016-08-26 05:48:17', '2016-09-15 07:12:12'),
(59, '8403558711.jpg', NULL, 8, 0, 0, '2016-08-26 05:48:17', '2016-09-15 07:12:12'),
(60, '2622546717.jpg', NULL, 8, 0, 0, '2016-08-26 05:48:17', '2016-09-15 07:12:12'),
(61, '2032621356.jpg', NULL, 9, 0, 0, '2016-08-26 05:48:43', '2016-09-15 07:13:30'),
(62, '2420321987.jpg', NULL, 9, 0, 0, '2016-08-26 05:48:44', '2016-09-15 07:13:30'),
(63, '9716716919.jpg', NULL, 9, 0, 0, '2016-08-26 05:48:44', '2016-09-15 07:13:30'),
(64, '6434492064.jpg', NULL, 9, 0, 0, '2016-08-26 05:48:44', '2016-09-15 07:13:30'),
(65, '9203564229.jpg', NULL, 10, 0, 0, '2016-08-26 05:49:12', '2016-09-15 07:13:47'),
(66, '1556987549.jpg', NULL, 10, 0, 0, '2016-08-26 05:49:12', '2016-09-15 07:13:47'),
(67, '1957257841.jpg', NULL, 10, 0, 0, '2016-08-26 05:49:12', '2016-09-15 07:13:47'),
(68, '8137154956.jpg', NULL, 10, 0, 0, '2016-08-26 05:49:12', '2016-09-15 07:13:47'),
(69, '8556169812.jpg', NULL, 11, 0, 0, '2016-08-26 05:49:41', '2016-09-15 08:03:39'),
(70, '2136040139.jpg', NULL, 13, 0, 0, '2016-08-26 05:50:08', '2016-09-15 08:11:27'),
(71, '7357987336.jpg', NULL, 13, 0, 0, '2016-08-26 05:50:09', '2016-09-15 08:11:27'),
(72, '8864098555.jpg', NULL, 13, 0, 0, '2016-08-26 05:50:09', '2016-09-15 08:11:27'),
(73, '1386853803.jpg', NULL, 13, 0, 0, '2016-08-26 05:50:09', '2016-09-15 08:11:27'),
(74, '3953335825.jpg', NULL, 14, 0, 0, '2016-08-26 05:50:37', '2016-09-16 06:01:27'),
(75, '5355093272.jpg', NULL, 14, 0, 0, '2016-08-26 05:50:37', '2016-09-16 06:01:27'),
(76, '6746492756.jpg', NULL, 14, 0, 0, '2016-08-26 05:50:37', '2016-09-16 06:01:27'),
(77, '1104654079.jpg', NULL, 14, 0, 0, '2016-08-26 05:50:37', '2016-09-16 06:01:27'),
(78, '1510757191.jpg', NULL, 14, 0, 0, '2016-08-26 05:50:37', '2016-09-16 06:01:27'),
(79, '3883151300.jpg', NULL, 15, 0, 0, '2016-08-26 05:50:58', '2016-09-16 06:01:49'),
(80, '1084159341.jpg', NULL, 15, 0, 0, '2016-08-26 05:50:58', '2016-09-16 06:01:49'),
(81, '1950236987.jpg', NULL, 19, 0, 0, '2016-08-26 05:51:17', '2016-09-16 06:03:22'),
(82, '4386167884.jpg', NULL, 19, 0, 0, '2016-08-26 05:51:17', '2016-09-16 06:03:22'),
(83, '4455781853.jpg', NULL, 19, 0, 0, '2016-08-26 05:51:17', '2016-09-16 06:03:22'),
(84, '2299520716.jpg', NULL, 18, 0, 0, '2016-08-26 06:06:39', '2016-09-16 06:02:56'),
(85, '9301757404.jpg', NULL, 18, 0, 0, '2016-08-26 06:06:39', '2016-09-16 06:02:56'),
(86, '2379291058.jpg', NULL, 18, 0, 0, '2016-08-26 06:06:40', '2016-09-16 06:02:56'),
(87, '6184868112.jpg', NULL, 18, 0, 0, '2016-08-26 06:06:40', '2016-09-16 06:02:56'),
(88, '6730146662.jpg', NULL, 20, 1, 0, '2016-08-26 06:08:21', '2016-09-16 06:03:52'),
(89, '6637377091.jpg', NULL, 20, 0, 0, '2016-08-26 06:08:21', '2016-09-16 06:03:52'),
(90, '7385391876.jpeg', NULL, 20, 0, 0, '2016-08-26 06:08:22', '2016-09-16 06:03:52'),
(91, '1598726313.jpeg', NULL, 20, 0, 0, '2016-08-26 06:08:22', '2016-09-16 06:03:52'),
(95, '9022744085.jpg', NULL, 21, 1, 0, '2016-08-26 06:11:40', '2016-09-16 06:04:18'),
(96, '5275957691.jpg', NULL, 21, 0, 0, '2016-08-26 06:11:40', '2016-09-16 06:04:18'),
(97, '2756317281.jpg', NULL, 21, 0, 0, '2016-08-26 06:11:40', '2016-09-16 06:04:18'),
(98, '6027526613.jpg', NULL, 22, 1, 0, '2016-08-26 06:18:07', '2016-09-16 06:04:38'),
(99, '5510683674.jpg', NULL, 23, 1, 0, '2016-08-26 06:18:31', '2016-09-16 06:05:05'),
(100, '6622721790.jpg', NULL, 24, 1, 0, '2016-08-26 06:18:54', '2016-09-16 06:05:22'),
(104, '4379905898.jpg', NULL, 25, 0, 0, '2016-08-26 06:21:31', '2016-09-16 06:05:50'),
(105, '1459443159.jpg', NULL, 25, 0, 0, '2016-08-26 06:21:31', '2016-09-16 06:05:50'),
(106, '2414388031.jpg', NULL, 25, 0, 0, '2016-08-26 06:21:31', '2016-09-16 06:05:50'),
(107, '6487155386.jpg', NULL, 25, 1, 0, '2016-08-26 06:21:31', '2016-09-16 06:05:50'),
(108, '1238957607.jpg', NULL, 26, 1, 0, '2016-08-26 06:22:30', '2016-09-16 06:06:08'),
(109, '2513231222.jpg', NULL, 27, 1, 0, '2016-08-26 06:26:04', '2016-09-16 06:06:36'),
(110, '5100374820.jpg', NULL, 28, 0, 0, '2016-08-26 06:26:36', '2016-09-16 06:07:05'),
(111, '4044124376.jpg', NULL, 28, 1, 0, '2016-08-26 06:26:36', '2016-09-16 06:07:05'),
(112, '6374254587.jpeg', NULL, 29, 1, 0, '2016-08-26 06:28:46', '2016-09-16 06:07:23'),
(113, '7154805225.jpg', NULL, 30, 0, 0, '2016-08-26 06:29:17', '2016-09-16 06:07:49'),
(114, '9021162864.jpg', NULL, 30, 1, 0, '2016-08-26 06:29:18', '2016-09-16 06:07:49'),
(115, '1536015952.jpg', NULL, 31, 1, 0, '2016-08-26 06:29:52', '2016-09-16 06:08:07'),
(116, 'jMFiWsLsyB.jpg', 'ankle boot.jpg', 32, 1, 0, '2016-08-30 07:09:37', '2016-09-16 06:08:56'),
(117, 'r71BKI8paE.jpg', 'black pointy bump -heel.jpg', 33, 1, 0, '2016-08-30 07:13:37', '2016-09-16 06:09:12'),
(118, 'hDxPQyI5LH.jpg', 'heel sandal.jpg', 33, 0, 0, '2016-08-30 07:13:38', '2016-09-16 06:09:12'),
(119, 'PKdbLXY7jT.jpg', 'casual sneakers.jpg', 34, 1, 0, '2016-08-30 07:14:31', '2016-09-16 06:09:32'),
(120, 'OkkXM9IEwU.jpg', 'flat heel sandal.jpg', 35, 1, 0, '2016-08-30 07:15:13', '2016-09-16 06:09:54'),
(121, 'C6ZXvDJKr4.jpg', 'high-heels-1327020_1280.jpg', 36, 1, 0, '2016-08-30 07:15:49', '2016-09-16 06:10:25'),
(122, 'UE7HTqmEnl.jpg', 'high-heels-1327022_1280.jpg', 36, 0, 0, '2016-08-30 07:15:49', '2016-09-16 06:10:25'),
(123, '8fo98QjNZp.jpg', 'mary jane pump.jpg', 37, 1, 0, '2016-08-30 07:17:14', '2016-09-16 06:12:35'),
(124, 'zmx9H2ZpzO.jpg', 'pointy dress shoes.jpg', 38, 1, 0, '2016-08-30 07:18:00', '2016-09-16 06:13:06'),
(125, 'lzBOSG58nu.jpg', 'pointy high heel.jpg', 39, 1, 0, '2016-08-30 07:20:27', '2016-09-16 06:13:52'),
(126, '3yXhOddWUC.jpg', 'running shoe.jpg', 40, 1, 0, '2016-08-30 07:21:05', '2016-09-16 06:14:29'),
(127, 'MAHsZkJGoY.jpg', 'running-shoe-321199_1280.jpg', 40, 0, 0, '2016-08-30 07:21:05', '2016-09-16 06:14:29'),
(128, '7uJn8YGGea.jpg', 'running-shoe-371625_1280.jpg', 40, 0, 0, '2016-08-30 07:21:05', '2016-09-16 06:14:29'),
(129, 'uAdZq9mXLn.jpg', 'sandal-669372_1280.jpg', 41, 1, 0, '2016-08-30 07:21:41', '2016-09-16 06:20:17'),
(130, 'BbAI3j5wQK.jpg', 'shoe-1040802_1920.jpg', 42, 1, 0, '2016-08-30 07:22:24', '2016-09-16 06:20:31'),
(131, 'jwxX5hWj3K.jpg', 'shoes-825671_1280.jpg', 43, 0, 0, '2016-08-30 07:22:52', '2016-09-16 06:20:51'),
(132, 'dF4dcbF6iS.jpg', 'shoes-825672_1280.jpg', 43, 0, 0, '2016-08-30 07:22:53', '2016-09-16 06:20:51'),
(133, 'oURBS7OR0N.jpg', 'shoes-825673_1280.jpg', 43, 0, 0, '2016-08-30 07:22:53', '2016-09-16 06:20:51'),
(134, 'mjBynMivWb.jpg', 'shoes-825674_1280.jpg', 43, 1, 0, '2016-08-30 07:22:53', '2016-09-16 06:20:51'),
(135, 'vxQbjZ9dyy.jpg', 'shoes-879302_1280.jpg', 44, 1, 0, '2016-08-30 07:23:37', '2016-09-16 06:21:13'),
(136, 'IzsrinphfO.jpg', 'shoes-918543_1280.jpg', 45, 1, 0, '2016-08-30 07:24:00', '2016-09-16 06:21:30'),
(137, '3cTMiRljb8.jpg', 'small-change-1060010_1280.jpg', 46, 1, 0, '2016-08-30 07:24:19', '2016-09-16 06:21:46'),
(138, 'FVvQhLpUw2.jpg', 'sneakers.jpg', 47, 1, 0, '2016-08-30 07:24:57', '2016-09-16 06:22:11'),
(139, '3NsTnKlsKk.jpg', 'sneakers-531172_1280.jpg', 48, 1, 0, '2016-08-30 07:25:40', '2016-09-16 06:22:27'),
(140, 'e9zQVdQxqx.jpg', 'sneakers-1306116_1280.jpg', 49, 1, 0, '2016-08-30 07:26:04', '2016-09-16 06:22:39'),
(141, 'jiLOWb8ley.jpg', 'women pointy flat shoes.jpg', 50, 1, 0, '2016-08-30 07:26:37', '2016-09-16 06:22:52'),
(142, 'p35eLMlgFs.jpg', 'women strappy sandal heel.jpg', 51, 1, 0, '2016-08-30 07:26:58', '2016-09-16 06:23:05'),
(143, 'Vn1sYzGrjo.jpg', 'womens-shoes-178162_1280.jpg', 52, 1, 0, '2016-08-30 07:27:35', '2016-09-16 06:23:19'),
(144, 'nd1F11glfL.jpg', 'model-1338993_1920.jpg', 53, 1, 0, '2016-10-21 07:15:15', '2016-12-18 07:38:22'),
(145, 'ie5INNQnBE.jpg', 'girl-1537509_1920.jpg', 54, 0, 0, '2016-10-21 07:24:01', '2016-12-18 07:39:47'),
(146, '5i2pjphPkD.jpg', 'girl-1537513_1920.jpg', 54, 0, 0, '2016-10-21 07:24:01', '2016-12-18 07:39:47'),
(147, 'PJzNVR3qxB.jpg', 'girl-1537514_1920.jpg', 54, 0, 0, '2016-10-21 07:24:02', '2016-12-18 07:39:47'),
(148, 'aHdYeCUYew.jpg', 'girl-1537517_1920.jpg', 54, 0, 0, '2016-10-21 07:24:02', '2016-12-18 07:39:47'),
(149, 'hmKUKdTZjy.jpg', 'girl-1537519_1920.jpg', 54, 0, 0, '2016-10-21 07:24:02', '2016-12-18 07:39:47'),
(150, 'sdBgx412VL.jpg', 'girl-1537521_1920.jpg', 54, 0, 0, '2016-10-21 07:24:02', '2016-12-18 07:39:47'),
(151, 'RFxFBii1R4.jpg', 'girl-1537522_1920.jpg', 54, 1, 0, '2016-10-21 07:24:03', '2016-12-18 07:39:47'),
(152, 'lypdH1YOT5.jpg', 'young-858730_1920.jpg', 55, 0, 0, '2016-12-20 06:24:48', '2016-12-20 06:28:14'),
(153, 'i2mHQDSGyo.jpg', 'young-858735_1920.jpg', 55, 0, 0, '2016-12-20 06:25:48', '2016-12-20 06:28:14'),
(154, '7JgHP0LhOt.jpg', 'young-858737_1920.jpg', 55, 1, 0, '2016-12-20 06:27:40', '2016-12-20 06:28:14'),
(155, '2nOc4JUgvQ.jpg', 'adult-1867757_1920.jpg', 56, 1, 0, '2016-12-20 06:43:05', '2016-12-20 06:43:05'),
(156, 'C2C2S9yph8.jpg', 'girl-876698_1920.jpg', 57, 1, 0, '2016-12-20 06:50:00', '2016-12-20 06:50:46');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `old_price` float NOT NULL DEFAULT 0,
  `special` tinyint(1) NOT NULL DEFAULT 0,
  `new` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `category_id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `state`, `created_at`, `updated_at`) VALUES
(1, 'pay_later', NULL, 1, '2017-09-04 01:59:14', '2017-09-04 03:20:27'),
(2, 'cash_on_delivery', NULL, 1, '2017-09-04 01:59:31', '2017-09-04 03:50:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('admin','employee','client') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'client',
  `stripe_customer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `remember_token`, `phone`, `type`, `stripe_customer_id`, `created_at`, `updated_at`) VALUES
(1, 'King', 'Wanyama', 'admin@gmail.com', '$2y$10$Kg8REIVI6JK0M6bR9CC5UuWXbsVyjeypNHX1lJoHsZ/s7d11SAa8O', 'AYTqGWliCMxy4H2lEp56AlhwaBAT6XNDHnlMkcXiVN5XwykPgFW6l6ftoiD2', NULL, 'admin', NULL, '2016-08-24 07:01:42', '2020-05-08 07:24:19'),
(2, 'Jane', 'Smith', 'customer@gmail.com', '$2y$10$DoiJtj/S87w5Gu11myEkfe7BAP0yv6HunmEKWgoQl6.B1Q2ciyulS', 'a9rbo0tNiRcbY4RVmFZ6SL06D2YSKqtpUUydlYW0hXlVdnSEsfmGnUUXgYJd', NULL, 'client', 'cus_9DmvAPp6IE8KBg', '2016-09-19 06:17:37', '2016-09-19 06:46:24'),
(3, 'King', 'Wanyama', 'kingwanyama01@gmail.com', '$2y$10$LofK7dIwal4EyTU.P1O3OOINOY48MCHmqNFdgFc3BgtV9pRd8N0ta', 'xGotw8eTCsg3dXpOSw2GnH1c2a35y4zANefF6vUPZYIpCBLNdwPhaJlBm3Zz', NULL, 'client', NULL, '2020-05-07 14:45:44', '2020-05-07 14:45:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_appointments_appointer_id` (`appointer_id`),
  ADD KEY `idx_appointments_appointee_id` (`appointee_id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_attributes_name` (`name`),
  ADD KEY `idx_attributes_display` (`display`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uri_UNIQUE` (`uri`);

--
-- Indexes for table `calendar_events`
--
ALTER TABLE `calendar_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_calendar_events_start` (`start`),
  ADD KEY `idx_calendar_events_end` (`end`),
  ADD KEY `idx_calendar_events_user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_categories_name` (`name`),
  ADD KEY `idx_categories_uri` (`uri`),
  ADD KEY `idx_categories_parent_id` (`parent_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_UNIQUE` (`code`),
  ADD UNIQUE KEY `idx_coupons_code` (`code`),
  ADD KEY `idx_coupons_type` (`type`),
  ADD KEY `idx_coupons_shipping` (`shipping`),
  ADD KEY `idx_coupons_limited` (`limited`),
  ADD KEY `idx_coupons_active` (`active`);

--
-- Indexes for table `coupon_product`
--
ALTER TABLE `coupon_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_coupon_product_coupon_id` (`coupon_id`),
  ADD KEY `idx_coupon_product_product_id` (`product_id`);

--
-- Indexes for table `custom_order_items`
--
ALTER TABLE `custom_order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_user`
--
ALTER TABLE `group_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_group_user_group_id` (`group_id`),
  ADD KEY `idx_group_user_user_id` (`user_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_inventory_sku` (`sku`),
  ADD KEY `idx_inventory_product_id` (`product_id`);

--
-- Indexes for table `inventory_option`
--
ALTER TABLE `inventory_option`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_inventory_option_inventory_id` (`inventory_id`),
  ADD KEY `idx_inventory_option_option_id` (`option_id`);

--
-- Indexes for table `inventory_order`
--
ALTER TABLE `inventory_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_inventory_order_order_id` (`order_id`),
  ADD KEY `idx_inventory_order_inventory_id` (`inventory_id`),
  ADD KEY `idx_inventory_order_product_name` (`product_name`),
  ADD KEY `idx_inventory_order_sku` (`sku`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_options_name` (`name`),
  ADD KEY `idx_options_attribute_id` (`attribute_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_orders_order_number` (`order_number`),
  ADD UNIQUE KEY `uid_UNIQUE` (`uid`),
  ADD UNIQUE KEY `idx_orders_confirmation_code` (`confirmation_code`),
  ADD KEY `idx_orders_shipping_carrier` (`shipping_carrier`),
  ADD KEY `idx_orders_user_id` (`user_id`),
  ADD KEY `idx_orders_status` (`status`),
  ADD KEY `idx_orders_payment_status` (`payment_status`),
  ADD KEY `idx_orders_payment_method` (`payment_method`),
  ADD KEY `idx_orders_stripe_charge_id` (`stripe_charge_id`),
  ADD KEY `idx_orders_stripe_refund_id` (`stripe_refund_id`),
  ADD KEY `idx_orders_paypal_payment_id` (`paypal_payment_id`),
  ADD KEY `idx_orders_paypal_refund_id` (`paypal_refund_id`),
  ADD KEY `idx_orders_coupon_id` (`coupon_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_reminders_email_index` (`email`),
  ADD KEY `password_reminders_token_index` (`token`);

--
-- Indexes for table `payment_sources`
--
ALTER TABLE `payment_sources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_payment_sources_vendor` (`vendor`),
  ADD KEY `idx_payment_sources_type` (`type`),
  ADD KEY `idx_payment_sources_user_id` (`user_id`),
  ADD KEY `idx_payment_sources_vendor_card_id` (`vendor_card_id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_photos_name` (`name`),
  ADD KEY `idx_photos_original_name` (`original_name`),
  ADD KEY `idx_photos_product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_products_name` (`name`),
  ADD KEY `idx_products_uri` (`uri`),
  ADD KEY `idx_products_special` (`special`),
  ADD KEY `idx_products_new` (`new`),
  ADD KEY `idx_products_category_id` (`category_id`),
  ADD KEY `idx_products_brand_id` (`brand_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_users_first_name` (`first_name`),
  ADD KEY `idx_users_last_name` (`last_name`),
  ADD KEY `idx_users_email` (`email`),
  ADD KEY `idx_users_type` (`type`),
  ADD KEY `idx_users_stripe_customer_id` (`stripe_customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `calendar_events`
--
ALTER TABLE `calendar_events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `coupon_product`
--
ALTER TABLE `coupon_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `custom_order_items`
--
ALTER TABLE `custom_order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_user`
--
ALTER TABLE `group_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_option`
--
ALTER TABLE `inventory_option`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `inventory_order`
--
ALTER TABLE `inventory_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment_sources`
--
ALTER TABLE `payment_sources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
