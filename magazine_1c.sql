-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 26, 2024 at 05:16 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `magazine_1c`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`) VALUES
(1, '1С:Предприятие', 'Основные конфигурации 1С:Предприятие', '2024-11-25 19:17:15'),
(2, 'Отраслевые решения', 'Специализированные решения для различных отраслей', '2024-11-25 19:17:15'),
(3, 'Курсы и обучение', 'Обучающие материалы и курсы по 1С', '2024-11-25 19:17:15'),
(4, 'Сопровождение', 'Услуги поддержки и сопровождения', '2024-11-25 19:17:15'),
(5, 'Дополнительные лицензии', 'Клиентские лицензии и расширения', '2024-11-25 19:17:15'),
(6, 'CMS', 'CMS (Content Management System) — это программное обеспечение для создания, управления и публикации контента на веб-сайтах без необходимости написания кода. CMS позволяет пользователям добавлять тексты, изображения, видео и другие материалы, управлять страницами и структурой сайта через удобный интерфейс.', '2024-11-26 15:12:19');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `product_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `email`, `product_id`) VALUES
(3, 'razemsb', 'maxim1xxx363@gmail.com', 4),
(4, 'razemsb', 'maxim1xxx363@gmail.com', 2),
(5, 'razemsb', 'maxim1xxx363@gmail.com', 1),
(6, 'razemsb', 'maxim1xxx363@gmail.com', 10),
(7, 'razemsb', 'maxim1xxx363@gmail.com', 1),
(8, 'razemsb', 'maxim1xxx363@gmail.com', 7),
(9, 'razemsb', 'maxim1xxx363@gmail.com', 11);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `category` varchar(100) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `license_type` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `price`, `image_path`, `category`, `version`, `license_type`, `created_at`) VALUES
(1, '1С:Бухгалтерия 8 ПРОФ', 'Профессиональная версия для ведения бухгалтерского и налогового учета', '13000.00', 'icons/1c_buh.png', '1С:Предприятие', '3.0.121', 'ПРОФ', '2024-11-25 19:17:15'),
(2, '1С:Зарплата и управление персоналом 8', 'Комплексное решение для расчета зарплаты и кадрового учета', '22600.00', 'icons/1c_zp.jpg', '1С:Предприятие', '3.1.20', 'ПРОФ', '2024-11-25 19:17:15'),
(3, '1С:Управление торговлей', 'Система автоматизации торговых операций', '22600.00', 'icons/1c_ypr.jpg', '1С:Предприятие', '11.4.10', 'ПРОФ', '2024-11-25 19:17:15'),
(4, '1С:Розница 8', 'Решение для автоматизации розничных магазинов', '13000.00', 'icons/1c_roz.jpg', 'Отраслевые решения', '2.3.12', 'ПРОФ', '2024-11-25 19:17:15'),
(5, '1С:Общепит', 'Решение для автоматизации ресторанов и кафе', '15000.00', 'icons/1c_ob.jpg', 'Отраслевые решения', '3.0.121', 'ПРОФ', '2024-11-25 19:17:15'),
(6, 'Курс 1С:Бухгалтерия с нуля', 'Базовый курс для начинающих бухгалтеров', '8000.00', 'icons/1c_buh.png', 'Курсы и обучение', '2023', 'Одиночная лицензия', '2024-11-25 19:17:15'),
(7, 'Сопровождение 1С:ИТС ПРОФ', 'Информационно-технологическое сопровождение', '3000.00', 'icons/1c_its.png', 'Сопровождение', '2023', 'Месячная подписка', '2024-11-25 19:17:15'),
(8, 'Клиентская лицензия на 5 рабочих мест', 'Дополнительные лицензии для пользователей', '21600.00', 'icons/1c_lic.jpg', 'Дополнительные лицензии', '8.3', 'Многопользовательская', '2024-11-25 19:17:15'),
(9, '1С:Документооборот', 'Система электронного документооборота', '36000.00', 'icons/1c_dok.png', 'Отраслевые решения', '2.1.25', 'КОРП', '2024-11-25 19:17:15'),
(10, '1С:Комплексная автоматизация', 'Комплексное решение для автоматизации предприятия', '61700.00', 'icons/1c_auto.jpg', '1С:Предприятие', '2.4.13', 'ПРОФ', '2024-11-25 19:17:15'),
(11, '1С Битрикс', '1С-Битрикс: Управление сайтом — это система управления контентом (CMS) для создания сайтов, интернет-магазинов и корпоративных порталов. Она разработана совместно компаниями «1С» и «Битрикс» и впервые представлена в 2001 году. Платформа предназначена для бизнес-проектов различного масштаба, обеспечивая широкие возможности для управления контентом, безопасностью и производительностью сайтов', '35000.00', 'icons/1c_bitrix.jpg', 'CMS', '3.3.3', 'Стандарт', '2024-11-26 15:02:36'),
(12, '1С для гостиничного бизнеса', '1С:Гостиница — специализированное программное решение для автоматизации управления гостиничными предприятиями. Оно подходит как для небольших отелей и хостелов, так и для крупных гостиничных комплексов.', '65000.00', 'icons/1c_hotel.png', '1С:Предприятие', '3.3.6', 'ПРОФ', '2024-11-26 17:03:29'),
(13, '1С:Бухгалтерия государственного учреждения', '1С:Бухгалтерия государственного учреждения 8 — это специализированная программа для бухгалтерского учета в государственных учреждениях. Она предназначена для автоматизации бухгалтерского учета, а также для ведения отчетности и выполнения различных обязательств по налогообложению и госфинансированию.', '19400.00', 'icons/1c_buhgos.png', '1С:Предприятие', '1.3.5', 'ПРОФ', '2024-11-26 17:06:08'),
(14, '1С:Склад', '1С:Склад — специализированное решение для автоматизации складского учета и логистики, предназначенное для оптимизации процессов управления товарными запасами. Это программное обеспечение помогает предприятиям вести точный учет движения товаров и контролировать складские операции на всех уровнях.', '6000.00', 'icons/1c_sklad.jpeg', 'Курсы и обучение', '9.9.0', 'ПРОФ', '2024-11-26 17:11:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `Login` varchar(20) NOT NULL,
  `Password` varchar(70) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `is_admin` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `Login`, `Password`, `Email`, `is_admin`) VALUES
(1, 'razemsb', '$2y$10$3ifsrdiGL3RnbvH/KzpOPOQkeB6JEBhw7Q4RUzkw/JRvRjfXyC/X6', 'maxim1xxx363@gmail.com', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;