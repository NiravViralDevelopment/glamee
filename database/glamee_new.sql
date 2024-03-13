-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 16, 2023 at 03:21 PM
-- Server version: 8.0.31
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `glamee_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
CREATE TABLE IF NOT EXISTS `banners` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 for Category,2 for Service',
  `category_id` tinyint(1) DEFAULT NULL,
  `service_id` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `image`, `type`, `category_id`, `service_id`, `created_at`, `updated_at`) VALUES
(5, 'banners-1666944841.jpg', 1, 37, NULL, '2023-08-25 16:31:26', '2023-08-25 11:01:26');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `booking_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `service_id` int NOT NULL,
  `service_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Service Image',
  `service_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` int NOT NULL,
  `provider_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `handyman_id` int DEFAULT NULL,
  `handyman_accept` tinyint(1) DEFAULT NULL COMMENT '1 for Yes,2 for No',
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int NOT NULL DEFAULT '1',
  `duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration_type` tinyint(1) DEFAULT '1' COMMENT '1 for Minutes,2 for Hours,3 for Days',
  `date` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `time` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` tinyint(1) NOT NULL COMMENT '1 For COD,2 For Wallet,3 For RazorPay,4 for Stripe , 5 for Flutterwave',
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amt` double NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 For pending,2 For accepted,3 For completed,4 For Canceled',
  `canceled_by` tinyint(1) DEFAULT NULL COMMENT '1 For Provider,2 For User/Customer',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `booking_id`, `user_id`, `service_id`, `service_image`, `service_name`, `provider_id`, `provider_name`, `handyman_id`, `handyman_accept`, `reason`, `price`, `price_type`, `qty`, `duration`, `duration_type`, `date`, `time`, `address`, `coupon_code`, `discount`, `note`, `payment_type`, `transaction_id`, `total_amt`, `status`, `canceled_by`, `created_at`, `updated_at`) VALUES
(112, 'tGQ4i0ndom', 22, 87, 'service-1639555154.jpeg', 'complementary care such as aromatherapy', 4, 'James Bond', NULL, NULL, NULL, '200', 'Hourly', 1, NULL, NULL, '2021-12-31', '17:25:00', 'Rudraksh\nDistrict of Columbia\n4188 Pennsylvania Avenue\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 200, 1, NULL, '2021-12-21 16:38:29', '2021-12-21 16:38:29'),
(111, 'BtYdUQDuOi', 22, 78, 'service-1639552367.jpeg', 'Pet Fashion Show Services', 31, 'Olive Yew', NULL, NULL, NULL, '200', 'Hourly', 1, NULL, NULL, '2021-12-21', '13:45:00', 'Rudraksh\nDistrict of Columbia\n4188 Pennsylvania Avenue\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 200, 1, NULL, '2021-12-21 15:18:57', '2021-12-21 15:18:57'),
(110, 'sI4uCryfax', 22, 80, 'service-1639552537.jpeg', 'Pet Walker Services', 31, 'Olive Yew', NULL, NULL, NULL, '100', 'Hourly', 1, NULL, NULL, '2021-12-21', '13:45:00', 'Rudraksh\nDistrict of Columbia\n4188 Pennsylvania Avenue\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 100, 1, NULL, '2021-12-21 15:16:27', '2021-12-21 15:16:27'),
(109, 'tDn4RzaHxj', 22, 78, 'service-1639552367.jpeg', 'Pet Fashion Show Services', 31, 'Olive Yew', NULL, NULL, NULL, '200', 'Hourly', 1, NULL, NULL, '2021-12-30', '20:40:00', 'Rudraksh\nDistrict of Columbia\n4188 Pennsylvania Avenue\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 6, 'payment1640070209734', 200, 1, NULL, '2021-12-21 14:03:33', '2021-12-21 14:03:33'),
(108, 'fL4DCGnMZT', 22, 82, 'service-1639553950.jpeg', 'hair colouring service', 4, 'James Bond', NULL, NULL, NULL, '2500', 'Fixed', 1, '5', 2, '2021-12-30', '13:05:00', 'Rudraksh\nDistrict of Columbia\n4188 Pennsylvania Avenue\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 5, '2759615', 2500, 1, NULL, '2021-12-21 14:02:19', '2021-12-21 14:02:19'),
(107, 'AwWiYosULx', 22, 86, 'service-1639554954.jpeg', 'Massages Service', 4, 'James Bond', NULL, NULL, NULL, '2500', 'Fixed', 1, '1', 2, '2021-12-31', '14:10:00', 'Rudraksh\nDistrict of Columbia\n4188 Pennsylvania Avenue\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 4, 'pm_1K92LmLKgWGtoXazCRfKmu6d', 2500, 1, NULL, '2021-12-21 14:01:31', '2021-12-21 14:01:31'),
(106, 'mdY0jPnysq', 22, 87, 'service-1639555154.jpeg', 'complementary care such as aromatherapy', 4, 'James Bond', NULL, NULL, NULL, '200', 'Hourly', 1, NULL, NULL, '2021-12-30', '21:45:00', 'Rudraksh\nDistrict of Columbia\n4188 Pennsylvania Avenue\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 3, 'pay_Ia2DkQvK8o3Y7H', 200, 1, NULL, '2021-12-21 14:00:31', '2021-12-21 14:00:31'),
(105, 'mvi8egaARu', 22, 85, 'service-1639554690.jpeg', 'facials and skin care treatments', 4, 'James Bond', NULL, NULL, NULL, '1200', 'Hourly', 1, NULL, NULL, '2021-12-24', '17:30:00', 'Rudraksh\nDistrict of Columbia\n4188 Pennsylvania Avenue\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 1200, 1, NULL, '2021-12-21 13:59:07', '2021-12-21 13:59:07'),
(103, 'LhEdxy6vtn', 102, 81, 'service-1639552860.jpeg', 'hair-cutting service', 4, 'James Bond', NULL, NULL, NULL, '1500', 'Fixed', 1, '15', 1, '2021-12-22', '06:29:00', 'g wu\nsvoas\nshos\n434843\nafausg@gmail.com', NULL, NULL, NULL, 1, NULL, 1500, 1, NULL, '2021-12-21 12:12:28', '2021-12-21 12:12:28'),
(104, '1AdLDrwOuK', 102, 87, 'service-1639555154.jpeg', 'complementary care such as aromatherapy', 4, 'James Bond', NULL, NULL, NULL, '200', 'Hourly', 1, NULL, NULL, '2021-12-22', '06:30:00', 'gchid dyfuf\nfufifi\nydduf\n8353885728\nydhxx@msn.com', NULL, NULL, NULL, 1, NULL, 200, 1, NULL, '2021-12-21 12:33:52', '2021-12-21 12:33:52'),
(102, '4L83ZCFcQe', 102, 85, 'service-1639554690.jpeg', 'facials and skin care treatments', 4, 'James Bond', NULL, NULL, NULL, '1200', 'Hourly', 1, NULL, NULL, '2021-12-25', '17:29:00', 'gchid dyfuf\nfufifi\nydduf\n8353885728\nydhxx@msn.com', NULL, NULL, NULL, 1, NULL, 1200, 1, NULL, '2021-12-20 20:02:39', '2021-12-20 20:02:39'),
(101, 'nwNtRQuGHY', 22, 81, 'service-1639552860.jpeg', 'hair-cutting service', 4, 'James Bond', NULL, NULL, NULL, '1500', 'Fixed', 1, '15', 1, '2021-12-20', '01:19 PM', 'Omkara\nXYZ Street test landmark- 377700\n1011111010\njoy@gmail.com', NULL, NULL, 'Hello', 1, NULL, 1500, 1, NULL, '2021-12-20 14:50:10', '2021-12-20 14:50:10'),
(100, 'cIZw4LPaep', 105, 81, 'service-1639552860.jpeg', 'hair-cutting service', 4, 'James Bond', NULL, NULL, NULL, '1500', 'Fixed', 1, '15', 1, '2021-12-25', '12:05:00', 'Daniel Martin\nReynauddan\navenue Legendre\n+33 (0)7 47 54 95 99\npgrenier@tele2.fr', NULL, NULL, 'test', 1, NULL, 1500, 1, NULL, '2021-12-20 14:50:05', '2021-12-20 14:50:05'),
(99, 'z61PEJwYpl', 22, 51, 'service-1639813246.jpeg', 'Asian Furniture Designing', 35, 'Carter Joy', 104, 1, NULL, '2000', 'Fixed', 1, '10', 1, '2022-01-01', '04:09 PM', 'Rudraksh\n4188 Pennsylvania Avenue District of Columbia- 20060\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 2000, 3, NULL, '2021-12-18 14:42:43', '2021-12-18 14:55:40'),
(98, 'fSXviAoVxz', 22, 86, 'service-1639554954.jpeg', 'Massages Service', 4, 'James Bond', NULL, NULL, NULL, '2500', 'Fixed', 1, '1', 2, '2021-12-25', '12:53 PM', 'Rudraksh\n4188 Pennsylvania Avenue District of Columbia- 20060\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', 'PUT10', '-20.00', NULL, 1, NULL, 2480, 1, NULL, '2021-12-18 14:24:13', '2021-12-18 14:24:13'),
(97, 'sb37MjAJC6', 22, 50, 'service-1635594948.jpg', 'Pipes Fitting Service', 35, 'Carter Joy', 104, 1, NULL, '1500', 'Hourly', 1, NULL, NULL, '2022-12-31', '12:13 PM', 'Rudraksh\n4188 Pennsylvania Avenue District of Columbia- 20060\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 1500, 3, NULL, '2021-12-18 13:43:50', '2021-12-18 13:56:46'),
(96, 'JP5SKx4bOt', 22, 87, 'service-1639555154.jpeg', 'complementary care such as aromatherapy', 4, 'James Bond', NULL, NULL, NULL, '200', 'Hourly', 1, NULL, NULL, '2021-12-21', '12:11 PM', 'Rudraksh\n4188 Pennsylvania Avenue District of Columbia- 20060\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 200, 1, NULL, '2021-12-18 13:41:16', '2021-12-18 13:41:16'),
(95, 'l0befhMCNz', 22, 49, 'service-1635595003.jpg', 'luxuries Car Washing', 35, 'Carter Joy', 104, 2, 'Testy is a little too late', '1500', 'Hourly', 1, NULL, NULL, '2021-12-18', '12:29 AM', 'Omkara\nXYZ Street test landmark- 377700\n1011111010\njoy@gmail.com', NULL, NULL, NULL, 1, NULL, 1500, 2, NULL, '2021-12-17 18:00:00', '2021-12-21 16:33:29'),
(94, 'jKOV8UkwXC', 22, 50, 'service-1635594948.jpg', 'Pipes Fitting Service', 35, 'Carter Joy', 104, 1, NULL, '1500', 'Hourly', 1, NULL, NULL, '2021-12-18', '06:29 PM', 'Rudraksh\n4188 Pennsylvania Avenue District of Columbia- 20060\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 1500, 3, NULL, '2021-12-17 17:59:39', '2021-12-22 17:01:10'),
(93, 'stzXbci3Ql', 22, 7, 'service-1633611894.jpeg', 'Men\'s Hair Cutting', 6, 'Rock Johnson', 8, 1, NULL, '1500', 'Hourly', 1, NULL, 1, '2021-12-18', '01:53 PM', 'Rudraksh\n4188 Pennsylvania Avenue District of Columbia- 20060\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 1500, 2, NULL, '2021-12-17 15:24:38', '2021-12-21 13:34:22'),
(92, '05HNAWv4Fs', 22, 1, 'service-1634035072.jpg', 'Steam Car Wash', 6, 'Rock Johnson', 9, 1, NULL, '1500', 'Fixed', 1, '2', 1, '2021-12-17', '11:51 AM', 'Rudraksh\n4188 Pennsylvania Avenue District of Columbia- 20060\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 1, NULL, 1500, 3, NULL, '2021-12-17 13:23:06', '2021-12-17 13:26:19'),
(91, '3Rd9jXZ7De', 105, 2, 'service-1634035043.jpg', 'Toughened Glass Fitting Services', 6, 'Rock Johnson', 9, 1, NULL, '1000', 'Fixed', 1, '5', 3, '2021-12-21', '11:46 AM', 'Daniel Martin\navenue Legendre Reynauddan- 25433\n+33 (0)7 47 54 95 99\npgrenier@tele2.fr', NULL, NULL, NULL, 1, NULL, 1000, 3, NULL, '2021-12-15 13:16:30', '2021-12-15 13:17:16'),
(90, 'pYJdlmWZAG', 105, 6, 'service-1633613025.webp', 'Fancy Car Washing', 6, 'Rock Johnson', 9, 1, NULL, '1200', 'Hourly', 1, NULL, 1, '2021-12-23', '11:32 AM', 'Daniel Martin\navenue Legendre Reynauddan- 25433\n+33 (0)7 47 54 95 99\npgrenier@tele2.fr', NULL, NULL, NULL, 1, NULL, 1200, 3, NULL, '2021-12-15 13:06:16', '2021-12-15 13:14:08'),
(89, 'LF6Aq9E3fC', 22, 38, 'service-1635593538.jpg', 'Furniture designing', 3, 'Thomas', NULL, NULL, NULL, '1500', 'Hourly', 1, NULL, NULL, '2022-12-29', '05:42 PM', 'Omkara\nXYZ Street test landmark- 377700\n1011111010\njoy@gmail.com', NULL, NULL, NULL, 1, NULL, 1500, 1, NULL, '2021-12-14 19:12:44', '2021-12-14 19:12:44'),
(88, 'Z6NSQIDLkm', 22, 51, 'service-1635594791.jpg', 'Asian Furniture Designing', 35, 'Carter Joy', 104, 1, NULL, '2000', 'Fixed', 1, '10', 1, '2021-12-18', '01:42 PM', 'Rudraksh\n4188 Pennsylvania Avenue District of Columbia- 20060\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 2000, 3, NULL, '2021-12-14 19:12:23', '2021-12-22 17:01:26'),
(87, 'aTStlgh8MA', 22, 49, 'service-1635595003.jpg', 'luxuries Car Washing', 35, 'Carter Joy', 104, 1, NULL, '1500', 'Hourly', 1, NULL, NULL, '2022-12-29', '10:20 PM', 'Rudraksh\n4188 Pennsylvania Avenue District of Columbia- 20060\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 1500, 3, NULL, '2021-12-14 18:50:33', '2021-12-14 18:50:44'),
(85, 'jxwNvYDgWA', 22, 51, 'service-1635594791.jpg', 'Asian Furniture Designing', 35, 'Carter Joy', 104, 1, NULL, '2000', 'Fixed', 1, '10', 1, '2022-12-28', '04:44 PM', 'Rudraksh\n4188 Pennsylvania Avenue District of Columbia- 20060\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 2000, 3, NULL, '2021-12-14 18:14:30', '2021-12-14 18:15:28'),
(84, '8oH3QAhTkl', 22, 51, 'service-1635594791.jpg', 'Asian Furniture Designing', 35, 'Carter Joy', 104, 1, NULL, '2000', 'Fixed', 1, '10', 1, '2021-12-23', '04:36 PM', 'Omkara\nXYZ Street test landmark- 377700\n1011111010\njoy@gmail.com', NULL, NULL, NULL, 1, NULL, 2000, 3, NULL, '2021-12-14 18:07:14', '2021-12-14 18:12:52'),
(83, 'OfGJoXn5Sc', 22, 51, 'service-1635594791.jpg', 'Asian Furniture Designing', 35, 'Carter Joy', 104, 2, 'Hello hello yes I have a couple of', '2000', 'Fixed', 1, '10', 1, '2022-12-31', '04:20 PM', 'Rudraksh\n4188 Pennsylvania Avenue District of Columbia- 20060\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, 'Hello hi sweetheart thanks again I have been', 1, NULL, 2000, 4, 2, '2021-12-14 17:51:13', '2021-12-14 18:26:14'),
(82, '8eZWH90L7T', 22, 51, 'service-1635594791.jpg', 'Asian Furniture Designing', 35, 'Carter Joy', NULL, NULL, NULL, '2000', 'Fixed', 1, '10', 1, '2021-12-14', '04:20 PM', 'Omkara\nXYZ Street test landmark- 377700\n1011111010\njoy@gmail.com', NULL, NULL, NULL, 1, NULL, 2000, 4, 1, '2021-12-14 17:50:34', '2021-12-14 17:50:42'),
(81, '5zbsJGT3Lj', 22, 51, 'service-1635594791.jpg', 'Asian Furniture Designing', 35, 'Carter Joy', 104, 1, NULL, '2000', 'Fixed', 1, '10', 1, '2021-12-20', '04:09 PM', 'Omkara\nXYZ Street test landmark- 377700\n1011111010\njoy@gmail.com', NULL, NULL, 'Hello hi sweetheart thanks again I have been busy', 1, NULL, 2000, 3, NULL, '2021-12-14 17:39:52', '2021-12-14 17:47:59'),
(80, '4IgpTNfXCn', 22, 51, 'service-1635594791.jpg', 'Asian Furniture Designing', 35, 'Carter Joy', 104, 2, 'Hello Hello Hello Hello I have also received nathi and I will mail it out for the first week thanks you sweetheart I will call him back to google it thanks again thank him thanks so very much thanks again love the day', '2000', 'Fixed', 1, '10', 1, '2021-12-19', '04:05 PM', 'Omkara\nXYZ Street test landmark- 377700\n1011111010\njoy@gmail.com', NULL, NULL, NULL, 1, NULL, 2000, 4, 1, '2021-12-14 17:35:50', '2021-12-14 17:37:55'),
(79, 'ho0BxD6EKV', 22, 49, 'service-1635595003.jpg', 'luxuries Car Washing', 35, 'Carter Joy', 104, 2, 'Hello Hello yes yes let’s go for the birthday celebration on the way back home I have already left a few', '1500', 'Hourly', 1, NULL, NULL, '2021-12-14', '03:57 PM', 'Omkara\nXYZ Street test landmark- 377700\n1011111010\njoy@gmail.com', NULL, NULL, NULL, 1, NULL, 1500, 4, 1, '2021-12-14 17:27:48', '2021-12-14 17:38:05'),
(86, 'liVZ0WRnjs', 22, 51, 'service-1635594791.jpg', 'Asian Furniture Designing', 35, 'Carter Joy', 104, 1, NULL, '2000', 'Fixed', 1, '10', 1, '2021-12-16', '01:00 AM', 'Rudraksh\n4188 Pennsylvania Avenue District of Columbia- 20060\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 2000, 3, NULL, '2021-12-14 18:30:53', '2021-12-22 11:45:38'),
(78, 'AUj54pfvtn', 22, 50, 'service-1635594948.jpg', 'Pipes Fitting Service', 35, 'Carter Joy', NULL, NULL, NULL, '1500', 'Hourly', 1, NULL, NULL, '2021-12-15', '11:16 AM', 'Rudraksh, 3uqdi9vh7ve@temporary-mail.net, 732-387-4768, 4188 Pennsylvania Avenue, District of Columbia, 20060', NULL, NULL, '', 1, NULL, 1500, 4, 1, '2021-12-14 12:43:28', '2021-12-14 17:48:39'),
(60, 'Mo0ARuWIlL', 102, 51, 'service-1635594791.jpg', 'Asian Furniture Designing', 35, 'Carter Joy', NULL, NULL, NULL, '2000', 'Fixed', 1, '10', 1, '2021-12-11', '00:00:00', '<p>Hardik Sardhar\nMota varachha\nYogi Chowk\n7485968596\ndummy@yopmail.com</p>', NULL, NULL, NULL, 1, NULL, 2000, 4, 1, '2021-12-10 13:14:05', '2021-12-10 14:36:17'),
(76, 'rMGL43vsHT', 22, 51, 'service-1635594791.jpg', 'Asian Furniture Designing', 35, 'Carter Joy', 103, 1, NULL, '2000', 'Fixed', 1, '10', 1, '2022-12-30', '02:36 PM', 'Omkara\nXYZ Street test landmark- 377700\n1011111010\njoy@gmail.com', NULL, NULL, NULL, 1, NULL, 2000, 2, NULL, '2021-12-13 16:06:11', '2021-12-13 16:06:20'),
(75, 'g3ItTpN6Lw', 22, 51, 'service-1635594791.jpg', 'Asian Furniture Designing', 35, 'Carter Joy', 75, 2, 'Hello I have to get the car out of the truck I will send a pic and you know how I', '2000', 'Fixed', 1, '10', 1, '2021-12-25', '11:51 AM', 'Omkara\nXYZ Street test landmark- 377700\n1011111010\njoy@gmail.com', NULL, NULL, NULL, 1, NULL, 2000, 4, 1, '2021-12-13 13:21:40', '2021-12-13 15:49:16'),
(74, 'thsfniXedK', 22, 50, 'service-1635594948.jpg', 'Pipes Fitting Service', 35, 'Carter Joy', 75, 1, NULL, '1500', 'Hourly', 1, NULL, NULL, '2021-12-15', '06:09 PM', 'Rudraksh\n4188 Pennsylvania Avenue District of Columbia- 20060\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 1500, 3, NULL, '2021-12-11 19:39:18', '2021-12-11 19:40:02'),
(73, '8c6gmzTijb', 22, 51, 'service-1635594791.jpg', 'Asian Furniture Designing', 35, 'Carter Joy', 75, 2, 'Hello', '2000', 'Fixed', 1, '10', 1, '2021-12-12', '05:38 AM', 'Rudraksh\n4188 Pennsylvania Avenue District of Columbia- 20060\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 2000, 4, 1, '2021-12-11 19:10:09', '2021-12-13 15:49:30'),
(72, '4WSPBYDZVH', 22, 51, 'service-1635594791.jpg', 'Asian Furniture Designing', 35, 'Carter Joy', 75, 2, 'Specify reason', '2000', 'Fixed', 1, '10', 1, '2021-12-17', '05:34 PM', 'Omkara\nXYZ Street test landmark- 377700\n1011111010\njoy@gmail.com', NULL, NULL, NULL, 1, NULL, 2000, 4, 1, '2021-12-11 19:05:02', '2021-12-13 15:55:32'),
(71, 'noN9jAykI1', 22, 51, 'service-1635594791.jpg', 'Asian Furniture Designing', 35, 'Carter Joy', 75, 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lore', '2000', 'Fixed', 1, '10', 1, '2021-12-22', '03:03 PM', 'Rudraksh\n4188 Pennsylvania Avenue District of Columbia- 20060\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 2000, 4, 1, '2021-12-11 16:34:05', '2021-12-13 16:01:10'),
(70, 'oP2cVmNfHd', 22, 51, 'service-1635594791.jpg', 'Asian Furniture Designing', 35, 'Carter Joy', 75, 1, NULL, '2000', 'Fixed', 1, '10', 1, '2021-12-11', '03:01 PM', 'Omkara\nXYZ Street test landmark- 377700\n1011111010\njoy@gmail.com', NULL, NULL, NULL, 1, NULL, 2000, 3, NULL, '2021-12-11 16:31:26', '2021-12-11 16:32:04'),
(69, '5xG3zDuOlH', 22, 50, 'service-1635594948.jpg', 'Pipes Fitting Service', 35, 'Carter Joy', 75, 1, NULL, '1500', 'Hourly', 1, NULL, NULL, '2021-12-11', '02:56 PM', 'Omkara\nXYZ Street test landmark- 377700\n1011111010\njoy@gmail.com', NULL, NULL, NULL, 1, NULL, 1500, 3, NULL, '2021-12-11 16:26:19', '2021-12-11 16:26:37'),
(113, 'EbHNfhFR51', 22, 67, 'service-1639550538.jpeg', 'Aquarium Cleaning', 32, 'Peg Legge', NULL, NULL, NULL, '2500', 'Fixed', 1, '30', 3, '2021-12-22', '15:44:00', 'Omkara\ntest landmark\nXYZ Street\n1011111010\njoy@gmail.com', NULL, NULL, NULL, 1, NULL, 2500, 1, NULL, '2021-12-21 17:14:39', '2021-12-21 17:14:39'),
(114, 'kqLsF3haDV', 22, 86, 'service-1639554954.jpeg', 'Massages Service', 4, 'James Bond', NULL, NULL, NULL, '2500', 'Fixed', 1, '1', 2, '2021-12-21', '06:30 PM', 'Omkara\ntest landmark\nXYZ Street\n1011111010\njoy@gmail.com', NULL, NULL, NULL, 1, NULL, 2500, 1, NULL, '2021-12-21 17:29:17', '2021-12-21 17:29:17'),
(115, 'CTRfQSjd81', 22, 79, 'service-1639552467.jpeg', 'Pet Transportation Services.', 31, 'Olive Yew', NULL, NULL, NULL, '500', 'Hourly', 1, NULL, NULL, '2021-12-22', '05:16 PM', 'Rudraksh\nDistrict of Columbia\n4188 Pennsylvania Avenue\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 500, 1, NULL, '2021-12-21 18:46:53', '2021-12-21 18:46:53'),
(116, '6FB3raTUdy', 22, 49, 'service-1635595003.jpg', 'luxuries Car Washing', 35, 'Carter Joy', 104, 1, NULL, '1500', 'Hourly', 1, NULL, NULL, '2021-12-22', '06:30 PM', 'Rudraksh\nDistrict of Columbia\n4188 Pennsylvania Avenue\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 1500, 3, NULL, '2021-12-21 18:47:24', '2021-12-22 13:01:25'),
(120, 'xum2XHB1nv', 22, 50, 'service-1635594948.jpg', 'Pipes Fitting Service', 35, 'Carter Joy', 104, 1, NULL, '1500', 'Hourly', 1, NULL, NULL, '2021-12-22', '03:15 PM', 'Rudraksh\nDistrict of Columbia\n4188 Pennsylvania Avenue\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 1500, 3, NULL, '2021-12-22 16:43:32', '2021-12-22 16:45:11'),
(117, 'dixBpMqHaY', 22, 50, 'service-1635594948.jpg', 'Pipes Fitting Service', 35, 'Carter Joy', 104, 2, 'Hello hello yes hello', '1500', 'Hourly', 1, NULL, NULL, '2022-12-29', '06:16 AM', 'Rudraksh\n4188 Pennsylvania Avenue District of Columbia- 20060\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 1500, 4, 1, '2021-12-22 11:46:57', '2021-12-22 11:48:35'),
(118, 'vlMmiOxXd7', 22, 51, 'service-1639813246.jpeg', 'Asian Furniture Designing', 35, 'Carter Joy', 103, 1, NULL, '2000', 'Fixed', 1, '10', 1, '2021-12-24', '10:40 AM', 'Rudraksh\nDistrict of Columbia\n4188 Pennsylvania Avenue\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 2000, 2, NULL, '2021-12-22 12:10:46', '2021-12-22 12:12:39'),
(119, 'KFHTq84sa2', 22, 50, 'service-1635594948.jpg', 'Pipes Fitting Service', 35, 'Carter Joy', NULL, NULL, NULL, '1500', 'Hourly', 1, NULL, NULL, '2021-12-31', '06:30 AM', 'Rudraksh\nDistrict of Columbia\n4188 Pennsylvania Avenue\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 1500, 4, 1, '2021-12-22 12:23:37', '2021-12-22 12:54:34'),
(121, '59hWI1zSbc', 22, 29, 'service-1633611624.jpeg', 'Spa Service at Home', 6, 'Rock Johnson', 9, 1, NULL, '4600', 'Fixed', 1, '10', 1, '2021-12-22', '03:15 PM', 'Rudraksh\nDistrict of Columbia\n4188 Pennsylvania Avenue\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 4600, 3, NULL, '2021-12-22 16:51:19', '2021-12-22 17:04:04'),
(122, 'FyAOgCd50D', 22, 7, 'service-1633611894.jpeg', 'Men\'s Hair Cutting', 6, 'Rock Johnson', NULL, NULL, NULL, '1500', 'Hourly', 1, NULL, 1, '2021-12-22', '03:15 PM', 'Hardik  Sardhara\nSurat Gujarat India\nSiva Darshan Society Yogi chowk simada\n74052123456\nHardik@gmail.com', NULL, NULL, NULL, 1, NULL, 1500, 4, 1, '2021-12-22 17:12:37', '2021-12-22 17:12:50'),
(123, 'VMkmjnpUQW', 22, 6, 'service-1633613025.webp', 'Fancy Car Washing', 6, 'Rock Johnson', 9, 1, NULL, '1200', 'Hourly', 1, NULL, 1, '2021-12-31', '05:24 PM', 'Rudraksh\nDistrict of Columbia\n4188 Pennsylvania Avenue\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 1200, 3, NULL, '2021-12-22 17:16:13', '2021-12-22 17:17:00'),
(124, '5ofHtzMXTw', 22, 7, 'service-1633611894.jpeg', 'Men\'s Hair Cutting', 6, 'Rock Johnson', NULL, NULL, NULL, '1500', 'Hourly', 1, NULL, 1, '2021-12-30', '03:15 PM', 'Rudraksh\nDistrict of Columbia\n4188 Pennsylvania Avenue\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 1500, 4, 1, '2021-12-22 17:19:26', '2021-12-22 17:19:40'),
(125, 'xI6at37s4M', 22, 1, 'service-1634035072.jpg', 'Steam Car Wash', 6, 'Rock Johnson', 9, 1, NULL, '1500', 'Fixed', 1, '2', 1, '2021-12-23', '05:25 PM', 'Omkara\ntest landmark\nXYZ Street\n1011111010\njoy@gmail.com', NULL, NULL, NULL, 1, NULL, 1500, 3, NULL, '2021-12-22 17:51:15', '2021-12-22 17:51:50'),
(126, 'H3wEoM0yjV', 22, 29, 'service-1633611624.jpeg', 'Spa Service at Home', 6, 'Rock Johnson', 9, 1, NULL, '4600', 'Fixed', 1, '10', 1, '2021-12-23', '05:30 PM', 'Rudraksh\nDistrict of Columbia\n4188 Pennsylvania Avenue\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 4600, 3, NULL, '2021-12-22 17:53:23', '2021-12-22 17:53:50'),
(127, 'lKhRtG8JvW', 22, 2, 'service-1634035043.jpg', 'Toughened Glass Fitting Services', 6, 'Rock Johnson', NULL, NULL, NULL, '1000', 'Fixed', 1, '5', 3, '2021-12-23', '06:30 PM', 'Hardik  Sardhara\nSurat Gujarat India\nSiva Darshan Society Yogi chowk simada\n74052123456\nHardik@gmail.com', NULL, NULL, NULL, 1, NULL, 1000, 4, 1, '2021-12-22 17:56:31', '2021-12-22 17:57:18'),
(128, '9QdJTlrnoq', 22, 7, 'service-1633611894.jpeg', 'Men\'s Hair Cutting', 6, 'Rock Johnson', NULL, NULL, NULL, '1500', 'Hourly', 1, NULL, 1, '2021-12-23', '10:50 PM', 'Omkara\ntest landmark\nXYZ Street\n1011111010\njoy@gmail.com', NULL, NULL, NULL, 1, NULL, 1500, 4, 1, '2021-12-22 18:00:29', '2021-12-22 18:00:45'),
(129, 'rjLhO25vfN', 22, 6, 'service-1633613025.webp', 'Fancy Car Washing', 6, 'Rock Johnson', 8, 1, NULL, '1200', 'Hourly', 1, NULL, 1, '2021-12-22', '06:30 PM', 'Hardik  Sardhara\nSurat Gujarat India\nSiva Darshan Society Yogi chowk simada\n74052123456\nHardik@gmail.com', NULL, NULL, NULL, 1, NULL, 1200, 3, NULL, '2021-12-22 18:01:45', '2021-12-22 18:04:06'),
(130, 'Fj1mCHzSiO', 22, 7, 'service-1633611894.jpeg', 'Men\'s Hair Cutting', 6, 'Rock Johnson', 9, 2, 'jughj', '1500', 'Hourly', 1, NULL, 1, '2021-12-24', '06:30 PM', 'Rudraksh\nDistrict of Columbia\n4188 Pennsylvania Avenue\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 1500, 4, 1, '2021-12-22 18:08:31', '2021-12-22 18:19:27'),
(131, '8hrOb5wNPM', 22, 7, 'service-1633611894.jpeg', 'Men\'s Hair Cutting', 6, 'Rock Johnson', 9, 2, 'jvviv', '1500', 'Hourly', 1, NULL, 1, '2021-12-25', '06:29 PM', 'Rudraksh\nDistrict of Columbia\n4188 Pennsylvania Avenue\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 1500, 3, NULL, '2021-12-22 18:10:13', '2021-12-22 18:12:10'),
(132, 'i1yN9ZuWta', 22, 50, 'service-1635594948.jpg', 'Pipes Fitting Service', 35, 'Carter Joy', NULL, 2, 'Hello hello hi sweetheart hi thanks you', '1500', 'Hourly', 1, NULL, NULL, '2022-01-05', '04:50 PM', 'Rudraksh\n4188 Pennsylvania Avenue District of Columbia- 20060\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 1500, 2, NULL, '2021-12-22 18:20:59', '2021-12-22 18:21:24'),
(133, 'Xt27Cckx6M', 22, 7, 'service-1633611894.jpeg', 'Men\'s Hair Cutting', 6, 'Rock Johnson', 9, 1, NULL, '1500', 'Hourly', 1, NULL, 1, '2021-12-26', '06:30 PM', 'Hardik  Sardhara\nSurat Gujarat India\nSiva Darshan Society Yogi chowk simada\n74052123456\nHardik@gmail.com', NULL, NULL, NULL, 1, NULL, 1500, 2, NULL, '2021-12-22 18:20:59', '2021-12-23 12:05:12'),
(134, 'lxeFAjzC1f', 22, 29, 'service-1633611624.jpeg', 'Spa Service at Home', 6, 'Rock Johnson', 9, 1, NULL, '4600', 'Fixed', 1, '10', 1, '2021-12-27', '06:30 PM', 'Hardik  Sardhara\nSurat Gujarat India\nSiva Darshan Society Yogi chowk simada\n74052123456\nHardik@gmail.com', NULL, NULL, NULL, 1, NULL, 4600, 2, NULL, '2021-12-22 18:22:30', '2021-12-22 18:24:49'),
(135, 'Av36XfwGod', 22, 1, 'service-1634035072.jpg', 'Steam Car Wash', 6, 'Rock Johnson', NULL, 2, 'vdkdhdc', '1500', 'Fixed', 1, '2', 1, '2022-01-31', '06:30 AM', 'Hardik  Sardhara\nSurat Gujarat India\nSiva Darshan Society Yogi chowk simada\n74052123456\nHardik@gmail.com', NULL, NULL, NULL, 1, NULL, 1500, 2, NULL, '2021-12-23 12:06:24', '2021-12-23 12:38:03'),
(136, 'TD3xRUZzSF', 22, 29, 'service-1633611624.jpeg', 'Spa Service at Home', 6, 'Rock Johnson', 9, 1, NULL, '4600', 'Fixed', 1, '10', 1, '2022-01-01', '12:00 AM', 'Hardik  Sardhara\nSurat Gujarat India\nSiva Darshan Society Yogi chowk simada\n74052123456\nHardik@gmail.com', NULL, NULL, NULL, 1, NULL, 4600, 3, NULL, '2021-12-23 13:21:36', '2021-12-23 13:22:04'),
(137, 'xpYOszUVbi', 22, 2, 'service-1634035043.jpg', 'Toughened Glass Fitting Services', 6, 'Rock Johnson', NULL, NULL, NULL, '1000', 'Fixed', 1, '5', 3, '2022-01-01', '06:00 AM', 'Rudraksh\nDistrict of Columbia\n4188 Pennsylvania Avenue\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 1000, 4, 1, '2021-12-23 13:23:03', '2021-12-23 13:23:20'),
(138, 'H5NrIwM27K', 22, 1, 'service-1634035072.jpg', 'Steam Car Wash', 6, 'Rock Johnson', NULL, 2, 'I am not available', '1500', 'Fixed', 1, '2', 1, '2022-01-01', '12:00 AM', 'Rudraksh\nDistrict of Columbia\n4188 Pennsylvania Avenue\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 1500, 2, NULL, '2021-12-23 13:24:13', '2021-12-23 13:24:43'),
(139, 'j041FQvNay', 22, 6, 'service-1633613025.webp', 'Fancy Car Washing', 6, 'Rock Johnson', 9, 1, NULL, '1200', 'Hourly', 1, NULL, 1, '2022-01-01', '12:00 AM', 'Hardik  Sardhara\nSurat Gujarat India\nSiva Darshan Society Yogi chowk simada\n74052123456\nHardik@gmail.com', NULL, NULL, NULL, 1, NULL, 1200, 3, NULL, '2021-12-23 13:27:46', '2021-12-23 13:28:08'),
(140, 'ydD5u287NC', 22, 7, 'service-1633611894.jpeg', 'Men\'s Hair Cutting', 6, 'Rock Johnson', NULL, NULL, NULL, '1500', 'Hourly', 1, NULL, 1, '2022-01-02', '12:00 AM', 'Rudraksh\nDistrict of Columbia\n4188 Pennsylvania Avenue\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 1500, 4, 1, '2021-12-23 13:29:14', '2021-12-23 13:29:24'),
(141, 'Y6LJdKcyxl', 22, 2, 'service-1634035043.jpg', 'Toughened Glass Fitting Services', 6, 'Rock Johnson', NULL, 2, 'uvuud', '1000', 'Fixed', 1, '5', 3, '2022-01-03', '12:01 PM', 'Omkara\ntest landmark\nXYZ Street\n1011111010\njoy@gmail.com', NULL, NULL, NULL, 1, NULL, 1000, 2, NULL, '2021-12-23 13:30:15', '2021-12-23 13:45:25'),
(142, '1qCnWtdSxR', 22, 7, 'service-1633611894.jpeg', 'Men\'s Hair Cutting', 6, 'Rock Johnson', 9, 1, NULL, '1500', 'Hourly', 1, NULL, 1, '2022-01-04', '12:00 PM', 'Rudraksh\nDistrict of Columbia\n4188 Pennsylvania Avenue\n732-387-4768\n3uqdi9vh7ve@temporary-mail.net', NULL, NULL, NULL, 1, NULL, 1500, 2, NULL, '2021-12-23 13:34:37', '2021-12-23 13:38:16'),
(143, '1SHLTG2wv0', 22, 2, 'service-1634035043.jpg', 'Toughened Glass Fitting Services', 6, 'Rock Johnson', NULL, 2, 'bjbkvig', '1000', 'Fixed', 1, '5', 3, '2022-01-05', '06:28 PM', 'Omkara\ntest landmark\nXYZ Street\n1011111010\njoy@gmail.com', NULL, NULL, NULL, 1, NULL, 1000, 2, NULL, '2021-12-23 13:39:26', '2021-12-23 13:43:57'),
(144, '0GpTEBa6DP', 22, 6, 'service-1633613025.webp', 'Fancy Car Washing', 6, 'Rock Johnson', NULL, NULL, NULL, '1200', 'Hourly', 1, NULL, 1, '2022-01-09', '03:15 PM', 'Omkara\ntest landmark\nXYZ Street\n1011111010\njoy@gmail.com', NULL, NULL, NULL, 1, NULL, 1200, 1, NULL, '2021-12-23 17:37:38', '2021-12-23 17:37:38'),
(145, 'pWRnerxLGo', 109, 84, 'service-1639554593.jpeg', 'Nail treatments', 4, 'James Bond', NULL, NULL, NULL, '100', 'Hourly', 1, NULL, NULL, '2022-10-26', '11:34 PM', 'sunny kumar\r\n844121\r\nlalganj\r\n7004344748\r\nstephensunny921@gmail.com', NULL, NULL, NULL, 3, 'pay_KYUcAc0iv0yHzM', 100, 1, NULL, '2022-10-26 12:35:25', '2022-10-26 12:35:25'),
(146, '7D4ImQlMyE', 113, 84, 'service-1639554593.jpeg', 'Nail treatments', 4, 'James Bond', NULL, NULL, NULL, '100', 'Hourly', 1, NULL, NULL, '2022-10-29', '12:23 AM', 'Sunny, stephensunny921@gmail.com, 7004344748, lalganj, Near Mall, 844121', NULL, NULL, '', 1, NULL, 100, 1, NULL, '2022-10-29 00:23:24', '2022-10-29 00:23:24'),
(147, 'HDbu9vg2SA', 113, 84, 'service-1639554593.jpeg', 'Nail treatments', 4, 'James Bond', NULL, NULL, NULL, '100', 'Hourly', 1, NULL, NULL, '2022-10-29', '12:23 AM', 'Sunny, stephensunny921@gmail.com, 7004344748, lalganj, Near Mall, 844121', NULL, NULL, '', 1, NULL, 100, 1, NULL, '2022-10-29 00:31:46', '2022-10-29 00:31:46'),
(148, 'KHNk6gneRy', 113, 84, 'service-1639554593.jpeg', 'Nail treatments', 4, 'James Bond', NULL, NULL, NULL, '100', 'Hourly', 1, NULL, NULL, '2022-10-29', '12:23 AM', 'Sunny, stephensunny921@gmail.com, 7004344748, lalganj, Near Mall, 844121', NULL, NULL, '', 1, NULL, 100, 1, NULL, '2022-10-29 01:17:33', '2022-10-29 01:17:33'),
(149, 'HJRALBU5hk', 123, 89, 'service-1694887047.jpg', 'city', 122, 'rajkot', NULL, NULL, NULL, '50', 'Hourly', 1, '1', 2, '2023-09-16', '11:37 PM', 'viral kumar, school@mailinator.com, 09574535297, A T-shirt, or tee shirt, is a style of fabric shirt named after the T shape of its body and sleeves. Traditionally, it has short sleeves and a round neckline, known as a crew neck, which lacks a collar. T-s', NULL, NULL, '', 4, 'ch_1Nr2u2LKgWGtoXazAv3LgG9C', 50, 1, NULL, '2023-09-16 12:37:38', '2023-09-16 12:37:38');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_available` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1 for Yes,2 for No',
  `is_featured` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1 for Yes,2 for No',
  `is_deleted` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1 for Yes,2 for No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `slug`, `is_available`, `is_featured`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'Ac Repairs', 'category-1638941676.png', 'ac-repairs', '1', '1', '1', '2021-09-17 04:30:58', '2023-01-19 08:52:09'),
(2, 'TV Repairs', 'category-1633931836.png', 'TV-Repairs', '1', '2', '1', '2021-09-17 04:31:28', '2021-11-09 00:34:06'),
(5, 'Plumbing', 'category-1638941637.png', 'plumbing', '1', '1', '1', '2021-09-17 04:38:01', '2023-01-19 08:52:54'),
(7, 'Painting', 'category-1638941566.png', 'painting', '1', '1', '1', '2021-09-18 05:05:01', '2023-01-19 08:52:48'),
(8, 'Other Category', 'category-1633932108.png', 'Other-Category', '1', '2', '1', '2021-09-21 04:36:02', '2021-10-11 13:01:48'),
(35, 'Spa & massage', 'category-1638941532.png', 'spa-massage', '1', '1', '2', '2021-10-05 17:37:18', '2021-12-08 12:32:12'),
(36, 'Hair & Cut', 'category-1638941493.png', 'hair-cut', '1', '1', '2', '2021-10-05 17:38:26', '2023-01-19 08:55:41'),
(37, 'Cleaning', 'category-1638941406.png', 'cleaning', '1', '1', '1', '2021-10-05 17:39:28', '2023-01-19 08:52:19'),
(38, 'Washing', 'category-1638941373.png', 'washing', '1', '1', '1', '2021-10-05 17:41:03', '2023-01-19 08:56:11'),
(39, 'Furnishing', 'category-1638941233.png', 'furnishing', '1', '1', '1', '2021-10-05 19:21:49', '2023-01-19 08:52:35'),
(41, 'Furnishing', 'category-1637144057.png', 'furnishing-40', '1', '1', '1', '2021-11-17 04:44:17', '2021-11-17 05:02:51'),
(42, 'Footware 123', 'category-1638170336.png', 'footware-123', '1', '1', '1', '2021-11-29 14:18:56', '2021-11-29 14:19:40'),
(43, 'Babysitting', 'category-1638942072.png', 'babysitting', '1', '1', '1', '2021-12-08 12:41:12', '2023-01-19 08:55:58'),
(44, 'Make up', 'category-1674138249.jpg', 'make-up', '1', '1', '2', '2021-12-08 12:41:58', '2023-01-19 08:54:09'),
(45, 'Beauty', 'category-1639809152.png', 'beauty', '1', '2', '1', '2021-12-18 13:32:32', '2021-12-18 13:32:50'),
(46, 'Beauty', 'category-1639809200.jpeg', 'beauty-46', '1', '2', '1', '2021-12-18 13:33:20', '2021-12-18 13:33:53'),
(47, 'Beauty', 'category-1639809223.png', 'beauty-47', '1', '2', '1', '2021-12-18 13:33:43', '2021-12-18 13:33:51'),
(48, 'Facials and skin care treatments', 'category-1674138707.jpg', 'facials-and-skin-care-treatments', '1', '2', '2', '2023-01-19 08:58:00', '2023-01-19 09:23:33'),
(49, 'viral kumar', 'category-1694789257.jpg', 'viral-kumar', '1', '1', '2', '2023-09-15 09:17:37', '2023-09-15 09:17:37'),
(50, 'viral kumar', 'category-1694969377.jpg', 'viral-kumar-50', '1', '1', '2', '2023-09-17 11:19:37', '2023-09-17 11:19:37'),
(51, '324234', 'category-1694969397.jpg', '324234', '1', '1', '2', '2023-09-17 11:19:57', '2023-09-17 11:19:57'),
(52, 'wqeqwe', 'category-1694969552.jpg', 'wqeqwe', '1', '1', '2', '2023-09-17 11:22:32', '2023-09-17 11:22:32'),
(53, '345435', 'category-1694970068.jpg', '345435', '1', '1', '2', '2023-09-17 11:31:08', '2023-09-17 11:31:08'),
(54, 'viral kumar', 'category-1694970210.jpg', 'viral-kumar-54', '1', '1', '2', '2023-09-17 11:33:30', '2023-09-17 11:33:30'),
(55, '534534', 'category-1694970273.jpg', '534534', '1', '1', '2', '2023-09-17 11:34:33', '2023-09-17 11:34:33'),
(56, 'viral kumar', '1695315935.jpg', NULL, '1', '1', NULL, '2023-09-21 11:16:12', '2023-09-21 11:35:35'),
(58, 'disma', '1695315046.jpg', NULL, NULL, NULL, NULL, '2023-09-21 11:20:46', '2023-09-21 11:20:46'),
(59, 'Yovi', '1695315213.jpg', NULL, '1', '1', NULL, '2023-09-21 11:23:33', '2023-09-21 11:28:05');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_city.png',
  `is_available` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL COMMENT '1 for Yes,2 for No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `image`, `is_available`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'los angeles', 'city-1639653036.png', 1, 2, NULL, '2021-12-16 18:10:36'),
(5, 'Atlanta', 'city-1639653173.png', 1, 2, '2021-09-18 01:07:36', '2021-12-16 18:12:56'),
(8, 'Chicago', 'city-1639652537.png', 1, 2, '2021-09-18 03:47:24', '2021-12-16 18:02:17'),
(9, 'Omaha', 'city-1633585012.png', 1, 2, '2021-09-18 03:47:31', '2021-12-16 18:13:21'),
(10, 'Goa', 'city-1633585465.png', 2, 1, '2021-09-18 03:47:37', '2021-11-10 04:53:04'),
(11, 'Aagra', 'city-1633585087.png', 1, 2, '2021-09-20 07:19:05', '2021-10-07 12:38:07'),
(12, 'Oakland', 'city-1633602700.png', 1, 2, '2021-09-20 07:19:49', '2021-12-16 18:13:39'),
(13, 'Dallas', 'city-1633602814.png', 1, 2, '2021-09-20 07:20:21', '2021-12-16 18:14:05'),
(14, 'Morbi', 'images(6)-Copy-Copy.jpg', 1, 1, '2021-09-20 07:20:27', '2021-09-21 04:59:05'),
(15, 'Nadiyad123', 'images(6)-Copy.jpg', 2, 1, '2021-09-20 07:20:35', '2021-10-07 12:45:14'),
(16, 'Las Vegas', 'city-1633585782.png', 1, 2, '2021-09-20 07:20:41', '2021-12-16 18:14:19'),
(17, 'Wichita', 'city-1633585812.png', 1, 2, '2021-09-20 07:20:48', '2021-12-16 18:14:53'),
(18, 'Botad', 'images-Copy(2).png', 1, 1, '2021-09-20 07:21:10', '2021-09-21 05:00:50'),
(19, 'Lincoln', 'city-1633585957.png', 1, 2, '2021-09-20 07:21:16', '2021-12-16 18:15:05'),
(20, 'Boise', 'city-1633586146.png', 1, 2, '2021-09-20 07:21:23', '2021-12-16 18:15:23'),
(21, 'Veraval', 'images.png', 1, 1, '2021-09-20 07:21:28', '2021-09-21 04:58:46'),
(22, 'California', 'city-1639653019.png', 1, 2, '2021-10-04 14:49:35', '2021-12-16 18:10:19'),
(23, 'New York', 'city-1638945054.png', 1, 1, '2021-12-08 13:30:54', '2021-12-16 17:59:46'),
(24, 'Bihar', 'city-1666940341.png', 1, 1, '2022-10-28 01:29:01', '2022-10-28 02:49:35'),
(25, '5464566', 'city-1694789232.jpg', 2, 1, '2023-09-15 09:17:12', '2023-09-15 09:17:27'),
(26, 'viral kumar 23345', 'city-1696261554.jpg', 1, 1, '2023-10-02 10:05:00', '2023-10-02 10:19:27');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `service_id` tinyint(1) NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_type` tinyint(1) NOT NULL COMMENT '1 For Fixed,2 For Percentage',
  `discount` int NOT NULL,
  `start_date` date NOT NULL,
  `expire_date` date NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_available` tinyint(1) NOT NULL COMMENT '1 For yes,2 For No',
  `is_deleted` tinyint(1) NOT NULL COMMENT '1 For Yes,2 For No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `service_id`, `code`, `discount_type`, `discount`, `start_date`, `expire_date`, `description`, `is_available`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 3, 'Get-31', 1, 20, '2021-10-24', '2021-10-31', 'Select Coupon And get Discount ...', 1, 1, '2021-09-21 02:24:01', '2023-01-19 09:05:28'),
(2, 4, 'GET-50', 1, 50, '2021-09-30', '2021-09-29', 'Select Coupon And get Discount ...', 1, 2, '2021-09-21 03:11:47', '2021-09-21 05:49:15'),
(3, 2, 'Get-21', 1, 20, '2021-10-09', '2021-11-30', 'Select Coupon And get Discount ...', 1, 2, '2021-10-26 03:50:27', '2021-11-30 05:49:11'),
(8, 2, 'Get-22', 2, 20, '2021-10-09', '2021-11-25', 'Select Coupon And get Discount ...', 1, 2, '2021-10-26 03:50:27', '2021-11-30 05:49:11'),
(5, 7, 'Get-71', 1, 30, '2021-09-23', '2021-11-30', 'Select Coupon And get Discount ...', 1, 2, '2021-09-21 05:48:27', '2021-09-21 05:49:18'),
(7, 7, 'Get-72', 2, 30, '2021-10-24', '2021-11-30', 'Select Coupon And get Discount ...', 1, 2, '2021-09-21 02:24:01', '2021-10-02 18:37:07'),
(9, 35, 'Get-351', 1, 50, '2021-09-23', '2021-11-30', 'Select Coupon And get Discount ...', 1, 2, '2021-09-21 05:48:27', '2021-11-16 04:01:58'),
(10, 35, 'Get-352', 2, 100, '2021-11-17', '2021-12-04', 'Select Coupon And get Discount ...', 1, 1, '2021-09-21 05:48:27', '2021-11-30 16:57:37'),
(11, 29, 'Get-291', 1, 30, '2021-09-23', '2021-11-30', 'Select Coupon And get Discount ...', 1, 2, '2021-09-21 05:48:27', '2021-09-21 05:49:18'),
(12, 29, 'Get-292', 2, 30, '2021-09-23', '2021-11-30', 'Select Coupon And get Discount ...', 1, 2, '2021-09-21 05:48:27', '2021-09-21 05:49:18'),
(13, 30, 'Get-301', 1, 30, '2021-09-23', '2021-11-30', 'Select Coupon And get Discount ...', 1, 1, '2021-09-21 05:48:27', '2023-01-19 09:05:21'),
(14, 6, 'Get-302', 2, 30, '2021-12-11', '2021-12-31', 'Select Coupon And get Discount ...', 1, 1, '2021-09-21 05:48:27', '2023-01-19 09:05:16'),
(15, 86, 'PUT10', 1, 10, '2021-12-18', '2022-01-18', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem', 1, 1, '2021-12-18 13:59:30', '2021-12-18 13:59:47'),
(16, 86, 'PUT10', 1, 20, '2023-09-16', '2023-09-28', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem', 1, 2, '2021-12-18 14:06:19', '2023-09-15 09:27:45');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help`
--

DROP TABLE IF EXISTS `help`;
CREATE TABLE IF NOT EXISTS `help` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1=read,2=pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `help`
--

INSERT INTO `help` (`id`, `user_id`, `fname`, `lname`, `email`, `mobile`, `subject`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 22, 'cvf', 'juhygcgv', 'jhbjv@gmail.com', 'nhbjv b', 'kijhv b', '<p>jiohjb nmkljhjb nnh v</p>', 1, '2021-12-01 11:12:18', '2021-12-01 18:12:18'),
(2, 22, 'John', 'Doe', 'test@yopmail.com', '123456', 'Demo', '<p>kjhbj nibhjnujk inouibhj kjhuiokl iiookjhgyv  uvg iub</p>', 1, '2021-12-01 11:12:18', '2021-12-01 18:12:18');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_09_16_172501_create_permission_tables', 1),
(8, '2014_10_12_100000_create_password_resets_table', 2),
(9, '2023_09_16_191329_add_paid_to_users_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'role-list', 'web', '2023-09-16 12:27:11', '2023-09-16 12:27:11'),
(2, 'role-create', 'web', '2023-09-16 12:27:11', '2023-09-16 12:27:11'),
(3, 'role-edit', 'web', '2023-09-16 12:27:11', '2023-09-16 12:27:11'),
(4, 'role-delete', 'web', '2023-09-16 12:27:11', '2023-09-16 12:27:11'),
(5, 'product-list', 'web', '2023-09-16 12:27:11', '2023-09-16 12:27:11'),
(6, 'product-create', 'web', '2023-09-16 12:27:11', '2023-09-16 12:27:11'),
(7, 'product-edit', 'web', '2023-09-16 12:27:11', '2023-09-16 12:27:11'),
(8, 'product-delete', 'web', '2023-09-16 12:27:11', '2023-09-16 12:27:11');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provider_types`
--

DROP TABLE IF EXISTS `provider_types`;
CREATE TABLE IF NOT EXISTS `provider_types` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `commission` bigint NOT NULL,
  `is_available` tinyint(1) NOT NULL COMMENT '1 for Yes,2 for No',
  `is_deleted` tinyint(1) NOT NULL COMMENT '1 for Yes,2 for No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provider_types`
--

INSERT INTO `provider_types` (`id`, `name`, `commission`, `is_available`, `is_deleted`, `created_at`, `updated_at`) VALUES
(4, 'Part Time', 10, 1, 2, '2021-09-17 07:14:07', '2021-09-20 06:02:06'),
(9, 'test', 15, 1, 1, '2021-09-18 03:46:27', '2021-09-18 05:16:33'),
(7, 'Freelance', 12, 1, 2, '2021-09-18 01:38:27', '2021-10-01 19:21:45'),
(10, 'Company', 15, 1, 2, '2021-09-18 03:46:36', '2021-10-06 15:09:26'),
(11, 'Any Time', 20, 2, 2, '2021-09-20 07:22:02', '2021-11-27 05:52:24'),
(21, 'Full Time', 10, 1, 2, '2021-12-08 13:31:29', '2021-12-08 13:31:44'),
(22, 'Full Time JOB123', 101, 1, 1, '2021-12-18 13:36:02', '2021-12-18 13:36:12'),
(23, 'Full Time', 20, 1, 1, '2021-12-18 14:34:20', '2021-12-18 14:34:33'),
(24, 'viral kumar', 745, 1, 2, '2023-09-15 09:21:57', '2023-09-15 10:34:51'),
(25, '324234', 3243434, 1, 1, '2023-10-02 10:28:18', '2023-10-02 10:39:43'),
(26, 'fffff', 123, 1, 1, '2023-10-02 10:37:35', '2023-10-02 10:39:38');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2023-09-16 12:27:59', '2023-09-16 12:27:59');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  `provider_id` int NOT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` float DEFAULT NULL,
  `duration_type` tinyint(1) DEFAULT NULL COMMENT '1 for Minutes,2 for Hours,3 for Days',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint(1) NOT NULL COMMENT '1 for Yes,2 for No',
  `is_available` tinyint(1) NOT NULL COMMENT '1 for Yes,2 for No',
  `is_deleted` tinyint(1) NOT NULL COMMENT '1 for Yes,2 for No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `slug`, `category_id`, `provider_id`, `price`, `price_type`, `discount`, `duration`, `duration_type`, `image`, `description`, `is_featured`, `is_available`, `is_deleted`, `created_at`, `updated_at`, `address`) VALUES
(1, 'Steam Car Wash', 'steam-car-wash', 37, 6, '1500', 'Fixed', '20', 2, 1, 'service-1634035072.jpg', 'Lorem ipsum ia as dummy text with simple sLorem ipsum ia as dummy text with simple sLorem ipsum ia as dummy text with simple sLorem ipsum ia as dummy text with simple sLorem ipsum ia as dummy text with simple s', 2, 2, 2, '2021-09-20 04:30:35', '2023-01-19 08:52:19', ''),
(2, 'Toughened Glass Fitting Services', 'toughened-glass-fitting-services', 37, 6, '1000', 'Fixed', NULL, 5, 3, 'service-1634035043.jpg', 'this is demo description', 1, 2, 2, '2021-09-20 05:23:36', '2023-01-19 08:52:19', ''),
(3, 'Interior Painting', 'interior-painting', 7, 29, '1200', 'Fixed', '12', 18, 1, 'service-1635594309.jpg', 'This is Demo Service Description', 2, 2, 2, '2021-09-20 07:00:39', '2023-01-19 08:52:48', ''),
(4, 'Women Hair Cutting', 'women-hair-cutting', 36, 2, '10', 'Hourly', '10', NULL, NULL, 'service-1635593351.jpg', 'This Is Demo Service Description', 1, 1, 2, '2021-09-20 07:01:47', '2021-11-10 07:16:52', ''),
(7, 'Men\'s Hair Cutting', 'mens-hair-cutting', 36, 6, '1500', 'Hourly', NULL, NULL, 1, 'service-1633611894.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, 1, 2, '2021-09-28 04:34:20', '2021-12-10 17:36:37', ''),
(6, 'Fancy Car Washing', 'fancy-car-washing', 38, 6, '1200', 'Hourly', '10', NULL, 1, 'service-1633613025.webp', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,', 1, 2, 2, '2021-09-24 23:36:38', '2023-01-19 08:56:11', ''),
(29, 'Spa Service at Home', 'spa-service-at-home', 35, 6, '4600', 'Fixed', '10', 10, 1, 'service-1633611624.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 1, 1, 2, '2021-09-29 02:22:29', '2021-12-10 17:36:31', ''),
(30, 'Computer & Server AMC Service', 'computer-&-server-amc-service', 39, 2, '1500', 'Fixed', '10', 8, 1, 'service-1635593329.jpg', 'Window Curtain Installation\'s description', 1, 2, 2, '2021-10-05 19:23:48', '2023-01-19 08:52:35', ''),
(34, 'Get spa at home', 'get-spa-at-home', 35, 2, '4500', 'Fixed', '10', 12, 1, 'service-1635593193.jpg', 'Lorem ipsum is very test text for description for spa and massage servivce', 1, 1, 2, '2021-10-07 17:05:53', '2021-10-30 05:56:33', ''),
(35, 'House Cleaning Services', 'house-cleaning-services', 37, 2, '1200', 'Fixed', '2', 5, 1, 'service-1634035191.jpg', 'Lorem ipsum is text for cleaning service', 2, 2, 2, '2021-10-07 17:07:32', '2023-01-19 08:52:19', ''),
(36, 'Men\'s fancy hair cutting', 'men-fancy-hair-cutting', 36, 2, '200', 'Hourly', '1', NULL, NULL, 'service-1634035337.jpeg', 'Lorem ipsum is text for hair cutting service', 2, 1, 2, '2021-10-07 17:08:52', '2021-11-10 07:16:52', ''),
(37, 'Home Color and painting', 'home-color-and-painting', 7, 3, '1500', 'Hourly', '10', NULL, NULL, 'service-1635593640.jpg', 'Lorem ipsum is text for apartment color and painting service', 1, 2, 2, '2021-10-07 17:11:55', '2023-01-19 08:52:48', ''),
(38, 'Furniture designing', 'furniture-designing', 39, 3, '1500', 'Hourly', '14', NULL, NULL, 'service-1635593538.jpg', 'Lorem ipsum is text for furniture designing service', 1, 2, 2, '2021-10-07 17:13:20', '2023-01-19 08:52:35', ''),
(39, 'Plumbing service', 'plumbing-service', 5, 3, '5000', 'Fixed', '10', 24, 1, 'service-1635593500.jpg', 'lorem ipsum is demo text for description of plumbing service', 1, 2, 2, '2021-10-07 17:21:57', '2023-01-19 08:52:54', ''),
(40, 'Car Washing', 'car-washing', 38, 29, '1000', 'Hourly', '10', NULL, NULL, 'service-1635594236.jpg', 'lorem ipsum is demo text for description of car washing service', 1, 2, 2, '2021-10-07 17:24:44', '2023-01-19 08:56:11', ''),
(41, 'Bedroom Cleaning', 'bedroom-cleaning', 37, 29, '1500', 'Fixed', '2', 1, 2, 'service-1635594139.jpg', 'lorem ipsum is demo text for description of bedroom cleaning service', 1, 2, 2, '2021-10-07 17:26:24', '2023-01-19 08:52:19', ''),
(42, 'Thermostat Installation', 'thermostat-installation', 39, 30, '5000', 'Fixed', '10', 12, 2, 'service-1635594671.jpg', 'Lorem ipsum is the best dummy text for Smart Thermostat Installation	service', 1, 2, 2, '2021-10-07 17:48:32', '2023-01-19 08:52:35', ''),
(43, 'Pet Sitting service', 'pet-sitting-service', 39, 30, '1500', 'Hourly', '25', NULL, NULL, 'service-1635594548.jpg', 'Lorem ipsum is best dummy text for Pet Sitting service', 1, 2, 2, '2021-10-07 17:50:02', '2023-01-19 08:52:35', ''),
(44, 'Spa Service at Home', 'spa-service-at-home', 35, 31, '4600', 'Fixed', '10', 10, 1, 'service-1633603983.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 1, 1, 1, '2021-10-07 17:53:03', '2021-12-10 17:36:31', ''),
(45, 'Fast Car Washing', 'fast-car-washing', 38, 31, '1200', 'Hourly', '10', NULL, NULL, 'service-1635594412.jpg', 'this is description for car washing service', 1, 2, 2, '2021-10-07 17:54:45', '2023-01-19 08:56:11', ''),
(46, 'Apartment Painting', 'apartment-painting', 7, 35, '1500', 'Fixed', '10', 48, 1, 'service-1633783699.png', 'Lorem ipsum is dummy text to testLorem ipsum is dummy text to testLorem ipsum is dummy text to testLorem ipsum is dummy text to testLorem ipsum is dummy text to test..', 1, 2, 1, '2021-10-09 19:48:19', '2023-01-19 08:52:48', ''),
(47, 'Apartment Cleaning', 'apartment-cleaning', 37, 2, '4000', 'Fixed', '20', 5, 1, 'service-1633783745.png', 'Lorem ipsum is dummy text to testLorem ipsum is dummy text to testLorem ipsum is dummy text to testLorem ipsum is dummy text to test', 1, 2, 1, '2021-10-09 19:49:05', '2023-01-19 08:52:19', ''),
(48, 'Car Washing', 'car-washing', 38, 35, '1500', 'Hourly', '10', NULL, NULL, 'service-1633783782.png', 'Lorem ipsum is dummy text to testLorem ipsum is dummy text to testLorem ipsum is dummy text to test', 1, 2, 1, '2021-10-09 19:49:42', '2023-01-19 08:56:11', ''),
(49, 'luxuries Car Washing', 'luxuries-car-washing', 38, 35, '1500', 'Hourly', '2', NULL, NULL, 'service-1635595003.jpg', 'Lorem ipsum is demo text for industry to ..Lorem ipsum is demo text for industry to ..Lorem ipsum is demo text for industry to ..Lorem ipsum is demo text for industry to ..', 1, 2, 2, '2021-10-09 19:51:04', '2023-01-19 08:56:11', ''),
(50, 'Pipes Fitting Service', 'pipes-fitting-service', 5, 35, '1500', 'Hourly', '5', NULL, NULL, 'service-1635594948.jpg', 'Lorem ipsum is demo text for industry to ..Lorem ipsum is demo text for industry to ..Lorem ipsum is demo text for industry to ..Lorem ipsum is demo text for industry to ..', 1, 2, 2, '2021-10-09 19:52:33', '2023-01-19 08:52:54', ''),
(51, 'Asian Furniture Designing', 'asian-furniture-designing', 39, 35, '2000', 'Fixed', '12', 10, 1, 'service-1639813246.jpeg', 'Lorem ipsum is demo text for industry to ..Lorem ipsum is demo text for industry to ..Lorem ipsum is demo text for industry to ..Lorem ipsum is demo text for industry to ..', 1, 2, 2, '2021-10-09 19:53:23', '2023-01-19 08:52:35', ''),
(52, 'Interior Painting', 'interior-painting', 7, 35, '12000', 'Hourly', '10', NULL, NULL, 'service-1633784084.png', 'Lorem ipsum is demo text for industry to ..Lorem ipsum is demo text for industry to ..Lorem ipsum is demo text for industry to ..', 1, 2, 1, '2021-10-09 19:54:44', '2023-01-19 08:52:48', ''),
(64, 'Interior Wall Painting', 'interior-wall-painting', 7, 30, '100', 'Hourly', '2', NULL, 1, 'service-1639549664.jpeg', 'Interior Wall Painting Services effortlessly transforms your renovation into an investment. Painting interior walls are the easiest way to beautiful up your place. But this project can quickly turn into a nightmare if you\'re not careful.', 2, 2, 2, '2021-12-15 13:27:45', '2023-01-19 08:52:48', ''),
(65, 'Exterior Painting Service', 'exterior-painting-service', 7, 32, '200', 'Fixed', '2', 10, 3, 'service-1639550255.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, 2, 2, '2021-12-15 13:37:35', '2023-01-19 08:52:48', ''),
(66, 'Bathroom Cleaning', 'bathroom-cleaning', 37, 32, '1500', 'Fixed', NULL, 30, 3, 'service-1639550439.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, 2, 2, '2021-12-15 13:40:39', '2023-01-19 08:52:19', ''),
(67, 'Aquarium Cleaning', 'aquarium-cleaning', 37, 32, '2500', 'Fixed', NULL, 30, 3, 'service-1639550538.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, 2, 2, '2021-12-15 13:42:18', '2023-01-19 08:52:19', ''),
(68, 'Car washing', 'car-washing-68', 38, 32, '200', 'Hourly', NULL, NULL, NULL, 'service-1639550648.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, 2, 2, '2021-12-15 13:44:08', '2023-01-19 08:56:11', ''),
(69, 'Carpet Cleaning', 'carpet-cleaning', 37, 32, '100', 'Hourly', NULL, NULL, NULL, 'service-1639550804.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, 2, 2, '2021-12-15 13:46:44', '2023-01-19 08:52:19', ''),
(70, 'House Cleaning Services', 'house-cleaning-services-70', 37, 32, '2500', 'Fixed', NULL, 30, 3, 'service-1639550941.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, 2, 2, '2021-12-15 13:49:01', '2023-01-19 08:52:19', ''),
(71, 'Kitchen Cleaning', 'kitchen-cleaning', 37, 32, '200', 'Hourly', '2', NULL, NULL, 'service-1639551192.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, 2, 2, '2021-12-15 13:53:12', '2023-01-19 08:52:19', ''),
(72, 'Move-In Move-Out Cleaning', 'move-in-move-out-cleaning', 39, 31, '200', 'Hourly', '2', NULL, NULL, 'service-1639551526.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 2, 2, 2, '2021-12-15 13:58:46', '2023-01-19 08:52:35', ''),
(73, 'Office Cleaning', 'office-cleaning', 37, 31, '2500', 'Hourly', '2', NULL, NULL, 'service-1639551656.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, 2, 2, '2021-12-15 14:00:56', '2023-01-19 08:52:19', ''),
(74, 'Pest Control Service', 'pest-control-service', 38, 31, '150', 'Hourly', '2', NULL, NULL, 'service-1639551792.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 2, 2, 2, '2021-12-15 14:03:12', '2023-01-19 08:56:11', ''),
(75, 'baby sitting service', 'baby-sitting-service', 43, 31, '2500', 'Fixed', NULL, 30, 3, 'service-1639551951.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 2, 2, 2, '2021-12-15 14:05:51', '2023-01-19 08:55:58', ''),
(76, 'Pet Boarding Services', 'pet-boarding-services', 44, 31, '200', 'Hourly', NULL, NULL, NULL, 'service-1639552163.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 2, 1, 2, '2021-12-15 14:09:23', '2021-12-15 14:09:23', ''),
(77, 'Dog Grooming Services', 'dog-grooming-services', 44, 31, '350', 'Hourly', NULL, NULL, NULL, 'service-1639552236.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, 1, 2, '2021-12-15 14:10:36', '2021-12-15 14:10:36', ''),
(78, 'Pet Fashion Show Services', 'pet-fashion-show-services', 44, 31, '200', 'Hourly', '2', NULL, NULL, 'service-1639552367.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 2, 1, 2, '2021-12-15 14:12:47', '2021-12-15 14:12:47', ''),
(79, 'Pet Transportation Services.', 'pet-transportation-services', 44, 31, '500', 'Hourly', '2', NULL, NULL, 'service-1639552467.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 2, 1, 2, '2021-12-15 14:14:27', '2021-12-15 14:14:27', ''),
(80, 'Pet Walker Services', 'pet-walker-services', 44, 31, '100', 'Hourly', NULL, NULL, NULL, 'service-1639552537.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 2, 1, 2, '2021-12-15 14:15:37', '2021-12-15 14:15:37', ''),
(81, 'hair-cutting service', 'hair-cutting-service', 36, 4, '1500', 'Fixed', NULL, 15, 1, 'service-1639552860.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 2, 1, 2, '2021-12-15 14:21:00', '2021-12-15 14:21:00', ''),
(82, 'hair colouring service', 'hair-colouring-service', 36, 4, '2500', 'Fixed', '2', 5, 2, 'service-1639553950.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 2, 1, 2, '2021-12-15 14:39:10', '2021-12-15 14:39:10', ''),
(83, 'hair removal service', 'hair-removal-service', 36, 4, '200', 'Hourly', NULL, NULL, NULL, 'service-1639554440.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 2, 1, 2, '2021-12-15 14:47:20', '2021-12-15 14:47:20', ''),
(84, 'Nail treatments', 'nail-treatments', 36, 4, '100', 'Hourly', NULL, NULL, NULL, 'service-1639554593.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 2, 1, 2, '2021-12-15 14:49:53', '2021-12-15 14:49:53', ''),
(85, 'facials and skin care treatments', 'facials-and-skin-care-treatments', 35, 4, '1200', 'Hourly', NULL, NULL, NULL, 'service-1639554690.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 2, 1, 2, '2021-12-15 14:51:30', '2021-12-15 14:51:30', ''),
(86, 'Massages Service', 'massages-service', 35, 4, '2500', 'Fixed', '2', 1, 2, 'service-1639554954.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, 1, 2, '2021-12-15 14:55:56', '2021-12-15 14:55:56', ''),
(87, 'complementary care such as aromatherapy', 'complementary-care-such-as-aromatherapy', 35, 4, '200', 'Hourly', NULL, NULL, NULL, 'service-1639555154.jpeg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 2, 1, 2, '2021-12-15 14:59:14', '2021-12-15 14:59:14', ''),
(88, 'Hair SPA', 'hair-spa', 35, 115, '500', 'Fixed', '100', 1, 2, 'service-1683048987.png', 'Hair SPA with massage', 1, 1, 2, '2023-05-02 12:06:27', '2023-05-02 12:15:39', 'Agra'),
(89, 'city', 'city', 36, 122, '50', 'Hourly', '2', 1, 2, 'service-1694887047.jpg', 'DESCRIPTION', 1, 1, 2, '2023-09-16 12:27:27', '2023-09-16 12:34:37', 'addresdss');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `firebase_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `referral_amount` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `withdrawable_amount` int NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `copyright` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `website_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `og_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `twitter_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `instagram_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkedin_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `firebase_key`, `currency`, `currency_position`, `logo`, `favicon`, `banner`, `timezone`, `referral_amount`, `withdrawable_amount`, `address`, `contact`, `email`, `copyright`, `website_title`, `meta_title`, `meta_description`, `og_image`, `facebook_link`, `twitter_link`, `instagram_link`, `linkedin_link`, `created_at`, `updated_at`) VALUES
(1, 'this is firebase key', '₹', 'right', 'logo-1672818600.png', 'favicon-1672819543.png', 'banner-1666962077.jpg', 'Asia/Kolkata', '10', 100, '#302 Brick Market, Jalsa California United State HQS1130', '12345678910 123', 'email@gmail.com', '©Copyright 2020-2021.', 'Service Provider', 'Multi vendor Service Provider system', 'Multi vendor Service Provider system', 'og_image.jpg', 'https://www.facebook.com/', 'https://twitter.com/', 'https://www.instagram.com/', 'https://www.linkedin.com/', '2021-09-22 18:30:00', '2023-09-15 09:28:52');

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

DROP TABLE IF EXISTS `subscribe`;
CREATE TABLE IF NOT EXISTS `subscribe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscribe`
--

INSERT INTO `subscribe` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'rrr@yopmail.com', '2021-12-01 09:44:34', '0000-00-00 00:00:00'),
(2, 'demo@yopmail.com', '2021-12-01 16:58:50', '2021-12-01 16:58:50'),
(3, 'demo@yopmail.com', '2021-12-01 16:59:10', '2021-12-01 16:59:10');

-- --------------------------------------------------------

--
-- Table structure for table `testing`
--

DROP TABLE IF EXISTS `testing`;
CREATE TABLE IF NOT EXISTS `testing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `testing`
--

INSERT INTO `testing` (`id`, `name`, `email`, `image`, `created_at`, `updated_at`) VALUES
(9, 'Rafael Deleon', 'tykazeruc@mailinator.com', '1695740567en.jpg', '2023-09-26 15:02:47', '2023-09-26 09:34:48'),
(10, 'Callum Stein', 'zeguw@mailinator.com', '1695740589en.jpg', '2023-09-26 15:03:09', '2023-09-26 09:34:48'),
(8, 'Scarlet Mosley', 'cojemisyse@mailinator.com', '1695740567en.jpg', '2023-09-26 15:02:47', '2023-09-26 09:34:48'),
(11, 'Jorden Navarro', 'jevuwebuwo@mailinator.com', NULL, '2023-09-26 15:03:09', '2023-09-26 09:34:48'),
(12, 'Malik Wade', 'defobav@mailinator.com', NULL, '2023-09-26 15:03:09', '2023-09-26 09:34:48'),
(13, 'Hilary Gross', 'xebaz@mailinator.com', '1695740688en.jpg', '2023-09-26 15:04:48', '2023-09-26 09:34:48'),
(14, 'Wade Lopez', 'cuso@mailinator.com', '1695740688en.jpg', '2023-09-26 15:04:48', '2023-09-26 09:34:48'),
(15, 'ddfdf44444444444444444444444444', 'testb@yopmail.com', '1695740864en.jpg', '2023-09-26 15:07:18', '2023-09-26 09:37:44'),
(16, 'disma', '444444444444444', '1695740864en.jpg', '2023-09-26 15:07:44', '2023-09-26 09:37:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL DEFAULT 'default.png',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1=Admin,2=Provider,3=Handyman,4=User/Customer',
  `provider_type` int DEFAULT NULL,
  `provider_id` int DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `about` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `login_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `referral_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1=Yes,2=No',
  `is_available` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Yes,2=No',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `slug`, `email`, `mobile`, `image`, `password`, `type`, `provider_type`, `provider_id`, `address`, `city_id`, `about`, `login_type`, `google_id`, `facebook_id`, `token`, `referral_code`, `wallet`, `otp`, `is_verified`, `is_available`, `remember_token`, `created_at`, `updated_at`, `latitude`, `longitude`, `location_address`) VALUES
(1, 'Admin', 'admin', 'admin@gmail.com', '457871542', 'profile-1674136475.jpg', '$2y$10$IEyhiqqY59Vdr9iEpDfQY.0V6iw7MXSbFOWJ9QdIQr74r4fJ7cIe6', 1, NULL, NULL, 'Akshya Nagar 1st Block, Rammurthy nagar', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'email', NULL, NULL, NULL, NULL, '236', NULL, 2, 1, 'alUzKHnbRYgh2NiZEdERILcLCw7Q4SfJu92CcfmFM5aaomakciNqXRz9rvlL', NULL, '2023-01-19 08:50:45', NULL, NULL, NULL),
(2, 'Christie', 'christie', 'christie@gmail.com', '2255441144', 'provider-1638943139.jpeg', '$2y$10$6P8U2zrzoDdBxDjnb8FyIeSJiikvdRjh99VIQMTaqz5DnI7t4TaGC', 2, 10, NULL, 'MG Nagar 1st Block, Rammurthy nagar', 22, 'Contact me for more information!', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2021-09-27 07:29:24', '2023-01-19 09:12:25', NULL, NULL, NULL),
(115, 'Mose2', 'mose2', 'mose2@gmail.com', '70043447459', 'provider-1682611027.png', '$2y$10$fGAtJQ3QzCSXhTRh3Pnp5.UPPCNsyMM2ewz5KhndehlKqhuxJmbtG', 2, 2, NULL, 'abc street', 1, NULL, 'email', NULL, NULL, 'ceRiMq1ZSs6VYJmQ04LgGj:APA91bE_DrVZS5iFIIeXn_sPMvHPlBhqOkgQbztZGPrb0YqYlUsDRtcsumGPRSPZUtHBv2tQuHlJNTV3iQS_q-_eM19RBwMsKStpqwHlGFmJ1aDSTWur7RwM_ZdokwR7WY9hfO6sQxbY', NULL, NULL, '532122', 3, 1, 'HRFgM7GOHTpqGJAiJTLxGmhtH2WYB74HjFqWkzR7OYnkXzeVOMqyJE0SH8D2', '2023-04-27 10:27:07', '2023-05-03 11:27:06', NULL, NULL, NULL),
(3, 'Thomas', 'thomas', 'thomas@gmail.com', '2255441144', 'provider-1638943115.png', '$2y$10$6P8U2zrzoDdBxDjnb8FyIeSJiikvdRjh99VIQMTaqz5DnI7t4TaGC', 2, 4, NULL, 'Shreeji Nagar 1st Block, Rammurthy nagar', 11, 'Contact me for more information!', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2021-09-27 07:42:49', '2023-01-19 09:12:18', NULL, NULL, NULL),
(4, 'James Bond', 'james-bond', 'james@gmail.com', '6633225544', 'provider-1638943097.jpeg', '$2y$10$6P8U2zrzoDdBxDjnb8FyIeSJiikvdRjh99VIQMTaqz5DnI7t4TaGC', 2, 4, NULL, 'XYZ Nagar 1st Block, Mahan nagar', 11, 'Contact me for more information!', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2021-09-27 07:44:06', '2023-01-19 09:12:10', NULL, NULL, NULL),
(5, 'Shiva', 'shiva', 'handyman@gmail.com', '6633225544', 'Handyman-1632806668.jpg', '$2y$10$IEyhiqqY59Vdr9iEpDfQY.0V6iw7MXSbFOWJ9QdIQr74r4fJ7cIe6', 3, NULL, 2, 'Test Nagar 5st Block, dummy Soc.', 12, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2021-09-27 23:36:12', '2021-10-02 12:59:39', NULL, NULL, NULL),
(6, 'Rock Johnson', 'rock-johnson-115', 'provider@gmail.com', '1234567890', 'provider-1638943059.png', '$2y$10$IEyhiqqY59Vdr9iEpDfQY.0V6iw7MXSbFOWJ9QdIQr74r4fJ7cIe6', 2, 10, NULL, 'Test Area , 1\'st Block,GM Road', 11, 'Contact me for more information!', 'email', NULL, NULL, 'dotAxN_LRLO19njJSAZDtb:APA91bEYbs_c5YaJ1GXwoOYHVBgxUkQExNm6qChZB8nEB-aqnVLJiwkkDv4vxx4WI8fzsuVWU_hvdJbV24VdKRv9H0oxhir0p0sWHAcSwSjXKEkvex-HxyTq00pDQCx_QBddUEavr1I8', NULL, '101', NULL, 1, 1, NULL, '2021-09-28 01:42:32', '2023-01-19 09:12:03', NULL, NULL, NULL),
(8, 'John', 'john', 'handyman1@gmail.com', '9958652152', 'handyman-1638445689.jpeg', '$2y$10$IUmHy8HKfzCO5D/XT45f3uWHD3ub.jmtSPGRJn01Ip1.WiULuk5s6', 3, NULL, 6, 'Akshya Nagar 1st Block, Rammurthy nagar', 11, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'email', NULL, NULL, 'dQuggopFR1qGAj8lVXQW3Z:APA91bFT49P26Yb_vavDXJNZC4ZGxo5r6x1fibgsllS2LkMUlOf5q0qqQuDvGqrmGSBVyXSkA6xNS-xcAo3ZhNpwXYhSI3iGXWfR3EkGZHb4JZM0hD4rX977KpROutmvJalsAGSXZ8ib', NULL, NULL, NULL, 1, 1, NULL, '2021-09-28 03:26:17', '2021-12-22 18:03:56', NULL, NULL, NULL),
(9, 'Mayank Tank', 'mayank-tank', 'mayank@gmail.com', '2255441252', 'handyman-1633756411.png', '$2y$10$IEyhiqqY59Vdr9iEpDfQY.0V6iw7MXSbFOWJ9QdIQr74r4fJ7cIe6', 3, NULL, 6, '<p>1st Block , Mohan Soc,</p>', 20, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'email', NULL, NULL, 'dQuggopFR1qGAj8lVXQW3Z:APA91bFT49P26Yb_vavDXJNZC4ZGxo5r6x1fibgsllS2LkMUlOf5q0qqQuDvGqrmGSBVyXSkA6xNS-xcAo3ZhNpwXYhSI3iGXWfR3EkGZHb4JZM0hD4rX977KpROutmvJalsAGSXZ8ib', NULL, NULL, NULL, 1, 1, NULL, '2021-09-28 03:49:30', '2021-12-23 18:19:16', NULL, NULL, NULL),
(22, 'john User', 'john-user', 'johnuser@yopmail.com', '9865320147', 'profile-1639115133.jpeg', '$2y$10$H74E90jVSNxpmkV/2cjWrOQO1czNObPPvl22/4q6eoSHXJaei1bdS', 4, NULL, NULL, '123 Test bungalow\'s, Demo Road , Pune.', 11, 'Lorem is ipsum text top to set the ipsum to view the lorem top to set the  top to set the ..', 'email', NULL, NULL, 'fA8w3L8BT8-z-FZjwpaGGH:APA91bFG6Hjb4IzTCiXE-t3S4Rvdv1FUp944jhbuWF-4RsgM34fYBRb98xlMj3om0Imomexs8TkLVOpFr7Wmw1hqWQTFTI5KdCSnv2_k6HuyC0aqbxdcx2PNFu7HInOUoHNl5eaF-9wS', 'W1PXxoRzNj', '288.88', NULL, 1, 1, NULL, '2021-12-10 12:43:38', '2021-12-22 12:50:35', NULL, NULL, NULL),
(100, 'hardik', 'hardik', 'hs@yopmail.com', '7485967485', 'default.png', '$2y$10$ssPdO8HtDhPzCgwYH0JUQOX/.YYXDXt9YkLyoCLCYYWagJFv1LOBO', 4, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, 'emujQnpGSaC8UCckb6O8zH:APA91bEZTngx-zr5cj1g3FE5vOIWCq2yoY4aLERGCy5ixUy1wUzgiRHHt9hxuHnYiLwCCJEfFF3P3SmxsgD915uAyHBCCYbDLTnozIJYUDvrHlXeuvZy9Rz_pli_WQsBYZUXfAHVlqCl', 'f91RLv0UBy', NULL, NULL, 1, 1, NULL, '2021-12-10 12:47:30', '2021-12-10 12:48:48', NULL, NULL, NULL),
(101, 'hs', 'hs', 'hss@yopmail.com', '7418529630', 'default.png', '$2y$10$CL6e1hnnaDnmYTUnNqjFAeKUYDYPfX7dnfqgF0Zw7nsGGfBarMVNq', 4, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, 'emujQnpGSaC8UCckb6O8zH:APA91bEZTngx-zr5cj1g3FE5vOIWCq2yoY4aLERGCy5ixUy1wUzgiRHHt9hxuHnYiLwCCJEfFF3P3SmxsgD915uAyHBCCYbDLTnozIJYUDvrHlXeuvZy9Rz_pli_WQsBYZUXfAHVlqCl', 'xUBzNusgPk', NULL, NULL, 1, 1, NULL, '2021-12-10 12:49:47', '2021-12-10 12:51:10', NULL, NULL, NULL),
(29, 'Jessica Willson', 'jessica-willson', 'jessica@gmail.com', '1020304050', 'provider-1638943036.jpeg', '$2y$10$6P8U2zrzoDdBxDjnb8FyIeSJiikvdRjh99VIQMTaqz5DnI7t4TaGC', 2, 7, NULL, 'XYZ area, test Block , AMC road', 22, 'Contact me for more information!', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2021-10-07 16:22:41', '2023-01-19 09:11:53', NULL, NULL, NULL),
(102, 'dummy', 'dummy', 'dummy@yopmail.com', '04400083', 'profile-1640152208.jpg', '$2y$10$WGz4WZZkglSaQmwEtvGIe.eRtFDCwDT.1ThJFH0jtOPef2Og7eVoy', 4, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, 'fA8w3L8BT8-z-FZjwpaGGH:APA91bFG6Hjb4IzTCiXE-t3S4Rvdv1FUp944jhbuWF-4RsgM34fYBRb98xlMj3om0Imomexs8TkLVOpFr7Wmw1hqWQTFTI5KdCSnv2_k6HuyC0aqbxdcx2PNFu7HInOUoHNl5eaF-9wS', '5Lv8EGFW4s', '835', NULL, 1, 1, NULL, '2021-12-10 12:54:08', '2021-12-22 12:50:08', NULL, NULL, NULL),
(105, 'Jesse', 'jesse', 'jesse@yopmail.com', '123456789', 'profile-1639986158.jpg', '$2y$10$YGuxb2NSlURomQDVBnfTsOyYkG8FgZY2p.XvhXsLqUOKyCNHIJ4wa', 4, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, 'efQMrMmLSNmVIB5OiEEvzn:APA91bFaeN_HiM3gNZV6HGDMQIHUGqrTnrQ_G-_aa3-H6DWRhEiWYgQMtJIRGhpECuDgrCcBr8ELcXdtRNGCC4XCVDg3zEMEAK96PGAh6L_iA6mrMHS3xoigEOARhBaNLcIBpy9T_diN', 'RrNBFgwcXP', '420', NULL, 1, 1, NULL, '2021-12-15 13:01:21', '2021-12-20 14:46:59', NULL, NULL, NULL),
(107, 'john', 'john-123', 'john1@yopmail.com', '+917698077233', 'provider-1639809511.png', '$2y$10$HCIdhpptsAR/z/jFVgCB1.Njh37eDTMiqEAguPGw0lobRtPLIkDDG', 2, 21, NULL, 'surat', 20, 'test', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, '2021-12-18 13:38:31', '2023-09-16 10:37:19', '22.49972583772063', '73.46827924804685', 'Halol,Gujarat,India,IN'),
(108, 'Richard', 'richard', 'anderson@yopmail.com', '9865214760', 'hamdyman-1639813166.jpeg', '$2y$10$XQDZwsq/QWv2WcCBau5mWerm1wd8SZwovZNV7L215dRgsDf4AUZuG', 3, NULL, 35, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 22, NULL, 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2021-12-18 14:39:26', '2021-12-18 14:39:49', NULL, NULL, NULL),
(31, 'Olive Yew', 'olive-yew-115', 'olive@gmail.com', '1541541230', 'provider-1638942919.jpeg', '$2y$10$6P8U2zrzoDdBxDjnb8FyIeSJiikvdRjh99VIQMTaqz5DnI7t4TaGC', 2, 7, NULL, '123 Block, AA Area,', 11, 'Contact me for more information!', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2021-10-07 16:36:31', '2023-01-19 09:10:37', NULL, NULL, NULL),
(30, 'Steev Brookly', 'steev-brookly', 'steev@gmail.com', '1212030345', 'provider-1638942964.jpeg', '$2y$10$6P8U2zrzoDdBxDjnb8FyIeSJiikvdRjh99VIQMTaqz5DnI7t4TaGC', 2, 7, NULL, 'Demo apartment ,QWER Road', 22, 'Contact me for more information!', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2021-10-07 16:28:05', '2023-01-19 09:11:44', NULL, NULL, NULL),
(32, 'Peg Legge', 'peg-legge-115', 'peg@gmail.com', '4578784500', 'provider-1638942896.jpeg', '$2y$10$6P8U2zrzoDdBxDjnb8FyIeSJiikvdRjh99VIQMTaqz5DnI7t4TaGC', 2, 10, NULL, 'House-123 ,xyz -block , dummy road', 11, 'Contact me for more information!', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2021-10-07 16:38:21', '2023-01-19 09:10:44', NULL, NULL, NULL),
(33, 'Cate Joy', 'cate-joy', 'cate@gmail.com', '1212457800', 'provider-1638942844.jpeg', '$2y$10$vjLStWZP/kcyuGyQ1RHpFOW5xUv.4tzerPGxRpgNZ32BmM1ALpVsu', 2, 10, NULL, '1st Block, Gotalavadi,', 11, 'Contact me for more information!', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2021-10-09 19:12:43', '2023-01-19 09:10:50', NULL, NULL, NULL),
(34, 'Lura Joy', 'lura-joy-115', 'lura@gmail.com', '1212457811', 'provider-1638942810.jpeg', '$2y$10$yAXIY5nT0blMX808Hk/NnOaU/kNIvWGHMSMyd.XZZCtYniMxd8VyK', 2, 4, NULL, '2nd Block, Gotalavadi', 11, 'Contact me for more information!', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2021-10-09 19:14:23', '2023-01-19 09:11:35', NULL, NULL, NULL),
(35, 'Carter Joy', 'carter-joy', 'carter@gmail.com', '1212457811', 'provider-1640152421.jpg', '$2y$10$IEyhiqqY59Vdr9iEpDfQY.0V6iw7MXSbFOWJ9QdIQr74r4fJ7cIe6', 2, 4, NULL, '2nd Block, Gotalavadi', 11, 'Contact me for more information!', 'email', NULL, NULL, 'dotAxN_LRLO19njJSAZDtb:APA91bEYbs_c5YaJ1GXwoOYHVBgxUkQExNm6qChZB8nEB-aqnVLJiwkkDv4vxx4WI8fzsuVWU_hvdJbV24VdKRv9H0oxhir0p0sWHAcSwSjXKEkvex-HxyTq00pDQCx_QBddUEavr1I8', NULL, '5500', NULL, 1, 1, NULL, '2021-10-09 19:22:51', '2023-09-15 11:01:53', NULL, NULL, NULL),
(36, 'Jenifer', 'jenifer', 'jenifer@gmail.com', '45454545', 'provider-1638942741.jpeg', '$2y$10$k4wGJ4EoLyCpgLycFFj8K.lKHvRS31RZ/4vnvGfSGp/lMIzSQ43.G', 2, 10, NULL, '3rd Block, Mamta Colony', 11, 'Contact me for more information!', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2021-10-09 20:07:43', '2023-01-19 09:09:58', NULL, NULL, NULL),
(37, 'Lucifer', 'lucifer', 'lucifer@gmail.com', '45455555', 'provider-1638942708.jpeg', '$2y$10$aoYdhkoqAR7dmUiU8emD4OJlHPzV537/Qa9iWkRi3fkH4xc9/BhJS', 2, 4, NULL, '4th Block, Lasan Colony ,', 11, 'Contact me for more information!', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'NWmkBOldphVjw44UEIPv92CaemiMBklG0WRE7lvth7fTMDbALIy5dychr7VL', '2021-10-09 20:08:44', '2023-01-19 09:09:18', NULL, NULL, NULL),
(38, 'Jacky', 'jacky', 'jecky@gmail.com', '1111155555', 'provider-1638942664.jpeg', '$2y$10$qmJViksdYPTA71XL6xyMVOrPMjtil9TEAjoeoIF6bB4/UqUQRzLu.', 2, 7, NULL, '5th Block, Laxmi Colony , Demo Area', 11, 'Contact me for more information!', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2021-10-09 20:09:36', '2023-01-19 09:09:10', NULL, NULL, NULL),
(73, 'Monique Gastambide', 'monique-gastambide', 'monika@gmail.com', '225577544', 'default.png', '$2y$10$IEyhiqqY59Vdr9iEpDfQY.0V6iw7MXSbFOWJ9QdIQr74r4fJ7cIe6', 3, NULL, 30, '1st Block,Mohan Soc,', 8, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2021-09-28 03:49:30', '2021-11-09 04:57:18', NULL, NULL, NULL),
(72, 'jay Thakur', 'jay-thakur', 'jay@gmail.com', '2255441104', 'default.png', '$2y$10$IEyhiqqY59Vdr9iEpDfQY.0V6iw7MXSbFOWJ9QdIQr74r4fJ7cIe6', 3, NULL, 31, '1st Block,Mohan Soc,', 8, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2021-09-28 03:49:30', '2021-11-09 04:57:31', NULL, NULL, NULL),
(70, 'Tejas Vakhre', 'tejas-vakhre', 'tejas@gmail.com', '225554544', 'default.png', '$2y$10$IEyhiqqY59Vdr9iEpDfQY.0V6iw7MXSbFOWJ9QdIQr74r4fJ7cIe6', 3, NULL, 2, '1st Block,Mohan Soc,', 22, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2021-09-28 03:49:30', '2021-11-09 04:57:52', NULL, NULL, NULL),
(71, 'Mohit Chauhan', 'mohit-chauhan', 'mohit@gmail.com', '225588844', 'default.png', '$2y$10$IEyhiqqY59Vdr9iEpDfQY.0V6iw7MXSbFOWJ9QdIQr74r4fJ7cIe6', 3, NULL, 29, '1st Block,Mohan Soc,', 8, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2021-09-28 03:49:30', '2021-11-09 04:57:42', NULL, NULL, NULL),
(74, 'Devansh Zola', 'devansh-zola', 'devansh@gmail.com', '277788844', 'default.png', '$2y$10$IEyhiqqY59Vdr9iEpDfQY.0V6iw7MXSbFOWJ9QdIQr74r4fJ7cIe6', 3, NULL, 30, '1st Block,Mohan Soc,', 8, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2021-09-28 03:49:30', '2021-11-09 04:56:46', NULL, NULL, NULL),
(75, 'Vivek Jha', 'vivek-jha', 'vivek@gmail.com', '225777844', 'handyman-1639214994.jpeg', '$2y$10$IEyhiqqY59Vdr9iEpDfQY.0V6iw7MXSbFOWJ9QdIQr74r4fJ7cIe6', 3, NULL, 35, '1st Block,Mohan Soc,', 8, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'email', NULL, NULL, 'dx_8gN70GkPGvhbJZrHiix:APA91bGi0zwW_aaMZ1qaGlQcyrI1biVAniRRInY4Fjcoub8jildZv2KbDehCdkuJ0jGScPgN8dXW5EXg7HCPU2qaF-p2WcvNJK2nmWa9AXvQKkiZ6Dxpbvt_T6mN2YzKOcmPEi0_wcdD', NULL, NULL, NULL, 1, 1, NULL, '2021-09-28 03:49:30', '2021-12-11 16:29:54', NULL, NULL, NULL),
(103, 'Roy', 'roy', 'roy@yopmail.com', '6598741230', 'hamdyman-1639386340.png', '$2y$10$zRNlVrm35YTmr0puZQ7DLOH1tGI3NY8JYqWuWwczlNU8bl37fNGde', 3, NULL, 35, 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', 1, NULL, 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2021-12-13 16:05:41', '2021-12-13 16:05:41', NULL, NULL, NULL),
(104, 'Mary', 'mary', 'mary@yopmail.com', '76980997233', 'handyman-1640152082.jpg', '$2y$10$qTyBXAG18BuwekqAyEYm/eXa195h4pxqPi3yGx6pMeVYBMwkMCmy2', 3, NULL, 35, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 1, NULL, 'email', NULL, NULL, 'dQuggopFR1qGAj8lVXQW3Z:APA91bFT49P26Yb_vavDXJNZC4ZGxo5r6x1fibgsllS2LkMUlOf5q0qqQuDvGqrmGSBVyXSkA6xNS-xcAo3ZhNpwXYhSI3iGXWfR3EkGZHb4JZM0hD4rX977KpROutmvJalsAGSXZ8ib', NULL, NULL, NULL, 1, 1, NULL, '2021-12-13 16:10:12', '2021-12-22 15:41:46', NULL, NULL, NULL),
(95, 'john', 'john-123', 'john@yopmail.com', '+917698077233', 'provider-1638942463.jpeg', '$2y$10$IEyhiqqY59Vdr9iEpDfQY.0V6iw7MXSbFOWJ9QdIQr74r4fJ7cIe6', 2, 10, NULL, '4nd Block, Gotalavadi', 5, 'Contact me for more information!', 'email', NULL, NULL, 'dsBTjK99XkpHqSJmUudYht:APA91bFs5fDJcaHT6DIhxwLhcdgaNeYMApUYmeuj2llFY8ChsUWKlT9BHkIsoqyvN6KhG7x5XR-HuReAPQj7_cSGawZupD_ICbsJgdbHvW3k3Mi1KZZA3vMXyw-e879Y0WogIN0-_cou', NULL, NULL, NULL, 1, 1, NULL, '2021-12-08 12:47:44', '2023-09-16 10:35:56', '23.38245508928427', '45.55888593749998', 'العنادية,منطقة الرياض,Saudi Arabia,SA'),
(106, 'User 1', 'user-1', 'user123@yopmail.com', '666666666', 'default.png', '$2y$10$/QGAcgck0lc1ls1TGmXXbO1z037trURCuN1P4cpxYe5wJlhGfD4tC', 4, NULL, NULL, 'Bshsssh', NULL, NULL, 'email', NULL, NULL, NULL, 'OhJYlMx47m', NULL, NULL, 1, 1, NULL, '2021-12-18 03:21:57', '2021-12-18 12:18:17', NULL, NULL, NULL),
(97, 'Jeff Harris', 'jeff-harris', 'jeff@yopmail.com', '7159569277', 'hamdyman-1639045636.jpeg', '$2y$10$7U3ECy8doLhjPvRnNsuaZ.zcumi8XsN7qfPz9uDaEsEQ8TLBVKPN.', 3, NULL, 95, '<p>Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36</p>', 23, NULL, 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, '2021-12-09 17:27:17', '2021-12-16 17:59:46', NULL, NULL, NULL),
(114, 'Sunny', 'sunny', 'stephensunny921@gmail.com', '7004344748', 'default.png', '$2y$10$ZpcYUu0oYqIniQnECrsTQ.o7nKsqCj6l5jvUxudbLvz.XdGFBd9le', 4, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, 'eOAa1TkoQt2vwczziGrpMm:APA91bFhS2PW9ez9_FyUn3AMsB1K-w5qo9DLuanwXs_ldsGQOTT86UqKlaEPHhBGBQCwjOicj6CF3GeaAGovYsRRpLSRspC39B-zzhsVX4lFsDGDn6cXueN2IZNavk36lZT4S76oo0g-', 'tNzJHRdsrc', NULL, NULL, 1, 1, NULL, '2022-10-29 03:58:51', '2023-05-03 11:44:04', NULL, NULL, NULL),
(116, 'viral kumar', 'viral-kumar', 'viral@mailinator.com', '09574535297', 'provider-1694803185.jpg', '$2y$10$kpRmcPRrRqjYzsX0mTsiK.X/yxrw3n9ITw4aolR8You9bOLHGEp6C', 2, 24, NULL, 'A T-shirt, or tee shirt, is a style of fabric shirt named after the T shape of its body and sleeves. Traditionally, it has short sleeves and a round neckline, known as a crew neck, which lacks a collar. T-shirts are generally made of a stretchy, light, an', 20, '324', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'tNmsu4pdlAJbs53DLjrRGgTHrqcYI4dvWmsm7BuIfgZag6xdeQpgKTk8Hazt', '2023-09-15 13:09:45', '2023-09-15 13:09:45', NULL, NULL, NULL),
(117, 'disma', 'disma', 'disma1@gmail.com', '232233222', 'provider-1694856443.jpg', '$2y$10$ijuSiEJW0HI67E2YFu1SjexAQCB8Z9WHYmTllnFCf9xfzf.P6FgZa', 2, 24, NULL, '2312', 9, '23123', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2023-09-16 03:57:23', '2023-09-16 03:57:23', '9433497.343729232', '8140237.167093847', NULL),
(118, 'disma', 'disma', 'disma1@gmail.com', '232233222', 'provider-1694856443.jpg', '$2y$10$MwbQWBalbMa7spBkDv3BDuVgcs0C2WzBtGAVmhsiv8/k7DbN.Ec8i', 2, 24, NULL, '2312', 9, '23123', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2023-09-16 03:57:23', '2023-09-16 03:57:23', '9433497.343729232', '8140237.167093847', NULL),
(119, 'pankaj', 'pankaj', 'pan@gmail.com', '19047754480', 'provider-1694857020.jpg', '$2y$10$QMCXTd5cIE3ZbjtPdZN9g.4hKpGHY.JOO.ykl21izgeSJHVI.g6Xy', 2, 24, NULL, '1210 Lobdell St', 16, 'about', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2023-09-16 04:07:01', '2023-09-16 04:07:01', '8117223.500646103', '2616536.704011486', NULL),
(120, 'sagar', 'sagar', 'sagar@gmail.com', '9574535297', 'provider-1694867029.jpg', '$2y$10$DqR8uGQOp3lrARaJno7DsOwzQ8poxwNFRSfnNLfb6U1uovif4AwHS', 2, 24, NULL, 'location', 22, 'address', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2023-09-16 06:53:49', '2023-09-16 07:03:29', '22.998707987784254', '72.62919843749998', 'Ahmedabad,Gujarat,India,IN'),
(121, 'mumbai', 'mumbai', 'mumbai@gmail.com', '2323232323', 'provider-1694877994.jpg', '$2y$10$SWS9hBa/OLmaR8H7TqLFhuYgKlPm6HD79X.EN7gMUvm1vQdoRvMW2', 2, 21, NULL, '3213', 11, '213', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2023-09-16 09:56:34', '2023-09-16 09:56:34', '19.93189464437949', '73.55204999999998', 'Trimbak,Maharashtra,India,IN'),
(122, 'rajkot', 'rajkot', 'rajkot@gmail.com', '5454545445', 'provider-1694878072.jpg', '$2y$10$smp..Rksn4at8dj/.ZQfM.3mvmc7NPuFYl29sD6iSanTE0eaSMjgO', 2, 21, NULL, 'rajkot', 22, 'address', 'email', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'R6I5zwwCg93znUfgd6olycOiaB0oiKwn2L8HqueL8UZZTRV5HeeerOKzoS5m', '2023-09-16 09:57:52', '2023-09-16 09:57:52', '22.28641067993005', '70.83018720703123', 'Rajkot,Gujarat,India,IN'),
(123, 'city user', 'city-user', 'city@mailinator.com', '0000000000', 'default.png', '$2y$10$IadLE7pJMs10cGz.XtkpIut6OsqGOyLseEqkeMX2jfryKxcisO2bS', 4, NULL, NULL, '343 rtgvf', NULL, NULL, 'email', NULL, NULL, NULL, '4zU85HcSQh', '500', NULL, 1, 1, NULL, '2023-09-16 12:14:02', '2023-09-16 12:16:09', NULL, NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
